Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 471A05F3A15
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 01:52:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415082.659569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofVEI-0007TQ-IC; Mon, 03 Oct 2022 23:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415082.659569; Mon, 03 Oct 2022 23:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofVEI-0007Qb-Er; Mon, 03 Oct 2022 23:52:10 +0000
Received: by outflank-mailman (input) for mailman id 415082;
 Mon, 03 Oct 2022 23:52:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGPN=2E=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1ofVEF-0007QV-UA
 for xen-devel@lists.xenproject.org; Mon, 03 Oct 2022 23:52:08 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 619a3986-4376-11ed-964a-05401a9f4f97;
 Tue, 04 Oct 2022 01:52:05 +0200 (CEST)
Received: from [127.0.0.1] ([73.223.250.219]) (authenticated bits=0)
 by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 293NpL7D3165639
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Mon, 3 Oct 2022 16:51:22 -0700
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
X-Inumbo-ID: 619a3986-4376-11ed-964a-05401a9f4f97
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 293NpL7D3165639
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2022090501; t=1664841085;
	bh=D7TBwA2zb1cncUrYgDx3mpO7N7pu2xIjAZUrkR2oYU0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=ri09LYJhWw+XUVmunFECVvFBv2cbu17I4CHiPPoY780m03moh1Zcs4+xKaJFcQS18
	 wwd7/ACWI8tEuYciN/wJADJfBOBllszaOMmKEqA52D3vRy3vGtpyx0WGgKbUdq4DOT
	 QQjx8OSyiQF0mItLegj0Kpp8zJPUhOXhCzhSQNrOpNiyLbO0KNRz1ch4kxn2AR8RxT
	 ay9OajbDqR5dKtBn+Olm9N0LZGcRWSxaUYjy05CaH7nB8ek2Hf1FNFwcYgWHG6Cz9B
	 DiX35oOWAp7iIPBzOR2FRCcmM5zfzs2t4x4evs4Q/7nBU8MLSSqmTjuF0y2TyRXjsw
	 k+cj4162/YAGQ==
Date: Mon, 03 Oct 2022 16:51:19 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Nadav Amit <namit@vmware.com>
CC: Vitaly Kuznetsov <vkuznets@redhat.com>, Alexander Graf <graf@amazon.com>,
        Ajay Kaher <akaher@vmware.com>, "x86@kernel.org" <x86@kernel.org>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "rostedt@goodmis.org" <rostedt@goodmis.org>,
        Srivatsa Bhat <srivatsab@vmware.com>,
        "srivatsa@csail.mit.edu" <srivatsa@csail.mit.edu>,
        Alexey Makhalov <amakhalov@vmware.com>,
        Vasavi Sirnapalli <vsirnapalli@vmware.com>,
        "er.ajay.kaher@gmail.com" <er.ajay.kaher@gmail.com>,
        "willy@infradead.org" <willy@infradead.org>,
        "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "acrn-dev@lists.projectacrn.org" <acrn-dev@lists.projectacrn.org>,
        "helgaas@kernel.org" <helgaas@kernel.org>,
        "bhelgaas@google.com" <bhelgaas@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v2] x86/PCI: Prefer MMIO over PIO on all hypervisor
