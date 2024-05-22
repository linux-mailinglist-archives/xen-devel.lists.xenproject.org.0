Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 837A78CC914
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 00:31:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727896.1132583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9uTc-0004V1-9C; Wed, 22 May 2024 22:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727896.1132583; Wed, 22 May 2024 22:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9uTc-0004TU-5b; Wed, 22 May 2024 22:30:28 +0000
Received: by outflank-mailman (input) for mailman id 727896;
 Wed, 22 May 2024 22:30:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ujjH=MZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s9uTb-0004TN-CK
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 22:30:27 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0dea8a1-188a-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 00:30:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 13991CE1318;
 Wed, 22 May 2024 22:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 689BEC2BBFC;
 Wed, 22 May 2024 22:30:18 +0000 (UTC)
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
X-Inumbo-ID: e0dea8a1-188a-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716417019;
	bh=6AmxGm/usXVZKBFgyu9AglYwlVCoutuuiYzVJmO1rWI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rdf3Yl4q0T69wr97dTFxwdnwqUe+ogXPP4SP/M1Zm+SFBuzjcTfGByD7wdEY4Mn5I
	 wZOrriCcKC8eirE/4Ezmu3sS5aPsqzQ0HwehVSi2rjBK+mQtJ6NNm38mRVwarqSCTT
	 /EHn4oVbCxuXBs/ej+4LER6SO31LfHAMZk7anW5K1axFjc1qvHc2HG9mY+J1V0y9g9
	 SmQq7FVbt986VgM3+BTW6djml+RVkR+t0Rd1jB1g2mfJNkK8A1hIipLTW/jQqGq27m
	 WGcDkLIQjpxLr5pPKDY8hmjEXq/ZBCsp1UqQpnivB1bZTBqKbT/WCSYAj7UyLJL2VG
	 B5TghjTxiH9fA==
Date: Wed, 22 May 2024 15:30:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v4 2/3] x86/MCE: add default switch case in
 init_nonfatal_mce_checker()
In-Reply-To: <9ec888c37a261c86a52f360146cbbb3ad437ad30.1716366581.git.Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2405221529390.1052252@ubuntu-linux-20-04-desktop>
References: <cover.1716366581.git.Sergiy_Kibrik@epam.com> <9ec888c37a261c86a52f360146cbbb3ad437ad30.1716366581.git.Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 May 2024, Sergiy Kibrik wrote:
> The default switch case block is wanted here, to handle situation
> e.g. of unexpected c->x86_vendor value -- then no mcheck init is done, but
> misleading message still gets logged anyway.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> changes in v4:
>  - return 0 instead of -ENODEV and put a comment
>  - update description a bit
> ---
>  xen/arch/x86/cpu/mcheck/non-fatal.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/xen/arch/x86/cpu/mcheck/non-fatal.c b/xen/arch/x86/cpu/mcheck/non-fatal.c
> index 33cacd15c2..5a53bcd0b7 100644
> --- a/xen/arch/x86/cpu/mcheck/non-fatal.c
> +++ b/xen/arch/x86/cpu/mcheck/non-fatal.c
> @@ -29,9 +29,14 @@ static int __init cf_check init_nonfatal_mce_checker(void)
>  		/* Assume we are on K8 or newer AMD or Hygon CPU here */
>  		amd_nonfatal_mcheck_init(c);
>  		break;
> +
>  	case X86_VENDOR_INTEL:
>  		intel_nonfatal_mcheck_init(c);
>  		break;
> +
> +	default:
> +		/* unhandled vendor isn't really an error */
> +		return 0;
>  	}
>  	printk(KERN_INFO "mcheck_poll: Machine check polling timer started.\n");
>  	return 0;
> -- 
> 2.25.1
> 

