Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A01DF89730C
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 16:50:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700581.1093949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs1wo-0006sm-Qz; Wed, 03 Apr 2024 14:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700581.1093949; Wed, 03 Apr 2024 14:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs1wo-0006pZ-O4; Wed, 03 Apr 2024 14:50:42 +0000
Received: by outflank-mailman (input) for mailman id 700581;
 Wed, 03 Apr 2024 14:50:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AQ6p=LI=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rs1wm-0006pR-PT
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 14:50:41 +0000
Received: from wfout2-smtp.messagingengine.com
 (wfout2-smtp.messagingengine.com [64.147.123.145])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 868cc865-f1c9-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 16:50:35 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfout.west.internal (Postfix) with ESMTP id DE4AB1C0009F
 for <xen-devel@lists.xenproject.org>; Wed,  3 Apr 2024 10:50:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 03 Apr 2024 10:50:33 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Wed, 3 Apr 2024 10:50:31 -0400 (EDT)
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
X-Inumbo-ID: 868cc865-f1c9-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1712155832; x=1712242232; bh=4g+7bPQOfA
	YKqMKxVpd9Z2m4hrL776+scGWIJbXc8kQ=; b=CmLwE97aB9XRBi5vf+TzyeYvA0
	JHlprSQ+68KHUW4yhnveFtuS9x5flEr2MU2eOKrNxQrxlpGHrJ+QP9/PeRONTm/k
	XxJkZmocI6i9+BvridSX798p73mFrhT0cGw0VmJSxFdWcWlOWDxD0s+sWim+t5tO
	3T0yJQzc3VC83Vx+bROa4UO2XUIubtHckjx6tEvKrh3jIkjVjV7RxiUzpd06mLni
	qcbfQ0d/OEVOan4uP0WnGySKdxeckxFIhfX8s7qFS9bvqwBvD94mFcQZjhpWoj9f
	wn+bRMkoB5+g7SEX+CV+OmEh3NR9rN6wjec/Nlr+na0CIzaJvVwV7+IMFlcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1712155832; x=1712242232; bh=4g+7bPQOfAYKqMKxVpd9Z2m4hrL776+scGW
	IJbXc8kQ=; b=KsXKLeWtNVOopPnfgs+4OyUkvrsNjaGwWG37ZTEKlsVS5jaOtDM
	8N+JV8IU1GldSXmnFNwpaPUzwfrB+ZO9Fj4s03LaFZT3GQoSJPEiEGy7BEQOISCd
	yFCibBuCjiO/sKkkNH9W4MGOTJv2r9OGnqJ7iRT038W8NsHZ3x/qIsF3AsUSavWq
	wJjavmQ7pwIrVkKp6OCKH32MdD75YmBDhyQAXw+w3mcKoxC6Mj0jo3xWE4B6EbMB
	9yltIFUMKgGOLu8pjj3MYYZhWgAs7FNCqV8m+GPAkcDByRx/S9jpxoCzMD39Afq+
	iImKilSkPqm/QUGqDcJYZxPbuqfudRNwHEg==
X-ME-Sender: <xms:uGwNZuvsBgV65aXGl_wGqZtqr0-kPCVN9MtTX-1YShQJWMJ8d3h1Gg>
    <xme:uGwNZjceaNfAQHFj90d7Uw0ybcSVdREHRbNlOwqFx2vBr8yYiMUFy0JftUgm-kqLN
    irbYTsxT4eQ_g>
X-ME-Received: <xmr:uGwNZpyfjsZRLOQNWg99SkIkD9MjB9y-PY2GMNQMZi11gCO886zS0ZFV-r6Wq9rP2DVHX1HBZeDZ7NLpiv5tZpDcgB3PlRzNjw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudefiedgfeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
    dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
    uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnheptddugfetudevudeiveevgfetueejlefggffghffhhfehtdff
    feefgfduueegfefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtgho
    mh
X-ME-Proxy: <xmx:uGwNZpOJ016miEEfoP86IywXLUG9A_kmtxaNOIHL6pI7yWFiLXHa8w>
    <xmx:uGwNZu9pc_csOjVfqXLvC4oEuGwC8SjSTMqfZH9DUM4_VgQCNqA8EQ>
    <xmx:uGwNZhVxi3iNXNBgKl0b9Z0SEhDB9EDjXZYZaIkCSzepjIHP-ZqkAQ>
    <xmx:uGwNZneV8YKiGcLj6iPwQ8EEafMcbai8qZ_vhB2hAWnbIUmuPpPI_g>
    <xmx:uGwNZkkUTeb9fCZiGledNetdan6hEGiWI3wDZYEgg-gVqn2070RbK51t>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 3 Apr 2024 16:50:26 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: text-tsx fails on Intel core 8th gen system
Message-ID: <Zg1stUacaDBkyDOn@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YCx7vPl74WDCt3ha"
Content-Disposition: inline


--YCx7vPl74WDCt3ha
Content-Type: multipart/mixed; protected-headers=v1;
	boundary="jMdFqUts9bFZM2Fb"
Content-Disposition: inline
Date: Wed, 3 Apr 2024 16:50:26 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: text-tsx fails on Intel core 8th gen system


--jMdFqUts9bFZM2Fb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I've noticed that tools/tests/tsx/test-tsx fails on a system with Intel
Core i7-8750H. Specific error I get:

    [user@dom0 tsx]$ ./test-tsx=20
    TSX tests
      Got 16 CPUs
    Testing MSR_TSX_FORCE_ABORT consistency
      CPU0 val 0
    Testing MSR_TSX_CTRL consistency
    Testing MSR_MCU_OPT_CTRL consistency
      CPU0 val 0
    Testing RTM behaviour
      Got #UD
      Host reports RTM, but appears unavailable
    Testing PV default/max policies
      Max: RTM 1, HLE 1, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTRL 0
      Def: RTM 0, HLE 0, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTRL 0
      HLE/RTM offered to guests despite not being available
    Testing HVM default/max policies
      Max: RTM 1, HLE 1, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTRL 0
      Def: RTM 0, HLE 0, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTRL 0
      HLE/RTM offered to guests despite not being available
    Testing PV guest
      Created d8
      Cur: RTM 0, HLE 0, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTRL 0
      Cur: RTM 1, HLE 1, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTRL 0
    Testing HVM guest
      Created d9
      Cur: RTM 0, HLE 0, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTRL 0
      Cur: RTM 1, HLE 1, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTRL 0
    [user@dom0 tsx]$ echo $?
    1


When I try it on a newer system (11th gen) then it works fine (exit code
0, just "Got #UD", no "Host reports RTM, but appears unavailable" line).


/proc/cpuinfo says:

    processor	: 0
    vendor_id	: GenuineIntel
    cpu family	: 6
    model		: 158
    model name	: Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
    stepping	: 10
    microcode	: 0xf6
    cpu MHz		: 2207.990
    cache size	: 9216 KB
    physical id	: 0
    siblings	: 6
    core id		: 0
    cpu cores	: 1
    apicid		: 0
    initial apicid	: 0
    fpu		: yes
    fpu_exception	: yes
    cpuid level	: 13
    wp		: yes
    flags		: fpu de tsc msr pae mce cx8 apic sep mca cmov pat clflush acpi =
