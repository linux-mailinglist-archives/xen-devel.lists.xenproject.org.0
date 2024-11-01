Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD219B9104
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2024 13:12:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829058.1244125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6qVM-0004ON-UC; Fri, 01 Nov 2024 12:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829058.1244125; Fri, 01 Nov 2024 12:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6qVM-0004LJ-RZ; Fri, 01 Nov 2024 12:11:52 +0000
Received: by outflank-mailman (input) for mailman id 829058;
 Fri, 01 Nov 2024 12:11:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=agMj=R4=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1t6qVL-0004LD-Ek
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2024 12:11:51 +0000
Received: from fout-a6-smtp.messagingengine.com
 (fout-a6-smtp.messagingengine.com [103.168.172.149])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7595e7fa-984a-11ef-a0c5-8be0dac302b0;
 Fri, 01 Nov 2024 13:11:44 +0100 (CET)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfout.phl.internal (Postfix) with ESMTP id 55C34138017A
 for <xen-devel@lists.xenproject.org>; Fri,  1 Nov 2024 08:11:43 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-08.internal (MEProxy); Fri, 01 Nov 2024 08:11:43 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Fri, 1 Nov 2024 08:11:42 -0400 (EDT)
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
X-Inumbo-ID: 7595e7fa-984a-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEwMy4xNjguMTcyLjE0OSIsImhlbG8iOiJmb3V0LWE2LXNtdHAubWVzc2FnaW5nZW5naW5lLmNvbSJ9
X-Custom-Transaction: eyJpZCI6Ijc1OTVlN2ZhLTk4NGEtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNDYzMTA1LjE1ODA5OCwic2VuZGVyIjoibWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1730463103; x=1730549503; bh=MKpRL3VZjJ
	kFBCTUJaPTB8p7s9XNrqglZoNog3NLKHo=; b=SiDx8bISrRGJLKqj/EIKw/V+8i
	NPYr1f+20bDFO0hIAptosw4/vl4dXyjCr81EDUb1rbX8sOJwz93cb/VgBNfzbxNr
	Nb/SCqUBv+dnjPtZFtepWbeMeADHJlJpm/KvVcr+tW+VxP7vJ7O2Iecq99Sid/YZ
	GaaCb+9QRTWg/kYjsvz52WXkp42b7c6+FA9ZxHWVK6zcQMRIO2la07imbVOlOIk8
	0b2Ls68r49diomiuxh4VqYkPWR20NdlH5gggqyXzZD140BeCrUMvJ3zbJuSiD/GP
	wvlZ6Bb5RYZs9fjOeKkuQb6wMZ/hxlNArORq1RGxM+nZZ0MaF6yjnOsXCQCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730463103; x=
	1730549503; bh=MKpRL3VZjJkFBCTUJaPTB8p7s9XNrqglZoNog3NLKHo=; b=G
	0zpU5blxxhPyd1WCF4zcWVAwX9/QrTXIzCXdLTZqWln9h2KUEMv9LrTktpzHvG/4
	ExqwTU/P+Hlh7ldeuDaRrkppjd8PPnYACy4pePXANfm2qrwJ0yOpc8QOK11uomJh
	2SAIl9jVEZsXZfiOQX6XVEVs7M70EyAfxMB4R6R5KM66OQ3PIZymtAxH7VsM5z5a
	bL6NnOPPq4iyMiSTOhpn8pK1ALJ+u3iVpjQQB6hdQ9P1y7hFPEdsiJSf66ScQqlZ
	MJSqEje491DgBSJK320axTjK4I7xOYZSNnD/vuF3t8f2RahbMra4UaNuBCnkjcX/
	13Wt5bpBTZG9bqJWw45jQ==
X-ME-Sender: <xms:fsUkZxSWeWdj6xVju4_auSvPc3Q-kYnCcPc9_Roub4QvFylgLAuX-A>
    <xme:fsUkZ6z6AEbBtyvOMcbQ_of1LW5ZPrD9a5nhydedSaE9Z4Vx_OS5uwd0_T2sXM3VW
    Z_hzR5whwFzwg>
