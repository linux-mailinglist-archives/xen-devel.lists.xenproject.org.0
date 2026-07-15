Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7EgvGupoV2p2MwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 13:03:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB17675D441
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 13:03:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=LOZE2WkQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=k5q9WukS;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YmFcTJzn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WeE0jk4o;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=suse.de
Received: from list by lists.xenproject.org with outflank-mailman.1362945.1614791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjxO7-0000gx-93; Wed, 15 Jul 2026 11:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362945.1614791; Wed, 15 Jul 2026 11:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjxO7-0000fK-5s; Wed, 15 Jul 2026 11:02:51 +0000
Received: by outflank-mailman (input) for mailman id 1362945;
 Wed, 15 Jul 2026 11:02:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <pfalcato@suse.de>) id 1wjxNd-0000Ze-RH
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 11:02:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjxNd-00B4XV-0P
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 13:02:21 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <pfalcato@suse.de>)
 id 6a5768ba-bab6-0a2a0a5309dd-0a2a4509b676-22
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 13:02:20 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <pfalcato@suse.de>)
 id 6a5768bc-be1a-0a2a45090019-c387df82dbe4-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 13:02:20 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A58157836D;
 Wed, 15 Jul 2026 11:02:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0925A779AD;
 Wed, 15 Jul 2026 11:02:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id O9RQOq1oV2oufAAAD6G6ig
 (envelope-from <pfalcato@suse.de>); Wed, 15 Jul 2026 11:02:05 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784113336; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=awWRLmdYvk3T0kyC5GXSDxyc9sU+56IS2/k4lm4UTqU=;
	b=LOZE2WkQU8SqoT0Od6xtHGztXuLBTKeq0vwL2KC7tW/V8sN3dCsWU3CXgg1DHTwQO20lvP
	FaLL2sIIs9T9O/qtX2psKMPydmD59VbJNDZZBf5C8sVr6YH3P7USJSUWIFWOSOvPsmWL18
	RzM7BjBNYriIfaKB6d5WmuGAVDDPxHw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784113336;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=awWRLmdYvk3T0kyC5GXSDxyc9sU+56IS2/k4lm4UTqU=;
	b=k5q9WukS1rf+5uOqq7/uYAiIKCXIwczoydsPteGRpPPTBPq7OcFdth7xShqKi3Askoczon
	ftTpRD3BH8gR50Ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784113331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=awWRLmdYvk3T0kyC5GXSDxyc9sU+56IS2/k4lm4UTqU=;
	b=YmFcTJzn17KM6igiXi4SvOZ0A1DFg9t3GkYeYdvFELLE2wykcF3U2OhsS9G70qz9qbK7fF
	JQOemyqZyRZ7Z+5GuEYT575tpimBb6iySrn8TiXtF8/Rvf7GhO0BhvdKB0hrIDUs7akI5y
	aiKy9Pkh9Yt2lWOPDDK6tZ1Uk3PZGaE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784113331;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=awWRLmdYvk3T0kyC5GXSDxyc9sU+56IS2/k4lm4UTqU=;
	b=WeE0jk4oqGf9L8A9LdtqB80/xlVuHiS+eAKy/fVum4WmeIOdBENw0Y8Gr7zGRetjvFN9M5
	X5wuhno4DiExQoCQ==
Date: Wed, 15 Jul 2026 12:02:04 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Aaron Rainbolt <arraybolt3@gmail.com>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, marmarek@invisiblethingslab.com, 
	adrelanos@whonix.org, Matthew Wilcox <willy@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: Intermittent kernel WARN in mm.h get_page() when forcefully
 removing a xen_netfront interface from xenstore
