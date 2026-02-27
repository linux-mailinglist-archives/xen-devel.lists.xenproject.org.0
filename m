Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCKYMvElommM0QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 00:17:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C28C61BEF1B
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 00:17:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243140.1543153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw74k-0001JI-Qm; Fri, 27 Feb 2026 23:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243140.1543153; Fri, 27 Feb 2026 23:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw74k-0001GV-NI; Fri, 27 Feb 2026 23:16:50 +0000
Received: by outflank-mailman (input) for mailman id 1243140;
 Fri, 27 Feb 2026 23:16:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gz2F=A7=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vw74j-0001Do-As
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 23:16:49 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 632ad0ca-1432-11f1-9ccf-f158ae23cfc8;
 Sat, 28 Feb 2026 00:16:47 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-436309f1ad7so2114610f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Feb 2026 15:16:47 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c70e8e8sm9680306f8f.10.2026.02.27.15.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 15:16:44 -0800 (PST)
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
X-Inumbo-ID: 632ad0ca-1432-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1772234206; x=1772839006; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSmplNXhRERAowFWA9uIl/lO9zqC+gj9SfzDfIr2SeQ=;
        b=m6m+SJal6DBgyMJkYVtOAxLZPkvazgIJsWlBSfD+IBqJFMxDe8RG3dD1yy0wd+kEx7
         M4+xbVDm0LyCHxDcM6Slf9g6czWs0BTWw13nq01VIP8Hxe7ScCVNj9hO+Pb8KYYvPAKM
         Fae7CLq/CcQl2z9afMzxZ/Py8bVwWf31FwI88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772234206; x=1772839006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wSmplNXhRERAowFWA9uIl/lO9zqC+gj9SfzDfIr2SeQ=;
        b=kGH5puSBtS8f2byRD3uedhh2g2Jf4UlygGY81rla5GGY3C+FaTSL+UAWJXanZp042x
         vyCEJrCqWGjSJ/R0d5vQmFo1KE23ofeRFd4WDyWFnJwzphCng5tRFFBXiYD2APfyNH0l
         3fgCIrYdEjfeGmlllM4U4Z7JN1Spm35vQGgBYkqB25zhVawI/Rkod+gppKOiHp486KuJ
         5Ebv0YaHjOa1PvFmT0qBulyzM0Pb4ACUrofeixh2MYrAaJlwQUnNwK7FiPzlZF2d0gZf
         llM5o1ca6H+FsPPZjmy97TzSqSs/26NrfGRzEpsLYP2stF8Ar9QzMdoQJLeGDBjQqcip
         aNGQ==
X-Gm-Message-State: AOJu0YzU0so86jO5NdjQSfPwW9UWnIDfNZ/vhvylb1ESZaY3R74lHgWF
	GmzAX87BaRGeUiGsqW9uChkvx01FqL2GK8/ehtL2pmBm6XfqvDxFH3ScRPn0S8anwWoRObgdFM7
	YWdlZ
X-Gm-Gg: ATEYQzzAOFeCs3lTn13kaoVaZo7A/l8aCgLM2tao6krK0tFr9FiaVjfHOcZrM/AzxJh
	o170EqFdOnGfSc4FY/IUcTsuNUBHbn/iCQ1UgdrUEJJ/tD4+szT7JsHX+15Gdr9CQ1kCGJPVU1N
	C06j5gtP3tKXB9G1w/ROWyuz4b6m8gA3ULsRaTz+oz5Wt/GwWkGTfq/S0IFlgy/5xVqULJjQEkD
	HYbaMxpYJXwZJwKJAYYU66ki1ZDHB6YfwdQ2Mpqgctix4NRXPtbr0+LGzH7kXvvplvuA5tOqk+Y
	YfG2Wi7UbuYwEW6HAmzN2NmbpS1q6m8W7I2qQOOmdKNcvo0I2S7xZYiioBy0WqNg4ox6uPH77rk
	oX+9U9sxwrjeAHcga+wDSWnZdZE+MoizcYOfNg26ZXhk6XpIil7dU17gXbyw0SwvvJ76bPT3um7
	KoBg71o3F+Xq95pTC/7A85EHshB2as1UlaMeN1z4TOLj1e0tEOLApMemD3O5Wk7EnBYLd10uQ=
X-Received: by 2002:a05:6000:1447:b0:435:9e32:2b78 with SMTP id ffacd0b85a97d-4399dddbbb3mr7543711f8f.1.1772234205704;
        Fri, 27 Feb 2026 15:16:45 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 04/14] x86/boot: Document the ordering dependency of _svm_cpu_up()
Date: Fri, 27 Feb 2026 23:16:26 +0000
Message-Id: <20260227231636.3955109-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:dkim,citrix.com:email];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C28C61BEF1B
X-Rspamd-Action: no action

Lets just say this took an unreasoanble amount of time and effort to track
down, when trying to move traps_init() earlier during boot.

When the SYSCALL linkage MSRs are not configured ahead of _svm_cpu_up() on the
BSP, the first context switch into PV uses svm_load_segs() and clobbers the
later-set-up linkage with the 0's cached here, causing hypercalls issues by
the PV guest to enter at 0 in supervisor mode on the user stack.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v4:
 * New

It occurs to me that it's not actually 0's we cache here.  It's whatever
context was left from prior to Xen.  We still don't reliably clean unused
MSRs.
---
 xen/arch/x86/hvm/svm/svm.c | 16 ++++++++++++++++
 xen/arch/x86/setup.c       |  2 +-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 18ba837738c6..f1e02d919cae 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -35,6 +35,7 @@
 #include <asm/p2m.h>
 #include <asm/paging.h>
 #include <asm/processor.h>
+#include <asm/traps.h>
 #include <asm/vm_event.h>
 #include <asm/x86_emulate.h>
 
@@ -1581,6 +1582,21 @@ static int _svm_cpu_up(bool bsp)
     /* Initialize OSVW bits to be used by guests */
     svm_host_osvw_init();
 
+    /*
+     * VMSAVE writes out the current full FS, GS, LDTR and TR segments, and
+     * the GS_SHADOW, SYSENTER and SYSCALL linkage MSRs.
+     *
+     * The segment data gets modified by the svm_load_segs() optimisation for
+     * PV context switches, but all values get reloaded at that point, as well
+     * as during context switch from SVM.
+     *
+     * If PV guests are available (and FRED is not in use), it is critical
+     * that the SYSCALL linkage MSRs been configured at this juncture.
+     */
+    ASSERT(opt_fred >= 0); /* Confirm that FRED-ness has been resolved */
+    if ( IS_ENABLED(CONFIG_PV) && !opt_fred )
+        ASSERT(rdmsr(MSR_LSTAR));
+
     svm_vmsave_pa(per_cpu(host_vmcb, cpu));
 
     return 0;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 27c63d1d97c9..675de3a649ea 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2078,7 +2078,7 @@ void asmlinkage __init noreturn __start_xen(void)
                                            &this_cpu(stubs).mfn);
     BUG_ON(!this_cpu(stubs.addr));
 
-    traps_init(); /* Needs stubs allocated. */
+    traps_init(); /* Needs stubs allocated, must be before presmp_initcalls. */
 
     cpu_init();
 
-- 
2.39.5


