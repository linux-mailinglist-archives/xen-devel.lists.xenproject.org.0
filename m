Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLhpHkpb4mlM5QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 18:09:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F159241CF20
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 18:09:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284524.1566250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDlkB-0005Tf-4z; Fri, 17 Apr 2026 16:08:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284524.1566250; Fri, 17 Apr 2026 16:08:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDlkA-0005QY-TZ; Fri, 17 Apr 2026 16:08:34 +0000
Received: by outflank-mailman (input) for mailman id 1284524;
 Fri, 17 Apr 2026 16:08:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wDlk9-0005QS-U2
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 16:08:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDlk8-005LZt-FB
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 18:08:32 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69e25afb-e002-0a2a0a5209dd-0a2a4506ca6c-14
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 18:08:32 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69e25b00-7371-0a2a45060019-d155dd35ac33-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 18:08:32 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-43d70b3e159so437036f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 09:08:32 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cb1176sm6088485f8f.3.2026.04.17.09.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 09:08:30 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1776442111; x=1777046911; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f5xH1RkeuahuDZVxF9D4w7AKkT9fwbSs/UOLRMa4N9s=;
        b=Z4aj56QgCVar9GZNu7tOqQQnkGwTzjM41+iWlegpM4sl72SCAQtXpa9Fd5xvuDzJnH
         AGdYS3f75kyD/V7wGkquKBCma+m9zvG5Yjkf6SCk5BeY7/9olswZ6UIHFwjUul8mv2Ii
         T9YimTaRIqMBtltaCY5qc4qXsU36f/mo54I38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776442111; x=1777046911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f5xH1RkeuahuDZVxF9D4w7AKkT9fwbSs/UOLRMa4N9s=;
        b=CrZYNPhehiP92+si/BtPqzL45IOix1wNyzo0aSFjQbbLbUB15H1N2XWQQ9lv7XCxY5
         JmD2rp5MSpG7LMyh5rC+FvvCYJLEd0zrEupYsP03uawasxtZM/9g84ibEGZ4RB0kTlos
         f1mt2rhLi+7gxz/qR/rrnQCw54MopEaIAS42rUeUjJMHMpyjvrXfVtDB6mly6LEEhB17
         bPCCv7a65T/B0bN9azOqSm+T/fU2rdBs7M005WiV6hFqJMhDOpLPk2XHkeWSt8aM/lN6
         OdLAQhcYt9XCkyCjTnaluTS/QwUeYqtZ2MLC8NCUgVuxjD7AfKnb6d2JVokjkcNbauFA
         6gCQ==
X-Gm-Message-State: AOJu0Yy/JSK2gEoYcj6gdsAG+8tfRxaciA/k/sWUSqTWA29CWgiVdKnB
	7uEtZ6NMH0ziBC5Td0g29Yw+8MEcJVsEPNoM5vyzMkRiuOS186LlGpHZPKABOb0D014xs+koFy9
	gd4SopRc+Kg==
X-Gm-Gg: AeBDieuUx89Ng4rOfxczYELKJ4FkFx2JnbnLJMxwIrXbro69D6NyNNe9H4T8hRMtJt8
	WBdis6JZRyku/Ul0CyKO+mVN3zhJDECTTMH0tjj7oQ7IXgq4Ydh+kUd0U5nQ5npDoYNQ44dP2mw
	oVQ2O1J72s0LgYIV80nvjXnLpE50rebIFE8CqPIWHn23clCYmcZVAeW7VlLPVK6eDqjyDVRU2qD
	FCP9mqVllE3YLYHiRWBYo4b/yzRsILkwJMtkfGUo6YkemKB7JLFgSbTOrpnFz7MK7S94OkWiWlU
	46PxS0f1Z211XU2U3HShqyzntCra/ls1+zwrNNwK1y2W7IznbCVJbmW43UzV4cpluwRqhlndVUy
	pZ3WSo4gylDy6aCCsSPwkl8Dp4OP/CQ21ZTOgoPlI+g7OqjMp82liY5U8qYCr4AU1W0TG47xD7L
	4yh0OBWklnydsgr1Z7+cNbM9jALOcfdPOLAf6gN5nu0Y9wZMm+HhkqNvpomqS9rUGvtmDlDUpbB
	yhUV1rmU0GgES4=
X-Received: by 2002:a05:6000:2f8a:b0:43d:9bb5:bda5 with SMTP id ffacd0b85a97d-43fe3e0ae25mr5397155f8f.40.1776442111193;
        Fri, 17 Apr 2026 09:08:31 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/boot: Force error checking for reserve_e820_ram()