Message-ID: <aldj4Jwd5T9q1-sK@pedro-suse.lan>
References: <20260714234912.7a75536b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714234912.7a75536b@gmail.com>
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Spam-Level: 
X-purgate-ID: tlsNG-bad1c0/1784113340-FD668034-3697C8C5/0/0
X-purgate-type: clean
X-purgate-size: 6746
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arraybolt3@gmail.com,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:marmarek@invisiblethingslab.com,m:adrelanos@whonix.org,m:willy@infradead.org,m:vbabka@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pedro-suse.lan:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.de:from_mime,suse.de:dkim,pages.debian.net:url];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[pfalcato@suse.de,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[pfalcato@suse.de,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB17675D441

+Cc Willy, Vlastimil

On Tue, Jul 14, 2026 at 11:49:12PM -0400, Aaron Rainbolt wrote:
> A user in the Qubes OS issue tracker reported that they could cause
> kernel WARNs in some of their AppVMs when forcibly terminating a NetVM
> that those AppVMs were connected to. [1] Typically, a message such as
> `vif vif-0: xenbus: device forcefully removed from xenstore` appears,
> then a "WARNING" appears immediately thereafter indicating an issue in
> `xennet_disconnect_backend`, with the line of code throwing the warning
> being somewhere in `include/linux/mm.h`. Originally it was thought that
> the warning was simply normal behavior when a device is forcefully
> removed, but it seemed very weird that memory management code would be
> in charge of triggering that warning. Furthermore, I cannot reproduce
> the issue reliably; for some users, it happens immediately after
> shutting down the NetVM, whereas for me, I had to use multiple tricks
> including pausing and unpausing a VM to trigger it. After some
> fiddling, I was able to reproduce the issue using the latest stable
> 7.1.3 kernel:
> 
> 1. On a Whonix-Workstation 18 AppVM (such as anon-whonix), build kernel
>    7.1.3 using the steps from
>    https://kernel-team.pages.debian.net/kernel-handbook/ch-common-tasks.html#s-common-size,
>    ensuring that debug info is enabled. Use Debian's kernel config from
>    the linux-base-7.1.3+deb14-amd64_7.1.3-1_amd64.deb package as the
>    starting kernel config.
> 2. Install the new kernel into a cloned Whonix-Workstation 18 template.
> 3. Install pvgrub in dom0: `sudo qubes-dom0-update --action=install
>    grub2-xen-pvh`
> 4. Create a new AppVM named `anon-whonix-kerntest` based on this
>    template.
> 5. Set the kernel for `anon-whonix-kerntest` to `pvgrub2-pvh`.
> 6. Start `anon-whonix-kerntest`.
> 7. Run `uname -r` in `anon-whonix-kerntest`, ensure that the kernel
>    version displayed is 7.1.3.
> 8. Open a root QTerminal window in `anon-whonix-kerntest` by running
>    the following in dom0: `qvm-run -u root anon-whonix-kerntest
>    qterminal`.
> 9. In the root QTerminal window, run `sysctl kernel.warn_limit=5` to
>    prevent an immediate kernel panic when the kernel warn occurs.
> 10. Open Tor Browser in `anon-whonix-kerntest`, and attempt to navigate
>     to a fairly resource-intensive web page like Reddit's front page.
> 11. While the page is still loading, run `qvm-pause
>     anon-whonix-kerntest` in dom0 to freeze the AppVM.
> 12. In dom0, run `qvm-kill sys-whonix`.
> 13. Wait a few seconds, then run `qvm-unpause anon-whonix-kerntest` to
>     unfreeze the AppVM.
> 14. In the root QTerminal window of `anon-whonix-kerntest`, run `dmesg
>     -w` to watch for kernel messages.
> 15. Wait a few seconds, then start `sys-whonix`. Qubes OS will reattach
>     the network when this is done (there is the equivalent of `xl
>     network-attach` done by the Qubes code automatically). The following
>     messages should appear in dmesg:
> 
>     [  426.609004] vif vif-0: xenbus: device forcefully removed from xenstore
>     [  426.609242] ------------[ cut here ]------------
>     [  426.609254] WARNING: ./include/linux/mm.h:2097 at xennet_disconnect_backend+0x1c7/0x520 [xen_netfront], CPU#0: xenwatch/64
>     [  426.609269] Modules linked in: snd_seq_dummy(E) snd_hrtimer(E) snd_seq(E) snd_seq_device(E) snd_timer(E) snd(E) soundcore(E) cfg80211(E) nls_ascii(E) nls_cp437(E) vfat(E) fat(E) rfkill(E) xenfs(E) nft_reject_inet(E) nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) nf_tables(E) binfmt_misc(E) intel_rapl_msr(E) intel_rapl_common(E) intel_uncore_frequency_common(E) intel_pmc_ssram_telemetry(E) intel_vsec(E) aesni_intel(E) gf128mul(E) xen_netfront(E) xen_privcmd(E) xen_gntdev(E) xen_gntalloc(E) xen_blkback(E) drm(E) xen_evtchn(E) jitterentropy_rng(E) libsha3(E) loop(E) configfs(E) efi_pstore(E) nfnetlink(E) ip_tables(E) x_tables(E) autofs4(E) ext4(E) crc16(E) mbcache(E) jbd2(E) dm_snapshot(E) dm_bufio(E) dm_mod(E) xen_blkfront(E)    
>     [  426.609334] CPU: 0 UID: 0 PID: 64 Comm: xenwatch Tainted: G            E       7.1.3 #5 PREEMPT(lazy)
>     [  426.609340] Tainted: [E]=UNSIGNED_MODULE
>     [  426.609343] RIP: 0010:xennet_disconnect_backend+0x1c7/0x520 [xen_netfront]
>     [  426.609349] Code: 94 dd a0 10 00 00 48 8b 4a 08 48 89 ce 83 e6 01 48 83 ee 01 48 09 f1 48 21 ca 0f b6 4a 33 81 f9 f5 00 00 00 0f 85 ea fe ff ff <0f> 0b 49 81 ff 00 01 00 00 0f 82 f8 fe ff ff 4c 89 fe 48 c7 c7 e0    
>     [  426.609352] RSP: 0018:ffffce3d810c3c98 EFLAGS: 00010246
>     [  426.609356] RAX: 0000000000000010 RBX: 0000000000000000 RCX: 00000000000000f5
>     [  426.609358] RDX: fffffb0d80ca9800 RSI: 0000000000000000 RDI: ffffffff88c8a8a0
>     [  426.609360] RBP: ffff8dec51df0000 R08: ffff8debf4dd5a80 R09: ffff8debf4dd5a80
>     [  426.609362] R10: 0000000000000020 R11: 00000000000000bf R12: 0000000000000000
>     [  426.609364] R13: ffff8dec8ef30b80 R14: ffff8dec197fcac0 R15: 0000000000000000
>     [  426.609366] FS:  0000000000000000(0000) GS:ffff8ded2d129000(0000) knlGS:0000000000000000
>     [  426.609369] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     [  426.609370] CR2: 00005faa1a7d3737 CR3: 00000000b420a003 CR4: 0000000000770ef0
>     [  426.609377] PKRU: 55555554
>     [  426.609379] Call Trace:

This is due (or looks like it...) to
static netdev_tx_t xennet_start_xmit(struct sk_buff *skb, struct net_device *dev)
[...]
page = virt_to_page(skb->data); /* skb->data is a slab kmallocation */
/* ... */
	info.page = page;
	first_tx = xennet_make_first_txreq(&info, offset, len);
/* ... */
queue->grant_tx_page[i] = page;

and then later

static void xennet_disconnect_backend(struct netfront_info *info)
/* ... */
xennet_release_tx_bufs
get_page(queue->grant_tx_page[i]);
gnttab_end_foreign_access(queue->grant_tx_ref[i],
			  queue->grant_tx_page[i]);

which may trigger get_page() on a slab page:
static inline void get_page(struct page *page)
{
	struct folio *folio = page_folio(page);
	if (WARN_ON_ONCE(folio_test_slab(folio)))
		return;
	if (WARN_ON_ONCE(folio_test_large_kmalloc(folio)))
		return;
	folio_get(folio);
}

and there's your WARN. The code as-is is wrong. get_page() does not stabilize
slab allocations, and the skb is freed right after, which may very well free
the data. This _can_ make sense for other page frags, but I would simply defer
freeing the skb until either the full skb is xmitted, or you successfully
cancel the whole transfer (what I understand is the "foreign access" in this
code). The skb itself should pin the pages.

-- 
Pedro

