Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKM+F5lMoGnvhwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 14:37:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE261A6B28
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 14:37:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241760.1542676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvbY9-0003lS-QU; Thu, 26 Feb 2026 13:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241760.1542676; Thu, 26 Feb 2026 13:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvbY9-0003j7-Nr; Thu, 26 Feb 2026 13:37:05 +0000
Received: by outflank-mailman (input) for mailman id 1241760;
 Thu, 26 Feb 2026 13:37:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jXad=A6=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vvbY8-0003j1-Jt
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 13:37:04 +0000
Received: from fout-a2-smtp.messagingengine.com
 (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a6817d5-1318-11f1-9ccf-f158ae23cfc8;
 Thu, 26 Feb 2026 14:37:01 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id 0DC80EC0611;
 Thu, 26 Feb 2026 08:37:00 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Thu, 26 Feb 2026 08:37:00 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Feb 2026 08:36:58 -0500 (EST)
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
X-Inumbo-ID: 3a6817d5-1318-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772113020;
	 x=1772199420; bh=UPBng4rv+s3fts58rTNopXXtMWmC4edfyqx8QRD7E8E=; b=
	ME6GQPaYkbqMokB+A1NZASpnIqCWLTWA8U+/PAfaLIcx405yeo586Hx6VNVXbp9V
	h7F5o+7Am+KAx3lbiR5DOgVO+R/IpSwMJE0AcJ5KToXRsKQ7sDC9yp96VsiOL7b/
	2h8HE40Tik1X120NF/Jz5g2eM/+3wuXjyQf/IfHqgrVtGR1QgJsJVBhznPeWbze8
	WoWUGW++i2JmJV1HxH1SvO//QczWobwOPqMwFjvnvZcaMyHIPVPAB8OlMid+UOKo
	y1wCiipScCBJCpowEZYQh4e1g8a0266xm1gh7OUwqaYgdhbcfT0lIYPHjlUHqvMp
	5oWoXfYrdKP8SZACm9riIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1772113020; x=1772199420; bh=UPBng4rv+s3fts58rTNopXXtMWmC4edfyqx
	8QRD7E8E=; b=UQ2m7Vhduci894NL2rzYYmMsFAXhxPUUYPkdFLS/8+4NCDWuG7Z
	ALfJ2xnE0d+N/sXzYggUOnu2QfavcGh/l91TRNz+zdVkGiMp0+8zE5OXDfYHf5OA
	0hCAeThvf6IjroqCJCSYZrHEZSuWkaywdsVOavdPCm04Sw3LmBU99C155SGyPyp6
	PCMIFTrzjfXpkppUqjrxKTossMazDOpaQCF0j3OXEyJUW2YircSEmG+uO4Vnd164
	x9U6fRkzlKHhFMjp+Irk+VQi5HdoOaUbjCwsxlutgY92U7rAgByx8Y32RSoEseYs
	s3JUoN8m6SEgZOUAyyz9IlIKcbCu7Mo1ptg==
X-ME-Sender: <xms:e0ygaTo87IlrfcnrqasFzpPlw7r5EgotV_DEntqcqgFOwZlsStKkOQ>
    <xme:e0ygaUqBWCx3_ETBbu7J9rLYn4rdwitnVuDRxXtmjiEjhQzR25W0tfHYBsA47dao3
    93KNH19JpqmqhuWMs60Bv6d8khwhEo4c4JDo1Es0cTH5kcH>
X-ME-Received: <xmr:e0ygaVOW-S9QjM0qY56uyqFj5bP_hnqXSa0aUqaPHzs5SLiu46b91E1f0SYrwkpF_xXarmYHFHZk9jNa2IBeUM2ggA5Iyjsrb44>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeeiudekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdeigeef
    gfeijeeuudethfffheejgeejveeutdegudetueejteevveduveeiffeknecuffhomhgrih
    hnpehgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigi
    drtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhj
    vggtthdrohhrghdprhgtphhtthhopehjghhrohhsshesshhushgvrdgtohhmpdhrtghpth
    htohepsghorhhishdrohhsthhrohhvshhkhiesohhrrggtlhgvrdgtohhm
X-ME-Proxy: <xmx:e0ygaVyh9xGz-BAeMuZkFPT3Zya2okWo-sfDxCvmxap4Mt6hGxHCWQ>
    <xmx:e0ygaeuReVdoFgrNZ9CqTCB08i7dPLzFh4PMR_EQrcfoVHP4zc6UFQ>
    <xmx:e0ygae6QFhVXg5ovY9_9NgoXp-q_l1HJASMhl7s_M6rJY1u9_tUxDA>
    <xmx:e0ygadScJMhRHW97z1VhcgViEiD-ngjq6NMqfLDNW4AcJRELmcmHMA>
    <xmx:fEygaQddq6jklA0BDIiymJRIp1lgd07qB5q2PDrZ27JWLbeBZSdVb1cM>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 26 Feb 2026 14:36:57 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: kernel BUG around vmap/vfree -
 xen_enter_lazy_mmu()/xen_leave_lazy_mmu() - Linux 7.0-rc1
Message-ID: <aaBMeSbU3uotHo3R@mail-itl>
References: <aaBH3EAchUwKhrUA@mail-itl>
 <c2f973a0-fcb5-48ea-9638-cd73fa3e37ce@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IRzm8mZXD+3zdZ1l"
Content-Disposition: inline
In-Reply-To: <c2f973a0-fcb5-48ea-9638-cd73fa3e37ce@citrix.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,messagingengine.com:dkim,invisiblethingslab.com:dkim];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: BEE261A6B28
X-Rspamd-Action: no action