mmx fxsr sse sse2 ss ht syscall nx rdtscp lm constant_tsc rep_good nopl non=
stop_tsc cpuid tsc_known_freq pni pclmulqdq monitor est ssse3 fma cx16 sse4=
_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dn=
owprefetch cpuid_fault ssbd ibrs ibpb stibp fsgsbase bmi1 avx2 bmi2 erms rd=
seed adx clflushopt xsaveopt xsavec xgetbv1 md_clear arch_capabilities
    bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds s=
wapgs itlb_multihit srbds mmio_stale_data retbleed
    bogomips	: 4415.98
    clflush size	: 64
    cache_alignment	: 64
    address sizes	: 39 bits physical, 48 bits virtual
    power management:

    ...


Full `xen-cpuid detail` output attached.

Just in case, I'm attaching also full xl dmesg, but I don't see anything
related there.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--jMdFqUts9bFZM2Fb
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="xen-cpuid.txt"
Content-Transfer-Encoding: quoted-printable

nr_features: 18

Static sets:
Known                           bfebfbff:fffef3ff:ee500800:2469bfff:0000000=
f:ffbfffff:3a405fdf:00000780:779fd205:fc91ef1c:00001c30:38000144:00000001:0=
0000037:00000000:00040000:1fbeffff:00000000
  [00] CPUID 0x00000001.edx     fpu vme de pse tsc msr pae mce cx8 apic sys=
enter mtrr pge mca cmov pat pse36 clflush ds acpi mmx fxsr sse sse2 ss htt =
tm pbe
  [01] CPUID 0x00000001.ecx     sse3 pclmulqdq dtes64 monitor ds-cpl vmx sm=
x est tm2 ssse3 fma cx16 xtpr pdcm pcid dca sse41 sse42 x2apic movebe popcn=
t tsc-dl aesni xsave osxsave avx f16c rdrnd hyper
  [02] CPUID 0x80000001.edx     syscall nx mmx+ fxsr+ pg1g rdtscp lm 3dnow+=
 3dnow
  [03] CPUID 0x80000001.ecx     lahf-lm cmp svm extapic cr8d lzcnt sse4a ms=
se 3dnowpf osvw ibs xop skinit wdt lwp fma4 nodeid tbm topoext dbx monitorx
  [04] CPUID 0x0000000d:1.eax   xsaveopt xsavec xgetbv1 xsaves
  [05] CPUID 0x00000007:0.ebx   fsgsbase tsc-adj sgx bmi1 hle avx2 fdp-exn =
smep bmi2 erms invpcid rtm pqm depfpp mpx pqe avx512f avx512dq rdseed adx s=
map avx512-ifma clflushopt clwb proc-trace avx512pf avx512er avx512cd sha a=
vx512bw avx512vl
  [06] CPUID 0x00000007:0.ecx   prefetchwt1 avx512-vbmi umip pku ospke avx5=
12-vbmi2 cet-ss gfni vaes vpclmulqdq avx512-vnni avx512-bitalg avx512-vpopc=
ntdq rdpid cldemote movdiri movdir64b enqcmd
  [07] CPUID 0x80000007.edx     hw-pstate itsc cpb efro
  [08] CPUID 0x80000008.ebx     clzero rstr-fp-err-ptrs wbnoinvd ibpb ibrs =
amd-stibp ibrs-always stibp-always ibrs-fast ibrs-same-mode no-lmsl ppin am=
d-ssbd virt-ssbd ssb-no psfd btc-no ibpb-ret
  [09] CPUID 0x00000007:0.edx   avx512-4vnniw avx512-4fmaps fsrm avx512-vp2=
intersect srbds-ctrl md-clear rtm-always-abort tsx-force-abort serialize hy=
brid tsxldtrk cet-ibt avx512-fp16 ibrsb stibp l1d-flush arch-caps core-caps=
 ssbd
  [10] CPUID 0x00000007:1.eax   avx-vnni avx512-bf16 fzrm fsrs fsrcs
  [11] CPUID 0x80000021.eax     lfence+ nscb auto-ibrs sbpb ibpb-brtype srs=
o-no
  [12] CPUID 0x00000007:1.ebx   ppin
  [13] CPUID 0x00000007:2.edx   intel-psfd ipred-ctrl rrsba-ctrl bhi-ctrl m=
cdt-no
  [14] CPUID 0x00000007:1.ecx =20
  [15] CPUID 0x00000007:1.edx   cet-sss
  [16] MSR_ARCH_CAPS.lo         rdcl-no eibrs rsba skip-l1dfl intel-ssb-no =
mds-no if-pschange-mc-no tsx-ctrl taa-no mcu-ctrl misc-pkg-ctrl energy-ctrl=
 doitm sbdr-ssdp-no fbsdp-no psdp-no fb-clear fb-clear-ctrl rrsba bhi-no xa=
pic-status ovrclk-status pbrsb-no gds-ctrl gds-no rfds-no rfds-clear
  [17] MSR_ARCH_CAPS.hi       =20
Special                         10000200:c8200000:00000000:00000002:0000000=
0:01002850:00000010:00000000:02000000:20000c00:00000000:00000000:00000000:0=
0000000:00000000:00000000:100a0004:00000000
  [00] CPUID 0x00000001.edx     apic htt
  [01] CPUID 0x00000001.ecx     x2apic osxsave rdrnd hyper
  [02] CPUID 0x80000001.edx   =20
  [03] CPUID 0x80000001.ecx     cmp
  [04] CPUID 0x0000000d:1.eax =20
  [05] CPUID 0x00000007:0.ebx   hle fdp-exn rtm depfpp clwb
  [06] CPUID 0x00000007:0.ecx   ospke
  [07] CPUID 0x80000007.edx   =20
  [08] CPUID 0x80000008.ebx     virt-ssbd
  [09] CPUID 0x00000007:0.edx   md-clear rtm-always-abort arch-caps
  [10] CPUID 0x00000007:1.eax =20
  [11] CPUID 0x80000021.eax   =20
  [12] CPUID 0x00000007:1.ebx =20
  [13] CPUID 0x00000007:2.edx =20
  [14] CPUID 0x00000007:1.ecx =20
  [15] CPUID 0x00000007:1.edx =20
  [16] MSR_ARCH_CAPS.lo         rsba fb-clear rrsba rfds-clear
  [17] MSR_ARCH_CAPS.hi       =20
PV Max                          1fc9cbf5:f6f83203:ea500800:042109e3:0000000=
7:fdaf0b39:1a405f43:00000100:64001005:ac01451c:00001c30:38000044:00000000:0=
0000021:00000000:00000000:1d12e173:00000000
  [00] CPUID 0x00000001.edx     fpu de tsc msr pae mce cx8 apic sysenter mc=
a cmov pat clflush acpi mmx fxsr sse sse2 ss htt
  [01] CPUID 0x00000001.ecx     sse3 pclmulqdq ssse3 fma cx16 sse41 sse42 x=
