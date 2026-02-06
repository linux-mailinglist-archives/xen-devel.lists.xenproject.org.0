Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJIrNffohWnCHwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 14:13:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C7EFDEE9
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 14:13:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223202.1530811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voLe8-0001AG-Sx; Fri, 06 Feb 2026 13:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223202.1530811; Fri, 06 Feb 2026 13:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voLe8-00017o-PS; Fri, 06 Feb 2026 13:13:16 +0000
Received: by outflank-mailman (input) for mailman id 1223202;
 Fri, 06 Feb 2026 13:13:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R5re=AK=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1voLe6-00015k-Or
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 13:13:14 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 953ecb26-035d-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 14:13:09 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-43596062728so2226633f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 05:13:09 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296c0f2esm5726244f8f.19.2026.02.06.05.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 05:13:07 -0800 (PST)
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
X-Inumbo-ID: 953ecb26-035d-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1770383589; x=1770988389; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l06N7W/IgJqsoeByf1/E1bvHwGy9JIi2puRVREdrwfk=;
        b=FooH+3NJtFPRBCtoIX9seKxIE9B8reXEYf9Iw55ux1lQ/c9arEBXrwa+Z5Q1WiRT3A
         UfuXO3HO1IIeWoysy0iaoP5DQvwfUmD549xAaZVWFn3QVQM1ZTB4kzD+3KeWGbdmyGPM
         4cNHpznCnB+eGtNqMtXFk7J52Y+ZDE5Y+ZAK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770383589; x=1770988389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l06N7W/IgJqsoeByf1/E1bvHwGy9JIi2puRVREdrwfk=;
        b=gLzqT77S0X0aSlyScJzH7SUesOM97w6MvNgBekt22TH1H8JJlIwGPxcCx94kwhBdTq
         enHHhgzPAjkqcLtA6zhsJx9vRCf6859Rzn5pUU84N6XFIPNt91MYXLkkzN4JG4tRuION
         Qu6b2Sj6TBbmSOWQhl2rSBXIJyIs/AfqqnQVTjOdpimbS6rH10qfFQshcXDJVtT75Dr5
         SBbasY9FnjUdbl6SvjTcLyXQ2EpXYmJr1lFsJ+G9+5IDjUX5wvBpW//ZKBgA0THIbnl9
         QnRrM2AsVbrA78btnm/ARgOkuauHtZoAGStnW+ttVDe9S+LhJY4AamQNocm4ZpTakQ2y
         lZuQ==
X-Gm-Message-State: AOJu0YwhgW9IaWwEEhq2WCnQCy3DhpEpd7wg+ustbUBFSLpnHFlA5mpl
	mSCWe5npME8Wj4k+JvQpNNQGm0cu/0WDziDt8y1ytC86gRmkuBZD9wB//i4AeJ4tey/W2H+4ejs
	B9uF9
X-Gm-Gg: AZuq6aKNcvCBpoq6oXbCnU46yF3dIBvIzvrVnSDAvC6/q8ch8QckWsJ8w1+q7FWzDNX
	Hh/u1oQzkt5VcKMm6wFvCvZA9W3Xsm2W8t6rbWuJ/GeTyAFN0uncz5xTptIV2N2dIjQandGTGM8
	+9fNrUb+JL41s3vHo8b1yFFDkZoHBTpBvWS9SgrGkEk3j/ET+XcUCSFlkPCLPsmLWpzSjmIijwY
	HdFTMZcuAmk67C1mIEBsr+Gv1GrJDWTpXH/tkFApZxPtlLOWAA2NFZKb/o8H1SuaZxzX9OpjkY8
	PavDMzCk+Be/Ldppxv77/d8XCcfkUUvn9iLwHkIRJML+77HNpr01/kUYasOWhXpsgadQ9Emvt8P
	homV/8/eyPavi7wXqYR6F4o/goYADYMqrDB8Us9iA/6MxUws1+Ue5jLvL/0DXeGDWod/T4gzzNy
	lIgdFFjpKpxsGEfmst3UKGl5slExKs0lLrI0rsCnt0zW5LnBIvf31TDC7z9RMDpf8ndcWWLBpdF
	bB+aV7K6g==