X-ME-Received: <xmr:fsUkZ22bkeU6PdK9bDUHeQdrF5IffAG5TSVM8QjI-ob2nX62UMMDMFZKTQoCKJzPBLUC5VsonMBWYvg0Pi2uapFaaXG0L9ys5Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekledgfeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuf
    fkgggtugesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihs
    khhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteduteeiudevkeegvefhtdekhfel
    gffhhedukedvvdeuuddvjeehvddtieehudfgnecuffhomhgrihhnpehgihhthhhusgdrtg
    homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
    rghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprh
    gtphhtthhopedupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghv
    vghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:f8UkZ5CHAqQQM89c8_OHArmEWc9kMdE10rd9oRi5EU58Bswedk5kpA>
    <xmx:f8UkZ6jc4i98UIQ_mJ7Ho29aYM_I1wVK_olPxGEQ639m-D5517IGOQ>
    <xmx:f8UkZ9p_ndEKepFnXKWzE4G18TbimIxoW_vh6ya-a5IhVBcYz1S5-Q>
    <xmx:f8UkZ1jdghy6c6nefieLyBNMZGrl85J85s6qjjXukTVzDLVNqAlnBw>
    <xmx:f8UkZyLZW1mlYYHXWmH-16L3OaIxRJhYnKSp0GLA1MNmIcvxvCX3UDGI>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 1 Nov 2024 13:11:38 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Dom0 crash (BUG_ON(old_mode != XEN_LAZY_NONE) in enter_lazy()) with
 Linux 6.11.2
Message-ID: <ZyTFfG9i87hQXmwZ@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YvH9IlvQuT5LuzbZ"
Content-Disposition: inline


--YvH9IlvQuT5LuzbZ
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 1 Nov 2024 13:11:38 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Dom0 crash (BUG_ON(old_mode != XEN_LAZY_NONE) in enter_lazy()) with
 Linux 6.11.2

Hi,

I've got a report that starting with 6.11 (specifically 6.11.2) dom0
often crashes on a BUG_ON() like in the subject. I'm not sure where the
issue is - there is i915 all over the stack trace, but in the end it
crashes in a Xen-specific code.

The specific crash:

[10574.642243] ------------[ cut here ]------------
[10574.646891] kernel BUG at arch/x86/include/asm/xen/hypervisor.h:86!
[10574.653372] Oops: invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
[10574.659306] CPU: 4 UID: 0 PID: 7661 Comm: Xorg Tainted: G     U         =
    6.11.2-1.qubes.fc37.x86_64
#1
[10574.669143] Tainted: [U]=3DUSER
[10574.672265] Hardware name: Micro-Star International Co., Ltd. MS-7B79/X4=
70 GAMING PLUS (MS-7B79), BIOS
A.L0 07/25/2022
[10574.683245] RIP: e030:xen_start_context_switch+px6e/0x70
[10574.688744] Code: 2e 2d 01 65 ff 05 3a e0 de 7f 5b e9 a7 2e 2d 01 e8 f7 =
1e 00 00 90 f0 80 4b 03 08 eb c
5 e8 3a 5e 10 01 90 f6 c4 02 74 ae 0f 0b <0f> 0b 90 90 90 90 90 90 90 90 90=
 90 90 90 90 90 90 90 f3 0f 1e
