Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF1E8CCF82
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 11:42:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728280.1133147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA4xE-0003r3-5N; Thu, 23 May 2024 09:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728280.1133147; Thu, 23 May 2024 09:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA4xE-0003p7-1E; Thu, 23 May 2024 09:41:44 +0000
Received: by outflank-mailman (input) for mailman id 728280;
 Thu, 23 May 2024 09:41:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t6d0=M2=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sA4xD-0003m7-6G
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 09:41:43 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a967d2d5-18e8-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 11:41:42 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-354faf5f1b4so359595f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 02:41:42 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-354c7df311esm9533383f8f.3.2024.05.23.02.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 02:41:40 -0700 (PDT)
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
X-Inumbo-ID: a967d2d5-18e8-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716457302; x=1717062102; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5MpvoXLxrGjWD7P+YQJyPs2tsu37hmHqu/VshlrxEQE=;
        b=bn58ZUMTSS7bOUmaVgn26bU6QlUJGnZ2plx6tYKAvv7GTZCldzvJtGYvtHfCILsqad
         RuDHDRewvsCa2cVJ53eLr7YUGtvXJr+iDn29ZtOwpDHlj0etsbLLjBGd+azIm3rPDJfI
         vLQDIutdMvvNC0gyco5yBYU9GLvpZu0nRxcaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716457302; x=1717062102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5MpvoXLxrGjWD7P+YQJyPs2tsu37hmHqu/VshlrxEQE=;
        b=dyCWLY8HOWRe94JjexgIATEvLYUhvgHH/WQdbMLc/RkrYEm8PwWGZNhLGBaTgikDcS
         qQCNQfuDIWkziAd0OHY81uYCgip+qCnk02iG4GfbdWOg2oszsTM1iy2MjiC9FaxTqYGE
         2iyEFLg+cpVLEd2br4wK2DxdAH9sVEblU2l0344cBFfW3izeNnGgSCNx5ZR04rBLtipY
         De1XDbQ8cGiolrfF+tZ33pelnpbA9Lk53xLljqekBwu0phxqyFG/Nq/TUvhmnNtpVr8J
         l+SelTzVJBGg5AJsCWAG7K2EQ75aeRn4Ha9m/P0yWs0SD8k9R+dT6wfH5LfPBZGlAhLI
         14mg==
X-Gm-Message-State: AOJu0Yx6awJNQ3sD1TtuXze5S+4XgqDyi7nnVTUibFlNEREFNue8FeSi
	h9nYH7h5HVQXPZDwfOOeTqvzM1/IW7GHSv7ChDcH89JaFY2LqS641TcPM3no4UvXKPgS3BMga06
	t
X-Google-Smtp-Source: AGHT+IHWPgQ2tR8dl7xB4iECBSEd9EzERVPTZ4iCl7yTHZ0YMnhfSXuJ5ZYgsZjypjCFOC10ULwLZg==
X-Received: by 2002:a5d:66c6:0:b0:354:f304:cd36 with SMTP id ffacd0b85a97d-354f304ce78mr2752759f8f.70.1716457301676;
        Thu, 23 May 2024 02:41:41 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 0/2] Clean the policy manipulation path in domain creation
Date: Thu, 23 May 2024 10:41:28 +0100
Message-Id: <cover.1716457040.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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


Subject: [PATCH v3 0/2] *** SUBJECT HERE ***

*** BLURB HERE ***

Alejandro Vallejo (2):
  tools/xg: Streamline cpu policy serialise/deserialise calls
  tools/xg: Clean up xend-style overrides for CPU policies

 tools/include/xenguest.h            |   8 +-
 tools/libs/guest/xg_cpuid_x86.c     | 530 ++++++++++------------------
 tools/libs/guest/xg_private.h       |   2 +
 tools/libs/guest/xg_sr_common_x86.c |  56 ++-
 tools/misc/xen-cpuid.c              |  41 +--
 5 files changed, 234 insertions(+), 403 deletions(-)

-- 
2.34.1


