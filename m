Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CAC3E1682
	for <lists+xen-devel@lfdr.de>; Thu,  5 Aug 2021 16:08:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164281.300567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBe3A-0004XZ-5z; Thu, 05 Aug 2021 14:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164281.300567; Thu, 05 Aug 2021 14:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBe3A-0004Te-23; Thu, 05 Aug 2021 14:08:44 +0000
Received: by outflank-mailman (input) for mailman id 164281;
 Thu, 05 Aug 2021 14:08:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DXIG=M4=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mBe38-0003hf-I3
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 14:08:42 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ff038ee-f5f6-11eb-9c12-12813bfff9fa;
 Thu, 05 Aug 2021 14:08:36 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1628172450550595.1687159804446;
 Thu, 5 Aug 2021 07:07:30 -0700 (PDT)
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
X-Inumbo-ID: 9ff038ee-f5f6-11eb-9c12-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1628172466; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZqsvYH/jB604kH1cHhu3g5Uhuuk2zCR0JWdM8wWQPFCIx0UhFYnIvX7fOinzVnHiNmIAtT0b96UwGBC0XxxyTtau+ROPl0c01Dzz1qoZWcZSWJLBNhxecN6H82DeYrwAQD1Msi5Si6s1sY6eCVzzKw9sIri2n/UOjidUVKKQriY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1628172466; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=+34+h6RYBNDx8+NRBy9hHDiKcY7OZY/fR2RxH8zvDwA=; 
	b=GFcK5W/ADbd5NURmbbWRRE0je3r7GRHNpINuzlPDTIKvTaGDU+w40gc7CnoE+owNw/FhppDS+Q8APq/9OIzESVfVg44Br8tEe+7HEss69m12IpQqXw3VojcdCV2dlNZd4BPr2Wo8OD8GzHa/bmiCZt/GH98tkwP9rw98Qu3vM6U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1628172466;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=+34+h6RYBNDx8+NRBy9hHDiKcY7OZY/fR2RxH8zvDwA=;
	b=EXXD3Gy9Sh2+hMccOagPv8+NVgav7YFbYRX0pTC11x5NSZ/NEHqHNZeeRSGN+ASh
	gE9no+b6RNMJgngTvFZytKZX9bU/Ichl2A3xShnSMCEqjqq0DE1DI/Q6R4xFKpRmIWj
	JwVfAziAl48Wv/CzeWznJEgI/+UhT1HSSfw8HAzk=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 6/7] xsm: drop generic event channel labeling exclusion
Date: Thu,  5 Aug 2021 10:06:43 -0400
Message-Id: <20210805140644.357-7-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210805140644.357-1-dpsmith@apertussolutions.com>
References: <20210805140644.357-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The internal define flag is not used by any XSM module, removing the #ifdef
leaving the generic event channel labeling as always present.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/include/xen/sched.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 28146ee404..b089324510 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -120,15 +120,12 @@ struct evtchn
     unsigned short notify_vcpu_id; /* VCPU for local delivery notification */
     uint32_t fifo_lastq;           /* Data for identifying last queue. */
 
-#ifdef CONFIG_XSM
     union {
-#ifdef XSM_NEED_GENERIC_EVTCHN_SSID
         /*
          * If an XSM module needs more space for its event channel context,
          * this pointer stores the necessary data for the security server.
          */
         void *generic;
-#endif
 #ifdef CONFIG_XSM_FLASK
         /*
          * Inlining the contents of the structure for FLASK avoids unneeded
@@ -138,7 +135,6 @@ struct evtchn
         uint32_t flask_sid;
 #endif
     } ssid;
-#endif
 } __attribute__((aligned(64)));
 
 int  evtchn_init(struct domain *d, unsigned int max_port);
-- 
2.20.1


