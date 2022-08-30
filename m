Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0669D5A757B
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 07:06:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395212.635236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTFvp-0001fm-F1; Wed, 31 Aug 2022 05:06:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395212.635236; Wed, 31 Aug 2022 05:06:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTFvo-00010t-5h; Wed, 31 Aug 2022 05:06:28 +0000
Received: by outflank-mailman (input) for mailman id 395212;
 Tue, 30 Aug 2022 21:59:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+0SO=ZC=flex--surenb.bounces.google.com=3IIYOYwYKCYU130nwkpxxpun.lxv6nw-mn4nuur121.6nwy0xsnl2.x0p@srs-se1.protection.inumbo.net>)
 id 1oT97q-0008CX-68
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 21:50:26 +0000
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [2607:f8b0:4864:20::1149])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0dd4bf5-28ad-11ed-a60c-1f1ba7de4fb0;
 Tue, 30 Aug 2022 23:50:25 +0200 (CEST)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-340c6cfc388so139172497b3.20
 for <xen-devel@lists.xenproject.org>; Tue, 30 Aug 2022 14:50:25 -0700 (PDT)
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
X-Inumbo-ID: c0dd4bf5-28ad-11ed-a60c-1f1ba7de4fb0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=tbrDSnAu2qp291q6FJVI5HAkVfDwcm9jT2uRBxykBxo=;
        b=kiiww/u+gNRUQ3btvqFql15o+OQdqGRa8iL5JT7J5S/FJUftRrKykzaiX80qCn3gMA
         N7fu/FadrPTfEuXGUmENdVvQNfb5Lc4hc7j+KvIJFmTYxMub96J2Dq6Qz7qLRmUGLg7U
         /uSKboJAjqTu07ETlC77WQsJyUV6n0Enhp4LQHtPzmOHIYGgLaodwOejnzgOW/A+KcGj
         gwCBB1i6MWj4k2p8na3VWnkGj14/Yz4lw5Y6xUMEQ+oozkWQlSuhUKUMfndEmuXu4exw
         3VsqAU7Bes2ONZTxN75FIe9AuWEsm6slCzF5WV8jRwyOqmL1j24ghFNHmneopZkYIiwV
         aIGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=tbrDSnAu2qp291q6FJVI5HAkVfDwcm9jT2uRBxykBxo=;
        b=wrwgY1Cm9LDT0nDdjXkR+SZNJ3PxjCEXInSXyMKeOMVPO+rbVzGoKiQ5UCBimVErKd
         CXnRg0/aW08U5T2u9wfV7qxKi2tSMrlOg2bdccn23+DwSqhJi+VIbOgRC84BLvz02igU
         DDME6sFzBcwSYqprWUUX2GqyPzT2Re1LndOVMC+RSZEZwopyl3JbahjBlvlD9wdZTCRu
         p2eNfv1rHX/xgAhYInS05jCFDAvn8pTOUyKW+U+o49itpaoRjSC1iSX8yojXC75PEevk
         NK4W2afxTgbQU1dkEhh2DjdvN3MtpswtpfJzeCkLUINswxP6U/Jiu4DAjpWTw+vrROXT
         jXZA==
X-Gm-Message-State: ACgBeo37zn3Vunz3SKP+DHAZv9G2c78JGeMO9ohYJBVsEDaVJqjmf87a
	G+/l6ml+VtxQ1DAh5uez7JOwENRDmew=
X-Google-Smtp-Source: AA6agR68X2SkqWShs2xXg87H6kYkH/5wxhQgvNByd1kyOXdUxqgguxdVIPa42ox8e5jz4qITJ7VUdF/uTQY=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:a005:55b3:6c26:b3e4])
 (user=surenb job=sendgmr) by 2002:a81:13d7:0:b0:324:7dcb:8d26 with SMTP id
 206-20020a8113d7000000b003247dcb8d26mr16712805ywt.452.1661896224365; Tue, 30
 Aug 2022 14:50:24 -0700 (PDT)
Date: Tue, 30 Aug 2022 14:49:12 -0700
In-Reply-To: <20220830214919.53220-1-surenb@google.com>
Mime-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220830214919.53220-24-surenb@google.com>
Subject: [RFC PATCH 23/30] timekeeping: Add a missing include
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

We need ktime.h for ktime_t.

Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
---
 include/linux/timekeeping.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/timekeeping.h b/include/linux/timekeeping.h
index fe1e467ba046..7c43e98cf211 100644
--- a/include/linux/timekeeping.h
+++ b/include/linux/timekeeping.h
@@ -4,6 +4,7 @@
 
 #include <linux/errno.h>
 #include <linux/clocksource_ids.h>
+#include <linux/ktime.h>
 
 /* Included from linux/ktime.h */
 
-- 
2.37.2.672.g94769d06f0-goog


