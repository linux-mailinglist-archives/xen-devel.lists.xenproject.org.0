Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78258A32A59
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 16:44:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886544.1296191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiEuD-0004T8-VK; Wed, 12 Feb 2025 15:44:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886544.1296191; Wed, 12 Feb 2025 15:44:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiEuD-0004Qm-SR; Wed, 12 Feb 2025 15:44:05 +0000
Received: by outflank-mailman (input) for mailman id 886544;
 Wed, 12 Feb 2025 15:44:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2a2H=VD=gmail.com=gragst.linux@srs-se1.protection.inumbo.net>)
 id 1tiEuC-0004Qg-Jl
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 15:44:04 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f8adca7-e958-11ef-a075-877d107080fb;
 Wed, 12 Feb 2025 16:44:03 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-54506b54268so3840209e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 07:44:03 -0800 (PST)
Received: from epuakyiw0a98.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54508285451sm1248039e87.0.2025.02.12.07.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 07:44:01 -0800 (PST)
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
X-Inumbo-ID: 2f8adca7-e958-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739375043; x=1739979843; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aG3oJWrd82/99x1ETlLtHy5/+jXBIhstzSiAOcp9oOQ=;
        b=JTw0xAUuOHiV18W5Y50LgyYEpfujeqCjDWjfjR49MHuhjPNQ3PbhRBJb6fq5N0eE8h
         j4UG0PRNaPEg9df1r8JAIC+mDSd7ybqBdTmSK+CkKUYZRPt44CXOoyYDOnCgm6spfH/D
         WstfxrPLzEW4amf+AwhWt0RSDVFQMphUYGWV0ssiOM0yogUAlui+aiLSQlnmGByUrI/5
         sPTcZzQ8094LM3r5IRznUQ6MaEzWU2nXQftYfBykTC7Qc0BZ/JCZ5mTJoPhPThwUUFNM
         wMP4GsZY5dk4i5XR++CEDqJaTaFvJ2VA9sHYCrsGNVTD/rEfh2ghUMzTm0VdPyQuMOOn
         fJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739375043; x=1739979843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aG3oJWrd82/99x1ETlLtHy5/+jXBIhstzSiAOcp9oOQ=;
        b=h+v7+I7thbT/EeCbT1Smg2yM7niI840sMB37KZarUBhgM4sdNZMR4WT72nrNCXvaib
         d02muqsBlMTeJetJ0jjTFnGPRiLSW3QqfsLmHAZI8qbvKTzwJq5Am2jTv5L3mOHxjRB3
         ektaXSxu6NExXTHexIkUryLNwcnsphoIVa0cv43ckLoQOzTVCd0+m2pZnkLJt5WobxwC
         pYCGW0678LmeAIyXwKu5A5I/IVQtVpfHQpPtmuTLMazpnpugx4fMLmBihak0HfcIqC+J
         J7Pg2PInupzyDdpkElZdvqFOehTqyB9Bp00GheGdWNjiNo8EDm2ZhPHi0IlQZs6o+kOF
         mw0w==
X-Gm-Message-State: AOJu0YxTZLtwO4+h6Hy26OioZZUsZAAWgr7iPD9eyiU+cfCkrw3s8vH2
	2Ud9ybB6DfDnNlnt9HInQS5JqzIxC9S0ixNFT7NsaGxuSswkoU7t8yB6dA==
X-Gm-Gg: ASbGnctF+wIKru30fAw4bEihHX+GuZNZ1iwdm5wDsfqOU/HT4yeahRgc0r2QXy36MFC
	F6tnRKZ/BJr0BCCvIVpu83ZgYXhKLuUP25rAYgsEB8nSZkgwVA7jjC+NR/OO9F5uaseIC0IL7cv
	uHkb6TbiU4JvWCcgsqV1mzJ0KaBE7yG7vZCUhd8ufUHIQp9NPqQFWEuPDbO00rouk88AIt8SKgJ
	CY5/29d0L3/vNIZNcH3BRHZdVJRM79BHZDntBNHl/kw5V1iv576EXMIbQYWGQySpDhYOHOKgRyu
	B9ud+a88Y9Qr1p/JUvwlQBspqt7+vk9VOePFWxIPy17owH/UYyuZqyoDFXTCgyHd3nGUAP8Cfg=
	=
X-Google-Smtp-Source: AGHT+IGmQjirC+k+iTTqrc4/5BriQ++5o6B1Cuo+UI7y4P4XsSsmXUQKWb+URh62tdMk1wPt2vbTWQ==
X-Received: by 2002:ac2:4ec6:0:b0:545:532:fd2f with SMTP id 2adb3069b0e04-545181095a9mr948364e87.12.1739375042387;
        Wed, 12 Feb 2025 07:44:02 -0800 (PST)
From: Grygorii Strashko <gragst.linux@gmail.com>
X-Google-Original-From: Grygorii Strashko <grygorii_strashko@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [PATCH] device-tree: optimize size of struct dt_device_node
Date: Wed, 12 Feb 2025 17:43:58 +0200
Message-Id: <20250212154358.2540389-1-grygorii_strashko@epam.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michal Orzel <michal.orzel@amd.com>

The current placement of fields in struct dt_device_node is not optimal and
introduces holes due to fields alignment.

Checked with "'pahole xen-syms -C dt_device_node"

ARM64 size 144B, 16B holes:
	/* size: 144, cachelines: 3, members: 15 */
	/* sum members: 128, holes: 3, sum holes: 16 */
	/* last cacheline: 16 bytes */
ARM32 size 72B, 4B holes
	/* size: 72, cachelines: 2, members: 15 */
	/* sum members: 68, holes: 2, sum holes: 4 */
	/* last cacheline: 8 bytes */

This patch optimizes size of struct dt_device_node by rearranging its
field, which eliminates holes and reduces structure size by 16B(ARM64) and
4B(ARM32).

After ARM64 size 128B, no holes (-16B):
	/* size: 128, cachelines: 2, members: 15 */
After ARM32 size 68B, no holes (-4B)
	/* size: 68, cachelines: 2, members: 15 */
	/* last cacheline: 4 bytes */

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
This patch follows discussion in [1]
[1] https://patchwork.kernel.org/comment/26239672/

 xen/include/xen/device_tree.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 5ff763bb80bb..0ff80fda04da 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -81,17 +81,10 @@ struct dt_property {
 struct dt_device_node {
     const char *name;
     const char *type;
-    dt_phandle phandle;
     char *full_name;
+    dt_phandle phandle;
     domid_t used_by; /* By default it's used by dom0 */
 
-    struct dt_property *properties;
-    struct dt_device_node *parent;
-    struct dt_device_node *child;
-    struct dt_device_node *sibling;
-    struct dt_device_node *next; /* TODO: Remove it. Only use to know the last children */
-    struct dt_device_node *allnext;
-
     /* IOMMU specific fields */
     bool is_protected;
 
@@ -100,6 +93,13 @@ struct dt_device_node {
     bool static_evtchn_created;
 #endif
 
+    struct dt_property *properties;
+    struct dt_device_node *parent;
+    struct dt_device_node *child;
+    struct dt_device_node *sibling;
+    struct dt_device_node *next; /* TODO: Remove it. Only use to know the last children */
+    struct dt_device_node *allnext;
+
     /*
      * The main purpose of this list is to link the structure in the list
      * of devices assigned to domain.
-- 
2.34.1