2apic movebe popcnt aesni xsave avx f16c rdrnd hyper
  [02] CPUID 0x80000001.edx     syscall nx mmx+ fxsr+ rdtscp lm 3dnow+ 3dnow
  [03] CPUID 0x80000001.ecx     lahf-lm cmp lzcnt sse4a msse 3dnowpf xop fm=
a4 tbm dbx
  [04] CPUID 0x0000000d:1.eax   xsaveopt xsavec xgetbv1
  [05] CPUID 0x00000007:0.ebx   fsgsbase bmi1 hle avx2 bmi2 erms rtm avx512=
f avx512dq rdseed adx avx512-ifma clflushopt clwb avx512pf avx512er avx512c=
d sha avx512bw avx512vl
  [06] CPUID 0x00000007:0.ecx   prefetchwt1 avx512-vbmi avx512-vbmi2 gfni v=
aes vpclmulqdq avx512-vnni avx512-bitalg avx512-vpopcntdq rdpid cldemote mo=
vdiri movdir64b
  [07] CPUID 0x80000007.edx     itsc
  [08] CPUID 0x80000008.ebx     clzero rstr-fp-err-ptrs ibpb ssb-no btc-no =
ibpb-ret
  [09] CPUID 0x00000007:0.edx   avx512-4vnniw avx512-4fmaps fsrm avx512-vp2=
intersect md-clear serialize tsxldtrk ibrsb stibp arch-caps ssbd
  [10] CPUID 0x00000007:1.eax   avx-vnni avx512-bf16 fzrm fsrs fsrcs
  [11] CPUID 0x80000021.eax     lfence+ nscb sbpb ibpb-brtype srso-no
  [12] CPUID 0x00000007:1.ebx =20
  [13] CPUID 0x00000007:2.edx   intel-psfd mcdt-no
  [14] CPUID 0x00000007:1.ecx =20
  [15] CPUID 0x00000007:1.edx =20
  [16] MSR_ARCH_CAPS.lo         rdcl-no eibrs intel-ssb-no mds-no if-pschan=
ge-mc-no taa-no sbdr-ssdp-no fbsdp-no psdp-no fb-clear bhi-no pbrsb-no gds-=
no rfds-no rfds-clear
  [17] MSR_ARCH_CAPS.hi       =20
PV Default                      1fc9cbf5:f6f83203:ea500800:042109e3:0000000=
7:fdaf0b29:02405f43:00000000:64001005:ac00441c:00001c30:38000044:00000000:0=
0000021:00000000:00000000:1d12e173:00000000
  [00] CPUID 0x00000001.edx     fpu de tsc msr pae mce cx8 apic sysenter mc=
a cmov pat clflush acpi mmx fxsr sse sse2 ss htt
  [01] CPUID 0x00000001.ecx     sse3 pclmulqdq ssse3 fma cx16 sse41 sse42 x=
2apic movebe popcnt aesni xsave avx f16c rdrnd hyper
  [02] CPUID 0x80000001.edx     syscall nx mmx+ fxsr+ rdtscp lm 3dnow+ 3dnow
  [03] CPUID 0x80000001.ecx     lahf-lm cmp lzcnt sse4a msse 3dnowpf xop fm=
a4 tbm dbx
  [04] CPUID 0x0000000d:1.eax   xsaveopt xsavec xgetbv1
  [05] CPUID 0x00000007:0.ebx   fsgsbase bmi1 avx2 bmi2 erms rtm avx512f av=
x512dq rdseed adx avx512-ifma clflushopt clwb avx512pf avx512er avx512cd sh=
a avx512bw avx512vl
  [06] CPUID 0x00000007:0.ecx   prefetchwt1 avx512-vbmi avx512-vbmi2 gfni v=
aes vpclmulqdq avx512-vnni avx512-bitalg avx512-vpopcntdq rdpid cldemote
  [07] CPUID 0x80000007.edx   =20
  [08] CPUID 0x80000008.ebx     clzero rstr-fp-err-ptrs ibpb ssb-no btc-no =
ibpb-ret
  [09] CPUID 0x00000007:0.edx   avx512-4vnniw avx512-4fmaps fsrm md-clear s=
erialize ibrsb stibp arch-caps ssbd
  [10] CPUID 0x00000007:1.eax   avx-vnni avx512-bf16 fzrm fsrs fsrcs
  [11] CPUID 0x80000021.eax     lfence+ nscb sbpb ibpb-brtype srso-no
  [12] CPUID 0x00000007:1.ebx =20
  [13] CPUID 0x00000007:2.edx   intel-psfd mcdt-no
  [14] CPUID 0x00000007:1.ecx =20
  [15] CPUID 0x00000007:1.edx =20
  [16] MSR_ARCH_CAPS.lo         rdcl-no eibrs intel-ssb-no mds-no if-pschan=
ge-mc-no taa-no sbdr-ssdp-no fbsdp-no psdp-no fb-clear bhi-no pbrsb-no gds-=
no rfds-no rfds-clear
  [17] MSR_ARCH_CAPS.hi       =20
HVM Shadow Max                  1fcbfbff:f7f83203:ea500800:042109f3:0000000=
f:fdbf4bbb:1a405f47:00000100:751fd005:bc01451c:00001c30:38000044:00000000:0=
0000021:00000000:00000000:1d12e173:00000000
  [00] CPUID 0x00000001.edx     fpu vme de pse tsc msr pae mce cx8 apic sys=
enter mtrr pge mca cmov pat pse36 clflush acpi mmx fxsr sse sse2 ss htt
  [01] CPUID 0x00000001.ecx     sse3 pclmulqdq ssse3 fma cx16 sse41 sse42 x=
2apic movebe popcnt tsc-dl aesni xsave avx f16c rdrnd hyper
  [02] CPUID 0x80000001.edx     syscall nx mmx+ fxsr+ rdtscp lm 3dnow+ 3dnow
  [03] CPUID 0x80000001.ecx     lahf-lm cmp cr8d lzcnt sse4a msse 3dnowpf x=
op fma4 tbm dbx
  [04] CPUID 0x0000000d:1.eax   xsaveopt xsavec xgetbv1 xsaves
  [05] CPUID 0x00000007:0.ebx   fsgsbase tsc-adj bmi1 hle avx2 smep bmi2 er=
ms rtm mpx avx512f avx512dq rdseed adx smap avx512-ifma clflushopt clwb avx=
512pf avx512er avx512cd sha avx512bw avx512vl
  [06] CPUID 0x00000007:0.ecx   prefetchwt1 avx512-vbmi umip avx512-vbmi2 g=
fni vaes vpclmulqdq avx512-vnni avx512-bitalg avx512-vpopcntdq rdpid cldemo=
te movdiri movdir64b
  [07] CPUID 0x80000007.edx     itsc
  [08] CPUID 0x80000008.ebx     clzero rstr-fp-err-ptrs ibpb ibrs amd-stibp=
 ibrs-always stibp-always ibrs-fast ibrs-same-mode no-lmsl amd-ssbd ssb-no =
