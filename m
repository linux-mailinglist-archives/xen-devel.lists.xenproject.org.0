Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2660A3691B
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2025 00:37:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889181.1298381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj5EY-0002oc-3F; Fri, 14 Feb 2025 23:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889181.1298381; Fri, 14 Feb 2025 23:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj5EY-0002mw-0Q; Fri, 14 Feb 2025 23:36:34 +0000
Received: by outflank-mailman (input) for mailman id 889181;
 Fri, 14 Feb 2025 23:36:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5vTB=VF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tj5EW-0002mq-TH
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 23:36:32 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 846f34b0-eb2c-11ef-9896-31a8f345e629;
 Sat, 15 Feb 2025 00:36:30 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38de17a5fc9so1359429f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2025 15:36:30 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b4335sm5932369f8f.15.2025.02.14.15.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 15:36:28 -0800 (PST)
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
X-Inumbo-ID: 846f34b0-eb2c-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739576190; x=1740180990; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYgDDL+7h3Ynk231V7nkSwhljdJvwi6AzXDua/Ub3mU=;
        b=NGU9jpHUCOpMKZ2mSRJLFxjaY+ZOQ4bv4Ha9fsiEj5NVJGFa+W9ci2w2aW2UorWSQU
         a79Wr4+wMQ2YqDJajNK0CF31oZoi/BL2BUY2vcWor8fX8hoDxadIZsCiip21osvAZXfJ
         m0ikb7BVnyVytftK45BSRDaOm4NfHs+dCZuhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739576190; x=1740180990;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xYgDDL+7h3Ynk231V7nkSwhljdJvwi6AzXDua/Ub3mU=;
        b=jFemn9CezG7LtcqGznQzf0TXcmTHy77l4qP1iX8zBsQi3BukW/kIJBwYUy+ovxTYqs
         JveTxv0GAcUgg1qAYAfy8RlMGB0t9RMEDhPejq19hpFXn5BVfkz0FO5JcNHrxXvMHt3U
         506Kk5QZyFfyf5/NIeQIM/SaV0XijtKWINvtrahTSxb6ynj4HqBcUaCK/6ZKCFwTA2R9
         auL7Wm4rcbyfiEsnMkfz7v++gicbwdM2A62+T06MH8Ke9DZW8LqBhlrnKKxctkUbHniW
         c3TCq2sz0HYp0yNWTqjxxpYbqua4mC3jWNxo1zPLaTkGXCg+Xb78nu4Qa2msF8CCHA6T
         TdMQ==
X-Gm-Message-State: AOJu0YxjNTCoQeTq1R50x9J9+mjcfqPf6UnGI0YMtGJ5Yr6pimRSoy0s
	RGKDn6oNQERIPi2f6AE1GBzj9W5YxVBMOx9fC7Qz+iL8hZHFd3n078dxEETnT7g01mpAniM1NE1
	v
X-Gm-Gg: ASbGnctnD3EBqSl/C4Pj9FS5Dp1SlhzUS5s8Yu7nRK8Vd4WODby1MGiIralsrRd1iZk
	9KkFgXPZeMLCS2TGyBugubjnq/9d9YHPE5C4WSX3vAeGw0Trx9XV14msANi7FY223hOQHsWTXKs
	FNiV1f6Bo3QZuwjFC5P4hTYZDOYQERMDjckfEghv++LntD7CrTvRZEtDiW/G581d3106r1avx0B
	WgK7aSJHdChu6TlOeveYY0eX560g7c4yuk7mkymulJnBHLDiG1RobMER8Z1UQ07hYMF1eyuD/VO
	E+XawQioKsmWnSx6Va0UJ9JTmM23/r6wXrav9Syd76zrD1Fv9uXZaRc=
X-Google-Smtp-Source: AGHT+IF/rjmICln15SmPK+zhuT0hNqgDXgrDGKlzAgw997LjbFj/UpcBsAsaKYJGwlUZV6i1GAdpqw==
X-Received: by 2002:a05:6000:4021:b0:38f:355b:13e9 with SMTP id ffacd0b85a97d-38f355b15b9mr327969f8f.15.1739576189724;
        Fri, 14 Feb 2025 15:36:29 -0800 (PST)
Message-ID: <9c2c6099-9399-4607-9533-4d2f6aa1afc8@citrix.com>
Date: Fri, 14 Feb 2025 23:36:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <gwd@xenproject.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: ARM32 UBSAN failure in credit2
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is nasty.

https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9137008215

When preprocessed, we get:

diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 0a83f237259f..6b8d3660240a 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -958,7 +958,28 @@ cpu_add_to_runqueue(const struct scheduler *ops,
unsigned int cpu)
     write_lock_irqsave(&prv->lock, flags);
 
     rqd_ins = &prv->rql;
+
+#if 0
     list_for_each_entry ( rqd, &prv->rql, rql )
+#else
+    for ( (rqd) = ({
+                typeof(((typeof(*(rqd)) *)((void*)0))->rql) *__mptr =
+                    ((&prv->rql)->next);
+                (typeof(*(rqd)) *)
+                    ((char *)__mptr -
+                     __builtin_offsetof(typeof(*(rqd)),rql) );
+            });
+          &(rqd)->rql != // <-- problem expression
+              (&prv->rql);
+          (rqd) = ({
+                  typeof(((typeof(*(rqd)) *)((void*)0))->rql) *__mptr =
+                      ((rqd)->rql.next);
+                  (typeof(*(rqd)) *)
+                      ((char *)__mptr -
+                       __builtin_offsetof(typeof(*(rqd)),rql) );
+              })
+        )
+#endif
     {
         /* Remember first unused queue index. */
         if ( !rqi_unused && rqd->id > rqi )


The alignment of csched2_runqueue_data is 8, while csched2_private is 4.

priv's list_head for rql is at +28 (+0x1c), and list_for_each_entry()
performs a buggily-typed container_of(), treating a csched2_private as
if it were csched2_runqueue_data.

It functions because it's only an address equality check, but it's also
why UBSAN objects.

This seems to fix the issue:

diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 6b8d3660240a..ab938942d75f 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -537,7 +537,8 @@ struct csched2_private {
     unsigned int ratelimit_us;         /* Rate limiting for this
scheduler   */
 
     unsigned int active_queues;        /* Number of active
runqueues         */
-    struct list_head rql;              /* List of
runqueues                  */
+    struct list_head rql               /* List of
runqueues                  */
+    __aligned(alignof(struct csched2_runqueue_data));
 
     cpumask_t initialized;             /* CPUs part of this
scheduler        */
     struct list_head sdom;             /* List of domains (for debug
key)    */

but it's obviously not a viable fix.  I can't help feeling that the bug
is really in the list macros.

~Andrew

