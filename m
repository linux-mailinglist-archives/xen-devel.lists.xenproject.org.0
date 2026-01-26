Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIo5E1Gqd2kZkAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC06D8BC4A
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213843.1524405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmt-0007Yg-DJ; Mon, 26 Jan 2026 17:54:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213843.1524405; Mon, 26 Jan 2026 17:54:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQms-0007OB-9k; Mon, 26 Jan 2026 17:54:06 +0000
Received: by outflank-mailman (input) for mailman id 1213843;
 Mon, 26 Jan 2026 17:54:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0tkY=77=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vkQmo-0004HW-KW
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 17:54:02 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fec40fdb-fadf-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 18:54:00 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4805ef35864so11603905e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 09:54:00 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c10dbasm3896455e9.15.2026.01.26.09.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 09:53:59 -0800 (PST)
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
X-Inumbo-ID: fec40fdb-fadf-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1769450040; x=1770054840; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCtWZ5jsIOSUx1eQSxD4nCRKX4JQJ1b+ozb5fk5XF6E=;
        b=Hxh1cCQHWBqWBiwzUbkftqMBtcyLrl0t8N/iMtZQYEKDxP1e5biIgvFMoxCU6uu0R/
         TiRYZzV9qOl1xEszYskDPdn4F0X8cDIdVbZi9VMcaeJZ4PNUjNdNOWOg42Vt5kM0XSG+
         raSdmamK8Vv/XgnBpEwCPeenP7PuaL60CGRlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769450040; x=1770054840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oCtWZ5jsIOSUx1eQSxD4nCRKX4JQJ1b+ozb5fk5XF6E=;
        b=a0IYXUnbTdaczKnhuzBZ+/vW2uJhSsw95UnDZ3MJ7aAcWgI99J9oHVZz/EJU7rGkCs
         4o3OKRdn6X4EA/GrPwIY7exEHR8cCrhnCavTV45wKQOP098zF6KZqGmJet9ulOFNMRdB
         IVZP7EWQgvbpaWklpWSY143KNS6pooKHcdOKp1+f3myW0xUitgvUFEWkaed3WFaiQ7j2
         hi+fxTaWHPz9e6xHGx2H8iAXfQIibaWk2loRcXIZKVqAvnXvp1nHm1soyv18LilokZfj
         hwnNBL+pJC7lGFeLzn1DC+L8x9heArEoGS93oPKXW1FYcfNIYvLJbbEoZM+sksI0yJZH
         RmiA==
X-Gm-Message-State: AOJu0YyO7D2CfSk88BlTjTIajfKNNauREt71mQtNJvJDgQl6lhHxKedQ
	dN5TOVkBrrFgiOLc1N2zMO3/laMtLOZuAcjE1fKylU3z3h7BuPTDWptStspca37aYe7Qo11GknB
	Z4VAb
X-Gm-Gg: AZuq6aK85J3u/zTw2d4XrPg9pMahaPUojx2hhWFpGgMMP1IDQjPdmKs7DKOjTSgFEwQ
	h9E9L5vWkdHgU1nDxY7NSXDw3DlZKdyaDxIo1r7Ztj/isOvcDUy2Ii2XDfQg9nNpDtSE7Wd43ma
	L4nypfBAM1DamRLDTq7WTDCbmpwF1DbmtuaXAOQkyaCaT5JTMCt/Bry8vgCq1iG6cEvRUQt7lYb
	CYvtUqGK2qiciY8t51gwdANkwi7uwkVEvLDGAeG5/GkqPjSDUgYESwiolbsMPcl/JXWnfqOaTsC
	5k1JArskuWdVescYuRB2yLpXzQsUcZTHRtiH9n/BAqaRljYj9EEEfJ5eObbxITnzR4YGUJSVRQg
	qbnkg4SIiY038lFwrQ07KmvHNDUMlGPFr3720HaUKAuxUxIpILgoIhhnX5LBP+KpvrZkodycFMY
	7KsljQOTEpoh3Q73EhK8HdNkcIz0qYa03saF5klaXCYEn+zuUVfahCe54hRzslcw==
X-Received: by 2002:a05:600c:b96:b0:480:1e8f:d15f with SMTP id 5b1f17b1804b1-4805cd40a06mr82761325e9.2.1769450039908;
        Mon, 26 Jan 2026 09:53:59 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julian Vetter <julian.vetter@vates.tech>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 15/16] x86/cpu: Clean up use of LCAP_* constants
Date: Mon, 26 Jan 2026 17:53:44 +0000
Message-Id: <20260126175345.2078371-16-andrew.cooper3@citrix.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim,citrix.com:mid,suse.com:email];
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
X-Rspamd-Queue-Id: DC06D8BC4A
X-Rspamd-Action: no action

