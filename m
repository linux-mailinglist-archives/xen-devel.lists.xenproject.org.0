Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB4A5F3778
	for <lists+xen-devel@lfdr.de>; Mon,  3 Oct 2022 23:07:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415029.659502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofSeq-0005Za-8t; Mon, 03 Oct 2022 21:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415029.659502; Mon, 03 Oct 2022 21:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofSeq-0005XJ-5y; Mon, 03 Oct 2022 21:07:24 +0000
Received: by outflank-mailman (input) for mailman id 415029;
 Mon, 03 Oct 2022 21:07:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGPN=2E=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1ofSep-0005XB-12
 for xen-devel@lists.xenproject.org; Mon, 03 Oct 2022 21:07:23 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dc83b03-435f-11ed-9377-c1cf23e5d27e;
 Mon, 03 Oct 2022 23:07:21 +0200 (CEST)
Received: from [127.0.0.1] ([73.223.250.219]) (authenticated bits=0)
 by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 293L6Wqg3110779
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Mon, 3 Oct 2022 14:06:32 -0700
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
X-Inumbo-ID: 5dc83b03-435f-11ed-9377-c1cf23e5d27e
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 293L6Wqg3110779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2022090501; t=1664831194;
	bh=/JSxe+u/I+83ths9qOEPL2v7hS1kkD9Op8hnO2pWF/o=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=YMkSnoz2p6qaxRZRVV/rarRM/7dMWPEmTHpXZqhrZJdCyWYQCzslmnrSoJpGJWSlK
	 AaVeyGdJiLJSdtH2wOsJodSqAiD2m4eTNG7CXuVQ0K11OPRU4iqSDfdnybIJX+gGIE
	 BeJ45mLJF/zDJTf2JuB87+OIKc6JD+RPZTghSpLRM/txMKBqZrxWuXZ7C9XG3SZ3mn
	 2j7KuTb1xVD4f/3I4EFs06imInAgGfgeYKpH382p6UO+zKrkDmbYcDZcKRDClaZRdZ
	 T1f8dop7bRAYYpbsG4VXCiNXW5zizZOCjg15VlAcuoBgXisNXXM79/6oFYQ8IDzuzo
	 oGgtncUrzhN/g==
Date: Mon, 03 Oct 2022 14:06:30 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Nadav Amit <namit@vmware.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
        Alexander Graf <graf@amazon.com>
CC: Ajay Kaher <akaher@vmware.com>, "x86@kernel.org" <x86@kernel.org>,
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
In-Reply-To: <04F550C5-786A-4B8E-9A88-EBFBD8872F16@vmware.com>
References: <9FEC6622-780D-41E6-B7CA-8D39EDB2C093@vmware.com> <87zgf3pfd1.fsf@redhat.com> <B64FD502-E794-4E94-A267-D690476C57EE@vmware.com> <87tu4l9cfm.fsf@redhat.com> <04F550C5-786A-4B8E-9A88-EBFBD8872F16@vmware.com>
Message-ID: <42CFC548-F8FE-4BD9-89AB-198B2B3F1091@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 3, 2022 10:34:15 AM PDT, Nadav Amit <namit@vmware=2Ecom> wrote:
>On Oct 3, 2022, at 8:03 AM, Vitaly Kuznetsov <vkuznets@redhat=2Ecom> wrot=
e:
>
>> Not my but rather PCI maintainer's call but IMHO dropping 'const' is
>> better, introducing a new global var is our 'last resort' and should be
>> avoided whenever possible=2E Alternatively, you can add a
>> raw_pci_ext_ops_preferred() function checking somethin within 'struct
>> hypervisor_x86' but I'm unsure if it's better=2E
>>=20
>> Also, please check Alex' question/suggestion=2E
>
>Here is my take (and Ajay knows probably more than me):
>
>Looking briefly on MCFG, I do not see a clean way of using the ACPI table=
=2E
>The two options are either to use a reserved field (which who knows, migh=
t
>be used one day) or some OEM ID=2E I am also not familiar with
>PCI_COMMAND=2EMEMORY=3D0, so Ajay can hopefully give some answer about th=
at=2E
>
>Anyhow, I understand (although not relate) to the objection for a new glo=
bal
>variable=2E How about explicitly calling this hardware bug a =E2=80=9Cbug=
=E2=80=9D and using
>the proper infrastructure? Calling it explicitly a bug may even push whoe=
ver
>can to resolve it=2E
>
>IOW, how about doing something along the lines of (not tested):
>
>
>-- >8 --
>
>Subject: [PATCH] x86/PCI: Prefer MMIO over PIO on VMware hypervisor
>
>---
> arch/x86/include/asm/cpufeatures=2Eh | 1 +
> arch/x86/kernel/cpu/common=2Ec       | 2 ++
> arch/x86/kernel/cpu/vmware=2Ec       | 2 ++
> arch/x86/pci/common=2Ec              | 6 ++++--
> 4 files changed, 9 insertions(+), 2 deletions(-)
>
>diff --git a/arch/x86/include/asm/cpufeatures=2Eh b/arch/x86/include/asm/=
cpufeatures=2Eh
>index ef4775c6db01=2E=2E216b6f357b6d 100644
>--- a/arch/x86/include/asm/cpufeatures=2Eh
>+++ b/arch/x86/include/asm/cpufeatures=2Eh
>@@ -460,5 +460,6 @@
> #define X86_BUG_MMIO_UNKNOWN		X86_BUG(26) /* CPU is too old and its MMIO=
 Stale Data status is unknown */
