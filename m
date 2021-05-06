Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C08A375660
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 17:17:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123636.233249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lefkV-0007Sj-F8; Thu, 06 May 2021 15:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123636.233249; Thu, 06 May 2021 15:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lefkV-0007QB-Aj; Thu, 06 May 2021 15:17:11 +0000
Received: by outflank-mailman (input) for mailman id 123636;
 Thu, 06 May 2021 15:17:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PObI=KB=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lefkT-0007NO-BU
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 15:17:09 +0000
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:400:200::b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fcd6c39-16e5-4867-b9f5-96a4ad40523b;
 Thu, 06 May 2021 15:17:08 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.25.6 AUTH)
 with ESMTPSA id V0bf6dx46FH30Kr
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 6 May 2021 17:17:03 +0200 (CEST)
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
X-Inumbo-ID: 1fcd6c39-16e5-4867-b9f5-96a4ad40523b
ARC-Seal: i=1; a=rsa-sha256; t=1620314224; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=jzBcN2Rmupd0W1QlGCEEpZOie/G31WOdExFfoQkC6A76xEpCKg0NsM0Pweb3BoLzfR
    eeQVeYDOffC4ES1tGNOVo5hqZm8W61qforXkhiNas4YiHvKlB7PLnn3NhLNiiwWsLPIp
    ORGeW/jUT4AkVesZ4oBWoapAEYg59L2s6j9dRMKadDtnZQOjWb5BLGMXmbKmEalDdPDk
    z3F76UX2QWmMo3w1QXi0exAI0w6MBT89nfRprs7vQRCZ+geVup5kam/iaRUZyUx2vp4R
    N2ahidKBKorLJc0PdQxEsUuyzuxG8covtAUuOCVipqLl6ApRyPShJAGVMUe9RDF/yEDu
    hutg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620314224;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=FxbKl46WH8hAOJ0YzhvXx5JTFJunhpUurX0R/y8sMCM=;
    b=n4RcCjDeJT4MUegPYhnoe33gScGt1iZ7ZgT1IV+d0WUJ6VRwUAFH4pUXEI6+J7nP1D
    k0UU6HprK5QfzUM2fSMqzsmWIvxE0WPpsKmfvuqeqI1Ey0vwktAS1+gkkMLNRi5P93N6
    bA4xdQxwHwCPDIFQmn/SLvCe0GJPNzlSBPn3JQBI+Y9+LY5Xzkm+KMijuD7K/XhOog6l
    YHN3HeU4NnbYrqcVf/XMGoO/WlhXSaXnvuiwgBdfsfPbnMVrdwbDmBNX7hwi70wxUqGX
    MumLi5423GUqRisI7b4mVFl2ib+DfCN+I+xFs/jBgsbG0HYkuvUU+yTHWqOE/NwKWZmu
    6r/w==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620314224;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=FxbKl46WH8hAOJ0YzhvXx5JTFJunhpUurX0R/y8sMCM=;
    b=bUBTYqB+f8GpAS9Ba42kS4RGYviIWVHbX54uvoTHQSi9VHVsD/Mrfz25iFH0FYAfoO
    HrXlvdVKDsKeC9kKSzsR8gQKJWq/ONgkuz6/ynd+egzGwaewUWLtxhkWeFvGQEAq+5BY
    BB5FpsTAR57K3RMNhQVThurTXuKJKOUfVZRBNDbzwJSLFEAxmSLQPglIFjgdGo0GYwE2
    DzrVSpeao0Znysnlr2UehuCtu7K7FhKrF52m10lG+tBuwEwSD3S12kR2ktH7W6xE2XNo
    jKVoryswEy6g81zzNQW54mdxkS7WvLpQGCJzvKTbTU86FrS7tbqvCupKaD7I6YN7fIlx
    Axlg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgtl+1b1FMstFZvCqIQN5N7TvWFg4vzhFVdoKAuQ"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] tools: fix incorrect suggestions for XENCONSOLED_TRACE on BSD
Date: Thu,  6 May 2021 17:17:01 +0200
Message-Id: <20210506151701.1343-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

--log does not take a file, it specifies what is supposed to be logged.

Also separate the XENSTORED and XENCONSOLED variables by a newline.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/hotplug/FreeBSD/rc.d/xencommons.in | 5 +++--
 tools/hotplug/NetBSD/rc.d/xencommons.in  | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/tools/hotplug/FreeBSD/rc.d/xencommons.in b/tools/hotplug/FreeBSD/rc.d/xencommons.in
index ccd5a9b055..4c61d8c94e 100644
--- a/tools/hotplug/FreeBSD/rc.d/xencommons.in
+++ b/tools/hotplug/FreeBSD/rc.d/xencommons.in
@@ -21,9 +21,10 @@ status_cmd="xen_status"
 extra_commands="status"
 required_files="/dev/xen/xenstored"
 
-XENSTORED_PIDFILE="@XEN_RUN_DIR@/xenstored.pid"
 XENCONSOLED_PIDFILE="@XEN_RUN_DIR@/xenconsoled.pid"
-#XENCONSOLED_TRACE="@XEN_LOG_DIR@/xenconsole-trace.log"
+#XENCONSOLED_TRACE="none|guest|hv|all"
+
+XENSTORED_PIDFILE="@XEN_RUN_DIR@/xenstored.pid"
 #XENSTORED_TRACE="@XEN_LOG_DIR@/xen/xenstore-trace.log"
 
 load_rc_config $name
diff --git a/tools/hotplug/NetBSD/rc.d/xencommons.in b/tools/hotplug/NetBSD/rc.d/xencommons.in
index 3981787eac..80e518f5de 100644
--- a/tools/hotplug/NetBSD/rc.d/xencommons.in
+++ b/tools/hotplug/NetBSD/rc.d/xencommons.in
@@ -20,9 +20,10 @@ status_cmd="xen_status"
 extra_commands="status"
 required_files="/kern/xen/privcmd"
 
-XENSTORED_PIDFILE="@XEN_RUN_DIR@/xenstored.pid"
 XENCONSOLED_PIDFILE="@XEN_RUN_DIR@/xenconsoled.pid"
-#XENCONSOLED_TRACE="@XEN_LOG_DIR@/xenconsole-trace.log"
+#XENCONSOLED_TRACE="none|guest|hv|all"
+
+XENSTORED_PIDFILE="@XEN_RUN_DIR@/xenstored.pid"
 #XENSTORED_TRACE="@XEN_LOG_DIR@/xenstore-trace.log"
 
 xen_precmd()

