Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0637CA5C02B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 13:07:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908022.1315208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tryOD-00066f-6w; Tue, 11 Mar 2025 12:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908022.1315208; Tue, 11 Mar 2025 12:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tryOD-00065E-2M; Tue, 11 Mar 2025 12:07:17 +0000
Received: by outflank-mailman (input) for mailman id 908022;
 Tue, 11 Mar 2025 12:07:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=siat=V6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tryOC-000646-3w
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 12:07:16 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e034700-fe71-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 13:07:14 +0100 (CET)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-22401f4d35aso94273635ad.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 05:07:14 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-736cbe3fb3fsm5116665b3a.83.2025.03.11.05.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 05:07:11 -0700 (PDT)
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
X-Inumbo-ID: 5e034700-fe71-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741694832; x=1742299632; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTL0ZfXPTekNOVwpdMmR6t4znYMHoG7CKcBB5SY41+I=;
        b=V/ZJpDsvgg0iOpKUsy3j9Bi6qJdmVYGFjt98zK9G3Q6RiZFLjL2CF9ezQSU0Aqg5b/
         HspOFSiDx9DmAAYBGhUrR3AeLIlBv+gpAvp5O9ZYVbCWYZ2GLOG3Oo0LqsO40Lvu/eW4
         Q4e8tw0sNaniGan7lpLOezkBwa9F4/3HxE4X0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741694832; x=1742299632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTL0ZfXPTekNOVwpdMmR6t4znYMHoG7CKcBB5SY41+I=;
        b=IEG/nMHWlfdbdO1gGV3W3KWvm7vobhp+IK0VDaWDvrElPUmNB22nl1Jau/CTh5mjUp
         q9etcBdN83hLn86s3Zh6lRyoGUtELBENky25UZZwJDri55I2J4Q2d3mOYrckSzZs5tFT
         vCkjHR/f7ISa4ltIgUJGI0x9TB7Gpy9mCA2EOt9nUqDQIjIYkJxapJKN//ne0Orlf5xb
         ySrNH7yxclv9WhzdniQwe303smGka6ffi7pWsnzj8MxM66DYXrVTiJjU+wvKWrkjWqsJ
         Q1hxljkpq30Pyf554TgarB9pHfuzrRWhNTILpzRNswd5yRr7nqPOyo5JXxjc48FA0QzR
         aYZQ==
X-Gm-Message-State: AOJu0Yx9r2WStf/7UMrZ4tZR5O/iazBkhpifMzXINybQw/L+XcIHp4pE
	9TkhQTP0Bytz943gk7WzqowEUdQ6ksKG7It0d7UjvhkB3sDxQ168Ds+JBPvJq3/1n7sSg02IYzB
	T
X-Gm-Gg: ASbGnct0ZNFzDLjNH6T4t0t4W3EMLm7SfgpFC499o5g5/wDceTi7pB/j+BxphOXTVHm
	Ie9QEHF5SVH8JTdB9+hivQ1iU08r1oc2vSIKFihP8dA6jRE+QlA6T7ZbEbfTI0hojrHrBJJA+C6
	r5SnK7n3HLmsT8B5hXWeJrTY9hsfCJGmaosKRfPcRQm0XQagbD3gjW36NPbnq+2M5d/FbQpsYgm
	CQInig7eC7k4JZYMGStdETio8VkkG2Jc87bLWggGxZbdk4tdQWqxKRpjdBW6yIAq3JumjajUxcx
	2OXi9cb80do9kl4owZgBbG2sX0eCAecR/txRxQL8hioFGMvMpVvpTg0=
X-Google-Smtp-Source: AGHT+IF84n5Crz4rbJ97n8u9t0N/OS3tqDTWlQm9iV1Ar93eP3SlCpQjtGofhTyf01f6SjEMXq3r0w==
X-Received: by 2002:a05:6a00:244e:b0:730:9801:d3e2 with SMTP id d2e1a72fcca58-736eb7d87f5mr5847293b3a.8.1741694831988;
        Tue, 11 Mar 2025 05:07:11 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 2/3] x86/hvm: check return code of hvm_pi_update_irte when binding
Date: Tue, 11 Mar 2025 13:06:51 +0100
Message-ID: <20250311120652.61366-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311120652.61366-1-roger.pau@citrix.com>
References: <20250311120652.61366-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Consume the return code from hvm_pi_update_irte(), and propagate the error
back to the caller if hvm_pi_update_irte() fails.

Fixes: 35a1caf8b6b5 ('pass-through: update IRTE according to guest interrupt config changes')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - New in this version.
---
 xen/drivers/passthrough/x86/hvm.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index f5faff7a499a..47de6953fdf8 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -381,7 +381,15 @@ int pt_irq_create_bind(
 
         /* Use interrupt posting if it is supported. */
         if ( iommu_intpost )
-            hvm_pi_update_irte(vcpu, info, pirq_dpci->gmsi.gvec);
+        {
+            rc = hvm_pi_update_irte(vcpu, info, pirq_dpci->gmsi.gvec);
+
+            if ( rc )
+            {
+                pt_irq_destroy_bind(d, pt_irq_bind);
+                return rc;
+            }
+        }
 
         if ( pt_irq_bind->u.msi.gflags & XEN_DOMCTL_VMSI_X86_UNMASKED )
         {
-- 
2.48.1


