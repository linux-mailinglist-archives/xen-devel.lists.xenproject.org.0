Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D25AC5203
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 17:27:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998565.1379331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJwCi-0001zv-62; Tue, 27 May 2025 15:27:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998565.1379331; Tue, 27 May 2025 15:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJwCi-0001w9-0g; Tue, 27 May 2025 15:27:00 +0000
Received: by outflank-mailman (input) for mailman id 998565;
 Tue, 27 May 2025 15:26:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wzHE=YL=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uJwCg-0001GX-T7
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 15:26:58 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06c2159b-3b0f-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 17:26:57 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5efe8d9ebdfso6763637a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 08:26:57 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6049d482cc7sm3442712a12.19.2025.05.27.08.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 08:26:44 -0700 (PDT)
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
X-Inumbo-ID: 06c2159b-3b0f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748359616; x=1748964416; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7EiuJMdCLjFWOEnoMYbjUzW+ITRH6U+JRE5WHKaDcw4=;
        b=I7Efd4m+AeIF8SnpByKXCXsQg+4anwVbyB5WwWzbZ4k/xftCa7UaOfVwNWW8ocqbGS
         Co6ROjBiaaSYS2eq7u0Dvh7o5grbA89U/+OIh9F6YIVowjJvhpH9jkNNEKfn42FtvJ7i
         Hp/gdnQoKWVgJ2jNV5uwfgXcVbrIVUfOloQJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748359616; x=1748964416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7EiuJMdCLjFWOEnoMYbjUzW+ITRH6U+JRE5WHKaDcw4=;
        b=oNWcX4rFNtU17tZvXchbknyyVFoNHUyKWF4qqcxnZLP4mKuXR/WPjLziqGYR6xeWq0
         7xsOfN/7ZJ7n4MBGgapxPqWgU11Lsy6ScNrQKhvTf19rDgse3EqnMmaNU11zLuZH3NLn
         M7W/4ylUaJ+P7jnyxX0vx0IWI1TS7oxLYxUJcHxiFgwEsZ83nHXJELTH1tOpTuNid7NN
         mpDOAjaHuI9ShDczdpBSW6V9Sao+AZRjEU8VBzOpi6OTQuhlaBdzljDFL1xJ4/NVnmpq
         87II/Z9oIVqKFXnUwApmjdkcxHwK0nTCJYpp/q5OI/hXFlyHweW2fBo6mn/YNIM3TDx+
         y4XA==
X-Gm-Message-State: AOJu0YyTSOQZtMSIvK5jv9IBhDeYpx199LG6VgI0nNVbqr0K4G9dViPm
	PsQAYrjH8ZY/ySIRYQbEimJYWAI40Ap75orp4xT1+29+iHobZuHIp9SSbWrLKO2hy0HkfGvoaTV
	jsWA=
X-Gm-Gg: ASbGncufOhz3OaJMXxinb06JGEwuABhesCHi6QDeD5h2bGssF8xxe6lcJ9y8hY52WwM
	BdcUBgLSf4zOHv5g9u/0h9FvL6mNHM7bpVk8ZeOOAmwweTkvfFDfOCXWkez53caDCdU+4gPyuHI
	kGf1dDccWfGUwc+UMKWNZsv5r3Ib7svz+LZjW71bMjc4lbA/vNhwVGsoa0xOd/FZkBDp355q8Lf
	mgEXxIU0hSfEiR2Q1hb6pCJCGAtVV4sipAax0gKi2s6GTb6gMajyWKxz2bJDQVxeMIwBkJxpwCg
	Q1LNUCoBcm7G3Q8nDoTl+PWPusf28jIUGgxGUVINziGqHITY40j+XXzotGfeGgsT1vS+1CDFtgc
	=
X-Google-Smtp-Source: AGHT+IHYE2hnovzy6W1PgNLaxLFKR7wewuV0GiqQDMScRgK3xO82ngXX7l+Zt1GJ0pZEMQ86Wh/Frg==
X-Received: by 2002:a05:6402:84f:b0:5ff:ef95:333a with SMTP id 4fb4d7f45d1cf-602d953574emr10518215a12.13.1748359605055;
        Tue, 27 May 2025 08:26:45 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 1/5] x86/pmstat: Check size of PMSTAT_get_pxstat buffers
Date: Tue, 27 May 2025 16:26:31 +0100
Message-ID: <20250527152635.2451449-2-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527152635.2451449-1-ross.lagerwall@citrix.com>
References: <20250527152635.2451449-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check that the total number of states passed in and hence the size of
buffers is sufficient to avoid writing more than the caller has
allocated.

The interface is not explicit about whether getpx.total is expected to
be set by the caller in this case but since it is always set in
libxenctrl it seems reasonable to check it and make it explicit.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Fixes: c06a7db0c547 ("X86 and IA64: Update cpufreq statistic logic for supporting both x86 and ia64")
---

In v3:

* Fix if condition
* Move some header comments from patch 2
* Clarify some comments

 xen/drivers/acpi/pmstat.c   |  7 +++++--
 xen/include/public/sysctl.h | 15 +++++++++++++--
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index c51b9ca358c2..0d570e28bf11 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -103,8 +103,11 @@ int do_get_pm_info(struct xen_sysctl_get_pmstat *op)
 
         cpufreq_residency_update(op->cpuid, pxpt->u.cur);
 
-        ct = pmpt->perf.state_count;
-        if ( copy_to_guest(op->u.getpx.trans_pt, pxpt->u.trans_pt, ct*ct) )
+        ct = min(pmpt->perf.state_count, op->u.getpx.total + 0U);
+
+        /* Avoid partial copying of 2-D array */
+        if ( ct == op->u.getpx.total &&
+             copy_to_guest(op->u.getpx.trans_pt, pxpt->u.trans_pt, ct * ct) )
         {
             spin_unlock(cpufreq_statistic_lock);
             ret = -EFAULT;
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 9eca72865b87..906a3364fbd9 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -215,11 +215,22 @@ typedef struct pm_px_val pm_px_val_t;
 DEFINE_XEN_GUEST_HANDLE(pm_px_val_t);
 
 struct pm_px_stat {
-    uint8_t total;        /* total Px states */
+    /*
+     * IN: Number of elements in pt, number of rows/columns in trans_pt
+     *     (PMSTAT_get_pxstat)
+     * OUT: total Px states (PMSTAT_get_max_px, PMSTAT_get_pxstat)
+     */
+    uint8_t total;
     uint8_t usable;       /* usable Px states */
     uint8_t last;         /* last Px state */
     uint8_t cur;          /* current Px state */
-    XEN_GUEST_HANDLE_64(uint64) trans_pt;   /* Px transition table */
+    /*
+     * OUT: Px transition table. This should have total * total elements.
+     *      As it is a 2-D array, this will not be copied if it is smaller than
+     *      the hypervisor's Px transition table. (PMSTAT_get_pxstat)
+     */
+    XEN_GUEST_HANDLE_64(uint64) trans_pt;
+    /* OUT: This should have total elements (PMSTAT_get_pxstat) */
     XEN_GUEST_HANDLE_64(pm_px_val_t) pt;
 };
 
-- 
2.49.0


