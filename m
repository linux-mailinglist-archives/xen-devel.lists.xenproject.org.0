Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93099A9195D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 12:30:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957348.1350483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5MVc-0001fR-5l; Thu, 17 Apr 2025 10:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957348.1350483; Thu, 17 Apr 2025 10:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5MVc-0001dL-33; Thu, 17 Apr 2025 10:30:16 +0000
Received: by outflank-mailman (input) for mailman id 957348;
 Thu, 17 Apr 2025 10:30:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gz/u=XD=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1u5MVa-0001dF-Ec
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 10:30:14 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1bd71fb-1b76-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 12:30:12 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-abec8b750ebso91101166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 03:30:12 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb3cdd5abcsm265297766b.43.2025.04.17.03.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 03:30:10 -0700 (PDT)
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
X-Inumbo-ID: f1bd71fb-1b76-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744885811; x=1745490611; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2owPCcoXT1Tn995zt/5mOyYYGVEyhMHq1Xr81Wsw80w=;
        b=Ibsdqr7Xi9Am+0cOd+C5ranSpWY1b/qUjpC7opwWD4Fix9kDJbgsix1qxP2VvOjWXV
         5DBv2GtIBe35H+jw17ckqKUxdzGjrHb0IsjR42dNtCfrHb9eFJsuWL8fGNc9W28xuxaf
         8ffGKJjFyWRXGZ6AiJXKkL4mXu765iWK5tATM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744885811; x=1745490611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2owPCcoXT1Tn995zt/5mOyYYGVEyhMHq1Xr81Wsw80w=;
        b=FjYidxTM+Ay2UY80ytlZsvGqJxbrHDqNnDx5bD9T7ky1VKSvUbJhUwVYZwI9smnz/S
         eUTO3hlnp/1V5a3rWQvd1oRsiz/BDM/ykZKRtRTIgIwl5CCI3nKw4Q7Rz+Uw83AIQ8lv
         fXqTj5VNayO1Jq79LrOTawf6+BzBPbnbDRyjtoC8ltcvpImOTMsoo0R3lpif8PDZZmDp
         qdVMp2kY0JO9cSacUT8BNV0GbzVvhVkQNnMB4M8BxdfHjp9Jg4SvZKlL+aOQ3ZStojvf
         yiGUxyS9F19ojeUcCn7995+sv7RjlcvhvUg7VCucq0n7meRY+zH/XrFhaxs5IogcpRUT
         ZoTQ==
X-Gm-Message-State: AOJu0YxieBL7wlWHNPpKnl5fjTJD4/jiEgn7rm4GogCNW6Zg0CFbdy5P
	xSIiqowOXxXVHxJpW+HMbmwjLdurTG+sD+Um9quWQxJ1NJAdWD22Rb6yzusbVRD0c7MGMpjiyqk
	=
X-Gm-Gg: ASbGncuVSMpgPcssI/Zv9rfU4zrxjZ9kDevALOEeu1teUKBxpQk2CFPNNNRDaiwPMKz
	IWcCVRKuUR6zeHPrf5hedCJRzvibHVZafgygOzOzwbuBrcbfKN3N60XFGGRI6/63dpxGh2CojR8
	yH7VfV/ykPUlseyIugQm5T0A8ep0t4Wk1zaKkf1737NyMRHf03Lmsa0bL2LLvLwW+yRcQltqrOi
	zIBKLbTucvjKg+tF35aRf4gHlbZ9DW++cn5Q8saMeF5ivk/vl9zDJYh7WF6TTSteZp5GKsIfYQr
	QLGzF+93o1bmhvxznptfbe9mItYbr+mSqi9icayM6tgI2Gba3mr4snDJuVX4myTf
X-Google-Smtp-Source: AGHT+IEWfm9so+q5AHanyNUdlFESpyZupB3c8l7nqrQvshIm18E2EPWZEv4Fyx+14s0azI54sMCbuA==
X-Received: by 2002:a17:907:7da3:b0:aca:c4a6:cd90 with SMTP id a640c23a62f3a-acb428827cbmr373503266b.5.1744885811421;
        Thu, 17 Apr 2025 03:30:11 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] x86/pmstat: Check size of PMSTAT_get_pxstat buffers
Date: Thu, 17 Apr 2025 11:30:00 +0100
Message-ID: <20250417103000.827661-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check that the total number of states passed in and hence the size of
buffers is sufficient to avoid writing more than the caller has
allocated.

The interface is not explicit about whether getpx.total is expected to
be set by the caller in this case but since it is always set in
libxenctrl it seems reasonable to check it.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Fixes: c06a7db0c547 ("X86 and IA64: Update cpufreq statistic logic for supporting both x86 and ia64")
---
 xen/drivers/acpi/pmstat.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index c51b9ca358c2..c388b1e9a17a 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -104,6 +104,14 @@ int do_get_pm_info(struct xen_sysctl_get_pmstat *op)
         cpufreq_residency_update(op->cpuid, pxpt->u.cur);
 
         ct = pmpt->perf.state_count;
+
+        if ( op->u.getpx.total < ct )
+        {
+            spin_unlock(cpufreq_statistic_lock);
+            ret = -ENOSPC;
+            break;
+        }
+
         if ( copy_to_guest(op->u.getpx.trans_pt, pxpt->u.trans_pt, ct*ct) )
         {
             spin_unlock(cpufreq_statistic_lock);
-- 
2.49.0