X-Received: by 2002:a05:6000:18a4:b0:431:c06:bc82 with SMTP id ffacd0b85a97d-436209967b3mr11293997f8f.12.1770383588085;
        Fri, 06 Feb 2026 05:13:08 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/2] x86: Sort headers
Date: Fri,  6 Feb 2026 13:13:04 +0000
Message-Id: <20260206131305.2675905-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260206131305.2675905-1-andrew.cooper3@citrix.com>
References: <20260206131305.2675905-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,citrix.com:email,citrix.com:dkim,citrix.com:mid];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 41C7EFDEE9
X-Rspamd-Action: no action

... prior to making changes.

mtrr/main.c absolutely does not need to include asm/uaccess.h

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/mtrr/generic.c | 10 ++++++----
 xen/arch/x86/cpu/mtrr/main.c    |  5 +++--
 xen/arch/x86/mm/p2m-ept.c       | 22 ++++++++++++----------
 3 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/cpu/mtrr/generic.c b/xen/arch/x86/cpu/mtrr/generic.c
index c587e9140e06..ad6a24f055ec 100644
--- a/xen/arch/x86/cpu/mtrr/generic.c
+++ b/xen/arch/x86/cpu/mtrr/generic.c
@@ -1,17 +1,19 @@
 /* This only handles 32bit MTRR on 32bit hosts. This is strictly wrong
    because MTRRs can span upto 40 bits (36bits on most modern x86) */ 
-#include <xen/lib.h>
+
 #include <xen/init.h>
+#include <xen/lib.h>
 #include <xen/mm.h>
 #include <xen/param.h>
-#include <xen/stdbool.h>
+
+#include <asm/cpufeature.h>
 #include <asm/flushtlb.h>
 #include <asm/invpcid.h>
 #include <asm/io.h>
-#include <asm/mtrr.h>
 #include <asm/msr.h>
+#include <asm/mtrr.h>
 #include <asm/system.h>
-#include <asm/cpufeature.h>
+
 #include "mtrr.h"
 
 static const struct fixed_range_block {
diff --git a/xen/arch/x86/cpu/mtrr/main.c b/xen/arch/x86/cpu/mtrr/main.c
index d4f549d92ee7..eff0500f0d06 100644
--- a/xen/arch/x86/cpu/mtrr/main.c
+++ b/xen/arch/x86/cpu/mtrr/main.c
@@ -34,11 +34,12 @@
 #include <xen/lib.h>
 #include <xen/smp.h>
 #include <xen/spinlock.h>
+
 #include <asm/atomic.h>
+#include <asm/msr.h>
 #include <asm/mtrr.h>
-#include <asm/uaccess.h>
 #include <asm/processor.h>
-#include <asm/msr.h>
+
 #include "mtrr.h"
 
 /* No blocking mutexes in Xen. Spin instead. */
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index dfdbfa0afec8..204bdb054a89 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -5,22 +5,24 @@
  */
 
 #include <xen/domain_page.h>
+#include <xen/iommu.h>
+#include <xen/keyhandler.h>
 #include <xen/sched.h>
-#include <public/hvm/dm_op.h>
+#include <xen/softirq.h>
+
 #include <asm/altp2m.h>
 #include <asm/current.h>
-#include <asm/iocap.h>
-#include <asm/paging.h>
 #include <asm/domain.h>
-#include <asm/p2m.h>
-#include <asm/hvm/vmx/vmx.h>
-#include <asm/hvm/vmx/vmcs.h>
+#include <asm/hvm/cacheattr.h>
 #include <asm/hvm/nestedhvm.h>
-#include <xen/iommu.h>
+#include <asm/hvm/vmx/vmcs.h>
+#include <asm/hvm/vmx/vmx.h>
+#include <asm/iocap.h>
 #include <asm/mtrr.h>
-#include <asm/hvm/cacheattr.h>
-#include <xen/keyhandler.h>
-#include <xen/softirq.h>
+#include <asm/p2m.h>
+#include <asm/paging.h>
+
+#include <public/hvm/dm_op.h>
 
 #include "mm-locks.h"
 #include "p2m.h"

base-commit: 381b4ff16f7ff83a2dc44f16b8dd0208f3255ec7
-- 
2.39.5