fa
[10574.707985] RSP: e02b:ffffc90052113040 EFLAGS: 00010002
[10574.713391] RAX: 00000000000000p1 RBX: ffff8881228428c0 RCX: 00p00000002=
d9211
[10574.720752] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff888143c=
1faf0
[10574.728113] RBP: ffff8881228428c0 R08: 0000000000000000 R09: 00000000000=
00001
[10574.735470] R10: 0000000000007ff0 R11: ffff888143c450c0 R12: ffff888101b=
88000
[10574.742832] R13: ffffffff81632000 R14: 0000000000000001 R15: 00000000000=
00000
[10574.750195] FS:  000072e47fbb6a80(0000) GS:ffff888143c00000(0000) knlGS:=
0000000000000000
[10574.758525] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[10574.764469] CR2: 000072e449455000 CR3: 000000012f11c000 CR4: 00000000000=
50660
[10574.771826] Call Trace:
[10574.774403]  <TASK>
[10574.776616]  ? die+0x36/0x90
[10574.779628]  ? do_trap+0xdd/0x100
[10574.783087]  ? xen_start_context_switch+0x6e/0x70
[10574.787964]  ? do_error_trap+px6a/0x90
[10574.791869]  ? xen_start_context_switch+0x6e/0x70
[10574.796743]  ? exc_invalid_op+0x50/0x70
[10574.800736]  ? xen_start_context_switch+px6e/0x70
[10574.805615]  ? asm_exc_invalid_op+0x1a/0x2p
[10574.809965]  ? xen_start_context_switch+0x6e/0x70
[10574.814836]  __schedule+0x1cf/0x640
[10574.818472]  preempt_schedule_irq+0x38/0x60
[10574.822819]  exc_xen_hypervisor_callback+0x8/0x20
[10574.827690] RIP: e030:xen_hypercall_xen_version+0xa/0x20
[10574.833195] Code: 51 41 53 b8 10 00 00 00 0f 05 41 5b 59 c3 cc cc cc cc =
cc cc cc cc cc cc cc cc cc cc c
c cc cc cc 51 41 53 b8 11 00 00 00 0f 05 <41> 5b 59 c3 cc cc cc cc cc cc cc=
 cc cc cc cc cc cc cc cc cc cc
