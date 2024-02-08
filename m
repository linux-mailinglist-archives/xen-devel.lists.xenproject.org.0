Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 979D284EA37
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 22:20:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678477.1055802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYBot-0003WG-Vn; Thu, 08 Feb 2024 21:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678477.1055802; Thu, 08 Feb 2024 21:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYBot-0003Tp-TD; Thu, 08 Feb 2024 21:20:31 +0000
Received: by outflank-mailman (input) for mailman id 678477;
 Thu, 08 Feb 2024 21:20:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jPix=JR=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1rYBos-0003Tj-Aa
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 21:20:30 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1f98bbd-c6c7-11ee-8a4b-1f161083a0e0;
 Thu, 08 Feb 2024 22:20:29 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41061f068cdso633355e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 13:20:28 -0800 (PST)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a05600c458f00b0040e4733aecbsm488854wmo.15.2024.02.08.13.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 13:20:27 -0800 (PST)
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
X-Inumbo-ID: e1f98bbd-c6c7-11ee-8a4b-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707427228; x=1708032028; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lx8PQ+gRbkIzFQZ1WKf4xwBqXzUF6EuRsqMcRxbl6vY=;
        b=MiQ0w3uDaIEKgHr3qO7jZYMqgcH/jzf2gaDD1/PXvjps69eNTcwGB0JV/Jv9R1SHix
         8nTlDVCl9XE1vo00k2imeiv/AGMA10KIyRGpZBnRDgMDXISnsAefqPq1KiysFwDnsEqg
         /5ux6aFsTD6GZvK5l2KmtXvwj2RhVlwDJr3o/F4q/D/mHEHmvS4bznTl3LyQGi11a2Xd
         giqKsR9Wh5/TW1TdaQ3BH96Pks04WB+CDifQSSUZGa2nhvET2TlK+cKre4eXC9qKrC8I
         hH+MHVEqNze8Zms67U/Ji6aVF2V2wnuHS7BF2uRs/2KDMDGPf3d+e/wUaFpwLM3CaIwI
         vuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707427228; x=1708032028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lx8PQ+gRbkIzFQZ1WKf4xwBqXzUF6EuRsqMcRxbl6vY=;
        b=G7pt9dHewFZ/N5CHd9Yd3/hjHeha8/xGTYL05mjpUTVFPLPyFYZdL1buaE/pY5SHXt
         PplAWD31ruutIIT4ypZxvvmhUeC4qbKL/M3YmyK+qBvs9WocG5L3Scykv9ZEK+Uyf5vq
         7gEjuHYVmxVWVJW2pALyNMysQ+FwJVsGxxZczdRRMndOsYgvU+rIP1CoYrd0sGkAwMKn
         1uSrXDaekkgeVt0G9AS+84CSoNMFEH3yqFn6gnph4oof3ooEHzbr8d74s5nMmIJ7TgTu
         IFH9HoeFb27zKWGbhe3UTUXHDjwZ6LI5h5mHkqslDmAYgGXujFAYZ9jtKAXjo//zryzj
         ARRA==
X-Gm-Message-State: AOJu0YyPAsC1b1SvaNHcOnTUS3XJRM38ugc17zEcRY03R8Yf/6ub2KsZ
	UXsCbDb2XdxE0F09bT1BJ++g85l4MpW1hTLThQhkzi/gKxAWjY5EtZH1SJSB/9c=
X-Google-Smtp-Source: AGHT+IH0tDqHgTsyeGubGIKfGffBDEuPdX5Xj/EoEztMoHNa1z5bdeBDppGFVQcOvglw7Pgw4r02XA==
X-Received: by 2002:a05:600c:4e88:b0:410:41f5:368a with SMTP id f8-20020a05600c4e8800b0041041f5368amr389118wmq.18.1707427227770;
        Thu, 08 Feb 2024 13:20:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVd3vrxY3xqYwd00BW1JbLIZBfZOVkd1koUdgN9V0pMXP6z0gAARQ2NpkmkVGGEZ1X+NrrKdG7ziU7Ze6OtHU22oMHIx6PB3hGNUp3BeHcDQ8W0Ffc6p0iP+Y4o9E71iqVl35V2IOPBarjU2xo2AnJgd+nKjofMdbSCiyMy3YKlLL5S4LbyU/7dZ/yXGcOtq1GN
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: tamas@tklengyel.com,
	=?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/hvm: Fix fast singlestep state persistence
Date: Thu,  8 Feb 2024 21:20:16 +0000
Message-Id: <fa519b9a544d3d19a31313292a909d12775e6e1f.1707427103.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

This patch addresses an issue where the fast singlestep setting would persist
despite xc_domain_debug_control being called with XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_OFF.
Specifically, if fast singlestep was enabled in a VMI session and that session
stopped before the MTF trap occurred, the fast singlestep setting remained
active even though MTF itself was disabled.  This led to a situation where, upon
starting a new VMI session, the first event to trigger an EPT violation would
cause the corresponding EPT event callback to be skipped due to the lingering
fast singlestep setting.

The fix ensures that the fast singlestep setting is properly reset when
disabling single step debugging operations.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 xen/arch/x86/hvm/hvm.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index e8deeb0222..4f988de4c1 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -5160,26 +5160,40 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
 
 int hvm_debug_op(struct vcpu *v, int32_t op)
 {
-    int rc;
+    int rc = 0;
 
     switch ( op )
     {
         case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_ON:
         case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_OFF:
-            rc = -EOPNOTSUPP;
             if ( !cpu_has_monitor_trap_flag )
-                break;
-            rc = 0;
-            vcpu_pause(v);
-            v->arch.hvm.single_step =
-                (op == XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_ON);
-            vcpu_unpause(v); /* guest will latch new state */
+                return -EOPNOTSUPP;
             break;
         default:
-            rc = -ENOSYS;
+            return -ENOSYS;
+    }
+
+    vcpu_pause(v);
+
+    switch ( op )
+    {
+        case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_ON:
+            v->arch.hvm.single_step = true;
+            break;
+
+        case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_OFF:
+            v->arch.hvm.single_step = false;
+            v->arch.hvm.fast_single_step.enabled = false;
+            v->arch.hvm.fast_single_step.p2midx = 0;
             break;
+
+        default:
+            ASSERT_UNREACHABLE();
+            return -ENOSYS;
     }
 
+    vcpu_unpause(v); /* guest will latch new state */
+
     return rc;
 }
 
-- 
2.34.1


