Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2377B7E4410
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 16:49:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628910.980846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0OKY-0004nv-1R; Tue, 07 Nov 2023 15:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628910.980846; Tue, 07 Nov 2023 15:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0OKX-0004h7-Tt; Tue, 07 Nov 2023 15:49:29 +0000
Received: by outflank-mailman (input) for mailman id 628910;
 Tue, 07 Nov 2023 15:49:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l2M1=GU=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r0OKW-0004f2-F9
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 15:49:28 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a6180d2-7d85-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 16:49:26 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-407da05f05aso40732825e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Nov 2023 07:49:26 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net ([2.223.46.215])
 by smtp.gmail.com with ESMTPSA id
 n26-20020a1c721a000000b0040849ce7116sm15809852wmc.43.2023.11.07.07.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 07:49:24 -0800 (PST)
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
X-Inumbo-ID: 3a6180d2-7d85-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699372165; x=1699976965; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7QLYmYWtMJ62e0JFgj800/8nLr0ylkXl7+nFaCaFD6M=;
        b=Y1NhyE380SQb7GYcXK9wrPsTIYBSry3Cj9D1grWAaqdmprALxjWR5riPGhfIhTlrQL
         v7GL8t7vT1atsR+hV4le+7SqBOk96Q4R6zH49HTetwRCtoR9sPw9D0D+AGOpU8deYNfo
         GLyPBuhTEkm4UE7u+k+eRuGVHvhLT4Sf4N6hQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699372165; x=1699976965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7QLYmYWtMJ62e0JFgj800/8nLr0ylkXl7+nFaCaFD6M=;
        b=gcyQlNlekjBNXdXZE2hUTiYRU2N/KagG1/WZNFmkWwpL3x8d50xO+iBsAOIN3t86Yn
         LqtMl+0vJbpPqJ4Rfae7PlPkHlTvmR3bkf/O85L7yWKRkYN9yf4hCPpZS0YmyLhVvFF8
         rzvd+ByPzSmD7mY17XUp04oKu8AchnJmhN3bGqtdIIE87euw7LljxAPgmtQDPBqN9qvO
         7KMUSuN8uOKpY4qvaa5Xo46NNCGhBQa7q/LYsnzUN6Fqv7EC4iAnW3kkoGgFCy0mxceT
         rPQy+GX5yNC8IDa2CYp1nIN5FzNVXQUPq2epj4U58rEky6l6lSy0pDHzZYd9dos8CwKS
         hwEQ==
X-Gm-Message-State: AOJu0YzDHR7fqXotVk1zaZ/h7RpCIzF8fBzWHrnJ8JmXQ0wJuUBkBjH/
	4jnyKbtTK4yrde0EeCjn6jKqt6c+kTEEhvZw+iQ=
X-Google-Smtp-Source: AGHT+IGzHLC6XZxItKAQbIOb9FG4NXEkVbirOPLd4+1V+M6DMxzLsw+ximlZaNVOzhIZqGnykuLeVw==
X-Received: by 2002:a05:600c:2109:b0:407:3b6d:b561 with SMTP id u9-20020a05600c210900b004073b6db561mr3002422wml.9.1699372164771;
        Tue, 07 Nov 2023 07:49:24 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/7] Cleanup and code duplication removal in xenguest
Date: Tue,  7 Nov 2023 15:49:14 +0000
Message-Id: <20231107154921.54979-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NOTE: This series is still under test

This series tries to bind the current xc_cpu_policy_t and its serialization
buffers. Having them separate makes it hard to extend of modify the
serialized policy structure and needlessly leaks details in places that
don't need them, causing a lot of boilerplate and code duplication. The
resulting code is >100LoC leaner.

The series is not as aggressive as it could be, but it's enough to unlock
future work regarding cpu policy extensions and ought to make toolstack
interactions a lot faster.

Patch 1: Remove the fixed buffers in xc_cpu_policy_t and create pointers
         populated during xc_cpu_policy_init() instead.
Patch 2: Removes boilerplate by making use of the newly created buffers
Patch 3: Adds a couple of helpers to keep the 2 forms inside the
         xc_cpu_policy_t object consistently in sync.
Patch 4: Splits the common set_cpu_policy wrapper in 2. One to send the
         deserialized form of the policy object (after serializing it
         internally first) and another to send the serialized form
         directly.
Patch 5: Uses the previous patches to avoid a lot of boilerplate in the
         main policy manipulation routine.
Patch 6: Remove code duplication in the xend-style override setters
Patch 7: Final cleanup so the get_cpu_policy wrappers can operate on policy
         objects directly

Alejandro Vallejo (7):
  tools/xenguest: Dynamically allocate xc_cpu_policy_t contents
  tools/xg: Simplify write_x86_cpu_policy_records()
  tools/xg: Add self-(de)serialisation functions for cpu_policy
  tools/xg: Split xc_cpu_policy_set_domain()
  tools/xg: Streamline xc_cpuid_apply_policy()
  tools/xg: Simplify xc_cpuid_xend_policy() and xc_msr_policy()
  tools/xg: Simplify hypercall stubs

 tools/include/xenguest.h             |  11 +-
 tools/libs/guest/xg_cpuid_x86.c      | 626 +++++++++++----------------
 tools/libs/guest/xg_private.h        |  17 +-
 tools/libs/guest/xg_sr_common_x86.c  |  55 +--
 tools/misc/xen-cpuid.c               |   2 +-
 tools/tests/tsx/test-tsx.c           |  61 +--
 xen/include/xen/lib/x86/cpu-policy.h |   2 +-
 7 files changed, 318 insertions(+), 456 deletions(-)

-- 
2.34.1


