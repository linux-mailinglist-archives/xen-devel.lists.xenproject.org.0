Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5985CA863C5
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 18:55:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947646.1345220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3HeU-00034L-Fj; Fri, 11 Apr 2025 16:54:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947646.1345220; Fri, 11 Apr 2025 16:54:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3HeU-00032s-By; Fri, 11 Apr 2025 16:54:50 +0000
Received: by outflank-mailman (input) for mailman id 947646;
 Fri, 11 Apr 2025 16:54:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5hfk=W5=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u3HeT-00032m-63
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 16:54:49 +0000
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aaa630db-16f5-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 18:54:44 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfout.stl.internal (Postfix) with ESMTP id C5EEC1140135;
 Fri, 11 Apr 2025 12:54:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Fri, 11 Apr 2025 12:54:42 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Apr 2025 12:54:41 -0400 (EDT)
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
X-Inumbo-ID: aaa630db-16f5-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1744390482; x=1744476882; bh=qH
	JIGL98KZ2ts2gjHOr2jKnBec7IucsZamn4BOj9Zjc=; b=IYodawxZOmOwihVPRb
	jIvOCGaqJPeVCPrj4hjZV1aU2YfmvjUtE0YsKUHfwYpSnwf8su7ibFO1QfA8TpIr
	uVKbYv8JG0MVP+w7zmn4iUFlcfzQZB8sGiyteJGyY8u77qd7+rMkAVQTT3PCtRYz
	jed82SEU+Nk9qYh77bEHEiOVqc+G+9X46Bqeo7qFEwVJXtaLwq5mUucP/4U1Qqfo
	3+4Fxg1ebBR6ZJqFSNW0GpcjD0xiAFc4dKS/iKzvkhHhWDv9NhJO8ZwpA74asOJU
	Sw8dZX8/u3AxVtZ0ickM3FGJENrdzTtHMTrcf+tb0MRdkIm92FWrvybod5YXOXVn
	O5TA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744390482; x=
	1744476882; bh=qHJIGL98KZ2ts2gjHOr2jKnBec7IucsZamn4BOj9Zjc=; b=Y
	xdqaSvt2HJ28k3EcGOn56HpG3lnOKWNBtfG5cMAgk3hzAk3k9sZ9ZF2ALYajW2iH
	UNPYOCxgqxm3ksWE88rLTMEc6INEzbv/fEb0ZHk8uvolFMg6YwTrfmxZOdOI/M9C
	zty3KcoalS3ZgnBvfeJgUPy6CHI1JBs6UTeK3Tk9VvqqYrk2qoCUfQN0s+U5b4Tx
	qON5TGTknDtoUDtb/WcH1UbJduRz9uxf6fH2a5Bi/lWvgtvABX5tUfx0VE0ayImg
	mknTUu6Vo/tGbbdPHTL85WY8ysBG/AwKOjMJ6tlts022V2DP2NH0JIc195CgvQy3
	TY/LulEyVM6F5B+l/LI7g==
X-ME-Sender: <xms:Ukn5Z8dxAKjL5wYwkqcVwtq2Ark16XuH11oyhwQZHkekeHxAyfJn-A>
    <xme:Ukn5Z-NX06tyBgJmbz6fWNvSf1LOe98ve8NcKSjQDBiLnuLczfbSIaMgRZaQkJHdg
    i0huSFHVTruXQ>
X-ME-Received: <xmr:Ukn5Z9i1luBMe-tIqly31HHFSJ54IKw3byRibqJftyTQ9O37akKHZ5aI934H6qV36022VZtIr2ARRABUqAAUAym2fX9Vq1DuPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddvfeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhf
    fvvefukfggtggusehgtderredttdejnecuhfhrohhmpeforghrvghkucforghrtgiihihk
    ohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthh
    hinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgtdfgvdetteffleeugfdu
    gfegjeekgfefffdvheffhfdtfeeggfeuhedtffeuleenucffohhmrghinhepqhhusggvsh
    dqohhsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgigv
    nhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoh
    epjhhgrhhoshhssehsuhhsvgdrtghomh
X-ME-Proxy: <xmx:Ukn5Zx_pjj8Fb4-HogY_2K7oLnrleqZBFqZknBCSt89ycgKCmxB_Uw>
    <xmx:Ukn5Z4vgInxcGSjQ0pi9jhFgs7An_Bhc125fPgHYUC6gUX5A1bFxog>
    <xmx:Ukn5Z4EZoTtac8kOhMCGU0cIb6NuaY9zFdJ6ZTyFwt4LXJYVjyrd1Q>
    <xmx:Ukn5Z3NTC_SfDyMFlY1qmWQ7ZEe6wsfjAW417_JEuf4f7EuGdnai4g>
    <xmx:Ukn5Z0sytcTFcEGB6T0nPE2--Z64y_I7Tj7kDOqDvRagFgVmO7JadvRR>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 11 Apr 2025 18:54:39 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Linux 6.15-rc1: pvqspinlock: lock 0xffff8881029af110 has corrupted
 value 0x0!
