Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49575A256D2
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 11:22:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880515.1290587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tetaK-0005t8-O4; Mon, 03 Feb 2025 10:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880515.1290587; Mon, 03 Feb 2025 10:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tetaK-0005rK-LH; Mon, 03 Feb 2025 10:21:44 +0000
Received: by outflank-mailman (input) for mailman id 880515;
 Mon, 03 Feb 2025 10:21:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ApqC=U2=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1tetaK-0005rE-6L
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 10:21:44 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8b9d5eb-e218-11ef-a0e7-8be0dac302b0;
 Mon, 03 Feb 2025 11:21:42 +0100 (CET)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-21644aca3a0so96288365ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 02:21:41 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21de31f70e7sm72041685ad.77.2025.02.03.02.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 02:21:39 -0800 (PST)
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
X-Inumbo-ID: a8b9d5eb-e218-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738578100; x=1739182900; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aOxfa+avfb0j+ipnXaoWmoGIZRACgpGmHZwCtsRNEnw=;
        b=qq1040DXVLAV01zHXo7zbn2C0S/lC0DeqTye21uE7L2pDJ4vmHdb9AY+hgopxfHm72
         QWCoMmiRpzuja1AwF82GxhvuCbwh4DuP+qkP51nBKEKNdnayWeG1UXe5nD/Fh8md9wq5
         TNYTJ9u1PTBbw9u3R/RmE0emlILZkyELXEaWZuST2YkMVyQQUAJ0hEX4bfnRKOhg3INZ
         Bh+sVYTs2xGeuTF/otTLUDku3VPM6iu8C5UnCIFDLJUe3+vJ5SU5mkjXFNyj2O7PQ0jr
         30x4C+Scr0QhHxSHLA/i7a4C9g2FHYTeDXejJIzF30FM90oUHwB6bzV9EKmRyPkYH/Om
         ewZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738578100; x=1739182900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOxfa+avfb0j+ipnXaoWmoGIZRACgpGmHZwCtsRNEnw=;
        b=lScWFnmgTixAwn5fzAYsgUhM6ir8sX3Ar53ft0/NUz4fMdLb3Gcwa+o3LK3zttoIIm
         pCtobU2vFaOqkon9IxwmKu7caoRaAAhBqJVtDLHu2xDVP8EsQf5G9B/hPYo8RAvQuXga
         JflipOK0WyQ0hzraenSDWsc0CAzeyiswwlnieG9gv9rhZ22jj84b2mgW0vi8aeJQesiw
         du6iaCbMYAvCE5iOv3DxR3/tf9rX1iDHNg43WZ4ldO4JeDJFgS8WmBFbzmxThAwPTqjT
         b2DeCYCT94I/SFvzwDRBUTwmk596luLi5uzqvI4QmOfCkdsItgkn3mBvmBjJgTeoxwXJ
         AjWg==
X-Gm-Message-State: AOJu0Yy/eycslp9CiyAn7uufTdLQxOBsMVtCpL/vNalVcnkrzoNTSerL
	magtPs0j4z85UmhlD7ChJ8JJhJH8hwUK634714WLPiwTVBMYcAzyL7xRXYHiGGfTSat3N9fatAk
	Z
X-Gm-Gg: ASbGncvxWkvgAN4oh2nwO9id7Nd4vrcHVeuDLSmaaQAeTUUT9sFHqvUI954GICC/KGh
	lLaWniQdezKyQanOf2eXQQx3j0QrNTj5yu0iekXxQ+JqdgkwMI7sDtruNoaVu+mj0c6TEbDTH9T
	ulwwxKnK72IMvdeLStnlSTTk/gLQf2quqSTphK1Ib2YKIalymZUlyO67oWSHdww03qL5J7eiHuM
	dI2lRK3SJAaHwDWtiLcZZohVKVg8uk4Ijrhpq7OSIdjxH96Y8Kmr+Gw2fuZX6NMS2hKWqY9Kvl4
	+xw3eWsvf+KjIc+CcKJF9vIjwJLOaxG5X9+3yoahh45dbOYhRrPJS5PMvOlbcGpNfXM=
X-Google-Smtp-Source: AGHT+IHLMLtDCbs0oLnXlvdwAQtfSalgEe0Pj66ogM+JMElT1FfrwJeq+JpR2HPESSLLaTsl87KxUA==
X-Received: by 2002:a17:902:e54c:b0:215:620f:8de4 with SMTP id d9443c01a7336-21dd7c44a59mr345349295ad.2.1738578099877;
        Mon, 03 Feb 2025 02:21:39 -0800 (PST)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH] xen/arm: ffa: fix bind/unbind notification
Date: Mon,  3 Feb 2025 11:21:12 +0100
Message-ID: <20250203102123.3002912-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The notification bitmask is in passed in the FF-A ABI in two 32-bit
registers w3 and w4. The lower 32-bits should go in w3 and the higher in
w4. These two registers has unfortunately been swapped for
FFA_NOTIFICATION_BIND and FFA_NOTIFICATION_UNBIND in the FF-A mediator.
So fix that by using the correct registers.

Fixes: b490f470f58d ("xen/arm: ffa: support notification")
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa_notif.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index 21b9e78f6399..00efaf8f7353 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -40,8 +40,8 @@ int ffa_handle_notification_bind(struct cpu_user_regs *regs)
      * We only support notifications from SP so no need to check the sender
      * endpoint ID, the SPMC will take care of that for us.
      */
-    return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags, bitmap_hi,
-                           bitmap_lo);
+    return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags, bitmap_lo,
+                           bitmap_hi);
 }
 
 int ffa_handle_notification_unbind(struct cpu_user_regs *regs)
@@ -61,8 +61,8 @@ int ffa_handle_notification_unbind(struct cpu_user_regs *regs)
      * We only support notifications from SP so no need to check the
      * destination endpoint ID, the SPMC will take care of that for us.
      */
-    return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bitmap_hi,
-                            bitmap_lo);
+    return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bitmap_lo,
+                            bitmap_hi);
 }
 
 void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
-- 
2.43.0


