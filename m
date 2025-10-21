Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CACBF7241
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 16:45:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147378.1479697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBDcM-00044K-Rf; Tue, 21 Oct 2025 14:45:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147378.1479697; Tue, 21 Oct 2025 14:45:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBDcM-00041i-NO; Tue, 21 Oct 2025 14:45:42 +0000
Received: by outflank-mailman (input) for mailman id 1147378;
 Tue, 21 Oct 2025 14:45:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vC3x=46=bounce.vates.tech=bounce-md_30504962.68f79c93.v1-67efe091a7004ec5a13e520c0b6cb7ed@srs-se1.protection.inumbo.net>)
 id 1vBDcL-00041a-Sq
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 14:45:41 +0000
Received: from mail187-3.suw11.mandrillapp.com
 (mail187-3.suw11.mandrillapp.com [198.2.187.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ce1cff4-ae8c-11f0-9d15-b5c5bf9af7f9;
 Tue, 21 Oct 2025 16:45:40 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-3.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4crZpq2gWPzDRJ9QJ
 for <xen-devel@lists.xenproject.org>; Tue, 21 Oct 2025 14:45:39 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 67efe091a7004ec5a13e520c0b6cb7ed; Tue, 21 Oct 2025 14:45:39 +0000
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
X-Inumbo-ID: 9ce1cff4-ae8c-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761057939; x=1761327939;
	bh=eAyBFhluLadZ+1q0M6eMqGhRq5AQrdpORdrbrl3BA70=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=iAj/JBI6MWhhbsZ/p6gz7laMLPeH/M7z1zPttgsjZQzR/GZU8TNMYeq2bcQfHcK5X
	 z+H7OOAkTIHgSF8K+dELgi6PFwho5Vdy8OQyw5eKqFRYasZoCxEKGpIW0CWLJweKTe
	 /EtqanBpOLCBgVPVK/b7NRRZL71SG6Cjmbw2zNwVDoHnh3qsNAz1N1OTRkdSD/jUgQ
	 k7LBYGfsbVg1ISro6DDyM7Qn6Bdu995FmWmg3hB7SHzunXf/H/5j7WY9FKQI0Y9RmX
	 inCYy2+ySNvXTuZQGZEV9ibSUool/4vwnWDSZS1iwApasfjBD7/DkSBu7MWMJaQN3a
	 KPBooawhp+AzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761057939; x=1761318439; i=teddy.astie@vates.tech;
	bh=eAyBFhluLadZ+1q0M6eMqGhRq5AQrdpORdrbrl3BA70=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=ydq/PT9up5/Urs36y8RADcejoXwaFaOnwvmhSO3axqyhgsLN0k+0J3mQyAn8mtc0I
	 avphO8zmfamUXj9Ir+QTY/nUIxNATq3S1jMr5T5gsM40dQCKkQ63wZ/lwYKIEMwz9y
	 8Vs3CR8sjAZ2MMgkD5xA7qWXnS5p1fGKL39CtKhgcKuhQsnDFpSTPPSZyN+PIwu1DY
	 m1kMrHoiY7JIVEGHTFAKT+5EQlek4q0TPmPLVZX9jeJa5tDhr/li+Mj2b75qPoIEVn
	 AJth38Q/pRtqG9F4Pb/Azc4GbP+f0VFTKesg7OI4I+XNtPmffXuiQPPwps5NIOqsi/
	 aGW+C4qb+nvEg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20vtd:=20Inline=20redundant=20nr=5Fioapic=5Fentries=20macro?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761057937390
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <f47bc8e2b6d3f28def51cc1861fda22d7658579d.1761057749.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.67efe091a7004ec5a13e520c0b6cb7ed?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251021:md
Date: Tue, 21 Oct 2025 14:45:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

This macro was there when ia64 was a thing, nowaday, this macro isn't meaningful
anymore and is actually a slightly disguised nr_ioapic_entries array access.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/drivers/passthrough/vtd/intremap.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
index 9272a25113..7726ee618a 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -31,7 +31,6 @@
 
 #include <asm/apic.h>
 #include <asm/io_apic.h>
-#define nr_ioapic_entries(i)  nr_ioapic_entries[i]
 
 /*
  * source validation type (SVT)
@@ -68,7 +67,7 @@ static int init_apic_pin_2_ir_idx(void)
 
     nr_pins = 0;
     for ( i = 0; i < nr_ioapics; i++ )
-        nr_pins += nr_ioapic_entries(i);
+        nr_pins += nr_ioapic_entries[i];
 
     _apic_pin_2_ir_idx = xmalloc_array(int, nr_pins);
     apic_pin_2_ir_idx = xmalloc_array(int *, nr_ioapics);
@@ -86,7 +85,7 @@ static int init_apic_pin_2_ir_idx(void)
     for ( i = 0; i < nr_ioapics; i++ )
     {
         apic_pin_2_ir_idx[i] = &_apic_pin_2_ir_idx[nr_pins];
-        nr_pins += nr_ioapic_entries(i);
+        nr_pins += nr_ioapic_entries[i];
     }
 
     return 0;
-- 
2.51.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