Now that the LCAP_* constants are single bits, we can simplify the expressions
using them.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Julian Vetter <julian.vetter@vates.tech>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/cpu/amd.c | 12 ++++++------
 xen/arch/x86/domain.c  | 10 +++++-----
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 06646fc1af93..f259a2112a16 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -171,7 +171,7 @@ void cf_check amd_ctxt_switch_masking(const struct vcpu *next)
 		(nextd && is_pv_domain(nextd) && nextd->arch.pv.cpuidmasks)
 		? nextd->arch.pv.cpuidmasks : &cpuidmask_defaults;
 
-	if ((levelling_caps & LCAP_1cd) == LCAP_1cd) {
+	if (levelling_caps & LCAP_1cd) {
 		uint64_t val = masks->_1cd;
 
 		/*
@@ -192,7 +192,7 @@ void cf_check amd_ctxt_switch_masking(const struct vcpu *next)
 #define LAZY(cap, msr, field)						\
 	({								\
 		if (unlikely(these_masks->field != masks->field) &&	\
-		    ((levelling_caps & cap) == cap))			\
+		    (levelling_caps & cap))				\
 		{							\
 			wrmsr_amd(msr, masks->field);			\
 			these_masks->field = masks->field;		\
@@ -251,7 +251,7 @@ static void __init amd_init_levelling(void)
 	 */
 	probe_masking_msrs();
 
-	if ((levelling_caps & LCAP_1cd) == LCAP_1cd) {
+	if (levelling_caps & LCAP_1cd) {
 		uint32_t ecx, edx, tmp;
 
 		cpuid(0x00000001, &tmp, &tmp, &ecx, &edx);
@@ -264,7 +264,7 @@ static void __init amd_init_levelling(void)
 		cpuidmask_defaults._1cd = ((uint64_t)ecx << 32) | edx;
 	}
 
-	if ((levelling_caps & LCAP_e1cd) == LCAP_e1cd) {
+	if (levelling_caps & LCAP_e1cd) {
 		uint32_t ecx, edx, tmp;
 
 		cpuid(0x80000001, &tmp, &tmp, &ecx, &edx);
@@ -275,7 +275,7 @@ static void __init amd_init_levelling(void)
 		cpuidmask_defaults.e1cd = ((uint64_t)ecx << 32) | edx;
 	}
 
-	if ((levelling_caps & LCAP_7ab0) == LCAP_7ab0) {
+	if (levelling_caps & LCAP_7ab0) {
 		uint32_t eax, ebx, tmp;
 
 		cpuid(0x00000007, &eax, &ebx, &tmp, &tmp);
@@ -283,7 +283,7 @@ static void __init amd_init_levelling(void)
 		cpuidmask_defaults._7ab0 &= ((uint64_t)eax << 32) | ebx;
 	}
 
-	if ((levelling_caps & LCAP_6c) == LCAP_6c) {
+	if (levelling_caps & LCAP_6c) {
 		uint32_t ecx = cpuid_ecx(6);
 
 		cpuidmask_defaults._6c &= (~0ULL << 32) | ecx;
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index c29a6b0decee..441f99e92088 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -303,7 +303,7 @@ void domain_cpu_policy_changed(struct domain *d)
 
     if ( is_pv_domain(d) )
     {
-        if ( ((levelling_caps & LCAP_1cd) == LCAP_1cd) )
+        if ( levelling_caps & LCAP_1cd )
         {
             uint64_t mask = cpuidmask_defaults._1cd;
             uint32_t ecx = p->basic._1c;
@@ -368,7 +368,7 @@ void domain_cpu_policy_changed(struct domain *d)
             d->arch.pv.cpuidmasks->_1cd = mask;
         }
 
-        if ( ((levelling_caps & LCAP_6c) == LCAP_6c) )
+        if ( levelling_caps & LCAP_6c )
         {
             uint64_t mask = cpuidmask_defaults._6c;
 
@@ -378,7 +378,7 @@ void domain_cpu_policy_changed(struct domain *d)
             d->arch.pv.cpuidmasks->_6c = mask;
         }
 
-        if ( ((levelling_caps & LCAP_7ab0) == LCAP_7ab0) )
+        if ( levelling_caps & LCAP_7ab0 )
         {
             uint64_t mask = cpuidmask_defaults._7ab0;
 
@@ -395,7 +395,7 @@ void domain_cpu_policy_changed(struct domain *d)
             d->arch.pv.cpuidmasks->_7ab0 = mask;
         }
 
-        if ( ((levelling_caps & LCAP_Da1) == LCAP_Da1) )
+        if ( levelling_caps & LCAP_Da1 )
         {
             uint64_t mask = cpuidmask_defaults.Da1;
             uint32_t eax = p->xstate.Da1;
@@ -406,7 +406,7 @@ void domain_cpu_policy_changed(struct domain *d)
             d->arch.pv.cpuidmasks->Da1 = mask;
         }
 
-        if ( ((levelling_caps & LCAP_e1cd) == LCAP_e1cd) )
+        if ( levelling_caps & LCAP_e1cd )
         {
             uint64_t mask = cpuidmask_defaults.e1cd;
             uint32_t ecx = p->extd.e1c;
-- 
2.39.5


