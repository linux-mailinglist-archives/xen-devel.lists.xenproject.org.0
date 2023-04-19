Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9036E7731
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 12:07:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523292.813202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp4iK-0006Qg-Fu; Wed, 19 Apr 2023 10:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523292.813202; Wed, 19 Apr 2023 10:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp4iK-0006Nr-Cf; Wed, 19 Apr 2023 10:07:00 +0000
Received: by outflank-mailman (input) for mailman id 523292;
 Wed, 19 Apr 2023 10:06:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iFQL=AK=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1pp4iI-0006Nl-Mi
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 10:06:58 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.221]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea069586-de99-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 12:06:56 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz3JA6irpu
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 19 Apr 2023 12:06:44 +0200 (CEST)
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
X-Inumbo-ID: ea069586-de99-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1681898804; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=G3w2mbEJJfgCZHDoE6CwY7Ya//D1yAoOULQRypOXY8zxn9mRq1c9EcusXa9uEmdzsZ
    nlB3O5pjmlZZoEQkden5vIVd9ldDCMBfk1IOwLMYMPJmMxDb6q1Mz7NETgthG+lTzXTW
    k8a3z6drrS7RqD7wV9WFt2GACTzoaqk9l/T6mBIvZt5bDqJKMMgUc4WEd9MvWLBG9iHq
    oN22Wyh0rO7AgX+q49kGm5sqVp7q0qRbmBXo3g720HBmvQhbwJHztN71vDrV9/W/YeT5
    qmS6S70L3EffHduBXVpYOMFXQp+j/YRYP5E0+CXgk+p8DDGvmuSb0ZxHyQMc68qRFOMy
    ZdAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1681898804;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=c1TYgW//a9TczZT7Hvd8U4aS6et0hLk47l2yhUc1fsw=;
    b=JToD897sebkm3zW7d5nmtM2r4dXRgFet4dR2ShIEDId3g7U0T59xtzZ6uJVR5mXKwY
    vevXLMilymdTM3eQt+h3zBKdQEjGFzflc4vlYCTL5TGtDqNa7bpcXtAhyRo64mEKUFfl
    RfDlkQQSlTt6XpCfO8lbhXgNwtV4PieBmIi8vUylG1y80JRTIA7z3r+Qgkzdc5EERp4i
    RXFcCKOWgN+A0SFBrpcoL2HCOJ6iQUuu/6iV+BaWLAoobFI0k0u4Lsr8RRIXcCzEzLCb
    RZDaIX0Cb2guCZoz6VZJfHC5peimQtOs3pw9IPBrHRNStku3MMtFGSOFfTxa8lSUZrig
    qSxg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1681898804;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=c1TYgW//a9TczZT7Hvd8U4aS6et0hLk47l2yhUc1fsw=;
    b=qohYo94XsdlTQzRChdKqvHZe2+8FeW4GMZdhNcY9eGtG4Z1LwG7sN9gJvLIXHAHOHU
    L6dM7jUXDT2eNr0d6j7zFCqu4k/lihm1IvX+Rq08Pa7rOt+pzxk7gGqnZWx0qzyPPgWR
    OF3GS4STtOegdxiEiXbuac/2rDRVxTYGxsuTHn6qmAuyWXg9yjng0+0exZ2NzIdZltKm
    qwc9itmSm6BSBHNJ4ohJDdUPkFuPmYKu8/KQd/OR0wiJ4BAclFYGkigJN88LxlWmBvHc
    IGLzUC9OgwEyec6Z3O721rfSo1WondAfHVy8dPLtCuegVKGJiaFzdAShZFtP9cRRhQhq
    p1Uw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1681898804;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=c1TYgW//a9TczZT7Hvd8U4aS6et0hLk47l2yhUc1fsw=;
    b=f8EnrHHbZwtJj7ZAJ88U3OqpTa49P/6rMBVpt3yFVCQJGmWL2I0qVG26HJywNKkRC5
    DOznU1EmQ2kjW+FsPkBA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4wqlr7GpgtSxIX+ZWs95M7PYKTHoBaxED20qrwFA=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v1] tools/libs/guest: assist gcc13's realloc analyzer
Date: Wed, 19 Apr 2023 10:06:33 +0000
Message-Id: <20230419100633.13047-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

gcc13 fails to track the allocated memory in backup_ptes:

xg_offline_page.c: In function 'backup_ptes':
xg_offline_page.c:191:13: error: pointer 'orig' may be used after 'realloc' [-Werror=use-after-free]
  191 |             free(orig);

Assist the analyzer by slightly rearranging the code:
In case realloc succeeds, the previous allocation is either extended
or released internally. In case realloc fails, the previous allocation
is left unchanged. Return an error in this case, the caller will
release the currently allocated memory in its error path.

http://bugzilla.suse.com/show_bug.cgi?id=1210570

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_offline_page.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/tools/libs/guest/xg_offline_page.c b/tools/libs/guest/xg_offline_page.c
index ccd0299f0f..8f0a252417 100644
--- a/tools/libs/guest/xg_offline_page.c
+++ b/tools/libs/guest/xg_offline_page.c
@@ -181,18 +181,14 @@ static int backup_ptes(xen_pfn_t table_mfn, int offset,
 
     if (backup->max == backup->cur)
     {
-        void *orig = backup->entries;
+        void *entries = realloc(backup->entries, backup->max * 2 *
+                                sizeof(struct pte_backup_entry));
 
-        backup->entries = realloc(
-            orig, backup->max * 2 * sizeof(struct pte_backup_entry));
-
-        if (backup->entries == NULL)
-        {
-            free(orig);
+        if (entries == NULL)
             return -1;
-        }
-        else
-            backup->max *= 2;
+
+        backup->entries = entries;
+        backup->max *= 2;
     }
 
     backup->entries[backup->cur].table_mfn = table_mfn;