> #define X86_BUG_RETBLEED		X86_BUG(27) /* CPU is affected by RETBleed */
> #define X86_BUG_EIBRS_PBRSB		X86_BUG(28) /* EIBRS is vulnerable to Post =
Barrier RSB Predictions */
>+#define X86_BUG_ECAM_MMIO		X86_BUG(29) /* ECAM MMIO is buggy and PIO is =
preferable */
>=20
> #endif /* _ASM_X86_CPUFEATURES_H */
>diff --git a/arch/x86/kernel/cpu/common=2Ec b/arch/x86/kernel/cpu/common=
=2Ec
>index 3e508f239098=2E=2Ec94175fa304b 100644
>--- a/arch/x86/kernel/cpu/common=2Ec
>+++ b/arch/x86/kernel/cpu/common=2Ec
>@@ -1299,6 +1299,8 @@ static void __init cpu_set_bug_bits(struct cpuinfo_=
x86 *c)
> {
> 	u64 ia32_cap =3D x86_read_arch_cap_msr();
>=20
>+	setup_force_cpu_bug(X86_BUG_ECAM_MMIO);
>+
> 	/* Set ITLB_MULTIHIT bug if cpu is not in the whitelist and not mitigat=
ed */
> 	if (!cpu_matches(cpu_vuln_whitelist, NO_ITLB_MULTIHIT) &&
> 	    !(ia32_cap & ARCH_CAP_PSCHANGE_MC_NO))
>diff --git a/arch/x86/kernel/cpu/vmware=2Ec b/arch/x86/kernel/cpu/vmware=
=2Ec
>index 02039ec3597d=2E=2E8903776284a6 100644
>--- a/arch/x86/kernel/cpu/vmware=2Ec
>+++ b/arch/x86/kernel/cpu/vmware=2Ec
>@@ -385,6 +385,8 @@ static void __init vmware_set_capabilities(void)
> 		setup_force_cpu_cap(X86_FEATURE_VMCALL);
> 	else if (vmware_hypercall_mode =3D=3D CPUID_VMWARE_FEATURES_ECX_VMMCALL=
)
> 		setup_force_cpu_cap(X86_FEATURE_VMW_VMMCALL);
>+
>+	setup_clear_cpu_cap(X86_BUG_ECAM_MMIO);
> }
>=20
> static void __init vmware_platform_setup(void)
>diff --git a/arch/x86/pci/common=2Ec b/arch/x86/pci/common=2Ec
>index ddb798603201=2E=2Ebc81cf4c1014 100644
>--- a/arch/x86/pci/common=2Ec
>+++ b/arch/x86/pci/common=2Ec
>@@ -40,7 +40,8 @@ const struct pci_raw_ops *__read_mostly raw_pci_ext_ops=
;
> int raw_pci_read(unsigned int domain, unsigned int bus, unsigned int dev=
fn,
> 						int reg, int len, u32 *val)
> {
>-	if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>+	if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
>+	    (boot_cpu_has_bug(X86_BUG_ECAM_MMIO) || !raw_pci_ext_ops))
> 		return raw_pci_ops->read(domain, bus, devfn, reg, len, val);
> 	if (raw_pci_ext_ops)
> 		return raw_pci_ext_ops->read(domain, bus, devfn, reg, len, val);
>@@ -50,7 +51,8 @@ int raw_pci_read(unsigned int domain, unsigned int bus,=
 unsigned int devfn,
> int raw_pci_write(unsigned int domain, unsigned int bus, unsigned int de=
vfn,
> 						int reg, int len, u32 val)
> {
>-	if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>+	if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
>+	    (boot_cpu_has_bug(X86_BUG_ECAM_MMIO) || !raw_pci_ext_ops))
> 		return raw_pci_ops->write(domain, bus, devfn, reg, len, val);
> 	if (raw_pci_ext_ops)
> 		return raw_pci_ext_ops->write(domain, bus, devfn, reg, len, val);

Also=2E=2E=2E any reason we can't just set raw_pci_ops =3D=3D raw_ext_pci_=
ops for the case when the latter is preferred, and dispense with the condit=
ionals in the use path? Similarly, raw_ext_pci_ops could be pointed to erro=
r routines instead of left at NULL=2E

