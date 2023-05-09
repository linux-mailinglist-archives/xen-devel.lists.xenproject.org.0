Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB266FCABD
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 18:07:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532308.828443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwPs0-0000gh-1w; Tue, 09 May 2023 16:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532308.828443; Tue, 09 May 2023 16:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwPrz-0000du-Uy; Tue, 09 May 2023 16:07:19 +0000
Received: by outflank-mailman (input) for mailman id 532308;
 Tue, 09 May 2023 16:07:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kELI=A6=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1pwPry-0000D0-Pl
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 16:07:18 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 921324eb-ee83-11ed-b229-6b7b168915f2;
 Tue, 09 May 2023 18:07:17 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-30644c18072so4012230f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 May 2023 09:07:17 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 z8-20020adfec88000000b003062675d4c9sm14721479wrn.39.2023.05.09.09.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 09:07:15 -0700 (PDT)
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
X-Inumbo-ID: 921324eb-ee83-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1683648436; x=1686240436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sUa4EW5NKYqGX/lgWMn9gXNm9+m7nSTsffZhyMEoWAk=;
        b=lCNUFKmugnetXQ9tS/KeJQi9upvmtzrKcNgDBDdCsWi3DYWtaV7eIb09I/okdh7A1i
         3nfenmySSjIcWXPakDN7yYO1L9rJul4nW1nW87PqaD8rbn8pMSWc5NeLnkg1zdQqA2y2
         drOVcVYpCk7RJVMkV3CWF+uw5Zc3MnjncotCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683648436; x=1686240436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUa4EW5NKYqGX/lgWMn9gXNm9+m7nSTsffZhyMEoWAk=;
        b=b8AOpMpB2KvzbVjF8Y6jmD/NF55qzXcq5jR9Qe3bWBj2OY9PsvhnJ33yS83/r0O5tM
         seH+pME9qrWwvKbgM1hgGRHU3hBw5K08WfnwB9iKE87RoeMK4Xd1MEywA57nRSX/NEoD
         BclFX0YlNTp7cKpAroGMD2M0jLAN1EmOU3CB1q6IzHpS7qtn+3/XD8DjqosEI5n93jVh
         sKJvi31fNtBrlvHUvxTuJakshP9VIE4NB0F3QD8xPWJj+ildi0weivUYHUtvLlt7r556
         mvy/pcxV0tDtoH1Iz/pcH9rRC+nvSWDHBcgIP1VzsMbEsG7ndPukYgPi5YHc4eL8F7vx
         lmhQ==
X-Gm-Message-State: AC+VfDz265lzCzpcmzVxaPd6aMKIcLhnS8xm+gIzN89xWgMD2sfoNoiY
	FCP1fFYqfDMt88Ftu0Lk+K9Q/rX1tFMQcvTjWdQ=
X-Google-Smtp-Source: ACHHUZ6ZBZnw9zD8944MY0/yq1AzxwPIE317KoKQqFZvNv5cp+DBNexO3LZgDmu9NwE3nStixKL8Mw==
X-Received: by 2002:adf:e605:0:b0:304:6fef:f375 with SMTP id p5-20020adfe605000000b003046feff375mr10072813wrm.70.1683648436647;
        Tue, 09 May 2023 09:07:16 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Tim Deegan <tim@xen.org>,
	Christian Lindig <christian.lindig@citrix.com>
Subject: [PATCH v4 0/3] Rationalize usage of xc_domain_getinfo{,list}()
Date: Tue,  9 May 2023 17:07:09 +0100
Message-Id: <20230509160712.11685-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first 4 patches of v2 already made it to staging. v4 includes a fix
so libxl preserves its previous error handling behaviour and a style change

Original cover letter:

xc_domain_getinfo() returns the list of domains with domid >= first_domid.
It does so by repeatedly invoking XEN_DOMCTL_getdomaininfo, which leads to
unintuitive behaviour (asking for domid=1 might succeed returning domid=2).
Furthermore, N hypercalls are required whereas the equivalent functionality
can be achieved using with XEN_SYSCTL_getdomaininfo.

