Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D588F1E6DA1
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 23:30:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeQ5u-0000Un-LH; Thu, 28 May 2020 21:29:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LyZP=7K=gmail.com=raistlin.df@srs-us1.protection.inumbo.net>)
 id 1jeQ5s-0000UQ-Ob
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 21:29:40 +0000
X-Inumbo-ID: 560df526-a12a-11ea-a83e-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 560df526-a12a-11ea-a83e-12813bfff9fa;
 Thu, 28 May 2020 21:29:39 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l11so994528wru.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2020 14:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=wP+bknS/YQFF/cic7V0+7p/sNGGep29LYMTamuMpA6Y=;
 b=GiXcJy/GYhrFuVn2NGUdbeREpOAD9M8S3lmGVAwWC30MuNPeG2epOw+3z3pQ92NAiq
 9AuqQrnHUXO4b8cS6BzdS70R5ScN5Pox2wMCfd+OBxbz2oM7761vPGr35r3Dxb5dlzET
 folZ9RzY4kCyvIpIqnuUde1cauSse3FKRPvbPzzplrRr+rMbXtOAF7rSusg6llTPj0Nn
 hIBZZUc16dBY1et0LuHrjoMrLrt4uAhcMjLfsVhUSLAhx0J0T5C5wHbVeYwVBqMQdpqM
 lkd3Okf0WcQtzRFvU3G+IHr4PCkqwCy2CyC7RlBGT7Twa/pLRBgSVZz3QBk/GrP87sFK
 sKCA==
X-Gm-Message-State: AOAM5319ij2fFo+I820nWKkCY4meFAIxLgssFVkAZxI0HM2qIHm6TolS
 bPDo54WckDQJHPq9ok6d58fSrQap
X-Google-Smtp-Source: ABdhPJxGVTpK4BVv64hCPnZesAphm6BdyzNlNg637ASAcJ5f6KCUWPUlc2RuiWxUibxdp0d1o5JJcw==
X-Received: by 2002:adf:e648:: with SMTP id b8mr5534153wrn.386.1590701378810; 
 Thu, 28 May 2020 14:29:38 -0700 (PDT)
Received: from [192.168.0.36] (87.78.186.89.cust.ip.kpnqwest.it.
 [89.186.78.87])
 by smtp.gmail.com with ESMTPSA id f128sm7844905wme.1.2020.05.28.14.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 14:29:38 -0700 (PDT)
Subject: [PATCH v2 3/7] xen: cpupool: add a back-pointer from a scheduler to
 its pool
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 28 May 2020 23:29:37 +0200
Message-ID: <159070137738.12060.10928971799525755388.stgit@Palanthas>
In-Reply-To: <159070133878.12060.13318432301910522647.stgit@Palanthas>
References: <159070133878.12060.13318432301910522647.stgit@Palanthas>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

If we need to know within which pool a particular scheduler
is working, we can do that by querying the cpupool pointer
of any of the sched_resource-s (i.e., ~ any of the CPUs)
assigned to the scheduler itself.

Basically, we pick any sched_resource that we know uses that
scheduler, and we check its *cpupool pointer. If we really
know that the resource uses the scheduler, this is fine, as
it also means the resource is inside the pool we are
looking for.

But, of course, we can do that for a pool/scheduler that has
not any been given any sched_resource yet (or if we do not
know whether or not it has any sched_resource).

To overcome such limitation, add a back pointer from the
scheduler, to its own pool.

Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
Cc: Juergen Gross <jgross@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>
---
Changes from v1:
* new patch
---
 xen/common/sched/cpupool.c |    1 +
 xen/common/sched/private.h |    1 +
 2 files changed, 2 insertions(+)

diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index 0664f7fa3d..7ea641ca26 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -287,6 +287,7 @@ static struct cpupool *cpupool_create(
         if ( c->sched == NULL )
             goto err;
     }
+    c->sched->cpupool = c;
     c->gran = opt_sched_granularity;
 
     *q = c;
diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index b9a5b4c01c..df50976eb2 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -275,6 +275,7 @@ struct scheduler {
     char *opt_name;         /* option name for this scheduler    */
     unsigned int sched_id;  /* ID for this scheduler             */
     void *sched_data;       /* global data pointer               */
+    struct cpupool *cpupool;/* points to this scheduler's pool   */
 
     int          (*global_init)    (void);
 


