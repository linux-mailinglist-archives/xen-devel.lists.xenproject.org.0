Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPLTKVSqd2k6kAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F9E8BCA9
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213840.1524378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmp-0006qJ-Ep; Mon, 26 Jan 2026 17:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213840.1524378; Mon, 26 Jan 2026 17:54:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmp-0006f0-1j; Mon, 26 Jan 2026 17:54:03 +0000
Received: by outflank-mailman (input) for mailman id 1213840;
 Mon, 26 Jan 2026 17:54:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0tkY=77=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vkQmm-0004HW-Jw
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 17:54:00 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdb13772-fadf-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 18:53:59 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4801d21c411so25259695e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 09:53:58 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c10dbasm3896455e9.15.2026.01.26.09.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 09:53:57 -0800 (PST)
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
X-Inumbo-ID: fdb13772-fadf-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1769450038; x=1770054838; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQsr194qP7u179I9/onbBLntD3BMN8iVc8+MjUid8Kk=;
        b=UeTu1bgLfMuHVfScFR4BoTAufg0+dynixuDGwoqQ83Ch4D9sYSg/MXDQpHhG7DxjdR
         jIjia8oTgYzxiZSMHvgdW4XBJB9VfjcbcBeMLFfT+Oy5fCh9p0OQm+VY21KQqXsVhGeZ
         WQAcoBoBFXjK/QnNKBBQdBH6c32p5Ezasv0gY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769450038; x=1770054838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vQsr194qP7u179I9/onbBLntD3BMN8iVc8+MjUid8Kk=;
        b=WuykrlqS3YFXsA/bh5ee92SLQRtA5ysvzs76bA7wzaf4W7yKFJsin9QCDePiUql6uL
         TaWulqY1+hrCoJyDT3HRnQoZ9PGRAOEaA610GUa0EZf9+Ro/dcD+BfHDf5F7oFkNEbef
         TDJdd8/ewpSJyDTpD/sDSdcN19DapXCGrRF1x/cNF+q0+6f1ez+OtP4vaMJ+8p3YgBOI
         gZ3zzFNyttvmdxH99+u1U2JsYkl/IzKsGwAS9vzelA3zu7zAValcjS4KEZN8HRcS8KXy
         e1K6ZvANIFfGIq+KG6hDl2aiEZ2nN7Tg0ti3djG4UJzpng7IVsADiqiF41LzAaZrkX02
         XKgQ==
X-Gm-Message-State: AOJu0Yyha93gNc1u1dNXohdZByIP5DrWNHyuaCwn3V+1/YxGZOP31QrV
	V1zwR9U8l+b27dtJXp8MRNa/XecQOhsiSqgK+4iZ/TU1BIpbEI9efpUlggOyt1FHgJzRAwAEUFl
	uGd5/
X-Gm-Gg: AZuq6aKSofk1fzTXpUSbTNSOm1u3Ddsk6BwztvWqd5r566YfsQnsLPuJwSKZ2XtKtyU
	Q5AsQobgOwgAy4jPJZhGSspgMKU+grteQtLEQwuHqGwVHEGsIRw+QBODrgmqhL3oLheDj8VEe4h
	qTh8/NY+gKebW2sHRyCkNWSniwp1Ij3bb3asylggb/zfiyk8I7cq9EkV7reVuUW869sd6bfLTNw
	qoj0HAySBnxBn3FnW8BZjOqB71YeGTDwznevIXjhZHvQtWWqrtRKRbuv2NbRvME+vyOLAOI1DZQ
	AAy1YIxRKRZ5JI7Y1nG/bfD2EjhrtlPZYjO5LrS33OqJYSyFAz53jG5d3YBISIQJShYqf+gZMXL
	9DqcHU4QoKhgA9ezKRETOLnByxL2xoxEKGDzcO1jVczGIkkyiQ1FNU6WHzK40ro7U1SFSFInDx9
	o4e4ZqBMXmhW0Kd/Z46skOtT9hE2qjNiPhvAWXkOXWrbUqS0YgvejiGPFEtIyJuq4whAnr0lTA
X-Received: by 2002:a05:600c:528a:b0:480:4a8f:2d5c with SMTP id 5b1f17b1804b1-4805cf6c405mr81861005e9.29.1769450038094;
        Mon, 26 Jan 2026 09:53:58 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julian Vetter <julian.vetter@vates.tech>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 12/16] x86/amd: Probe for NX support and re-activate if possible
Date: Mon, 26 Jan 2026 17:53:41 +0000
Message-Id: <20260126175345.2078371-13-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,xcp-ng.org:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
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
X-Rspamd-Queue-Id: 45F9E8BCA9
X-Rspamd-Action: no action

An AMD Ryzen system has been found with a firmware option to disable NX.  Like
we do on Intel systems, try to detect and undo this stupidity.

Link: https://xcp-ng.org/forum/post/80714
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Julian Vetter <julian.vetter@vates.tech>
CC: Teddy Astie <teddy.astie@vates.tech>

Somewhat RFC.  I don't particularly like the double handling of
MSR_K8_EXT_FEATURE_MASK in this function, but I can't find any way of making
the logic legible while trying to dedup the MSR accesses.
---
 xen/arch/x86/cpu/amd.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index a14a12fb1d60..06646fc1af93 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -17,6 +17,7 @@
 #include <asm/msr.h>
 #include <asm/processor.h>
 #include <asm/spec_ctrl.h>
+#include <asm/trampoline.h>
 
 #include "cpu.h"
 
@@ -639,6 +640,40 @@ static void amd_early_adjust_cpuid_extd(void)
             printk(XENLOG_INFO "CPU: Re-enabling disabled Topology Extensions Support\n");
         }
     }
+
+    /*
+     * Probe for NX support if it appears to be unavailable.  All 64-bit
+     * capable AMD CPUs support it, but some firmwares have an option to hide
+     * it in CPUID, apparently for "feature parity" with Intel platforms.
+     *
+     * Unlike Intel, there's no active indication that this has been done.  A
+     * conversation with AMD suggests that if we can set EFER.NXE, then NX
+     * will work.  Use this as a heuristic to probe for support, coping with
+     * the fact that a hypervisor might have really disabled and blocked NX,
+     * and not emulate the mask MSRs either.
+     */
+    if ( !boot_cpu_has(X86_FEATURE_NX) )
+    {
+        uint64_t *this_efer = &this_cpu(efer);
+
+        if ( wrmsr_safe(MSR_EFER, *this_efer | EFER_NXE) == 0 )
+        {
+            *this_efer |= EFER_NXE;
+
+            if ( !rdmsr_safe(MSR_K8_EXT_FEATURE_MASK, &val) )
+            {
+                val |= 1ULL << cpufeat_bit(X86_FEATURE_NX);
+                wrmsr_safe(MSR_K8_EXT_FEATURE_MASK, val);
+                val = rdmsr(MSR_K8_EXT_FEATURE_MASK);
+                if ( val & (1ULL << cpufeat_bit(X86_FEATURE_NX)) )
+                {
+                    __set_bit(X86_FEATURE_NX, c->x86_capability);
+                    printk(XENLOG_INFO "re-enabled NX protection\n");
+                    bootsym(trampoline_efer) |= EFER_NXE;
+                }
+            }
+        }
+    }
 }
 
 void __init cf_check early_init_amd(void)
-- 
2.39.5


