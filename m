Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 142C24B511F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:06:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271747.466463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3w-0004jr-3W; Mon, 14 Feb 2022 13:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271747.466463; Mon, 14 Feb 2022 13:06:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3v-0004a4-HR; Mon, 14 Feb 2022 13:06:39 +0000
Received: by outflank-mailman (input) for mailman id 271747;
 Mon, 14 Feb 2022 13:06:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb34-0008IH-44
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:05:46 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1d065cc-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:05:44 +0100 (CET)
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
X-Inumbo-ID: d1d065cc-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843945;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=uqi1jxBHAWzCvFq7xfZy03983Yg3cPF97gGqXtbut+k=;
  b=GdsEl4p4HbJXvigEFQcPPXW7iGAIJbSrb/5bQeFQIB9rg0dfbIO852nt
   JMw10Cuw6sXlMZEQAhuAIp8bOi1lXfT7V6GwoBn/oDrFI/wgYb8GwNy5H
   fAzAyre2CIMeVxkwivTt2A1YmZRqG8PDwKsO7JfMkyfnOSyKNE809WdgW
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: iaDkqD7qUoS+zmzC9I81HrN30704v81fnmngrv1xCn3IcoDwSM9/eR7vPuGemTUvEkaLAHuVgw
 Mn8p46+CExuwiD9jIgXu480cLfiHSwyWwJ3Yc6JE+MhxFLB8bL6KxOhrVgE43IYrnJOfRFaD1a
 9Teps+DNvhyYYUoduPKL32/pXjD2lqKHVes0ctCjQRDAHji9UZTX5Y0M3Ziuqt8n1GadR4wYxU
 WUhQfhVKDwBXOWnS2UOBwyw1ZJ7MfLhbWHgArXpJwfK6v/26wQukn9JbWVDlbRWFc/TyIKdMgC
 UJAZDDG22SsF58EKkwKNHqmQ
X-SBRS: 5.1
X-MesageID: 64149421
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:IDM+Dqr7hQbJCia82Kjfe8P/UYBeBmIGYhIvgKrLsJaIsI4StFCzt
 garIBmFPfyJYGOnL98jYY6x/BkC65XXy4JqSwJk+X0wRisb85uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24HlW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnaCgCkBxE6Puo/U6XhBeMCxfBL1D+bCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ZZANWszNk2ojxtnIE8+UsgVzaSSuSfHdzFkqWOQmqYlyj2GpOB2+Oe0a4eEEjCQfu1Fk0Ddq
 m/Y8mDRBhABKMfZ2TeD6mirhOLEgWX8Qo16KVGj3qc02hvJnDVVUUBIEwvgyRWktqKgc+5Pa
 AtM1yQMlrkV+UWtbdTcZg29oXHR63bwROFsO+E97QiMzI/d7ACYGnUIQ1Z9VTA2iCMlbWd0j
 wHUxrsFERQq6eTIEizFqt94uBvvYXB9EIMUWcMToeLpCfHHqZp7sB/AR80L/EWd3oysQmGYL
 9xnQUEDa1QvYSwjiv/TEbPv2WvESn31oukdvFu/Y45dxlklDLNJnqTxgbQh0d5OLZyCUn6Kt
 2Uels6V4YgmVM/RyHPdELhQROjyvZ5p1QEwZnY1QfEcG8mFoSb/Lei8HhkiTKuWDir0UWCwO
 xKC0e+gzJRSIGGrfcdKj3GZUKwXIVzbPY29DJj8N4MWCrAoLVPv1Hw+NCa4gjG2+GBxwP5XB
 HtuWZv1ZZrsIf88l2TeqiZ0+eJD+x3SMkuNGcGln0z/i+L2ibz8Ye5tDWZip9sRtMusyDg5O
 f4DXydT4xkAAuD4fAfN9osfcQIDIXQhXMikoM1LbO+TZAFhHTh5WfPWxLogfa1jnrhUybiUr
 i3sBBcAxQqtn2DDJCWLdmtnNOHlU6FgoC9pJicrJ1uphSQuON798KcFepIrVrA77+g/n+VsR
 vwIdpzYUPRCQzjK4RoHapz5oNAwfRinn1vWbSGkfCI+b9hrQAmQoo3oeQ7m9S8vCCurtJRh/
 +38h12DGZdaHlZsFsfbbv6r3midh3lFlbIgRVbML/lSZF7orNpgJRvug6JlOMoLMxjCmGeXj
 l7EHRcCqODRiIYp692V17ucpoKkHuYiTEpXG27XseS/OSXApzfxxIZBVKCDfCzHVXOy86KnP
 L0Hw/b5OfwBvVBLr4sjTOo7kfNgv4Pi9+1A0wBpPHTXdFD6WLpvL06P0dRLqqAQlKRSvhG7W
 x7X99RXUVlT1BgJzLLFyNIZU9m+
