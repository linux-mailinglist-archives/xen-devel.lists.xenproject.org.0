Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB243829D99
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 16:34:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665647.1035868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNabF-0004lr-2J; Wed, 10 Jan 2024 15:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665647.1035868; Wed, 10 Jan 2024 15:34:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNabE-0004jm-Uh; Wed, 10 Jan 2024 15:34:36 +0000
Received: by outflank-mailman (input) for mailman id 665647;
 Wed, 10 Jan 2024 15:34:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sd/G=IU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rNabD-0004jg-5N
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 15:34:35 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c152be20-afcd-11ee-98f0-6d05b1d4d9a1;
 Wed, 10 Jan 2024 16:34:34 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a277339dcf4so471226166b.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 07:34:34 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 d11-20020a170906344b00b00a26a061ae1esm2201886ejb.97.2024.01.10.07.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 07:34:32 -0800 (PST)
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
X-Inumbo-ID: c152be20-afcd-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704900873; x=1705505673; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s5IRUBnFgUJy9dyKlTUiUaZ7PU9nI2Yd4t73Y/sI5oE=;
        b=lZLBOZeb3BDvcA5RpJWNRFBG9UrSVbfRzMvtAh0SdkwGYygkj88xcOKwCXGys6CSB1
         jD7KP+Mse4O5gwZXysuP/QqJHFX8vnBsAvOWp/mGZevVuOdJAJehjTSTBcY/sWIU3S0c
         Fs3cCd9RK5ByTaIrc4CwTaxaXNxIxpC86uFzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704900873; x=1705505673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s5IRUBnFgUJy9dyKlTUiUaZ7PU9nI2Yd4t73Y/sI5oE=;
        b=PBCI7cNeGS9Dzpto+9totAIoVQJaGYAd9Wt2gmDf/aNkwXszUzdlTfyCwm81JB+Tyx
         rHxNBBmDZSgqrRSBMkaUXy9/SkIllTT8KdkYDmcsBBDetY2Y1YUuJJRSK0pUWyprduzU
         4/ujqjDyrGjymcFqqJ3Ef2gMmwsvHhfpv6jfwiTUknRRS73LZTggUXEDArcqPeY3orOb
         ElZM1j8OrEThtcjDwewPCNv+9pYTQBFmuobXu4NeJpQR8kfgu9wh0zXVfCvTD54VzwoA
         Ej08RlPlAJUhalKNtrH1lFByRmPtPvU1YSi9tGXYAo+1TrUOEfegxD2VCJCwfTVjl+tf
         BJkg==
X-Gm-Message-State: AOJu0Yx8sCPgFGTxz8j+a3FNTrKCqFkCwXUVNPe3FiEe98uXI+J33SjU
	P0QizSXx6wfKokhjuZRneSPDXF7HDfwf0liCQRkl21F0lSo=
X-Google-Smtp-Source: AGHT+IEaooXDF/OFzSn8bePCWjappqE7v96/kfigbVg5gFkNmeqVKiDfiDZE0LQHXIyuPEKq12dxaQ==
X-Received: by 2002:a17:906:c303:b0:a2b:4d5e:c5e4 with SMTP id s3-20020a170906c30300b00a2b4d5ec5e4mr706398ejz.66.1704900873089;
        Wed, 10 Jan 2024 07:34:33 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/nmi: ensure Global Performance Counter Control is setup correctly
Date: Wed, 10 Jan 2024 16:34:00 +0100
Message-ID: <20240110153400.64017-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When Architectural Performance Monitoring is available, the PERF_GLOBAL_CTRL
MSR contains per-counter enable bits that is ANDed with the enable bit in the
counter EVNTSEL MSR in order for a PMC counter to be enabled.

So far the watchdog code seems to have relied on the PERF_GLOBAL_CTRL enable
bits being set by default, but at least on some Intel Sapphire and Emerald
Rapids this is no longer the case, and Xen reports:

Testing NMI watchdog on all CPUs: 0 40 stuck

The first CPU on each socket is started with PERF_GLOBAL_CTRL zeroed, so PMC0
doesn't start counting when the enable bit in EVNTSEL0 is set, due to the
relevant enable bit in PERF_GLOBAL_CTRL not being set.

Fix by detecting when Architectural Performance Monitoring is available and
making sure the enable bit for PMC0 is set in PERF_GLOBAL_CTRL.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
The fact that it's only the first CPU on each socket that's started with
PERF_GLOBAL_CTRL clear looks like a firmware bug to me, but in any case making
sure PERF_GLOBAL_CTRL is properly setup should be done regardless.
---
 xen/arch/x86/nmi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index dc79c25e3ffd..7a6601c4fd31 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -335,6 +335,19 @@ static void setup_p6_watchdog(unsigned counter)
          nmi_p6_event_width > BITS_PER_LONG )
         return;
 
+    if ( cpu_has_arch_perfmon )
+    {
+        uint64_t global_ctrl;
+
+        rdmsrl(MSR_CORE_PERF_GLOBAL_CTRL, global_ctrl);
+        /*
+         * Make sure PMC0 is enabled in global control, as the enable bit in
+         * PERF_GLOBAL_CTRL is AND'ed with the enable bit in EVNTSEL0.
+         */
+        if ( !(global_ctrl & 1) )
+            wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, global_ctrl | 1);
+    }
+
     clear_msr_range(MSR_P6_EVNTSEL(0), 2);
     clear_msr_range(MSR_P6_PERFCTR(0), 2);
 
-- 
2.43.0