User-Agent: K-9 Mail for Android
In-Reply-To: <AD04C0EF-E3E0-4DE2-A812-B05382D6F7C2@vmware.com>
References: <9FEC6622-780D-41E6-B7CA-8D39EDB2C093@vmware.com> <87zgf3pfd1.fsf@redhat.com> <B64FD502-E794-4E94-A267-D690476C57EE@vmware.com> <87tu4l9cfm.fsf@redhat.com> <04F550C5-786A-4B8E-9A88-EBFBD8872F16@vmware.com> <42CFC548-F8FE-4BD9-89AB-198B2B3F1091@zytor.com> <AD04C0EF-E3E0-4DE2-A812-B05382D6F7C2@vmware.com>
Message-ID: <8859A371-E810-4720-AAFD-06603816AA53@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 3, 2022 2:28:40 PM PDT, Nadav Amit <namit@vmware=2Ecom> wrote:
>On Oct 3, 2022, at 2:06 PM, H=2E Peter Anvin <hpa@zytor=2Ecom> wrote:
>
>> =E2=9A=A0 External Email
>>=20
>> On October 3, 2022 10:34:15 AM PDT, Nadav Amit <namit@vmware=2Ecom> wro=
te:
>>> On Oct 3, 2022, at 8:03 AM, Vitaly Kuznetsov <vkuznets@redhat=2Ecom> w=
rote:
>>>=20
>>>> Not my but rather PCI maintainer's call but IMHO dropping 'const' is
>>>> better, introducing a new global var is our 'last resort' and should =
be
>>>> avoided whenever possible=2E Alternatively, you can add a
>>>> raw_pci_ext_ops_preferred() function checking somethin within 'struct
>>>> hypervisor_x86' but I'm unsure if it's better=2E
>>>>=20
>>>> Also, please check Alex' question/suggestion=2E
>>>=20
>>> Here is my take (and Ajay knows probably more than me):
>>>=20
>>> Looking briefly on MCFG, I do not see a clean way of using the ACPI ta=
ble=2E
>>> The two options are either to use a reserved field (which who knows, m=
ight
>>> be used one day) or some OEM ID=2E I am also not familiar with
>>> PCI_COMMAND=2EMEMORY=3D0, so Ajay can hopefully give some answer about=
 that=2E
