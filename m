Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4D7AC5201
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 17:27:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998561.1379310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJwCd-0001Me-Bg; Tue, 27 May 2025 15:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998561.1379310; Tue, 27 May 2025 15:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJwCd-0001Kp-6h; Tue, 27 May 2025 15:26:55 +0000
Received: by outflank-mailman (input) for mailman id 998561;
 Tue, 27 May 2025 15:26:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wzHE=YL=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uJwCb-0001GX-4Y
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 15:26:53 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03270ecf-3b0f-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 17:26:51 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5fbfdf7d353so4655936a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 08:26:51 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6049d482cc7sm3442712a12.19.2025.05.27.08.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 08:26:50 -0700 (PDT)
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
X-Inumbo-ID: 03270ecf-3b0f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748359610; x=1748964410; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVr7GtnMIQOWD4+rFj7EsFStMBOYAHWO5pkXs+hAwww=;
        b=gh0R4KGom0tb89yJwqHZYqQV/ZFYD1iTL1bmQY3Q8AhmTx2YxA30+FdkZSOM7dW8xe
         QizyAQ4Qpw8NTI7koGvE8PX+7JLdbptm0oJYFedHLGthxTmQnzzVL86Z2wXAW6unZ1QQ
         ZWzRQ2o8b+b2dlLHAEC9r1glJAXc9EmZhHZ2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748359610; x=1748964410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVr7GtnMIQOWD4+rFj7EsFStMBOYAHWO5pkXs+hAwww=;
        b=VfMYFdXVCkIDXUXQz8mad+1KaMzMANZTYE7tSeWgmmSARaJ0Okp1pwz55xNDvZLrOq
         tgsinfZrAZfcSstWQAQteryZFAnPQk3vakBODzIxDObEutYssG2ftEK5vvufNNILnh8C
         DLqvSgtcEoWVcvs9zseY8BgA9xDeyRChDMMecVuRPkjvfGeorsxHqFM0mAVmX2SMy8eK
         lJARNOh/Z2YM2R+xHhMSMxqucXcXlNSxgtweeVQBwldwXM1EF4dEvrhuKok+6+n007Is
         NbIZkcEvWmDyG1Py+27cLRGELHazXNp56AkdsxVWYqR6QzDY8yL1l1MIt6BG/zQ+lWvB
         rHZg==
X-Gm-Message-State: AOJu0YzGYkzu2Tkacfqx/YILcr1zwGyGdxHEqzxilQLqN9XuzbBihwvy
	hE7E4aykNn9FpAMZLl6ZipyKkyuMeELzzYNEzZcGIPOPxUv3zIe3ersa2j2w+pm+3llSKioGD/c
	E5zM=
X-Gm-Gg: ASbGncuEkJy9yj3SazCfpOorV+V/wu+yYs/cciOydFao5zt9qwjEcuDJm8urTGBw0Kp
	dVAQXdsNx+Zrx+ijdH4N8yGPI94eCpttTtq4jqvaoGiFzBcymByqO6atVInN7F88JhJmsvuobLB
	85pOer8gB/b3Gj9vUD3IynQmlidpvfkZ84CSm5l/gDIYY3OWmzyE2jCfDD+5pSct+vtl03YUuO4
	nOT2sLk3Xua/9bFkbFhaOEt8N7jA1MQh9nZkFMXHSfNUJoNQRk8ppoBk+Dv50ddyfxqPfg0rIwt
	c+XPZb5X6q4v+ZFJkE8eSC9+FAZ2Vhr+2qo/7HLE9pVvwN8M5GOB0byOj7Uc915jjX73YVCtFtw
	=
X-Google-Smtp-Source: AGHT+IEbEqJnJpwWGP8JbPpoco9C+hNCmnaaNfW2gX0K5XBjHWhjLa3skuvniV1lilvf6tP1E56FWQ==
X-Received: by 2002:a05:6402:2809:b0:604:e99e:b765 with SMTP id 4fb4d7f45d1cf-604e99eb86dmr2814956a12.9.1748359610418;
        Tue, 27 May 2025 08:26:50 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 4/5] libxc/PM: Ensure pxstat buffers are correctly sized
