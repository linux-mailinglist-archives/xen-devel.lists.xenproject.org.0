Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A24A45A7574
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 07:06:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395206.635172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTFvd-00073a-2J; Wed, 31 Aug 2022 05:06:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395206.635172; Wed, 31 Aug 2022 05:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTFvb-0006d9-9m; Wed, 31 Aug 2022 05:06:15 +0000
Received: by outflank-mailman (input) for mailman id 395206;
 Tue, 30 Aug 2022 21:59:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4itH=ZC=flex--surenb.bounces.google.com=3M4YOYwYKCZgKMJ6F38GG8D6.4GEP6F-56N6DDAKLK.P6FHJGB64L.GJ8@srs-se1.protection.inumbo.net>)
 id 1oT989-0008CX-Mh
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 21:50:45 +0000
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [2607:f8b0:4864:20::b4a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc77264c-28ad-11ed-a60c-1f1ba7de4fb0;
 Tue, 30 Aug 2022 23:50:45 +0200 (CEST)
Received: by mail-yb1-xb4a.google.com with SMTP id
 o144-20020a25d796000000b0069b523a4234so718307ybg.17
 for <xen-devel@lists.xenproject.org>; Tue, 30 Aug 2022 14:50:44 -0700 (PDT)
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
X-Inumbo-ID: cc77264c-28ad-11ed-a60c-1f1ba7de4fb0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=q3DJ62FdAkc75G5f5TC1WQpGOVt3l/MJJCNdx5cTnOk=;
        b=C8JONxxXVlTpftHaAGAIlpLkK3JbLire6Nmp7rtyqKkA8STqUN7GtKHqgck9OnhnK6
         JLmVEdOBtO4UgVT+rqGSVVb8el9/E2EzKFM8T34Szjzm3zJ0p5kFz3mCYcxw5G4J1WvF
         QMb4GTQ/yzzPPSsO8n/bi291Hq8qngpZB5y0K7P/GbpAFTCQEKZCNPr9wH/IKiRw2v40
         589a1BB4hctRlz5v1afevUX177R+LYQq/8EEHO7YXqeqRF8HSNYDOdN7xFassnCgRext
         TnhJSTiUhrw0wYWDFlFWpRGy66tj1fz8fdmGodc46WuVd0A4xLZ7WpBC/QBvDzjQGrdA
         SEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=q3DJ62FdAkc75G5f5TC1WQpGOVt3l/MJJCNdx5cTnOk=;
        b=5/9lgrpLxm9RkdQRl+pHboERSEH/OdTVYHpD3qnkvnwM8FOFLEmkTR4ZrUcqQTHMq5
         nYF0WvPrWLXRlysZjaWI/JIqiw5lg6a2oKo8GvMgCrPF9zrBb/zJ5GdRPAsbq6Bbf4x+
         Jy9ByuAwp0k5J1ZDqvy5bTHfKEamPR/XAYK4AhjKr1iqGuERnBzV81kLMMtP0T/+9T0E
         lL2AMnO+b01EYDXnKoeSAM5EmaH8qxjWoc3WEHdUQsxeU+FZu0nDSGAHv1y/wDIgYA+G
         TqdSedjT5EVoR+bJenfFVNJelBTCUygXW80u7UOhuZIECkxMfYe6z0nymEDhU10I4rrD
         A1og==
X-Gm-Message-State: ACgBeo0eWFZeIC/PqiZ+feAI7IJP4GRPC5JcVosp+ZHiaLuuG0+/Jhrs
	amKvU5YVq02wZ7s7cxqn1d2veBDtNmw=
X-Google-Smtp-Source: AA6agR6mRIYh/Ugh76Z9OGxiRjbQrZ+9wpxKxcSIOnClnh/ne0QVaaMxuz4y8WxW9UVOyJ1glmO9CKBYbzs=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:a005:55b3:6c26:b3e4])
 (user=surenb job=sendgmr) by 2002:a25:8a85:0:b0:671:715e:a1b0 with SMTP id
 h5-20020a258a85000000b00671715ea1b0mr12680068ybl.98.1661896243785; Tue, 30
 Aug 2022 14:50:43 -0700 (PDT)
