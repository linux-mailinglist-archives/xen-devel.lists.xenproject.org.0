Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D08A38F1B
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 23:34:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890945.1300065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk9go-0007xf-RV; Mon, 17 Feb 2025 22:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890945.1300065; Mon, 17 Feb 2025 22:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk9go-0007vW-Om; Mon, 17 Feb 2025 22:34:10 +0000
Received: by outflank-mailman (input) for mailman id 890945;
 Mon, 17 Feb 2025 22:34:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kh3E=VI=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1tk9gn-0007vQ-Cb
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 22:34:09 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cd28179-ed7f-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 23:34:07 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-54605bfcc72so2316250e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 14:34:07 -0800 (PST)
Received: from EPUAKYIW03DD.. ([91.123.151.154])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5461ca6f722sm753797e87.71.2025.02.17.14.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 14:34:04 -0800 (PST)
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
X-Inumbo-ID: 4cd28179-ed7f-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739831647; x=1740436447; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WZ4IJwlQ3GFL0pE+xiuOx9rEh8ew3am54ueL5SNF3dI=;
        b=LgBMsdx3ZckJK6SHu+wtxaujGrJazdoue7SaMJJFeCfDzBc1FYa5Gf1QHGAUyb+ucu
         DX3dLNmXiBA+w2bTARWjhyLzOvBsvBK8cEVwtvNY7h15hLrhW2uCtxqdlQ+1NnugIF2j
         9V+hFKWvtZ1r81A0ZhvUKjPUwxqkTBGEKEBdQuaxBV9mZsswlTmfG/XDRr528zt7Khwr
         9kmMaCuCmiqa4RFVV+Uhw1M5jQPBqsGEZdS4VY2kBrCw/blubhKL0LPFMCcTENbFkPvJ
         V0iD9oIAWPKfJkfbe0PfinRlfmwHn48LIYv0TpWVCsXpPscsz173H/n8QZ54lGfo3HqF
         ZHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739831647; x=1740436447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZ4IJwlQ3GFL0pE+xiuOx9rEh8ew3am54ueL5SNF3dI=;
        b=pe2AOiNe8kHLjn7/s6rAn6pzg0/UhJGfrvXMq2d9TdEqc5XEEng5RdSKIa7dS2NOf3
         qK1c9RS1zLwl2qhDqOGcTu58Qadkpfd0cCEsrE53xHtUtilToGPuCGhW1Cq3MkNZHmKR
         dekGGdi81SRxXMimbBT/NCr4fAiKH/b4xgxhxU9KidP82sZ8yTxT5zOgZHYRVOWNzJFv
         QV6uAEyDK/E8+c0ShEjUJFLZYvTSXLh35wNURw2HlDh2Xuf8Ph/G34BLAHvPJDd91bVg
         Fm4XN1IqYmLh+bqRSkkJBve/HbRpsrOQl8vJEe/ngvl+sH7nrA2XZQjVRXxBUJxeVcg1
         i9uA==
X-Gm-Message-State: AOJu0YwzUWaT/s+5FgwPv1c4xEd6ZCdsFfRqW1v7OxcSRhwjImJOmqac
	PPA0hmXWqGNnLEx4onxWPxPa/EKC9x4nZdUT79JuxCaXpmO3tsWcIilrfg==
X-Gm-Gg: ASbGnct4BEE6luLp7DlXcnOv+GluQfEFbUbrejCs3yKqzp4PCAMFEo5CKNE/lYXURv3
	bMxuD/DysQPru/MCO2r2QNiIiwvgALQ0MrWWalynBVFJg+XVVsRLainbmc/vcCq6T93OpKvK0eD
	06cea75Yy3+R4dLFomSEFw2IVCwHpUVc0BRLGxepgSwiM7xFSSFFWjIc1NYkTqcbjEQcevLWwlt
	R86lfiCSwK0d6Qk505uvNzREsPJtsplWmcirP+qeJ3wNnQ/2u2swIvBY3z+hVwcTC2tnYEn9X33
	vLrVABFRqwpoZT0MCNQ=
X-Google-Smtp-Source: AGHT+IEnWgXUb6MUvvM/RTu/yXn+kHn24+ieRoCZHlAZfLqCMIVsqiRA0wDuqSTev2jo9+7ZH25ieQ==
X-Received: by 2002:a05:6512:3d15:b0:545:25cc:23cd with SMTP id 2adb3069b0e04-5453035a0c0mr3417103e87.16.1739831646549;
        Mon, 17 Feb 2025 14:34:06 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH V3 for-4.20] xen/memory: Make resource_max_frames() to return 0 on unknown type
Date: Tue, 18 Feb 2025 00:34:02 +0200
Message-Id: <20250217223402.167514-1-olekstysh@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This is actually what the caller acquire_resource() expects on any kind
of error (the comment on top of resource_max_frames() also suggests that).
Otherwise, the caller will treat -errno as a valid value and propagate incorrect
nr_frames to the VM. As a possible consequence, a VM trying to query a resource
size of an unknown type will get the success result from the hypercall and obtain
nr_frames 4294967201.

Also, add an ASSERT_UNREACHABLE() in the default case of _acquire_resource(),
normally we won't get to this point, as an unknown type will always be rejected
earlier in resource_max_frames().

Also, update test-resource app to verify that Xen can deal with invalid
(unknown) resource type properly.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Refer:
https://patchew.org/Xen/20250217102741.4122367-1-olekstysh@gmail.com/
https://patchew.org/Xen/20250217204822.136437-1-olekstysh@gmail.com/

  V2:
   - add R-b
   - add ASSERT_UNREACHABLE() in the default case of _acquire_resource()
     and update commit desc regarding that
   - drop post-commit remark

  V3:
   - merge with the change for tools/tests/resource/test-resource.c
     and update commit desc regarding that
---
---
 tools/tests/resource/test-resource.c | 10 ++++++++++
 xen/common/memory.c                  |  3 ++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/tools/tests/resource/test-resource.c b/tools/tests/resource/test-resource.c
index 1b10be16a6..521c1fc51a 100644
--- a/tools/tests/resource/test-resource.c
+++ b/tools/tests/resource/test-resource.c
@@ -123,6 +123,16 @@ static void test_gnttab(uint32_t domid, unsigned int nr_frames,
         fail("    Fail: Managed to map gnttab v2 status frames in v1 mode\n");
         xenforeignmemory_unmap_resource(fh, res);
     }
+
+    /*
+     * If this check starts failing, you've find the right place to test your
+     * addition to the Acquire Resource infrastructure.
+     */
+    rc = xenforeignmemory_resource_size(fh, domid, 3, 0, &size);
+
+    /* Check that Xen rejected the resource type. */
+    if ( !rc )
+        fail("    Fail: Expected error on an invalid resource type, got success\n");
 }
 
 static void test_domain_configurations(void)
diff --git a/xen/common/memory.c b/xen/common/memory.c
index a6f2f6d1b3..8ca4e1a842 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1157,7 +1157,7 @@ static unsigned int resource_max_frames(const struct domain *d,
         return d->vmtrace_size >> PAGE_SHIFT;
 
     default:
-        return -EOPNOTSUPP;
+        return 0;
     }
 }
 
@@ -1240,6 +1240,7 @@ static int _acquire_resource(
         return acquire_vmtrace_buf(d, id, frame, nr_frames, mfn_list);
 
     default:
+        ASSERT_UNREACHABLE();
         return -EOPNOTSUPP;
     }
 }
-- 
2.34.1


