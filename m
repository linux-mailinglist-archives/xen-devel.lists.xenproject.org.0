Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF6470FF61
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 22:42:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539203.839849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1vIS-0002ZI-3e; Wed, 24 May 2023 20:41:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539203.839849; Wed, 24 May 2023 20:41:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1vIR-0002XV-Tv; Wed, 24 May 2023 20:41:23 +0000
Received: by outflank-mailman (input) for mailman id 539203;
 Wed, 24 May 2023 20:41:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0arK=BN=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q1vIP-0002W0-JD
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 20:41:21 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 549d4ffe-fa73-11ed-b230-6b7b168915f2;
 Wed, 24 May 2023 22:41:17 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz4OKer0Zq
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 24 May 2023 22:40:53 +0200 (CEST)
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
X-Inumbo-ID: 549d4ffe-fa73-11ed-b230-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1684960853; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=jo2po5ZgKoErdZxmFc0n7nKOkv7tj+hfEV4dHjWCncB3bq7G23VvUIB47yabzVsM/Q
    OSsImss9y7SNyaHWSiEIB561SEjrO2JsxwEtzxqyfulRf1EzdqaA/FZaLftIY+J16+m2
    EgI12u2N5nUQNpry4IaPXfU5uFU2o3V9krl70PERTAWvsc90iMXKJU99+RgFtjxU/lD5
    gVREkEfUx4PTgyaUh/hOdqAZRrIHq8e6hlrCELDoGVTP6AnhMWpBh2gcV7aQ7xbjvHfK
    ylYECgwoPK4ZWOduUfxXFt6d3gfEwCo6NF3AvXO1MsGz4HflUaGnmOASnVwt22jTcac4
    0rLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1684960853;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=22LZU7fLgz2ev8zDdEybHY4CxAHPDwKCqTvuQ9FCQIg=;
    b=GYauEbxUzk9m6p3cIsGgOAfpoX+MFD95xjHM0+U6O7Vrbp0dJBPzqR74MAs3+5DLd/
    kaG5Bu0l3R0ogG6Edskkl/8vPQKEALF/aFlZR2YjBQM/NY7AfPI62drl/CBmvEOx/6jw
    d4C4FpFOZIdPcisIykxoyxNe2/ZoyTQ0oIK9xarJKFxfezj1ct3HWYHjCnPIA6GEDJuB
    s2GvITN2b29UTt1/sahvJWqKllPGvbon6GVDdgaz5qy6H/UzsuW8e5lNJEZBXNhAiBm8
    Orowe6LWSZRN381m7GaoaS8Gg1i9gb3ouKlf0tPx+n56rQEjAzZ+KONr6xAla4NrILes
    Skig==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1684960853;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=22LZU7fLgz2ev8zDdEybHY4CxAHPDwKCqTvuQ9FCQIg=;
    b=gXjJs2gmTF9b3sQJRx07n626IHyJJcc5v6QlZlSpBRFx8MrL7FLLy0F/D9PHlq75X5
    JL9PVl77SYvbgXc/9lBSCB54bxeDU67CKS4zJjfdGxvTqKe9OV0z0QguLqbQNa//AETb
    2i19GVQdL/SjfkEowkP5Jg7tIMssusscxsFcYNRZpsXlagICZ2H5T6aa8GjwHrw3dl1G
    /DVQ+f3UIL4MbNakQHxamFXmtUjvFswkQKU9Qc+KhoMzjdGrkmD9AwlHA2GjYodod54X
    W+2FhagN3Q1ga+K6aZPohb5Aui1tblMWZcZd7g3WKxtfRsARaajt5YM7d1b4I+H8PLHX
    eUuw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1684960853;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=22LZU7fLgz2ev8zDdEybHY4CxAHPDwKCqTvuQ9FCQIg=;
    b=Cd4bZxxys+fzPVxW3gdyH6Nei9RJT/APa4XkU/aeE1026EMHKEFrBF95tJpqSm3C44
    piiA9mZUyHG9rvqYAVBQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4xqFv7EJ0tgRX/vKfT/e8Ig6v0dNw4QAWpzMWrRQ=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1] xen: fix comment typo regarding IOREQ Server
Date: Wed, 24 May 2023 22:40:32 +0200
Message-Id: <20230524204032.3193-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 xen/include/public/hvm/dm_op.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.h
index acdf91693d..fa98551914 100644
--- a/xen/include/public/hvm/dm_op.h
+++ b/xen/include/public/hvm/dm_op.h
@@ -17,7 +17,7 @@
 /*
  * IOREQ Servers
  *
- * The interface between an I/O emulator an Xen is called an IOREQ Server.
+ * The interface between an I/O emulator and Xen is called an IOREQ Server.
  * A domain supports a single 'legacy' IOREQ Server which is instantiated if
  * parameter...
  *

