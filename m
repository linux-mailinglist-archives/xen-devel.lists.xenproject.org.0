Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B318C6F86
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 02:32:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722708.1126935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7P2E-00046m-E4; Thu, 16 May 2024 00:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722708.1126935; Thu, 16 May 2024 00:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7P2E-00044o-BG; Thu, 16 May 2024 00:31:50 +0000
Received: by outflank-mailman (input) for mailman id 722708;
 Thu, 16 May 2024 00:31:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcFO=MT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7P2D-0003iX-2P
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 00:31:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adc7ac1d-131b-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 02:31:48 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7449261636;
 Thu, 16 May 2024 00:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF92FC116B1;
 Thu, 16 May 2024 00:31:44 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: adc7ac1d-131b-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715819506;
	bh=3Mx+mu9GUIW6ZMQAR9lVY3xbYV4lhP/F+VSt9iwW/oI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RPSZWTFkoisj584mOG8Nb5kcZCKd26mJ8IN93FeFRSCwu8FcCKLU4QQIIgzNdjSH5
	 up/3eNJDpo2fcsHOvlJAfn7KhDsMVaOsCLAlr3BVwhVPApgYFrvzk7UpYH8SD0WdGG
	 dBkgIiHAiZ9rmzNsAZlYgWYIzleVw3ndM6mEY1TKlO79JZ6FnHWyRmiLRiqANn0mLH
	 bldLzARtLb+4cFYrQv0DeG53jkXBJSCjmT7VSXHgIm/10criumbv/H1wTekJBAEJLF
	 ZBK4qessnSZi/p8zR8uiYeWzFVBs0cF0xksvAwlfCo1xEcGKL2Pp4jUVlSH1BD8Im+
	 de90rNzp1YbgA==
Date: Wed, 15 May 2024 17:31:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [XEN PATCH v2 03/15] x86/p2m: guard altp2m routines
In-Reply-To: <d4c537b1bcac4b301b16336ea3407834fc3076b1.1715761386.git.Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2405151731190.2544314@ubuntu-linux-20-04-desktop>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com> <d4c537b1bcac4b301b16336ea3407834fc3076b1.1715761386.git.Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 May 2024, Sergiy Kibrik wrote:
> Initialize and bring down altp2m only when it is supported by the platform,
> e.g. VMX. Also guard p2m_altp2m_propagate_change().
> The puspose of that is the possiblity to disable altp2m support and exclude its
> code from the build completely, when it's not supported by the target platform.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: Tamas K Lengyel <tamas@tklengyel.com>
> ---
>  xen/arch/x86/mm/p2m-basic.c | 19 +++++++++++--------
>  xen/arch/x86/mm/p2m-ept.c   |  2 +-
>  2 files changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/x86/mm/p2m-basic.c b/xen/arch/x86/mm/p2m-basic.c
> index 8599bd15c6..90106997d7 100644
> --- a/xen/arch/x86/mm/p2m-basic.c
> +++ b/xen/arch/x86/mm/p2m-basic.c
> @@ -126,13 +126,15 @@ int p2m_init(struct domain *d)
>          return rc;
>      }
>  
> -    rc = p2m_init_altp2m(d);
> -    if ( rc )
> +    if ( hvm_altp2m_supported() )
>      {
> -        p2m_teardown_hostp2m(d);
> -        p2m_teardown_nestedp2m(d);
> +        rc = p2m_init_altp2m(d);
> +        if ( rc )
> +        {
> +            p2m_teardown_hostp2m(d);
> +            p2m_teardown_nestedp2m(d);
> +        }
>      }
> -
>      return rc;
>  }
>  
> @@ -195,11 +197,12 @@ void p2m_final_teardown(struct domain *d)
>  {
>      if ( is_hvm_domain(d) )
>      {
> +        if ( hvm_altp2m_supported() )
> +            p2m_teardown_altp2m(d);
>          /*
> -         * We must tear down both of them unconditionally because
> -         * we initialise them unconditionally.
> +         * We must tear down nestedp2m unconditionally because
> +         * we initialise it unconditionally.
>           */
> -        p2m_teardown_altp2m(d);
>          p2m_teardown_nestedp2m(d);
>      }
>  
> diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
> index f83610cb8c..d264df5b14 100644
> --- a/xen/arch/x86/mm/p2m-ept.c
> +++ b/xen/arch/x86/mm/p2m-ept.c
> @@ -986,7 +986,7 @@ out:
>      if ( is_epte_present(&old_entry) )
>          ept_free_entry(p2m, &old_entry, target);
>  
> -    if ( entry_written && p2m_is_hostp2m(p2m) )
> +    if ( entry_written && p2m_is_hostp2m(p2m) && hvm_altp2m_supported())
>      {
>          ret = p2m_altp2m_propagate_change(d, _gfn(gfn), mfn, order, p2mt, p2ma);
>          if ( !rc )

This is a matter of taste but I would put hvm_altp2m_supported() first.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