Message-ID: <Z_lJTyVipJJEpWg2@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JpRV2xOIdfUGzFwM"
Content-Disposition: inline


--JpRV2xOIdfUGzFwM
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Apr 2025 18:54:39 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Linux 6.15-rc1: pvqspinlock: lock 0xffff8881029af110 has corrupted
 value 0x0!

Hi,

When testing 6.15-rc1 I got this warning:

    [ 1656.521169] xen-blkback: backend/vbd/92/51712: using 2 queues, proto=
col 1 (x86_64-abi) persistent grants
    [ 1656.527173] xen-blkback: backend/vbd/92/51728: using 2 queues, proto=
col 1 (x86_64-abi) persistent grants
    [ 1656.532240] xen-blkback: backend/vbd/92/51744: using 2 queues, proto=
col 1 (x86_64-abi) persistent grants
    [ 1656.537807] ------------[ cut here ]------------
    [ 1656.538131] pvqspinlock: lock 0xffff8881029af110 has corrupted value=
 0x0!
    [ 1656.538586] WARNING: CPU: 1 PID: 118 at kernel/locking/qspinlock_par=
avirt.h:504 __pv_queued_spin_unlock_slowpath+0xdc/0x120
    [ 1656.539342] Modules linked in: snd_seq_dummy snd_hrtimer vfat fat in=
tel_uncore_frequency_common intel_powerclamp snd_sof_pci_intel_mtl snd_sof_=
intel_hda_generic soundwire_intel snd_sof_intel_hda_sdw_bpt snd_sof_intel_h=
da_common snd_soc_hdac_hda snd_sof_intel_hda_mlink snd_sof_intel_hda snd_hd=
a_codec_hdmi soundwire_cadence snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_s=
of_utils snd_hda_ext_core snd_soc_acpi_intel_match snd_soc_acpi_intel_sdca_=
quirks soundwire_generic_allocation snd_soc_acpi crc8 soundwire_bus snd_hda=
_codec_realtek snd_soc_sdca snd_hda_codec_generic snd_hda_scodec_component =
snd_soc_core snd_compress ac97_bus iTCO_wdt snd_pcm_dmaengine intel_pmc_bxt=
 spd5118 iTCO_vendor_support spi_nor snd_hda_intel mtd snd_intel_dspcfg mei=
_gsc_proxy snd_intel_sdw_acpi snd_hda_codec snd_hda_core intel_rapl_msr snd=
_hwdep snd_seq snd_seq_device snd_pcm snd_timer i2c_i801 snd spi_intel_pci =
processor_thermal_device_pci pcspkr processor_thermal_device processor_ther=
mal_wt_hint soundcore spi_intel e1000e i2c_smbus mei_me
    [ 1656.539419]  processor_thermal_rfim processor_thermal_rapl mei intel=
_rapl_common idma64 processor_thermal_wt_req thunderbolt processor_thermal_=
power_floor processor_thermal_mbox intel_pmc_core int340x_thermal_zone igen=
6_edac intel_hid pmt_telemetry pmt_class sparse_keymap intel_scu_pltdrv joy=
dev fuse loop xenfs nfnetlink vsock_loopback vmw_vsock_virtio_transport_com=
mon vmw_vsock_vmci_transport vsock zram vmw_vmci lz4hc_compress lz4_compres=
s dm_thin_pool dm_persistent_data dm_bio_prison dm_crypt xe drm_ttm_helper =
drm_suballoc_helper gpu_sched drm_gpuvm drm_exec drm_gpusvm i915 i2c_algo_b=
it drm_buddy nvme ttm sdhci_pci polyval_clmulni sdhci_uhs2 polyval_generic =
drm_display_helper nvme_core ghash_clmulni_intel sdhci hid_multitouch xhci_=
pci cqhci nvme_keyring sha512_ssse3 sha256_ssse3 sha1_ssse3 mmc_core intel_=
vpu xhci_hcd nvme_auth intel_vsec cec i2c_hid_acpi i2c_hid intel_pmc_mux vi=
deo typec wmi pinctrl_meteorlake serio_raw xen_acpi_processor xen_privcmd x=
en_pciback xen_blkback xen_gntalloc xen_gntdev xen_evtchn
    [ 1656.545212]  scsi_dh_rdac scsi_dh_emc scsi_dh_alua uinput
    [ 1656.551213] CPU: 1 UID: 0 PID: 118 Comm: xenbus Not tainted 6.15.0-0=
