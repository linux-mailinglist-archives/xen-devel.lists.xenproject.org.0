Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oafHEG07Vmqy1wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 15:36:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0387553A2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 15:36:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=dwHjF2nW;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1362390.1614216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjdId-00015E-Cw; Tue, 14 Jul 2026 13:35:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362390.1614216; Tue, 14 Jul 2026 13:35:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjdId-000133-AI; Tue, 14 Jul 2026 13:35:51 +0000
Received: by outflank-mailman (input) for mailman id 1362390;
 Tue, 14 Jul 2026 13:35:50 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wjdIc-00012x-Kq
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 13:35:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjdIb-00BfDU-IF
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 15:35:49 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a563b2d-2eae-0a2a0a5409dd-0a2a4508d934-20
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 15:35:49 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a563b35-f659-0a2a45080019-d155dd35d535-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 15:35:49 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-47c6e9a694bso2404099f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 06:35:49 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-495087366c0sm145127875e9.7.2026.07.14.06.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 06:35:47 -0700 (PDT)
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
        d=citrix.com; s=google; t=1784036149; x=1784640949; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcX74k/358IG8rk50bDhHQk6v6yxS+6nIWIEc4UqUHw=;
        b=dwHjF2nWiDeVJlaLr0XSBciPP/t+yvWVsYy+vnHJin8pKMk0zCsmD1/bGpHzkQ6/TV
         2xMbcSQHPHDEFV0F31MFhvyF/8SgdrpefqBX81mbDqhGlShtsbevVq1DRQnqwhL3S+bJ
         QYdeWfcMVGL3chglntXRI+3PvZCZ2BZmKQgoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784036149; x=1784640949;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gcX74k/358IG8rk50bDhHQk6v6yxS+6nIWIEc4UqUHw=;
        b=K9DVyXisK6aQ1AZi3NY+xpgQ/Q8aRRGJWhp9w7X/VgLF/Qul6PoDc1R4STu3AT4Zpe
         HGuOfJ1NHDKKPxhBokIcJVIrVKkAUwph43eg8WMNe7LWtZTOSAfuMUhzYK1mRxmsKWlj
         FyPco/cydIKLStHLEZQu/QsGoOGUrELq+zEWkaDPU1mVdsi0Z5v84hoRHJfezwv9/kmy
         BblqFLZC4yah5puzTspjgRcGrZzWJD5sOkMAoRXDTYFbQPdnru7hLBeszqUh/7z8pHwI
         P7o9onqEYJ8i49MfMqu1GhkzuC5hcs8OS1S/HXb6kpCLT1PoS+duTR7LK7btqc0LDni/
         xpaQ==
X-Gm-Message-State: AOJu0Yx4xvgZjvO/WC4JtrKhqmFp79tIlWFwq2QajSViE62l9t2bAXRS
	K0QSXm8ji34ZgftorIKYCCHp9pxzaSAUqMTAZm2OGGMlsC2CHUOJ4BbRSkwyzb7/sfexj7lhPqa
	ZvAh9
X-Gm-Gg: AfdE7cllT3nta4LCVVoMSF44hiz9WVMEU4/gV38sb//RW49pLjHmQl/spoBSka8yNdN
	6FFSP/Yqjo7VriEjXXRsTbQzvzSmwRJveEHjva+AtIJ6A9txaTQk5R6PUx7+KUOXS2nbo+sxMH+
	gY/85DG+orC+29eXdr2BLFYFHZjAt/at42k4pQ1FxovWLmpqbsNSok6hYlxPYqMoEUvdz7uSHXi
	H0R1y+MVIHrsbeiBATeEGCOA82g1qE8Tz/QudheaJcATEnRa0FD48hIAUWeOjb5gvyq/q16FjRk
	Zw2EEj+h4/3gdAQ1UnY0NvtQYwW8yKFvJ0KYYGmv4gJKMoEzMcobt60nx5mrjJve7RIIOZJCyfM
	C2g6gBP5qQPJ5dWiHDtPWhUoDC45uBSxEcQt3zRih4YJ7/TZ91HmlWhm3AiNhhl+MB2Lfk5g9/l
	S7V/QgByDAdbqj8yywbq93veeTLzvKFijvegFl1SKhVPy1u5BBFTXZ2ZMQcTiQhjI=
X-Received: by 2002:a05:600c:8284:b0:493:a5f9:d33d with SMTP id 5b1f17b1804b1-493f8824395mr142823185e9.18.1784036148105;
        Tue, 14 Jul 2026 06:35:48 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] x86/pv: Only use the guest frame in pv_map_ldt_shadow_page()
Date: Tue, 14 Jul 2026 14:35:46 +0100
Message-Id: <20260714133546.1686108-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1784036149-CF75B87B-CA0A27C3/10/73395122804
X-purgate-type: spam
X-purgate-size: 2581
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,citrix.com:from_mime,citrix.com:mid,citrix.com:email,citrix.com:dkim,suse.com:email,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[citrix.com,suse.com,vates.tech,gmail.com];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7D0387553A2

pv_map_ldt_shadow_page() takes the whole guest PTE, adds _PAGE_RW to it, then
installs it into Xen's pagetables.  It has had this behaviour ever since LDT
support was added in 2003.

However, it allows the guest to control the software available bits and
cacheability.  This happens to be benign right now, but is bad form.

Use only the guest frame, and construct the mapping as regular RW frame, and
notably includes NX.  This is how the GDT logic already works.

Fixes: 005c2723972f ("Finished virtualisation of x86 LDT")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

For 4.22.  The security team have deemed this not an XSA, but it came
alarmingly close.

This was found originally in an LLM review of the ASI series, where a real
vulnerability had been introduced by using one of the software available bits
to mean "please free this page on unmap".  The LLM did not the issues with
attributes (the guest could almost load a Shadow Stack mapping, saved only by
the forced addition of _PAGE_RW), and the cacheability (saved only because of
how conflicting MTRR and PAT values resolve).

An interesting commit is 928a6621db20 ("Fix bug in new LDT shadow mapping
code", 2003) which did restrict to the guest frame only, but without inserting
_PAGE_PRESENT or any other attributes, so got reverted in the following commit
6841936e9256.
---
 xen/arch/x86/pv/mm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/pv/mm.c b/xen/arch/x86/pv/mm.c
index 3f2e9dedcde3..5378299b8cef 100644
--- a/xen/arch/x86/pv/mm.c
+++ b/xen/arch/x86/pv/mm.c
@@ -53,7 +53,7 @@ bool pv_map_ldt_shadow_page(unsigned int offset)
     struct vcpu *curr = current;
     struct domain *currd = curr->domain;
     struct page_info *page;
-    l1_pgentry_t gl1e, *pl1e;
+    l1_pgentry_t gl1e, *pl1e, nl1e;
     unsigned long linear = curr->arch.pv.ldt_base + offset;
 
     BUG_ON(in_irq());
@@ -88,9 +88,9 @@ bool pv_map_ldt_shadow_page(unsigned int offset)
     }
 
     pl1e = &pv_ldt_ptes(curr)[offset >> PAGE_SHIFT];
-    l1e_add_flags(gl1e, _PAGE_RW);
+    nl1e = l1e_from_pfn(l1e_get_pfn(gl1e), __PAGE_HYPERVISOR_RW);
 
-    l1e_write(pl1e, gl1e);
+    l1e_write(pl1e, nl1e);
 
     return true;
 }

base-commit: e3aa330017c533cc312ee4751b8387d988682efc
-- 
2.39.5


