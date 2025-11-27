Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0760EC8F4A9
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 16:33:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174059.1499035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOdzb-0000XM-At; Thu, 27 Nov 2025 15:33:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174059.1499035; Thu, 27 Nov 2025 15:33:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOdzb-0000Uz-7U; Thu, 27 Nov 2025 15:33:11 +0000
Received: by outflank-mailman (input) for mailman id 1174059;
 Thu, 27 Nov 2025 15:33:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=orZJ=6D=bounce.vates.tech=bounce-md_30504962.69286f2d.v1-7f97706ba28149e7bfcb852ef04831b8@srs-se1.protection.inumbo.net>)
 id 1vOdzZ-0000Us-Sb
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 15:33:09 +0000
Received: from mail132-20.atl131.mandrillapp.com
 (mail132-20.atl131.mandrillapp.com [198.2.132.20])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ce253c7-cba6-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 16:33:04 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-20.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4dHL6P74ldzFCWk93
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 15:33:01 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 7f97706ba28149e7bfcb852ef04831b8; Thu, 27 Nov 2025 15:33:01 +0000
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
X-Inumbo-ID: 5ce253c7-cba6-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1764257582; x=1764527582;
	bh=ln8WgTG9hxzuxdRJGfD2pyt+riyB+a6ndCIwsDgUQco=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=WBMXhtPOcBdpXhNlSL2fSdFo93HIhAEmE0uIPWMsCm4jaHqj5o2+XWH85qhjc5aG5
	 q+TlltOa51MzMGerQ9JQqkl8c+1U+HICF9I+o+g7YR1jwCfSutrDC1+w73jjIbRD01
	 nXyh1Imly/VZ6dozm0oRPjXJa2xhcthNqT+P+9Q//AGI7F2H9L/55w6EBeLGSlqvaT
	 yEP25QO6+igDUQdWyjdy7tlJuz0yy05WpxXB3yo8Apwz7PMpmw8zioZRg3S04968/u
	 qNxbCOe/yFj9aFxPzFZ7ez2GYYGdPnmQ/mgvG8/r91NqQMXSLMp7M3UFqxkGeFSUIy
	 1Xzyp5BAJA3TQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1764257582; x=1764518082; i=teddy.astie@vates.tech;
	bh=ln8WgTG9hxzuxdRJGfD2pyt+riyB+a6ndCIwsDgUQco=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Q2FA0U+Uq/nOY+pBvbup+TX0AmlAQ+TXZ2Y9h8RFCJXvb2K5zapQv8Iq2kWug9As/
	 C2bKwX99GZxik19zdw0QE3XfmNkTelIL/lS8UwcynBZDKJZY5vBpzXG/lRJ3eeNZRP
	 rpLmjHG3z7mk5hTy4rUKp3zXiQrbCVcLJ458AKs37qhycJarCNLrJ2xvfzfNJ8aXix
	 7wl1htQ5wNZbXc8OLlks2emSaSQdskRNlV/SCPbWa29I8VwM4g5mwKb/X/3S5Tie3g
	 9J/buMkW84yraNAKktvu/nmPYcQ6ggCX8HRgc6PM/sXQgaUdTfiaYIqg+Uwc5KZ8ee
	 jnMoehS9q3V3g==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20x86/efi:=20Remove=20NX=20check=20from=20efi-boot.h?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1764257580679
Message-Id: <c0a9a466-e78c-4022-a631-4840e085ae77@vates.tech>
To: "Julian Vetter" <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
References: <20251127143136.1598354-1-julian.vetter@vates.tech>
In-Reply-To: <20251127143136.1598354-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.7f97706ba28149e7bfcb852ef04831b8?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251127:md
Date: Thu, 27 Nov 2025 15:33:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 27/11/2025 =C3=A0 15:33, Julian Vetter a =C3=A9crit=C2=A0:
> Currently Intel CPUs in EFI mode with the "Execute Disable Bit" disabled
> and the 'CONFIG_REQUIRE_NX=3Dy' fail to boot, because this check is
> performed before trampoline_setup is called, which determines if NX is
> supported or if it's hidden by 'MSR_IA32_MISC_ENABLE[34] =3D 1' (if so,
> re-enables NX).
> 
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> ---
>   xen/arch/x86/efi/efi-boot.h | 12 ------------
>   1 file changed, 12 deletions(-)
> 
> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> index 0194720003..8dfd549f12 100644
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -748,18 +748,6 @@ static void __init efi_arch_cpu(void)
>       if ( (eax >> 16) =3D=3D 0x8000 && eax > 0x80000000U )
>       {
>           caps[FEATURESET_e1d] =3D cpuid_edx(0x80000001U);
> -
> -        /*
> -         * This check purposefully doesn't use cpu_has_nx because
> -         * cpu_has_nx bypasses the boot_cpu_data read if Xen was compile=
d
> -         * with CONFIG_REQUIRE_NX
> -         */
> -        if ( IS_ENABLED(CONFIG_REQUIRE_NX) &&
> -             !boot_cpu_has(X86_FEATURE_NX) )
> -            blexit(L"This build of Xen requires NX support");
> -
> -        if ( cpu_has_nx )
> -            trampoline_efer |=3D EFER_NXE;

I don't think we want to skip setting EFER_NXE. As it would mean not 
using NX at all (unless I missed something).

If cpu_policy doesn't have nx, it is likely going to cause issues e.g in 
VMs which will not see NX and potentially refuse to boot. I don't really 
know in which order things are initialized, but it probably wants to be 
considered.

Perhaps, we want to do something like detecting the 
MSR_IA32_MISC_ENABLE[34] then adjusting the cpu_policy appropriately 
after patching it ?

>       }
>   }
>   



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