=2Erc1.1.qubes.1.fc41.x86_64 #1 PREEMPT(full)=20
    [ 1656.551845] Hardware name: Notebook V54x_6x_TU/V54x_6x_TU, BIOS Dash=
aro (coreboot+UEFI) v0.9.0 07/17/2024
    [ 1656.552425] RIP: e030:__pv_queued_spin_unlock_slowpath+0xdc/0x120
    [ 1656.552810] Code: ca 13 ed fe 90 48 83 c4 10 5b c3 cc cc cc cc 8b 05=
 e9 05 22 01 85 c0 75 ec 8b 17 48 89 fe 48 c7 c7 30 04 f9 81 e8 84 35 f8 fe=
 <0f> 0b eb d7 44 89 ca be 01 00 00 00 48 c7 c7 a0 78 48 82 e8 8c 4d
    [ 1656.553939] RSP: e02b:ffffc9004048bdd8 EFLAGS: 00010086
    [ 1656.554252] RAX: 0000000000000000 RBX: ffff8881029af110 RCX: 0000000=
000000027
    [ 1656.554673] RDX: ffff88819629cac8 RSI: 0000000000000001 RDI: ffff888=
19629cac0
    [ 1656.555102] RBP: ffff8881029af110 R08: 0000000000000000 R09: 0000000=
00000000e
    [ 1656.555524] R10: 636f6c203a6b636f R11: 6c6e697073717670 R12: 0000000=
000000001
    [ 1656.555949] R13: ffffffff80fc0290 R14: 0000000000000000 R15: 0000000=
000000000
    [ 1656.556373] FS:  0000000000000000(0000) GS:ffff888212e61000(0000) kn=
lGS:0000000000000000
    [ 1656.556841] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
    [ 1656.557176] CR2: 000071b817a4067c CR3: 000000000242e000 CR4: 0000000=
000050660
    [ 1656.557592] Call Trace:
    [ 1656.557739]  <TASK>
    [ 1656.557870]  __raw_callee_save___pv_queued_spin_unlock_slowpath+0x15=
/0x30
    [ 1656.558266]  .slowpath+0x9/0x18
    [ 1656.558453]  ? xen_manage_runstate_time+0x190/0x2d0
    [ 1656.558745]  _raw_spin_unlock_irqrestore+0xe/0x40
    [ 1656.559026]  __wake_up+0x44/0x60
    [ 1656.559230]  ? __pfx_xenbus_thread+0x10/0x10
    [ 1656.559479]  process_msg+0x204/0x2e0
    [ 1656.559693]  xenbus_thread+0x165/0x200
    [ 1656.559913]  ? __pfx_autoremove_wake_function+0x10/0x10
    [ 1656.560223]  kthread+0xf9/0x240
    [ 1656.560420]  ? __pfx_kthread+0x10/0x10
    [ 1656.560637]  ret_from_fork+0x31/0x50
    [ 1656.560854]  ? __pfx_kthread+0x10/0x10
    [ 1656.561070]  ret_from_fork_asm+0x1a/0x30
    [ 1656.561306]  </TASK>
    [ 1656.561440] ---[ end trace 0000000000000000 ]---
    [ 1656.562933] xen-blkback: backend/vbd/92/51760: using 2 queues, proto=
col 1 (x86_64-abi) persistent grants


I'm not sure what exactly triggers it, it doesn't happen on every domU
startup, but I've seen it at least twice already.

Full log at https://openqa.qubes-os.org/tests/135573/logfile?filename=3Dser=
ial0.txt#line-6858

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--JpRV2xOIdfUGzFwM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf5SU8ACgkQ24/THMrX
1yxUCgf+Njq+CYCA/d/RpCOrabTPY91e4x/ninadQeQ0n4BzON/Oux9TcYqxNaeZ
VQcnxTVBwFGEbUkT3b7+EsEhqWpxWgQt5zmWUg4gtMUqUqG/nN6I9KSWwN0nNykF
uKLjFEEYgthueavOSCZ52iwi39ADpppn5H7EvajzbLutqEoU4BoLmt1jR8qs3IiG
/KGSK5fRVDfH6BRgLBh+0ujRlptl6gin8JWHkokOSoAaRW2+G8YrBVuwUe19EVsV
qPsaVUlrPfz2lEHJfwa+LVA1VzrK9efOppAsZoeBgFFWn7wXagt+5qBlruTWC/E4
j1Z9BKT4mbSMcR4e27D2N8HjePRf2w==
=mQny
-----END PGP SIGNATURE-----

--JpRV2xOIdfUGzFwM--

