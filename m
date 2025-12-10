Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAA7CB3C32
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 19:30:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183168.1505967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTOxJ-0005Lg-7b; Wed, 10 Dec 2025 18:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183168.1505967; Wed, 10 Dec 2025 18:30:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTOxJ-0005IK-19; Wed, 10 Dec 2025 18:30:29 +0000
Received: by outflank-mailman (input) for mailman id 1183168;
 Wed, 10 Dec 2025 18:30:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=unxu=6Q=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vTOxH-0004rG-PA
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 18:30:27 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bc302cf-d5f6-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 19:30:26 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-477b198f4bcso810175e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 10:30:26 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a886affb4sm1696105e9.3.2025.12.10.10.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 10:30:24 -0800 (PST)
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
X-Inumbo-ID: 4bc302cf-d5f6-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765391425; x=1765996225; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1BDD7FU2KbDO2LpONmlE2QWUa+uDn0AG5zZpbddTqA=;
        b=RymjeU0CRf+6FgVNSRuIM9uPnr0/8J4SW/MIQoNs7NgwYwxSJR3sBR0JzMnZWhCfpW
         /8t7Srly6JkHjRWKaSUjf7nErd+T/9Fd96iJkQRn9MhnUPqr5/ZqCzqdHbhQeYJIemb3
         6UCDTwlUK/ndSnvQD54ekRKOumUy1pz48vzMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765391425; x=1765996225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K1BDD7FU2KbDO2LpONmlE2QWUa+uDn0AG5zZpbddTqA=;
        b=Sei6D66c3FafjTbTNzETX6bDPRJH7lvovCOI7ufvsmyjw5R/0hkqSVgw45e3ji/bSE
         EaGuEb6abtMM5dBUKNelJ4EO9cxLMoDCPhfkMtTpXr4f9lfZfHCxbS6D812fSdKD7jXl
         7a6scEfmCz8QpqDkT0eHE3kZ/rXQdvuod/RK1YsO4YJzRX1KaTYbTJ25kLJ1Tfe6vioZ
         lccmJw2j3hJnna3yjKXZwS/dm3vdEQZVtjrlEdNotuSK4HOYDSqEDB5nud2OcwG+FfCP
         zwkJ0T4yy3sENmx4Ek0ztqRSzFvCyNz3vfG/eUH45HLmG5z10KoAaQCsGCg/5Yg1SNbH
         nkvw==
X-Gm-Message-State: AOJu0YygC6CgT6W2l7pIR+JE/tbiJkXi4xDVadvlRB4CZUGvraIDfV0W
	dsDqb46T2mbxlN47KgTy2T5xhMpobjPlThcsegozvd4JiitZn0jQNU0aMq8+SNbkgj79i4Bh9Yu
	UXhdP
X-Gm-Gg: ASbGncvCMV7+GkH0dzJzxy10MeBZ4YeLTk1rTQkq961zA1TqCGMCZvXkOxGHaKCik0i
	Ga9qwpEkziDYqJwXa6I3WxehGdvv4Zsigk+MCiDcU0sC0Z6jDSNbOrnNAGHp5H6Mnx5+UQNIwxM
	1MMdMIWW8kuUp5lCzfsYwQtBahNg0N/UOFFg3MriSkbeIV9FzDdKMGXYC1UStjpVWwxv7WTYrLX
	g0MZUvGdof8AeLn64P5SYhxbjvJBKADDYN90yE5JVPcicRPSPhJbXsRpT6TqPa2f3iez4oPNdvl
	EsL8oa1qH9LplwQ1dQYQFaytcskFJMTQln7y0oEfiAMbi/DFbq/Gcl4vKVyx+i7rAiKJFmxzHy0
	ZkegYHPAmpTzhDcD8Cl7DXau//kZfd8Kyp9DRntQspzwfCtQ611IsAfkj+/oaEPpu4lJNQzCxzX
	YZPoOkAlBk7r0JwMmcdjbDM83/i5WAARUU2Umv4nze96LgNCTP6McI7cqwvw+ieg==
X-Google-Smtp-Source: AGHT+IEr4Y8PkStPG4zGSMxCSFZBZDTsQfD0Kyr3C/3gqLQBePGhx4GFQopxn2FsQ249G9Iwc5iwOQ==
X-Received: by 2002:a05:600c:3496:b0:477:333a:f71f with SMTP id 5b1f17b1804b1-47a83790c18mr38065175e9.17.1765391425247;
        Wed, 10 Dec 2025 10:30:25 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 3/5] x86/ucode: Don't cast away const-ness in cmp_patch_id()
Date: Wed, 10 Dec 2025 18:30:17 +0000
Message-Id: <20251210183019.2241560-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251210183019.2241560-1-andrew.cooper3@citrix.com>
References: <20251210183019.2241560-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes a volation of MISRA rule 11.8.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/cpu/microcode/amd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index adabe6e6e838..2760ace92177 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -106,7 +106,7 @@ static bool __ro_after_init entrysign_mitigiated_in_firmware;
 static int cf_check cmp_patch_id(const void *key, const void *elem)
 {
     const struct patch_digest *pd = elem;
-    uint32_t patch_id = *(uint32_t *)key;
+    uint32_t patch_id = *(const uint32_t *)key;
 
     if ( patch_id == pd->patch_id )
         return 0;
-- 
2.39.5


