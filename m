Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B661B58FE
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 12:20:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRYyG-0000Ep-UY; Thu, 23 Apr 2020 10:20:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=19NY=6H=amazon.de=prvs=375504273=wipawel@srs-us1.protection.inumbo.net>)
 id 1jRYyF-0000EQ-Lm
 for xen-devel@lists.xen.org; Thu, 23 Apr 2020 10:20:39 +0000
X-Inumbo-ID: 1451a91a-854c-11ea-b4f4-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1451a91a-854c-11ea-b4f4-bc764e2007e4;
 Thu, 23 Apr 2020 10:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1587637239; x=1619173239;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=j3FfvDGo3qJ5fQVQXM9t+enbQsU+W2azdmSHMXpnb3c=;
 b=GSdEeXrT4yJAXvX0AYbSsqOuut8UaGIicNq8g+KRdGJCmyt3WYibXFcC
 SKfRJ9600pkSOCNW3eQrAb+b2ouE9Xp1Pcx2OvMl7s5bA/5eNi0PYQoqg
 kMp/ozUq7O7s/jkKCBADY2NMVdmi5wlWy6Aj5Hh7uU0k+lVJc9wCDHB+C M=;
IronPort-SDR: rbU6kMBziHV1szQVK5WuWQIjmpuakKme6MeqhKcZJasEf/NfJOmBftSy5gESGJTu8LImbnCk5A
 bd1wItlvqVpg==
X-IronPort-AV: E=Sophos;i="5.73,306,1583193600"; d="scan'208";a="26939148"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-397e131e.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 23 Apr 2020 10:20:38 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-397e131e.us-west-2.amazon.com (Postfix) with ESMTPS
 id B2B38A271A; Thu, 23 Apr 2020 10:20:37 +0000 (UTC)
Received: from EX13D02EUB001.ant.amazon.com (10.43.166.150) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 23 Apr 2020 10:20:05 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D02EUB001.ant.amazon.com (10.43.166.150) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 23 Apr 2020 10:20:05 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 23 Apr 2020 10:20:03 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Subject: [XTF v2 v2 2/4] lib: always append CR after LF in vsnprintf()
Date: Thu, 23 Apr 2020 10:19:53 +0000
Message-ID: <20200423101955.13761-3-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.6
In-Reply-To: <20200423101955.13761-1-wipawel@amazon.de>
References: <20200423101955.13761-1-wipawel@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: julien@xen.org, wipawel@xen.org, paul@xen.org, semelpaul@gmail.com,
 andrew.cooper3@citrix.com, wipawel@amazon.de, nmanthey@amazon.de
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The explicit LFCR sequence guarantees proper line by line formatting
in the output.
The '\n' character alone on some terminals is not automatically
converted to LFCR.

Signed-off-by: Pawel Wieczorkiewicz <wipawel@amazon.de>
---
Changed since v1:
  * Emit CRLF instead of LFCR

 common/libc/vsnprintf.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/common/libc/vsnprintf.c b/common/libc/vsnprintf.c
index a49fd30..b9a4fab 100644
--- a/common/libc/vsnprintf.c
+++ b/common/libc/vsnprintf.c
@@ -284,7 +284,17 @@ int vsnprintf(char *buf, size_t size, const char *fmt, va_list args)
         /* Put regular characters into the destination. */
         if ( *fmt != '%' )
         {
+            /*
+             * The '\n' character alone on some terminals is not automatically
+             * converted to CRLF.
+             * The explicit CRLF sequence guarantees proper line by line
+             * formatting in the output.
+             */
+            if ( *fmt == '\n' && str < end )
+                PUT('\r');
+
             PUT(*fmt);
+
             continue;
         }
 
-- 
2.16.6




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




