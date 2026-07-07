Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2PmTDVi6TGopowEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 10:35:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BB97192AA
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 10:35:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=A1qwsMhy;
	dkim=pass header.d=suse.com header.s=susede1 header.b=A1qwsMhy;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356038.1610718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh1H5-0001RO-6d; Tue, 07 Jul 2026 08:35:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356038.1610718; Tue, 07 Jul 2026 08:35:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh1H5-0001Oe-1h; Tue, 07 Jul 2026 08:35:27 +0000
Received: by outflank-mailman (input) for mailman id 1356038;
 Tue, 07 Jul 2026 08:35:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wh1H4-0001Nb-7Q
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 08:35:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh1H3-003BoA-KF
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 10:35:25 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a4cba42-5cb7-0a2a0a5109dd-0a2a45089baa-38
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 10:35:25 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a4cba4d-edec-0a2a45080019-c387df82e422-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 10:35:25 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3951E7393D;
 Tue,  7 Jul 2026 08:35:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EC335779AE;
 Tue,  7 Jul 2026 08:35:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mbJnOEy6TGrvDAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 07 Jul 2026 08:35:24 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1783413325; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i7QVV4zU+HBTHHGxFIUYe6BxCNLKsfYFRbHiHIdGaFw=;
	b=A1qwsMhyXPPk7tBBqTA0eBQFS43sgaXhv+FHVOQq6v+tTuNzvB+8idgUnihIXDP0b+bOt9
	IuB1OKyucGahsMu7Br1JRuG6WVtPejZg7OZu7hiosko8XCV/aKTpjmThq4E9Q5X6YJio+2
	bJwU2VOmKFbZyuOw2XSN+LNzAfddQ40=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1783413325; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i7QVV4zU+HBTHHGxFIUYe6BxCNLKsfYFRbHiHIdGaFw=;
	b=A1qwsMhyXPPk7tBBqTA0eBQFS43sgaXhv+FHVOQq6v+tTuNzvB+8idgUnihIXDP0b+bOt9
	IuB1OKyucGahsMu7Br1JRuG6WVtPejZg7OZu7hiosko8XCV/aKTpjmThq4E9Q5X6YJio+2
	bJwU2VOmKFbZyuOw2XSN+LNzAfddQ40=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 4/5] docs: remove stale stubdom entries from stubdom.txt
Date: Tue,  7 Jul 2026 10:34:55 +0200
Message-ID: <20260707083459.226297-5-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707083459.226297-1-jgross@suse.com>
References: <20260707083459.226297-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-purgate-ID: tlsNG-c1860d/1783413325-A15273FC-BD564E03/0/0
X-purgate-type: clean
X-purgate-size: 2552
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8BB97192AA

There are several stubdoms mentioned in docs/misc/stubdom.txt which
no longer exist. Remove them.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/misc/stubdom.txt | 69 -------------------------------------------
 1 file changed, 69 deletions(-)

diff --git a/docs/misc/stubdom.txt b/docs/misc/stubdom.txt
index cfcba4ba96..3ee96d5063 100644
--- a/docs/misc/stubdom.txt
+++ b/docs/misc/stubdom.txt
@@ -85,72 +85,3 @@ To change the CD-ROM medium, libxl will:
 
 The stubdom must internally add /dev/xvdc to an fdset in QEMU with opaque set
 to "stub-devid:$devid".  libxl will lookup the fdset with that string.
-
-                                   PV-GRUB
-                                   =======
-
-  This replaces pygrub to boot domU images safely: it runs the regular grub
-inside the created domain itself and uses regular domU facilities to read the
-disk / fetch files from network etc. ; it eventually loads the PV kernel and
-chain-boots it.
-  
-Configuration
-=============
-
-In your PV config,
-
-- use pv-grub.gz as kernel:
-
-kernel = "pv-grub.gz"
-
-- set the path to menu.lst, as seen from the domU, in extra:
-
-extra = "(hd0,0)/boot/grub/menu.lst"
-
-or you can provide the content of a menu.lst stored in dom0 by passing it as a
-ramdisk:
-
-ramdisk = "/boot/domU-1-menu.lst"
-
-or you can also use a tftp path (dhcp will be automatically performed):
-
-extra = "(nd)/somepath/menu.lst"
-
-or you can set it in option 150 of your dhcp server and leave extra and ramdisk
-empty (dhcp will be automatically performed)
-
-Limitations
-===========
-
-- You can not boot a 64bit kernel with a 32bit-compiled PV-GRUB and vice-versa.
-To cross-compile a 32bit PV-GRUB,
-
-export XEN_TARGET_ARCH=x86_32
-
-- bootsplash is supported, but the ioemu backend does not yet support restart
-for use by the booted kernel.
-
-- PV-GRUB doesn't support virtualized partitions. For instance:
-
-disk = [ 'phy:hda7,hda7,w' ]
-
-will be seen by PV-GRUB as (hd0), not (hd0,6), since GRUB will not see any
-partition table.
-
-
-                                Your own stubdom
-                                ================
-
-  By running
-
-cd stubdom/
-make c-stubdom
-
-  or
-
-cd stubdom/
-make caml-stubdom
-
-  you can compile examples of C or caml stub domain kernels.  You can use these
-and the relevant Makefile rules as basis to build your own stub domain kernel.
-Available libraries are libc, libxc, libxs, zlib and libpci.
-- 
2.54.0


