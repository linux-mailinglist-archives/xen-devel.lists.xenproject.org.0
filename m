Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FAC8C5C31
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 22:18:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721729.1125342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6yah-0002xe-8P; Tue, 14 May 2024 20:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721729.1125342; Tue, 14 May 2024 20:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6yah-0002sE-2X; Tue, 14 May 2024 20:17:39 +0000
Received: by outflank-mailman (input) for mailman id 721729;
 Tue, 14 May 2024 20:17:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uMtz=MR=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s6yaf-0002pZ-TN
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 20:17:37 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffccdc4e-122e-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 22:17:34 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41fc5645bb1so44415425e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 13:17:34 -0700 (PDT)
Received: from gmail.com ([213.0.35.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-351b4af0b0asm7917767f8f.100.2024.05.14.13.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 13:17:31 -0700 (PDT)
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
X-Inumbo-ID: ffccdc4e-122e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715717853; x=1716322653; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uqrG0bhOcLLfykWM1D6eXpiAcV0N0AIf9kwEdF2aCpQ=;
        b=QPhsEGln7zMI0paymqI9LnKUw/F/g7AYhxU7u4CFUjN0uzB6GIAPMwc2i+vLuqFrwv
         PmDnGBt5ZXQZuqdf1qgYTwf2YrkDNult4M9sSEYZb6ZBjCZzq7rQAFoZpQxyjFS2jDsb
         QJtHXxFdKl++xu3gFk6uASkGfaDUAEkel9enIJjB+yNNK2ZXXjJstHJNRBSXBpaatM4M
         VpQ7QxU2ML1cQ2LWt8OPQCS8jyam7i3o3oMnvVb9p4bLi0ai3i2Wxn4lGD5+vbtqh+SB
         5nFKvXFxS6PPGrKAoPGCRRLpSUIB0yK1t6E/qOLgpTF9Nstzfn22PBya9FF3ex9VktiD
         Y9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715717853; x=1716322653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uqrG0bhOcLLfykWM1D6eXpiAcV0N0AIf9kwEdF2aCpQ=;
        b=ts0oq6wKODpsPzKBMufBg4D4MeXA6/c3O1Eh7OukXNr4hVQekvdG2hsAkC/aUBAjf7
         c7DD0KWTxqgr5sQk9Gk4iwoJXdNqMqU9MY1cp9JFOaA9RsKoI0iaro223Et/TRP7aGfD
         ssvc5Fyu9e62BNDNOr+OuHYUY2Criv/nH2RYZKCF0+4+Ctpty593SDIYQDbgDhSzoVRR
         AGEP3RMDz9Haqbf8HeWkE++GKxDYrb0UH9Ot5lJ0Al5RJM5nAGi0VNj3ifK9STG91D/6
         Qts+cd4FCkPSIiKpByNF9bsLz6TETX4u+tJwCxqTvBGpunodbwxnHxnAbba5sw06D6R6
         Yzwg==
X-Gm-Message-State: AOJu0Yw3ycLuC9aY5DoTKhirLzNDyR9UOumcw0aQyyFk62nAD13YbM/m
	vRs3OUx/RaSulXV+MQyaV+6zfldZEWe78XVvNW1bPL8iuYaohswZgsxCbKjCFCo=
X-Google-Smtp-Source: AGHT+IFeAZwZVdqqi5E44z5On/1TXiVw9bvDcBC52b21ktHy6qDWgfRBLzUqOkBI50H4xpxbN9jIyg==
X-Received: by 2002:a05:600c:4585:b0:41f:cf63:3ace with SMTP id 5b1f17b1804b1-41fead65ab1mr94015115e9.34.1715717852599;
        Tue, 14 May 2024 13:17:32 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	edgar.iglesias@amd.com
Subject: [PATCH v4 0/9] xen/arm: arm64: Annotate code symbols
Date: Sat,  4 May 2024 13:55:05 +0200
Message-Id: <20240504115514.1063509-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

On the way towards Xen safety certification we're evaluating the use
of tools to collect code-coverage/profiling information from execution
traces. Some tools rely on ELF symbols for code being declared with
type FUNC and having a symbol size.

We currently annotate some symbols but not all. Also, there seems to be
different ways to do the annotation.

This series now converts all the .S files under xen/arm/arm64 to use
the macros from xen/linkage.h and also adds missing code symbol
annotations for global symbols. There are still some local labels that
are left unmodified.

Best regards,
Edgar

ChangeLog:

v3 -> v4:
* Add newline between FUNC_LOCAL and PRINT_ID.
* Use LABEL instead of GLOBAL in bpi.S.
* Changed .global -> LABEL in entry.S (dropped Stefanos RB tag).

v2 -> v3:
* Convert and add annotations for all of xen/arm/arm64.
* Fix commit message for entry.S.

v1 -> v2:
* Drop RFC.
* Squash into a single patch to avoid confusion.


Edgar E. Iglesias (9):
  xen/arm64: entry: Add missing code symbol annotations
  xen/arm64: smc: Add missing code symbol annotations
  xen/arm64: sve: Add missing code symbol annotations
  xen/arm64: head: Add missing code symbol annotations
  xen/arm64: debug: Add missing code symbol annotations
  xen/arm64: bpi: Add missing code symbol annotations
  xen/arm64: mmu/head: Add missing code symbol annotations
  xen/arm64: cache: Use the generic xen/linkage.h macros
  xen/arm64: lib: Use the generic xen/linkage.h macros

 xen/arch/arm/arm64/bpi.S         | 20 ++++----
 xen/arch/arm/arm64/cache.S       |  4 +-
 xen/arch/arm/arm64/debug.S       |  6 ++-
 xen/arch/arm/arm64/entry.S       | 78 ++++++++++++++++++++------------
 xen/arch/arm/arm64/head.S        | 51 +++++++++++----------
 xen/arch/arm/arm64/lib/memchr.S  |  4 +-
 xen/arch/arm/arm64/lib/memcmp.S  |  4 +-
 xen/arch/arm/arm64/lib/memcpy.S  |  4 +-
 xen/arch/arm/arm64/lib/memmove.S |  4 +-
 xen/arch/arm/arm64/lib/memset.S  |  4 +-
 xen/arch/arm/arm64/lib/strchr.S  |  4 +-
 xen/arch/arm/arm64/lib/strcmp.S  |  4 +-
 xen/arch/arm/arm64/lib/strlen.S  |  4 +-
 xen/arch/arm/arm64/lib/strncmp.S |  4 +-
 xen/arch/arm/arm64/lib/strnlen.S |  4 +-
 xen/arch/arm/arm64/lib/strrchr.S |  4 +-
 xen/arch/arm/arm64/mmu/head.S    | 29 ++++++------
 xen/arch/arm/arm64/smc.S         |  6 ++-
 xen/arch/arm/arm64/sve-asm.S     |  9 ++--
 19 files changed, 142 insertions(+), 105 deletions(-)

-- 
2.40.1


