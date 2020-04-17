Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 815621AD6E3
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 09:06:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPL4p-0001lL-T4; Fri, 17 Apr 2020 07:06:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3sm3=6B=amazon.de=prvs=369b905e4=wipawel@srs-us1.protection.inumbo.net>)
 id 1jPL4o-0001kF-8L
 for xen-devel@lists.xen.org; Fri, 17 Apr 2020 07:06:14 +0000
X-Inumbo-ID: ec55d89a-8079-11ea-b4f4-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec55d89a-8079-11ea-b4f4-bc764e2007e4;
 Fri, 17 Apr 2020 07:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1587107173; x=1618643173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=l/TJTTqBsW2Qk+W7CflHlPQqQTeMk2Ziy87aPeKhtR8=;
 b=duQ3EvjROmJPZs0ebKxZAr14SUrLCqvIYnKFyPlv5h2q5XtksLi4d7w9
 /J/mXl2gnTU/096pjxwQsz7bnPsWVNr54W6nM8R/HdHz8tMEPyCwhTbC/
 nsKyRbVuRdIhIux965NZDgcCT94WccLj//B+bY0HhCbpBrA7NBak/VoS+ Q=;
IronPort-SDR: QKpZsaYWvK5JQHIwh1KDXnpUuIWKPnO0byJA6yZrOwJCTUeKWStqi424LVyNyHDyZMMrwqMnk0
 IiQqFmkj40gg==
X-IronPort-AV: E=Sophos;i="5.72,394,1580774400"; d="scan'208";a="37631727"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 17 Apr 2020 07:06:11 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com (Postfix) with ESMTPS
 id 6EC1BA22CA; Fri, 17 Apr 2020 07:06:11 +0000 (UTC)
Received: from EX13D05EUB002.ant.amazon.com (10.43.166.45) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 17 Apr 2020 07:05:49 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D05EUB002.ant.amazon.com (10.43.166.45) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 17 Apr 2020 07:05:48 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 17 Apr 2020 07:05:46 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Subject: [XTF 5/6] time: Add cycles2{n,u,m}sec functions
Date: Fri, 17 Apr 2020 07:05:27 +0000
Message-ID: <20200417070528.48329-6-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.6
In-Reply-To: <20200417070528.48329-1-wipawel@amazon.de>
References: <20200417070528.48329-1-wipawel@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: julien@xen.org, paul@xen.org, semelpaul@gmail.com,
 andrew.cooper3@citrix.com, Pawel Wieczorkiewicz <wipawel@amazon.de>,
 nmanthey@amazon.de
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In order to easily translate CPU cycles to time values add the
following helpers:
- cycles2nsec()
- cycles2usec()
- cycles2msec()

Signed-off-by: Pawel Wieczorkiewicz <wipawel@amazon.de>
---
 common/time.c      | 17 +++++++++++++++++
 include/xtf/time.h |  5 ++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/common/time.c b/common/time.c
index 3db1f8f..8f73243 100644
--- a/common/time.c
+++ b/common/time.c
@@ -162,6 +162,23 @@ void msleep(uint64_t t)
     mspin_sleep(t);
 }
 
+unsigned long cycles2nsec(uint64_t cycles)
+{
+    return scale_delta(cycles,
+            shared_info.vcpu_info[0].time.tsc_to_system_mul,
+            shared_info.vcpu_info[0].time.tsc_shift);
+}
+
+unsigned long cycles2usec(uint64_t cycles)
+{
+    return cycles2nsec(cycles) / 1000;
+}
+
+unsigned long cycles2msec(uint64_t cycles)
+{
+    return cycles2nsec(cycles) / 1000000;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/include/xtf/time.h b/include/xtf/time.h
index 07fcae5..6aa1efc 100644
--- a/include/xtf/time.h
+++ b/include/xtf/time.h
@@ -43,10 +43,13 @@ void msleep(uint64_t f);
 
 int gettimeofday(struct timeval *tp);
 
-
 /* This returns the current epoch time */
 #define NOW() current_time()
 
+unsigned long cycles2nsec(uint64_t cycles);
+unsigned long cycles2usec(uint64_t cycles);
+unsigned long cycles2msec(uint64_t cycles);
+
 #endif /* XTF_TIME_H */
 
 /*
-- 
2.16.6




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




