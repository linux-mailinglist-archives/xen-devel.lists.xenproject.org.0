Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61079A97BF4
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 03:03:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963776.1354706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7OVk-0000rN-C6; Wed, 23 Apr 2025 01:02:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963776.1354706; Wed, 23 Apr 2025 01:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7OVk-0000oI-89; Wed, 23 Apr 2025 01:02:48 +0000
Received: by outflank-mailman (input) for mailman id 963776;
 Wed, 23 Apr 2025 01:02:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dLR5=XJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7OVi-0000o7-Jl
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 01:02:46 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8d0814a-1fde-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 03:02:42 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so42695445e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 18:02:43 -0700 (PDT)
Received: from localhost.localdomain ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d2326dsm6707635e9.15.2025.04.22.18.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 18:02:41 -0700 (PDT)
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
X-Inumbo-ID: a8d0814a-1fde-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745370162; x=1745974962; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tdHdelCaXxtoqb9ewIU/MGzLV6t4uBfGR2RMb0/HxVk=;
        b=LbzBUUsmkpq0ePvjjEYZARqapNT+MI1uqgBf9iX++9IVf/l6O08qMzptkPSQczrcej
         yIaTZ06bG+JYnXfRpJ99ZPEl73EU8xT6QndPUDtiByvvjq14Ie2cHmMNDN7VvRU74D6o
         peXV5EfYuo7VhOjJhx9nRwG2sXJJ6kcAHeU9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745370162; x=1745974962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdHdelCaXxtoqb9ewIU/MGzLV6t4uBfGR2RMb0/HxVk=;
        b=GTjbFYYpoutIDTcbXIEF9ixryVWBqIPMORSMdcm+8sU0ZwaF6YOqlZ31n6aeWpDvxb
         ktFJWmbO0jA/Mcl9Ul2BzLEu+l8CIebfu5jZX6FMp9MoLM0Aux1kqmh2XVMU6/qWN4vj
         xiMGIn/ReQnjtLmqCcrxSoWgQbmqcqo/4GT4pQH1YcHWQB5cz5jeVSd2QVGSUQt9SbDS
         l9YI61+rMptCjlYuAbV5jxFJKO+n0PN8C5mDmV5bUIOTfVpf+ro3qQs0OcIKM3mA0kxh
         W5ZPDvlED7KN9E3Cm625CL+azCzS3t4cs042dMHpt4hYFf/WGWs1zB8EJZI9LDF7Cx0t
         fLqA==
X-Gm-Message-State: AOJu0YzUcDphvMXalngh+fupuMk5lmmdZIgDoLiBwhGRxJQShQqvZrn2
	bPo12lkLByPoGClI9++U094TfpK61dDiIEZh2sLUEFJnZaqqlzlyiSq+4mjxEbJkebn62z2O41O
	W
X-Gm-Gg: ASbGncvtxtdEGCzr32gfkf/+a6LeJiAlT6a1IamFDDZde295YuVmkdHRbJrHCxbqVuR
	qJkwmoTv6MZTbUNTYAvLaIcNEZPxgPnWu3B/7jYRPHwWMd90r2a1ka1QkUCIiCx8B/KU4x3BPM0
	AVr4t8JLoB5uJ1yobNMNhtZnz+jLFUJOuIGL03kTtamAR1nAV00Uce4XQbRwfcbTAs/gtGb+V+p
	83Bqg7gS7F+RtOC0fXRMf3DgusLFnQQfLD06qreShM+o7yUxYwmqEd19A8KjSz+2B69q777cyWW
	5IXbdIJabl/5scN0phxP5i4gWDkZCOpTSAnj32ShykNlrKssqAwmeystQFAJ6A==
X-Google-Smtp-Source: AGHT+IHsiRl1hnAhNz5ox8fxGn3OJdYF2FVlhK35s5eCwVqqH9pNHXSPP7ZsWiGfzvmZv9CLGS7qDw==
X-Received: by 2002:a05:600c:1383:b0:43c:f16a:641e with SMTP id 5b1f17b1804b1-4406ab6c6e8mr139009435e9.6.1745370162336;
        Tue, 22 Apr 2025 18:02:42 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 0/8] x86/altcall: Switch to a simpler scheme
Date: Wed, 23 Apr 2025 02:02:29 +0100
Message-Id: <20250423010237.1528582-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

See patch 7 for details.  This simplifies _apply_alternatives() specifically
by removing a special and quite complicated case, and encodes the metadata
about altcalls differently and more efficiently.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1780872355

Andrew Cooper (8):
  x86/altcall: Split alternative-call.h out of alternative.h
  x86/altcall: Rename alternative_branches() to boot_apply_alt_calls()
  x86/alternatives: Rework information passing into
    nmi_apply_alternatives()
  x86/alternatives: Factor seal_endbr64() out of _apply_alternatives()
  x86/altcall: Introduce new simpler scheme
  xen/livepatch: Support new altcall scheme
  x86/altcall: Switch to simpler scheme
  x86/alternatives: Simplify _apply_alternatives() now altcall is
    separate

 .../eclair_analysis/ECLAIR/deviations.ecl     |   4 +-
 xen/arch/x86/alternative.c                    | 267 ++++++++++--------
 .../asm/{alternative.h => alternative-call.h} | 179 +-----------
 xen/arch/x86/include/asm/alternative.h        | 263 -----------------
 xen/arch/x86/include/asm/hvm/hvm.h            |   2 +-
 xen/arch/x86/setup.c                          |   3 +-
 xen/arch/x86/xen.lds.S                        |   4 +
 xen/common/core_parking.c                     |   4 +-
 xen/common/livepatch.c                        |  58 ++++
 xen/include/xen/alternative-call.h            |  24 +-
 10 files changed, 252 insertions(+), 556 deletions(-)
 copy xen/arch/x86/include/asm/{alternative.h => alternative-call.h} (63%)

-- 
2.39.5


