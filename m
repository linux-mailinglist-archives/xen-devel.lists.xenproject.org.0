Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9DD59FB5E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 15:28:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392603.631062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQqQA-0006IJ-O5; Wed, 24 Aug 2022 13:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392603.631062; Wed, 24 Aug 2022 13:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQqQA-0006FP-Kt; Wed, 24 Aug 2022 13:27:50 +0000
Received: by outflank-mailman (input) for mailman id 392603;
 Wed, 24 Aug 2022 13:27:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GaRE=Y4=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1oQqQ9-0006FJ-19
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 13:27:49 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b556486-23b0-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 15:27:47 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id u14so20761529wrq.9
 for <xen-devel@lists.xenproject.org>; Wed, 24 Aug 2022 06:27:47 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:19f:35f0:dde5:d55a:20f5:7ef5])
 by smtp.gmail.com with ESMTPSA id
 j27-20020a05600c1c1b00b003a5ce167a68sm2220599wms.7.2022.08.24.06.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 06:27:46 -0700 (PDT)
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
X-Inumbo-ID: 8b556486-23b0-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=MQ76z2RkJ45qSARjKSsWQ3ZN8VnrkP5t6FlN2hWTOcg=;
        b=eqoxRd/h2+bOxnX4+2fWJ5WDzutXt089x+RPixlqVTrAazOAl8GuiTAlO6lLEr+qcp
         3iovfGilUdRnBdcSXYEz/TENP50yARXXPiM0bZ0992Sg9mBb4RhPkfUQ/7n9uKM22M4y
         h4heWWBMUJLpnEFQqpQ0Mu/tW0drmiNFHSTPNPrJRTrtHqKTBuE9GvkzKIdBU0t7Xrnk
         Pz/JBcb/3siDPaS/yFOmkFB3t21MxoOaY3+/qW4y110Yjiz9iiJ3Xptpb0Oh0e7beSyt
         w69qhQ9HUKkfluVZUvbvOZZvWQJo4KE87HbpW4q5WB8qq1mx0NKZG20s31//bXvgr9u6
         i16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=MQ76z2RkJ45qSARjKSsWQ3ZN8VnrkP5t6FlN2hWTOcg=;
        b=iC8qhoqpJibtEuE6RQvSHpEieVFH1T024ftOOyJhnTX1IHNGyiHjFEPkSfiaP6HknF
         AW4QF1KtXkz8+/UNInaD/4qRbx/0yM2f47xF9DqsXbNslu3lk6cO7UQu7kPWjZFEBth4
         N/bj+cfBj/XiOqMlMRddM2CI6gNuK/7tlbNAfMbz/vwVMjXhXDUZgfA84Gjgi3MK7r0a
         gTo66nTambcA76VlwlWaOjo8v3YSSB9yht3RMgHFvUtD857bIb93AiLzYcL7Hf3UynqF
         /COH/sRvEirVNagXX9WHcIY3YJH6xPboSVjR/H6t/jc5bVJCF80LkJ5xcrnDENUTJreE
         /Ojg==
X-Gm-Message-State: ACgBeo39j8OhcXJ3uH7S/VcasrhxV4Fepbaox7kVh49M06uqpxLz/jrS
	4tadlQRk5HUJLpRCKXWOLm0OAkLTwAN+oA==
X-Google-Smtp-Source: AA6agR7IIC710B5KcisxEyO8KWjM79v60u2k1cRF4yNhQNEy00nRs+jNS4mnnEwkTWHL1p2QRPcSGA==
X-Received: by 2002:adf:eb8e:0:b0:223:a1f6:26b2 with SMTP id t14-20020adfeb8e000000b00223a1f626b2mr16169237wrn.216.1661347667087;
        Wed, 24 Aug 2022 06:27:47 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
X-Google-Original-From: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
To: xen-devel@lists.xenproject.org
Cc: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [RFC PATCH v1 0/2] Add a new acquire resource to query vcpu statistics
Date: Wed, 24 Aug 2022 15:27:29 +0200
Message-Id: <cover.1661330065.git.matias.vara@vates.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello all,

The purpose of this RFC is to get feedback about a new acquire resource that
exposes vcpu statistics for a given domain. The current mechanism to get those
statistics is by querying the hypervisor. This mechanism relies on a hypercall
and holds the domctl spinlock during its execution. When a pv tool like xcp-rrdd
periodically samples these counters, it ends up affecting other paths that share
that spinlock. By using acquire resources, the pv tool only requires a few
hypercalls to set the shared memory region and samples are got without issuing
any other hypercall. The original idea has been suggested by Andrew Cooper to
which I have been discussing about how to implement the current PoC. You can
find the RFC patch series at [1]. The series is rebased on top of stable-4.15.

I am currently a bit blocked on 1) what to expose and 2) how to expose it. For
1), I decided to expose what xcp-rrdd is querying, e.g., XEN_DOMCTL_getvcpuinfo.
More precisely, xcp-rrd gets runstate.time[RUNSTATE_running]. This is a uint64_t
counter. However, the time spent in other states may be interesting too.
Regarding 2), I am not sure if simply using an array of uint64_t is enough or if
a different interface should be exposed. The remaining question is when to get
new values. For the moment, I am updating this counter during
vcpu_runstate_change().

The current series includes a simple pv tool that shows how this new interface is
used. This tool maps the counter and periodically samples it.

Any feedback/help would be appreciated.

Thanks, Matias.

[1] https://github.com/MatiasVara/xen/tree/feature_stats

Changes in v1:
- rework how the resource is allocated and released
- rework when the resource is allocated that happens only when the resource is
  requested 
- rework the structure shared between the tool and Xen to make it extensible to
  new counters and declare it in a public header

There are still the following questions:
   - consumer may fetch inconsistency data
   - resource shall be released when there are no more readers otherwise we keep
     updating it during a hot path
   - one frame can host up to 512 vcpus. Should I check to this limit when
     updating? Should it be possible to allocate more than one frame for vcpu
     counters?  

Matias Ezequiel Vara Larsen (2):
  xen/memory : Add a stats_table resource type
  tools/misc: Add xen-vcpus-stats tool

 tools/misc/Makefile          |  6 +++
 tools/misc/xen-vcpus-stats.c | 76 +++++++++++++++++++++++++++++
 xen/arch/x86/hvm/hvm.c       |  2 +
 xen/common/memory.c          | 94 ++++++++++++++++++++++++++++++++++++
 xen/common/sched/core.c      |  7 +++
 xen/include/public/memory.h  |  3 ++
 xen/include/public/vcpu.h    | 10 ++++
 xen/include/xen/mm.h         |  2 +
 xen/include/xen/sched.h      |  5 ++
 9 files changed, 205 insertions(+)
 create mode 100644 tools/misc/xen-vcpus-stats.c

-- 
2.25.1


