Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7593085F3F4
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 10:07:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684259.1064003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd52d-0008Ax-W1; Thu, 22 Feb 2024 09:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684259.1064003; Thu, 22 Feb 2024 09:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd52d-00088P-SU; Thu, 22 Feb 2024 09:06:55 +0000
Received: by outflank-mailman (input) for mailman id 684259;
 Thu, 22 Feb 2024 09:06:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gCR=J7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rd52c-00087Q-JV
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 09:06:54 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b80a6e5c-d161-11ee-98f5-efadbce2ee36;
 Thu, 22 Feb 2024 10:06:52 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2d21cdbc85bso21242421fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2024 01:06:52 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 bj13-20020a0560001e0d00b0033d926bf7b5sm1243304wrb.76.2024.02.22.01.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 01:06:50 -0800 (PST)
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
X-Inumbo-ID: b80a6e5c-d161-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708592811; x=1709197611; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyY62PKoEMOxefDcZ5yAyBP77/0u5doyNW7ljPYkb9c=;
        b=FJM57vDYmMbbustH6UW/uv3X/ELhxzTk6neugH5/jwkvsUormaaJ4Y906RA/VW5aUa
         Vt8FzkRtiGp02/1XAMNdJrLyaCRAELkjk6i5N6Aqa45XzD1AIoLJLdYOkQuCT+EBziaY
         eBQrJsV6wY+4eFWF6omBkMa/AZ5PC9t8lifN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708592811; x=1709197611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyY62PKoEMOxefDcZ5yAyBP77/0u5doyNW7ljPYkb9c=;
        b=YNDZiDjRJuk+j7n/rIEn4j5Ind1HZYlivw3QjOCXisGioZi/C6jzwP2pbYn0xpaCVK
         OGNFlFi4xkJljfkteYlmqlvzRUFEcOMyvSa8P4SmHQKu+WP7fGd2kUlA+8OyZksjj2kV
         x1MstY4pVAdkkf4swN7M6sGHJWrDN5AzR9iBZKv5wUVxhhZoBIJhTVRrydZB2kF29T/+
         5PvlpmdNI0lNZ2NXoYgt0hitiX1JKHoqxxqpuntyLM2J+6uR+gxCrRyLKQJq/Cx5vqI5
         wPJYNVukQwbnG9ZzldJbu919l64h44RzzjtXxws5HAxjsRfN4vJB/cbMqWe61agFvUr1
         sj4w==
X-Gm-Message-State: AOJu0YxB7rRP1Mz/4wk01YMPF8Qsh2oxL1dcRqmkJgEyS/ayBLbJ3lyO
	2UzBeTizOQbLNDFkI8fVskkwbcmUklABNanAfTfT/QX1waMsIUan3bH6q8/MdAgdZv1YoLoSu+H
	o
X-Google-Smtp-Source: AGHT+IH0LcjYx+aEuc0oDfHapt2lkKd4+JT9s/wqOVAcCMosCzuSAIkK0yHnfTo1EzuGmanEP66ulg==
X-Received: by 2002:a2e:300d:0:b0:2d2:39fa:822c with SMTP id w13-20020a2e300d000000b002d239fa822cmr6653432ljw.35.1708592811460;
        Thu, 22 Feb 2024 01:06:51 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] x86/hpet: use an atomic add instead of a cmpxchg loop
Date: Thu, 22 Feb 2024 10:05:30 +0100
Message-ID: <20240222090530.62530-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222090530.62530-1-roger.pau@citrix.com>
References: <20240222090530.62530-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The usage of a cmpxchg loop in hpet_get_channel() is unnecessary, as the same
can be achieved with an atomic increment, which is both simpler to read, and
avoid any need for a loop.

Note there can be a small divergence in the channel returned if next_channel
overflows, but returned channel will always be in the [0, num_hpets_used)
range, and that's fine for the purpose of balancing HPET channels across CPUs.
This is also theoretical, as there's no system currently with 2^32 CPUs (as
long as next_channel is 32bit width).

Signed-of-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hpet.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index d982b0f6b2c9..4777dc859d96 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -458,11 +458,7 @@ static struct hpet_event_channel *hpet_get_channel(unsigned int cpu)
     if ( num_hpets_used >= nr_cpu_ids )
         return &hpet_events[cpu];
 
-    do {
-        next = next_channel;
-        if ( (i = next + 1) == num_hpets_used )
-            i = 0;
-    } while ( cmpxchg(&next_channel, next, i) != next );
+    next = arch_fetch_and_add(&next_channel, 1) % num_hpets_used;
 
     /* try unused channel first */
     for ( i = next; i < next + num_hpets_used; i++ )
-- 
2.43.0


