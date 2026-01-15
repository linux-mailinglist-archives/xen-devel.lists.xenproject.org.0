Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF34D25C3E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 17:33:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1205536.1519749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgQGx-000226-V3; Thu, 15 Jan 2026 16:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1205536.1519749; Thu, 15 Jan 2026 16:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgQGx-000202-SP; Thu, 15 Jan 2026 16:32:35 +0000
Received: by outflank-mailman (input) for mailman id 1205536;
 Thu, 15 Jan 2026 16:32:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JCSy=7U=bounce.vates.tech=bounce-md_30504962.6969169a.v1-9f7b2055ceaf426ca865a44bdff1f793@srs-se1.protection.inumbo.net>)
 id 1vgQGw-0001zw-H8
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 16:32:34 +0000
Received: from mail187-33.suw11.mandrillapp.com
 (mail187-33.suw11.mandrillapp.com [198.2.187.33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7c1abec-f22f-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 17:32:28 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-33.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4dsT6M09z8zBsTlVw
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 16:32:27 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9f7b2055ceaf426ca865a44bdff1f793; Thu, 15 Jan 2026 16:32:26 +0000
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
X-Inumbo-ID: c7c1abec-f22f-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1768494747; x=1768764747;
	bh=9twe24x1zX+FLh6t5OJMyT3WR+NCn2bdCavyVwLMpfw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=sD+lXiiuSX1xmQ0NQ+9EKZNmfG7tDBfm7klxPHh1/ifTCHlq+RMTWUstmIYdJhCtE
	 IP9uSfFcCRxgJ7JazzJB4X58Wi7cevH2E5Qyk6LGPw2hL+6wzdMiFqPjdT23QcQzPd
	 tyZ3s+kdlKwvdWHJwSfdKABFPtu4tAniERS+xdl9MyQlnR1CZD3iC463uytWfD+F08
	 FYCmp62pjLndK4RRQFQDagD/fW0Bwq/wR/rF9ynW/smjDocaow1YdcIxfYGAWgnHVb
	 7ckBp3EJNrvqHmjXDJznnsiok8zCotLSPJRqPBjg2uacYYNc5pU7QwxABr2hAN4jen
	 RRBfn453ZPaBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1768494747; x=1768755247; i=teddy.astie@vates.tech;
	bh=9twe24x1zX+FLh6t5OJMyT3WR+NCn2bdCavyVwLMpfw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=XJtk69ronuHWiHSiehBsxk+F5b4hdC4QkmrQIA92WEGUckhhy/7J+v7JiRzjQi+pL
	 wZ0pZdgcLPGvm7mZKEFp67uKpmfA8tAZ/yk0NYXnES0KA2KFTtv8Lnz3iswPySKaFJ
	 opvguRTUDgw4ro6d6VLHf0DCU/lEh3XHqf/Xf4uDtxD/xH5IksH4hWxllvshhDeJKR
	 2Fi94FKrQ7FrG9NRsw77z0gGwSyd6VgFoaeQ3P7NNdqlK5NugKxAqLxiTME8zIWY79
	 VUa0CqhlcMmWHMlbgK8mD5IG1hL3K1QBzlHDtRF/9u98EETOPBF4M1ckpaV7te0UId
	 1P4lgKihVUeXA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20xen:=20Move=20NX=20handling=20to=20a=20dedicated=20place?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1768494745417
Message-Id: <ed39c6b4-a9e7-4ef3-a185-27533be55e96@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Julian Vetter" <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
References: <20260115151658.3725784-1-julian.vetter@vates.tech> <69b511db-654d-46b3-aca3-3f37f30d3473@citrix.com>
In-Reply-To: <69b511db-654d-46b3-aca3-3f37f30d3473@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9f7b2055ceaf426ca865a44bdff1f793?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260115:md
Date: Thu, 15 Jan 2026 16:32:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 15/01/2026 =C3=A0 16:50, Andrew Cooper a =C3=A9crit=C2=A0:
> On 15/01/2026 3:17 pm, Julian Vetter wrote:
>> Currently the CONFIG_REQUIRE_NX prevents booting XEN, if NX is disabled
>> in the BIOS. AMD doesn't have a software-accessible MSR to re-enable it,
>> so there is nothing we can do. The system is going to die anyway. But on
>> Intel NX might just be hidden via IA32_MISC_ENABLE.XD_DISABLE. But the
>> function to re-enable it is called after the check + panic in
>> efi_arch_cpu. So, this patch removes the early check and moves the
>> entire NX handling into a dedicated place.
>>
>> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> 
> Sorry I didn't get around to doing the prep work I promised.
> 
> This is going along the right lines, but there are a few complexities sti=
ll.
> 
> Also you'll want to split the patch into a series.=C2=A0 More on that whe=
n
> we've sorted out a few other details.
> 
>> diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoli=
ne.S
>> index a92e399fbe..8e8d50cbdf 100644
>> --- a/xen/arch/x86/boot/trampoline.S
>> +++ b/xen/arch/x86/boot/trampoline.S
>> @@ -144,10 +144,9 @@ gdt_48:
>>   GLOBAL(trampoline_misc_enable_off)
>>           .quad   0
>>   
>> -/* EFER OR-mask for boot paths.  SCE conditional on PV support, NX adde=
d when available. */
>> +/* EFER OR-mask for boot paths.  SCE conditional on PV support. */
> 
> The comment wants to stay as-was.=C2=A0 NX does get added when available.
> 
>>   GLOBAL(trampoline_efer)
>> -        .long   EFER_LME | (EFER_SCE * IS_ENABLED(CONFIG_PV)) | \
>> -                (EFER_NXE * IS_ENABLED(CONFIG_REQUIRE_NX))
>> +        .long   EFER_LME | (EFER_SCE * IS_ENABLED(CONFIG_PV))
>>   
>>   GLOBAL(trampoline_xen_phys_start)
>>           .long   0
>> diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm=
/setup.h
>> index b01e83a8ed..16f53725ca 100644
>> --- a/xen/arch/x86/include/asm/setup.h
>> +++ b/xen/arch/x86/include/asm/setup.h
>> @@ -70,4 +70,6 @@ extern bool opt_dom0_msr_relaxed;
>>   
>>   #define max_init_domid (0)
>>   
>> +void nx_init(void);
>> +
>>   #endif
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 27c63d1d97..608720b717 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1119,6 +1119,50 @@ static struct domain *__init create_dom0(struct b=
oot_info *bi)
>>       return d;
>>   }
>>   
>> +void __init nx_init(void)
> 
> This should be static if it's only used in a single file.=C2=A0 However, =
see
> later for doing it a bit differently.
> 
>> +{
>> +    uint64_t misc_enable;
>> +    uint32_t eax, ebx, ecx, edx;
>> +
>> +    if ( !boot_cpu_has(X86_FEATURE_NX) )
>> +    {
>> +        /* Intel: try to unhide NX by clearing XD_DISABLE */
>> +        cpuid(0, &eax, &ebx, &ecx, &edx);
>> +        if ( ebx =3D=3D X86_VENDOR_INTEL_EBX &&
>> +             ecx =3D=3D X86_VENDOR_INTEL_ECX &&
>> +             edx =3D=3D X86_VENDOR_INTEL_EDX )
>> +        {
>> +            rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
>> +            if ( misc_enable & MSR_IA32_MISC_ENABLE_XD_DISABLE )
>> +            {
>> +                misc_enable &=3D ~MSR_IA32_MISC_ENABLE_XD_DISABLE;
>> +                wrmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
>> +
>> +                /* Re-read CPUID after having cleared XD_DISABLE */
>> +                boot_cpu_data.x86_capability[FEATURESET_e1d] =3D cpuid_=
edx(0x80000001U);
>> +
>> +                /* Adjust misc_enable_off for secondary startup and wak=
eup code */
>> +                bootsym(trampoline_misc_enable_off) |=3D MSR_IA32_MISC_=
ENABLE_XD_DISABLE;
>> +                printk(KERN_INFO "re-enabled NX (Execute Disable) prote=
ction\n");
>> +            }
>> +        }
>> +        /* AMD: nothing we can do - NX must be enabled in BIOS */
> 
> The BIOS is only hiding the CPUID bit.=C2=A0 It's not blocking the use of=
 NX.
> 
> You want to do a wrmsr_safe() trying to set EFER.NXE, and if it
> succeeds, set the NX bit in MSR_K8_EXT_FEATURE_MASK to "unhide" it in
> regular CPUID.=C2=A0 This is a little more tricky to arrange because it n=
eeds
> doing on each CPU, not just the BSP.
> 

I see this MSR in the BKDG (bit 20 is NX). Are these bits stable across 
the AMD CPU generations ?

>> +    }
>> +
>> +    /* Enable EFER.NXE only if NX is available */
>> +    if ( boot_cpu_has(X86_FEATURE_NX) )
>> +    {
>> +        if ( !(read_efer() & EFER_NXE) )
>> +            write_efer(read_efer() | EFER_NXE);
>> +
>> +        /* Adjust trampoline_efer for secondary startup and wakeup code=
 */
>> +        bootsym(trampoline_efer) |=3D EFER_NXE;
>> +    }
>> +
>> +    if ( IS_ENABLED(CONFIG_REQUIRE_NX) && !boot_cpu_has(X86_FEATURE_NX)=
 )
>> +        panic("This build of Xen requires NX support\n");
>> +}
>> +
>>   /* How much of the directmap is prebuilt at compile time. */
>>   #define PREBUILT_MAP_LIMIT (1 << L2_PAGETABLE_SHIFT)
>>   
>> @@ -1159,6 +1203,8 @@ void asmlinkage __init noreturn __start_xen(void)
>>       rdmsrl(MSR_EFER, this_cpu(efer));
>>       asm volatile ( "mov %%cr4,%0" : "=3Dr" (info->cr4) );
>>   
>> +    nx_init();
>> +
>>       /* Enable NMIs.  Our loader (e.g. Tboot) may have left them disabl=
ed. */
>>       enable_nmis();
>>   
> 
> This is too early, as can be seen by the need to make a cpuid() call
> rather than using boot_cpu_data.
> 
> The cleanup I wanted to do was to create/rework early_cpu_init() to get
> things in a better order, so the panic() could go at the end here.=C2=A0 =
The
> current split we've got of early/regular CPU init was inherited from
> Linux and can be collapsed substantially.
> 
> The intel "unlocking" wants to move back into early_init_intel(), along
> with intel_unlock_cpuid_leaves().=C2=A0 (This is where it used to live be=
fore
> REQUIRE_NX was added).
> 
> The AMD side probe wants to live in early_amd_init()=C2=A0 (not that ther=
e is
> one right now), but the re-enabling of the NX bit in CPUID needs to also
> be in amd_init() so it gets applied to APs too.
> 
> Does this make sense?

Sounds good to me, I suppose there is no use of NX before this ?

> 
> ~Andrew
> 

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