Date: Tue, 30 Aug 2022 14:49:19 -0700
In-Reply-To: <20220830214919.53220-1-surenb@google.com>
Mime-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220830214919.53220-31-surenb@google.com>
Subject: [RFC PATCH 30/30] MAINTAINERS: Add entries for code tagging & related
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	void@manifault.com, peterz@infradead.org, juri.lelli@redhat.com, 
	ldufour@linux.ibm.com, peterx@redhat.com, david@redhat.com, axboe@kernel.dk, 
	mcgrof@kernel.org, masahiroy@kernel.org, nathan@kernel.org, 
	changbin.du@intel.com, ytcoode@gmail.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	bristot@redhat.com, vschneid@redhat.com, cl@linux.com, penberg@kernel.org, 
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com, 
	elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, arnd@arndb.de, jbaron@akamai.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	surenb@google.com, kernel-team@android.com, linux-mm@kvack.org, 
	iommu@lists.linux.dev, kasan-dev@googlegroups.com, io-uring@vger.kernel.org, 
	linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-bcache@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Kent Overstreet <kent.overstreet@linux.dev>

The new code & libraries added are being maintained - mark them as such.

Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
---
 MAINTAINERS | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 589517372408..902c96744bcb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5111,6 +5111,19 @@ S:	Supported
 F:	Documentation/process/code-of-conduct-interpretation.rst
 F:	Documentation/process/code-of-conduct.rst
 
+CODE TAGGING
+M:	Suren Baghdasaryan <surenb@google.com>
+M:	Kent Overstreet <kent.overstreet@linux.dev>
+S:	Maintained
+F:	lib/codetag.c
+F:	include/linux/codetag.h
+
+CODE TAGGING TIME STATS
+M:	Kent Overstreet <kent.overstreet@linux.dev>
+S:	Maintained
+F:	lib/codetag_time_stats.c
+F:	include/linux/codetag_time_stats.h
+
 COMEDI DRIVERS
 M:	Ian Abbott <abbotti@mev.co.uk>
 M:	H Hartley Sweeten <hsweeten@visionengravers.com>
@@ -11405,6 +11418,12 @@ M:	John Hawley <warthog9@eaglescrag.net>
 S:	Maintained
 F:	tools/testing/ktest
 
+LAZY PERCPU COUNTERS
+M:	Kent Overstreet <kent.overstreet@linux.dev>
+S:	Maintained
+F:	lib/lazy-percpu-counter.c
+F:	include/linux/lazy-percpu-counter.h
+
 L3MDEV
 M:	David Ahern <dsahern@kernel.org>
 L:	netdev@vger.kernel.org
@@ -13124,6 +13143,15 @@ F:	include/linux/memblock.h
 F:	mm/memblock.c
 F:	tools/testing/memblock/
 
+MEMORY ALLOCATION TRACKING
+M:	Suren Baghdasaryan <surenb@google.com>
+M:	Kent Overstreet <kent.overstreet@linux.dev>
+S:	Maintained
+F:	lib/alloc_tag.c
+F:	lib/pgalloc_tag.c
+F:	include/linux/alloc_tag.h
+F:	include/linux/codetag_ctx.h
+
 MEMORY CONTROLLER DRIVERS
 M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 L:	linux-kernel@vger.kernel.org
@@ -20421,6 +20449,12 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/luca/wl12xx.git
 F:	drivers/net/wireless/ti/
 F:	include/linux/wl12xx.h
 
+TIME STATS
+M:	Kent Overstreet <kent.overstreet@linux.dev>
+S:	Maintained
+F:	lib/time_stats.c
+F:	include/linux/time_stats.h
+
 TIMEKEEPING, CLOCKSOURCE CORE, NTP, ALARMTIMER
 M:	John Stultz <jstultz@google.com>
 M:	Thomas Gleixner <tglx@linutronix.de>
-- 
2.37.2.672.g94769d06f0-goog


