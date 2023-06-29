Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5AA742D71
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 21:26:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557037.870033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qExH5-0005J2-Uu; Thu, 29 Jun 2023 19:25:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557037.870033; Thu, 29 Jun 2023 19:25:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qExH5-0005Gl-SB; Thu, 29 Jun 2023 19:25:51 +0000
Received: by outflank-mailman (input) for mailman id 557037;
 Thu, 29 Jun 2023 19:25:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XWGL=CR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qExH3-0005GZ-Pp
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 19:25:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c01754fa-16b2-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 21:25:48 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6DB2F61601;
 Thu, 29 Jun 2023 19:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01442C433C0;
 Thu, 29 Jun 2023 19:25:44 +0000 (UTC)
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
X-Inumbo-ID: c01754fa-16b2-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688066746;
	bh=9JGiD9/p2vLFe1404gJWXFgziUCrHFNM7+tPG4436oA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WJP0dYn/WJPJarU819VpHDAA6bOx9X13+ag+ZrZAURQlaRg8zeY3te8mop2Rdy/Cm
	 M7IoVmjojqoEUtkjoAeFMZXGvqH4qyAIHgn8kNZcGFNH1Mg0poOmdNJwGyn2WRVHBO
	 /BWUA039rL/F18fau7Jsggv1inKuDDwxfEJoRlYW7KIu6PJFUfg93y/MgbCKgnafec
	 oDjTe9ft6IgB76bwuHL50GEUaTFZLDeR/X/DtNWV3/qrjPLFAx1ZIAAjnz10uuhM0c
	 99XJr4+qwpchmOPNnOLT+8Z0J6rQrw54DbZ+CBJTuyPCepy5Lfi+IcAs5YW7fu8bkA
	 AD5BAlYTWjD8g==
Date: Thu, 29 Jun 2023 12:25:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH 2/5] x86: change parameter names of nestedhvm_vcpu_iomap_get()
 definition
In-Reply-To: <7392b1adc50c77855bec846f1a14e30f6a8ae1d6.1688049495.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2306291225000.3936094@ubuntu-linux-20-04-desktop>
References: <cover.1688049494.git.federico.serafini@bugseng.com> <7392b1adc50c77855bec846f1a14e30f6a8ae1d6.1688049495.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 Jun 2023, Federico Serafini wrote:
> Change parameter names of nestedhvm_vcpu_iomap_get() definition to
> those used in the function declaration in order to:
> 1) improve readability;
> 2) fix violations of MISRA C:2012 Rule 8.3.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

The title would be better as:
x86/nestedhvm: change parameter names of nestedhvm_vcpu_iomap_get() definition

could be done on commit


> ---
>  xen/arch/x86/hvm/nestedhvm.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/nestedhvm.c b/xen/arch/x86/hvm/nestedhvm.c
> index ec68551127..64d7eec9a1 100644
> --- a/xen/arch/x86/hvm/nestedhvm.c
> +++ b/xen/arch/x86/hvm/nestedhvm.c
> @@ -155,19 +155,19 @@ static int __init cf_check nestedhvm_setup(void)
>  __initcall(nestedhvm_setup);
>  
>  unsigned long *
> -nestedhvm_vcpu_iomap_get(bool_t port_80, bool_t port_ed)
> +nestedhvm_vcpu_iomap_get(bool_t ioport_80, bool_t ioport_ed)
>  {
>      int i;
>  
>      if (!hvm_port80_allowed)
> -        port_80 = 1;
> +        ioport_80 = 1;
>  
> -    if (port_80 == 0) {
> -        if (port_ed == 0)
> +    if (ioport_80 == 0) {
> +        if (ioport_ed == 0)
>              return hvm_io_bitmap;
>          i = 0;
>      } else {
> -        if (port_ed == 0)
> +        if (ioport_ed == 0)
>              i = 1;
>          else
>              i = 2;
> -- 
> 2.34.1
> 