Date: Tue, 27 May 2025 16:26:34 +0100
Message-ID: <20250527152635.2451449-5-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527152635.2451449-1-ross.lagerwall@citrix.com>
References: <20250527152635.2451449-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xc_pm_get_pxstat() requires the caller to allocate the pt and trans_pt
buffers but then calls xc_pm_get_max_px() to determine how big they are
(and hence how much Xen will copy into them). This is susceptible to
races if xc_pm_get_max_px() changes so avoid the problem by requiring
the caller to also pass in the size of the buffers.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

In v3:

* Fix DECLARE_NAMED_HYPERCALL_BOUNCE size

 tools/libs/ctrl/xc_pm.c | 21 ++++++++++-----------
 tools/misc/xenpm.c      |  1 +
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/tools/libs/ctrl/xc_pm.c b/tools/libs/ctrl/xc_pm.c
index ff7b5ada053f..0bd79031044f 100644
--- a/tools/libs/ctrl/xc_pm.c
+++ b/tools/libs/ctrl/xc_pm.c
@@ -46,35 +46,34 @@ int xc_pm_get_pxstat(xc_interface *xch, int cpuid, struct xc_px_stat *pxpt)
 {
     struct xen_sysctl sysctl = {};
     /* Sizes unknown until xc_pm_get_max_px */
-    DECLARE_NAMED_HYPERCALL_BOUNCE(trans, pxpt->trans_pt, 0, XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
-    DECLARE_NAMED_HYPERCALL_BOUNCE(pt, pxpt->pt, 0, XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
+    DECLARE_NAMED_HYPERCALL_BOUNCE(trans, pxpt->trans_pt,
+                                   pxpt->total * pxpt->total * sizeof(uint64_t),
+                                   XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
+    DECLARE_NAMED_HYPERCALL_BOUNCE(pt, pxpt->pt,
+                                   pxpt->total * sizeof(struct xc_px_val),
+                                   XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
 
-    int max_px, ret;
+    int ret;
 
     if ( !pxpt->trans_pt || !pxpt->pt )
     {
         errno = EINVAL;
         return -1;
     }
-    if ( (ret = xc_pm_get_max_px(xch, cpuid, &max_px)) != 0)
-        return ret;
-
-    HYPERCALL_BOUNCE_SET_SIZE(trans, max_px * max_px * sizeof(uint64_t));
-    HYPERCALL_BOUNCE_SET_SIZE(pt, max_px * sizeof(struct xc_px_val));
 
     if ( xc_hypercall_bounce_pre(xch, trans) )
-        return ret;
+        return -1;
 
     if ( xc_hypercall_bounce_pre(xch, pt) )
     {
         xc_hypercall_bounce_post(xch, trans);
-        return ret;
+        return -1;
     }
 
     sysctl.cmd = XEN_SYSCTL_get_pmstat;
     sysctl.u.get_pmstat.type = PMSTAT_get_pxstat;
     sysctl.u.get_pmstat.cpuid = cpuid;
-    sysctl.u.get_pmstat.u.getpx.total = max_px;
+    sysctl.u.get_pmstat.u.getpx.total = pxpt->total;
     set_xen_guest_handle(sysctl.u.get_pmstat.u.getpx.trans_pt, trans);
     set_xen_guest_handle(sysctl.u.get_pmstat.u.getpx.pt, pt);
 
diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index db658ebaddd5..de319329e6b0 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -319,6 +319,7 @@ static int get_pxstat_by_cpuid(xc_interface *xc_handle, int cpuid, struct xc_px_
     if ( !pxstat)
         return -EINVAL;
 
+    pxstat->total = max_px_num;
     pxstat->trans_pt = malloc(max_px_num * max_px_num *
                               sizeof(uint64_t));
     if ( !pxstat->trans_pt )
-- 
2.49.0