psfd btc-no ibpb-ret
  [09] CPUID 0x00000007:0.edx   avx512-4vnniw avx512-4fmaps fsrm avx512-vp2=
intersect md-clear serialize tsxldtrk ibrsb stibp l1d-flush arch-caps ssbd
  [10] CPUID 0x00000007:1.eax   avx-vnni avx512-bf16 fzrm fsrs fsrcs
  [11] CPUID 0x80000021.eax     lfence+ nscb sbpb ibpb-brtype srso-no
  [12] CPUID 0x00000007:1.ebx =20
  [13] CPUID 0x00000007:2.edx   intel-psfd mcdt-no
  [14] CPUID 0x00000007:1.ecx =20
  [15] CPUID 0x00000007:1.edx =20
  [16] MSR_ARCH_CAPS.lo         rdcl-no eibrs intel-ssb-no mds-no if-pschan=
ge-mc-no taa-no sbdr-ssdp-no fbsdp-no psdp-no fb-clear bhi-no pbrsb-no gds-=
no rfds-no rfds-clear
  [17] MSR_ARCH_CAPS.hi       =20
HVM Shadow Default              1fcbfbff:f7f83203:ea500800:042109f3:0000000=
f:fdbf0bab:02405f47:00000000:751fd005:bc00441c:00001c30:38000044:00000000:0=
0000021:00000000:00000000:1d12e173:00000000
  [00] CPUID 0x00000001.edx     fpu vme de pse tsc msr pae mce cx8 apic sys=
enter mtrr pge mca cmov pat pse36 clflush acpi mmx fxsr sse sse2 ss htt
  [01] CPUID 0x00000001.ecx     sse3 pclmulqdq ssse3 fma cx16 sse41 sse42 x=
2apic movebe popcnt tsc-dl aesni xsave avx f16c rdrnd hyper
  [02] CPUID 0x80000001.edx     syscall nx mmx+ fxsr+ rdtscp lm 3dnow+ 3dnow
  [03] CPUID 0x80000001.ecx     lahf-lm cmp cr8d lzcnt sse4a msse 3dnowpf x=
op fma4 tbm dbx
  [04] CPUID 0x0000000d:1.eax   xsaveopt xsavec xgetbv1 xsaves
  [05] CPUID 0x00000007:0.ebx   fsgsbase tsc-adj bmi1 avx2 smep bmi2 erms r=
tm avx512f avx512dq rdseed adx smap avx512-ifma clflushopt clwb avx512pf av=
x512er avx512cd sha avx512bw avx512vl
  [06] CPUID 0x00000007:0.ecx   prefetchwt1 avx512-vbmi umip avx512-vbmi2 g=
fni vaes vpclmulqdq avx512-vnni avx512-bitalg avx512-vpopcntdq rdpid cldemo=
te
  [07] CPUID 0x80000007.edx   =20
  [08] CPUID 0x80000008.ebx     clzero rstr-fp-err-ptrs ibpb ibrs amd-stibp=
 ibrs-always stibp-always ibrs-fast ibrs-same-mode no-lmsl amd-ssbd ssb-no =
psfd btc-no ibpb-ret
  [09] CPUID 0x00000007:0.edx   avx512-4vnniw avx512-4fmaps fsrm md-clear s=
erialize ibrsb stibp l1d-flush arch-caps ssbd
  [10] CPUID 0x00000007:1.eax   avx-vnni avx512-bf16 fzrm fsrs fsrcs
  [11] CPUID 0x80000021.eax     lfence+ nscb sbpb ibpb-brtype srso-no
  [12] CPUID 0x00000007:1.ebx =20
  [13] CPUID 0x00000007:2.edx   intel-psfd mcdt-no
  [14] CPUID 0x00000007:1.ecx =20
  [15] CPUID 0x00000007:1.edx =20
  [16] MSR_ARCH_CAPS.lo         rdcl-no eibrs intel-ssb-no mds-no if-pschan=
ge-mc-no taa-no sbdr-ssdp-no fbsdp-no psdp-no fb-clear bhi-no pbrsb-no gds-=
no rfds-no rfds-clear
  [17] MSR_ARCH_CAPS.hi       =20
HVM Hap Max                     1fcbfbff:f7fa3223:ee500800:042109f7:0000000=
f:fdbf4fbb:1a405f4f:00000100:751fd005:bc01451c:00001c30:38000044:00000000:0=
0000021:00000000:00000000:1d12e173:00000000
  [00] CPUID 0x00000001.edx     fpu vme de pse tsc msr pae mce cx8 apic sys=
enter mtrr pge mca cmov pat pse36 clflush acpi mmx fxsr sse sse2 ss htt
  [01] CPUID 0x00000001.ecx     sse3 pclmulqdq vmx ssse3 fma cx16 pcid sse4=
1 sse42 x2apic movebe popcnt tsc-dl aesni xsave avx f16c rdrnd hyper
  [02] CPUID 0x80000001.edx     syscall nx mmx+ fxsr+ pg1g rdtscp lm 3dnow+=
 3dnow
  [03] CPUID 0x80000001.ecx     lahf-lm cmp svm cr8d lzcnt sse4a msse 3dnow=
pf xop fma4 tbm dbx
  [04] CPUID 0x0000000d:1.eax   xsaveopt xsavec xgetbv1 xsaves
  [05] CPUID 0x00000007:0.ebx   fsgsbase tsc-adj bmi1 hle avx2 smep bmi2 er=
ms invpcid rtm mpx avx512f avx512dq rdseed adx smap avx512-ifma clflushopt =
clwb avx512pf avx512er avx512cd sha avx512bw avx512vl
  [06] CPUID 0x00000007:0.ecx   prefetchwt1 avx512-vbmi umip pku avx512-vbm=
i2 gfni vaes vpclmulqdq avx512-vnni avx512-bitalg avx512-vpopcntdq rdpid cl=
demote movdiri movdir64b
  [07] CPUID 0x80000007.edx     itsc
  [08] CPUID 0x80000008.ebx     clzero rstr-fp-err-ptrs ibpb ibrs amd-stibp=
 ibrs-always stibp-always ibrs-fast ibrs-same-mode no-lmsl amd-ssbd ssb-no =
psfd btc-no ibpb-ret
  [09] CPUID 0x00000007:0.edx   avx512-4vnniw avx512-4fmaps fsrm avx512-vp2=
intersect md-clear serialize tsxldtrk ibrsb stibp l1d-flush arch-caps ssbd
  [10] CPUID 0x00000007:1.eax   avx-vnni avx512-bf16 fzrm fsrs fsrcs
  [11] CPUID 0x80000021.eax     lfence+ nscb sbpb ibpb-brtype srso-no
  [12] CPUID 0x00000007:1.ebx =20
  [13] CPUID 0x00000007:2.edx   intel-psfd mcdt-no
  [14] CPUID 0x00000007:1.ecx =20
  [15] CPUID 0x00000007:1.edx =20
  [16] MSR_ARCH_CAPS.lo         rdcl-no eibrs intel-ssb-no mds-no if-pschan=
