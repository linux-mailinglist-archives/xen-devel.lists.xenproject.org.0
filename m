Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id paMXHJAu0mkvUAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 05 Apr 2026 11:42:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9777D39DFEA
	for <lists+xen-devel@lfdr.de>; Sun, 05 Apr 2026 11:42:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274018.1560372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9Jz0-0008FZ-LD; Sun, 05 Apr 2026 09:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274018.1560372; Sun, 05 Apr 2026 09:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9Jz0-0008DZ-Hu; Sun, 05 Apr 2026 09:41:30 +0000
Received: by outflank-mailman (input) for mailman id 1274018;
 Sun, 05 Apr 2026 09:41:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w9Jyy-0008DS-Ng
 for xen-devel@lists.xenproject.org; Sun, 05 Apr 2026 09:41:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w9Jyx-00Cm8U-L5
 for xen-devel@lists.xenproject.org; Sun, 05 Apr 2026 11:41:28 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d22e00-5cb7-0a2a0a5109dd-0a2a4505c066-28
 for <xen-devel@lists.xenproject.org>; Sun, 05 Apr 2026 11:41:27 +0200
Received: from [103.168.172.145] (helo=fout-a2-smtp.messagingengine.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d22e45-3760-0a2a45050019-67a8ac91c3b3-3
 for <xen-devel@lists.xenproject.org>; Sun, 05 Apr 2026 11:41:26 +0200
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id 6ADE1EC0104;
 Sun,  5 Apr 2026 05:41:25 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Sun, 05 Apr 2026 05:41:25 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 5 Apr 2026 05:41:22 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775382085;
	 x=1775468485; bh=QvhlfoP+8qUIG8tid6MgtVoRBcoarzphsI9W4aAkT5w=; b=
	v8of00BWmlnpqvMHcCKixvOiXa9xBPp19xBV1Sq9o26Ya56J5LnDjKFYDJF1sx5p
	bCquqKUsZ8gLOjNDiZhLq/eCdwBUjUfo3V3gcJTDtxEmQiAom7URCBm1Wpp80+Cz
	2tm0lLBJFlkG4NQzDL4blGTggcnLIODiP6uTRM5i0pXXTKIaqaoo2GYwzlzSMKwh
	AuqrB3HGAKQvY57Ez4y3r0+IgTZorzeYN253TdC5pWrvAcfy3A/OW7BGmvslNS/7
	ZAqVViXb3gYneesOmi/O+YEkjTU6TO7Z+3IiONOdOGo0Vd3Ln89gM7TFZ04iFpag
	6qUXrHoLAmyO1LKAULqHWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775382085; x=1775468485; bh=QvhlfoP+8qUIG8tid6MgtVoRBcoarzphsI9
	W4aAkT5w=; b=vcipGLvGGS1iG/QH/vca/+ortGyIO3e7bxbU7uJOx61y3ZWICXC
	/hVDIBZN9aDgiHx9ux4wVtL6KVPHpczwf9s52TLhxlsxYb25nD4UXqZl3+g4evaA
	m6FoJGWvMbSgPClEIIIQLygZ8QniOfpq06LsLFYDU7/0vhttI/Jq0mgIKi3rZAQx
	RAR9rwYm2C2rdz1kird9cuVUu26KI1ziSLa9g5CvkgjRNUgP9qYe8t+dFfUJFC8R
	bm1i5X/sQrIzb/pL1QikeAmOxq3egUbYFO15xYM5bLnGrrAmHKI5wxn7WEXPvSli
	AuN51teCMM1jUdO9vW2S6zzWyN8YAAfddQw==
X-ME-Sender: <xms:RS7SaUedSWfyIJHApL1cJfJ-oW8b209_x3_I0nlIuepM7aUaOl4XNA>
    <xme:RS7SadGnRsil7gVMuMyv5XTDqCNt4hG1u5DJiOfQlXNtD4V1lKw6B14CrCe2A873m
    OVY-n15LqFU_uwCXpW5YNk_xswZ0Mc2i6cJhHI8buQ7OKI>
X-ME-Received: <xmr:RS7Sad3MmVZU1FC8L5wxbkW1lKHm62DznBef9my7vhvJJ-9f27XA_9oPFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvieegfefg
    ieejuedutefhffehjeegjeevuedtgeduteeujeetveevudevieffkeenucffohhmrghinh
    epghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehjghhrohhsshesshhushgvrdgtohhmpdhrtghpthhtoh
    epkhgvvhhinhdrsghrohgushhkhiesrghrmhdrtghomhdprhgtphhtthhopegrnhgurhgv
    fidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohepgigvnhdquggvvh
    gvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepsghorhhi
    shdrohhsthhrohhvshhkhiesohhrrggtlhgvrdgtohhm
X-ME-Proxy: <xmx:RS7SaVny5xTMtBkZlbyW5wYPUVGISvLvVDJQB6uZlU5b1y3bpaZrqA>
    <xmx:RS7Sad_inxd9LpmgcDl4pXOqAYdm3jvLMpM5agiYYXPeja1yfDX1Zw>
    <xmx:RS7SaapMeEDzxvh0m2T9L4BqkKTbUKn4PwONmuCGnhhFkFaY6G4q0A>
    <xmx:RS7SaWmoCvfbp-RHaDnN_S9dv1--N0tV2NAdblmZlq_KZJ3LTP80Bw>
    <xmx:RS7Sad6zGR28dK2q3rK3pZKw9d35047BJDDlsC0ov9sYWcUm1DZ7WM_U>
Feedback-ID: i1568416f:Fastmail
Date: Sun, 5 Apr 2026 11:41:18 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: kernel BUG around vmap/vfree -
 xen_enter_lazy_mmu()/xen_leave_lazy_mmu() - Linux 7.0-rc1
Message-ID: <adIuP7-sNwuOid80@mail-itl>
References: <aaBH3EAchUwKhrUA@mail-itl>
 <c2f973a0-fcb5-48ea-9638-cd73fa3e37ce@citrix.com>
 <c712c06f-7fcf-4876-b2d7-f2b7bc6f0dea@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C0DK1UxqrVq6HEXJ"
Content-Disposition: inline
In-Reply-To: <c712c06f-7fcf-4876-b2d7-f2b7bc6f0dea@suse.com>
X-purgate-ID: tlsNG-c201ff/1775382087-3999196F-EEBA8345/0/0
X-purgate-type: clean
X-purgate-size: 11170
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm2];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:kevin.brodsky@arm.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:boris.ostrovsky@oracle.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 9777D39DFEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--C0DK1UxqrVq6HEXJ
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 5 Apr 2026 11:41:18 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: kernel BUG around vmap/vfree -
 xen_enter_lazy_mmu()/xen_leave_lazy_mmu() - Linux 7.0-rc1

