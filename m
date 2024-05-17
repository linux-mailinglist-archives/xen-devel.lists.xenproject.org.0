Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB618C89C7
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 18:09:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724316.1129555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s808T-0001xQ-BV; Fri, 17 May 2024 16:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724316.1129555; Fri, 17 May 2024 16:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s808T-0001vM-8r; Fri, 17 May 2024 16:08:45 +0000
Received: by outflank-mailman (input) for mailman id 724316;
 Fri, 17 May 2024 16:08:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jVtU=MU=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s808S-0001vE-6b
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 16:08:44 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id babdd507-1467-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 18:08:42 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a59a934ad50so467794266b.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 09:08:42 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a60eabd3csm739104366b.108.2024.05.17.09.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 09:08:40 -0700 (PDT)
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
X-Inumbo-ID: babdd507-1467-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715962121; x=1716566921; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+CtUn48a+twwOLd6c/CfhFyRomRswzCE/hkLUGpxuFA=;
        b=DL7E5cHNhqYdZ2NKoqBPoidL/W4SSrnhihnODW874JRv8amdh9JlwfF85OtGE3BF1P
         8GzpRlyslA3ecbxu6A/LF6wSVWayz2klPHr0nMAMO+BhaK9p7yrJtbfUZYWxeR1KUBG4
         n5UNSzwcMwOKdrt4E/WmzL5EIJOdtpg4SI41E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715962121; x=1716566921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+CtUn48a+twwOLd6c/CfhFyRomRswzCE/hkLUGpxuFA=;
        b=mg7T54iyEQowAbjTDPbUa2MCLP5J8uD3JpNnzuAHm+sy5Hf8Ix4ZWUFe+MELoH/Tei
         wtr2QFfell/cMV9x2QY43OIXP0UsUiPJgHl6qFal2jRGKg8sqdiSr0NSJ3nOV9xGnJp2
         E482Scs92AyhUCPixobIHgtl3K4Vlsy0IE3kdetpQtxRX7pCniJL7nDHkO11lA1IbnWb
         XJ5AVpFUFwg9JwWW9i1G4wNkvvHoYpKuBQI8in4RqaKnNN6WIJE02VmHdfcazSngHCmP
         7Bb6/GOconkCB3v/CHYIhbJLb7Y8o3xqP63L3qWyIgrJQf2jFmkLPyaaVVxyNK16+X69
         8wow==
X-Gm-Message-State: AOJu0Yw4/huBqKKD6HOhezlpLNovvQCIM+QYp2ZMrgEjEt0Pb3wpwTnw
	C7NiHll0SivGpJ7LL7346/bSXYtKNFhLH5iVR41+31wwEYib9cfu0XQB8WgCnCVSyW4CUZyCURT
	+
X-Google-Smtp-Source: AGHT+IGIvdq22S0y8DPMeTrCuoecZpdwQYUI2ac29ClGm0mlKZhV/SjKt2/zTJa7ry8D/culQ95ICw==
X-Received: by 2002:a17:907:7711:b0:a5c:dd3f:9151 with SMTP id a640c23a62f3a-a5cdd3f933cmr460592066b.35.1715962121227;
        Fri, 17 May 2024 09:08:41 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 0/3] Clean the policy manipulation path in domain creation
Date: Fri, 17 May 2024 17:08:33 +0100
Message-Id: <cover.1715954111.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2:
  * Removed xc_cpu_policy from xenguest.h
  * Added accessors for xc_cpu_policy so the serialised form can be extracted.
  * Modified xen-cpuid to use accessors.

==== Original cover letter ====

In the context of creating a domain, we currently issue a lot of hypercalls
redundantly while populating its CPU policy; likely a side effect of
organic growth more than anything else.

However, the worst part is not the overhead (this is a glacially cold
path), but the insane amounts of boilerplate that make it really hard to
pick apart what's going on. One major contributor to this situation is the
fact that what's effectively "setup" and "teardown" phases in policy
manipulation are not factored out from the functions that perform said
manipulations, leading to the same getters and setter being invoked many
times, when once each would do.

Another big contributor is the code being unaware of when a policy is
serialised and when it's not.

This patch attempts to alleviate this situation, yielding over 200 LoC
reduction.

Patch 1: Mechanical change. Makes xc_cpu_policy_t public so it's usable
         from clients of libxc/libxg.
Patch 2: Changes the (de)serialization wrappers in xenguest so they always
         serialise to/from the internal buffers of xc_cpu_policy_t. The
         struct is suitably expanded to hold extra information required.
Patch 3: Performs the refactor of the policy manipulation code so that it
         follows a strict: PULL_POLICIES, MUTATE_POLICY (n times), PUSH_POLICY.

Alejandro Vallejo (2):
  tools/xg: Streamline cpu policy serialise/deserialise calls
  tools/xg: Clean up xend-style overrides for CPU policies

 tools/include/xenguest.h            |   8 +-
 tools/libs/guest/xg_cpuid_x86.c     | 537 ++++++++++------------------
 tools/libs/guest/xg_private.h       |   2 +
 tools/libs/guest/xg_sr_common_x86.c |  54 +--
 tools/misc/xen-cpuid.c              |  43 +--
 5 files changed, 231 insertions(+), 413 deletions(-)

-- 
2.34.1


