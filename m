Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4BDAB3B14
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 16:47:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981610.1368046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEUR0-0005VH-QE; Mon, 12 May 2025 14:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981610.1368046; Mon, 12 May 2025 14:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEUR0-0005Rn-Ie; Mon, 12 May 2025 14:47:14 +0000
Received: by outflank-mailman (input) for mailman id 981610;
 Mon, 12 May 2025 14:47:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WmCO=X4=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uEUQz-0004eT-0M
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 14:47:13 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd27dc1a-2f3f-11f0-9eb6-5ba50f476ded;
 Mon, 12 May 2025 16:47:12 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5fd1f7f8b25so3058474a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 07:47:12 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197bd219sm634459366b.141.2025.05.12.07.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 07:47:11 -0700 (PDT)
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
X-Inumbo-ID: fd27dc1a-2f3f-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747061232; x=1747666032; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvQdZIK/JXFuZvTKoVLrQyBHywf2ZxT+4HEeq47F6rg=;
        b=uM9jB+mYlLOYOvLPfxGxtAP7fC9t+sW5oqwGVXADLPtEED8N0oN5DSpLM+PQjah4lR
         tRuAx5Vtdvssky3GhS++5q+fOWJDPiJXVzkKGyMcgk198ZBsFLh0E+d8Vo8OhsN4woct
         R2u5NBOKdudJr0NFPYk4Fsrzf+7ubHi/ofbac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747061232; x=1747666032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yvQdZIK/JXFuZvTKoVLrQyBHywf2ZxT+4HEeq47F6rg=;
        b=uQUTxtq8GNZIXPn4wZPKV2wclQSk7N0wb3wXANFg5xIzuJ0J4qiD3k8dSnI/TkhRkq
         oSruDLh7Y4Rhm2Y/QyiIcCQui+kl+VFXGP7AbTvM0PCOvm7XKOun0qOWzWDqma4c3ZpW
         V3e1QiQtIsnXXiQ4eyJiTgtr5E+xtqod1dUCztG/RyxaCps0vXR4VkLaKDqTo0mLR4gx
         D4GfFB0MMuvhmKTV0l8hrg8FU27qdJFobLEhMllVGYg4ahILkyPtRwQSe8nDxRsp7tcY
         jyh0//D9Use/J58VPHBe976mBVVBOSb1ZmhVuyvmqc4v41FfMj3ocQYL6fVq+rdBmO2V
         RjQQ==
X-Gm-Message-State: AOJu0YzlGh0Amf98skI/ZewYsCQ2TNQNp4NqndYlFl679COL6ts1hk2v
	VZIvpyY+HIK/EkJp5Th5qCo69OFzXLOwLqIrD8qHYdfWSvpk/osOtMiq+3jkmYuSq6VIE0uQx3Y
	=
X-Gm-Gg: ASbGncuvl4/JDxUWst6gahcSh+VWh+VOsWBqJ9CZzykPqjz+zUaw73ODF4eQcvxicRq
	/lOQE47e3d2zgpKe++O/z6eRnzadP2fisN8r+WA9R7jzdXPE7CrhxFG0WTY6pKznGciXsu1G6EC
	ABjW0kpCssRUcs4SmBrrOH9+2HWTL9XrLCbsV4CKs0eM0hacI55ANpgc/DIYAtv+fq+dnpiKIV4
	g2C3AvWf1nFldTIQtcrFRp3Cp/J8e1ilid0EUuzTr/LM+DWoky32/QlXut+aSSJmbQvwp+pse7/
	n5PKiJHuCcKQLldJMiYydRv6nc1ojwjtg+XLidLUq7K1/2o7Dd7oeKXv/+ES98ChYkH6lHWtYE8
	=
X-Google-Smtp-Source: AGHT+IGgEcr4x5iQWIFKccA8eC5vCGT1qAVTBjx7C45iZw/EIh4KJNcSAiaafo5TFy0lRllyaadJBw==
X-Received: by 2002:a17:907:9453:b0:ad1:76d2:d06 with SMTP id a640c23a62f3a-ad219171d53mr1385413566b.47.1747061231720;
        Mon, 12 May 2025 07:47:11 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 4/5] libxc/PM: Ensure pxstat buffers are correctly sized
Date: Mon, 12 May 2025 15:46:55 +0100
Message-ID: <20250512144656.314925-5-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512144656.314925-1-ross.lagerwall@citrix.com>
References: <20250512144656.314925-1-ross.lagerwall@citrix.com>
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

* New in v2.

 tools/libs/ctrl/xc_pm.c | 20 +++++++++-----------
 tools/misc/xenpm.c      |  1 +
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/tools/libs/ctrl/xc_pm.c b/tools/libs/ctrl/xc_pm.c
index ff7b5ada053f..cffbd1b8a955 100644
--- a/tools/libs/ctrl/xc_pm.c
+++ b/tools/libs/ctrl/xc_pm.c
@@ -46,35 +46,33 @@ int xc_pm_get_pxstat(xc_interface *xch, int cpuid, struct xc_px_stat *pxpt)
 {
     struct xen_sysctl sysctl = {};
     /* Sizes unknown until xc_pm_get_max_px */
-    DECLARE_NAMED_HYPERCALL_BOUNCE(trans, pxpt->trans_pt, 0, XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
-    DECLARE_NAMED_HYPERCALL_BOUNCE(pt, pxpt->pt, 0, XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
+    DECLARE_NAMED_HYPERCALL_BOUNCE(trans, pxpt->trans_pt,
+                                   pxpt->total * pxpt->total,
+                                   XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
+    DECLARE_NAMED_HYPERCALL_BOUNCE(pt, pxpt->pt, pxpt->total,
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