--IRzm8mZXD+3zdZ1l
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Feb 2026 14:36:57 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: kernel BUG around vmap/vfree -
 xen_enter_lazy_mmu()/xen_leave_lazy_mmu() - Linux 7.0-rc1

On Thu, Feb 26, 2026 at 01:27:17PM +0000, Andrew Cooper wrote:
> On 26/02/2026 1:17 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi,
> >
> > When testing Linux 7.0-rc1 in PV dom0, I hit the following panic
> > sometimes:
> >
> > [  436.849614] ------------[ cut here ]------------
> > [  436.849669] kernel BUG at arch/x86/include/asm/xen/hypervisor.h:78!
> > [  436.849693] Oops: invalid opcode: 0000 [#1] SMP NOPTI
> > [  436.849710] CPU: 3 UID: 0 PID: 4021 Comm: kworker/u25:1 Not tainted =
7.0.0-0.rc1.1.qubes.1001.fc41.x86_64 #1 PREEMPT(full)=20
> > [  436.849729] Hardware name: Star Labs StarBook/StarBook, BIOS 8.97 10=
/03/2023
> > [  436.849743] Workqueue: i915_flip intel_atomic_commit_work [i915]
> > [  436.850226] RIP: e030:xen_enter_lazy_mmu+0x24/0x30
> > [  436.850245] Code: 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 65 8b=
 05 b8 e5 02 03 85 c0 75 10 65 c7 05 a9 e5 02 03 01 00 00 00 c3 cc cc cc cc=
 <0f> 0b 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90
> > [  436.850270] RSP: e02b:ffffc90045727a68 EFLAGS: 00010202
> > [  436.850283] RAX: 0000000000000001 RBX: ffff8881042fa6d0 RCX: 000ffff=
fffe00000
> > [  436.850296] RDX: 0000000000000001 RSI: ffff88810a5a2980 RDI: 0000000=
000000000
> > [  436.850308] RBP: ffffc90049eda000 R08: ffffc90049edc000 R09: ffffc90=
049edc000
> > [  436.850320] R10: ffffc90049edc000 R11: ffffc90049edbfff R12: ffffc90=
049edc000
> > [  436.850332] R13: ffffc90045727bb0 R14: ffffc90045727b28 R15: 8000000=
00000006b
> > [  436.850356] FS:  0000000000000000(0000) GS:ffff888201e6e000(0000) kn=
lGS:0000000000000000
> > [  436.850371] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  436.850383] CR2: 00006543dbade250 CR3: 0000000115ef1000 CR4: 0000000=
000050660
> > [  436.850401] Call Trace:
> > [  436.850410]  <TASK>
> > [  436.850420]  vmap_pages_pud_range+0x47c/0x530
> > [  436.850439]  vmap_small_pages_range_noflush+0x1f1/0x2b0
> > [  436.850451]  ? __get_vm_area_node+0x10a/0x170
> > [  436.850465]  vmap+0x79/0xd0
> > [  436.850476]  i915_gem_object_map_page+0x13b/0x210 [i915]
> > [  436.850812]  i915_gem_object_pin_map+0x1e2/0x210 [i915]
> > [  436.851123]  i915_gem_object_pin_map_unlocked+0x2d/0xa0 [i915]
> > [  436.851424]  intel_dsb_buffer_create+0xed/0x1a0 [i915]
> > [  436.851778]  intel_dsb_prepare+0xca/0x1a0 [i915]
> > [  436.852110]  intel_atomic_dsb_finish+0x92/0x350 [i915]
> > [  436.852456]  intel_atomic_commit_tail+0x326/0xd40 [i915]
> > [  436.852769]  process_one_work+0x18d/0x380
> > [  436.852779]  worker_thread+0x196/0x300
> > [  436.852787]  ? __pfx_worker_thread+0x10/0x10
> > [  436.852796]  kthread+0xe3/0x120
> > [  436.852805]  ? __pfx_kthread+0x10/0x10
> > [  436.852815]  ret_from_fork+0x19e/0x260
> > [  436.852824]  ? __pfx_kthread+0x10/0x10
> > [  436.852832]  ret_from_fork_asm+0x1a/0x30
> > [  436.852842]  </TASK>
> > [  436.852847] Modules linked in: snd_seq_dummy snd_hrtimer snd_hda_cod=
ec_intelhdmi snd_hda_codec_hdmi snd_hda_codec_alc269 snd_hda_codec_realtek_=
lib snd_hda_scodec_component snd_hda_codec_generic snd_hda_intel snd_sof_pc=
i_intel_tgl snd_sof_pci_intel_cnl snd_sof_intel_hda_generic soundwire_intel=
 snd_sof_intel_hda_sdw_bpt snd_sof_intel_hda_common snd_soc_hdac_hda snd_so=
