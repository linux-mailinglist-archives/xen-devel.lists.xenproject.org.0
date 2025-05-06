Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9528AABD55
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 10:35:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976746.1363885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCDlJ-00043P-40; Tue, 06 May 2025 08:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976746.1363885; Tue, 06 May 2025 08:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCDlJ-00041x-15; Tue, 06 May 2025 08:34:49 +0000
Received: by outflank-mailman (input) for mailman id 976746;
 Tue, 06 May 2025 08:34:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vx1h=XW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCDlH-00041m-Fb
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 08:34:47 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f68a342d-2a54-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 10:34:45 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so29528825e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 01:34:45 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-441c0dfc537sm114483145e9.16.2025.05.06.01.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 01:34:43 -0700 (PDT)
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
X-Inumbo-ID: f68a342d-2a54-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746520484; x=1747125284; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VcW29tlgqCX35x9Q2VuHPxyDBhbeqQG+9E2OIuIdqs8=;
        b=gkqkR7WNfcwiPTZg0HlWA2v5/wlWztp/Fq2UNDCJuKISYKkFlcRDJmkEK4buex0DI2
         et+b1rAkpLwobRvwHTxZ4Of/uTXN+euF0YzGaBt3P+H6VxlkU/jQpEI0jnzZxEjKXq+r
         IkMIYdVkkpKynHM4PN04DZhDZzwAfB0tgLWcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746520484; x=1747125284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VcW29tlgqCX35x9Q2VuHPxyDBhbeqQG+9E2OIuIdqs8=;
        b=qqy3auOxEIMOm5DBaIvu4b5wVsxXO83UvfhofF/1KVtu8cxpAVgj06kd7KXmh45KN5
         2YWJcEYsscHdj60XYhIWUUSC6I7uL5tZ8ICGKBYkL+Yc8HPM/0QEOOGRVRCC7+LJxFYN
         z4vdiNdiMxAM4dH8GYJGwH0HAd0HeNigb0q87BhzoZy/TCouhFduxs8mfA+Me/3g7FGH
         lJzSGLSAzxseJOFIW3B3LF2dse3Yn0fM4p+ULHJSzpZ3mJRZMXXVUQ1v8ilcvuJ2hhQl
         LfYEKatdnr7ECEq6yfS0ea3OYev1NrtpcEVBOBSKzrLYkIzEwTHnJkQ5nJBGs/SDp8Ag
         IsQw==
X-Gm-Message-State: AOJu0YxPicI3qOPKDeyiTH/Ta5CjlBZaYNRc4xReRdDY/hRKfpOXIL7M
	ruj6AnCHshYw0mLUZxuAgzD/mVOpQDawcJqiKrnF0Qq0RJ5ks+ie2vUshZIQ+Pr3r4pnYfto6k5
	Y
X-Gm-Gg: ASbGnct6tIbZrr9FOoX0ERQRB+SKEyRbYbeofZEi+GPNgzyoX+5dB3U3CGHJ/kbI5zo
	4XRQWUIt6lxk9Ro7yZFGb1o6+oIND2GmM4Y4hoMO5uVTz52F75LTxfqxlq6KaVRMU/rUqH80Je3
	+CFjcM2U1G9U+X1k10ImRC5Vn67Uxefwkl/n+cZtuQ9lktK3AhpWpgJfZr8vGUsmJoNwI+dtPIy
	rDXtzACwEg4n4qkTde4oIWiwPNk9ZofzqYa3YwnFtJRYRJ388bGf3fC7dX/nnW/AAJzKbRMqyPb
	U8FNPKsSvFPRXdGap5SqF3eE9Yra/0Tr17cJEr9YGddEhA==
X-Google-Smtp-Source: AGHT+IGAlqormNOZykPxlIggIY/CsIhXy0w5RwQsCodUE6SrqVTWTB/qaz2icYmwkMa/kqwLyTK4Fg==
X-Received: by 2002:a05:600c:5491:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-441d0fccbf5mr15642135e9.10.1746520484253;
        Tue, 06 May 2025 01:34:44 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/8] xen: cache control improvements
Date: Tue,  6 May 2025 10:31:39 +0200
Message-ID: <20250506083148.34963-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Following series contain some fixes for cache control operations, the
main focus is to reduce the load on big systems when cache control
operations are executed.

Patches 1-4 are bugfixes, while patches starting from 5 are improvements
to the current code.  Patch 9 is an optimization to avoid having to
broadcast cache flushes on all pCPUs on x86.

Thanks, Roger.

Roger Pau Monne (9):
  x86/pv: fix MMUEXT_FLUSH_CACHE to flush all pCPU caches
  x86/pv: fix emulation of wb{,no}invd to flush all pCPU caches
  xen/gnttab: limit cache flush operation to guests allowed cache
    control
  x86/gnttab: do not implement GNTTABOP_cache_flush
  x86/mtrr: use memory_type_changed() in hvm_set_mem_pinned_cacheattr()
  x86/p2m: limit cache flush in memory_type_changed()
  xen/x86: rename cache_flush_permitted() to has_arch_io_resources()
  xen: introduce flag when a domain requires cache control
  xen/x86: track dirty pCPU caches for a given vCPU

 docs/man/xl.cfg.5.pod.in            | 10 +++++++
 tools/include/libxl.h               |  7 +++++
 tools/libs/light/libxl_create.c     |  6 ++++
 tools/libs/light/libxl_types.idl    |  3 ++
 tools/ocaml/libs/xc/xenctrl.ml      |  1 +
 tools/ocaml/libs/xc/xenctrl.mli     |  1 +
 tools/xl/xl_parse.c                 |  2 ++
 xen/arch/arm/dom0less-build.c       | 12 ++++++--
 xen/arch/arm/domain.c               |  3 +-
 xen/arch/arm/domain_build.c         |  6 ++++
 xen/arch/x86/domain.c               | 43 +++++++++++++++++++++++++++++
 xen/arch/x86/hvm/hvm.c              |  2 +-
 xen/arch/x86/hvm/mtrr.c             | 29 ++++---------------
 xen/arch/x86/hvm/svm/svm.c          |  6 ++--
 xen/arch/x86/hvm/vmx/vmcs.c         |  3 +-
 xen/arch/x86/hvm/vmx/vmx.c          |  6 ++--
 xen/arch/x86/include/asm/domain.h   |  9 ++++++
 xen/arch/x86/include/asm/flushtlb.h | 15 ----------
 xen/arch/x86/include/asm/iocap.h    | 19 ++-----------
 xen/arch/x86/include/asm/p2m.h      |  2 +-
 xen/arch/x86/mm.c                   | 21 ++++----------
 xen/arch/x86/mm/p2m-ept.c           |  7 +----
 xen/arch/x86/mm/p2m-pod.c           |  4 +--
 xen/arch/x86/mm/p2m.c               | 13 ++++++++-
 xen/arch/x86/pv/emul-priv-op.c      | 19 ++++++-------
 xen/arch/x86/setup.c                |  7 +++++
 xen/common/domain.c                 |  3 +-
 xen/common/grant_table.c            | 11 ++++++++
 xen/common/memory.c                 |  2 +-
 xen/include/asm-generic/iocap.h     |  2 +-
 xen/include/public/domctl.h         |  4 ++-
 xen/include/xen/iocap.h             | 25 ++---------------
 xen/include/xen/sched.h             |  6 ++++
 33 files changed, 181 insertions(+), 128 deletions(-)

-- 
2.48.1


