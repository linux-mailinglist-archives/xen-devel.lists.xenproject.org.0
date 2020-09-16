Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C93526BE74
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 09:46:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIS8d-00045o-IQ; Wed, 16 Sep 2020 07:45:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9sPA=CZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kIS8c-00045j-5f
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 07:45:58 +0000
X-Inumbo-ID: af7a5de6-936e-4b0f-a2c2-0514355e3c04
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af7a5de6-936e-4b0f-a2c2-0514355e3c04;
 Wed, 16 Sep 2020 07:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600242355;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FGd41tedmz6bIXZWa7IZrHKursLyzDsGm8JNTgBE5ws=;
 b=F4XBtoMrZnZhjPwpmFfMXeAQgKfvUYeOYFXydLxw8/BlxlbaCoEiH8lw
 /W+H+TvMz8lFaCxgFXtJ3N7h2guZdpvYcysFLiar8kWWy5gAmrZwVZyGs
 IL4xUYSGVy8kjIxdRixBCm8TIEH4Y4w+0+xlnHB5haWMF+BJOKfr2RfrV Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: o6g63Ro/FGl7e2cOryKhsRZBC8wsURA2lsFoHttam4pywsEZtZtwSCmM7rK7UXZHbOQqLpQXzb
 Sr3WsbM1zRPgu8PA+AMdOz99aw4+6nAaHV2s29zpArORkmPPeI9glj1+zBVJE9OwEBx6VvahWd
 MkAzLek7/7MChZ1YSN2Ktt13dAtGyNvSzs4bVGxEmPXlAOaPQzu6+fEDNnXaziThh7IEDQhwE6
 CeN/njfsfv0EwfU4HzQapMhN5x8IJ8AN7rx7frc1MF8ZQJ3H53elntRIsxeG4o+QGaswJVoyBL
 3Fo=
X-SBRS: 2.7
X-MesageID: 27782711
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,432,1592884800"; d="scan'208";a="27782711"
Date: Wed, 16 Sep 2020 09:45:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Trammell Hudson <hudson@trmm.net>
CC: <xen-devel@lists.xenproject.org>, <jbeulich@suse.com>,
 <andrew.cooper3@citrix.com>, <wl@xen.org>
Subject: Re: [PATCH v4 4/4] efi: Do not use command line if secure boot is
 enabled.
Message-ID: <20200916074544.GS753@Air-de-Roger>
References: <20200914115013.814079-1-hudson@trmm.net>
 <20200914115013.814079-5-hudson@trmm.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200914115013.814079-5-hudson@trmm.net>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Sep 14, 2020 at 07:50:13AM -0400, Trammell Hudson wrote:
> If secure boot is enabled, the Xen command line arguments are ignored.
> If a unified Xen image is used, then the bundled configuration, dom0
> kernel, and initrd are prefered over the ones listed in the config file.

I understand that you must ignore the cfg option when using the
bundled image, but is there then an alternative way for passing the
basevideo and mapbs parameters?

Or there's simply no way of doing so when using secure boot with a
bundled image?

> Unlike the shim based verification, the PE signature on a unified image
> covers the all of the Xen+config+kernel+initrd modules linked into the

Extra 'the'.

> unified image. This also ensures that properly configured platforms
> will measure the entire runtime into the TPM for unsealing secrets or
> remote attestation.
> 
> Signed-off-by: Trammell Hudson <hudson@trmm.net>
> ---
>  xen/common/efi/boot.c | 44 ++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 41 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 4b1fbc9643..e65c1f1a09 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -949,6 +949,39 @@ static void __init setup_efi_pci(void)
>      efi_bs->FreePool(handles);
>  }
>  
> +/*
> + * Logic should remain sync'ed with linux/arch/x86/xen/efi.c
> + * Secure Boot is enabled iff 'SecureBoot' is set and the system is
> + * not in Setup Mode.
> + */
> +static bool __init efi_secure_boot(void)
> +{
> +    static const __initconst EFI_GUID global_guid = EFI_GLOBAL_VARIABLE;
> +    uint8_t secboot, setupmode;
> +    UINTN secboot_size = sizeof(secboot);
> +    UINTN setupmode_size = sizeof(setupmode);
> +    EFI_STATUS rc;
> +
> +    rc = efi_rs->GetVariable(L"SecureBoot", (EFI_GUID *)&global_guid,
> +                             NULL, &secboot_size, &secboot);
> +    if ( rc != EFI_SUCCESS )
> +        return false;
> +
> +    rc = efi_rs->GetVariable(L"SetupMode", (EFI_GUID *)&global_guid,
> +                             NULL, &setupmode_size, &setupmode);
> +    if ( rc != EFI_SUCCESS )
> +        return false;
> +
> +    if ( secboot > 1)

Nit: missing space before closing parentheses.

> +    {
> +        PrintStr(L"Invalid SecureBoot variable=0x");
> +        DisplayUint(secboot, 2);

Maybe better to use secboot_size * 2 here since you already have the
size of the variable anyway?

Thanks, Roger.