ge-mc-no taa-no sbdr-ssdp-no fbsdp-no psdp-no fb-clear bhi-no pbrsb-no gds-=
no rfds-no rfds-clear
  [17] MSR_ARCH_CAPS.hi       =20
HVM Hap Default                 1fcbfbff:f7fa3203:ee500800:042109f3:0000000=
f:fdbf0fab:02405f4f:00000000:751fd005:bc00441c:00001c30:38000044:00000000:0=
0000021:00000000:00000000:1d12e173:00000000
  [00] CPUID 0x00000001.edx     fpu vme de pse tsc msr pae mce cx8 apic sys=
enter mtrr pge mca cmov pat pse36 clflush acpi mmx fxsr sse sse2 ss htt
  [01] CPUID 0x00000001.ecx     sse3 pclmulqdq ssse3 fma cx16 pcid sse41 ss=
e42 x2apic movebe popcnt tsc-dl aesni xsave avx f16c rdrnd hyper
  [02] CPUID 0x80000001.edx     syscall nx mmx+ fxsr+ pg1g rdtscp lm 3dnow+=
 3dnow
  [03] CPUID 0x80000001.ecx     lahf-lm cmp cr8d lzcnt sse4a msse 3dnowpf x=
op fma4 tbm dbx
  [04] CPUID 0x0000000d:1.eax   xsaveopt xsavec xgetbv1 xsaves
  [05] CPUID 0x00000007:0.ebx   fsgsbase tsc-adj bmi1 avx2 smep bmi2 erms i=
nvpcid rtm avx512f avx512dq rdseed adx smap avx512-ifma clflushopt clwb avx=
512pf avx512er avx512cd sha avx512bw avx512vl
  [06] CPUID 0x00000007:0.ecx   prefetchwt1 avx512-vbmi umip pku avx512-vbm=
i2 gfni vaes vpclmulqdq avx512-vnni avx512-bitalg avx512-vpopcntdq rdpid cl=
demote
  [07] CPUID 0x80000007.edx   =20
  [08] CPUID 0x80000008.ebx     clzero rstr-fp-err-ptrs ibpb ibrs amd-stibp=
 ibrs-always stibp-always ibrs-fast ibrs-same-mode no-lmsl amd-ssbd ssb-no =
psfd btc-no ibpb-ret
  [09] CPUID 0x00000007:0.edx   avx512-4vnniw avx512-4fmaps fsrm md-clear s=
erialize ibrsb stibp l1d-flush arch-caps ssbd
  [10] CPUID 0x00000007:1.eax   avx-vnni avx512-bf16 fzrm fsrs fsrcs
  [11] CPUID 0x80000021.eax     lfence+ nscb sbpb ibpb-brtype srso-no
  [12] CPUID 0x00000007:1.ebx =20
  [13] CPUID 0x00000007:2.edx   intel-psfd mcdt-no
  [14] CPUID 0x00000007:1.ecx =20
  [15] CPUID 0x00000007:1.edx =20
  [16] MSR_ARCH_CAPS.lo         rdcl-no eibrs intel-ssb-no mds-no if-pschan=
ge-mc-no taa-no sbdr-ssdp-no fbsdp-no psdp-no fb-clear bhi-no pbrsb-no gds-=
no rfds-no rfds-clear
  [17] MSR_ARCH_CAPS.hi       =20

Dynamic sets:
Raw                             bfebfbff:7ffafbbf:2c100800:00000121:0000000=
f:029c67af:40000000:00000100:00000000:bc002e00:00000000:00000000:00000000:0=
0000000:00000000:00000000:02000c04:00000000
  [00] CPUID 0x00000001.edx     fpu vme de pse tsc msr pae mce cx8 apic sys=
enter mtrr pge mca cmov pat pse36 clflush ds acpi mmx fxsr sse sse2 ss htt =
tm pbe
  [01] CPUID 0x00000001.ecx     sse3 pclmulqdq dtes64 monitor ds-cpl vmx es=
t tm2 ssse3 sdgb fma cx16 xtpr pdcm pcid sse41 sse42 x2apic movebe popcnt t=
sc-dl aesni xsave osxsave avx f16c rdrnd
  [02] CPUID 0x80000001.edx     syscall nx pg1g rdtscp lm
  [03] CPUID 0x80000001.ecx     lahf-lm lzcnt 3dnowpf
  [04] CPUID 0x0000000d:1.eax   xsaveopt xsavec xgetbv1 xsaves
  [05] CPUID 0x00000007:0.ebx   fsgsbase tsc-adj sgx bmi1 avx2 smep bmi2 er=
ms invpcid depfpp mpx rdseed adx smap clflushopt proc-trace
  [06] CPUID 0x00000007:0.ecx   sgx-lc
  [07] CPUID 0x80000007.edx     itsc
  [08] CPUID 0x80000008.ebx   =20
  [09] CPUID 0x00000007:0.edx   srbds-ctrl md-clear rtm-always-abort tsx-fo=
rce-abort ibrsb stibp l1d-flush arch-caps ssbd
  [10] CPUID 0x00000007:1.eax =20
  [11] CPUID 0x80000021.eax   =20
  [12] CPUID 0x00000007:1.ebx =20
  [13] CPUID 0x00000007:2.edx =20
  [14] CPUID 0x00000007:1.ecx =20
  [15] CPUID 0x00000007:1.edx =20
  [16] MSR_ARCH_CAPS.lo         rsba misc-pkg-ctrl energy-ctrl gds-ctrl
  [17] MSR_ARCH_CAPS.hi       =20
Host                            bfebfbff:77faf3bf:2c100800:00000121:0000000=
f:029c6fbf:00000000:00000100:00000000:bc002e00:00000000:00000000:00000000:0=
0000000:00000000:00000000:0e000c04:00000000
  [00] CPUID 0x00000001.edx     fpu vme de pse tsc msr pae mce cx8 apic sys=
enter mtrr pge mca cmov pat pse36 clflush ds acpi mmx fxsr sse sse2 ss htt =
tm pbe
  [01] CPUID 0x00000001.ecx     sse3 pclmulqdq dtes64 monitor ds-cpl vmx es=
t tm2 ssse3 fma cx16 xtpr pdcm pcid sse41 sse42 x2apic movebe popcnt tsc-dl=
 aesni xsave avx f16c rdrnd
  [02] CPUID 0x80000001.edx     syscall nx pg1g rdtscp lm
  [03] CPUID 0x80000001.ecx     lahf-lm lzcnt 3dnowpf
  [04] CPUID 0x0000000d:1.eax   xsaveopt xsavec xgetbv1 xsaves
  [05] CPUID 0x00000007:0.ebx   fsgsbase tsc-adj sgx bmi1 hle avx2 smep bmi=
2 erms invpcid rtm depfpp mpx rdseed adx smap clflushopt proc-trace
  [06] CPUID 0x00000007:0.ecx =20
  [07] CPUID 0x80000007.edx     itsc
  [08] CPUID 0x80000008.ebx   =20
  [09] CPUID 0x00000007:0.edx   srbds-ctrl md-clear rtm-always-abort tsx-fo=
