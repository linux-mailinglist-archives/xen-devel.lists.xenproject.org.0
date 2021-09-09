Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6203D40603A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 01:48:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183738.332051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOTmZ-0000cy-0w; Thu, 09 Sep 2021 23:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183738.332051; Thu, 09 Sep 2021 23:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOTmY-0000ak-UI; Thu, 09 Sep 2021 23:48:38 +0000
Received: by outflank-mailman (input) for mailman id 183738;
 Thu, 09 Sep 2021 23:48:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ArGz=N7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mOTmX-0000ae-Fj
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 23:48:37 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9fc6ea4d-cb9c-4236-9527-01c4e7821c4d;
 Thu, 09 Sep 2021 23:48:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9ACED610E9;
 Thu,  9 Sep 2021 23:48:35 +0000 (UTC)
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
X-Inumbo-ID: 9fc6ea4d-cb9c-4236-9527-01c4e7821c4d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631231316;
	bh=MjL8P5PlE4SMfGNTO/XyrbFDqheeCO80UsiIherSWho=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Wy5sH2NwjHmMGfDuQkVfv4Lec6vWtLvClUcXIrdgiDTpnFxe5ePS3Yyish+gRyCD1
	 YXbOZuQakwrdYvUacOzl2ycjCirpHhGoj9Ra6cM4Zvv1FHIRLoby99aiaaNsFB/wqS
	 +KSJz/pcNoLyto4KmQeXz0NA1WJqsw2+fm9Z24rXR+Wqs5m7n9xtquc3pcbo0pUC45
	 HVOgCfPxJWDtxtpbiBiH4g1GPiEwn0QSyxjn9mtsMnVhfCMvHuK0WbRUOImyoo7fsF
	 PvtEiCGynRuhT2bC0uI3sSzmz45rOollwOPw5vx08d9M3K0FdK6wfzeQjOxlCl5ztE
	 26apMdpaJLD6w==
Date: Thu, 9 Sep 2021 16:48:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 09/14] xen/arm: Add cmdline boot option "pci=on"
In-Reply-To: <e279636ea47b7d06056c2f70e76900b8d0b30ee9.1629366665.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109091646060.10523@sstabellini-ThinkPad-T480s>
References: <cover.1629366665.git.rahul.singh@arm.com> <e279636ea47b7d06056c2f70e76900b8d0b30ee9.1629366665.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Aug 2021, Rahul Singh wrote:
> Add cmdline boot option "pci=on" to enable/disable the PCI init during
> boot.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>  xen/arch/arm/pci/pci.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
> index d1c9cf997d..dc63bbc2a2 100644
> --- a/xen/arch/arm/pci/pci.c
> +++ b/xen/arch/arm/pci/pci.c
> @@ -62,8 +62,38 @@ static void __init acpi_pci_init(void)
>  static inline void __init acpi_pci_init(void) { }
>  #endif
>  
> +static bool __initdata param_pci_enable;
> +
> +static int __init parse_pci_param(const char *arg)
> +{
> +    if ( !arg )
> +    {
> +        param_pci_enable = false;
> +        return 0;
> +    }
> +
> +    switch ( parse_bool(arg, NULL) )
> +    {
> +    case 0:
> +        param_pci_enable = false;
> +        return 0;
> +    case 1:
> +        param_pci_enable = true;
> +        return 0;
> +    }
> +
> +    return -EINVAL;
> +}
> +custom_param("pci", parse_pci_param);

Consider using boolean_param instead. It supports "on".


>  static int __init pci_init(void)
>  {
> +    /*
> +     * Enable PCI when has been enabled explicitly (pci=on)
> +     */
> +    if ( !param_pci_enable)
> +        return 0;
> +
>      if ( acpi_disabled )
>          dt_pci_init();
>      else
> -- 
> 2.17.1
> 

