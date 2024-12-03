Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC8B9E0F93
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 01:17:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847151.1262281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIGai-0003GL-Kl; Tue, 03 Dec 2024 00:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847151.1262281; Tue, 03 Dec 2024 00:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIGai-0003Dc-Hn; Tue, 03 Dec 2024 00:16:36 +0000
Received: by outflank-mailman (input) for mailman id 847151;
 Tue, 03 Dec 2024 00:16:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=On7Z=S4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tIGai-0003DW-4M
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 00:16:36 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da1ccb81-b10b-11ef-99a3-01e77a169b0f;
 Tue, 03 Dec 2024 01:16:33 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aa543c4db92so716928266b.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 16:16:33 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([90.240.255.120])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa59990a8e5sm555423666b.173.2024.12.02.16.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 16:16:32 -0800 (PST)
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
X-Inumbo-ID: da1ccb81-b10b-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733184993; x=1733789793; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vayJHxmC3miwlguVJZfGiN5O+5EOjDwaWf4pKmb+Tjk=;
        b=khN8fAUL36gTyh2kJWutao2NnmYseI1NOvi5Q2rvpRRhw5GcGvcoEab8NpJFGJBoc/
         jbdMZfCElcOYfn4AwpsL9H5tJhUyzRqQ0omd4d7k4ibp/sSsWIgfA3Wpaq+OyL+RXjYL
         h6WgP9Gl5dubHpZAZWsK9YlH85CFFbZmsSxTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733184993; x=1733789793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vayJHxmC3miwlguVJZfGiN5O+5EOjDwaWf4pKmb+Tjk=;
        b=QTILD3edOJwfySLPycK8Exx6GumOYPvxa2g8awgNUnp7JM/c2TcdTQ9aAraPikrQpf
         3m6VqBVo9O/1bwBup8RLLF8Ils0K94P9viYjeGLqWtb7akHzs6R9rZrMzWav3+l2gTjg
         CwgAvu03nO3McyRVikr3wKcz8UzGYe2LwoNb/KOkN/XCygPBhnxJh7zII5YwTnPqNyhe
         LQYrwH6zShaoNH5FD0RuM2X8Qu6dmniSiuqkp8XJuVKusaDgsMw74OxIr4lTUbaYRWH5
         rMdNtmw/RqxCFch416KfCjJon108t5I6joq6KYnFlGZEEdubUjsgHKm0Wpdyf8FzaT68
         J1qQ==
X-Gm-Message-State: AOJu0YyxENZ+vuLZw8Pb7jF53P/0twxwN+w6QfrSQ2uUrdnGgGwTtolL
	rU7+MXaWlX4ocTHofCyl9S/125ZVWwIBp5csFPIUxX86sR8lseD37eC8iOxHHO+FIMKDXQNK3Cy
	jl3c=
X-Gm-Gg: ASbGncttt4wZ2XEqA7dUtIVbL3sfHJJV3k77kLPkEii5pfd4QJ+Iwz5SGPA76kqmFRO
	yod36jpEQdHy6/CAhvR0hzhkoSr+pzGnEoguk0c1CmytYfMM/xltGU9BSyGVMCULasC2ENSPVu8
	N4jsDFwubO3v/G89IsJEXVOeTfkeP8JYChBh86O10BN3OkgWtyMyzuAcXgEt8iDeUjwmBG6Hk50
	Xbo8x8N/Rhn3Wt9qSXVaxMtXBlFVYDG25rg7Fzuz+GgrVzJOqpY87ZDD4pOM/FU6STT4ftQaPdq
	Yw==
X-Google-Smtp-Source: AGHT+IFiF8+vfBFdlHkHlQu8gizE6sadjFeF8npnXqLtJuQka2R0mkoQ+vGiR+KBIpRLM9CTiDQT9A==
X-Received: by 2002:a17:906:3d32:b0:aa5:1dc0:7c1 with SMTP id a640c23a62f3a-aa5f7ccf566mr15938966b.9.1733184992715;
        Mon, 02 Dec 2024 16:16:32 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] libs/guest: Fix migration compatibility with a security-patched Xen 4.13
Date: Tue,  3 Dec 2024 00:16:29 +0000
Message-Id: <20241203001629.132594-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xc_cpuid_apply_policy() provides compatibility for migration of a pre-4.14 VM
where no CPUID data was provided in the stream.

It guesses the various max-leaf limits, based on what was true at the time of
writing, but this was not correctly adapted when speculative security issues
forced the advertisement of new feature bits.  Of note are:

 * LFENCE-DISPATCH, in leaf 0x80000021.eax
 * BHI-CTRL, in leaf 0x7[2].edx

In both cases, a VM booted on a security-patched Xen 4.13, and then migrated
on to any newer version of Xen on the same or compatible hardware would have
these features stripped back because Xen is still editing the cpu-policy for
sanity behind the back of the toolstack.

For VMs using BHI_DIS_S to mitigate Native-BHI, this resulted in a failure to
restore the guests MSR_SPEC_CTRL setting:

  (XEN) HVM d7v0 load MSR 0x48 with value 0x401 failed
  (XEN) HVM7 restore: failed to load entry 20/0 rc -6

Fixes: e9b4fe263649 ("x86/cpuid: support LFENCE always serialising CPUID bit")
Fixes: f3709b15fc86 ("x86/cpuid: Infrastructure for cpuid word 7:2.edx")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Every option here is terrible.  This is the least terrible one I could come up
with.

XenServer, still the only caller to provide featureset into
xc_cpuid_apply_policy() could in principle reverse engineer these two numbers
from the non-zero-ness of the passed-in feature words.  However, such an
approach more complicated, equally as fragile, and not reusable with the
current plans to re-integrate the shrinking logic.  i.e. this is the least
invasive option.
---
 tools/libs/guest/xg_cpuid_x86.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 4453178100ad..263a9d4787b6 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -640,7 +640,8 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
          *
          * This restore path is used for incoming VMs with no CPUID data
          * i.e. originated on Xen 4.13 or earlier.  We must invent a policy
-         * compatible with what Xen 4.13 would have done on the same hardware.
+         * compatible with what a security-patched Xen 4.13 would have done on
+         * the same hardware.
          *
          * Specifically:
          * - Clamp max leaves.
@@ -657,8 +658,8 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         }
 
         p->policy.basic.max_leaf = min(p->policy.basic.max_leaf, 0xdu);
-        p->policy.feat.max_subleaf = 0;
-        p->policy.extd.max_leaf = min(p->policy.extd.max_leaf, 0x8000001c);
+        p->policy.feat.max_subleaf = min(p->policy.feat.max_subleaf, 0x2u);
+        p->policy.extd.max_leaf = min(p->policy.extd.max_leaf, 0x80000021);
     }
 
     if ( featureset )

base-commit: 126b0a6e537ce1d486a29e35cfeec1f222a74d11
-- 
2.39.5


