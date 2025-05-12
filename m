Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D268AB3B15
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 16:47:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981607.1368019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEUQv-0004t9-On; Mon, 12 May 2025 14:47:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981607.1368019; Mon, 12 May 2025 14:47:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEUQv-0004sK-LB; Mon, 12 May 2025 14:47:09 +0000
Received: by outflank-mailman (input) for mailman id 981607;
 Mon, 12 May 2025 14:47:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WmCO=X4=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uEUQv-0004nZ-5P
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 14:47:09 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9f6cc56-2f3f-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 16:47:07 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-acbb85ce788so816797666b.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 07:47:07 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197bd219sm634459366b.141.2025.05.12.07.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 07:47:05 -0700 (PDT)
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
X-Inumbo-ID: f9f6cc56-2f3f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747061226; x=1747666026; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZdT8ksWgEMXDFM8tuDjoHvSvI8JR1Ks3DBaGeWomBI=;
        b=NSarexCuj7nMVA4PnCrjzNge/ER9nvZwvrruGN+kNMiyKX4aMRXhtTmg4Sq/P5Mmyu
         0YIenGdy/TgbDhGH6IHbSfq4CwgHjCDX9Ub2rLj18Fgx8RJ9kUiMb7RMWOXcylejiDEg
         Grgx53xNIoYvWCuBOYzbQEwmxRd71aaaxmv48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747061226; x=1747666026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZdT8ksWgEMXDFM8tuDjoHvSvI8JR1Ks3DBaGeWomBI=;
        b=k4hTP4jkmBg2A/Lpm8k0dJePUwsMJoOc5Z7C4QZcOE2ZywCREjMwMhFj7LIBH6BmDn
         7LVKFo/emW8VNSfXOFAb7CqAqu2OMEX8GXkTPUKMuvv+p29eHqxWd7F4X8TKwgTNIPmm
         gmZbSNLo+6GuCojH3vGfX370ozlDLmvcC3x2+uIIfjLRHyg33+ab7pBeFSzWxrbF9hwc
         9ITnqwFsi8j4W8wHxgOfwgsYx+SKcuNvwvQVLFyDbF0r8w24ex1LjFSYX6tZfMT4GAaD
         G1Xdap0FrnsnmMwc88wG2k7IkejIYHk8sNx86pRCxVx4SijkYneuDr0yKqOAlQbFIs4L
         pk4Q==
X-Gm-Message-State: AOJu0YwEI71t9Q6SrIS/ReuCfbjTj9R1I1m0hrgTrx6BMv0eQEeIp0/B
	CukzWglXMfxta3XMu8tg3GhqMdIFbm/lvkt9mem2tjbP4QIp8AxT7R+XMAxwYHAYrKvWIARNfi4
	=
X-Gm-Gg: ASbGncv+udn3t6xYBXaHxlU1i9xS+it/bW/9JWa8s56fl5WgPvLAiZ9LO40LCUTwnfR
	persCJVJbvwyhVDefQ7fidufalV5EPA5BULozYpQ22tUz24W6eyOgDCCljorILd3c8A6XMlaCQ7
	GCO4Y3S3qVp7ew+NjkcxJZCRYCOQhYnZzpRl9PsoLTZmAMjFBxIt4nLTQ+8bUtRygcgDjJ2IsmB
	91p4MnobtDiteKFrPnKY9ZzF8bQOZr2u46dcDnlJTX+Qx/S97g63K2XXvu236ZTXbvKUNyRkMWn
	SDEAbObOUT0acpomHGqKbtIP3QwS3sTW8zSNk+NZzA3dPcRJ8RP1fDP5xvIoF/aasvsY2uaSnX4
	=
X-Google-Smtp-Source: AGHT+IEms7S0A8wfxZM3hG5JDaxttkq/QHLgGpNwo1989lCGrQUA8aQ+tPm02NydXplFG1iINuLIxg==
X-Received: by 2002:a17:907:7b97:b0:ac3:8516:9cf2 with SMTP id a640c23a62f3a-ad21928f0e7mr1395679266b.55.1747061226318;
        Mon, 12 May 2025 07:47:06 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 1/5] x86/pmstat: Check size of PMSTAT_get_pxstat buffers
Date: Mon, 12 May 2025 15:46:52 +0100
Message-ID: <20250512144656.314925-2-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512144656.314925-1-ross.lagerwall@citrix.com>
References: <20250512144656.314925-1-ross.lagerwall@citrix.com>
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

In v2: Rather than erroring out, copy as much as possible.

 xen/drivers/acpi/pmstat.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index c51b9ca358c2..4736a84d1256 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -103,8 +103,10 @@ int do_get_pm_info(struct xen_sysctl_get_pmstat *op)
 
         cpufreq_residency_update(op->cpuid, pxpt->u.cur);
 
-        ct = pmpt->perf.state_count;
-        if ( copy_to_guest(op->u.getpx.trans_pt, pxpt->u.trans_pt, ct*ct) )
+        ct = min_t(uint32_t, pmpt->perf.state_count, op->u.getpx.total);
+
+        if ( ct <= op->u.getpx.total &&
+             copy_to_guest(op->u.getpx.trans_pt, pxpt->u.trans_pt, ct * ct) )
         {
             spin_unlock(cpufreq_statistic_lock);
             ret = -EFAULT;
-- 
2.49.0


