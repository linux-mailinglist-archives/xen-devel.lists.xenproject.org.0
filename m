Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCcONUgQcWlEcgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 18:43:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 869B65AB23
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 18:43:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210104.1521931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vicEm-0007Ao-8W; Wed, 21 Jan 2026 17:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210104.1521931; Wed, 21 Jan 2026 17:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vicEm-00077s-5S; Wed, 21 Jan 2026 17:43:24 +0000
Received: by outflank-mailman (input) for mailman id 1210104;
 Wed, 21 Jan 2026 17:43:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3E7I=72=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vicEl-00077K-8s
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 17:43:23 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abf3666b-f6f0-11f0-9ccf-f158ae23cfc8;
 Wed, 21 Jan 2026 18:43:19 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-43246af170aso56414f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jan 2026 09:43:18 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43596b62700sm9702651f8f.42.2026.01.21.09.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 09:43:16 -0800 (PST)
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
X-Inumbo-ID: abf3666b-f6f0-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1769017398; x=1769622198; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v9y2S3cd3EBdIWGtGldmEHVozUbvuRK7dO8V2IFvzEI=;
        b=HMdl6zrpoyMmisPGBFI6jxw1bGFY/54uk65Gi92+iwdOsPq/3OnfKQmIgq5BjXRZze
         asKAdAOgknjx5ka3izp2Eczdv2R5aPnKCbM8mu6AtgkDbtaP0gHiYpDlz7Z+NFlawUzh
         4Srp7UArknOMk02iWopB3mHCV5LJicOPAGczI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769017398; x=1769622198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9y2S3cd3EBdIWGtGldmEHVozUbvuRK7dO8V2IFvzEI=;
        b=u0Nd5gaTYTxhz4rUfpnWcvUxuVl61sXSa7TQWyEZRhFVFw4WX2iyteeAv6+NC3Rs7J
         MHGMw4D70ViIp0K2yLPigXNYB6B1hJXsmpIZKjK9A2XfGLgktrjyCbZ/hEF+S2G5CEHU
         QJYKf0S/hvjv02gMZk+zbYmt8tArKDybrHmlgz6LUKylpWaoVxeHqtCfzTedQOP97Say
         e5D6sEi7jR/ov6Jkj6jMVvbw+vLPSWprMhzgOAzELFgIMYQ81DtRYxVJPUSuLOH1rEp1
         DzPRfPdob5G69vCDXMiiddcCu0GFwSkMYL9gzRw8CwaS8rzalY9v1vf82L1Gl4NiD6eW
         xduw==
X-Gm-Message-State: AOJu0YwQcyBfjzNif5mOrYY9Bexqj6pK/cO4QB2/tpMlmYTCgalIFZHh
	mXDKcV+ZKvR1g4XuDQzFqjVXwG/ncA08fAA9p4wXPNehOGp2v/85HXQpJKH0JepDzwfUsa3L9Um
	boDa/
X-Gm-Gg: AZuq6aL0WZs4TdjkeEGkFIHNhGmRawE4pdF/AZ2Kj0Z0Jx3fDHMYpPkiENNBXkup0kO
	WgWctuB4Nk+7ahT0p4cbHV8cO5xB9LBnPG/hYsRbtEmb4U09Yz6vvUdBjcyg/LGY0DVEvAWDsZE
	rrv3v4R+3nCnClkcdHFwyD8zsjzJgVWDkYiD1zENrpHNrCB5lsMh3l7aPh1m9HieBHIu+GAIvlX
	ifZHjilC8nlT1Mk6fnmjcUXS7+U2jmL5Rk5kAITsauDS5BW+lyG8PH2/n46c41taL0Vv6frtTR8
	pXECSpeFMmC7K2EkjTAqf5qB3IN3ss+Nb+1LTquaughPoSfBPQxFeHkzxpWExxHxkD7NrUZb7sn
	dZUuMk1mAB8Aav9vkzk0fFUETarkQ7NeYh78vHXUkkbRLJ8Z/BPEPFKPlU/mMOq8R61vE0TeNWO
	bpBEbZ+RDyoAGBQQkBUwKUdRmfF6ICG0/Ir2uV9SWRGDA9FkeN4zmpOKG6T6fkH3/DZOzfYbo2