On Thu, Feb 26, 2026 at 02:41:12PM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 26.02.26 14:27, Andrew Cooper wrote:
> > On 26/02/2026 1:17 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > > Hi,
> > >=20
> > > When testing Linux 7.0-rc1 in PV dom0, I hit the following panic
> > > sometimes:
> > >=20
> > > [  436.849614] ------------[ cut here ]------------
> > > [  436.849669] kernel BUG at arch/x86/include/asm/xen/hypervisor.h:78!
> > > [  436.849693] Oops: invalid opcode: 0000 [#1] SMP NOPTI
> > > [  436.849710] CPU: 3 UID: 0 PID: 4021 Comm: kworker/u25:1 Not tainte=
d 7.0.0-0.rc1.1.qubes.1001.fc41.x86_64 #1 PREEMPT(full)
> > > [  436.849729] Hardware name: Star Labs StarBook/StarBook, BIOS 8.97 =
10/03/2023
> > > [  436.849743] Workqueue: i915_flip intel_atomic_commit_work [i915]
> > > [  436.850226] RIP: e030:xen_enter_lazy_mmu+0x24/0x30
> > > [  436.850245] Code: 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 65 =
8b 05 b8 e5 02 03 85 c0 75 10 65 c7 05 a9 e5 02 03 01 00 00 00 c3 cc cc cc =
cc <0f> 0b 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90
> > > [  436.850270] RSP: e02b:ffffc90045727a68 EFLAGS: 00010202
> > > [  436.850283] RAX: 0000000000000001 RBX: ffff8881042fa6d0 RCX: 000ff=
fffffe00000
> > > [  436.850296] RDX: 0000000000000001 RSI: ffff88810a5a2980 RDI: 00000=
00000000000
> > > [  436.850308] RBP: ffffc90049eda000 R08: ffffc90049edc000 R09: ffffc=
90049edc000
> > > [  436.850320] R10: ffffc90049edc000 R11: ffffc90049edbfff R12: ffffc=
90049edc000
> > > [  436.850332] R13: ffffc90045727bb0 R14: ffffc90045727b28 R15: 80000=
0000000006b
> > > [  436.850356] FS:  0000000000000000(0000) GS:ffff888201e6e000(0000) =
knlGS:0000000000000000
> > > [  436.850371] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [  436.850383] CR2: 00006543dbade250 CR3: 0000000115ef1000 CR4: 00000=
00000050660
> > > [  436.850401] Call Trace:
> > > [  436.850410]  <TASK>
> > > [  436.850420]  vmap_pages_pud_range+0x47c/0x530
> > > [  436.850439]  vmap_small_pages_range_noflush+0x1f1/0x2b0
> > > [  436.850451]  ? __get_vm_area_node+0x10a/0x170
> > > [  436.850465]  vmap+0x79/0xd0
> > > [  436.850476]  i915_gem_object_map_page+0x13b/0x210 [i915]
> > > [  436.850812]  i915_gem_object_pin_map+0x1e2/0x210 [i915]
> > > [  436.851123]  i915_gem_object_pin_map_unlocked+0x2d/0xa0 [i915]
> > > [  436.851424]  intel_dsb_buffer_create+0xed/0x1a0 [i915]
> > > [  436.851778]  intel_dsb_prepare+0xca/0x1a0 [i915]
> > > [  436.852110]  intel_atomic_dsb_finish+0x92/0x350 [i915]
> > > [  436.852456]  intel_atomic_commit_tail+0x326/0xd40 [i915]
> > > [  436.852769]  process_one_work+0x18d/0x380
> > > [  436.852779]  worker_thread+0x196/0x300
> > > [  436.852787]  ? __pfx_worker_thread+0x10/0x10
> > > [  436.852796]  kthread+0xe3/0x120
> > > [  436.852805]  ? __pfx_kthread+0x10/0x10
> > > [  436.852815]  ret_from_fork+0x19e/0x260
> > > [  436.852824]  ? __pfx_kthread+0x10/0x10
> > > [  436.852832]  ret_from_fork_asm+0x1a/0x30
> > > [  436.852842]  </TASK>
> > > [  436.852847] Modules linked in: snd_seq_dummy snd_hrtimer snd_hda_c=
odec_intelhdmi snd_hda_codec_hdmi snd_hda_codec_alc269 snd_hda_codec_realte=
k_lib snd_hda_scodec_component snd_hda_codec_generic snd_hda_intel snd_sof_=
pci_intel_tgl snd_sof_pci_intel_cnl snd_sof_intel_hda_generic soundwire_int=
el snd_sof_intel_hda_sdw_bpt snd_sof_intel_hda_common snd_soc_hdac_hda snd_=
sof_intel_hda_mlink snd_sof_intel_hda soundwire_cadence snd_sof_pci snd_sof=
_xtensa_dsp snd_sof snd_sof_utils snd_soc_acpi_intel_match snd_soc_acpi_int=
el_sdca_quirks soundwire_generic_allocation snd_soc_sdw_utils snd_soc_acpi =
crc8 intel_rapl_msr soundwire_bus intel_rapl_common snd_soc_sdca snd_soc_av=
s snd_soc_hda_codec snd_hda_ext_core snd_hda_codec vfat intel_uncore_freque=
ncy_common fat snd_hda_core snd_intel_dspcfg snd_intel_sdw_acpi snd_hwdep i=
ntel_powerclamp snd_soc_core iwlwifi snd_compress spi_nor iTCO_wdt ac97_bus=
 intel_pmc_bxt ee1004 mtd snd_pcm_dmaengine snd_seq cfg80211 snd_seq_device=
 pcspkr spi_intel_pci snd_pcm rfkill spi_intel snd_timer snd
> > > [  436.852939]  i2c_i801 soundcore i2c_smbus idma64 intel_pmc_core pm=
t_telemetry pmt_discovery pmt_class intel_hid intel_pmc_ssram_telemetry int=
el_scu_pltdrv sparse_keymap joydev loop fuse xenfs nfnetlink vsock_loopback=
 vmw_vsock_virtio_transport_common vmw_vsock_vmci_transport vsock zram vmw_=
vmci lz4hc_compress lz4_compress dm_thin_pool dm_persistent_data dm_bio_pri=
son dm_crypt xe drm_ttm_helper drm_suballoc_helper gpu_sched drm_gpuvm drm_=
exec drm_gpusvm_helper i915 i2c_algo_bit drm_buddy hid_multitouch i2c_hid_a=
cpi ghash_clmulni_intel video nvme wmi ttm i2c_hid nvme_core nvme_keyring d=
rm_display_helper nvme_auth xhci_pci pinctrl_tigerlake thunderbolt hkdf cec=
 xhci_hcd intel_vsec serio_raw xen_acpi_processor xen_privcmd xen_pciback x=
en_blkback xen_gntalloc xen_gntdev xen_evtchn scsi_dh_rdac scsi_dh_emc scsi=
_dh_alua uinput i2c_dev
> > > [  436.853183] ---[ end trace 0000000000000000 ]---
> > >=20
> > > or this:
> > >=20
> > > [  548.736884] ------------[ cut here ]------------
> > > [  548.736907] kernel BUG at arch/x86/include/asm/xen/hypervisor.h:85!
> > > [  548.736923] Oops: invalid opcode: 0000 [#1] SMP NOPTI
> > > [  548.736935] CPU: 0 UID: 0 PID: 206 Comm: kworker/0:2 Not tainted 7=
=2E0.0-0.rc1.1.qubes.1001.fc41.x86_64 #1 PREEMPT(full)
> > > [  548.736949] Hardware name: LENOVO 2347A45/2347A45, BIOS CBET4000 N=
itrokey-v0.2.0-2608-ga649597 01/01/1970
> > > [  548.736962] Workqueue: events delayed_vfree_work
> > > [  548.736976] RIP: e030:xen_leave_lazy_mmu+0x44/0x50
> > > [  548.736989] Code: 02 03 83 f8 01 75 23 65 c7 05 6c e4 02 03 00 00 =
00 00 65 ff 0d 7d b8 02 03 74 05 c3 cc cc cc cc e8 61 5d fd ff c3 cc cc cc =
cc <0f> 0b 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90
> > > [  548.737010] RSP: e02b:ffffc90040607cf0 EFLAGS: 00010297
> > > [  548.737018] RAX: 0000000000000000 RBX: ffff888164a70408 RCX: 00000=
00000000000
> > > [  548.737029] RDX: 0000000000000000 RSI: 000ffffffffff000 RDI: ffff8=
881069c0000
> > > [  548.737039] RBP: ffffc90049681000 R08: ffffc90049681000 R09: 00000=
00000000027
> > > [  548.737050] R10: 0000000000000027 R11: fefefefefefefeff R12: ffffc=
90049681000
> > > [  548.737060] R13: ffff8881002fd258 R14: 0000000000000000 R15: ffffc=
90040607dac
> > > [  548.737079] FS:  0000000000000000(0000) GS:ffff8881f88ee000(0000) =
knlGS:0000000000000000
> > > [  548.737090] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [  548.737099] CR2: 000055576c2e6058 CR3: 000000010d47b000 CR4: 00000=
00000050660
> > > [  548.737115] Call Trace:
> > > [  548.737123]  <TASK>
> > > [  548.737128]  vunmap_pmd_range.isra.0+0x1f1/0x2e0
> > > [  548.737142]  vunmap_p4d_range+0x17d/0x290
> > > [  548.737151]  __vunmap_range_noflush+0x182/0x1d0
> > > [  548.737161]  ? _raw_spin_unlock+0xe/0x30
> > > [  548.737171]  remove_vm_area+0x40/0x70
> > > [  548.737180]  vfree.part.0+0x1b/0x290
> > > [  548.737189]  delayed_vfree_work+0x35/0x50
> > > [  548.737198]  process_one_work+0x18d/0x380
> > > [  548.737207]  worker_thread+0x196/0x300
> > > [  548.737215]  ? __pfx_worker_thread+0x10/0x10
> > > [  548.737224]  kthread+0xe3/0x120
> > > [  548.737233]  ? __pfx_kthread+0x10/0x10
> > > [  548.737242]  ret_from_fork+0x19e/0x260
> > > [  548.737250]  ? __pfx_kthread+0x10/0x10
> > > [  548.737258]  ret_from_fork_asm+0x1a/0x30
> > > [  548.737269]  </TASK>
> > > [  548.737274] Modules linked in: vfat fat snd_seq_dummy snd_hrtimer =
ath9k ath9k_common snd_hda_codec_intelhdmi snd_hda_codec_hdmi ath9k_hw snd_=
hda_codec_alc269 snd_hda_codec_realtek_lib snd_hda_scodec_component snd_hda=
_codec_generic snd_hda_intel snd_hda_codec mac80211 snd_hda_core snd_intel_=
dspcfg snd_intel_sdw_acpi snd_hwdep ath snd_seq snd_seq_device snd_ctl_led =
cfg80211 snd_pcm at24 thinkpad_acpi intel_rapl_msr i2c_i801 snd_timer spars=
e_keymap iTCO_wdt intel_rapl_common platform_profile intel_powerclamp intel=
_pmc_bxt pcspkr i2c_smbus rfkill libarc4 snd soundcore mei_me e1000e mei jo=
ydev lpc_ich loop fuse xenfs nfnetlink vsock_loopback vmw_vsock_virtio_tran=
sport_common vmw_vsock_vmci_transport vsock zram vmw_vmci lz4hc_compress lz=
4_compress dm_thin_pool dm_persistent_data dm_bio_prison dm_crypt i915 i2c_=
algo_bit drm_buddy ghash_clmulni_intel ttm sdhci_pci drm_display_helper sdh=
ci_uhs2 sdhci video xhci_pci cqhci wmi cec xhci_hcd ehci_pci mmc_core ehci_=
hcd serio_raw xen_acpi_processor xen_privcmd xen_pciback
> > > [  548.737348]  xen_blkback xen_gntalloc xen_gntdev xen_evtchn scsi_d=
h_rdac scsi_dh_emc scsi_dh_alua uinput i2c_dev
> > > [  548.737469] ---[ end trace 0000000000000000 ]---
> > >=20
> > > I don't have clear pattern when this happens, one was during host
> > > suspend, but the other was during "normal" test run (starting/stopping
> > > domUs and running stuff around them). Note also one of those is Intel
> > > and the other AMD, so it isn't really hardware specific.
> > >=20
> > > Slightly more details with links (especially serial0.txt in the logs
> > > tab) at
> > > https://github.com/QubesOS/qubes-linux-kernel/pull/662#issuecomment-3=
963326188
> > >=20
> > > Any idea?
> > >=20
> >=20
> > That looks like the issue Juergen fixed with:
> >=20
> > https://lore.kernel.org/xen-devel/20260220123715.834848-1-jgross@suse.c=
om/
>=20
> No, it doesn't. The fix is already in rc1, and the crash was quite early =
during
> boot (before any secondary CPUs were brought up).
>=20
> I guess this problem is related to the lazy_mmu_state series [1].

FWIW, the issue still happens on 7.0-rc6.

> Juergen
>=20
> [1]: https://lore.kernel.org/lkml/20251215150323.2218608-1-kevin.brodsky@=
arm.com/

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--C0DK1UxqrVq6HEXJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnSLj4ACgkQ24/THMrX
1yymYwf+L8DVCpnBOyKU8gkMp1NPN7ipNFMkj0k8jb9gqrRurhwocXwCFkRlvpoI
RhoqB0cC1yPh5B/7vCJz7Yz7JfHVxpFpfXOr0gjLFvtIqHM+hxGrd5eSSauknZ9z
iOOOmjGuMCS1f1dNPceCbV0N0cwocJm2CJb06veRVOETdhrJnsPZ1lki1Z1SQpxO
ajlyYWJlEOYOnMsCj03l55sxpcoyekuD+WSeDnGNOMNUJIYcDVXVYLb524x6IJV9
62Gm7tFpGLBttlFHGakT8nWk93Fl3AGgB+UIfSaB1gMpk+mLUvyyrom/UEIBxzMe
6nJGbEerWbdgcBZOgR+5Qox+nt0nxg==
=Ofpl
-----END PGP SIGNATURE-----

--C0DK1UxqrVq6HEXJ--