rce-abort ibrsb stibp l1d-flush arch-caps ssbd
  [10] CPUID 0x00000007:1.eax =20
  [11] CPUID 0x80000021.eax   =20
  [12] CPUID 0x00000007:1.ebx =20
  [13] CPUID 0x00000007:2.edx =20
  [14] CPUID 0x00000007:1.ecx =20
  [15] CPUID 0x00000007:1.edx =20
  [16] MSR_ARCH_CAPS.lo         rsba misc-pkg-ctrl energy-ctrl gds-ctrl gds=
-no rfds-no
  [17] MSR_ARCH_CAPS.hi       =20
PV Default                      1fc9cbf5:f6f83203:28100800:00000121:0000000=
7:008c0329:00000000:00000000:00001000:ac000400:00000000:00000000:00000000:0=
0000000:00000000:00000000:0c000004:00000000
  [00] CPUID 0x00000001.edx     fpu de tsc msr pae mce cx8 apic sysenter mc=
a cmov pat clflush acpi mmx fxsr sse sse2 ss htt
  [01] CPUID 0x00000001.ecx     sse3 pclmulqdq ssse3 fma cx16 sse41 sse42 x=
2apic movebe popcnt aesni xsave avx f16c rdrnd hyper
  [02] CPUID 0x80000001.edx     syscall nx rdtscp lm
  [03] CPUID 0x80000001.ecx     lahf-lm lzcnt 3dnowpf
  [04] CPUID 0x0000000d:1.eax   xsaveopt xsavec xgetbv1
  [05] CPUID 0x00000007:0.ebx   fsgsbase bmi1 avx2 bmi2 erms rdseed adx clf=
lushopt
  [06] CPUID 0x00000007:0.ecx =20
  [07] CPUID 0x80000007.edx   =20
  [08] CPUID 0x80000008.ebx     ibpb
  [09] CPUID 0x00000007:0.edx   md-clear ibrsb stibp arch-caps ssbd
  [10] CPUID 0x00000007:1.eax =20
  [11] CPUID 0x80000021.eax   =20
  [12] CPUID 0x00000007:1.ebx =20
  [13] CPUID 0x00000007:2.edx =20
  [14] CPUID 0x00000007:1.ecx =20
  [15] CPUID 0x00000007:1.edx =20
  [16] MSR_ARCH_CAPS.lo         rsba gds-no rfds-no
  [17] MSR_ARCH_CAPS.hi       =20
HVM Default                     1fcbfbff:f7fa3203:2c100800:00000121:0000000=
f:009c07ab:00000000:00000000:00101000:bc000400:00000000:00000000:00000000:0=
0000000:00000000:00000000:0c000004:00000000
  [00] CPUID 0x00000001.edx     fpu vme de pse tsc msr pae mce cx8 apic sys=
enter mtrr pge mca cmov pat pse36 clflush acpi mmx fxsr sse sse2 ss htt
  [01] CPUID 0x00000001.ecx     sse3 pclmulqdq ssse3 fma cx16 pcid sse41 ss=
e42 x2apic movebe popcnt tsc-dl aesni xsave avx f16c rdrnd hyper
  [02] CPUID 0x80000001.edx     syscall nx pg1g rdtscp lm
  [03] CPUID 0x80000001.ecx     lahf-lm lzcnt 3dnowpf
  [04] CPUID 0x0000000d:1.eax   xsaveopt xsavec xgetbv1 xsaves
  [05] CPUID 0x00000007:0.ebx   fsgsbase tsc-adj bmi1 avx2 smep bmi2 erms i=
nvpcid rdseed adx smap clflushopt
  [06] CPUID 0x00000007:0.ecx =20
  [07] CPUID 0x80000007.edx   =20
  [08] CPUID 0x80000008.ebx     ibpb no-lmsl
  [09] CPUID 0x00000007:0.edx   md-clear ibrsb stibp l1d-flush arch-caps ss=
bd
  [10] CPUID 0x00000007:1.eax =20
  [11] CPUID 0x80000021.eax   =20
  [12] CPUID 0x00000007:1.ebx =20
  [13] CPUID 0x00000007:2.edx =20
  [14] CPUID 0x00000007:1.ecx =20
  [15] CPUID 0x00000007:1.edx =20
  [16] MSR_ARCH_CAPS.lo         rsba gds-no rfds-no
  [17] MSR_ARCH_CAPS.hi       =20
PV Max                          1fc9cbf5:f6f83203:28100800:00000121:0000000=
7:008c0b39:00000000:00000100:00001000:ac000400:00000000:00000000:00000000:0=
0000000:00000000:00000000:1c020004:00000000
  [00] CPUID 0x00000001.edx     fpu de tsc msr pae mce cx8 apic sysenter mc=
a cmov pat clflush acpi mmx fxsr sse sse2 ss htt
  [01] CPUID 0x00000001.ecx     sse3 pclmulqdq ssse3 fma cx16 sse41 sse42 x=
2apic movebe popcnt aesni xsave avx f16c rdrnd hyper
  [02] CPUID 0x80000001.edx     syscall nx rdtscp lm
  [03] CPUID 0x80000001.ecx     lahf-lm lzcnt 3dnowpf
  [04] CPUID 0x0000000d:1.eax   xsaveopt xsavec xgetbv1
  [05] CPUID 0x00000007:0.ebx   fsgsbase bmi1 hle avx2 bmi2 erms rtm rdseed=
 adx clflushopt
  [06] CPUID 0x00000007:0.ecx =20
  [07] CPUID 0x80000007.edx     itsc
  [08] CPUID 0x80000008.ebx     ibpb
  [09] CPUID 0x00000007:0.edx   md-clear ibrsb stibp arch-caps ssbd
  [10] CPUID 0x00000007:1.eax =20
  [11] CPUID 0x80000021.eax   =20
  [12] CPUID 0x00000007:1.ebx =20
  [13] CPUID 0x00000007:2.edx =20
  [14] CPUID 0x00000007:1.ecx =20
  [15] CPUID 0x00000007:1.edx =20
  [16] MSR_ARCH_CAPS.lo         rsba fb-clear gds-no rfds-no rfds-clear
  [17] MSR_ARCH_CAPS.hi       =20
HVM Max                         1fcbfbff:f7fa3223:2c100800:00000121:0000000=
f:009c4fbb:00000000:00000100:00101000:bc000400:00000000:00000000:00000000:0=
0000000:00000000:00000000:1c020004:00000000
  [00] CPUID 0x00000001.edx     fpu vme de pse tsc msr pae mce cx8 apic sys=
enter mtrr pge mca cmov pat pse36 clflush acpi mmx fxsr sse sse2 ss htt
  [01] CPUID 0x00000001.ecx     sse3 pclmulqdq vmx ssse3 fma cx16 pcid sse4=
