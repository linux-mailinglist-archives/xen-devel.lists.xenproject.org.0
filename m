Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5988287ED
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 15:20:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664637.1034714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNCxf-0003CF-O3; Tue, 09 Jan 2024 14:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664637.1034714; Tue, 09 Jan 2024 14:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNCxf-0003AN-LM; Tue, 09 Jan 2024 14:20:11 +0000
Received: by outflank-mailman (input) for mailman id 664637;
 Tue, 09 Jan 2024 14:20:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bEKq=IT=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1rNCxe-000388-2B
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 14:20:10 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fe660bc-aefa-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 15:20:06 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5534dcfdd61so5348367a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 06:20:06 -0800 (PST)
Received: from jmerino-thinkstation.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 h15-20020aa7c94f000000b00557c6778b88sm1006014edt.53.2024.01.09.06.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 06:20:05 -0800 (PST)
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
X-Inumbo-ID: 2fe660bc-aefa-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1704810006; x=1705414806; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VfD5eh+5AnOG7qBGieEa/3TaBhZ4atnwdaWBB6XiDjE=;
        b=kXAOMfVGsjpA4vZ6X0gVhdWHjeBaLsEho3mbkE8Jb1HjBRJMerZQ16ELfiDUzs1qTn
         x8YKDCYH/Fy0meMvNITzulx/qqq9ItWckUH8FgPKi6K3rAentLrCp/YaBdvvLgES7fU3
         b+/TD5DSHHe1oQ2MHKoEfzuNC4GMsvTniYImM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704810006; x=1705414806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VfD5eh+5AnOG7qBGieEa/3TaBhZ4atnwdaWBB6XiDjE=;
        b=LkBqILaz3pwrUyDDeEZaRUQNvjffVN+sCtVyPM41kUTilI5xXG9Sz/jGB/AWxxMk8t
         n6NnTn2Kw1USJPlm2DNHMoFV8V2/oLIFVr23OgwwEmSwwLOxe3w0xrqgvGyuNJMZPGaB
         kPDLIkvOdtGNWvQasKitnsoaNiv+q+VUuhHTI28y+/xRvQ4HI8CZg8kZ7v83hAZYGEgR
         8OZll4UYCq6dnfOxbRWhAZRJu16HXxSghW6UwP1Aqwpm5uQsi6IIkrtrK7eGnl3Uc7on
         QkPqA+iUITsY/hrdA4nV2UcULskHAZLEedNMEZPOREIbt1smY8Xxi9vTFQtzm4ax/JFl
         J3Gg==
X-Gm-Message-State: AOJu0YwR4/WaRWzNWDXoXRc1+kTM1gEyDWNAwRR2M+Ra9iBBw9bRqn+r
	3cBoJeN0w/XrJtEPIVbmsBEAl9C5w5dAhB1/vPR7PXJ38GA=
X-Google-Smtp-Source: AGHT+IG7hntlSUPKyTnj1CvmJqPeZhGQUUPef1PTC7EqrWuRRTaYvmwYukGK0JZbj3ZAGeDh2JhSKQ==
X-Received: by 2002:a50:f695:0:b0:555:9bd7:a4f0 with SMTP id d21-20020a50f695000000b005559bd7a4f0mr949341edn.36.1704810005813;
        Tue, 09 Jan 2024 06:20:05 -0800 (PST)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Vikram Garhwal <vikram.garhwal@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH for-4.18 v1] xen/common: Don't dereference overlay_node after checking that it is NULL
Date: Tue,  9 Jan 2024 14:19:49 +0000
Message-ID: <6b2db92de764b6031647926d27cb14dd455eff7d.1704809355.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In remove_nodes(), overlay_node is dereferenced when printing the
error message even though it is known to be NULLL.  Fix the error
message to avoid dereferencing a NULL pointer.

The semantic patch that spots this code is available in

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/coccinelle/null/deref_null.cocci?id=1f874787ed9a2d78ed59cb21d0d90ac0178eceb0

Fixes: 7e5c4a8b86f1 ("xen/arm: Implement device tree node removal functionalities")
Signed-off-by: Javi Merino <javi.merino@cloud.com>
---
CC: Vikram Garhwal <vikram.garhwal@amd.com>

Vikram, I didn't know what to put in the error message.  Feel free to
suggest something more appropriate than "Device not present in the
tree".

---
 xen/common/dt-overlay.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
index 5663a049e90a..f04b0c276eea 100644
--- a/xen/common/dt-overlay.c
+++ b/xen/common/dt-overlay.c
@@ -428,8 +428,7 @@ static int remove_nodes(const struct overlay_track *tracker)
         overlay_node = (struct dt_device_node *)tracker->nodes_address[j];
         if ( overlay_node == NULL )
         {
-            printk(XENLOG_ERR "Device %s is not present in the tree. Removing nodes failed\n",
-                   overlay_node->full_name);
+            printk(XENLOG_ERR "Device not present in the tree. Removing nodes failed\n");
             return -EINVAL;
         }
 
-- 
2.42.0


