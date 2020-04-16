Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C90E1ABD08
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 11:42:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP127-0005VF-Kd; Thu, 16 Apr 2020 09:42:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xq2g=6A=amazon.de=prvs=368a07d89=wipawel@srs-us1.protection.inumbo.net>)
 id 1jP126-0005Uw-3n
 for xen-devel@lists.xen.org; Thu, 16 Apr 2020 09:42:06 +0000
X-Inumbo-ID: 85a1bfb4-7fc6-11ea-8b6d-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85a1bfb4-7fc6-11ea-8b6d-12813bfff9fa;
 Thu, 16 Apr 2020 09:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1587030122; x=1618566122;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=uIb4xj2tgH7IFsq9Zy2xIFcyIZN50bCT56Bc23fuUE0=;
 b=cujHMR7Y93oSRRxeSRWg+ByVzMEafY8GKa/lhBs35exzG1c/HQJP6WH1
 Z/ffLINbNA/U40Kbcn7vCn1vxBOsJuxjc7QhH0/qomiHL8ahR3OUKR8/C
 qYvNEzyN5gjPlYcLudJpZtsILwowC9Jde4hF05BxW/keM4DgRGR7Rhsnn Q=;
IronPort-SDR: M67prEiEzjjQKWR1atCMO4W6H/f51di5RQ5Hs/4aHqemofZyX4FLhlXDWavxFVIqCyLtZaGssN
 SYmgjSgA2etQ==
X-IronPort-AV: E=Sophos;i="5.72,390,1580774400"; d="scan'208";a="37396515"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 16 Apr 2020 09:42:00 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com (Postfix) with ESMTPS
 id DF99DA1F58; Thu, 16 Apr 2020 09:41:58 +0000 (UTC)
Received: from EX13D05EUB001.ant.amazon.com (10.43.166.87) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 16 Apr 2020 09:41:58 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D05EUB001.ant.amazon.com (10.43.166.87) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 16 Apr 2020 09:41:57 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 16 Apr 2020 09:41:55 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Subject: [XTF 2/4] lib: always append CR after LF in vsnprintf()
Date: Thu, 16 Apr 2020 09:41:39 +0000
Message-ID: <20200416094141.65120-3-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.6
In-Reply-To: <20200416094141.65120-1-wipawel@amazon.de>
References: <20200416094141.65120-1-wipawel@amazon.de>
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

The explicit LFCR sequence guarantees proper line by line formatting
in the output.
The '\n' character alone on some terminals is not automatically
converted to LFCR.

Signed-off-by: Pawel Wieczorkiewicz <wipawel@amazon.de>
---
 common/libc/vsnprintf.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/common/libc/vsnprintf.c b/common/libc/vsnprintf.c
index a49fd30..3202137 100644
--- a/common/libc/vsnprintf.c
+++ b/common/libc/vsnprintf.c
@@ -285,6 +285,16 @@ int vsnprintf(char *buf, size_t size, const char *fmt, va_list args)
         if ( *fmt != '%' )
         {
             PUT(*fmt);
+
+            /*
+             * The '\n' character alone on some terminals is not automatically
+             * converted to LFCR.
+             * The explicit LFCR sequence guarantees proper line by line
+             * formatting in the output.
+             */
+            if ( *fmt == '\n' && str < end )
+                PUT('\r');
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