1 sse42 x2apic movebe popcnt tsc-dl aesni xsave avx f16c rdrnd hyper
  [02] CPUID 0x80000001.edx     syscall nx pg1g rdtscp lm
  [03] CPUID 0x80000001.ecx     lahf-lm lzcnt 3dnowpf
  [04] CPUID 0x0000000d:1.eax   xsaveopt xsavec xgetbv1 xsaves
  [05] CPUID 0x00000007:0.ebx   fsgsbase tsc-adj bmi1 hle avx2 smep bmi2 er=
ms invpcid rtm mpx rdseed adx smap clflushopt
  [06] CPUID 0x00000007:0.ecx =20
  [07] CPUID 0x80000007.edx     itsc
  [08] CPUID 0x80000008.ebx     ibpb no-lmsl
  [09] CPUID 0x00000007:0.edx   md-clear ibrsb stibp l1d-flush arch-caps ss=
bd
  [10] CPUID 0x00000007:1.eax =20
  [11] CPUID 0x80000021.eax   =20
  [12] CPUID 0x00000007:1.ebx =20
  [13] CPUID 0x00000007:2.edx =20
  [14] CPUID 0x00000007:1.ecx =20
  [15] CPUID 0x00000007:1.edx =20
  [16] MSR_ARCH_CAPS.lo         rsba fb-clear gds-no rfds-no rfds-clear
  [17] MSR_ARCH_CAPS.hi       =20


--jMdFqUts9bFZM2Fb
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="xl-dmesg.txt"
Content-Transfer-Encoding: quoted-printable

(XEN) Built-in command line: ept=3Dexec-sp spec-ctrl=3Dunpriv-mmio
 Xen 4.17.3
(XEN) Xen version 4.17.3 (mockbuild@[unknown]) (gcc (GCC) 12.3.1 20230508 (=
Red Hat 12.3.1-1)) debug=3Dn Tue Mar 12 20:15:53 GMT 2024
(XEN) Latest ChangeSet:=20
(XEN) Bootloader: GRUB 2.06
(XEN) Command line: placeholder console=3Dnone dom0_mem=3Dmin:1024M dom0_me=
m=3Dmax:4096M ucode=3Dscan smt=3Doff gnttab_max_frames=3D2048 gnttab_max_ma=
ptrack_frames=3D4096 no-real-mode edd=3Doff
(XEN) Xen image load base address: 0x49800000
(XEN) Video information:
(XEN)  VGA is graphics mode 1024x768, 32 bpp
(XEN)  VBE/DDC methods: none; EDID transfer time: 0 seconds
(XEN) Disc information:
(XEN)  Found 0 MBR signatures
(XEN)  Found 1 EDD information structures
(XEN) EFI RAM map:
(XEN)  [0000000000000000, 000000000009efff] (usable)
(XEN)  [000000000009f000, 00000000000fffff] (reserved)
(XEN)  [0000000000100000, 000000004a999fff] (usable)
(XEN)  [000000004a99a000, 000000004fa2efff] (reserved)
(XEN)  [000000004fa2f000, 000000004fca9fff] (ACPI NVS)
(XEN)  [000000004fcaa000, 000000004fd0efff] (ACPI data)
(XEN)  [000000004fd0f000, 000000004fd0ffff] (usable)
(XEN)  [000000004fd10000, 0000000059ffffff] (reserved)
(XEN)  [00000000fe010000, 00000000fe010fff] (reserved)
(XEN)  [0000000100000000, 00000002a3ffffff] (usable)
(XEN) ACPI: RSDP 4FD0E014, 0024 (r2 LENOVO)
(XEN) ACPI: XSDT 4FD0C188, 0114 (r1 LENOVO TP-N2C       1510 PTEC        2)
(XEN) ACPI: FACP 4D2EC000, 0114 (r6 LENOVO TP-N2C       1510 PTEC        2)
(XEN) ACPI: DSDT 4D2B9000, 2E277 (r2 LENOVO CFL      20170001 INTL 20160422)
(XEN) ACPI: FACS 4FAE2000, 0040
(XEN) ACPI: SSDT 4D346000, 17DF (r2 LENOVO  CpuSsdt     3000 INTL 20160527)
(XEN) ACPI: SSDT 4D345000, 056D (r2 LENOVO    CtdpB     1000 INTL 20160527)
(XEN) ACPI: SSDT 4D30B000, 4310 (r2 LENOVO DptfTabl     1000 INTL 20160527)
(XEN) ACPI: SSDT 4D2F5000, 3189 (r2 LENOVO  SaSsdt      3000 INTL 20160527)
(XEN) ACPI: SSDT 4D2F2000, 2A8B (r2 LENOVO  PegSsdt     1000 INTL 20160527)
(XEN) ACPI: SSDT 4D2F1000, 0612 (r2 LENOVO Tpm2Tabl     1000 INTL 20160527)
(XEN) ACPI: TPM2 4D2F0000, 0034 (r4 LENOVO TP-N2C       1510 PTEC        2)
(XEN) ACPI: UEFI 4FB03000, 0042 (r1 LENOVO TP-N2C       1510 PTEC        2)
(XEN) ACPI: SSDT 4D2ED000, 0530 (r2 LENOVO PerfTune     1000 INTL 20160527)
(XEN) ACPI: HPET 4D2EB000, 0038 (r1 LENOVO TP-N2C       1510 PTEC        2)
(XEN) ACPI: APIC 4D2EA000, 012C (r3 LENOVO TP-N2C       1510 PTEC        2)
(XEN) ACPI: MCFG 4D2E9000, 003C (r1 LENOVO TP-N2C       1510 PTEC        2)
(XEN) ACPI: ECDT 4D2E8000, 0053 (r1 LENOVO TP-N2C       1510 PTEC        2)
(XEN) ACPI: SSDT 4D2B7000, 1A92 (r2 LENOVO ProjSsdt       10 INTL 20160527)
(XEN) ACPI: NHLT 4D2B5000, 1771 (r0 LENOVO TP-N2C       1510 PTEC        2)
(XEN) ACPI: BOOT 4D2B4000, 0028 (r1 LENOVO TP-N2C       1510 PTEC        2)
(XEN) ACPI: SSDT 4D2B3000, 0FA2 (r2 LENOVO UsbCTabl     1000 INTL 20160527)
(XEN) ACPI: LPIT 4D2B2000, 005C (r1 LENOVO TP-N2C       1510 PTEC        2)
(XEN) ACPI: WSMT 4D2B1000, 0028 (r1 LENOVO TP-N2C       1510 PTEC        2)
(XEN) ACPI: SSDT 4D2AF000, 149F (r2 LENOVO TbtTypeC        0 INTL 20160527)
(XEN) ACPI: DBGP 4D2AE000, 0034 (r1 LENOVO TP-N2C       1510 PTEC        2)
(XEN) ACPI: DBG2 4D2AD000, 0054 (r0 LENOVO TP-N2C       1510 PTEC        2)
(XEN) ACPI: POAT 4D2AC000, 0055 (r3 LENOVO TP-N2C       1510 PTEC        2)
(XEN) ACPI: BATB 4D0CE000, 004A (r2 LENOVO TP-N2C       1510 PTEC        2)
(XEN) ACPI: DMAR 4B2CB000, 0070 (r1 LENOVO TP-N2C       1510 PTEC        2)
(XEN) ACPI: FPDT 4B2CA000, 0034 (r1 LENOVO TP-N2C       1510 PTEC        2)
(XEN) ACPI: BGRT 4B2C9000, 0038 (r1 LENOVO TP-N2C       1510 PTEC        2)
(XEN) ACPI: UEFI 4FADF000, 012A (r1 LENOVO TP-N2C       1510 PTEC        2)
(XEN) ACPI: SSDT 4B2C7000, 1B28 (r1 LENOVO NvOptTbl     1000 INTL 20160527)
(XEN) System RAM: 7913MB (8103144kB)
(XEN) Domain heap initialised
(XEN) ACPI: Invalid sleep control/status register data: 0:0x8:0x3 0:0x8:0x3
(XEN) ACPI: 32/64X FACS address mismatch in FADT - 4fae2000/000000000000000=
0, using 32
(XEN) IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
(XEN) PCI: Not using MCFG for segment 0000 bus 00-ff
(XEN) Switched to APIC driver x2apic_mixed
(XEN) microcode: CPU0 updated from revision 0xf4 to 0xf6, date =3D 2023-07-=
26
(XEN) CPU0: TSC: ratio: 184 / 2
(XEN) CPU0: bus: 100 MHz base: 2200 MHz max: 4100 MHz
(XEN) CPU0: 800 ... 2200 MHz
(XEN) xstate: size: 0x440 and states: 0x1f
(XEN) Speculative mitigation facilities:
(XEN)   Hardware hints: RSBA
(XEN)   Hardware features: IBPB IBRS STIBP SSBD L1D_FLUSH MD_CLEAR SRBDS_CT=
RL GDS_CTRL
(XEN)   Compiled-in support: INDIRECT_THUNK HARDEN_ARRAY HARDEN_BRANCH HARD=
EN_GUEST_ACCESS
(XEN)   Xen settings: BTI-Thunk: JMP, SPEC_CTRL: IBRS+ STIBP+ SSBD-, Other:=
 SRB_LOCK+ IBPB-ctxt L1D_FLUSH VERW BRANCH_HARDEN
