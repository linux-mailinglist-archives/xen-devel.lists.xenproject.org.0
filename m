Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 198137DD169
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 17:21:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625951.975768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxrUa-0001Ol-1V; Tue, 31 Oct 2023 16:21:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625951.975768; Tue, 31 Oct 2023 16:21:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxrUZ-0001Ly-UA; Tue, 31 Oct 2023 16:21:23 +0000
Received: by outflank-mailman (input) for mailman id 625951;
 Tue, 31 Oct 2023 16:21:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L368=GN=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1qxrUY-0001Lp-37
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 16:21:22 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86cd4364-7809-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 17:21:21 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-32dc918d454so3723779f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 31 Oct 2023 09:21:21 -0700 (PDT)
Received: from z0rr0-Latitude-7490 ([2a01:e0a:257:8c60:c550:f26a:2ce9:e5df])
 by smtp.gmail.com with ESMTPSA id
 n12-20020adfe78c000000b0032f7eaa6e43sm1827110wrm.79.2023.10.31.09.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 09:21:18 -0700 (PDT)
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
X-Inumbo-ID: 86cd4364-7809-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698769280; x=1699374080; darn=lists.xenproject.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PeQFRaFd4HTF0L7uxb3xMd2sfS+FTZ/ZL7BQ1f0mWE4=;
        b=aerPY4QTrp+4KA8WbhJxGeCZLgV7sKnRm0F9CP6uXCviSJDIX7WaCnhjjuSBEyPb1+
         t6rxyE2ZD/c8jlOc2zQpV5+sDAtJl0chDSdjwTQ8xds8BtClW6joN/7zkZ7Se2vXVVHq
         hSa28tVKmqnEKV7EVtSKrYxqtUsui3vfw4oCu2YOKUXA9sMalN5ER8LS3+/5Ii8e194z
         YmXkuOMj/+BpaCFmoHh9nhx9DGm8rdjQVjYlVyKaxzg1WwlGTJnorGISh3vLlVcQBr+B
         0ng4Wb14YTTbbJNS2BXOxK4M6LaasWYrSZkF8zuGrDQAQj4e6YsN3RkURSuN853LCLjL
         +PqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698769280; x=1699374080;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PeQFRaFd4HTF0L7uxb3xMd2sfS+FTZ/ZL7BQ1f0mWE4=;
        b=Zh6+Rqxhl0SdBe1Bmezg/5aYIC+RAlnHEgT3g2FCZQiHDehIfBpo4zkt6wMBHOwM3b
         KANSFwLO5U3Kka4OQ7gKa7FuMf27rOUINX2smPDpJX72SXzRUEXlcmJWn5yJcB6dyxMy
         ncoun8P1Lf4mh7cZedWI5Q3d/sI0LlgsLVjgSahxDhFlBp6jLTUGCHFo/mHa3QNhzBEd
         lYdKzRDUms5dkx0elQ7W9rDfNkpOdD8+BhyEMP5/oLzJddeMFyORabjjt/bjXMmbeZD9
         lfbUHXHpYOTwP8LXb5Jv9ppy8NslN1VWYhk5KVuI8G9eMROiQWg7ailOFBRNVhYzfpE7
         R1tw==
X-Gm-Message-State: AOJu0Yw5Tx4elhVFV+k2ubK6SsMT0dJvHF6hGSRDwzO7x5nYFKPc6o9p
	/yqSqDfquMbhqmAkG7VFa1PT8iH/xiELveqh
X-Google-Smtp-Source: AGHT+IHXb72XDpM1zrO4AkR2LUpchUEahZFWle6AcXUYC+dkKu7QA7+3RDhkbDGYIVEWs9CTY7zHMA==
X-Received: by 2002:a5d:6c61:0:b0:32f:7d50:62ef with SMTP id r1-20020a5d6c61000000b0032f7d5062efmr7815411wrz.13.1698769279441;
        Tue, 31 Oct 2023 09:21:19 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
X-Google-Original-From: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
Date: Tue, 31 Oct 2023 17:21:16 +0100
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Matias Vara <matiasevara@gmail.com>
Subject: [RFC PATCH v3 0/3] Add a new acquire resource to query vcpu
 statistics
Message-ID: <cover.1698589351.git.matias.vara@vates.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello all and apologies for the delay in sending v3,

the purpose of this RFC is to get feedback about a new acquire resource that
exposes vcpu statistics for a given domain. The current mechanism to get those
statistics is by querying the hypervisor. This mechanism relies on a hypercall
and holds the domctl spinlock during its execution. When a pv tool like xcp-rrdd
periodically samples these counters, it ends up affecting other paths that share
that spinlock. By using acquire resources, the pv tool only requires a few
hypercalls to set the shared memory region and samples are got without issuing
any other hypercall. The original idea has been suggested by Andrew Cooper to
which I have been discussing about how to implement the current PoC. You can
find the RFC patch series at [1]. The series is rebased on top of stable-4.16.

The current series includes a simple pv tool that shows how this new interface is
used. This tool maps the counter and periodically samples it.

Any feedback/help would be appreciated.

Thanks, Matias.

[1] https://github.com/MatiasVara/xen/commits/feature_vcpu_stats

Changes in v3:
- use memory layout discussed at
  https://lists.xenproject.org/archives/html/xen-devel/2023-03/msg00383.html
 
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

Matias Ezequiel Vara Larsen (3):
  xen/memory : Add a stats_table resource type
  x86/mm: Do not validate/devalidate PGT_none type
  tools/misc: Add xen-vcpus-stats tool

 tools/misc/Makefile          |   6 ++
 tools/misc/xen-vcpus-stats.c | 132 +++++++++++++++++++++++++++
 xen/arch/x86/mm.c            |   3 +-
 xen/common/domain.c          |   1 +
 xen/common/memory.c          | 167 +++++++++++++++++++++++++++++++++++
 xen/common/sched/core.c      |  20 +++++
 xen/include/public/memory.h  |   3 +
 xen/include/public/vcpu.h    |  27 ++++++
 xen/include/xen/mm.h         |   2 +
 xen/include/xen/sched.h      |   5 ++
 10 files changed, 365 insertions(+), 1 deletion(-)
 create mode 100644 tools/misc/xen-vcpus-stats.c

-- 
2.34.1


