Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3969317C0
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 17:37:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759025.1168561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTNkk-0001Mh-RV; Mon, 15 Jul 2024 15:36:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759025.1168561; Mon, 15 Jul 2024 15:36:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTNkk-0001Kw-Ok; Mon, 15 Jul 2024 15:36:38 +0000
Received: by outflank-mailman (input) for mailman id 759025;
 Mon, 15 Jul 2024 15:36:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IPZm=OP=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1sTNki-0001Kq-Ri
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 15:36:36 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0481b98b-42c0-11ef-8776-851b0ebba9a2;
 Mon, 15 Jul 2024 17:36:34 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52ea34ffcdaso4748698e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 08:36:34 -0700 (PDT)
Received: from EMEAENGAAD91498.citrite.net ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc5b48dbsm219302866b.57.2024.07.15.08.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 08:36:33 -0700 (PDT)
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
X-Inumbo-ID: 0481b98b-42c0-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1721057794; x=1721662594; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zDHEY4Ssox3Ng1oWJa+kdpIzbH8xHGv/gTRq2AfViYw=;
        b=VpzloObVelikYb8uspAItDXIKMBSQ36NRN1lKDdoigcMOHL4wiik6Hz3pQ//vvfD5U
         VNEGf+K+GAoiL9ZSoDn0VorPyJBJcA+p6QAI1oOZBjLVR+/Cc3d0g5WsCJQ1vTRjt/rl
         FQfDFfeJjVjtHsaE7d72yhe3mJDMEt0YQDRhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721057794; x=1721662594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zDHEY4Ssox3Ng1oWJa+kdpIzbH8xHGv/gTRq2AfViYw=;
        b=tZIzYZekF9j2R8rMERYTJ+JN9wN5qTSU+H3wVYNV3U2bYuMh5Vt4W2PNKtZbF2OzHN
         cGAw+xVEaozCP+EHCS0cnTqKc/3veR4NAXCqCH0v/TPOG0DwBIQ/tx7eXjrfNP9LsY7N
         xGkX4eLxTIHyEjVZgqdAVeeW/AuubbuoLHGZbUH/gbTmkebGtkeU1c0s+RGEmSvou2vS
         k8dRDQHilXDukMvhiaxVVxsRrYLanouJtBVtwT+mpA2uEBdgh+tibX1bKW+PPTuORLLY
         74JV23Q9jegJNvqjsrDBllfh7a+7KrQbq4w2/eaOkNwPVmyAL1Zuh+F0xqdXqUVFm/hK
         THZQ==
X-Gm-Message-State: AOJu0YzWYmafpUlOfYeym4B0Smrf65l50JQnrGEjVNca8xoIYyMZ0zpW
	6Sz9QBE3kKR+1XfoQpwe8r9IX40HcxYdGAPnBeGeKqBUj6+sUQatwb4AhWZJAOPd7d+UTWt4B4y
	c
X-Google-Smtp-Source: AGHT+IFIA68+axr3TcRAQwEjIdJS4KWJKxUTsvpjv6yPE39dRuFOF4FShpUkKEf8d/1qXqdgakh7Lg==
X-Received: by 2002:ac2:4183:0:b0:52e:969c:db83 with SMTP id 2adb3069b0e04-52eb999538cmr10472919e87.17.1721057793901;
        Mon, 15 Jul 2024 08:36:33 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [XEN PATCH v3 RESEND] tools/lsevtchn: Use errno macro to handle hypercall error cases
Date: Mon, 15 Jul 2024 16:36:03 +0100
Message-Id: <8bde5ee38597a86334b86822de920802483a7179.1715100071.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, lsevtchn aborts its event channel enumeration when it hits
its first hypercall error, namely:
* When an event channel doesn't exist at the specified port
* When the event channel is owned by Xen

lsevtchn does not distinguish between different hypercall errors, which
results in lsevtchn missing potential relevant event channels with
higher port numbers.

Use the errno macro to distinguish between hypercall errors, and
continue event channel enumeration if the hypercall error is not
critical to enumeration.

Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
---
 tools/xcutils/lsevtchn.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tools/xcutils/lsevtchn.c b/tools/xcutils/lsevtchn.c
index d1710613ddc5..e4b3f88fe4ec 100644
--- a/tools/xcutils/lsevtchn.c
+++ b/tools/xcutils/lsevtchn.c
@@ -3,6 +3,7 @@
 #include <stdint.h>
 #include <string.h>
 #include <stdio.h>
+#include <errno.h>
 
 #include <xenctrl.h>
 
@@ -24,7 +25,18 @@ int main(int argc, char **argv)
         status.port = port;
         rc = xc_evtchn_status(xch, &status);
         if ( rc < 0 )
-            break;
+        {
+            if ( errno == ESRCH )
+            {
+                fprintf(stderr, "Domain ID '%d' does not correspond to valid domain.\n", domid);
+                break;
+            }
+
+            if ( errno == EINVAL )
+                break;
+
+            continue;
+        }
 
         if ( status.status == EVTCHNSTAT_closed )
             continue;
-- 
2.34.1