(XEN)   L1TF: believed vulnerable, maxphysaddr L1D 46, CPUID 39, Safe addre=
ss 8000000000
(XEN)   Support for HVM VMs: MSR_SPEC_CTRL MSR_VIRT_SPEC_CTRL RSB EAGER_FPU
(XEN)   Support for PV VMs: MSR_SPEC_CTRL EAGER_FPU VERW
(XEN)   XPTI (64-bit PV only): Dom0 enabled, DomU enabled (with PCID)
(XEN)   PV L1TF shadowing: Dom0 disabled, DomU enabled
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Initializing Credit2 scheduler
(XEN) Disabling HPET for being unreliable
(XEN) Platform timer is 3.580MHz ACPI PM Timer
(XEN) Detected 2207.990 MHz processor.
(XEN) Unknown cachability for MFNs 0xa0-0xff
(XEN) Unknown cachability for MFNs 0x58000-0x59fff
(XEN) 0000:00:14.3: unexpected initial MSI-X state (MASKALL=3D0, ENABLE=3D1=
), fixing
(XEN) Intel VT-d iommu 0 supported page sizes: 4kB, 2MB, 1GB
(XEN) Intel VT-d Snoop Control enabled.
(XEN) Intel VT-d Dom0 DMA Passthrough not enabled.
(XEN) Intel VT-d Queued Invalidation enabled.
(XEN) Intel VT-d Interrupt Remapping enabled.
(XEN) Intel VT-d Posted Interrupt not enabled.
(XEN) Intel VT-d Shared EPT tables enabled.
(XEN) I/O virtualisation enabled
(XEN)  - Dom0 mode: Relaxed
(XEN) Interrupt remapping enabled
(XEN) Enabled directed EOI with ioapic_ack_old on!
(XEN) Enabling APIC mode.  Using 1 I/O APICs
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using old ACK method
(XEN) Allocated console ring of 32 KiB.
(XEN) VMX: Supported advanced features:
(XEN)  - APIC MMIO access virtualisation
(XEN)  - APIC TPR shadow
(XEN)  - Extended Page Tables (EPT)
(XEN)  - Virtual-Processor Identifiers (VPID)
(XEN)  - Virtual NMI
(XEN)  - MSR direct-access bitmap
(XEN)  - Unrestricted Guest
(XEN)  - VM Functions
(XEN)  - Virtualisation Exceptions
(XEN)  - Page Modification Logging
(XEN) HVM: ASIDs enabled.
(XEN) HVM: VMX enabled
(XEN) HVM: Hardware Assisted Paging (HAP) detected
(XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB
(XEN) Brought up 6 CPUs
(XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
(XEN) Initializing Credit2 scheduler
(XEN) Dom0 has maximum 952 PIRQs
(XEN)  Xen  kernel: 64-bit, lsb
(XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x5000000
(XEN) PHYSICAL MEMORY ARRANGEMENT:
(XEN)  Dom0 alloc.:   0000000288000000->0000000290000000 (1007276 pages to =
be allocated)
(XEN)  Init. ramdisk: 00000002a1eac000->00000002a3fff5dc
(XEN) VIRTUAL MEMORY ARRANGEMENT:
(XEN)  Loaded kernel: ffffffff81000000->ffffffff85000000
(XEN)  Phys-Mach map: 0000008000000000->0000008000800000
(XEN)  Start info:    ffffffff85000000->ffffffff850004b8
(XEN)  Page tables:   ffffffff85001000->ffffffff8502e000
(XEN)  Boot stack:    ffffffff8502e000->ffffffff8502f000
(XEN)  TOTAL:         ffffffff80000000->ffffffff85400000
(XEN)  ENTRY ADDRESS: ffffffff834fa1c0
(XEN) Dom0 has maximum 6 VCPUs
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: Errors and warnings
(XEN) Guest Loglevel: Nothing (Rate-limited: Errors and warnings)
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 648kB init memory


--jMdFqUts9bFZM2Fb--

--YCx7vPl74WDCt3ha
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmYNbLUACgkQ24/THMrX
1yzeTAf8DubLJXze3PkMkuHgMUYaAb9GdjCR+D57/UKm4/V3mZBQ+yvHBV3D/uAV
SIJK28Ljn8D84dDXZXGu86IadhMauP0HJOrN+7vYUdUYQywnv+iJGz+PPZdBqFV8
r2MX6KWu9pgzoZSeSvgf+M3HDTxtkRwXzIcW+2LOdiENOBYGFQ4JpP+7KSUXdC/4
YRBjuZYL1vgQ5YNb6diIBA//dogZ+fovP9GcAa3G+n38TGBF7U6Ljky4HifQn1JR
q7A7VnuC/rPlLsX2ewYSDYO24ZLj3ANhmMyMlshiETXiMkoLx9cI7Ef92EmVMyYM
rvhDdqc7EMMAWB3Pmba/MXvy/Mp+kA==
=I0hs
-----END PGP SIGNATURE-----

--YCx7vPl74WDCt3ha--

