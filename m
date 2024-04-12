Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DA18A30DE
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 16:38:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704729.1101257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvI2e-0005Tn-JU; Fri, 12 Apr 2024 14:38:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704729.1101257; Fri, 12 Apr 2024 14:38:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvI2e-0005Qe-G1; Fri, 12 Apr 2024 14:38:12 +0000
Received: by outflank-mailman (input) for mailman id 704729;
 Fri, 12 Apr 2024 14:38:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m1/u=LR=bounce.vates.tech=bounce-md_30504962.6619474d.v1-c4a95ce5ca1345ad8bae29c86b9930b1@srs-se1.protection.inumbo.net>)
 id 1rvI2c-0005QY-PM
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 14:38:10 +0000
Received: from mail145-16.atl61.mandrillapp.com
 (mail145-16.atl61.mandrillapp.com [198.2.145.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46fdd8f6-f8da-11ee-94a3-07e782e9044d;
 Fri, 12 Apr 2024 16:38:08 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-16.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4VGK190ptVz8XRqj0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2024 14:38:05 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c4a95ce5ca1345ad8bae29c86b9930b1; Fri, 12 Apr 2024 14:38:05 +0000
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
X-Inumbo-ID: 46fdd8f6-f8da-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1712932685; x=1713193185;
	bh=hTeskO7cTnAtgN13EZTm7x3v6yR+TkmazbX6ZtL7IcQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=K3tJphHQlx0cLYLorS8NXj4cQmravXbE2+azKa+eWqBalWAW25QgAXqHO4IDZplSa
	 2SaRgQGAuTjxTeb20+cSE8dfL8s8PloWeLbCjJeKc/6h596cXEmTuQsll7YmIzjY60
	 dMDUuRbd3VhbFWEKPvDCam1fRtNZ8W/gDwBjcIrPGJdEqLWP14LxUFoGefUKFkNTTY
	 /T5UqDL2DgGataF9TIoRdxJ6bnmdVKtNfxSRnlr205dKVEfI6mVptY4+ZaQXkXqfWt
	 s0yqlXN0ixUVs66mm/HQmrOQwg2hA3an3Goap6LQOzAUdpbvvQjAWVRSZ2nmyMtjHw
	 8XdiDzi/tPtNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1712932685; x=1713193185; i=vaishali.thakkar@vates.tech;
	bh=hTeskO7cTnAtgN13EZTm7x3v6yR+TkmazbX6ZtL7IcQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=DmeRaTmovt9xYSnHosVleTr5DdzyiDemkw25BQi/WWqqDQfaooh4KIthEsRW7s01E
	 WKQfzwY9XMGLqFTfb2AQ+OmYP3uLVEfdrbZH1wiy9G38CVohsaRBfw92YAfmbkvmu/
	 PDPNToOeDcw0SczreljZlc0xKb7pqgHFf908x6noNmDWfTBE9tWNdsgD4jbdmAZ7SM
	 jqkjl6rdf5+F+jBzaD8Ws7IxAMbrBYWah9Vn4ZgA96XreCHcGJmGVpAfwzSBT+EesT
	 f0RHMh8d4iIRDWqCD1fbyPOIpYaXG2Iyz7qUhdX8R3GR0z44bb7qjyH1ib2BZGXw25
	 33d8+7iBFoCLQ==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v1=201/2]=20Implemented=20AMD=20SEV=20discovery=20and=20enabling.?=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1712932683808
Message-Id: <51d5395e-7341-438f-8472-3391531c5bb0@vates.tech>
To: Andrei Semenov <andrei.semenov@vates.fr>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1712759753.git.andrei.semenov@vates.fr> <27fce67472c97b2b2b7cc0412bf0edcaa67cc63f.1712759753.git.andrei.semenov@vates.fr> <a9638611-8348-462a-a25d-a9efe3fabf9a@citrix.com> <ede83752-6151-4c23-a8c0-883aa7bee129@vates.fr>
In-Reply-To: <ede83752-6151-4c23-a8c0-883aa7bee129@vates.fr>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c4a95ce5ca1345ad8bae29c86b9930b1?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240412:md
Date: Fri, 12 Apr 2024 14:38:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 4/12/24 4:06 PM, Andrei Semenov wrote:
> 
> On 4/11/24 20:32, Andrew Cooper wrote:
>> On 10/04/2024 4:36 pm, Andrei Semenov wrote:
>>> diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
>>> index ab92333673..a5903613f0 100644
>>> --- a/xen/arch/x86/cpu/amd.c
>>> +++ b/xen/arch/x86/cpu/amd.c
>>> @@ -1030,6 +1031,54 @@ static void amd_check_erratum_1485(void)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wrmsrl(MSR_AMD64_BP_CFG, val | chickenbi=
t);
>>> =C2=A0 }
>>> +#ifdef CONFIG_HVM
>>> +static void amd_enable_mem_encrypt(const struct cpuinfo_x86 *c)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 unsigned int=C2=A0 eax, ebx, ecx, edx;
>>> +=C2=A0=C2=A0=C2=A0 uint64_t syscfg;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (!smp_processor_id()) {
>> c =3D=3D &boot_cpu_info.
> Agree, will fix.
>>
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpuid_count(0x80000000,0,&e=
ax, &ebx, &ecx, &edx);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (eax <=C2=A0 0x8000001f)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn;
>> Max leaf is already collected.=C2=A0 c->extended_cpuid_level
> Agree, will fix.
>>
>>
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpuid_count(0x8000001f,0,&e=
ax, &ebx, &ecx, &edx);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (eax & 0x1)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set=
up_force_cpu_cap(X86_FEATURE_SME);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (eax & 0x2) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set=
up_force_cpu_cap(X86_FEATURE_SEV);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 max=
_sev_asid =3D ecx;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 min=
_sev_asid =3D edx;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (eax & 0x3)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte=
_c_bit_mask =3D 1UL << (ebx & 0x3f);
>> This is decoding the main SEV feature leaf, but outside of normal
>> mechanisms.
>>
>> I've got half a mind to brute-force through the remaining work to
>> un-screw our boot sequence order, and express this in a cpu-policy
>> straight away.=C2=A0 This is wanted for the SVM leaf info too.
>>
>> Leave it with me for a bit.
> OK. I wait for your insights on this so.
>>
>>
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (!(cpu_has_sme || cpu_has_sev))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (!smp_processor_id()) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (cpu_has_sev)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pri=
ntk(XENLOG_INFO "SEV: ASID range [0x%x - 0x%x]\n",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 min=
_sev_asid, max_sev_asid);
>> Why do we have a min as well as a max?=C2=A0 Isn't min always 1?

In the case of SEV, it's not true. Some BIOS allow to set the
min_asid. So yeah Xen will also need to adapted for the same.
I've a WIP patch for allowing dynamic generation of asid in such
a case.

> Well, "normally it is". But this is the part of CPUID leaf specs. Do they=
 
> plan to potentially change it?
> 
> No idea.
> 
>>
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 rdmsrl(MSR_K8_SYSCFG, syscfg);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (syscfg & SYSCFG_MEM_ENCRYPT) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 syscfg |=3D SYSCFG_MEM_ENCRYPT;
>>> +=C2=A0=C2=A0=C2=A0 wrmsrl(MSR_K8_SYSCFG, syscfg);
>>> +}
>>> +#endif
>>> +
>>> =C2=A0 static void cf_check init_amd(struct cpuinfo_x86 *c)
>>> =C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 l, h;
>>> @@ -1305,6 +1354,10 @@ static void cf_check init_amd(struct cpuinfo_x86=
 *c)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 check_syscfg_dram_mod_en();
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amd_log_freq(c);
>>> +
>>> +#ifdef CONFIG_HVM
>>> +=C2=A0=C2=A0=C2=A0 amd_enable_mem_encrypt(c);
>>> +#endif
>> I think we want to drop the CONFIG_HVM here.
>>
>> Memory encryption is an all-or-nothing thing.=C2=A0 If it's active, it
>> affects all pagetables that Xen controls, even dom0's.=C2=A0 And we like=
ly do
>> want get to the point of Xen running on encrypted mappings even if dom0
>> can't operate it very nicely.
>>
>> Thoughts?
> 
> Basically I put CONFIG_HVM here because I also wanted to put related vari=
ables
> 
> (max/min_asid) in sev.c. And sev.c is in "HVM" part of the code as SEV
> 
> is only related to HVM guests. Now, basically I agree that
> 
> - Xen would like potentially use encrypted memory for itself
> 
> - in SME case, some encryption could be offered for non-HVM guests, so th=
ey
> 
> can protect their memory (even though the key is shared and the hyperviso=
r can
> 
> read it).
> 
> OK, so I will drop CONFIG_HVM and put these variables elsewhere. amd.h is=
 
