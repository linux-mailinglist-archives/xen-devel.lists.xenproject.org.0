Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BX/CLYsDV2o8EQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 05:50:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7DB75A5F4
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 05:50:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=j0QtaIK7;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1362641.1614415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjqce-0005p8-8P; Wed, 15 Jul 2026 03:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362641.1614415; Wed, 15 Jul 2026 03:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjqce-0005mM-15; Wed, 15 Jul 2026 03:49:24 +0000
Received: by outflank-mailman (input) for mailman id 1362641;
 Wed, 15 Jul 2026 03:49:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <arraybolt3@gmail.com>) id 1wjqcc-0005mD-Br
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 03:49:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjqcb-00CN7Y-Ai
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 05:49:21 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <arraybolt3@gmail.com>)
 id 6a570326-bab6-0a2a0a5309dd-0a2a450b8f94-18
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 05:49:21 +0200
Received: from [209.85.167.179] (helo=mail-oi1-f179.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <arraybolt3@gmail.com>)
 id 6a570340-b7e8-0a2a450b0019-d155a7b3967c-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 05:49:21 +0200
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-4a450c8ddffso476153b6e.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 20:49:20 -0700 (PDT)
Received: from localhost ([172.59.75.218]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7ebcafda2ffsm16467241a34.12.2026.07.14.20.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 20:49:18 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784087359; x=1784692159; darn=lists.xenproject.org;
        h=content-type:mime-version:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3OMFFoZ6HDUY42qAv/zrklkuo0r18cHkV8oRHqawaN0=;
        b=j0QtaIK7UVCAVYS14VJW33uLSELfmHlbwrrX9fqEWpWZQL8kvukVE+MgUOoLKJoW4n
         A+5/j1WG8lRjQ/JkQkY/z+mt0klfUeLKI4+zNW+Pxq/d6S+WC0vy7+/nXeTdNRdb8i0q
         ptJgiNQweptLhuuT3Uyl2ygDfxHLwOrPmetJFVuA4xEULVRxbkeVKvZijOKQCNam8wMa
         4Yrxjm5QfBGIKvFCQ6St3SKOLp43fu8lGu6PeuJcZbxCtkq/yTGKVCBpGU+qJPEf9rN4
         SmhdFv6+OSofCxKrkwvm7pGuApoQvYzZwwmCArpC1+4u8h6C2D1/Mnd5T6duTasVdkLf
         2OIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784087359; x=1784692159;
        h=content-type:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3OMFFoZ6HDUY42qAv/zrklkuo0r18cHkV8oRHqawaN0=;
        b=CjXZAvwgnWDnTMvv4vHKgwd04uTjCx7rBcx9MAtUH3nySChMhQi+grtUWgSSxCBPQn
         0XPXy1YsySTJ4jJD9pkOtZyb5iBgnQ9sM34kG2L6diI845AR8nKQxXcCIqEy5EM93F/a
         CYC3GRFxEElDuAnlJmT/tXjuawM4dLdmKGru/63OY6KpBpu2vesRZWTk+whT1Fkn0akh
         +O8H12I/zRTvklRsaXVCUwFd5J4Hck4fpsy0HL4D5XIUbbZSISep4ziZ6Af9TN3zF5jP
         p7i4DD/9Uvdi15+baulf8CxwbxJmr6e++vL+aUOhAjhWDLfswwl3R1e+uahWQpTs9vDo
         K2PA==
X-Gm-Message-State: AOJu0YzYWEk/kOOBg+qYcBruWX3wBGhiG+AV0MUOdprbT2nUvluD4Lvn
	m3KOzYHJLxi7eHVbRNchQRFPaC7WXrvfq85zrEckKc6CTQHx23o8cPQkVAMmWg==
X-Gm-Gg: AfdE7clNUstcp6qj8D+TrSeGcPFf4n/xkJ7sKjROGof0OSYwqJJN0vm9nV1BUpE83LB
	PFETDEdbFI1CFiDD4d0ff1Q5LBJ2wuzfJiL8FR0aw90Q0+Czc5Wgz5ZnGpa5zBlDfxsoZWCRxwn
	WDgUERx8i8KO/w+QXMSw+37b3oNRqZoXjUcyMQgYD1nuHCVtDhyOpWjkOYZpXhSpzYYXubsExHy
	SHNHzCLdwFrurHwVujr3egLdX4b9KZSv/U7jVnnMjiXCBuL8b2zqxIlIDPpzz8mY2UN6gR3u8B/
	fS2FLCsxq6XWIW/4k2mqZ10OBhSkANDUhMeyARs5J6f1SW1x8z2iUOqrUEGYpZxiPw1pSc/Xwbl
	ZfPzYFWzrjVUXAyMdZ3BPd4XPCLC9YeHW0X03l/URl14bTnhf3QUTZ56vZK1YOkxeQkVqfPNg/q
	BoHOquLZ9LSWS2UV4WoR9+lspsdUjZ69uHJCtAGFY2
X-Received: by 2002:a05:6830:4110:b0:7eb:c7ac:29ef with SMTP id 46e09a7af769-7ec09625379mr6812059a34.2.1784087359278;
        Tue, 14 Jul 2026 20:49:19 -0700 (PDT)
Date: Tue, 14 Jul 2026 23:49:12 -0400
From: Aaron Rainbolt <arraybolt3@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 marmarek@invisiblethingslab.com, adrelanos@whonix.org
Subject: Intermittent kernel WARN in mm.h get_page() when forcefully
 removing a xen_netfront interface from xenstore
Message-ID: <20260714234912.7a75536b@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eDubLtio8OFLSEEx0zCmBLW";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-purgate-ID: tlsNG-42698a/1784087361-AB8D19EA-27614C74/0/0
X-purgate-type: clean
X-purgate-size: 11496
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.28 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:marmarek@invisiblethingslab.com,m:adrelanos@whonix.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pages.debian.net:url,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[arraybolt3@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arraybolt3@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F7DB75A5F4

--Sig_/eDubLtio8OFLSEEx0zCmBLW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

A user in the Qubes OS issue tracker reported that they could cause
kernel WARNs in some of their AppVMs when forcibly terminating a NetVM
that those AppVMs were connected to. [1] Typically, a message such as
`vif vif-0: xenbus: device forcefully removed from xenstore` appears,
then a "WARNING" appears immediately thereafter indicating an issue in
`xennet_disconnect_backend`, with the line of code throwing the warning
being somewhere in `include/linux/mm.h`. Originally it was thought that
the warning was simply normal behavior when a device is forcefully
removed, but it seemed very weird that memory management code would be
in charge of triggering that warning. Furthermore, I cannot reproduce
the issue reliably; for some users, it happens immediately after
shutting down the NetVM, whereas for me, I had to use multiple tricks
including pausing and unpausing a VM to trigger it. After some
fiddling, I was able to reproduce the issue using the latest stable
7.1.3 kernel:

1. On a Whonix-Workstation 18 AppVM (such as anon-whonix), build kernel
   7.1.3 using the steps from
   https://kernel-team.pages.debian.net/kernel-handbook/ch-common-tasks.htm=
l#s-common-size,
   ensuring that debug info is enabled. Use Debian's kernel config from
   the linux-base-7.1.3+deb14-amd64_7.1.3-1_amd64.deb package as the
   starting kernel config.
2. Install the new kernel into a cloned Whonix-Workstation 18 template.
3. Install pvgrub in dom0: `sudo qubes-dom0-update --action=3Dinstall
   grub2-xen-pvh`
4. Create a new AppVM named `anon-whonix-kerntest` based on this
   template.
5. Set the kernel for `anon-whonix-kerntest` to `pvgrub2-pvh`.
6. Start `anon-whonix-kerntest`.
7. Run `uname -r` in `anon-whonix-kerntest`, ensure that the kernel
   version displayed is 7.1.3.
8. Open a root QTerminal window in `anon-whonix-kerntest` by running
   the following in dom0: `qvm-run -u root anon-whonix-kerntest
   qterminal`.
9. In the root QTerminal window, run `sysctl kernel.warn_limit=3D5` to
   prevent an immediate kernel panic when the kernel warn occurs.
10. Open Tor Browser in `anon-whonix-kerntest`, and attempt to navigate
    to a fairly resource-intensive web page like Reddit's front page.
11. While the page is still loading, run `qvm-pause
    anon-whonix-kerntest` in dom0 to freeze the AppVM.
12. In dom0, run `qvm-kill sys-whonix`.
13. Wait a few seconds, then run `qvm-unpause anon-whonix-kerntest` to
    unfreeze the AppVM.
14. In the root QTerminal window of `anon-whonix-kerntest`, run `dmesg
    -w` to watch for kernel messages.
15. Wait a few seconds, then start `sys-whonix`. Qubes OS will reattach
    the network when this is done (there is the equivalent of `xl
    network-attach` done by the Qubes code automatically). The following
    messages should appear in dmesg:

    [  426.609004] vif vif-0: xenbus: device forcefully removed from xensto=
re
    [  426.609242] ------------[ cut here ]------------
    [  426.609254] WARNING: ./include/linux/mm.h:2097 at xennet_disconnect_=
backend+0x1c7/0x520 [xen_netfront], CPU#0: xenwatch/64
    [  426.609269] Modules linked in: snd_seq_dummy(E) snd_hrtimer(E) snd_s=
eq(E) snd_seq_device(E) snd_timer(E) snd(E) soundcore(E) cfg80211(E) nls_as=
cii(E) nls_cp437(E) vfat(E) fat(E) rfkill(E) xenfs(E) nft_reject_inet(E) nf=
_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E) nf_conntrack(E) n=
f_defrag_ipv6(E) nf_defrag_ipv4(E) nf_tables(E) binfmt_misc(E) intel_rapl_m=
sr(E) intel_rapl_common(E) intel_uncore_frequency_common(E) intel_pmc_ssram=
_telemetry(E) intel_vsec(E) aesni_intel(E) gf128mul(E) xen_netfront(E) xen_=
privcmd(E) xen_gntdev(E) xen_gntalloc(E) xen_blkback(E) drm(E) xen_evtchn(E=
) jitterentropy_rng(E) libsha3(E) loop(E) configfs(E) efi_pstore(E) nfnetli=
nk(E) ip_tables(E) x_tables(E) autofs4(E) ext4(E) crc16(E) mbcache(E) jbd2(=
E) dm_snapshot(E) dm_bufio(E) dm_mod(E) xen_blkfront(E)   =20
    [  426.609334] CPU: 0 UID: 0 PID: 64 Comm: xenwatch Tainted: G         =
   E       7.1.3 #5 PREEMPT(lazy)
    [  426.609340] Tainted: [E]=3DUNSIGNED_MODULE
    [  426.609343] RIP: 0010:xennet_disconnect_backend+0x1c7/0x520 [xen_net=
front]
    [  426.609349] Code: 94 dd a0 10 00 00 48 8b 4a 08 48 89 ce 83 e6 01 48=
 83 ee 01 48 09 f1 48 21 ca 0f b6 4a 33 81 f9 f5 00 00 00 0f 85 ea fe ff ff=
 <0f> 0b 49 81 ff 00 01 00 00 0f 82 f8 fe ff ff 4c 89 fe 48 c7 c7 e0   =20
    [  426.609352] RSP: 0018:ffffce3d810c3c98 EFLAGS: 00010246
    [  426.609356] RAX: 0000000000000010 RBX: 0000000000000000 RCX: 0000000=
0000000f5
    [  426.609358] RDX: fffffb0d80ca9800 RSI: 0000000000000000 RDI: fffffff=
f88c8a8a0
    [  426.609360] RBP: ffff8dec51df0000 R08: ffff8debf4dd5a80 R09: ffff8de=
bf4dd5a80
    [  426.609362] R10: 0000000000000020 R11: 00000000000000bf R12: 0000000=
000000000
    [  426.609364] R13: ffff8dec8ef30b80 R14: ffff8dec197fcac0 R15: 0000000=
000000000
    [  426.609366] FS:  0000000000000000(0000) GS:ffff8ded2d129000(0000) kn=
lGS:0000000000000000
    [  426.609369] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    [  426.609370] CR2: 00005faa1a7d3737 CR3: 00000000b420a003 CR4: 0000000=
000770ef0
    [  426.609377] PKRU: 55555554
    [  426.609379] Call Trace:
    [  426.609384]  <TASK>
    [  426.609395]  xennet_remove+0x9f/0x380 [xen_netfront]
    [  426.609399]  ? kfree+0x26e/0x3d0
    [  426.609407]  xenbus_dev_remove+0x71/0x100
    [  426.609414]  device_release_driver_internal+0x19c/0x200
    [  426.609419]  bus_remove_device+0xe8/0x1c0
    [  426.609425]  ? device_remove_attrs+0xa1/0x100
    [  426.609430]  device_del+0x160/0x3e0
    [  426.609433]  ? __pfx_xenwatch_thread+0x10/0x10
    [  426.609436]  device_unregister+0x17/0x70
    [  426.609439]  xenbus_dev_changed.cold+0x3e/0x5b
    [  426.609445]  ? __pfx_xenwatch_thread+0x10/0x10
    [  426.609447]  xenwatch_thread+0x92/0x1c0
    [  426.609451]  ? __pfx_autoremove_wake_function+0x10/0x10
    [  426.609466]  kthread+0xe3/0x120
    [  426.609470]  ? __pfx_kthread+0x10/0x10
    [  426.609473]  ret_from_fork+0x2ba/0x340
    [  426.609478]  ? __pfx_kthread+0x10/0x10
    [  426.609480]  ret_from_fork_asm+0x1a/0x30
    [  426.609491]  </TASK>
    [  426.609493] ---[ end trace 0000000000000000 ]---

(Note that I have not been able to reproduce the issue reliably; these
steps worked for me once, but they may not work every time.)

`./include/linux/mm.h:2097` looks like this:

```
static inline void get_page(struct page *page)
{
	struct folio *folio =3D page_folio(page);
	if (WARN_ON_ONCE(folio_test_slab(folio))) /* <-- 2097 */
		return;
	if (WARN_ON_ONCE(folio_test_large_kmalloc(folio)))
		return;
	folio_get(folio);
}
```

Following the stack trace, all of these line numbers should be accurate
if working with an unmodified 7.1.3 kernel tree:

    $ scripts/faddr2line ./drivers/net/xen-netfront.ko xennet_disconnect_ba=
ckend+0x1c7/0x520
    xennet_disconnect_backend+0x1c7/0x520:
    get_page at /home/user/linux-7.1.3/./include/linux/mm.h:2097 (discrimin=
ator 1)
    (inlined by) xennet_release_tx_bufs at /home/user/linux-7.1.3/drivers/n=
et/xen-netfront.c:1435 (discriminator 1)
    (inlined by) xennet_disconnect_backend at /home/user/linux-7.1.3/driver=
s/net/xen-netfront.c:1839 (discriminator 1)

    $ scripts/faddr2line ./drivers/net/xen-netfront.ko xennet_remove+0x9f/0=
x380=20
    xennet_remove+0x9f/0x380:
    xennet_remove at /home/user/linux-7.1.3/drivers/net/xen-netfront.c:2664

    $ scripts/faddr2line ./vmlinux kfree+0x26e/0x3d0                       =
    =20
    kfree+0x26e/0x3d0:
    stat at mm/slub.c:383
    (inlined by) slab_free at mm/slub.c:6258
    (inlined by) kfree at mm/slub.c:6566

    $ scripts/faddr2line ./vmlinux xenbus_dev_remove+0x71/0x100
    xenbus_dev_remove+0x71/0x100:
    xenbus_dev_remove at drivers/xen/xenbus/xenbus_probe.c:353

    $ scripts/faddr2line ./vmlinux device_release_driver_internal+0x19c/0x2=
00
    device_release_driver_internal+0x19c/0x200:
    __device_release_driver at drivers/base/dd.c:1354
    (inlined by) device_release_driver_internal at drivers/base/dd.c:1375

    $ scripts/faddr2line ./vmlinux bus_remove_device+0xe8/0x1c0         =20
    bus_remove_device+0xe8/0x1c0:
    kset_put at include/linux/kobject.h:193
    (inlined by) subsys_put at drivers/base/base.h:74
    (inlined by) bus_remove_device at drivers/base/bus.c:671

    $ scripts/faddr2line ./vmlinux device_remove_attrs+0xa1/0x100       =20
    device_remove_attrs+0xa1/0x100:
    device_remove_attrs at drivers/base/core.c:2976

    $ scripts/faddr2line ./vmlinux device_del+0x160/0x3e0   =20
    device_del+0x160/0x3e0:
    device_del at drivers/base/core.c:3896

    $ scripts/faddr2line ./vmlinux __pfx_xenwatch_thread+0x10/0x10         =
        =20
    __pfx_xenwatch_thread+0x10/0x10:
    xenwatch_thread at drivers/xen/xenbus/xenbus_xs.c:844

    $ scripts/faddr2line ./vmlinux device_unregister+0x17/0x70             =
             =20
    device_unregister+0x17/0x70:
    put_device at drivers/base/core.c:3813
    (inlined by) device_unregister at drivers/base/core.c:3937

    $ scripts/faddr2line ./vmlinux xenbus_dev_changed.cold+0x3e/0x5b       =
               =20
    xenbus_dev_changed.cold+0x3e/0x5b:
    xenbus_cleanup_devices at drivers/xen/xenbus/xenbus_probe.c:451
    (inlined by) xenbus_dev_changed at drivers/xen/xenbus/xenbus_probe.c:648

    $ scripts/faddr2line ./vmlinux __pfx_xenwatch_thread+0x10/0x10         =
                  =20
    __pfx_xenwatch_thread+0x10/0x10:
    xenwatch_thread at drivers/xen/xenbus/xenbus_xs.c:844

    $ scripts/faddr2line ./vmlinux xenwatch_thread+0x92/0x1c0              =
            =20
    xenwatch_thread+0x92/0x1c0:
    xenwatch_thread at drivers/xen/xenbus/xenbus_xs.c:870

    $ scripts/faddr2line ./vmlinux __pfx_autoremove_wake_function+0x10/0x10=
                     =20
    __pfx_autoremove_wake_function+0x10/0x10:
    autoremove_wake_function at kernel/sched/wait.c:402

    $ scripts/faddr2line ./vmlinux kthread+0xe3/0x120                      =
     =20
    kthread+0xe3/0x120:
    kthread at kernel/kthread.c:436

    $ scripts/faddr2line ./vmlinux __pfx_kthread+0x10/0x10             =20
    __pfx_kthread+0x10/0x10:
    kthread at kernel/kthread.c:381

    $ scripts/faddr2line ./vmlinux ret_from_fork+0x2ba/0x340               =
   =20
    ret_from_fork+0x2ba/0x340:
    ret_from_fork at arch/x86/kernel/process.c:164

    $ scripts/faddr2line ./vmlinux __pfx_kthread+0x10/0x10
    __pfx_kthread+0x10/0x10:
    kthread at kernel/kthread.c:381

    $ scripts/faddr2line ./vmlinux ret_from_fork_asm+0x1a/0x30             =
     =20
    ret_from_fork_asm+0x1a/0x30:
    ret_from_fork_asm at arch/x86/entry/entry_64.S:255

--
Aaron

[1] https://github.com/QubesOS/qubes-issues/issues/10969

--Sig_/eDubLtio8OFLSEEx0zCmBLW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQS8QsiCjFi4DcDBX+Q5rdye4jrrCAUCalcDOQAKCRA5rdye4jrr
CMvxAQDPbjrAr0/2zidW3Udib5xaWE5wrTiGhNC4gvLPIuf2XQD/RRqzBpm2bO3r
Qis6x/MIdh4Xg98rK/09LgZ7/hkpAwM=
=hgKf
-----END PGP SIGNATURE-----

--Sig_/eDubLtio8OFLSEEx0zCmBLW--

