Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2547219454E
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 18:20:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHW8P-0000g1-UI; Thu, 26 Mar 2020 17:17:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6lDd=5L=gmail.com=raistlin.df@srs-us1.protection.inumbo.net>)
 id 1jHW8O-0000fv-4I
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 17:17:36 +0000
X-Inumbo-ID: af46f9d4-6f85-11ea-92cf-bc764e2007e4
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af46f9d4-6f85-11ea-92cf-bc764e2007e4;
 Thu, 26 Mar 2020 17:17:35 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id g62so7984173wme.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2020 10:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:user-agent
 :mime-version:content-transfer-encoding;
 bh=RRGSUpce1GX5rQ/0PkKkU/oKGaQn4K18GfE8sX5XWDM=;
 b=GFqaUnDFtRJLIgL+600XtKdVc+b5tMA8VGyeuZA3DzNz3i34UrD2gn8fAJ4TVgg3Qu
 XJop0GCZ9h7ji8VT7PeuME008NGOKdcW1hbfbQ59+IXrMrtxG2jaAlpsaEUTaCGWI0MB
 XRTqyBPX89yLZxasnRTQIiF8tEBaaAoUbJz5VDGzFFbqc4ZbZS2rFUOiRoNKmvmMKSbf
 GrvLIN7XfEff7VLqZbGyM4EJH/lG9JbBUIw1L4+eu8dmoKidQluD0pfWMuc1u+Orj9+U
 pXTMyr1gxDCMF8Vsu6gKsG5XqwRuxysXR92oY6727mcgJB5NqQJ0hJsAdWpK5kzp0n3W
 28UQ==
X-Gm-Message-State: ANhLgQ1dP1D4g05BGwhYyJ9r1b3E/j5pbnBk28cd02b99mkkMqZ9t08z
 2hUJtP0pno1bXzVWeNL8uB8IZOIL
X-Google-Smtp-Source: ADFU+vvPMIBAzSwZt7w4K+pD6TSMXjCa6G7hLqxVUHUwTxNivtM2UY4/sZgxNvRKkyPtPTljYHqoKQ==
X-Received: by 2002:a1c:4d0c:: with SMTP id o12mr915847wmh.119.1585243054326; 
 Thu, 26 Mar 2020 10:17:34 -0700 (PDT)
Received: from [192.168.0.35] (87.78.186.89.cust.ip.kpnqwest.it.
 [89.186.78.87])
 by smtp.gmail.com with ESMTPSA id p3sm4490933wrj.91.2020.03.26.10.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 10:17:33 -0700 (PDT)
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 26 Mar 2020 18:17:32 +0100
Message-ID: <158524305235.31663.14043511848631384508.stgit@Palanthas>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH] xen: x86: make init_intel_cacheinfo() void.
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?utf-8?b?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

It seems that we took this code from Linux, back when the function was
'unsigned int' and the return value was used.

But we are currently not doing anything with such value, so let's get
rid of it and make the function void. As an anecdote, that's pretty much
the same that happened in Linux as, since commit 807e9bc8e2fe6 ("x86/CPU:
Move cpu_detect_cache_sizes() into init_intel_cacheinfo()") the function
is void there too.

Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/intel.c           |    4 +---
 xen/arch/x86/cpu/intel_cacheinfo.c |    4 +---
 xen/include/asm-x86/processor.h    |    2 +-
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 4d7324e4d0..7966f4aa8a 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -346,12 +346,10 @@ static int num_cpu_cores(struct cpuinfo_x86 *c)
 
 static void init_intel(struct cpuinfo_x86 *c)
 {
-	unsigned int l2 = 0;
-
 	/* Detect the extended topology information if available */
 	detect_extended_topology(c);
 
-	l2 = init_intel_cacheinfo(c);
+	init_intel_cacheinfo(c);
 	if (c->cpuid_level > 9) {
 		unsigned eax = cpuid_eax(10);
 		/* Check for version and the number of counters */
diff --git a/xen/arch/x86/cpu/intel_cacheinfo.c b/xen/arch/x86/cpu/intel_cacheinfo.c
index 88b61fddfe..5624e8056d 100644
--- a/xen/arch/x86/cpu/intel_cacheinfo.c
+++ b/xen/arch/x86/cpu/intel_cacheinfo.c
@@ -116,7 +116,7 @@ static int find_num_cache_leaves(void)
 	return i;
 }
 
-unsigned int init_intel_cacheinfo(struct cpuinfo_x86 *c)
+void init_intel_cacheinfo(struct cpuinfo_x86 *c)
 {
 	unsigned int trace = 0, l1i = 0, l1d = 0, l2 = 0, l3 = 0; /* Cache sizes */
 	unsigned int new_l1d = 0, new_l1i = 0; /* Cache sizes from cpuid(4) */
@@ -262,6 +262,4 @@ unsigned int init_intel_cacheinfo(struct cpuinfo_x86 *c)
 	}
 
 	c->x86_cache_size = l3 ? l3 : (l2 ? l2 : (l1i+l1d));
-
-	return l2;
 }
diff --git a/xen/include/asm-x86/processor.h b/xen/include/asm-x86/processor.h
index fe231c5072..ea6e5497f4 100644
--- a/xen/include/asm-x86/processor.h
+++ b/xen/include/asm-x86/processor.h
@@ -166,7 +166,7 @@ extern void identify_cpu(struct cpuinfo_x86 *);
 extern void setup_clear_cpu_cap(unsigned int);
 extern void setup_force_cpu_cap(unsigned int);
 extern void print_cpu_info(unsigned int cpu);
-extern unsigned int init_intel_cacheinfo(struct cpuinfo_x86 *c);
+extern void init_intel_cacheinfo(struct cpuinfo_x86 *c);
 
 #define cpu_to_core(_cpu)   (cpu_data[_cpu].cpu_core_id)
 #define cpu_to_socket(_cpu) (cpu_data[_cpu].phys_proc_id)


