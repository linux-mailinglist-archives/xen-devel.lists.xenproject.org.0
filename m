Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCE58A3025
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 16:06:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704702.1101203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvHXc-0001IU-8X; Fri, 12 Apr 2024 14:06:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704702.1101203; Fri, 12 Apr 2024 14:06:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvHXc-0001Gr-59; Fri, 12 Apr 2024 14:06:08 +0000
Received: by outflank-mailman (input) for mailman id 704702;
 Fri, 12 Apr 2024 14:06:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SOxV=LR=bounce.vates.tech=bounce-md_30504962.66193fc8.v1-f767dee5c67d408688a03d00dd5afeec@srs-se1.protection.inumbo.net>)
 id 1rvHXZ-0001Gl-Pm
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 14:06:06 +0000
Received: from mail5.us4.mandrillapp.com (mail5.us4.mandrillapp.com
 [205.201.136.5]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cae31c50-f8d5-11ee-94a3-07e782e9044d;
 Fri, 12 Apr 2024 16:06:01 +0200 (CEST)
Received: from pmta15.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail5.us4.mandrillapp.com (Mailchimp) with ESMTP id 4VGJJ83797zDRHxRS
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2024 14:06:00 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f767dee5c67d408688a03d00dd5afeec; Fri, 12 Apr 2024 14:06:00 +0000
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
X-Inumbo-ID: cae31c50-f8d5-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1712930760; x=1713191260;
	bh=3Vs3YGzR1vLBNYPO9yFFoH/3q/MigkEKm0DNc1fKke4=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=gnhga6A5kN0XxuxlLHyIYvpWwVmF9L/3/GM+lOhTfEiR1tmybXe6mSVhUzaEqwE9O
	 wzuErlDg2H3pWm7IkOh+kV6IKMKSFT8gF4ew4GX7MHGWphcffuldkxjQIo+xL/ezzw
	 r+P7ICyIbE+KqZEqJfCrTnZu756ZglTqpWtW5DK1cu/ulMsdoKWWvrwwAanLMRIMxC
	 KYbzM+H94Dt43sBswrD0WRhx/5UO4yxMGrAucNT2+O9JcEkn0sxfdemeUe+pJ2hcj1
	 u0uf1z3CUZrU4//rpCrYUer0/rfPWUjXQUo85tSATh1wdDlCe/1dE3RXVnrESFc1+L
	 bvtQaI4PJTulA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr; s=mte1;
	t=1712930760; x=1713191260; i=andrei.semenov@vates.fr;
	bh=3Vs3YGzR1vLBNYPO9yFFoH/3q/MigkEKm0DNc1fKke4=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=A2QVVd7QOHeELwbiLiMcpuaWzFgd2623aEA3Qdj6JeuROj52bgyboC/E3fva3wbDY
	 SVSuJGTDYza9JNuO/jsA0nP40QRuEYYcGaCPd8s0kA1FmsgUlRiFShtMlSNY9KumJp
	 iUkVfAsM77oKB9Of4NT9pvqPMfN8Nkm0hCG51qGPM3rxGFUAPD/kXLz8IpFpdTrPZX
	 Qpyyqg0nnftsAtdJbYSpUsyE0Dp4FaAYx4MbJcPf+nH2aUApuOy2ylcREcnJL+SDAZ
	 8lqe/CoTg/JXjrYY8tdZXwJrUOJOI4SmrhbJr0Mn5pU6q8La3r1NFIPNTWRuIrUy32
	 XLuy1/3J5rp2g==
From: Andrei Semenov <andrei.semenov@vates.fr>
Subject: =?utf-8?Q?Re:=20[PATCH=20v1=201/2]=20Implemented=20AMD=20SEV=20discovery=20and=20enabling.?=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1712930759319
Message-Id: <ede83752-6151-4c23-a8c0-883aa7bee129@vates.fr>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1712759753.git.andrei.semenov@vates.fr> <27fce67472c97b2b2b7cc0412bf0edcaa67cc63f.1712759753.git.andrei.semenov@vates.fr> <a9638611-8348-462a-a25d-a9efe3fabf9a@citrix.com>
In-Reply-To: <a9638611-8348-462a-a25d-a9efe3fabf9a@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f767dee5c67d408688a03d00dd5afeec?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240412:md
Date: Fri, 12 Apr 2024 14:06:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable


On 4/11/24 20:32, Andrew Cooper wrote:
> On 10/04/2024 4:36 pm, Andrei Semenov wrote:
>> diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
>> index ab92333673..a5903613f0 100644
>> --- a/xen/arch/x86/cpu/amd.c
>> +++ b/xen/arch/x86/cpu/amd.c
>> @@ -1030,6 +1031,54 @@ static void amd_check_erratum_1485(void)
>>   =09wrmsrl(MSR_AMD64_BP_CFG, val | chickenbit);
>>   }
>>   
>> +#ifdef CONFIG_HVM
>> +static void amd_enable_mem_encrypt(const struct cpuinfo_x86 *c)
>> +{
>> +=09unsigned int  eax, ebx, ecx, edx;
>> +=09uint64_t syscfg;
>> +
>> +=09if (!smp_processor_id()) {
> c =3D=3D &boot_cpu_info.
Agree, will fix.
>
>> +
>> +=09=09cpuid_count(0x80000000,0,&eax, &ebx, &ecx, &edx);
>> +
>> +=09=09if (eax <  0x8000001f)
>> +=09=09=09return;
> Max leaf is already collected.=C2=A0 c->extended_cpuid_level
Agree, will fix.
>
>
>> +
>> +=09=09cpuid_count(0x8000001f,0,&eax, &ebx, &ecx, &edx);
>> +
>> +=09=09if (eax & 0x1)
>> +=09=09=09setup_force_cpu_cap(X86_FEATURE_SME);
>> +
>> +=09=09if (eax & 0x2) {
>> +=09=09=09setup_force_cpu_cap(X86_FEATURE_SEV);
>> +=09=09=09max_sev_asid =3D ecx;
>> +=09=09=09min_sev_asid =3D edx;
>> +=09=09}
>> +
>> +=09=09if (eax & 0x3)
>> +=09=09=09pte_c_bit_mask =3D 1UL << (ebx & 0x3f);
> This is decoding the main SEV feature leaf, but outside of normal
> mechanisms.
>
> I've got half a mind to brute-force through the remaining work to
> un-screw our boot sequence order, and express this in a cpu-policy
> straight away.=C2=A0 This is wanted for the SVM leaf info too.
>
> Leave it with me for a bit.
OK. I wait for your insights on this so.
>
>
>> +=09}
>> +
>> +=09if (!(cpu_has_sme || cpu_has_sev))
>> +=09=09return;
>> +
>> +=09if (!smp_processor_id()) {
>> +=09=09if (cpu_has_sev)
>> +=09=09=09printk(XENLOG_INFO "SEV: ASID range [0x%x - 0x%x]\n",
>> +=09=09=09min_sev_asid, max_sev_asid);
> Why do we have a min as well as a max?=C2=A0 Isn't min always 1?

Well, "normally it is". But this is the part of CPUID leaf specs. Do 
they plan to potentially change it?

No idea.

>
>> +=09}
>> +
>> +=09rdmsrl(MSR_K8_SYSCFG, syscfg);
>> +
>> +=09if (syscfg & SYSCFG_MEM_ENCRYPT) {
>> +=09=09return;
>> +=09}
>> +
>> +=09syscfg |=3D SYSCFG_MEM_ENCRYPT;
>> +=09wrmsrl(MSR_K8_SYSCFG, syscfg);
>> +}
>> +#endif
>> +
>>   static void cf_check init_amd(struct cpuinfo_x86 *c)
>>   {
>>   =09u32 l, h;
>> @@ -1305,6 +1354,10 @@ static void cf_check init_amd(struct cpuinfo_x86 =
*c)
>>   =09check_syscfg_dram_mod_en();
>>   
>>   =09amd_log_freq(c);
>> +
>> +#ifdef CONFIG_HVM
>> +=09amd_enable_mem_encrypt(c);
>> +#endif
> I think we want to drop the CONFIG_HVM here.
>
> Memory encryption is an all-or-nothing thing.=C2=A0 If it's active, it
> affects all pagetables that Xen controls, even dom0's.=C2=A0 And we likel=
y do
> want get to the point of Xen running on encrypted mappings even if dom0
> can't operate it very nicely.
>
> Thoughts?

Basically I put CONFIG_HVM here because I also wanted to put related 
variables

(max/min_asid) in sev.c. And sev.c is in "HVM" part of the code as SEV

is only related to HVM guests. Now, basically I agree that

- Xen would like potentially use encrypted memory for itself

- in SME case, some encryption could be offered for non-HVM guests, so they

can protect their memory (even though the key is shared and the 
hypervisor can

read it).

OK, so I will drop CONFIG_HVM and put these variables elsewhere. amd.h 
is probably

a good candidate?

>>   }
>>   
>>   const struct cpu_dev __initconst_cf_clobber amd_cpu_dev =3D {
>> diff --git a/xen/arch/x86/hvm/svm/Makefile b/xen/arch/x86/hvm/svm/Makefi=
le
>> index 760d2954da..9773d539ef 100644
>> --- a/xen/arch/x86/hvm/svm/Makefile
>> +++ b/xen/arch/x86/hvm/svm/Makefile
>> @@ -6,3 +6,4 @@ obj-y +=3D nestedsvm.o
>>   obj-y +=3D svm.o
>>   obj-y +=3D svmdebug.o
>>   obj-y +=3D vmcb.o
>> +obj-y +=3D sev.o
> Please keep this sorted by object file name.
Got it. Will do.
>
>> diff --git a/xen/arch/x86/hvm/svm/sev.c b/xen/arch/x86/hvm/svm/sev.c
>> new file mode 100644
>> index 0000000000..336fad25f5
>> --- /dev/null
>> +++ b/xen/arch/x86/hvm/svm/sev.c
>> @@ -0,0 +1,4 @@
>> +#include <asm/sev.h>
>> +uint64_t __read_mostly pte_c_bit_mask;
>> +unsigned int __read_mostly min_sev_asid;
>> +unsigned int __read_mostly max_sev_asid;
> Several things.=C2=A0 All new files should come with an SPDX tag.=C2=A0 U=
nless you
> have other constraints, GPL-2.0-only is preferred.=C2=A0 There also wants=
 to
> be at least a oneline summary of what's going on here.
Will do.
>
> All these variables look like they should be __ro_after_init.=C2=A0 Howev=
er,
> it's rather hard to judge, given no users yet.
Yes, this is not supposed to dynamically change. Will fix.
>
> pte_c_bit_mask may want to be an intpte_t rather than uint64_t.

Agree. Will fix

>
> ~Andrew
Andrei.


