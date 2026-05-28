Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOjaDFH1F2q5WAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 09:57:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6785EE1B4
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 09:57:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320983.1588042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSVbC-00007s-Nn; Thu, 28 May 2026 07:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320983.1588042; Thu, 28 May 2026 07:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSVbC-00005N-KC; Thu, 28 May 2026 07:56:14 +0000
Received: by outflank-mailman (input) for mailman id 1320983;
 Thu, 28 May 2026 07:56:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wSVbA-00087K-RV
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 07:56:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSVbA-00HB53-7K
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 09:56:12 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a17f514-bab6-0a2a0a5309dd-0a2a4505ca38-32
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 09:56:12 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a17f51c-aaa8-0a2a45050019-d155dd33f036-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 09:56:12 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-45eecb8bf67so37124f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 00:56:12 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45edb5b2ba9sm11540146f8f.31.2026.05.28.00.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 00:56:11 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779954972; x=1780559772; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zxob5e9+08M5AGGU6zb1ERtgiDGrGjDXUcd+YRtRQ4=;
        b=DU9xCGKjmPceWLYSuunjOSPl76t9nE3MxPVOa5Nw4knuBX0xLZSa1/IrBlkzm61Uf1
         YfqMJq60/rbUOvWdR9v0JQYH1SGiZj6Onh4bYAeSBSPWZCtpCyeV2nMacbdy9rxdpF/F
         KJWfbZyC78sefXeDf74aQYujrnK+CovK5gPy4ipJ2uzKZuV78gEgmOzlyVUHgarvwDZq
         x9PSnSNbuVqq03Da8BR3OxDLGC0Ac6/SHSDnpBCk5Hf5tnBlzzAwqxMSnLQ7+v9XwIrW
         U5MRGLGgm1EXbEv3481ZcZckIsemfMHrxvIq94ehe019a9bv+f7zQa/vWX70p4Vggti7
         FCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779954972; x=1780559772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6zxob5e9+08M5AGGU6zb1ERtgiDGrGjDXUcd+YRtRQ4=;
        b=KhtCxEkH08UtxVCQ8R774b1K53TDSx5i8sOg9f4J9nwnyHpAqaN5dIwrlv8ePRHUBY
         vQ/YTzJ70REQW3q2kHDuldRCs11dZTAy/kB9o3ZkQUSnxdArYT3tzr1T456lul7GWFJv
         4a61hN7k7CgcxfNosjHXfZOtY6EOlYHQ6DbGvZ5EQuus2wR0TzGqYUlKwOLkU57IhrWn
         BuMSHtANGC0F01woDVWMrJrlw6aqfjNnoziQO2tF83tFSPRKwRWk0x/DXcM9T70BHHsX
         XfCbn4UIpkauAccomRNA/zZlb138xxTt1jCUBjHtvztuuUSMKs7+UrmeF4a5fXtIP6xg
         3bHw==
X-Gm-Message-State: AOJu0YyHGN911bMhDG9lYuTTz/zefvhPb2A2GURiRVVtGxBCcFRiocOc
	oAjsb9QDbbjQSLUyY7PBx6D2x0zwi6CpOtAaw7AtmRtJWl5pi8FqWMrcF8QAXCtq
X-Gm-Gg: Acq92OG7B+jXqSTWgsGqlRqOJiEdzyHsJ5OpBnB7OVrThAPWGq3RYU0QEnCRqyD6+tC
	c/NXUT0skpyPe1fDJYBxomXRCBSfwpQ8Xaz+xvsZG8ks7KYLpmYlMOsE2u2u/atd7/7kDM6XqMa
	bZazRUNrk87J3tJ0pL7BXYSY9XKFfyAoRA0DRpgfByd3NwIZ+tK+iPwu5HHfUlGGPKmQzWNzOUf
	tthnNwtB7V6cJGZ/ZzDrZh+RImDxmY1jdnHZIwXI7R1nrHR7w8Oyh5XP1KkYAtCFpY6uky2FW1O
	XpspU7RLN98NpD7K91i9tt9ibbtp4dQAECDUAykw0XnNZR8iHb4EG7QQtdY7Vpj96rolVX5aB+a
	EyHTmbGDPSlM+h+1xTUHCVO8Kx6p9T8+Q/kWfZrqRgZFrBW2peNaauo1jw0lfgQosBGWkAGG5Ye
	Hq3wDq8lttCQLx0I98Thp2n0YiXWO3W/ln5zWBOpLIPma+5JRthUzN4/Ua0B4v0v5RhkeydlyZy
	SE11LBNoRGfmLpiZ9fYxgmzPnm9rQMpIdzS