f_intel_hda_mlink snd_sof_intel_hda soundwire_cadence snd_sof_pci snd_sof_x=
tensa_dsp snd_sof snd_sof_utils snd_soc_acpi_intel_match snd_soc_acpi_intel=
_sdca_quirks soundwire_generic_allocation snd_soc_sdw_utils snd_soc_acpi cr=
c8 intel_rapl_msr soundwire_bus intel_rapl_common snd_soc_sdca snd_soc_avs =
snd_soc_hda_codec snd_hda_ext_core snd_hda_codec vfat intel_uncore_frequenc=
y_common fat snd_hda_core snd_intel_dspcfg snd_intel_sdw_acpi snd_hwdep int=
el_powerclamp snd_soc_core iwlwifi snd_compress spi_nor iTCO_wdt ac97_bus i=
ntel_pmc_bxt ee1004 mtd snd_pcm_dmaengine snd_seq cfg80211 snd_seq_device p=
cspkr spi_intel_pci snd_pcm rfkill spi_intel snd_timer snd
> > [  436.852939]  i2c_i801 soundcore i2c_smbus idma64 intel_pmc_core pmt_=
telemetry pmt_discovery pmt_class intel_hid intel_pmc_ssram_telemetry intel=
_scu_pltdrv sparse_keymap joydev loop fuse xenfs nfnetlink vsock_loopback v=
mw_vsock_virtio_transport_common vmw_vsock_vmci_transport vsock zram vmw_vm=
ci lz4hc_compress lz4_compress dm_thin_pool dm_persistent_data dm_bio_priso=
n dm_crypt xe drm_ttm_helper drm_suballoc_helper gpu_sched drm_gpuvm drm_ex=
ec drm_gpusvm_helper i915 i2c_algo_bit drm_buddy hid_multitouch i2c_hid_acp=
i ghash_clmulni_intel video nvme wmi ttm i2c_hid nvme_core nvme_keyring drm=
_display_helper nvme_auth xhci_pci pinctrl_tigerlake thunderbolt hkdf cec x=
hci_hcd intel_vsec serio_raw xen_acpi_processor xen_privcmd xen_pciback xen=
_blkback xen_gntalloc xen_gntdev xen_evtchn scsi_dh_rdac scsi_dh_emc scsi_d=
h_alua uinput i2c_dev
> > [  436.853183] ---[ end trace 0000000000000000 ]---
> >
> > or this:
> >
> > [  548.736884] ------------[ cut here ]------------
> > [  548.736907] kernel BUG at arch/x86/include/asm/xen/hypervisor.h:85!
> > [  548.736923] Oops: invalid opcode: 0000 [#1] SMP NOPTI
> > [  548.736935] CPU: 0 UID: 0 PID: 206 Comm: kworker/0:2 Not tainted 7.0=
=2E0-0.rc1.1.qubes.1001.fc41.x86_64 #1 PREEMPT(full)=20
> > [  548.736949] Hardware name: LENOVO 2347A45/2347A45, BIOS CBET4000 Nit=
rokey-v0.2.0-2608-ga649597 01/01/1970
> > [  548.736962] Workqueue: events delayed_vfree_work
> > [  548.736976] RIP: e030:xen_leave_lazy_mmu+0x44/0x50
> > [  548.736989] Code: 02 03 83 f8 01 75 23 65 c7 05 6c e4 02 03 00 00 00=
 00 65 ff 0d 7d b8 02 03 74 05 c3 cc cc cc cc e8 61 5d fd ff c3 cc cc cc cc=
 <0f> 0b 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90
> > [  548.737010] RSP: e02b:ffffc90040607cf0 EFLAGS: 00010297
> > [  548.737018] RAX: 0000000000000000 RBX: ffff888164a70408 RCX: 0000000=
000000000
> > [  548.737029] RDX: 0000000000000000 RSI: 000ffffffffff000 RDI: ffff888=
1069c0000
> > [  548.737039] RBP: ffffc90049681000 R08: ffffc90049681000 R09: 0000000=
000000027
> > [  548.737050] R10: 0000000000000027 R11: fefefefefefefeff R12: ffffc90=
049681000
> > [  548.737060] R13: ffff8881002fd258 R14: 0000000000000000 R15: ffffc90=
040607dac
> > [  548.737079] FS:  0000000000000000(0000) GS:ffff8881f88ee000(0000) kn=
lGS:0000000000000000
> > [  548.737090] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  548.737099] CR2: 000055576c2e6058 CR3: 000000010d47b000 CR4: 0000000=
000050660
> > [  548.737115] Call Trace:
> > [  548.737123]  <TASK>
> > [  548.737128]  vunmap_pmd_range.isra.0+0x1f1/0x2e0
> > [  548.737142]  vunmap_p4d_range+0x17d/0x290
> > [  548.737151]  __vunmap_range_noflush+0x182/0x1d0
> > [  548.737161]  ? _raw_spin_unlock+0xe/0x30
> > [  548.737171]  remove_vm_area+0x40/0x70
> > [  548.737180]  vfree.part.0+0x1b/0x290
> > [  548.737189]  delayed_vfree_work+0x35/0x50
> > [  548.737198]  process_one_work+0x18d/0x380
> > [  548.737207]  worker_thread+0x196/0x300
> > [  548.737215]  ? __pfx_worker_thread+0x10/0x10
> > [  548.737224]  kthread+0xe3/0x120
> > [  548.737233]  ? __pfx_kthread+0x10/0x10
> > [  548.737242]  ret_from_fork+0x19e/0x260
> > [  548.737250]  ? __pfx_kthread+0x10/0x10
> > [  548.737258]  ret_from_fork_asm+0x1a/0x30
> > [  548.737269]  </TASK>
> > [  548.737274] Modules linked in: vfat fat snd_seq_dummy snd_hrtimer at=
h9k ath9k_common snd_hda_codec_intelhdmi snd_hda_codec_hdmi ath9k_hw snd_hd=
a_codec_alc269 snd_hda_codec_realtek_lib snd_hda_scodec_component snd_hda_c=
odec_generic snd_hda_intel snd_hda_codec mac80211 snd_hda_core snd_intel_ds=
pcfg snd_intel_sdw_acpi snd_hwdep ath snd_seq snd_seq_device snd_ctl_led cf=
g80211 snd_pcm at24 thinkpad_acpi intel_rapl_msr i2c_i801 snd_timer sparse_=
keymap iTCO_wdt intel_rapl_common platform_profile intel_powerclamp intel_p=
mc_bxt pcspkr i2c_smbus rfkill libarc4 snd soundcore mei_me e1000e mei joyd=
ev lpc_ich loop fuse xenfs nfnetlink vsock_loopback vmw_vsock_virtio_transp=
ort_common vmw_vsock_vmci_transport vsock zram vmw_vmci lz4hc_compress lz4_=
compress dm_thin_pool dm_persistent_data dm_bio_prison dm_crypt i915 i2c_al=
go_bit drm_buddy ghash_clmulni_intel ttm sdhci_pci drm_display_helper sdhci=
_uhs2 sdhci video xhci_pci cqhci wmi cec xhci_hcd ehci_pci mmc_core ehci_hc=
d serio_raw xen_acpi_processor xen_privcmd xen_pciback
> > [  548.737348]  xen_blkback xen_gntalloc xen_gntdev xen_evtchn scsi_dh_=
rdac scsi_dh_emc scsi_dh_alua uinput i2c_dev
> > [  548.737469] ---[ end trace 0000000000000000 ]---
> >
> > I don't have clear pattern when this happens, one was during host
> > suspend, but the other was during "normal" test run (starting/stopping
> > domUs and running stuff around them). Note also one of those is Intel
> > and the other AMD, so it isn't really hardware specific.
> >
> > Slightly more details with links (especially serial0.txt in the logs
> > tab) at
> > https://github.com/QubesOS/qubes-linux-kernel/pull/662#issuecomment-396=
3326188
> >
> > Any idea?
> >
>=20
> That looks like the issue Juergen fixed with:
>=20
> https://lore.kernel.org/xen-devel/20260220123715.834848-1-jgross@suse.com/

The commit message says it's about booting PV guest, here the crash is
significantly later. But I'll test with the patch included anyway.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--IRzm8mZXD+3zdZ1l
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmgTHkACgkQ24/THMrX
1yx1+wf/cbbmhMM0jWrumZh80Cje77aCS+QHadVqXP/VVu/QKo/LB5rVgOcxyVRn
b7nbwIyysWUQaAcnAw2f+DW8UaTWBonaudpCpiQGAuKLCxMsFyroAXzsrl+D+dA/
VTIw28s4SXGf63c+SdSneQXRUMfG47Lb2B3B4oT30IyVBCjOOP2yjD6+ImSidk9W
jF69kAmpFeObyXOdoW8aE8q6gIq1rlAOZR2hFfFe5F2Wo6KL/jLgkjm+CQTrlWBS
QO8dqW8g/HbSg6Eq4akpcwRvsH8Yjb2As+aoWZYrboXH8DFTry7xptF/BZkxaPN+
qnKBVxoGMvCm/3wLAJAnDoFQVggnjw==
=5VRe
-----END PGP SIGNATURE-----

--IRzm8mZXD+3zdZ1l--

