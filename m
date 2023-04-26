Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 623086EF6FB
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 16:59:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526746.818670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prgcR-0000fK-Ay; Wed, 26 Apr 2023 14:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526746.818670; Wed, 26 Apr 2023 14:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prgcR-0000cG-7K; Wed, 26 Apr 2023 14:59:43 +0000
Received: by outflank-mailman (input) for mailman id 526746;
 Wed, 26 Apr 2023 14:59:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vxt2=AR=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1prgcP-0000bz-8C
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 14:59:41 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f75b1724-e442-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 16:59:38 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f09b4a156eso48771165e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Apr 2023 07:59:38 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v17-20020a5d43d1000000b003047ea78b42sm6654116wrr.43.2023.04.26.07.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 07:59:36 -0700 (PDT)
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
X-Inumbo-ID: f75b1724-e442-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1682521177; x=1685113177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mfe9T+Yu+Be8zdjjmeeZpDjZq2wXyt3ymKJgvGq+f2s=;
        b=Zsa40GFw7quWUyzlNKE2/WO9yo3B4xyo7S5MMKiQm0DhEgvT7cWWncoEXg70x/nltN
         PAsoVkBd5CyDtGmzh3/2429VIQEty6yphlQxmnO/PC4h4BCcmfYRYQYuRGE57FuIl/Pz
         n8I/v6uKQj144wnlV54TevTsWGi8lS91DKxm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682521177; x=1685113177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mfe9T+Yu+Be8zdjjmeeZpDjZq2wXyt3ymKJgvGq+f2s=;
        b=EQ5GdgFah1rRepSKpXpbsXwCezNi7BXmq1Lm0pYulk9zR17RT2i9BS8BX2EQfrhrSm
         l/LRw1hyWF6UA2JLyRbc9hHnzArcjfduDqhcl3r/2ICe/i9VV9Glpr/TH246Y83saoHo
         15D7xrRb/IRq6arafRHvzPwHWNm+CkrTgVoR6+BtI0m2pj+DkdaiE8kx1HAM9dwQJHFh
         u3CJ56VBoiqhKK1xdiD93JWJ+YoEBRD+IQDKDjKaZsHiw2R5VrLzANEqJ/ga5JuOLi/9
         rmk/UHaSPw45PMhKPfhqM7vbTCzXa4nHY4DWXUMjy6KKuRYht+uheN1C5lkvnR46OK8E
         VnPw==
X-Gm-Message-State: AAQBX9eUJRYfp6ditbaopw9+dBmOUL6HIH7q7lq9h+H92d6Wt2EERdGL
	LdYqNwYSu/Kk0ZQ65rtj00dHZkxnT4SMIyNDKkutxw==
X-Google-Smtp-Source: AKy350axbG54dQ9LxejbXJX0pZMaL1zCVNK1c1BL+Tm2RDrKrOREH2imfxVIz8Z23wCKRzpe2w5jSw==
X-Received: by 2002:a7b:c386:0:b0:3f1:78d0:fc45 with SMTP id s6-20020a7bc386000000b003f178d0fc45mr13170623wmj.28.1682521177562;
        Wed, 26 Apr 2023 07:59:37 -0700 (PDT)
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
Subject: [PATCH 0/7] Rationalize usage of xc_domain_getinfo{,list}()
Date: Wed, 26 Apr 2023 15:59:25 +0100
Message-Id: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Alejandro Vallejo (7):
  tools: Make some callers of xc_domain_getinfo use
    xc_domain_getinfolist
  tools: Create xc_domain_getinfo_single()
  tools: Refactor the console/io.c to avoid using xc_domain_getinfo()
  tools: Make init-xenstore-domain use xc_domain_getinfolist()
  tools: Modify single-domid callers of xc_domain_getinfolist
  tools: Use new xc function for some xc_domain_getinfo calls
  domctl: Modify getdomaininfo to fail if domid is not found

 tools/console/client/main.c             |  7 +--
 tools/console/daemon/io.c               | 31 +++++-----
 tools/debugger/kdd/kdd-xen.c            |  6 +-
 tools/helpers/init-xenstore-domain.c    | 14 +++--
 tools/include/xenctrl.h                 | 63 ++++++++------------
 tools/libs/ctrl/xc_domain.c             | 79 +++++--------------------
 tools/libs/ctrl/xc_pagetab.c            |  7 +--
 tools/libs/ctrl/xc_private.c            |  7 +--
 tools/libs/ctrl/xc_private.h            |  6 +-
 tools/libs/guest/xg_core.c              | 21 +++----
 tools/libs/guest/xg_core.h              |  6 +-
 tools/libs/guest/xg_core_arm.c          | 10 ++--
 tools/libs/guest/xg_core_x86.c          | 18 +++---
 tools/libs/guest/xg_cpuid_x86.c         | 28 +++++----
 tools/libs/guest/xg_dom_boot.c          | 12 +---
 tools/libs/guest/xg_domain.c            |  6 +-
 tools/libs/guest/xg_offline_page.c      | 10 ++--
 tools/libs/guest/xg_private.h           |  1 +
 tools/libs/guest/xg_resume.c            | 17 +++---
 tools/libs/guest/xg_sr_common.h         |  2 +-
 tools/libs/guest/xg_sr_restore.c        | 14 ++---
 tools/libs/guest/xg_sr_restore_x86_pv.c |  2 +-
 tools/libs/guest/xg_sr_save.c           | 26 ++++----
 tools/libs/guest/xg_sr_save_x86_pv.c    |  6 +-
 tools/libs/light/libxl_dom.c            | 15 ++---
 tools/libs/light/libxl_dom_suspend.c    |  7 +--
 tools/libs/light/libxl_domain.c         | 12 ++--
 tools/libs/light/libxl_mem.c            |  4 +-
 tools/libs/light/libxl_sched.c          | 28 ++++-----
 tools/libs/light/libxl_x86_acpi.c       |  4 +-
 tools/misc/xen-hvmcrash.c               |  6 +-
 tools/misc/xen-lowmemd.c                |  6 +-
 tools/misc/xen-mfndump.c                | 22 +++----
 tools/misc/xen-vmtrace.c                |  6 +-
 tools/python/xen/lowlevel/xc/xc.c       | 29 ++++-----
 tools/vchan/vchan-socket-proxy.c        |  6 +-
 tools/xenmon/xenbaked.c                 |  6 +-
 tools/xenpaging/xenpaging.c             | 14 ++---
 tools/xenstore/xenstored_domain.c       | 15 +++--
 tools/xentrace/xenctx.c                 |  8 +--
 xen/common/domctl.c                     | 32 +---------
 41 files changed, 245 insertions(+), 374 deletions(-)

-- 
2.34.1


