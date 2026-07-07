Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OclkEU26TGolowEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 10:35:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE0B71929C
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 10:35:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=nwyCMHBQ;
	dkim=pass header.d=suse.com header.s=susede1 header.b=nwyCMHBQ;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356032.1610700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh1Gu-0000ll-M3; Tue, 07 Jul 2026 08:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356032.1610700; Tue, 07 Jul 2026 08:35:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh1Gu-0000j8-Is; Tue, 07 Jul 2026 08:35:16 +0000
Received: by outflank-mailman (input) for mailman id 1356032;
 Tue, 07 Jul 2026 08:35:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wh1Gt-0000gR-5q
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 08:35:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh1Gs-003Bkj-Ic
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 10:35:14 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a4cba42-5cb7-0a2a0a5109dd-0a2a45089baa-0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 10:35:14 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a4cba42-edec-0a2a45080019-c387df82b802-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 10:35:14 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1DE9F73FE0;
 Tue,  7 Jul 2026 08:35:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CC3C4779AE;
 Tue,  7 Jul 2026 08:35:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id X3N/MEG6TGrUDAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 07 Jul 2026 08:35:13 +0000
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
	t=1783413314; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ytHMl7EgcRXd5aw1fkaeFRas4BGpG3cKej1FzdGFOPc=;
	b=nwyCMHBQXaFNbsWebrSrm82mTBJSIJ69cXFLBvVCaBWMYSmYnePxfLOQNorGfHCVBAcfj2
	wPEkFlV2FJcnD05FWxqaWm+7OK5lWXieGXUM7JdSoodatCxxdjXJgDe4FGMnz9Nka9c7AH
	2UkltEFWj/0zRtDjvutJYa/7DH1y23Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1783413314; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ytHMl7EgcRXd5aw1fkaeFRas4BGpG3cKej1FzdGFOPc=;
	b=nwyCMHBQXaFNbsWebrSrm82mTBJSIJ69cXFLBvVCaBWMYSmYnePxfLOQNorGfHCVBAcfj2
	wPEkFlV2FJcnD05FWxqaWm+7OK5lWXieGXUM7JdSoodatCxxdjXJgDe4FGMnz9Nka9c7AH
	2UkltEFWj/0zRtDjvutJYa/7DH1y23Q=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH 2/5] stubdom: remove support for building in 32-bit mode
Date: Tue,  7 Jul 2026 10:34:53 +0200
Message-ID: <20260707083459.226297-3-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707083459.226297-1-jgross@suse.com>
References: <20260707083459.226297-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.79
X-Spam-Level: 
X-purgate-ID: tlsNG-c1860d/1783413314-4092D3FC-E44BC6A0/0/0
X-purgate-type: clean
X-purgate-size: 1631
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:samuel.thibault@ens-lyon.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DE0B71929C

With the removal of grub-pv there is no 32-bit stubdom left.

Remove 32-bit support from the stubdom build system.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Makefile         |  3 ---
 stubdom/Makefile | 11 -----------
 2 files changed, 14 deletions(-)

diff --git a/Makefile b/Makefile
index eb388726b0..ea432e21b0 100644
--- a/Makefile
+++ b/Makefile
@@ -146,9 +146,6 @@ install-tools: install-tools-public-headers
 .PHONY: install-stubdom
 install-stubdom: mini-os-dir install-tools-public-headers
 	$(MAKE) -C stubdom install
-ifeq (x86_64,$(XEN_TARGET_ARCH))
-	XEN_TARGET_ARCH=x86_32 $(MAKE) -C stubdom install-grub-if-enabled
-endif
 
 .PHONY: tools/firmware/seabios-dir-force-update
 tools/firmware/seabios-dir-force-update:
diff --git a/stubdom/Makefile b/stubdom/Makefile
index 850e8544ca..2698bddc9d 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -31,15 +31,7 @@ endef
 $(foreach lib,$(LIBS_LIBS),$(eval $(call LIB_deps,$(lib))))
 
 GNU_TARGET_ARCH:=$(XEN_TARGET_ARCH)
-ifeq ($(XEN_TARGET_ARCH),x86_32)
-GNU_TARGET_ARCH:=i686
-endif
 
-ifeq ($(GNU_TARGET_ARCH), i686)
-TARGET_CFLAGS=
-NEWLIB_CFLAGS+=-D_I386MACH_ALLOW_HW_INTERRUPTS
-STUBDOM_SUPPORTED=1
-endif
 ifeq ($(GNU_TARGET_ARCH), x86_64)
 TARGET_CFLAGS=-mno-red-zone
 NEWLIB_CFLAGS+=-D_I386MACH_ALLOW_HW_INTERRUPTS
@@ -179,9 +171,6 @@ gmp-$(GMP_VERSION).tar.bz2:
 	$(FETCHER) $@ $(GMP_URL)/$@
 
 .PHONY: cross-gmp
-ifeq ($(XEN_TARGET_ARCH), x86_32)
-   GMPEXT=ABI=32
-endif
 gmp-$(XEN_TARGET_ARCH): gmp-$(GMP_VERSION).tar.bz2 $(NEWLIB_STAMPFILE)
 	tar xjf $<
 	rm $@ -rf || :
-- 
2.54.0


