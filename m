Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E4C26893B
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 12:25:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHlfb-0005wy-Ue; Mon, 14 Sep 2020 10:25:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=odsp=CX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kHlfa-0005wt-PH
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 10:25:10 +0000
X-Inumbo-ID: b57a8c68-18de-4b15-b7d6-8775c24691a3
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b57a8c68-18de-4b15-b7d6-8775c24691a3;
 Mon, 14 Sep 2020 10:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600079098;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hmhvmhWH7d3k712lcbE9lD8sdoxPXnesqTIvu4Uqy4Y=;
 b=P136ObgpO28I2Zg2Ac52JksXs2YaFnS27XiMoRiZAz02gmeKTx5eCSJf
 XaGnQ6MyQgdplJ9thgZJlAVTpX2qJhgusqhU1zpOb9I9c6Ig9VI+ji2wH
 n4dcVnAifjNkNMlccTghl0vkfrDEtqFdRJPLnzyWC4HdsibD5QwW+AeCX s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: GMHjmmO+flavaoOY6M7Gb9D5OYLK357cBxlPhTfnSFJJnue/EElTU0LKigMZLm0vHXeZvpTMb3
 8HoCGUEPuCCkAuCH8i4WPRpCb9odQURTiPX3nXbJAQqQDkxKO4EE5WB1G9rxWVQMIJ84aaNdiv
 5MdK/dxS8mVPBRacM9FN/fNhhFinDo+3qjJze3/30tgEo3/pk2FUaujo4k8sxHNnqv+9vlrwcO
 9fffVtU3ZCmuOT8z1b8AeYDmdSoBh7CoNzV2hWHfug20X841UH0/DgBkZDQMPVvslkAhpHqN4Q
 OLU=
X-SBRS: 2.7
X-MesageID: 26618756
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,425,1592884800"; d="scan'208";a="26618756"
Date: Mon, 14 Sep 2020 12:24:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Trammell Hudson <hudson@trmm.net>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 4/4] efi: Do not use command line if secure boot is
 enabled.
Message-ID: <20200914102450.GD753@Air-de-Roger>
References: <20200907190027.669086-1-hudson@trmm.net>
 <20200907190027.669086-5-hudson@trmm.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200907190027.669086-5-hudson@trmm.net>
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

On Mon, Sep 07, 2020 at 03:00:27PM -0400, Trammell Hudson wrote:
> From: Trammell hudson <hudson@trmm.net>
> 
> If secure boot is enabled, the Xen command line arguments are ignored.
> If a unified Xen image is used, then the bundled configuration, dom0
> kernel, and initrd are prefered over the ones listed in the config file.
> 
> Unlike the shim based verification, the PE signature on a unified image
> covers the all of the Xen+config+kernel+initrd modules linked into the
> unified image. This also ensures that properly configured platforms
> will measure the entire runtime into the TPM for unsealing secrets or
> remote attestation.
> 
> Signed-off-by: Trammell Hudson <hudson@trmm.net>
> ---
>  xen/common/efi/boot.c | 31 ++++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 452b5f4362..5aaebd5f20 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -947,6 +947,26 @@ static void __init setup_efi_pci(void)
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
> +
> +    if ( efi_rs->GetVariable(L"SecureBoot", (EFI_GUID *)&global_guid, NULL, &secboot_size, &secboot) != EFI_SUCCESS )

I'm slightly worried about the dropping of the const here, and the
fact that the variable is placed in initconst section. Isn't it
dangerous that the EFI services will try to write to it?

Line length also.

> +        return false;
> +    if ( efi_rs->GetVariable(L"SetupMode", (EFI_GUID *)&global_guid, NULL, &setupmode_size, &setupmode) != EFI_SUCCESS )
> +        return false;
> +
> +    return secboot == 1 && setupmode == 0;

I would print a message if secboot is > 1, since those should be
reserved.

Roger.

