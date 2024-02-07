Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA9984CFDB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 18:40:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677846.1054736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXluJ-0005Vl-Dq; Wed, 07 Feb 2024 17:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677846.1054736; Wed, 07 Feb 2024 17:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXluJ-0005Te-Am; Wed, 07 Feb 2024 17:40:23 +0000
Received: by outflank-mailman (input) for mailman id 677846;
 Wed, 07 Feb 2024 17:40:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0q5t=JQ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1rXluI-0005TY-1N
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 17:40:22 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6ef0306-c5df-11ee-8a4a-1f161083a0e0;
 Wed, 07 Feb 2024 18:40:20 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a30f7c9574eso123379466b.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 09:40:20 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 op3-20020a170906bce300b00a37669280d1sm976355ejb.141.2024.02.07.09.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 09:40:19 -0800 (PST)
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
X-Inumbo-ID: f6ef0306-c5df-11ee-8a4a-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1707327619; x=1707932419; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sD3mINkQKVOArN50c8qQ7+QTNBNiB330mzDy3nnj1xU=;
        b=HTmjyvOGL9+ENIHosrIdCMbYfbtnhfcO+E0+7dDj1jAS5WsomC1pWt/4VKRo+xbIfC
         cfkcJhV74XLQep/joCC45QP7a9eO7Q+ugpeygVOuX4mQ3+QVeLp522jZ+GhIxgF2EVT5
         tFdvMEO1EAbYlmMKf7JgTEvLu42iVepqwVbZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707327619; x=1707932419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sD3mINkQKVOArN50c8qQ7+QTNBNiB330mzDy3nnj1xU=;
        b=Tpjz4Fi7K1hPQ0DC3hLBtx9+uubQUHmBB9ZykKjo/8cd0BgEaB2Nj/CbfKThOFHdjN
         ltzF1gmyTYTLdWT27CfyfbwqN5aHlqEkM6uAgnBHdZ1ldqXDD6LNh34gt45xzSLtkt7L
         gwl4iuQfLaqsiplm7o9AUXgnSbS8lxCOEcEvwI6DHTeJnA1P/9XqBoZ8XfRUQkmFU19v
         wRMjXDnUGZQBmzIOrJlDFgiJr2cVmPJWMIB80JT8jPVvxQLebFkSQz/67nxbBvE6cYfe
         QhFR7oxgud0cglOdT6iDjXEsyDGnMaLt2zCKbyPvDiyTVrlgyzhMkUIYrekVTMnZedfh
         Y1eg==
X-Gm-Message-State: AOJu0Yw/84fMk0LnS0FQkrkkADudA9qfA23RUr2Z9IVhD4U3z0hvsXXV
	igFDWkVU9Tai5RNycs/mXm91Z/kmNTX3S2xBBgpO33Qb8k0g8cd/8MviXTVhX2Ia+XI2/0MnqOE
	r
X-Google-Smtp-Source: AGHT+IF11QpAkfRxY+MsanOmPWEMYD3Cq0V8iwuzsFs+nzpzBUQtbx6IVOL41xAtkbIkxubcfvhi+g==
X-Received: by 2002:a17:906:b28c:b0:a39:3bf2:fd1c with SMTP id q12-20020a170906b28c00b00a393bf2fd1cmr56641ejz.50.1707327619642;
        Wed, 07 Feb 2024 09:40:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWhFp+xi0PV2VrIacwi6eV5jByd9LFUZjmp7Xk81upR6OycBLOHVelDdCSlH67cg6LMs9dUo05+r0s2XkI0mYeJrObHfet/GlUkYsn7I+Dwm8Zm7RdhPOPDfCGrh5+jJf8PW66fESSrMauEewqN4d5H8lAow0Np/O/GdDXEhEq/NISGM9nwDdF4UAOJ2v9zlywujoMaAb5JXhFffjAfDzNPSL4on0LZUYFmxg==
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/3] Clean the policy manipulation path in domain creation
Date: Wed,  7 Feb 2024 17:39:54 +0000
Message-Id: <20240207173957.19811-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Alejandro Vallejo (3):
  tools/xg: Move xc_cpu_policy_t to xenguest.h
  tools/xg: Streamline cpu policy serialise/deserialise calls
  tools/xg: Clean up xend-style overrides for CPU policies

 tools/include/xenguest.h             |  14 +-
 tools/libs/guest/xg_cpuid_x86.c      | 500 +++++++++------------------
 tools/libs/guest/xg_private.h        |  10 -
 tools/libs/guest/xg_sr_common_x86.c  |  54 +--
 tools/misc/xen-cpuid.c               |  40 +--
 xen/include/xen/lib/x86/cpu-policy.h |   6 +-
 6 files changed, 197 insertions(+), 427 deletions(-)

-- 
2.34.1


