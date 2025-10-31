Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CB9C24380
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 10:41:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154129.1484235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEldI-0005Y2-G7; Fri, 31 Oct 2025 09:41:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154129.1484235; Fri, 31 Oct 2025 09:41:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEldI-0005Vi-DR; Fri, 31 Oct 2025 09:41:20 +0000
Received: by outflank-mailman (input) for mailman id 1154129;
 Fri, 31 Oct 2025 09:41:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vfSZ=5I=bounce.vates.tech=bounce-md_30504962.6904843a.v1-790b99b232d84c62ae4f98864ee920af@srs-se1.protection.inumbo.net>)
 id 1vEldG-0005Vc-9u
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 09:41:18 +0000
Received: from mail180-3.suw31.mandrillapp.com
 (mail180-3.suw31.mandrillapp.com [198.2.180.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be825f79-b63d-11f0-9d16-b5c5bf9af7f9;
 Fri, 31 Oct 2025 10:41:16 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-3.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4cybZy4V24zDRJ5sQ
 for <xen-devel@lists.xenproject.org>; Fri, 31 Oct 2025 09:41:14 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 790b99b232d84c62ae4f98864ee920af; Fri, 31 Oct 2025 09:41:14 +0000
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
X-Inumbo-ID: be825f79-b63d-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761903674; x=1762173674;
	bh=HWiwJchHeHgniRnJIWyzbqfXdAvW0OcU82Dd5wNTr/4=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=h9wggbQHjCGO6fS46t0YuoGYmlSZSrjIhn62R7/IcML6gPtsHVmPE+kHQeJSaGl7o
	 +ySMspZkszCrrQLCWFNGr+mkPK141md1J3lfuCekcCLMlVENCK03Zfzsx/uk95avaf
	 l5eflmiiB1LTm+tZ+rb5K3zAVhtGHucBPLI2jwinCcbtblpeOSzfWWpi1LuQkYlEl1
	 fBbB/n9soIgnHs/K9OcuH1UaXzUmhFhFlwsKtVerYuR9dC5VWldoucMxzo5VR8lH9D
	 e4o0S3J3V9vkDgwosQz/sNBLR4bqlcDak3r7qVpWW6PwTSZG3r/etqkHOnsBn5Ly2P
	 42+4hNFyvImmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761903674; x=1762164174; i=teddy.astie@vates.tech;
	bh=HWiwJchHeHgniRnJIWyzbqfXdAvW0OcU82Dd5wNTr/4=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=NxeRugzUZoWLN8iZiQRiEbkncHjvmG240+oz+uoeIqCqXhFOEfaO2HPDvnalXHQDG
	 iWsl19UvqbCekAucFSrGCB73wyzGste3qriVaERLAxiH8bqBMYyHQQ5E25odG+3LAR
	 kHMJbK289iw5esfA+/CJDjva5MI6Frap9XI2PvFM/ZiEHKNBfEWjqLgwbng2l8o2Ds
	 6njnMBMagUZWKHYc/ShXXxAKvaqG3qbMQeLFD8k6PdaQPM4T1skITOmjkvuAqeorxp
	 aRNNkOTwotS5E91AGiBf0PTWaKYLgn3uM8Wnv2m/9YN+1xihoDWlG+ZyFpZyjreqDN
	 qQpDSBTA3MS5w==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=20for-4.21=201/2]=20x86/AMD:=20disable=20RDSEED=20on=20Fam17=20model=2047=20stepping=200?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761903673465
Message-Id: <07b8628d-b57e-439c-811e-2474d2475b47@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>
References: <272093dc-c97c-434a-9977-ad1c26e7e229@suse.com> <b18027a5-d277-4274-b762-dd63e96b6d6c@suse.com>
In-Reply-To: <b18027a5-d277-4274-b762-dd63e96b6d6c@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.790b99b232d84c62ae4f98864ee920af?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251031:md
Date: Fri, 31 Oct 2025 09:41:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 28/10/2025 =C3=A0 16:35, Jan Beulich a =C3=A9crit=C2=A0:
> This particular variant has an error that causes RDSEED to always return
> 0xffffffff, while RDRAND works correctly.
> 
> Inspired by Linux commit 5b937a1ed64ebeba8876e398110a5790ad77407c
> ("x86/rdrand: Disable RDSEED on AMD Cyan Skillfish").
> 
> Like for RDRAND, permit a command line override to be used to keep
> RDSEED enabled.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Considering how it is described, I didn't think probing RDSEED (like we
> do for RDRAND) would be necessary.
> 
> Am I going too far in also updating cpuidmask_defaults here, or is us
> not doing so for the RDRAND disabling actually an oversight?
> 
> Using warning_add() may not be quite appropriate, as we don't really
> mean the admin to possibly override this with "cpuid=3Drdseed" (that's
> only a last resort, in case the issue is yet more limited in scope). But
> mere printk() would feel like hiding the information in the middle of
> lots of other output.
> ---
> v2: Correctly check model, not (again) family.
> 
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -1219,6 +1219,24 @@ static void cf_check init_amd(struct cpu
>   =09=09}
>   =09=09break;
>   
> +=09case 0x17:
> +=09=09/*
> +=09=09 * Fam17 model 47 stepping 0 has an error that causes RDSEED to
> +=09=09 * always return 0xffffffff (while RDRAND works correctly).
> +=09=09 */
> +=09=09if (c =3D=3D &boot_cpu_data &&
> +=09=09    c->model =3D=3D 0x47 && c->stepping =3D=3D 0 &&
> +=09=09    cpu_has(c, X86_FEATURE_RDSEED) &&
> +=09=09    !is_forced_cpu_cap(X86_FEATURE_RDSEED)) {
> +=09=09=09static const char __initconst text[] =3D
> +=09=09=09=09"RDSEED is unreliable on this hardware; disabling its exposu=
re\n";
> +
> +=09=09=09setup_clear_cpu_cap(X86_FEATURE_RDSEED);
> +=09=09=09cpuidmask_defaults._7ab0 &=3D ~cpufeat_mask(X86_FEATURE_RDSEED)=
;
> +=09=09=09warning_add(text);
> +=09=09}
> +=09=09break;
> +
>   =09case 0x19:
>   =09=09/*
>   =09=09 * Zen3 (Fam19h model < 0x10) parts are not susceptible to
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -123,6 +123,10 @@ static void __init cf_check _parse_xen_c
>       else if ( feat =3D=3D X86_FEATURE_RDRAND &&
>                 (cpuid_ecx(1) & cpufeat_mask(X86_FEATURE_RDRAND)) )
>           setup_force_cpu_cap(X86_FEATURE_RDRAND);
> +    else if ( feat =3D=3D X86_FEATURE_RDSEED &&
> +              cpuid_eax(0) >=3D 7 &&
> +              (cpuid_count_ebx(7, 0) & cpufeat_mask(X86_FEATURE_RDSEED))=
 )
> +        setup_force_cpu_cap(X86_FEATURE_RDSEED);
>   }
>   
>   static int __init cf_check parse_xen_cpuid(const char *s)
> 
> 

Reviewed-by: Teddy Astie <teddy.astie@vates.tech>


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



