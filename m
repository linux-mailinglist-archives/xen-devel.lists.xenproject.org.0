Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC7D26DC0F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 14:52:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kItOI-0003zG-AI; Thu, 17 Sep 2020 12:51:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w9D7=C2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kItOG-0003zB-Nv
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 12:51:56 +0000
X-Inumbo-ID: ca305591-391d-41d0-8523-ab6e240ab3d6
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca305591-391d-41d0-8523-ab6e240ab3d6;
 Thu, 17 Sep 2020 12:51:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=cantorsusede; t=1600347114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/l+qPJvue9sq5qsEUG8iz4ifdDWwgcMwq+H3LRca6nQ=;
 b=NtmCZphvxGB8DsLqVk7figEsM0VAaCBIQzCx5RLvQkJNLs2yq9IYiwoLtSTHBWIF6JXwJv
 TDtLSTmv2Vp9FfDePoeP3veOsS9f2uK63NikUKMSIwVoqCvJenFdtSf9Kp4ncbHkYKi1X9
 f5rsuz6lVYTjjlTMugQ4GxZqHGK1SOgBa2cv7WU2xMKpxc4ZMHZxUZMVL/1PQqs/ZYqqOQ
 vsElOiW8ixnY9yYcuyR6zt/UqWbR+cDm90jIwZs1NIhjBCdzjI1aREbi3Yj2JJJWoUOGbl
 8TSZw8Qyh2tXLJx/Nx5UP3XMMAP5NhAUwq6b29I1/TFtoINiu6WhBIAPQUcHxQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4B0CAACC2;
 Thu, 17 Sep 2020 12:52:28 +0000 (UTC)
Subject: Re: [PATCH v4 4/4] efi: Do not use command line if secure boot is
 enabled.
To: Trammell Hudson <hudson@trmm.net>
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, wl@xen.org
References: <20200914115013.814079-1-hudson@trmm.net>
 <20200914115013.814079-5-hudson@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3def666c-c5f1-a520-18dc-6c1c61026b57@suse.com>
Date: Thu, 17 Sep 2020 14:51:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200914115013.814079-5-hudson@trmm.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 14.09.2020 13:50, Trammell Hudson wrote:
> If secure boot is enabled, the Xen command line arguments are ignored.
> If a unified Xen image is used, then the bundled configuration, dom0
> kernel, and initrd are prefered over the ones listed in the config file.
> 
> Unlike the shim based verification, the PE signature on a unified image
> covers the all of the Xen+config+kernel+initrd modules linked into the
> unified image. This also ensures that properly configured platforms
> will measure the entire runtime into the TPM for unsealing secrets or
> remote attestation.

The command line may also include a part handed on to the Dom0 kernel.
If the Dom0 kernel image comes from disk, I don't see why that part of
the command line shouldn't be honored. Similarly, if the config file
doesn't come from the unified image, I think Xen's command line options
should also be honored.

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

As you need the casts here just to get rid of the const again,
please don't make the variable const in the first place.

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
> +    {
> +        PrintStr(L"Invalid SecureBoot variable=0x");
> +        DisplayUint(secboot, 2);
> +        PrintStr(newline);
> +    }
> +
> +    return secboot == 1 && setupmode == 0;

Like for SecureBoot, values other than 0 and 1 also are reserved for
SetupMode and hence would better be logged in the same way. I'm still
unconvinced though that logging is enough.

> @@ -1134,6 +1167,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>      bool base_video = false;
>      char *option_str;
>      bool use_cfg_file;
> +    bool secure = false;

I don't think the initializer is needed here?

> @@ -1152,8 +1186,10 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>          PrintErrMesg(L"No Loaded Image Protocol", status);
>  
>      efi_arch_load_addr_check(loaded_image);
> +    secure = efi_secure_boot();
>  
> -    if ( use_cfg_file )
> +    /* If UEFI Secure Boot is enabled, do not parse the command line */
> +    if ( use_cfg_file && !secure )
>      {

If it is intentional to also change this for the shim case, then
please justify the change in behavior in the description. As per
the comments further up I think the ignoring of the various parts
wants making depend on more than just secure boot mode anyway.

Jan

