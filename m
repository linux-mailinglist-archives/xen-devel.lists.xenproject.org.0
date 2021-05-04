Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C02372B5B
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 15:50:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122443.230949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldvRY-0006Os-12; Tue, 04 May 2021 13:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122443.230949; Tue, 04 May 2021 13:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldvRX-0006OS-UB; Tue, 04 May 2021 13:50:31 +0000
Received: by outflank-mailman (input) for mailman id 122443;
 Tue, 04 May 2021 13:50:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c6am=J7=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ldvRW-0006OM-Ry
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 13:50:30 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6058fdbc-5f11-40a9-a20e-6e5bf9a8a7ca;
 Tue, 04 May 2021 13:50:29 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.25.6 AUTH)
 with ESMTPSA id J02652x44DoO0uW
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 4 May 2021 15:50:24 +0200 (CEST)
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
X-Inumbo-ID: 6058fdbc-5f11-40a9-a20e-6e5bf9a8a7ca
ARC-Seal: i=1; a=rsa-sha256; t=1620136224; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=qE8yF2Dns1Tls5uOBaKOIKql6WE9W5vhBtEi5pPPUA0+ClFUzz0DVEeKVdyHz7O8N3
    rsTZibD/YRrMbZC4cYV0V61eE28KkqBz2WZX64YVsMP5xQisg3v6El0F6gcnbGsHF3Mt
    eQAu++0sp338KLqtWhInSgN2LcsMyTJmvOjOzE9eOK1IY1Rm1D4t1BNj/CHi/xjs9XI+
    AhFRIl/MKJWoyXKdW1avb93ayqPbS29ro6KxW3AkM3FKkTr2FzGqgfr5kmzRgn8YevXx
    vQlwA0ElN+9L+LaLEvgAjzDBw4VcGSCy43PuYkumXe4Eqa8AEtTzCiuygRH2dO853/v3
    zLWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620136224;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=vDyx0ZuQU8vpmVvwjvDTlZpcimiw0UixQ+F6nK5gDqk=;
    b=QKHMa4IfSyrr3d9DaGPaYp4DHp6Mnoo7UvcJ9qr5EjbF5B5Ixv65cP6EwLBFOZjD+Z
    SRcAp3RotZYd5oNY0+DnyvyEXrQdF5wgzt6SVWMrC0+CKaj3bgtiJzvgKAtWb31bG3Go
    7D5yQpr85k4sB/hhESQhw0wDvSab3GMpLmWKz+DcPNxCsuvIefMCw4y2B/1q/bUl29HT
    ouIguslYOZlDSkiZUI4o8NLn+BfiLKW+h9OlaO3ZKGDMKq+hpypmaAcW34Z8hp8thv0u
    u12p5PhLyBoUhGSRbtTBjpMKXRpy09ojQhfN/WF0xeA9SoHoFEXBbKNVYPdyFRoBghfB
    CrKg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620136224;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=vDyx0ZuQU8vpmVvwjvDTlZpcimiw0UixQ+F6nK5gDqk=;
    b=FHiXEafxsSp8GxzKVKYzSwqAg5SrPMzeC+fxjqcHDjd9EacwG1lLqZc9UoyR6UuMN1
    H2+zDRULf58jbkx6kT2YYc9UIl17eyykh+StGhY6Rz1Wv3rc4SfyWIrQE97A95kz3MP9
    cnBqvuA8OV3AX8hWoa3Y29pWbNS6H5gPOxMIUfu3o5enC0Q5iy83q3V3flryZbpP8KNz
    9hJp7uobuMJt/S4sY7HHqiN0tCs8iaMipLNlCT2XwEg6o/wsZJCMykLanF68PUNA7mXH
    NzYvHCHQAdeW6t2gh0RNsJk++BoNbNjf9JmYtgLx6X7DFYfDNVQRnxwTRQU5BGaEf9Jw
    kiLg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgtl+1b1FMstFZvCqIQN5N7TvWFg4vzhFVdoKAuQ"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1] tools: fix incorrect suggestions for XENCONSOLED_TRACE on FreeBSD
Date: Tue,  4 May 2021 15:50:21 +0200
Message-Id: <20210504135021.8394-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

--log does not take a file, it specifies what is supposed to be logged.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/hotplug/FreeBSD/rc.d/xencommons.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/hotplug/FreeBSD/rc.d/xencommons.in b/tools/hotplug/FreeBSD/rc.d/xencommons.in
index ccd5a9b055..36dd717944 100644
--- a/tools/hotplug/FreeBSD/rc.d/xencommons.in
+++ b/tools/hotplug/FreeBSD/rc.d/xencommons.in
@@ -23,7 +23,7 @@ required_files="/dev/xen/xenstored"
 
 XENSTORED_PIDFILE="@XEN_RUN_DIR@/xenstored.pid"
 XENCONSOLED_PIDFILE="@XEN_RUN_DIR@/xenconsoled.pid"
-#XENCONSOLED_TRACE="@XEN_LOG_DIR@/xenconsole-trace.log"
+#XENCONSOLED_TRACE="none|guest|hv|all"
 #XENSTORED_TRACE="@XEN_LOG_DIR@/xen/xenstore-trace.log"
 
 load_rc_config $name

