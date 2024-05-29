Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 766A38D3938
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 16:31:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732067.1137877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCKKB-0006at-9r; Wed, 29 May 2024 14:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732067.1137877; Wed, 29 May 2024 14:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCKKB-0006Yg-6g; Wed, 29 May 2024 14:30:43 +0000
Received: by outflank-mailman (input) for mailman id 732067;
 Wed, 29 May 2024 14:30:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ygCr=NA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sCKKA-0006Xm-FV
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 14:30:42 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06850f46-1dc8-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 16:30:41 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a62972c88a9so272487466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 07:30:41 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c937b92sm720180266b.68.2024.05.29.07.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 07:30:39 -0700 (PDT)
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
X-Inumbo-ID: 06850f46-1dc8-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716993040; x=1717597840; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+yUT538RuJE2ZDH/10+V5jqjUG50quYq2RZl3j1igMg=;
        b=kBV4ppiFZbRuz9I8ER25BPGmPHFz8B9Hxi17jBr92dqML4ftUyi/LCA0NgPI+5hcgU
         oyG0mU0+C9A2kWcqZj1S3VUD2l/J3ZfHUyrAODaL6Ss6w3qTPuigDS8UqfGJ23P51mUN
         lNLAaf9B5YqFlPEBFHdVJmidANkm6sp7OdZLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716993040; x=1717597840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+yUT538RuJE2ZDH/10+V5jqjUG50quYq2RZl3j1igMg=;
        b=V78+JpqWf5uBGE1glrj7g35eGBI9HT2bhKwUrxS4jc7VypWvHGOHXiF//EjbFQS+lG
         bRrlgo1BD16GXlUZI/UVJ2eR0oqNp7eH6GQHoNxT6A3qMxfOfiSW4blR/b2TQoKCyL3i
         n+wLVYE6nvgioELM9wOfBidzfeaxePwJWekq0zkdT89UvRe+4tc/9wJT4c48ri0iHAhW
         EM4LxO2fBae/HboxeU1jcLY7x6xIFDpGHHNJywNVxbWyhFCU4ssYEGj6zFNy184PFTpQ
         BpAlJbJejOlJUZKIrZpioAiwb47M/h0tQ3bMnSAFuWM2I1ohvLz6pFE6NRu2++X2G+Uc
         C8wA==
X-Gm-Message-State: AOJu0Yzz6rdZaIxN/S2Pjl1SLPRFpKmYCpPWy+dpHKTCfvCuvJ8ZcCYr
	eIFdd4hppJ8pIxHqu+yUZAk8kv7sHEM2swAZf0DPfp/xIs7Mt2pc+qYGIMFckYvkaYArKgaiKPQ
	n
X-Google-Smtp-Source: AGHT+IFsXtn8pr9gBJIq4zfxnVRojgg1TjyaV7rfzONLW9FO5US8h8doGmzs5PcIryRjhidABCM8Yw==
X-Received: by 2002:a17:906:3695:b0:a5a:7cfe:30e9 with SMTP id a640c23a62f3a-a6264f01e40mr1054978566b.49.1716993040272;
        Wed, 29 May 2024 07:30:40 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 0/2] Clean the policy manipulation path in domain creation
Date: Wed, 29 May 2024 15:30:36 +0100
Message-Id: <cover.1716992707.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v3 -> v4:
  * More changes in style and comments
  * Removal of unneeded local variables
  * Fixed unhandled corner cases in bsearch()

v2 -> v3:
  * Style adjustments
  * Revert of loop index scope refactors

v1 -> v2:
  * Removed xc_cpu_policy from xenguest.h (dropped v1/patch1)
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

 tools/include/xenguest.h            |  14 +-
 tools/libs/guest/xg_cpuid_x86.c     | 525 ++++++++++------------------
 tools/libs/guest/xg_private.h       |   2 +
 tools/libs/guest/xg_sr_common_x86.c |  56 ++-
 tools/misc/xen-cpuid.c              |  41 +--
 5 files changed, 235 insertions(+), 403 deletions(-)

-- 
2.34.1