X-Received: by 2002:a05:6000:2502:b0:430:f593:aa34 with SMTP id ffacd0b85a97d-435a5fd0604mr461458f8f.17.1769017397088;
        Wed, 21 Jan 2026 09:43:17 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Subject: [PATCH] x86/svm: Adjust VMCB comments
Date: Wed, 21 Jan 2026 17:43:14 +0000
Message-Id: <20260121174314.1465759-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:alejandro.garciavallejo@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:email,citrix.com:dkim,citrix.com:mid,suse.com:email,amd.com:email];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 869B65AB23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Intercept comments provide no value whatsoever.  For the VMCB, label the
Control area and State Save area, which are the names given by the APM.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/hvm/svm/vmcb.c | 4 ++++
 xen/arch/x86/hvm/svm/vmcb.h | 8 ++------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index cbee10d0463d..72173c8fdd6a 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -430,9 +430,13 @@ static void __init __maybe_unused build_assertions(void)
 
     /* Build-time check of the VMCB layout. */
     BUILD_BUG_ON(sizeof(vmcb) != PAGE_SIZE);
+
+    /* Control area */
     BUILD_BUG_ON(offsetof(typeof(vmcb), _pause_filter_thresh) != 0x03c);
     BUILD_BUG_ON(offsetof(typeof(vmcb), _vintr)               != 0x060);
     BUILD_BUG_ON(offsetof(typeof(vmcb), event_inj)            != 0x0a8);
+
+    /* State Save area */
     BUILD_BUG_ON(offsetof(typeof(vmcb), es)                   != 0x400);
     BUILD_BUG_ON(offsetof(typeof(vmcb), _cpl)                 != 0x4cb);
     BUILD_BUG_ON(offsetof(typeof(vmcb), _cr4)                 != 0x548);
diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
index ba554a964487..c64386e7ef85 100644
--- a/xen/arch/x86/hvm/svm/vmcb.h
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -8,7 +8,6 @@
 
 struct vcpu;
 
-/* general 1 intercepts */
 enum GenericIntercept1bits
 {
     GENERAL1_INTERCEPT_INTR          = 1 << 0,
@@ -45,7 +44,6 @@ enum GenericIntercept1bits
     GENERAL1_INTERCEPT_SHUTDOWN_EVT  = 1u << 31
 };
 
-/* general 2 intercepts */
 enum GenericIntercept2bits
 {
     GENERAL2_INTERCEPT_VMRUN   = 1 << 0,
@@ -65,8 +63,6 @@ enum GenericIntercept2bits
     GENERAL2_INTERCEPT_RDPRU   = 1 << 14,
 };
 
-
-/* control register intercepts */
 enum CRInterceptBits
 {
     CR_INTERCEPT_CR0_READ   = 1 << 0,
@@ -103,8 +99,6 @@ enum CRInterceptBits
     CR_INTERCEPT_CR15_WRITE = 1u << 31,
 };
 
-
-/* debug register intercepts */
 enum DRInterceptBits
 {
     DR_INTERCEPT_DR0_READ   = 1 << 0,
@@ -400,6 +394,7 @@ typedef union
 #define MSRPM_SIZE  (8  * 1024)
 
 struct vmcb_struct {
+    /* Control area */
     u32 _cr_intercepts;         /* offset 0x00 - cleanbit 0 */
     u32 _dr_intercepts;         /* offset 0x04 - cleanbit 0 */
     u32 _exception_intercepts;  /* offset 0x08 - cleanbit 0 */
@@ -491,6 +486,7 @@ struct vmcb_struct {
     u8  guest_ins[15];          /* offset 0xD1 */
     u64 res10a[100];            /* offset 0xE0 pad to save area */
 
+    /* State Save area */
     union {
         struct segment_register sreg[6];
         struct {
-- 
2.39.5


