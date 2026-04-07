Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBtzJxjN1GmtxgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 11:23:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E813ABE2D
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 11:23:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274580.1560673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA2ec-0007Bu-8c; Tue, 07 Apr 2026 09:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274580.1560673; Tue, 07 Apr 2026 09:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA2ec-00079v-4u; Tue, 07 Apr 2026 09:23:26 +0000
Received: by outflank-mailman (input) for mailman id 1274580;
 Tue, 07 Apr 2026 09:23:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.brodsky@arm.com>) id 1wA2ea-00079p-IV
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 09:23:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA2eZ-00BNtW-P1
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 11:23:23 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.brodsky@arm.com>)
 id 69d4ccff-2eae-0a2a0a5409dd-0a2a45069cee-16
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 11:23:23 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.0)
 (envelope-from <kevin.brodsky@arm.com>)
 id 69d4cd0a-0df0-0a2a45060019-d98c6eaca682-1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 11:23:22 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FCE71A00;
 Tue,  7 Apr 2026 02:23:16 -0700 (PDT)
Received: from [10.43.20.57] (e126510-lin.lund.arm.com [10.43.20.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 706433F7D8;
 Tue,  7 Apr 2026 02:23:20 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="Date:Subject:To:Cc:References:From:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775553801; bh=IkPnuzV+3P8ZkIbAwdqeXO4+v1PveLJudtk7SO76pNw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VoPGsk5Ha2+Uko33aogP9uF/8fLqKBwHXCVhw0E2i9dMFGXgz2Ts4vs45Y8mLSzKe
	 6T/4OP+86ckjYH97YfD5JGR+fT+hiG4YahKMJ0V2/IRh1ZGs96/cT0u51D1pO3PJQ/
	 VO/XNUffoZ+p2Z21RyYRRJtdOgXpmemOY0Ls2Xv8=
Message-ID: <5d068304-837d-4aef-b8a7-87c91ccf96b4@arm.com>
Date: Tue, 7 Apr 2026 11:23:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kernel BUG around vmap/vfree -
 xen_enter_lazy_mmu()/xen_leave_lazy_mmu() - Linux 7.0-rc1
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <aaBH3EAchUwKhrUA@mail-itl>
 <c2f973a0-fcb5-48ea-9638-cd73fa3e37ce@citrix.com>
 <c712c06f-7fcf-4876-b2d7-f2b7bc6f0dea@suse.com> <adIuP7-sNwuOid80@mail-itl>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <adIuP7-sNwuOid80@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1775553803-642483D8-9AA2B5E3/0/0
X-purgate-type: clean
X-purgate-size: 10441
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:dkim,arm.com:mid];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[kevin.brodsky@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:boris.ostrovsky@oracle.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[kevin.brodsky@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 07E813ABE2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 05/04/2026 11:41, Marek Marczykowski-G=C3=B3recki wrote:
> On Thu, Feb 26, 2026 at 02:41:12PM +0100, J=C3=BCrgen Gro=C3=9F wrote:
>> On 26.02.26 14:27, Andrew Cooper wrote:
>>> On 26/02/2026 1:17 pm, Marek Marczykowski-G=C3=B3recki wrote:
>>>> Hi,
>>>>
>>>> When testing Linux 7.0-rc1 in PV dom0, I hit the following panic
>>>> sometimes:
>>>>
>>>> [  436.849614] ------------[ cut here ]------------
>>>> [  436.849669] kernel BUG at arch/x86/include/asm/xen/hypervisor.h:7=
8!
>>>> [  436.849693] Oops: invalid opcode: 0000 [#1] SMP NOPTI
>>>> [  436.849710] CPU: 3 UID: 0 PID: 4021 Comm: kworker/u25:1 Not taint=
ed 7.0.0-0.rc1.1.qubes.1001.fc41.x86_64 #1 PREEMPT(full)
>>>> [  436.849729] Hardware name: Star Labs StarBook/StarBook, BIOS 8.97=
 10/03/2023
>>>> [  436.849743] Workqueue: i915_flip intel_atomic_commit_work [i915]
>>>> [  436.850226] RIP: e030:xen_enter_lazy_mmu+0x24/0x30
>>>> [  436.850245] Code: 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 65=
 8b 05 b8 e5 02 03 85 c0 75 10 65 c7 05 a9 e5 02 03 01 00 00 00 c3 cc cc =
cc cc <0f> 0b 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90=

>>>> [  436.850270] RSP: e02b:ffffc90045727a68 EFLAGS: 00010202
>>>> [  436.850283] RAX: 0000000000000001 RBX: ffff8881042fa6d0 RCX: 000f=
ffffffe00000
>>>> [  436.850296] RDX: 0000000000000001 RSI: ffff88810a5a2980 RDI: 0000=
000000000000
>>>> [  436.850308] RBP: ffffc90049eda000 R08: ffffc90049edc000 R09: ffff=
c90049edc000
>>>> [  436.850320] R10: ffffc90049edc000 R11: ffffc90049edbfff R12: ffff=
c90049edc000
>>>> [  436.850332] R13: ffffc90045727bb0 R14: ffffc90045727b28 R15: 8000=
00000000006b
>>>> [  436.850356] FS:  0000000000000000(0000) GS:ffff888201e6e000(0000)=
 knlGS:0000000000000000
>>>> [  436.850371] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>> [  436.850383] CR2: 00006543dbade250 CR3: 0000000115ef1000 CR4: 0000=
000000050660
>>>> [  436.850401] Call Trace:
>>>> [  436.850410]  <TASK>
>>>> [  436.850420]  vmap_pages_pud_range+0x47c/0x530
>>>> [  436.850439]  vmap_small_pages_range_noflush+0x1f1/0x2b0
>>>> [  436.850451]  ? __get_vm_area_node+0x10a/0x170
>>>> [  436.850465]  vmap+0x79/0xd0
>>>> [  436.850476]  i915_gem_object_map_page+0x13b/0x210 [i915]
>>>> [  436.850812]  i915_gem_object_pin_map+0x1e2/0x210 [i915]
>>>> [  436.851123]  i915_gem_object_pin_map_unlocked+0x2d/0xa0 [i915]
>>>> [  436.851424]  intel_dsb_buffer_create+0xed/0x1a0 [i915]
>>>> [  436.851778]  intel_dsb_prepare+0xca/0x1a0 [i915]
>>>> [  436.852110]  intel_atomic_dsb_finish+0x92/0x350 [i915]
>>>> [  436.852456]  intel_atomic_commit_tail+0x326/0xd40 [i915]
>>>> [  436.852769]  process_one_work+0x18d/0x380
>>>> [  436.852779]  worker_thread+0x196/0x300
>>>> [  436.852787]  ? __pfx_worker_thread+0x10/0x10
>>>> [  436.852796]  kthread+0xe3/0x120
>>>> [  436.852805]  ? __pfx_kthread+0x10/0x10
>>>> [  436.852815]  ret_from_fork+0x19e/0x260
>>>> [  436.852824]  ? __pfx_kthread+0x10/0x10
>>>> [  436.852832]  ret_from_fork_asm+0x1a/0x30
>>>> [  436.852842]  </TASK>
>>>> [  436.852847] Modules linked in: snd_seq_dummy snd_hrtimer snd_hda_=
codec_intelhdmi snd_hda_codec_hdmi snd_hda_codec_alc269 snd_hda_codec_rea=
ltek_lib snd_hda_scodec_component snd_hda_codec_generic snd_hda_intel snd=
_sof_pci_intel_tgl snd_sof_pci_intel_cnl snd_sof_intel_hda_generic soundw=
ire_intel snd_sof_intel_hda_sdw_bpt snd_sof_intel_hda_common snd_soc_hdac=
_hda snd_sof_intel_hda_mlink snd_sof_intel_hda soundwire_cadence snd_sof_=
pci snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_soc_acpi_intel_match snd=
_soc_acpi_intel_sdca_quirks soundwire_generic_allocation snd_soc_sdw_util=
s snd_soc_acpi crc8 intel_rapl_msr soundwire_bus intel_rapl_common snd_so=
c_sdca snd_soc_avs snd_soc_hda_codec snd_hda_ext_core snd_hda_codec vfat =
intel_uncore_frequency_common fat snd_hda_core snd_intel_dspcfg snd_intel=
_sdw_acpi snd_hwdep intel_powerclamp snd_soc_core iwlwifi snd_compress sp=
i_nor iTCO_wdt ac97_bus intel_pmc_bxt ee1004 mtd snd_pcm_dmaengine snd_se=
q cfg80211 snd_seq_device pcspkr spi_intel_pci snd_pcm rfkill spi_intel s=
nd_timer snd
>>>> [  436.852939]  i2c_i801 soundcore i2c_smbus idma64 intel_pmc_core p=
mt_telemetry pmt_discovery pmt_class intel_hid intel_pmc_ssram_telemetry =
intel_scu_pltdrv sparse_keymap joydev loop fuse xenfs nfnetlink vsock_loo=
pback vmw_vsock_virtio_transport_common vmw_vsock_vmci_transport vsock zr=
am vmw_vmci lz4hc_compress lz4_compress dm_thin_pool dm_persistent_data d=
m_bio_prison dm_crypt xe drm_ttm_helper drm_suballoc_helper gpu_sched drm=
_gpuvm drm_exec drm_gpusvm_helper i915 i2c_algo_bit drm_buddy hid_multito=
uch i2c_hid_acpi ghash_clmulni_intel video nvme wmi ttm i2c_hid nvme_core=
 nvme_keyring drm_display_helper nvme_auth xhci_pci pinctrl_tigerlake thu=
nderbolt hkdf cec xhci_hcd intel_vsec serio_raw xen_acpi_processor xen_pr=
ivcmd xen_pciback xen_blkback xen_gntalloc xen_gntdev xen_evtchn scsi_dh_=
rdac scsi_dh_emc scsi_dh_alua uinput i2c_dev
>>>> [  436.853183] ---[ end trace 0000000000000000 ]---
>>>>
>>>> or this:
>>>>
>>>> [  548.736884] ------------[ cut here ]------------
>>>> [  548.736907] kernel BUG at arch/x86/include/asm/xen/hypervisor.h:8=
5!
>>>> [  548.736923] Oops: invalid opcode: 0000 [#1] SMP NOPTI
>>>> [  548.736935] CPU: 0 UID: 0 PID: 206 Comm: kworker/0:2 Not tainted =
7.0.0-0.rc1.1.qubes.1001.fc41.x86_64 #1 PREEMPT(full)
>>>> [  548.736949] Hardware name: LENOVO 2347A45/2347A45, BIOS CBET4000 =
Nitrokey-v0.2.0-2608-ga649597 01/01/1970
>>>> [  548.736962] Workqueue: events delayed_vfree_work
>>>> [  548.736976] RIP: e030:xen_leave_lazy_mmu+0x44/0x50
>>>> [  548.736989] Code: 02 03 83 f8 01 75 23 65 c7 05 6c e4 02 03 00 00=
 00 00 65 ff 0d 7d b8 02 03 74 05 c3 cc cc cc cc e8 61 5d fd ff c3 cc cc =
cc cc <0f> 0b 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90=

>>>> [  548.737010] RSP: e02b:ffffc90040607cf0 EFLAGS: 00010297
>>>> [  548.737018] RAX: 0000000000000000 RBX: ffff888164a70408 RCX: 0000=
000000000000
>>>> [  548.737029] RDX: 0000000000000000 RSI: 000ffffffffff000 RDI: ffff=
8881069c0000
>>>> [  548.737039] RBP: ffffc90049681000 R08: ffffc90049681000 R09: 0000=
000000000027
>>>> [  548.737050] R10: 0000000000000027 R11: fefefefefefefeff R12: ffff=
c90049681000
>>>> [  548.737060] R13: ffff8881002fd258 R14: 0000000000000000 R15: ffff=
c90040607dac
>>>> [  548.737079] FS:  0000000000000000(0000) GS:ffff8881f88ee000(0000)=
 knlGS:0000000000000000
>>>> [  548.737090] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>> [  548.737099] CR2: 000055576c2e6058 CR3: 000000010d47b000 CR4: 0000=
000000050660
>>>> [  548.737115] Call Trace:
>>>> [  548.737123]  <TASK>
>>>> [  548.737128]  vunmap_pmd_range.isra.0+0x1f1/0x2e0
>>>> [  548.737142]  vunmap_p4d_range+0x17d/0x290
>>>> [  548.737151]  __vunmap_range_noflush+0x182/0x1d0
>>>> [  548.737161]  ? _raw_spin_unlock+0xe/0x30
>>>> [  548.737171]  remove_vm_area+0x40/0x70
>>>> [  548.737180]  vfree.part.0+0x1b/0x290
>>>> [  548.737189]  delayed_vfree_work+0x35/0x50
>>>> [  548.737198]  process_one_work+0x18d/0x380
>>>> [  548.737207]  worker_thread+0x196/0x300
>>>> [  548.737215]  ? __pfx_worker_thread+0x10/0x10
>>>> [  548.737224]  kthread+0xe3/0x120
>>>> [  548.737233]  ? __pfx_kthread+0x10/0x10
>>>> [  548.737242]  ret_from_fork+0x19e/0x260
>>>> [  548.737250]  ? __pfx_kthread+0x10/0x10
>>>> [  548.737258]  ret_from_fork_asm+0x1a/0x30
>>>> [  548.737269]  </TASK>
>>>> [  548.737274] Modules linked in: vfat fat snd_seq_dummy snd_hrtimer=
 ath9k ath9k_common snd_hda_codec_intelhdmi snd_hda_codec_hdmi ath9k_hw s=
nd_hda_codec_alc269 snd_hda_codec_realtek_lib snd_hda_scodec_component sn=
d_hda_codec_generic snd_hda_intel snd_hda_codec mac80211 snd_hda_core snd=
_intel_dspcfg snd_intel_sdw_acpi snd_hwdep ath snd_seq snd_seq_device snd=
_ctl_led cfg80211 snd_pcm at24 thinkpad_acpi intel_rapl_msr i2c_i801 snd_=
timer sparse_keymap iTCO_wdt intel_rapl_common platform_profile intel_pow=
erclamp intel_pmc_bxt pcspkr i2c_smbus rfkill libarc4 snd soundcore mei_m=
e e1000e mei joydev lpc_ich loop fuse xenfs nfnetlink vsock_loopback vmw_=
vsock_virtio_transport_common vmw_vsock_vmci_transport vsock zram vmw_vmc=
i lz4hc_compress lz4_compress dm_thin_pool dm_persistent_data dm_bio_pris=
on dm_crypt i915 i2c_algo_bit drm_buddy ghash_clmulni_intel ttm sdhci_pci=
 drm_display_helper sdhci_uhs2 sdhci video xhci_pci cqhci wmi cec xhci_hc=
d ehci_pci mmc_core ehci_hcd serio_raw xen_acpi_processor xen_privcmd xen=
_pciback
>>>> [  548.737348]  xen_blkback xen_gntalloc xen_gntdev xen_evtchn scsi_=
dh_rdac scsi_dh_emc scsi_dh_alua uinput i2c_dev
>>>> [  548.737469] ---[ end trace 0000000000000000 ]---
>>>>
>>>> I don't have clear pattern when this happens, one was during host
>>>> suspend, but the other was during "normal" test run (starting/stoppi=
ng
>>>> domUs and running stuff around them). Note also one of those is Inte=
l
>>>> and the other AMD, so it isn't really hardware specific.
>>>>
>>>> Slightly more details with links (especially serial0.txt in the logs=

>>>> tab) at
>>>> https://github.com/QubesOS/qubes-linux-kernel/pull/662#issuecomment-=
3963326188
>>>>
>>>> Any idea?
>>>>
>>> That looks like the issue Juergen fixed with:
>>>
>>> https://lore.kernel.org/xen-devel/20260220123715.834848-1-jgross@suse=
=2Ecom/
>> No, it doesn't. The fix is already in rc1, and the crash was quite ear=
ly during
>> boot (before any secondary CPUs were brought up).
>>
>> I guess this problem is related to the lazy_mmu_state series [1].

That may well be the case - it seems that xen_enter_lazy_mmu() is called
while already in lazy MMU mode (first splat), and xen_leave_lazy_mmu()
is called without being in lazy MMU mode (second splat). I expect this
is something specific to Xen, which I didn't get the chance to test.

Looking at the series again I don't see anything obviously wrong, but I
think the riskiest change is commit 291b3abed657 ("x86/xen: use
lazy_mmu_state when context-switching") - worth trying to revert it. If
that doesn't help, I'd suggest bisecting the following range:
58852f24f956..291b3abed657

Sorry for the trouble!

- Kevin

> FWIW, the issue still happens on 7.0-rc6.
>
>> Juergen
>>
>> [1]: https://lore.kernel.org/lkml/20251215150323.2218608-1-kevin.brods=
ky@arm.com/