>>>=20
>>> Anyhow, I understand (although not relate) to the objection for a new =
global
>>> variable=2E How about explicitly calling this hardware bug a =E2=80=9C=
bug=E2=80=9D and using
>>> the proper infrastructure? Calling it explicitly a bug may even push w=
hoever
>>> can to resolve it=2E
>>>=20
>>> IOW, how about doing something along the lines of (not tested):
>>>=20
>>>=20
>>> -- >8 --
>>>=20
>>> Subject: [PATCH] x86/PCI: Prefer MMIO over PIO on VMware hypervisor
>>>=20
>>> ---
>>> arch/x86/include/asm/cpufeatures=2Eh | 1 +
>>> arch/x86/kernel/cpu/common=2Ec       | 2 ++
>>> arch/x86/kernel/cpu/vmware=2Ec       | 2 ++
>>> arch/x86/pci/common=2Ec              | 6 ++++--
>>> 4 files changed, 9 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/arch/x86/include/asm/cpufeatures=2Eh b/arch/x86/include/a=
sm/cpufeatures=2Eh
>>> index ef4775c6db01=2E=2E216b6f357b6d 100644
>>> --- a/arch/x86/include/asm/cpufeatures=2Eh
>>> +++ b/arch/x86/include/asm/cpufeatures=2Eh
>>> @@ -460,5 +460,6 @@
>>> #define X86_BUG_MMIO_UNKNOWN          X86_BUG(26) /* CPU is too old an=
d its MMIO Stale Data status is unknown */
>>> #define X86_BUG_RETBLEED              X86_BUG(27) /* CPU is affected b=
y RETBleed */
>>> #define X86_BUG_EIBRS_PBRSB           X86_BUG(28) /* EIBRS is vulnerab=
le to Post Barrier RSB Predictions */
>>> +#define X86_BUG_ECAM_MMIO             X86_BUG(29) /* ECAM MMIO is bug=
gy and PIO is preferable */
>>>=20
>>> #endif /* _ASM_X86_CPUFEATURES_H */
>>> diff --git a/arch/x86/kernel/cpu/common=2Ec b/arch/x86/kernel/cpu/comm=
on=2Ec
>>> index 3e508f239098=2E=2Ec94175fa304b 100644
>>> --- a/arch/x86/kernel/cpu/common=2Ec
>>> +++ b/arch/x86/kernel/cpu/common=2Ec
>>> @@ -1299,6 +1299,8 @@ static void __init cpu_set_bug_bits(struct cpuin=
fo_x86 *c)
>>> {
>>>      u64 ia32_cap =3D x86_read_arch_cap_msr();
>>>=20
>>> +      setup_force_cpu_bug(X86_BUG_ECAM_MMIO);
>>> +
>>>      /* Set ITLB_MULTIHIT bug if cpu is not in the whitelist and not m=
itigated */
>>>      if (!cpu_matches(cpu_vuln_whitelist, NO_ITLB_MULTIHIT) &&
>>>          !(ia32_cap & ARCH_CAP_PSCHANGE_MC_NO))
>>> diff --git a/arch/x86/kernel/cpu/vmware=2Ec b/arch/x86/kernel/cpu/vmwa=
re=2Ec
>>> index 02039ec3597d=2E=2E8903776284a6 100644
>>> --- a/arch/x86/kernel/cpu/vmware=2Ec
>>> +++ b/arch/x86/kernel/cpu/vmware=2Ec
>>> @@ -385,6 +385,8 @@ static void __init vmware_set_capabilities(void)
>>>              setup_force_cpu_cap(X86_FEATURE_VMCALL);
>>>      else if (vmware_hypercall_mode =3D=3D CPUID_VMWARE_FEATURES_ECX_V=
MMCALL)
>>>              setup_force_cpu_cap(X86_FEATURE_VMW_VMMCALL);
>>> +
>>> +      setup_clear_cpu_cap(X86_BUG_ECAM_MMIO);
>>> }
>>>=20
>>> static void __init vmware_platform_setup(void)
>>> diff --git a/arch/x86/pci/common=2Ec b/arch/x86/pci/common=2Ec
>>> index ddb798603201=2E=2Ebc81cf4c1014 100644
>>> --- a/arch/x86/pci/common=2Ec
>>> +++ b/arch/x86/pci/common=2Ec
>>> @@ -40,7 +40,8 @@ const struct pci_raw_ops *__read_mostly raw_pci_ext_=
ops;
>>> int raw_pci_read(unsigned int domain, unsigned int bus, unsigned int d=
evfn,
>>>                                              int reg, int len, u32 *va=
l)
>>> {
>>> -      if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>>> +      if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
>>> +          (boot_cpu_has_bug(X86_BUG_ECAM_MMIO) || !raw_pci_ext_ops))
>>>              return raw_pci_ops->read(domain, bus, devfn, reg, len, va=
l);
>>>      if (raw_pci_ext_ops)
>>>              return raw_pci_ext_ops->read(domain, bus, devfn, reg, len=
, val);
>>> @@ -50,7 +51,8 @@ int raw_pci_read(unsigned int domain, unsigned int b=
us, unsigned int devfn,
>>> int raw_pci_write(unsigned int domain, unsigned int bus, unsigned int =
devfn,
>>>                                              int reg, int len, u32 val=
)
>>> {
>>> -      if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>>> +      if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
>>> +          (boot_cpu_has_bug(X86_BUG_ECAM_MMIO) || !raw_pci_ext_ops))
>>>              return raw_pci_ops->write(domain, bus, devfn, reg, len, v=
al);
>>>      if (raw_pci_ext_ops)
>>>              return raw_pci_ext_ops->write(domain, bus, devfn, reg, le=
n, val);
>>=20
>> Also=2E=2E=2E any reason we can't just set raw_pci_ops =3D=3D raw_ext_p=
ci_ops for the case when the latter is preferred, and dispense with the con=
ditionals in the use path? Similarly, raw_ext_pci_ops could be pointed to e=
rror routines instead of left at NULL=2E
>
>I understood from Ajay that the initialization of raw_ext_pci_ops can be
>done after the hypervisor initialization takes place, so doing what exact=
ly
>what you proposed by is not possible=2E It can probably be resolved, but =
I do
>not think the end result would be simpler or cleaner=2E I think that the =
=E2=80=9Cbug=E2=80=9D
>solution really conveys the behavior=2E
>
>IIUC performance would not be noticeable affected by 2 more conditional
>branches=2E
>
>

Isn't that exactly what you would want?!?

