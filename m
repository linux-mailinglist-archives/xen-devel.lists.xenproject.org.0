Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16666828924
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 16:39:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664702.1034829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNEBj-0000dj-1R; Tue, 09 Jan 2024 15:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664702.1034829; Tue, 09 Jan 2024 15:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNEBi-0000Yo-Ts; Tue, 09 Jan 2024 15:38:46 +0000
Received: by outflank-mailman (input) for mailman id 664702;
 Tue, 09 Jan 2024 15:38:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C4Q/=IT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1rNEBg-00081N-LT
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 15:38:44 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a52ca72-af05-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 16:38:41 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-555144cd330so3811816a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 07:38:41 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 fi3-20020a170906da0300b00a2adb417051sm1153685ejb.216.2024.01.09.07.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 07:38:40 -0800 (PST)
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
X-Inumbo-ID: 2a52ca72-af05-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1704814721; x=1705419521; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Tyvj96yu+ExmEaYuZYuzT4Vsi1GPehED1a8sOXZbwo=;
        b=XTGrQ8P4be3M0Vs5MtFzjdjzkSl3aZmMuFVzrPW/xLJrESOXbFgA0WzCEJyOUzjqyx
         AdTfrMG8kyv9s1L1QTSuEY6dCfvQa7jnqMNBYdGXcedBLcOixpDRPH2lE4QrNbQjbyXn
         wf/TgSSfSP/hkywnsSzqEe2blQoQtrztvpqQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704814721; x=1705419521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Tyvj96yu+ExmEaYuZYuzT4Vsi1GPehED1a8sOXZbwo=;
        b=nT0K1q0BGTUA8VRiAAvzI4aLpOnP+GFT030fGcaIOLzrql3TLAmjd8DDFKzBi6UbJF
         1NHMHXom48K32Drpy7Dx0c5OZWrfTPfpf6+Oh0w6zb6Ck2a3LbQS1sFtw++628PzfX0e
         J+syKXI6hc90Nt3b3JMoS5t7s2bEt/4g09mJSPpwMep9yuu9stuVLIdUaq5mKjfka/VV
         8U8ma+9m6wDeqrA10qTjtDTOQDZ4/JvyuCRfzKX/XtmII/yPbr74OmS7wpgyNe/iNqvo
         SS3UCS+k0OC6ojuzXBE2/wEe19P1urg4Y/g5aCO+FutzUw5dKMmop64ysZOe4Bg0mA+p
         cfPA==
X-Gm-Message-State: AOJu0YzJbsWgV5LNQDSCJIdh/Ij3uuakwdkws+pTBBNI72c+G2a/vX1j
	bSp7ENdcIuP2ardwK0snu6EKOuqrrALqYxsrOG+x+94SJ8A=
X-Google-Smtp-Source: AGHT+IEFk0EhIfe0ycvYEIqj7VI5sVFnxOOeuQm8MgIUUKNKFkGLeTC02i742HgQRpSTYVgVXSDvpw==
X-Received: by 2002:a17:906:dfe2:b0:a26:e9fe:f59f with SMTP id lc2-20020a170906dfe200b00a26e9fef59fmr697946ejc.133.1704814721012;
        Tue, 09 Jan 2024 07:38:41 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 3/6] xen/x86: Refactor xen/lib/x86 so it can be linked in hvmloader
Date: Tue,  9 Jan 2024 15:38:31 +0000
Message-Id: <20240109153834.4192-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
References: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A future patch will use these in hvmloader, which is freestanding, but
lacks the Xen code. The following changes fix the compilation errors.

* string.h => Remove memset() usages and bzero through assignments
* inttypes.h => Use stdint.h (it's what it should've been to begin with)
* errno.h => Use xen/errno.h instead

No functional change intended.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/lib/x86/cpuid.c   | 12 ++++++------
 xen/lib/x86/private.h |  8 +++++---
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/xen/lib/x86/cpuid.c b/xen/lib/x86/cpuid.c
index eb7698dc73..4a138c3a11 100644
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -5,8 +5,8 @@
 static void zero_leaves(struct cpuid_leaf *l,
                         unsigned int first, unsigned int last)
 {
-    if ( first <= last )
-        memset(&l[first], 0, sizeof(*l) * (last - first + 1));
+    for (l = &l[first]; first <= last; first++, l++ )
+        *l = (struct cpuid_leaf){};
 }
 
 unsigned int x86_cpuid_lookup_vendor(uint32_t ebx, uint32_t ecx, uint32_t edx)
@@ -244,7 +244,7 @@ void x86_cpu_policy_clear_out_of_range_leaves(struct cpu_policy *p)
                 ARRAY_SIZE(p->basic.raw) - 1);
 
     if ( p->basic.max_leaf < 4 )
-        memset(p->cache.raw, 0, sizeof(p->cache.raw));
+        p->cache = (typeof(p->cache)){};
     else
     {
         for ( i = 0; (i < ARRAY_SIZE(p->cache.raw) &&
@@ -255,13 +255,13 @@ void x86_cpu_policy_clear_out_of_range_leaves(struct cpu_policy *p)
     }
 
     if ( p->basic.max_leaf < 7 )
-        memset(p->feat.raw, 0, sizeof(p->feat.raw));
+        p->feat = (typeof(p->feat)){};
     else
         zero_leaves(p->feat.raw, p->feat.max_subleaf + 1,
                     ARRAY_SIZE(p->feat.raw) - 1);
 
     if ( p->basic.max_leaf < 0xb )
-        memset(p->topo.raw, 0, sizeof(p->topo.raw));
+        p->topo = (typeof(p->topo)){};
     else
     {
         for ( i = 0; (i < ARRAY_SIZE(p->topo.raw) &&
@@ -272,7 +272,7 @@ void x86_cpu_policy_clear_out_of_range_leaves(struct cpu_policy *p)
     }
 
     if ( p->basic.max_leaf < 0xd || !cpu_policy_xstates(p) )
-        memset(p->xstate.raw, 0, sizeof(p->xstate.raw));
+        p->xstate = (typeof(p->xstate)){};
     else
     {
         /* This logic will probably need adjusting when XCR0[63] gets used. */
diff --git a/xen/lib/x86/private.h b/xen/lib/x86/private.h
index 60bb82a400..4b8cb97e64 100644
--- a/xen/lib/x86/private.h
+++ b/xen/lib/x86/private.h
@@ -17,12 +17,14 @@
 
 #else
 
-#include <errno.h>
-#include <inttypes.h>
+#include <stdint.h>
 #include <stdbool.h>
 #include <stddef.h>
-#include <string.h>
 
+enum {
+#define XEN_ERRNO(ident, rc) ident = (rc),
+#include <xen/errno.h>
+};
 #include <xen/asm/msr-index.h>
 #include <xen/asm/x86-vendors.h>
 
-- 
2.34.1


