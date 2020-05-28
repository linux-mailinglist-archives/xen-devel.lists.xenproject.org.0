Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A69BD1E6DA2
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 23:30:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeQ5a-0000S6-NW; Thu, 28 May 2020 21:29:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LyZP=7K=gmail.com=raistlin.df@srs-us1.protection.inumbo.net>)
 id 1jeQ5Z-0000S1-Bo
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 21:29:21 +0000
X-Inumbo-ID: 4a5e06f8-a12a-11ea-a83e-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a5e06f8-a12a-11ea-a83e-12813bfff9fa;
 Thu, 28 May 2020 21:29:20 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id l10so879226wrr.10
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2020 14:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:user-agent
 :mime-version:content-transfer-encoding;
 bh=SdCpL4YJ7rILVK5R+t0Bn3JMeoXxs9gIE9CZ+hqvM/w=;
 b=SeLjkQwfxtmmoYMh1CfAw8J86FvIRnZAvmR8/nuRQMxrZRurvJaT2Nrq0dAm7R6734
 W9U74QpwV50Cs/lSzws1kyAccSZyJ7CKzlCl6xSdloIAxkTwTQIHyVzNhjRIg4dOMMsd
 l5bblpqscZiWRbjRJqhQbvRC1GWm7LMk57WxWcb8onSIA3glfi0GL5dsm3vzGhbdGEAG
 GUqCYTni/4EaS8t9QGEfPXlqcUt4AKhAxdhmWhbjMNDEpeDhdWekkMlbP2y6k+irh+Vj
 XLGBOtP7tL4FP9TeS813b0LNSXbLb+ukm1iiRkI+i8h0xKfmD71dGA4jJxMadBu5ziRS
 HKZg==
X-Gm-Message-State: AOAM532Wyi1VZcsa9CKGtxkLWKveslo7VhD9tvrMB2az0kw3xJfX2T6F
 tDfBZJhtpN03YSNJsJ/icZ8=
X-Google-Smtp-Source: ABdhPJyCoIGMmcnF8v9uTYF7aqYO01PCHMgMjnnglVHCOHxL4uvLI8XnpKjQzs2Q2RcO05nmYi8stg==
X-Received: by 2002:adf:a51b:: with SMTP id i27mr5271422wrb.173.1590701359139; 
 Thu, 28 May 2020 14:29:19 -0700 (PDT)
Received: from [192.168.0.36] (87.78.186.89.cust.ip.kpnqwest.it.
 [89.186.78.87])
 by smtp.gmail.com with ESMTPSA id k12sm5324286wrn.42.2020.05.28.14.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 14:29:18 -0700 (PDT)
Subject: [PATCH v2 0/7] xen: credit2: limit the number of CPUs per runqueue
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 28 May 2020 23:29:17 +0200
Message-ID: <159070133878.12060.13318432301910522647.stgit@Palanthas>
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello!

Here's v2 of this series... a bit late, but technically still in time
for code-freeze, although I understand this is quite tight! :-P

Anyway, In Credit2, the CPUs are assigned to runqueues according to the
host topology. For instance, if we want per-socket runqueues (which is
the default), the CPUs that are in the same socket will end up in the
same runqueue.

This is generally good for scalability, at least until the number of
CPUs that end up in the same runqueue is not too high. In fact, all this
CPUs will compete for the same spinlock, for making scheduling decisions
and manipulating the scheduler data structures. Therefore, if they are
too many, that can become a bottleneck.

This has not been an issue so far, but architectures with 128 CPUs per
socket are now available, and it is certainly unideal to have so many
CPUs in the same runqueue, competing for the same locks, etc.

Let's therefore set a cap to the total number of CPUs that can share a
runqueue. The value is set to 16, by default, but can be changed with
a boot command line parameter.

Note also that, if the host has hyperthreading (or equivalent), and we
are not using core-scheduling), additional care is taken to avoid splitting
CPUs that are hyperthread siblings among different runqueues.

In v2, in addition to trying to address the review comments, I've added
the logic for doing a full rebalance of the scheduler runqueues, while
the system is running. This is actually something that itself came up
during review of v1, when we realized that we do not only wanted a cap,
we also wanted some balancing, and if you want real balancing, you have
to be able to re-arrange the runqueue layout, dynamically.

It took a while because I, although I had something that looked a lot
like the final solution implemented in this patch, could not see how to
solve cleanly and effectively the issue of having the vCPUs in the
runqueues, while trying to re-balance them. It was while talking with
Juergen that we figured out that we can actually pause the domains,
which I had not thought at... So, once again, Juergen, thanks! :-)

I have done the most of the stress testing with core-scheduling
disabled, and it has survived to anything I threw at it, but of course
the more testing the better, and I will be able to actually do more of
it, in the coming days.

IAC, I have also verified that at least a few core-scheduling enabled
configs also work.

There are git branches here:
 git://xenbits.xen.org/people/dariof/xen.git  sched/credit2-max-cpus-runqueue-v2
 http://xenbits.xen.org/gitweb/?p=people/dariof/xen.git;a=shortlog;h=refs/heads/sched/credit2-max-cpus-runqueue-v2

 https://github.com/dfaggioli/xen/tree/sched/credit2-max-cpus-runqueue-v2

While v1 is at the following link:
 https://lore.kernel.org/xen-devel/158818022727.24327.14309662489731832234.stgit@Palanthas/T/#m1e885a0f0a1feef83790ac179ab66512201cb770

Thanks and Regards
---
Dario Faggioli (7):
      xen: credit2: factor cpu to runqueue matching in a function
      xen: credit2: factor runqueue initialization in its own function.
      xen: cpupool: add a back-pointer from a scheduler to its pool
      xen: credit2: limit the max number of CPUs in a runqueue
      xen: credit2: compute cpus per-runqueue more dynamically.
      cpupool: create an the 'cpupool sync' infrastructure
      xen: credit2: rebalance the number of CPUs in the scheduler runqueues

 docs/misc/xen-command-line.pandoc |   14 +
 xen/common/sched/cpupool.c        |   53 ++++
 xen/common/sched/credit2.c        |  437 ++++++++++++++++++++++++++++++++++---
 xen/common/sched/private.h        |    7 +
 xen/include/asm-arm/cpufeature.h  |    5 
 xen/include/asm-x86/processor.h   |    5 
 xen/include/xen/sched.h           |    1 
 7 files changed, 491 insertions(+), 31 deletions(-)

--
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