> probably
> 
> a good candidate?
> 
>>> =C2=A0 }
>>> =C2=A0 const struct cpu_dev __initconst_cf_clobber amd_cpu_dev =3D {
>>> diff --git a/xen/arch/x86/hvm/svm/Makefile b/xen/arch/x86/hvm/svm/Makef=
ile
>>> index 760d2954da..9773d539ef 100644
>>> --- a/xen/arch/x86/hvm/svm/Makefile
>>> +++ b/xen/arch/x86/hvm/svm/Makefile
>>> @@ -6,3 +6,4 @@ obj-y +=3D nestedsvm.o
>>> =C2=A0 obj-y +=3D svm.o
>>> =C2=A0 obj-y +=3D svmdebug.o
>>> =C2=A0 obj-y +=3D vmcb.o
>>> +obj-y +=3D sev.o
>> Please keep this sorted by object file name.
> Got it. Will do.
>>
>>> diff --git a/xen/arch/x86/hvm/svm/sev.c b/xen/arch/x86/hvm/svm/sev.c
>>> new file mode 100644
>>> index 0000000000..336fad25f5
>>> --- /dev/null
>>> +++ b/xen/arch/x86/hvm/svm/sev.c
>>> @@ -0,0 +1,4 @@
>>> +#include <asm/sev.h>
>>> +uint64_t __read_mostly pte_c_bit_mask;
>>> +unsigned int __read_mostly min_sev_asid;
>>> +unsigned int __read_mostly max_sev_asid;
>> Several things.=C2=A0 All new files should come with an SPDX tag.=C2=A0 =
Unless you
>> have other constraints, GPL-2.0-only is preferred.=C2=A0 There also want=
s to
>> be at least a oneline summary of what's going on here.
> Will do.
>>
>> All these variables look like they should be __ro_after_init.=C2=A0 Howe=
ver,
>> it's rather hard to judge, given no users yet.
> Yes, this is not supposed to dynamically change. Will fix.
>>
>> pte_c_bit_mask may want to be an intpte_t rather than uint64_t.
> 
> Agree. Will fix
> 
>>
>> ~Andrew
> Andrei.
> 
>


