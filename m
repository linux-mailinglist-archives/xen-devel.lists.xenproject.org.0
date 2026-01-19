Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B78DDD3A526
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jan 2026 11:35:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208063.1520300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhmaO-0003C3-D3; Mon, 19 Jan 2026 10:34:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208063.1520300; Mon, 19 Jan 2026 10:34:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhmaO-00039P-9k; Mon, 19 Jan 2026 10:34:16 +0000
Received: by outflank-mailman (input) for mailman id 1208063;
 Mon, 19 Jan 2026 10:34:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pLLO=7Y=bounce.vates.tech=bounce-md_30504962.696e08a1.v1-3d347223db944c539b4fc967bdb4378a@srs-se1.protection.inumbo.net>)
 id 1vhmaM-00039J-FI
 for xen-devel@lists.xenproject.org; Mon, 19 Jan 2026 10:34:14 +0000
Received: from mail187-33.suw11.mandrillapp.com
 (mail187-33.suw11.mandrillapp.com [198.2.187.33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64204b92-f522-11f0-9ccf-f158ae23cfc8;
 Mon, 19 Jan 2026 11:34:11 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-33.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4dvmz56DZ6zBsTwYK
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jan 2026 10:34:09 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 3d347223db944c539b4fc967bdb4378a; Mon, 19 Jan 2026 10:34:09 +0000
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
X-Inumbo-ID: 64204b92-f522-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1768818849; x=1769088849;
	bh=vn3Wli3BNWKqrV+U6eVpSMGef8+BZt16wPe0+g/asaM=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=JOH+0kfEomGOk5Gkh9mYJ14Gn/C8qyi6c8WBYubbYS6mjAIZjN3RQh6Z19FtjPvvj
	 MmQYJlsavcjr6QCzfOu42eJDh1vfyh4QZEBSmkofagUAP5rwt25cb6iW72rLNave8l
	 GYhm0o20Lai6bKiCY7QCiL7UWbgIP3I2IoIDXI94SaEmH/n6wMLwHoMshk0KtRA99y
	 0u1gWBXfwu0iGXixsSXyLzkDjEwYZU0pN2t5goVGoAHe6b7eEY9PMzpUTKaU/+3jD5
	 q9q/bzCqX/+OaxbA7K6KXhbQY6STKsXv6nO34X/931A47XpLlb7ysZk4vrC+DzsZuQ
	 oQrHmXi6IHvEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1768818849; x=1769079349; i=julian.vetter@vates.tech;
	bh=vn3Wli3BNWKqrV+U6eVpSMGef8+BZt16wPe0+g/asaM=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=fMJttFIOTcXnQY2CMosBzovW4JD1YzSu7nlbMO+WgcLgfhpgBr484IKRNriYkNYRc
	 0xOMlRzg0mzgu1CH1cTbYE7n8T3Qxg+m89ymo0rNhm5oiqttYrQG5lIYd4DeN5EL0P
	 ItnqyPwNZ558qufY0WNhgdiMNd9UwKTtDk4LE6vsoTz7qwDKGYDmVGt3JsZqHnpjnw
	 7uHu+i9r/Snm+oT46pEniKoXjDoPDYGvsfqMbSCq8yGj2sTtVTLqUwO9mDymfiLhQk
	 Vm90Ai5WuCkDSskeDC+2exYC7G1+LVaAMCX9PfiDpvsLrUfhPc/0f5fRAgMV/XTxby
	 Td+9rIY29BLVg==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20xen:=20Move=20NX=20handling=20to=20a=20dedicated=20place?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1768818848319
Message-Id: <c4c2c376-ab6b-4bb3-9ede-091f791c1427@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>, "Jan Beulich" <jbeulich@suse.com>
References: <20260115151658.3725784-1-julian.vetter@vates.tech> <69b511db-654d-46b3-aca3-3f37f30d3473@citrix.com>
In-Reply-To: <69b511db-654d-46b3-aca3-3f37f30d3473@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.3d347223db944c539b4fc967bdb4378a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260119:md
Date: Mon, 19 Jan 2026 10:34:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 1/15/26 4:50 PM, Andrew Cooper wrote:
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

No problem, I assumed you were quiet busy so I looked into it.

> 
> This is going along the right lines, but there are a few complexities sti=
ll.

Thank you for the feedback.

> 
> Also you'll want to split the patch into a series.=C2=A0 More on that whe=
n
> we've sorted out a few other details.

Yes, I will do that once everything is sorted out.

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

Yes, you're right.
> 
> You want to do a wrmsr_safe() trying to set EFER.NXE, and if it
> succeeds, set the NX bit in MSR_K8_EXT_FEATURE_MASK to "unhide" it in
> regular CPUID.=C2=A0 This is a little more tricky to arrange because it n=
eeds
> doing on each CPU, not just the BSP.

Ok, yes, I have modified the AMD side to use MSR_K8_EXT_FEATURE_MASK to 
"unhide" it.

> 
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

I have tried to add the logic into the early_init_{intel,amd}() 
functions. But it seems this is already too late in the boot chain. This 
is why I put into an extra function which is called earlier. Because it 
seems there are already pages with PAGE_NX being used on the way to 
early_init_{intel,amd}(). Because when I put my code into 
early_init_intel I get a fault and a reboot. What do you suggest?

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
> 
> ~Andrew
> 



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



