Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7A9372B6B
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 15:54:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122450.230960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldvUx-0006ZU-Hk; Tue, 04 May 2021 13:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122450.230960; Tue, 04 May 2021 13:54:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldvUx-0006Z8-Eh; Tue, 04 May 2021 13:54:03 +0000
Received: by outflank-mailman (input) for mailman id 122450;
 Tue, 04 May 2021 13:54:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c6am=J7=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ldvUw-0006Z3-7E
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 13:54:02 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff44761c-c1d1-48b8-b034-eeb66289ca27;
 Tue, 04 May 2021 13:54:01 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.25.6 AUTH)
 with ESMTPSA id J02652x44Dru0vh
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 4 May 2021 15:53:56 +0200 (CEST)
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
X-Inumbo-ID: ff44761c-c1d1-48b8-b034-eeb66289ca27
ARC-Seal: i=1; a=rsa-sha256; t=1620136437; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=p0e0DsfG8nIClEAgYjt0FvcuCEbWCVtXJ81V4dPmA0CblLU0g3AHbIFQ13fHiOpf4h
    SHeHjEcATKY4W6OmC82eFSk6CIA47CdUsMTNegRUVYEVRT4Vat/d6g1k84eCIIwtLALv
    31TX4yoSOT9uPxrEdD9soMYaRCAbtpYsEMuMwxUzGDFBdjTilID0h+vi8s4Hyh2rrtr+
    QIvM1FvmoRNL906lHf0KOE8IXz4+I7xeW5O/jIOA7+3+xMNaGd6Lw0aEfcnzArA03rio
    iLvzJiz4MiU+EHvMhFOUNEWeRbbMx8De1Z70yTZw5l9u9Be+Iqbm9m/kMGshB8SAAH7F
    je+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620136437;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=FXlZHQ7OeC7ioZObcBYOZq1PikOoW2WB/4QAzUkhgS0=;
    b=I/UjySNyF+RErM9+DYg10bmAmrggqQUo0PaTjqIymAuBY8eaHFL3+eaT6v4RzIGr5A
    ReHNFclj23Her5nKHwF60t7sY5cMXfyZG+DWCPvorlPRIFSVIygK4x33oly++/E5Cl9l
    Aei5mD2oPJELXEXvDNhAgFRVegOpUwAEHt+UYSPi8vZ8Tn4Np9VNxX6tN8OCRZye8LF/
    B8PrbbXopGD0XAa5Wl5tu28Vd+dSv+OPZna8KGTp7uy9CLsrZwPtBXLCzLjokeokDwWg
    S79VV+3cKdb9ZhnDH42ycL8lBFfGePqtJBzfIwDsSeHiEE59YOaADNGYDH4VVJdk7xDc
    hMGg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620136437;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=FXlZHQ7OeC7ioZObcBYOZq1PikOoW2WB/4QAzUkhgS0=;
    b=EqaDcYeCk4BHC+yPCfppXSObsxBfImWQt9sJGpkXn8tSLexTy1hGC5eQ7HiR3rFgfO
    eLxbdaF/2vUupKYUYWXkZLsts6lo+BjekkDfp+C7aJ4lYvqBY4o2juKPL9Aa5foAe4qM
    soAH/u6xvl64YEnvOJ9kYm7M0oVlHaLcfM/v7PcCoA6e/JCE4nHa0NIYHInwmPMEmTjW
    rQzE+cU01uZrJguf51v/uMtyWcDedvcsTzDYkWksPL0BrCnR6Qpo4YoXHtTrdMwfOFZ9
    UKiId7Gk8G22qIPdPP8keqq1R8R/r6VktQpqEKvfxbX//aG0Ul7KUbIYwj1rEdLBsJ32
    1oyA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgtl+1b1FMstFZvCqIQN5N7TvWFg4vzhFVdoKAuQ"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1] tools: fix incorrect suggestions for XENCONSOLED_TRACE on NetBSD
Date: Tue,  4 May 2021 15:53:55 +0200
Message-Id: <20210504135355.8668-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

--log does not take a file, it specifies what is supposed to be logged.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/hotplug/NetBSD/rc.d/xencommons.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/hotplug/NetBSD/rc.d/xencommons.in b/tools/hotplug/NetBSD/rc.d/xencommons.in
index 3981787eac..7f739206c1 100644
--- a/tools/hotplug/NetBSD/rc.d/xencommons.in
+++ b/tools/hotplug/NetBSD/rc.d/xencommons.in
@@ -22,7 +22,7 @@ required_files="/kern/xen/privcmd"
 
 XENSTORED_PIDFILE="@XEN_RUN_DIR@/xenstored.pid"
 XENCONSOLED_PIDFILE="@XEN_RUN_DIR@/xenconsoled.pid"
-#XENCONSOLED_TRACE="@XEN_LOG_DIR@/xenconsole-trace.log"
+#XENCONSOLED_TRACE="none|guest|hv|all"
 #XENSTORED_TRACE="@XEN_LOG_DIR@/xenstore-trace.log"
 
 xen_precmd()

