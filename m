Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21821A56717
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 12:51:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904926.1312716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqWF1-0001nz-JN; Fri, 07 Mar 2025 11:51:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904926.1312716; Fri, 07 Mar 2025 11:51:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqWF1-0001l1-G8; Fri, 07 Mar 2025 11:51:47 +0000
Received: by outflank-mailman (input) for mailman id 904926;
 Fri, 07 Mar 2025 11:51:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxnO=V2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tqWF0-0001cc-Bh
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 11:51:46 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 844b7592-fb4a-11ef-9ab5-95dc52dad729;
 Fri, 07 Mar 2025 12:51:33 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38f406e9f80so1262096f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Mar 2025 03:51:33 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd8db6c7sm48847945e9.22.2025.03.07.03.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 03:51:32 -0800 (PST)
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
X-Inumbo-ID: 844b7592-fb4a-11ef-9ab5-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741348293; x=1741953093; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7K1WxkPx6B+F9quxshJAMXmff5Fv04D/D/jaAgOIolQ=;
        b=SKSlRJBvU7i2AXBdoo1+o41GV9uG7tJXnwp5bSmOa5b+13VnF7UUCsJ9TueVE7hMNa
         zJMkTn1gsfW05tHEY/Y+G4IaSfWyXoveDORZERDAJXWE9kUxK0pA9x3gBX2zaXfcVyeN
         kQhhZchnb39JjwzX70D43fGz+YuO8qWqxhWM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741348293; x=1741953093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7K1WxkPx6B+F9quxshJAMXmff5Fv04D/D/jaAgOIolQ=;
        b=RlYcr+fKlqHU3RonQaXeQz8KK93GOMTF4Z/39KwfTKv/jkjCuWDQzmfCSV3iGbETMI
         NQjUGp/WID70qUXaVeC1VC8ySJLuZIYrVGPNtp3Z0IeFi2U85nTc2NZ9HyFVVc7+XWGn
         9s047bM/vlgVqMTZceTJcTcmeZqVw+2KGOXC89YGg+nXf8Fi2g8PlAfXFK/LBHRpwqSF
         e/Ou+T7yg5al2D9S+4chHG30JwyFpYVBJ24I9OhF7tiSWV4pNpinuQjiEhvrFREqxMlH
         Li96YT3uUldyEKKxrujuOzxj8evqZURr2yrzmLgmiQyazNIbew4JYciuAyEYjXKjkSqJ
         /FMQ==
X-Gm-Message-State: AOJu0Yxw+iNdiQoJ8W5OaqUrI8CzMyjvsbArjsQ8kyest/3vMWgNayLV
	EvUmFwQG1PpU2QGrS1o2YOr9+rODJWhT458piWJDYE7GT2PFArwbI/zraUyQKyNpqlH275UhJ8a
	L
X-Gm-Gg: ASbGncuOkO926/Umj+kv4vXBUZItEX7gJgKlYNi0BeeXFkBb8/j3a7FwbGwZ8vbYkMh
	+yBFkqMQ5h9VBXOdATOUPr2loWik//QsRyXLjDrtUf36KEFUHRcM5nMHQdB3OCalTrE7ND8ykNL
	ogee+x+kHeJF/93poWgraAy1uorkKWl+hC+eXmuyHqnnNK1aTVr4BRXAmGclJhE6jqFqgDbSwm2
	a60kIgHnqQ+DfBR23qgHqLiKHcBO59UIOnKHpqP5cek5F2S2P+a5oYnQZaSg2ZHSH9ClC/8zqqa
	35kCm22cjph/RTGzl5psf073l2eTl8ZQrVVDc1tEDp+eh6sFDuKVt3dDvCapFYA93VXOoe6NL85
	XmVhEXY6x150F/Xzgqu/vU7NQ
X-Google-Smtp-Source: AGHT+IGW6GL6gl90EjQabVRBImMQqqWEd9p57XRhL1b2Ns2xfnkJi5d2vUoK7w5nHKGB8NmadGE6Pg==
X-Received: by 2002:a5d:47a4:0:b0:390:eb46:1894 with SMTP id ffacd0b85a97d-39132d64b2fmr2183957f8f.21.1741348293036;
        Fri, 07 Mar 2025 03:51:33 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] xen/public: Fix documentation of VIRQs
Date: Fri,  7 Mar 2025 11:49:30 +0000
Message-Id: <20250307114930.3038480-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <0315252d-0378-4699-bff7-ce745d753438@suse.com>
References: <0315252d-0378-4699-bff7-ce745d753438@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It has been discovered that VIRQ_ARGO is a 3rd type of VIRQ.  Also, recent
work has prevented global VIRQs from being stolen from the owning domain.