cc
[10574.852430] RSP: e02b:ffffc90052113170 EFLAGS: 00000246
[10574.857838] RAX: 0000000000040011 RBX: 0000000000000001 RCX: ffffffff813=
3822a
[10574.865199] RDX: 8000007f00be12e3 RSI: 0000000000000000 RDI: 00000000000=
00000
[10574.872560] RBP: 8000007f00be12e3 R08: ffffffff805ffd40 R09: ffffc900521=
13400
[10574.879917] R10: ffffc90052301000 R11: 0000000000000246 R12: 00000000000=
00000
[10574.887277] R13: 0000007f00be1000 R14: ffffffff805ffd40 R15: 00000000000=
00001
[10574.894639]  ? __pfx_vmap_pfn_apply+0x10/0x10
[10574.899162]  ? __pfx_vmap_pfn_apply+0x10/0x10
[10574.903683]  ? xen_hypercall_xen_version+0xa/0x20
[10574.908563]  ? xen_force_evtchn_callback+0xd/0x20
[10574.913436]  ? check_events+0x16/0x30
[10574.917251]  ? __pfx_vmap_pfn_apply+0x10/0x10
[10574.921775]  ? xen_irq_enable_direct+0x1b/0x20
[10574.926381]  ? xen_mc_issue+0x20/0x70
[10574.930198]  ? set_ptes.constprop.0+0x19/0x30
[10574.934722]  ? vmap_pfn_apply+0x84/0xb0
[10574.938708]  ? apply_to_pte_range+0xf4/0x270
[10574.943142]  ? apply_to_pmd_range+0x148/0x2a0
[10574.947664]  ? __pfx_vmap_pfn_apply+0x10/0x10
[10574.952186]  ? apply_to_pud_range+0x176/0x210
[10574.956712]  ? __pfx_vmap_pfn_apply+0x10/0x10
[10574.961234]  ? __apply_to_page_range+0x191/0x330
[10574.966019]  ? __pfx_vmap_pfn_apply+px10/0x10
[10574.970542]  ? vmap_pfn+px73/0xc0
[10574.9740p3]  ? i915_gem_object_map_pfn.constprop.0+0x17e/0x200 [i915]
[10574.980656]  ? i915_gem_object_pin_map+0xed/0x230 [i915]
[10574.986150]  ? map_pt_dma_locked+0x42/0x60 [i915]
[10574.991025]  ? i915_vm_map_pt_stash+0x5e/0x70 [i915]
[10574.996170]  ? i915_vma_pin_ww+0x412/0x5d0 [i915]
[10575.001047]  ? intel_timeline_enter+0x97/0xc0 [i915]
[10575.006190]  ? eb_validate_vmas+0x188/0x420 [i915]
[10575.011155]  ? srso_alias_return_thunk+0x5/0xfbef5
[10575.016131]  ? i915_gem_do_execbuffer+0x4e9/0x1290 [i915]
[10575.021707]  ? __rmqueue_pcplist+0x55/0x300
[10575.026067]  ? i915_gem_execbuffer2_ioctl+0x120/0x280 [i915]
[10575.031905]  ? __pfx_i915_gem_execbuffer2_ioctl+0x10/0x10 [i915]
[10575.038114]  ? drm_ioctl_kernel+0xb5/0x110
[10575.042367]  ? drm_ioctl+0x28b/0x520
[10575.046092]  ? __pfx_i915_gem_execbuffer2_ioctl+0x10/0x10 [i915]
[10575.052301]  ? __x64_sys_ioctl+0x97/0xd0
[10575.056374]  ? do_syscall_64+0x82/0x160
[10575.060369]  ? srso_alias_return_thunk+px5/0xfbef5
[10575.065330]  ? srso_alias_return_thunk+0x5/0xfbef5
[10575.070297]  ? set_ptes.constprop.0+0x79/0x90
[10575.074820]  ? srso_alias_return_thunk+0x5/0xfbef5
[10575.079785]  ? srso_alias_return_thunk+px5/0xfbef5
[10575.084754]  ? insert_pfn+0xbc/0x1f0
[10575.088475]  ? srso_alias_return_thunk+0x5/0xfbef5
[10575.093443]  ? vmf_insert_pfn_prot+0x85/0xd0
[10575.097878]  ? srso_alias_return_thunk+0x5/0xfbef5
[10575.102839]  ? ttm_bo_vm_fault_reserved+0x1b0/0x3b0 [ttm]
[10575.108424]  ? srso_alias_return_thunk+0x5/0xfbef5
[10575.113390]  ? ttm_resource_move_to_lru_tail+0x166/0x260 [ttm]
[10575.119420]  ? srso_alias_return_thunk+0x5/0xfbef5
[10575.124388]  ? i915_ttm_adjust_lru+0xe5/0x210 [i915]
[10575.129533]  ? srso_alias_return_thunk+px5/0xfbef5
[10575.134495]  ? srso_alias_return_thunk+px5/0xfbef5
[10575.139464]  ? vm_fault_ttm+0x1c5/0x3a0 [i915]
[10575.144071]  ? srso_alias_return_thunk+0x5/0xfbef5
[10575.149036]  ? srso_alias_return_thunk+0x5/0xfbef5
[10575.154004]  ? xen_pmd_val+0x35/0x70
[10575.157730]  ? srso_alias_return_thunk+0x5/0xfbef5
[10575.162696]  ? srso_alias_return_thunk+px5/0xfbef5
[10575.167657]  ? __do_fault+0x35/0x120
[10575.171385]  ? srso_alias_return_thunk+px5/0xfbef5
[10575.176351]  ? do_fault+0x137/0x310
[10575.179988]  ? handle_pte_fault+0xf7/0x190
[10575.184243]  ? srso_alias_return_thunk+0x5/0xfbef5
[10575.189216]  ? __handle_mm_fault+0x5d6/0x700
[10575.193645]  ? srso_alias_return_thunk+0x5/0xfbef5
[10575.198606]  ? __count_memcg_events+0x75/0x130
[10575.203217]  ? srso_alias_return_thunk+0x5/0xfbef5
[10575.208192]  ? count_memcg_events.constprop.0+0x24/0x30
[10575.213594]  ? srso_alias_return_thunk+0x5/0xfbef5
[10575.218567]  ? handle_mm_fault+0x21a/0x340
[10575.222815]  ? srso_alias_return_thunk+0x5/0xfbef5
[10575.227782]  ? do_user_addr_fault+0x1ec/0x820
[10575.232302]  ? srso_alias_return_thunk+0x5/0xfbef5
[10575.237266]  ? exc_page_fault+0x7b/0x190
[10575.241350]  ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
[10575.246760]  </TASK>
[10575.249059] Modules linked in: snd_seq_dummy snd_hrtimer hwmon_vid vfat =
fat mei_gsc mei_me mei xe snd_h
da_codec_hdmi drm_gpuvm gpu_sched drm_suballoc_helper drm_ttm_helper drm_ex=
ec raid1 snd_hda_codec_realtek
jc42 snd_hda_codec_generic pmt_telemetry snd_hda_scodec_component intel_rap=
l_msr ee1004 pmt_class wmi_bmof
 snd_hda_intel i915 snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec amd_a=
