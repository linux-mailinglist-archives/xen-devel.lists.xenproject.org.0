Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C07B1D673
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 13:17:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072830.1435772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujycJ-0002ag-5U; Thu, 07 Aug 2025 11:17:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072830.1435772; Thu, 07 Aug 2025 11:17:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujycJ-0002Ys-1s; Thu, 07 Aug 2025 11:17:03 +0000
Received: by outflank-mailman (input) for mailman id 1072830;
 Thu, 07 Aug 2025 11:17:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LYnK=2T=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ujycH-0002Ym-J7
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 11:17:01 +0000
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [2a00:1450:4864:20::341])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09c484b6-7380-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 13:17:00 +0200 (CEST)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so5543045e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 04:17:00 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5c84b8csm45456435e9.4.2025.08.07.04.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 04:16:59 -0700 (PDT)
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
X-Inumbo-ID: 09c484b6-7380-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754565420; x=1755170220; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xu7stNjQNBQ20D3FOPUXcR8yTuolqv6Uy3awL4lgbto=;
        b=qTqu6rHWuHfjWo34ebAmgCgGsLZ+ZXX21PzLYp9YrVvuZyx6FlmXb1jX66mqt3q2Ak
         uzJbEDeedtIWWZh71Y15HLA8gkdPau4mBGR19DJuNMslhBfqGfnHssTAI7hWOUOPJzAp
         xJk5xOjedTPNZ22D9xDNXfMxteMtdBCbXZkmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754565420; x=1755170220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xu7stNjQNBQ20D3FOPUXcR8yTuolqv6Uy3awL4lgbto=;
        b=mG1gQz25F1waWEUcgokuajL8h9YnxvCjYdB4yV8Qr8jdgV//mjeZtRd7NHNJzk73pD
         pnBO3xlluOW2glT/S4CwB5KJa7NXNDsTEsN9PNn1Iu8wFtN5A0DDogdacokdQMGFjofo
         t4/RxLCYDF+2/uD4Txm9O/eyw7q9gmFkb/wLwVhJIylrj0YfPeaWS4kQqXcHQ3yw1tge
         xR/gFp04h9nEdRfBlJ3fBmBvvr55evljyJK4vaAEwlb7Zlv+p06CcN4yGlNrg997JLlJ
         ixbKK3LTKboVfYDPayBunvowuimuLcgd+CbTIGqovyNrCA46N85/oGQxcI9NbDpPT1ev
         f3pw==
X-Gm-Message-State: AOJu0YzL3KOMOwE99mx2OCP/isNvkszE4dVZwXzlXf/9qp9VUWg2zgEh
	zFKj9Yx0FR+5ZdDMfzXcolvXtuL7FEi6UvoIUPjHGNG4nTJpFmXu1zhgrRacPZgCSFsLe+g0XI7
	o1Zxj6igzKA==
X-Gm-Gg: ASbGnctSuHwf3qYiOxtiqiaak2AhBVwO/ZHzfCG1kvzhm+dSjmx1t/Lil6xJLK5JA26
	MHbTgWa9ZyJlA+K79PmENn8jcTtorCGtNyLPFBWWJ4fsHqiTSc+ENuFxJ2n7s6E5jHsJENcSy/l
	remGZvf7pkXkpkdJRMSo5wzrV9JBslrsc/ltTIcnBRuzdlCZEAohvJMnapG1g7CapTsKSwwC3wW
	in9QxEKmF48IPvbs3fCAFyvsZhuSZqMzHrccFQtFwHqAsLl86nry8QS7CCrtz5w3UAcfqbUT573
	XRiif1UmVWvZCtrHD97NL9cQUzONzVTu/nmQ81LRBqPV/3SYp3ceCq5xgrnziDakECvjhpNStm6
	6XLeUpEIFnUJiDwsSSw4k6m3Ve3LBZ/IhhCi5zVBUFFEK1766b90rO6/EnQgpAZa5ABhOBONHTX
	FS
X-Google-Smtp-Source: AGHT+IEP3uo+khGi/6cmAFLYrzR0rInl2JajsMq1+492t0wURdaYJ3mK/IHpjDKVmwdGER+mBXjU1w==
X-Received: by 2002:a05:600c:4689:b0:459:dfde:3323 with SMTP id 5b1f17b1804b1-459ee872537mr21258235e9.27.1754565419840;
        Thu, 07 Aug 2025 04:16:59 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 0/4] x86: Drop the vm86 segments selectors from struct cpu_user_regs
Date: Thu,  7 Aug 2025 12:16:53 +0100
Message-Id: <20250807111657.201849-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is the next chunk of work in order to support FRED.  Half of v1 is
already committed.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1972002392

Andrew Cooper (4):
  x86/domctl: Stop using XLAT_cpu_user_regs()
  x86/pv: Store the data segment selectors outside of cpu_user_regs
  x86/public: Split the struct cpu_user_regs type
  x86: Drop the vm86 segments selectors from struct cpu_user_regs

 xen/arch/x86/cpu/common.c                |  2 +-
 xen/arch/x86/domain.c                    | 92 ++++++++++++++++--------
 xen/arch/x86/domctl.c                    | 38 +++++++++-
 xen/arch/x86/include/asm/cpu-user-regs.h | 58 +++++++++++++++
 xen/arch/x86/include/asm/current.h       | 11 +--
 xen/arch/x86/include/asm/domain.h        |  2 +
 xen/arch/x86/include/asm/hvm/hvm.h       |  4 --
 xen/arch/x86/include/asm/regs.h          | 11 +--
 xen/arch/x86/pv/dom0_build.c             |  6 +-
 xen/arch/x86/traps.c                     |  2 +-
 xen/arch/x86/x86_64/asm-offsets.c        |  2 +-
 xen/arch/x86/x86_64/traps.c              | 16 ++---
 xen/arch/x86/x86_emulate/private.h       |  1 +
 xen/include/public/arch-x86/xen-x86_32.h |  9 +++
 xen/include/public/arch-x86/xen-x86_64.h |  9 +++
 xen/include/public/arch-x86/xen.h        | 11 +++
 xen/include/xlat.lst                     |  2 -
 17 files changed, 208 insertions(+), 68 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/cpu-user-regs.h

-- 
2.39.5