Rewrite the description of VIRQ classifications.  Drop the (DOM0) comment from
the global VIRQs; it's not been true for a long time.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Juergen Gross <jgross@suse.com>
---
 xen/include/public/event_channel.h |  8 +++----
 xen/include/public/xen.h           | 37 +++++++++++++++++++-----------
 2 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/xen/include/public/event_channel.h b/xen/include/public/event_channel.h
index 0d91a1c4afab..c5548d206c74 100644
--- a/xen/include/public/event_channel.h
+++ b/xen/include/public/event_channel.h
@@ -114,10 +114,10 @@ typedef struct evtchn_bind_interdomain evtchn_bind_interdomain_t;
  * EVTCHNOP_bind_virq: Bind a local event channel to VIRQ <irq> on specified
  * vcpu.
  * NOTES:
- *  1. Virtual IRQs are classified as per-vcpu or global. See the VIRQ list
- *     in xen.h for the classification of each VIRQ.
- *  2. Global VIRQs must be allocated on VCPU0 but can subsequently be
- *     re-bound via EVTCHNOP_bind_vcpu.
+ *  1. Virtual IRQs are classified as per-vcpu, per-domain or global. See the
+ *     VIRQ list in xen.h for the classification of each VIRQ.
+ *  2. Per-domain and global VIRQs must be allocated on vCPU0 but can
+ *     subsequently be re-bound via EVTCHNOP_bind_vcpu.
  *  3. Per-vcpu VIRQs may be bound to at most one event channel per vcpu.
  *     The allocated event channel is bound to the specified vcpu and the
  *     binding cannot be changed.
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index e051f989a5ca..75b1c1d597f9 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -159,25 +159,34 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
  *
  * Virtual interrupts that a guest OS may receive from Xen.
  *
- * In the side comments, 'V.' denotes a per-VCPU VIRQ while 'G.' denotes a
- * global VIRQ. The former can be bound once per VCPU and cannot be re-bound.
- * The latter can be allocated only once per guest: they must initially be
- * allocated to VCPU0 but can subsequently be re-bound.
+ * There are three types:
+ *
+ * 1. (V) Per-vcpu:
+ *    These can be bound once per vCPU, each using a different evtchn port.
+ *    An evtchn for one vCPU cannot be rebound to a different vCPU.
+ *
+ * 2. (D) Per-domain:
+ *    These can be bound once per domain.  They must be bound on vCPU 0 first,
+ *    but can be rebound to other vCPUs afterwards.
+ *
+ * 3. (G) Global:
+ *    Like per-domain, but can only be bound to a single domain at a time.
+ *    The owning domain must unbind before a new domain can bind.
  */
 /* ` enum virq { */
 #define VIRQ_TIMER      0  /* V. Timebase update, and/or requested timeout.  */
 #define VIRQ_DEBUG      1  /* V. Request guest to dump debug info.           */
-#define VIRQ_CONSOLE    2  /* G. (DOM0) Bytes received on emergency console. */
-#define VIRQ_DOM_EXC    3  /* G. (DOM0) Exceptional event for some domain.   */
-#define VIRQ_TBUF       4  /* G. (DOM0) Trace buffer has records available.  */
-#define VIRQ_DEBUGGER   6  /* G. (DOM0) A domain has paused for debugging.   */
+#define VIRQ_CONSOLE    2  /* G. Bytes received on emergency console.        */
+#define VIRQ_DOM_EXC    3  /* G. Exceptional event for some domain.          */
+#define VIRQ_TBUF       4  /* G. Trace buffer has records available.         */
+#define VIRQ_DEBUGGER   6  /* G. A domain has paused for debugging.          */
 #define VIRQ_XENOPROF   7  /* V. XenOprofile interrupt: new sample available */
-#define VIRQ_CON_RING   8  /* G. (DOM0) Bytes received on console            */
-#define VIRQ_PCPU_STATE 9  /* G. (DOM0) PCPU state changed                   */
-#define VIRQ_MEM_EVENT  10 /* G. (DOM0) A memory event has occurred          */
-#define VIRQ_ARGO       11 /* G. Argo interdomain message notification       */
-#define VIRQ_ENOMEM     12 /* G. (DOM0) Low on heap memory       */
-#define VIRQ_XENPMU     13 /* V.  PMC interrupt                              */
+#define VIRQ_CON_RING   8  /* G. Bytes received on console                   */
+#define VIRQ_PCPU_STATE 9  /* G. PCPU state changed                          */
+#define VIRQ_MEM_EVENT  10 /* G. A memory event has occurred                 */
+#define VIRQ_ARGO       11 /* D. Argo interdomain message notification       */
+#define VIRQ_ENOMEM     12 /* G. Low on heap memory                          */
+#define VIRQ_XENPMU     13 /* V. PMC interrupt                               */
 
 /* Architecture-specific VIRQ definitions. */
 #define VIRQ_ARCH_0    16
-- 
2.39.5