X-Received: by 2002:a05:6000:18ad:b0:452:a293:4d91 with SMTP id ffacd0b85a97d-45eb33551bemr43176247f8f.0.1779954971482;
        Thu, 28 May 2026 00:56:11 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] public/xen.h: Update comment for mmu_update hypercall
Date: Thu, 28 May 2026 08:55:35 +0100
Message-ID: <20260528075539.10209-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528075539.10209-1-frediano.ziglio@cloud.com>
References: <20260528075539.10209-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1779954972-D3F66443-67B6CAB0/0/0
X-purgate-type: clean
X-purgate-size: 2689
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloud.com:mid];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8A6785EE1B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Frediano Ziglio <frediano.ziglio@citrix.com>

The command is filtered from the address using this code

   cmd = req.ptr & (sizeof(l1_pgentry_t)-1);

l1_pgentry_t is always 64 bit so the 3 lower bits are used as
a command, not only 2 bits.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 xen/include/public/xen.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index d4f238c10b..0537d1f8f3 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -218,16 +218,16 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
  *                     x == 0 => PFD == DOMID_SELF
  *                     x != 0 => PFD == x - 1
  *
- * Sub-commands: ptr[1:0] specifies the appropriate MMU_* command.
+ * Sub-commands: ptr[2:0] specifies the appropriate MMU_* command.
  * -------------
- * ptr[1:0] == MMU_NORMAL_PT_UPDATE:
+ * ptr[2:0] == MMU_NORMAL_PT_UPDATE:
  * Updates an entry in a page table belonging to PFD. If updating an L1 table,
  * and the new table entry is valid/present, the mapped frame must belong to
  * FD. If attempting to map an I/O page then the caller assumes the privilege
  * of the FD.
  * FD == DOMID_IO: Permit /only/ I/O mappings, at the priv level of the caller.
  * FD == DOMID_XEN: Map restricted areas of Xen's heap space.
- * ptr[:2]  -- Machine address of the page-table entry to modify.
+ * ptr[:3]  -- Machine address of the page-table entry to modify.
  * val      -- Value to write.
  *
  * There also certain implicit requirements when using this hypercall. The
@@ -264,17 +264,17 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
  * mentioned above. The argument is MMUEXT_UNPIN_TABLE for all levels and the
  * pagetable MUST not be in use (meaning that the cr3 is not set to it).
  *
- * ptr[1:0] == MMU_MACHPHYS_UPDATE:
+ * ptr[2:0] == MMU_MACHPHYS_UPDATE:
  * Updates an entry in the machine->pseudo-physical mapping table.
- * ptr[:2]  -- Machine address within the frame whose mapping to modify.
+ * ptr[:3]  -- Machine address within the frame whose mapping to modify.
  *             The frame must belong to the FD, if one is specified.
  * val      -- Value to write into the mapping entry.
  *
- * ptr[1:0] == MMU_PT_UPDATE_PRESERVE_AD:
+ * ptr[2:0] == MMU_PT_UPDATE_PRESERVE_AD:
  * As MMU_NORMAL_PT_UPDATE above, but A/D bits currently in the PTE are ORed
  * with those in @val.
  *
- * ptr[1:0] == MMU_PT_UPDATE_NO_TRANSLATE:
+ * ptr[2:0] == MMU_PT_UPDATE_NO_TRANSLATE:
  * As MMU_NORMAL_PT_UPDATE above, but @val is not translated though FD
  * page tables.
  *
-- 
2.43.0


