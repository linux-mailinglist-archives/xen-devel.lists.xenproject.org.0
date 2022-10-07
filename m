Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2E45F780E
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 14:40:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417959.662683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogmeO-0001Ow-IE; Fri, 07 Oct 2022 12:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417959.662683; Fri, 07 Oct 2022 12:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogmeO-0001M8-EU; Fri, 07 Oct 2022 12:40:24 +0000
Received: by outflank-mailman (input) for mailman id 417959;
 Fri, 07 Oct 2022 12:40:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4NbG=2I=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1ogmeM-0001M2-Ln
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 12:40:22 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33032f2f-463d-11ed-9377-c1cf23e5d27e;
 Fri, 07 Oct 2022 14:40:18 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so2540736wmb.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Oct 2022 05:40:21 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:19f:35f0:dde5:d55a:20f5:7ef5])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c511300b003b95ed78275sm2237208wms.20.2022.10.07.05.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 05:40:20 -0700 (PDT)
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
X-Inumbo-ID: 33032f2f-463d-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cgcFCITeu4HKAZxbFbtR7mI32hhOQAdbLcr9dKWtwcA=;
        b=YYi0KEyjP2tJXFjAELVgng47wKhF4qMeSoZGIpv7BNeRGdAJ6xsPpN/zx5uty6zQR6
         i8fQhg26lG42Jok9XfcWjWygxf2lUykKnA1hGJeOQa7ODxCyNldzu52BKvdlIGn0uuMd
         8lyE7EmQjDYi2347mooqZkiE7NC82UrdncaB5SFDGuVmRT8d3o4eMI5/Unww9LpB4ezz
         Uo+RKrUMYvru9rBuDm6OV24c9iQaiKPXL7Yn5jhggyZrknk8vFGrsQFK1ahH0PlSgePv
         IZ7AezmCIjKtfW0wbprB3u0dqQYr4uMXv+7q/S/my0nzytwqv0sKVnQsdH6k/8om6nuv
         KKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cgcFCITeu4HKAZxbFbtR7mI32hhOQAdbLcr9dKWtwcA=;
        b=lPMZFTD1l3R4pAHjgHBeTZLN/0jPWbzoMe2QMrPAGUfuuOBpt6O2b2zL6mLbVD8CQL
         709l9gn9jo1UFfHxYFeSU2GV9y+a1HVcnPLFxl3qzVsJErVF+O98y1pYjmVRm5bE/VF9
         QSE+5s5o2Ki2g/1ym/5anPFV/B+6kw1OKKvIFmHnrgyCgFjll8XtKcLbFJ7ZiJUJn+k4
         6RGUTlWpaKJzHvbhyzu/YmN5kvXXbLUjp/YFbg4ICsUwCESWUFuwuFj4oN/kePmxgOGi
         r1qS8nX2LWP6zKN/2nl5agF2uZCSZ7HaaAJwa/cDEBJAoRPCDqZ70hiAsutys09sgzgO
         EirQ==
X-Gm-Message-State: ACrzQf0USTBauezviA2Uhvlw0BM5IxBXwpclNKThPFlI5DIjsXR4TSC1
	LyBb1YoH1LIyIv5mapYc2jWli8ixcckZqQ==
X-Google-Smtp-Source: AMsMyM6JmfzfMWZSshH3hNDBr6rqDutJGMinObXg5Xmy5/HunJIhEcusYByL2jMtapaPcMZZQx/IWw==
X-Received: by 2002:a05:600c:154a:b0:3b4:c9ec:41df with SMTP id f10-20020a05600c154a00b003b4c9ec41dfmr9783583wmg.109.1665146420547;
        Fri, 07 Oct 2022 05:40:20 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
X-Google-Original-From: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
To: xen-devel@lists.xenproject.org
Cc: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [RFC PATCH v2 0/2] Add a new acquire resource to query vcpu statistics
Date: Fri,  7 Oct 2022 14:39:52 +0200
Message-Id: <cover.1665138677.git.matias.vara@vates.fr>
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

Changes in v2:
- rework to ensure that consumer fetches consistent data

Changes in v1:
- rework how the resource is allocated and released
- rework when the resource is allocated that happens only when the resource is
  requested 
- rework the structure shared between the tool and Xen to make it extensible to
  new counters and declare it in a public header

There are still the following questions:
   - resource shall be released when there are no more readers otherwise we keep
     updating it during a hot path
   - one frame can host up to 512 vcpus. Should I check to this limit when
     updating? Should it be possible to allocate more than one frame for vcpu
     counters? 

Matias Ezequiel Vara Larsen (2):
  xen/memory : Add a stats_table resource type
  tools/misc: Add xen-vcpus-stats tool

 tools/misc/Makefile          |  6 +++
 tools/misc/xen-vcpus-stats.c | 87 +++++++++++++++++++++++++++++++++
 xen/arch/x86/hvm/hvm.c       |  2 +
 xen/common/memory.c          | 94 ++++++++++++++++++++++++++++++++++++
 xen/common/sched/core.c      | 16 ++++++
 xen/include/public/memory.h  |  3 ++
 xen/include/public/vcpu.h    | 16 ++++++
 xen/include/xen/mm.h         |  2 +
 xen/include/xen/sched.h      |  5 ++
 9 files changed, 231 insertions(+)
 create mode 100644 tools/misc/xen-vcpus-stats.c

-- 
2.25.1