IronPort-HdrOrdr: A9a23:N2/ke6gbAIuV/gTQIR78AqjGU3BQXtgji2hC6mlwRA09TySZ//
 rBoB17726MtN9/YhEdcLy7VJVoBEmskKKdgrNhW4tKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QFJSWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64149421"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 39/70] x86/mtrr: CFI hardening
Date: Mon, 14 Feb 2022 12:50:56 +0000
Message-ID: <20220214125127.17985-40-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/cpu/mtrr/generic.c | 18 ++++++++++--------
 xen/arch/x86/cpu/mtrr/mtrr.h    |  8 ++++----
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/cpu/mtrr/generic.c b/xen/arch/x86/cpu/mtrr/generic.c
index 7cf4cd01f3f6..47aaf76226e0 100644
--- a/xen/arch/x86/cpu/mtrr/generic.c
+++ b/xen/arch/x86/cpu/mtrr/generic.c
@@ -287,7 +287,8 @@ static void set_fixed_range(int msr, bool *changed, unsigned int *msrwords)
 	}
 }
 
-int generic_get_free_region(unsigned long base, unsigned long size, int replace_reg)
+int cf_check generic_get_free_region(
+    unsigned long base, unsigned long size, int replace_reg)
 /*  [SUMMARY] Get a free MTRR.
     <base> The starting (base) address of the region.
     <size> The size (in bytes) of the region.
@@ -309,8 +310,8 @@ int generic_get_free_region(unsigned long base, unsigned long size, int replace_
 	return -ENOSPC;
 }
 
-static void generic_get_mtrr(unsigned int reg, unsigned long *base,
-			     unsigned long *size, mtrr_type *type)
+static void cf_check generic_get_mtrr(
+    unsigned int reg, unsigned long *base, unsigned long *size, mtrr_type *type)
 {
 	uint64_t _mask, _base;
 
@@ -499,7 +500,7 @@ static void post_set(bool pge)
 	spin_unlock(&set_atomicity_lock);
 }
 
-static void generic_set_all(void)
+static void cf_check generic_set_all(void)
 {
 	unsigned long mask, count;
 	unsigned long flags;
@@ -522,8 +523,8 @@ static void generic_set_all(void)
 	}
 }
 
-static void generic_set_mtrr(unsigned int reg, unsigned long base,
-			     unsigned long size, mtrr_type type)
+static void cf_check generic_set_mtrr(
+    unsigned int reg, unsigned long base, unsigned long size, mtrr_type type)
 /*  [SUMMARY] Set variable MTRR register on the local CPU.
     <reg> The register to set.
     <base> The base address of the region.
@@ -566,7 +567,8 @@ static void generic_set_mtrr(unsigned int reg, unsigned long base,
 	local_irq_restore(flags);
 }
 
-int generic_validate_add_page(unsigned long base, unsigned long size, unsigned int type)
+int cf_check generic_validate_add_page(
+    unsigned long base, unsigned long size, unsigned int type)
 {
 	unsigned long lbase, last;
 
@@ -584,7 +586,7 @@ int generic_validate_add_page(unsigned long base, unsigned long size, unsigned i
 }
 
 
-static int generic_have_wrcomb(void)
+static int cf_check generic_have_wrcomb(void)
 {
 	unsigned long config;
 	rdmsrl(MSR_MTRRcap, config);
diff --git a/xen/arch/x86/cpu/mtrr/mtrr.h b/xen/arch/x86/cpu/mtrr/mtrr.h
index 9a406e6f6199..c7fd44daab27 100644
--- a/xen/arch/x86/cpu/mtrr/mtrr.h
+++ b/xen/arch/x86/cpu/mtrr/mtrr.h
@@ -24,10 +24,10 @@ struct mtrr_ops {
 	int	(*have_wrcomb)(void);
 };
 
-extern int generic_get_free_region(unsigned long base, unsigned long size,
-				   int replace_reg);
-extern int generic_validate_add_page(unsigned long base, unsigned long size,
-				     unsigned int type);
+int cf_check generic_get_free_region(
+    unsigned long base, unsigned long size, int replace_reg);
+int cf_check generic_validate_add_page(
+    unsigned long base, unsigned long size, unsigned int type);
 
 extern const struct mtrr_ops generic_mtrr_ops;
 
-- 
2.11.0


