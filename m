Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACC96F4260
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 13:13:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528510.821768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptnx6-0003O0-1F; Tue, 02 May 2023 11:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528510.821768; Tue, 02 May 2023 11:13:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptnx5-0003Lb-TZ; Tue, 02 May 2023 11:13:47 +0000
Received: by outflank-mailman (input) for mailman id 528510;
 Tue, 02 May 2023 11:13:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=87GZ=AX=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1ptnx5-0003LR-0N
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 11:13:47 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 672ba75a-e8da-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 13:13:45 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f315735514so163681275e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 May 2023 04:13:45 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e5-20020a5d5005000000b0030469635629sm25685459wrt.62.2023.05.02.04.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 04:13:43 -0700 (PDT)
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
X-Inumbo-ID: 672ba75a-e8da-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1683026024; x=1685618024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RsC+epa7CsvsdYdUD2vHUSqP2BJfk8zEfXqKTWfPouw=;
        b=WkEwIoz90+GkvJBvSoZcRgsY7VdSW391O/IsBn9N2/D1hnSOavHBtc7clB+iRlJWj7
         fsNjk+Ro+j4lfpQ/3rcdJFrMZ+y20hmsdLDLAPJ9IDi16CrdjtSen4Ewd2qd17fPqum5
         0MCySztnmMDYlfCTAnnB33LrmhEqVRUaSLouI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683026024; x=1685618024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RsC+epa7CsvsdYdUD2vHUSqP2BJfk8zEfXqKTWfPouw=;
        b=KEd9GDLGqcz42Z3gqCcDG/Rq6BF5gcFhFpdIU2cP4Q24yIs/OG470cK3y9URaMVmFg
         XBN7hvr2OVBFfRWIKXmhwK8/aLRO79+Wp6bmPm8I6UF05VO31Hqv7BqQOeQmppaDh0D+
         SS8J2ziKpmh+nUz/eYd3vCOW68iO1KwWYvfccTy6UPN4ZD9E68B1aiRQ+JSM9qBV1ZD7
         aO8HYpDlbOAex9N+nOW4CZq4r2LOeOR3+WUy1wqyFqPE8zf1vbr4bQ+6YTSCVYLyc8cv
         8pSyYc+dgW9LiM0MDnm6p52D1ntFImoMWu749EDLtx/MhFurkoKOVHVA0CvKTMw5IzRE
         7SfQ==
X-Gm-Message-State: AC+VfDy4fnoDWXJA3zfmpkdDc49jziZS2BV+/cttD8TDQoJToQ37rViH
	AUpeGm3UCtBIN7UkXn+h1PygvkgF/ATsf/y8dGI=
X-Google-Smtp-Source: ACHHUZ46cHk7Or+b/FgUpaGyCoWKuBRHuMEFrC/bLfmR4PqOpsLEBPTOvww+VO4iHL4HAokusHbg6A==
X-Received: by 2002:a5d:6b01:0:b0:2fa:abcd:59a2 with SMTP id v1-20020a5d6b01000000b002faabcd59a2mr10558235wrw.30.1683026023975;
        Tue, 02 May 2023 04:13:43 -0700 (PDT)
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
Subject: [PATCH v3 0/3] Rationalize usage of xc_domain_getinfo{,list}()
Date: Tue,  2 May 2023 12:13:35 +0100
Message-Id: <20230502111338.16757-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first 4 patches of v2 already made it to staging. This is a corrected
repost of the 3 remaining ones.

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
 tools/libs/light/libxl_domain.c         | 13 ++--
 tools/libs/light/libxl_mem.c            |  4 +-
 tools/libs/light/libxl_sched.c          | 26 ++++----
 tools/libs/light/libxl_x86_acpi.c       |  4 +-
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
 38 files changed, 184 insertions(+), 372 deletions(-)

-- 
2.34.1