Date: Fri, 17 Apr 2026 17:08:28 +0100
Message-Id: <20260417160828.526063-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1776442112-53B7DD75-4F7A7549/0/0
X-purgate-type: clean
X-purgate-size: 3917
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:email,citrix.com:dkim,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: F159241CF20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Failing to mark Xen as Reserved in the E820 is catastrophic; RAM regions get
handed to the physical memory allocator for general use.  Similarly, failure
to mark the boot modules as reserved is not going to result in a working
system.

Mark reserve_e820_ram() as __must_check, and panic() on failure.  To avoid
opencoding the range in every caller, print a general failure message in
reserve_e820_ram().

Reported-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>

Slightly RFC; only compile tested so far.

There's no obvious fixes tag.  This has been many variations of broken since
forever.
---
 xen/arch/x86/e820.c             |  8 +++++++-
 xen/arch/x86/include/asm/e820.h |  2 +-
 xen/arch/x86/setup.c            | 11 +++++++----
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
index 872208ab3722..f09a01f0c50a 100644
--- a/xen/arch/x86/e820.c
+++ b/xen/arch/x86/e820.c
@@ -670,7 +670,13 @@ int __init e820_change_range_type(
 /* Set E820_RAM area (@s,@e) as RESERVED in specified e820 map. */
 int __init reserve_e820_ram(struct e820map *map, uint64_t s, uint64_t e)
 {
-    return e820_change_range_type(map, s, e, E820_RAM, E820_RESERVED);
+    int res = e820_change_range_type(map, s, e, E820_RAM, E820_RESERVED);
+
+    if ( !res )
+        printk("Failed to convert E820 RAM %"PRIx64"-%"PRIx64" to RESERVED\n",
+               s, e);
+
+    return res;
 }
 
 unsigned long __init init_e820(const char *str, struct e820map *raw)
diff --git a/xen/arch/x86/include/asm/e820.h b/xen/arch/x86/include/asm/e820.h
index 8e7644f8870b..a86d60ce3e77 100644
--- a/xen/arch/x86/include/asm/e820.h
+++ b/xen/arch/x86/include/asm/e820.h
@@ -25,7 +25,7 @@ struct e820map {
 
 extern int sanitize_e820_map(struct e820entry *biosmap, unsigned int *pnr_map);
 extern int e820_all_mapped(u64 start, u64 end, unsigned type);
-extern int reserve_e820_ram(struct e820map *map, uint64_t s, uint64_t e);
+extern int __must_check reserve_e820_ram(struct e820map *map, uint64_t s, uint64_t e);
 extern int e820_change_range_type(
     struct e820map *map, uint64_t s, uint64_t e,
     uint32_t orig_type, uint32_t new_type);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index d041cbd5f6f1..9c1f1eafa0d7 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1639,7 +1639,8 @@ void asmlinkage __init noreturn __start_xen(void)
     {
         uint64_t s = bi->mods[i].start, l = bi->mods[i].size;
 
-        reserve_e820_ram(&boot_e820, s, s + PAGE_ALIGN(l));
+        if ( !reserve_e820_ram(&boot_e820, s, s + PAGE_ALIGN(l)) )
+            panic("Failed to reserve boot module %u in E820\n", i);
     }
 
     if ( !xen_phys_start )
@@ -1652,11 +1653,13 @@ void asmlinkage __init noreturn __start_xen(void)
     /* This needs to remain in sync with remove_xen_ranges(). */
     if ( efi_boot_mem_unused(&eb_start, &eb_end) )
     {
-        reserve_e820_ram(&boot_e820, __pa(_stext), __pa(eb_start));
-        reserve_e820_ram(&boot_e820, __pa(eb_end), __pa(__2M_rwdata_end));
+        if ( !reserve_e820_ram(&boot_e820, __pa(_stext), __pa(eb_start)) ||
+             !reserve_e820_ram(&boot_e820, __pa(eb_end), __pa(__2M_rwdata_end)) )
+            panic("Failed to reserve Xen in E820\n");
     }
     else
-        reserve_e820_ram(&boot_e820, __pa(_stext), __pa(__2M_rwdata_end));
+        if ( reserve_e820_ram(&boot_e820, __pa(_stext), __pa(__2M_rwdata_end)) )
+            panic("Failed to reserve Xen in E820\n");
 
     /* Late kexec reservation (dynamic start address). */
     kexec_reserve_area();

base-commit: 986707b461eb56d75f55581dd1c8e2633f814795
-- 
2.39.5