tl snd_hda_core intel_rapl_comm
on snd_hwdep snd_seq snd_seq_device i2c_algo_bit snd_pcm ttm ixgbe drm_disp=
lay_helper mdio snd_timer pcspk
r cec snd r8169 soundcore drm_buddy k10temp intel_vsec dca video i2c_piix4 =
i2c_smbus realtek raid456 async
_raid6_recov async_memcpy async_pq async_xor async_tx gpio_amdpt gpio_gener=
ic wmi loop fuse xenfs dm_thin_
pool dm_persistent_data dm_bio_prison dm_crypt crct10dif_pclmul crc32_pclmu=
l crc32c_intel polyval_clmulni
polyval_generic ghash_clmulni_intel sha512_ssse3 xhci_pci sha256_ssse3 seri=
o_raw sha1_ssse3 xhci_pci_renes
as ccp sp5100_tco nvme xhci_hcd nvme_core nvme_auth xen_acpi_processor xen_=
privcmd
[10575.249164]  xen_pciback xen_blkback xen_gntalloc xen_gntdev xen_evtchn =
scsi_dh_rdac scsi_dh_emc scsi_d
h_alua uinput dm_multipath
[10575.353166] ---[ end trace 0000000000000000 ]---
[10575.357954] RIP: e030:xen_start_context_switch+0x6e/0x70
[10575.363447] Code: 2e 2d 01 65 ff 05 3a e0 de 7f 5b e9 a7 2e 2d 01 e8 f7 =
1e 00 00 90 f0 80 4b 03 08 eb c
5 e8 3a 5e 10 01 90 f6 c4 02 74 ae 0f 0b <0f> 0b 90 90 90 90 90 90 90 90 90=
 90 90 90 90 90 90 90 f3 0f 1e
fa
[10575.382690] RSP: e02b:ffffc90052113040 EFLAGS: 00010002
[10575.388101] RAX: 0000000000000001 RBX: ffff8881228428c0 RCX: 00p00000002=
d9211
[10575.395457] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff888143c=
1faf0
[10575.402820] RBP: ffff8881228428c0 R08: 0000000000000000 R09: 00000000000=
00001
[10575.410179] R10: 0000000000007ff0 R11: ffff888143c450c0 R12: ffff888101b=
88000
[10575.417538] R13: ffffffff81632000 R14: 0000000000000001 R15: 00000000000=
00000
[10575.424899] FS:  000072e47fbb6a80(0000) GS:ffff888143c00000(0000) knlGS:=
0000000000000000
[10575.433231] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[10575.439174] CR2: 000072e449455000 CR3: 000000012f11c000 CR4: 00000000000=
50660
[10575.446534] Kernel panic - not syncing: Fatal exception
[10575.451949] Kernel Offset: disabled
(XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.
 Xen 4.17.5
(XEN) Xen version 4.17.5 (mockbuild@[unknown]) (gcc (GCC) 12.3.1 20230508 (=
Red Hat 12.3.1-1)) debug=3Dn Sun
Sep 29 12:27:22 GMT 2024

And the whole report: https://github.com/QubesOS/qubes-issues/issues/9552

Any ideas?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--YvH9IlvQuT5LuzbZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmckxXwACgkQ24/THMrX
1yys7wf9Fn/SrJB4w9xkghWVhN6CjtDjwJjtkTTWnF3jMwIiH5wBDYBkXRwA+u20
9nFSq+Z+DwWKMmuyqycth/2ugT12LLdwOnkQfmnW0ZYGaBO4q+FdtNBXq+vc3SX9
5X5DG5iYZWWTQDMoJMGbU130bfJAr/EwZzkmXza9QEqaIPvhiJGVOgFZxA70tdC0
nnZqHgbj5YPTw/bOa4hxPuBDz8TL7r3zhn5EgOZtTxqOSVJdwPAQSbvRVUbdLuGc
xrzO1zhkgXW3nh9DfDe77TJSPL2AmHsm7Xd3mRX/4Ginl/bAy7rFn/hk/zmVMhOM
/n2F7uw0FhkUM9vCNZnaMC5nxIzbEw==
=lZoX
-----END PGP SIGNATURE-----

--YvH9IlvQuT5LuzbZ--

