Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F8F6F15E2
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 12:41:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527250.819648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psLXk-0002CW-TQ; Fri, 28 Apr 2023 10:41:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527250.819648; Fri, 28 Apr 2023 10:41:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psLXk-0002Ai-QP; Fri, 28 Apr 2023 10:41:36 +0000
Received: by outflank-mailman (input) for mailman id 527250;
 Fri, 28 Apr 2023 10:41:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=19My=AT=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1psLXj-0002Ac-Da
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 10:41:35 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3eb7ffad-e5b1-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 12:41:34 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f19ab994ccso74494695e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 28 Apr 2023 03:41:34 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k6-20020a5d5246000000b002e71156b0fcsm20930378wrc.6.2023.04.28.03.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 03:41:32 -0700 (PDT)
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
X-Inumbo-ID: 3eb7ffad-e5b1-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1682678493; x=1685270493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hrr2ZYnPDaoY9sj7/TY27jsqfX5ZclTyiDVdZcG4M6g=;
        b=kA5v7F3SNuias6hBwlj/q1MkGTJr0FeIhTuqyV4efKSw9lQT20kW+0B0Mtxa8+syxv
         PTslaEubQi3J8fALCxTymNTlf8SPltge8CIxUt0ooE7H/Tg25LHMil9vSoqb526l7/uY
         yshGbERZUbBWSwTaRb2Rtsm5X8oWpLOofB5Wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682678493; x=1685270493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hrr2ZYnPDaoY9sj7/TY27jsqfX5ZclTyiDVdZcG4M6g=;
        b=Qe2IICJViaBqKw8XIo2PVBIHizsmHNuct5GFFrjMjIimpV/HGhj3f31mXlQdOOc8Nz
         v/W6wWa5AYXzDVeRR+AaiOBtCxJ0rHpS7zJGI4esFeWJDFG8thoLMZwIvzWzMawdtWdV
         CBwmi2lhKO32q4+lmPcx/4div9/K2bgKlBFk4CAH4yR4s+U6Ex7MBEzs3Ay1uU2HRxpj
         Mau+YZaugDUVJaXdnVUe/nocrnu62Ui/ZdSadmQpwr50aCc4E+G6nySkz9RiLjzFW7U9
         GgqMWjZsk2IEbrvty/PtKqSG0zT7ips/z9b/Gcya/t/RNFaMTlOdhvUKXqEAX8l6QqpS
         XUCg==
X-Gm-Message-State: AC+VfDz2vAYGp70sOmIemtnAGo+HMu5ZGz2e7WSd411JFA3QXvhj45AI
	/j0X0gedSnbxnML4uVSt3nSVOH+BciUIETVpnuw=
X-Google-Smtp-Source: ACHHUZ6x1OJKZRo9ALWEgqTISi6PL6Qu4mlIRfa9jivtw9deAVAvSPJ/ATWUJT6KLkltl37QHgC1ag==
X-Received: by 2002:a5d:5490:0:b0:301:8551:446a with SMTP id h16-20020a5d5490000000b003018551446amr3061547wrv.2.1682678492942;
        Fri, 28 Apr 2023 03:41:32 -0700 (PDT)
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
	Tim Deegan <tim@xen.org>
Subject: [PATCH v2 0/7] Rationalize usage of xc_domain_getinfo{,list}()
Date: Fri, 28 Apr 2023 11:41:17 +0100
Message-Id: <20230428104124.1044-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2:
 * Various stylistic changes to match Xen style
 * Removed hardcoded ARRAY_SIZE() macro in favour of common-macros.h
 * Changed error handling convention of xc_domain_getinfo_single()
   to return {0,-1}/errno
 * Removed error handling overrides on xc_getininfo_single() callers
 * Improved some debug on the error path of xc_getinfo_single() callers
 * Used dominfo_shutdown_with() in lowlevel/xc/xc.c rather than extracting
   the 'crashed' condition manually.

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

With the DOMCTL amended, the new xc_domain_getinfo_single() drops its
stricter check, becoming a simple wrapper to invoke the hypercall itself.

Alejandro Vallejo (7):
  tools: Make some callers of xc_domain_getinfo() use
    xc_domain_getinfolist()
  tools: Create xc_domain_getinfo_single()
  tools: Refactor console/io.c to avoid using xc_domain_getinfo()
  tools: Make init-xenstore-domain use xc_domain_getinfolist()
  tools: Modify single-domid callers of xc_domain_getinfolist()
  tools: Use new xc function for some xc_domain_getinfo() calls
  domctl: Modify XEN_DOMCTL_getdomaininfo to fail if domid is not found

 tools/console/client/main.c             |  7 +--
 tools/console/daemon/io.c               | 31 +++++-----
 tools/debugger/kdd/kdd-xen.c            |  6 +-
 tools/helpers/init-xenstore-domain.c    | 14 +++--
 tools/include/xenctrl.h                 | 63 ++++++++-----------
 tools/libs/ctrl/xc_domain.c             | 82 +++++--------------------
 tools/libs/ctrl/xc_pagetab.c            |  7 +--
 tools/libs/ctrl/xc_private.c            |  7 +--
 tools/libs/ctrl/xc_private.h            |  7 ++-
 tools/libs/guest/xg_core.c              | 23 +++----
 tools/libs/guest/xg_core.h              |  6 +-
 tools/libs/guest/xg_core_arm.c          | 10 +--
 tools/libs/guest/xg_core_x86.c          | 18 +++---
 tools/libs/guest/xg_cpuid_x86.c         | 34 +++++-----
 tools/libs/guest/xg_dom_boot.c          | 16 ++---
 tools/libs/guest/xg_domain.c            |  8 +--
 tools/libs/guest/xg_offline_page.c      | 12 ++--
 tools/libs/guest/xg_private.h           |  1 +
 tools/libs/guest/xg_resume.c            | 19 +++---
 tools/libs/guest/xg_sr_common.h         |  2 +-
 tools/libs/guest/xg_sr_restore.c        | 17 ++---
 tools/libs/guest/xg_sr_restore_x86_pv.c |  2 +-
 tools/libs/guest/xg_sr_save.c           | 26 +++-----
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
 tools/python/xen/lowlevel/xc/xc.c       | 28 ++++-----
 tools/vchan/vchan-socket-proxy.c        |  6 +-
 tools/xenmon/xenbaked.c                 |  6 +-
 tools/xenpaging/xenpaging.c             | 10 +--
 tools/xenstore/xenstored_domain.c       | 15 +++--
 tools/xentrace/xenctx.c                 |  8 +--
 xen/common/domctl.c                     | 32 +---------
 41 files changed, 254 insertions(+), 386 deletions(-)

-- 
2.34.1


