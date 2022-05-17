Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EECFE52A4EB
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 16:33:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330963.554386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqyGV-0007ud-8s; Tue, 17 May 2022 14:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330963.554386; Tue, 17 May 2022 14:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqyGV-0007sb-69; Tue, 17 May 2022 14:33:35 +0000
Received: by outflank-mailman (input) for mailman id 330963;
 Tue, 17 May 2022 14:33:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NT3h=VZ=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1nqyGT-0007sV-UE
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 14:33:33 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53e9b9a6-d5ee-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 16:33:33 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 p5-20020a1c2905000000b003970dd5404dso1390199wmp.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 May 2022 07:33:32 -0700 (PDT)
Received: from horizon.home (amontsouris-681-1-37-131.w90-87.abo.wanadoo.fr.
 [90.87.156.131]) by smtp.gmail.com with ESMTPSA id
 f21-20020a7bcd15000000b003942a244f30sm2544884wmj.9.2022.05.17.07.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 07:33:31 -0700 (PDT)
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
X-Inumbo-ID: 53e9b9a6-d5ee-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+9HG/dVfNJyu74bNMj0VTJFNoJxjlcEa2s8utBre5yc=;
        b=EsoYUsgrzUA7JVzblfHrb6MVajGlv1hB8CqNt0AJeWL70d5C5vsPQxlqhKLoFf+zZb
         p4cOU4siA7nudo6jXLjrN8RwAzujnVIF5fiCIs07bKNigSuJ59tyK4gZti3MHtBZkGvk
         hEYHq3w+FBdD7miA6BCVIlk/cKZsRVhzQQYIcAnnPKVsblCRAoyqMImXjqDSV+mcL+8G
         7GwygC8YM2m+8SXrrjDFNM1q+7OBzzDtmPbkYvqbzLmyucbbDNQsekL/iWR9uOtn6Y3g
         rxTy7gFz+fv8G4QliIqfDqIUn7wRLOlPl/gVB0QWXQV9atLQLBCcGezRom35O8i+ZhgU
         XrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+9HG/dVfNJyu74bNMj0VTJFNoJxjlcEa2s8utBre5yc=;
        b=EH2T7xqAM76MHo8QEynzfSKirNekQcH8e/WzIjvnFNyZvxO1xLHljio2bM5rQcuuol
         63JrfAu73XS/1Gj0Da4uu5QcqRZSTomkmIz5Eque5XbTppvzTYwkBBf5iTRcF8TG/413
         IrafLuyYQxZ/HAd5JxakH9Z3JQz8c0qsyUgrB7xrhJXjsft41CPNJvP76hT1iofh8wDz
         izTlb9DeZGZB2pPT68tX9MJrO9W+uVFWI5rEFcCY4KOsNFYV93toE2FB+HZ+eeue6CjM
         UFkuMj8CyXWGUciqbCCp+ypKVTIOMgNOR22m0su1pwKbk8KlMs34Z063EmIYDbfvTMVI
         RO8Q==
X-Gm-Message-State: AOAM533kD5Un8/nFwQ6uJqJgoDixttCidikUzQDLgWHJSIxCyJ0mgoLp
	lj0zRwEMAQFm3OVsq3dpAEkjP+linNzbAw==
X-Google-Smtp-Source: ABdhPJxoGG1bevkrKQ/7AlhU14PD8kSacM//BFpo2rZxIkUvoNwA3f/nLYVxCg4Hsyu1qzwUzQoAfA==
X-Received: by 2002:a05:600c:214c:b0:394:2dfe:2754 with SMTP id v12-20020a05600c214c00b003942dfe2754mr21812005wml.135.1652798012140;
        Tue, 17 May 2022 07:33:32 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
X-Google-Original-From: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
To: xen-devel@lists.xenproject.org
Cc: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [RFC PATCH 0/2] Add a new acquire resource to query vcpu statistics
Date: Tue, 17 May 2022 16:33:13 +0200
Message-Id: <cover.1652797713.git.matias.vara@vates.fr>
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

Matias Ezequiel Vara Larsen (2):
  xen/memory : Add stats_table resource type
  tools/misc: Add xen-stats tool

 tools/misc/Makefile         |  5 +++
 tools/misc/xen-stats.c      | 83 +++++++++++++++++++++++++++++++++++++
 xen/common/domain.c         | 42 +++++++++++++++++++
 xen/common/memory.c         | 29 +++++++++++++
 xen/common/sched/core.c     |  5 +++
 xen/include/public/memory.h |  1 +
 xen/include/xen/sched.h     |  5 +++
 7 files changed, 170 insertions(+)
 create mode 100644 tools/misc/xen-stats.c

-- 
2.25.1


