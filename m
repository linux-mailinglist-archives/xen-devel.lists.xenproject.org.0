Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C91F8AB9931
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 11:46:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986699.1372229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrdU-0005cg-V1; Fri, 16 May 2025 09:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986699.1372229; Fri, 16 May 2025 09:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrdU-0005Zv-SL; Fri, 16 May 2025 09:45:48 +0000
Received: by outflank-mailman (input) for mailman id 986699;
 Fri, 16 May 2025 09:45:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UFMR=YA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFrdT-0005Zo-CD
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 09:45:47 +0000
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [2607:f8b0:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89884c1e-323a-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 11:45:45 +0200 (CEST)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-7376dd56f8fso2284499b3a.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 02:45:45 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-b26eb0a76f8sm1172704a12.68.2025.05.16.02.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 02:45:42 -0700 (PDT)
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
X-Inumbo-ID: 89884c1e-323a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747388743; x=1747993543; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eCUHMmwmA5X7WnPUkmR4QV/PMvOkkG7ln2HsbBM+65c=;
        b=t46r1x6SwV0LKtK2EuYeCmQ5PGVUJFGIQqPA1OF+io7yV5s7Jii4SJyMAcprB7CMnZ
         RHJh4nz4/jfw2yTZ4DlJThUNEUoEul3jNs9l9mUWND+hytJ4ZI2vV2rvCKIDLdHIK+/k
         uTxoKa8JRWjDnTrjKjVNRlfL1Jwqk6d/AZVPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747388743; x=1747993543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eCUHMmwmA5X7WnPUkmR4QV/PMvOkkG7ln2HsbBM+65c=;
        b=EWFs69BdJSrqMjWBb4Jxyw3tfCPT7VBXFPD7Cc/x6dIlifKHXnOE09KXNWkyeVFai8
         AtXb35yh0PLRZ+/JNP0wER1bBYw+cYn9rJ60CaiGX+4q+jVgwG2ZLc/RMT/2Rxh2k3UD
         Qy7WabUz2XcjU//XDfRnjhThcqWvcTRiG/iNbZuRCwazLw29l22/ILKUsabG/fkqFTP2
         OcooLfU6rrhA1k1qOybt6D/aNP0zUiuP5AaGrLW5wx8QO67J1Jx1sKz72pzlv0fVuMPn
         0IuFe3R74lxO22m697hVITh7WLLfFSQ5Eqjk0AE7XAEIDYqDDwMoY0eZ7y+0X/4DzOMA
         6uUQ==
X-Gm-Message-State: AOJu0YwixKwKzNZZXQZVfwB/8aIqdJNx4e3weE87fyxso/nBSSze7hW8
	TJlIUCU+Usa35w0c0yycFQu9QwOXy7JEEgn1RkgJ0F9V/Vp9hUPBGMarwvBAwB5MdzBjh8m8jMr
	1ZQs6
X-Gm-Gg: ASbGncsuDZHJhxdzsPIqiK6NzhehIaut8L+jwZalMHdU3rfwIvvFCzy6t4/uAP0iGHF
	yA5zV/BqeIbu+UQJwJJ1g1GHNPFT1CnH6smzqknjwEblpv6w0hQWt7Xqio2wBaxi8rEvsHSyn6F
	EIo968lvh/MUQj0YG/F86b7OOYXWcreBwOEcoaF2XKsEqGEFKDORXyPYQYA4XVNUl1aFIyPtwtg
	Q0qULBh/lc4soZVCNr2GVPXpQtiq0fU4Vwb3bohqL4K7fqgdsMXLa4MK1QMsEb2YxiY3KbLUWJS
	TzupbMmUoLkc1Ryw8F3rUyrZHAOy2EXz8YQnaGwgCMTXNTIwy3b9n1IWYz2QM5ILuZmZRoQI4Y2
	E+gi92phIOdD/YUXgN3BLc4vNnVpzWw==
X-Google-Smtp-Source: AGHT+IHrBx9T26PL0AbxlClWp/1+5AnlX6x5P8hGzjzGg2ylctM83/ZNN97cYXSyVnm6GXucA1pcCw==
X-Received: by 2002:a05:6a20:a115:b0:1f8:d245:616d with SMTP id adf61e73a8af0-21621902a80mr3991418637.21.1747388742893;
        Fri, 16 May 2025 02:45:42 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/6] xen: cache control improvements
Date: Fri, 16 May 2025 11:45:29 +0200
Message-ID: <20250516094535.63472-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Following series contain some fixes for cache control operations, the
main focus is to reduce the load on big systems when cache control
operations are executed.

Patches 1-4 are bugfixes, while patches 5 and 6 are improvements
to the current code.

Thanks, Roger.

Roger Pau Monne (6):
  x86/pv: fix emulation of wb{,no}invd to flush all pCPU caches
  x86/gnttab: do not implement GNTTABOP_cache_flush
  xen/x86: rename cache_flush_permitted() to has_arch_io_resources()
  xen/x86: account for assigned PCI devices in cache_flush_permitted()
  x86/hvm: limit memory type cache flush to running domains
  x86/hvm: reduce the need to flush caches in memory_type_changed()

 CHANGELOG.md                        |  3 +++
 xen/arch/x86/hvm/mtrr.c             | 17 +++++++++++++++--
 xen/arch/x86/include/asm/flushtlb.h | 19 -------------------
 xen/arch/x86/include/asm/iocap.h    |  5 ++++-
 xen/arch/x86/mm.c                   |  4 +---
 xen/arch/x86/mm/p2m-pod.c           |  4 ++--
 xen/arch/x86/pv/emul-priv-op.c      |  6 +++---
 xen/common/Kconfig                  |  5 +++++
 xen/common/grant_table.c            |  6 ++++++
 xen/common/memory.c                 |  2 +-
 xen/include/asm-generic/iocap.h     |  4 +++-
 11 files changed, 43 insertions(+), 32 deletions(-)

-- 
2.48.1