Ideally, we want a DOMCTL interface that operates over a single precisely
specified domain and a SYSCTL interface that can be used for bulk queries.

All callers of xc_domain_getinfo() that are better off using SYSCTL are
migrated to use that instead. That includes callers performing domain
discovery and those requesting info for more than 1 domain per hypercall.

A new xc_domain_getinfo_single() is introduced with stricter semantics than
xc_domain_getinfo() (failing if domid isn't found) to migrate the rest to.

With no callers left the xc_dominfo_t structure and the xc_domain_getinfo()
call itself can be cleanly removed, and the DOMCTL interface simplified to
only use its fastpath.

With the DOMCTL ammended, the new xc_domain_getinfo_single() drops its
stricter check, becoming a simple wrapper to invoke the hypercall itself.

Alejandro Vallejo (3):
  tools: Modify single-domid callers of xc_domain_getinfolist()
  tools: Use new xc function for some xc_domain_getinfo() calls
  domctl: Modify XEN_DOMCTL_getdomaininfo to fail if domid is not found

 tools/console/client/main.c             |  7 +--
 tools/debugger/kdd/kdd-xen.c            |  5 +-
 tools/include/xenctrl.h                 | 43 -------------
 tools/libs/ctrl/xc_domain.c             | 82 ++-----------------------
 tools/libs/ctrl/xc_pagetab.c            |  7 +--
 tools/libs/ctrl/xc_private.c            |  9 +--
 tools/libs/ctrl/xc_private.h            |  7 ++-
 tools/libs/guest/xg_core.c              | 23 +++----
 tools/libs/guest/xg_core.h              |  6 +-
 tools/libs/guest/xg_core_arm.c          | 10 +--
 tools/libs/guest/xg_core_x86.c          | 18 +++---
 tools/libs/guest/xg_cpuid_x86.c         | 40 ++++++------
 tools/libs/guest/xg_dom_boot.c          | 16 ++---
 tools/libs/guest/xg_domain.c            |  8 +--
 tools/libs/guest/xg_offline_page.c      | 12 ++--
 tools/libs/guest/xg_private.h           |  1 +
 tools/libs/guest/xg_resume.c            | 20 +++---
 tools/libs/guest/xg_sr_common.h         |  2 +-
 tools/libs/guest/xg_sr_restore.c        | 17 ++---
 tools/libs/guest/xg_sr_restore_x86_pv.c |  2 +-
 tools/libs/guest/xg_sr_save.c           | 27 ++++----
 tools/libs/guest/xg_sr_save_x86_pv.c    |  6 +-
 tools/libs/light/libxl_dom.c            | 17 ++---
 tools/libs/light/libxl_dom_suspend.c    |  7 +--
 tools/libs/light/libxl_domain.c         | 18 +++---
 tools/libs/light/libxl_mem.c            |  4 +-
 tools/libs/light/libxl_sched.c          | 30 ++++-----
 tools/libs/light/libxl_x86_acpi.c       |  6 +-
 tools/misc/xen-hvmcrash.c               |  6 +-
 tools/misc/xen-lowmemd.c                |  6 +-
 tools/misc/xen-mfndump.c                | 22 +++----
 tools/misc/xen-vmtrace.c                |  6 +-
 tools/ocaml/libs/xc/xenctrl_stubs.c     |  6 +-
 tools/vchan/vchan-socket-proxy.c        |  6 +-
 tools/xenpaging/xenpaging.c             | 10 +--
 tools/xenstore/xenstored_domain.c       | 15 +++--
 tools/xentrace/xenctx.c                 |  8 +--
 xen/common/domctl.c                     | 32 +---------
 38 files changed, 190 insertions(+), 377 deletions(-)

-- 
2.34.1


