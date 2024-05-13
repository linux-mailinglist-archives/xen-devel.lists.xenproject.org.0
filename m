Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0BA8C3DB0
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 11:00:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720762.1123675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6RX4-00016n-Df; Mon, 13 May 2024 08:59:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720762.1123675; Mon, 13 May 2024 08:59:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6RX4-00014n-B4; Mon, 13 May 2024 08:59:42 +0000
Received: by outflank-mailman (input) for mailman id 720762;
 Mon, 13 May 2024 08:59:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YK/2=MQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6RX3-00014h-77
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 08:59:41 +0000
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [2607:f8b0:4864:20::72f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e387fd0-1107-11ef-b4bb-af5377834399;
 Mon, 13 May 2024 10:59:35 +0200 (CEST)
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-792b8d31702so276464885a.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 May 2024 01:59:38 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf27f90asm436657885a.39.2024.05.13.01.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 01:59:36 -0700 (PDT)
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
X-Inumbo-ID: 1e387fd0-1107-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715590776; x=1716195576; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W/+OcyPkAtT0pCVAr3+POiO/21XGiS+ysCNprHlUJrs=;
        b=lVWZNrnsP32ayrG5wksMAReJHDBQqxH/reDHTe44xkIFZTWiAAH88/PiuOymTZmt2c
         +DQNmVqh6yCMpYoXIzh3r0mWwXM9nt3Q1dOX4UUYsXoOZi3kuYNE5aerCDGDgCK7tV16
         usSPgycvNLUq7PMpmS/0qY++3SATfqEW3KX/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715590776; x=1716195576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/+OcyPkAtT0pCVAr3+POiO/21XGiS+ysCNprHlUJrs=;
        b=t6D6OcOEkoTmJjMCxitO6YWz5DhAFtMx/pHbRrIVfo3at8IMiO/X7jUi5tEdhQUOkp
         x5QCron4yCF0Qx8VRl42NY6y1FpHzmGGOpErtbYw/QGk/7oJJkEre/apcjkURxqYQPeT
         Jxtj4O4souvgj8XfAx6EUSC+BwPq5t6MhDc0pxJ8b2lUZfDvaVmUDfg05ViRj8A6XpSs
         GWckLNMhDkPO2pBcuVBvt1f3JGTUQlaXpkl/wBbSj0r+lhzMQ61PPw1K469XBiVP7uoH
         A5e91YK2X7Hj42SdtbGf3lbG6NLdbwcMMTLz5qC//aCQcScM/nuJvg52Q6nroI/9zqxF
         LiRw==
X-Gm-Message-State: AOJu0YxcXL7X9+FH5u7uceiSLydKZuxUdU3XD4pgpHUBE6auirq1WWpD
	wdkm74fPJafAvKTos05ccTHxCP/EJ93UXkBbxYnwUgxnQr8s+kLY5em0pLRT3n6dMFAlBJq94aa
	h
X-Google-Smtp-Source: AGHT+IExYVTD2wi9mnSJckW9cM+0MIQtI6P1ojDxQ0lXkV9q56dtHiqj1d99dMo5temt9ww+2LZFyQ==
X-Received: by 2002:a05:620a:820f:b0:792:daab:b209 with SMTP id af79cd13be357-792daabb44fmr358087485a.6.1715590776386;
        Mon, 13 May 2024 01:59:36 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19] x86/mtrr: avoid system wide rendezvous when setting AP MTRRs
Date: Mon, 13 May 2024 10:59:25 +0200
Message-ID: <20240513085925.59324-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There's no point in forcing a system wide update of the MTRRs on all processors
when there are no changes to be propagated.  On AP startup it's only the AP
that needs to write the system wide MTRR values in order to match the rest of
the already online CPUs.

We have occasionally seen the watchdog trigger during `xen-hptool cpu-online`
in one Intel Cascade Lake box with 448 CPUs due to the re-setting of the MTRRs
on all the CPUs in the system.

While there adjust the comment to clarify why the system-wide resetting of the
MTRR registers is not needed for the purposes of mtrr_ap_init().

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
For consideration for 4.19: it's a bugfix of a rare instance of the watchdog
triggering, but it's also a good performance improvement when performing
cpu-online.

Hopefully runtime changes to MTRR will affect a single MSR at a time, lowering
the chance of the watchdog triggering due to the system-wide resetting of the
range.
---
 xen/arch/x86/cpu/mtrr/main.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/cpu/mtrr/main.c b/xen/arch/x86/cpu/mtrr/main.c
index 90b235f57e68..0a44ebbcb04f 100644
--- a/xen/arch/x86/cpu/mtrr/main.c
+++ b/xen/arch/x86/cpu/mtrr/main.c
@@ -573,14 +573,15 @@ void mtrr_ap_init(void)
 	if (!mtrr_if || hold_mtrr_updates_on_aps)
 		return;
 	/*
-	 * Ideally we should hold mtrr_mutex here to avoid mtrr entries changed,
-	 * but this routine will be called in cpu boot time, holding the lock
-	 * breaks it. This routine is called in two cases: 1.very earily time
-	 * of software resume, when there absolutely isn't mtrr entry changes;
-	 * 2.cpu hotadd time. We let mtrr_add/del_page hold cpuhotplug lock to
-	 * prevent mtrr entry changes
+	 * hold_mtrr_updates_on_aps takes care of preventing unnecessary MTRR
+	 * updates when batch starting the CPUs (see
+	 * mtrr_aps_sync_{begin,end}()).
+	 *
+	 * Otherwise just apply the current system wide MTRR values to this AP.
+	 * Note this doesn't require synchronization with the other CPUs, as
+	 * there are strictly no modifications of the current MTRR values.
 	 */
-	set_mtrr(~0U, 0, 0, 0);
+	mtrr_set_all();
 }
 
 /**
-- 
2.44.0


