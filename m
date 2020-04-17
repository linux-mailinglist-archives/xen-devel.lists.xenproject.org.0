Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8AC1AD6E8
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 09:06:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPL51-0001s1-DK; Fri, 17 Apr 2020 07:06:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3sm3=6B=amazon.de=prvs=369b905e4=wipawel@srs-us1.protection.inumbo.net>)
 id 1jPL4z-0001rQ-Vh
 for xen-devel@lists.xen.org; Fri, 17 Apr 2020 07:06:25 +0000
X-Inumbo-ID: f3b57adc-8079-11ea-b4f4-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3b57adc-8079-11ea-b4f4-bc764e2007e4;
 Fri, 17 Apr 2020 07:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1587107186; x=1618643186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=ohM0/A02cQtDxZuWCKtvIr8AsH7i7i/rmvBHra8TnjM=;
 b=Iq05JnjD0Ksap+A2CMLoa+a+aCdMiyQJ+jkfyeB/osDnSD/mhRK2v8F7
 lj1DVW6W239jFO/I1i+8YuBLqeuDoH5kTqn3qWR0aSL2YiPXJbgGvSSBz
 KtRx/0LMcJ0dGICKMoXZ0vlnHUHSgzcLuDhEbOgbLk5labBs50RpMQhnW Q=;
IronPort-SDR: /gCX9Bs9KaV8s7+165BhnxqcrciZ2hP71u0dos2O8eUjPUQxjrJmVL3fhlouF8tIIOa5de3rZq
 8Ltkwv+SMVhg==
X-IronPort-AV: E=Sophos;i="5.72,394,1580774400"; d="scan'208";a="25912318"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 17 Apr 2020 07:06:14 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com (Postfix) with ESMTPS
 id D57D3A2747; Fri, 17 Apr 2020 07:06:11 +0000 (UTC)
Received: from EX13D05EUB003.ant.amazon.com (10.43.166.253) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 17 Apr 2020 07:05:51 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D05EUB003.ant.amazon.com (10.43.166.253) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 17 Apr 2020 07:05:50 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 17 Apr 2020 07:05:48 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Subject: [XTF 6/6] event_channels: Add EVTCHNOP_bind_vcpu hypercall support
Date: Fri, 17 Apr 2020 07:05:28 +0000
Message-ID: <20200417070528.48329-7-wipawel@amazon.de>
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

Signed-off-by: Pawel Wieczorkiewicz <wipawel@amazon.de>
---
 include/xen/event_channel.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/xen/event_channel.h b/include/xen/event_channel.h
index 62ee95a..6253b89 100644
--- a/include/xen/event_channel.h
+++ b/include/xen/event_channel.h
@@ -2,6 +2,7 @@
 #define XEN_PUBLIC_EVENT_CHANNEL_H
 
 #define EVTCHNOP_send             4
+#define EVTCHNOP_bind_vcpu        8
 #define EVTCHNOP_init_control    11
 #define EVTCHNOP_expand_array    12
 
@@ -22,6 +23,12 @@ struct evtchn_expand_array {
     uint64_t array_gfn;
 };
 
+struct evtchn_bind_vcpu {
+    /* IN parameters. */
+    evtchn_port_t port;
+    uint32_t vcpu;
+};
+
 #endif /* XEN_PUBLIC_EVENT_CHANNEL_H */
 
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




