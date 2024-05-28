Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E638D2060
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 17:30:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731193.1136557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBymB-0001AK-S6; Tue, 28 May 2024 15:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731193.1136557; Tue, 28 May 2024 15:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBymB-00018V-OQ; Tue, 28 May 2024 15:30:11 +0000
Received: by outflank-mailman (input) for mailman id 731193;
 Tue, 28 May 2024 15:30:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5inG=M7=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1sBymA-00018E-6O
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 15:30:10 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a3f3851-1d07-11ef-b4bb-af5377834399;
 Tue, 28 May 2024 17:30:08 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5295ae273c8so1228654e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2024 08:30:08 -0700 (PDT)
Received: from fhilly.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c937444sm621673366b.61.2024.05.28.08.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 08:30:07 -0700 (PDT)
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
X-Inumbo-ID: 2a3f3851-1d07-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716910207; x=1717515007; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cM8bna0Wd5m2xXZDWh7XLMYuwWxXgUnRwXpmL//Hrrk=;
        b=WtSLXsHcqBK2dnyZebTNYiGWpwSgCyuEVp55WBuWznd6gAVwZPgOVrYhMtIeEUqLmD
         /q/GRsSrkrmfEM3SwmM8Ht8/C1KaZpeHtracoOiOA9rXpcNzuq23OKoH6pCzgD+ZS80l
         3s4uqPSfy6ouMXtKlon9ZiJN1drJNIdfOJ7bI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716910207; x=1717515007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cM8bna0Wd5m2xXZDWh7XLMYuwWxXgUnRwXpmL//Hrrk=;
        b=qNAqvwkk/m8aj11GSk2B92CEMXFhuAlf2BeJ8If8sXFxFgog+zD/n/KVkKsXWV2ZOv
         zGQdfWQ7hG4+b7L2y/B4y1hrqV2oWlZmXuI8zdMRCThJLO5kIn983P+hffbhQlcZduXi
         kLUZXm3hyCqjki1dTt3gu/frlA1Q/Nf6/nLiZ3axJpEHxNcVy2v6q6QxZysjxUKP+JFq
         hWrydKXmw6peuzQOz8aKhZ4CAWzrm9j4FEZhPnX1VyKSmSJHEtHrAG+CcvHm4RVL7GaX
         1NmkdUT3CLIZ9zs4jLvA8rm8jd+kD4g0oa0h07SJ6qOpycajeDf5nfy0DHJF97g9w4EW
         a1sA==
X-Gm-Message-State: AOJu0Yzn5PCzUkSbcAqErDkjM4G+AW+UjJr+O0afR+2G5CKJ/m8Qk7Pb
	sWhmCgdysV0kZ+h+Bu4DycAhtb/2EDy9AT63+Qpq43OkVEbB+YnnmB01TEUzXpOnXzuysAxsZbz
	63Tg=
X-Google-Smtp-Source: AGHT+IGyfGvPVKupYkhjK39ncSBP2u8Cxf4mPdXyZBNWrdHIDqu+ocbS2jLPwe9aNNYwG93WY40ECw==
X-Received: by 2002:ac2:5dd3:0:b0:521:a96:bf15 with SMTP id 2adb3069b0e04-52965198d34mr7347722e87.38.1716910207599;
        Tue, 28 May 2024 08:30:07 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 0/4]  x86/xen-ucode: Introduce --force option
Date: Tue, 28 May 2024 16:29:39 +0100
Message-ID: <20240528152943.3915760-1-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor and introduce --force option to xen-ucode, which skips microcode
version check when updating x86 CPU micocode. A new hypercall introduced
with flags field to facilitate the new option and allow for future flags
as needed.
This change is required to enable developers to load ucode that is the same version as the
one already loaded or downgrade for testing.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>

Fouad Hilly (4):
  x86/ucode: Introduce PF_microcode_update2 with flags parameter
  x86/ucode: refactor xen-ucode to utilize getopt
  x86/ucode: Introduce --force option to xen-ucode to force skipping
    microcode version check
  x86/ucode: Utilize ucode_force and remove opt_ucode_allow_same

 docs/misc/xen-command-line.pandoc    |  7 +---
 tools/include/xenctrl.h              |  3 +-
 tools/libs/ctrl/xc_misc.c            | 12 +++---
 tools/misc/xen-ucode.c               | 61 ++++++++++++++++++++++------
 xen/arch/x86/cpu/microcode/amd.c     |  7 ----
 xen/arch/x86/cpu/microcode/core.c    | 20 +++++----
 xen/arch/x86/cpu/microcode/intel.c   |  4 --
 xen/arch/x86/cpu/microcode/private.h |  2 -
 xen/arch/x86/include/asm/microcode.h |  3 +-
 xen/arch/x86/platform_hypercall.c    | 13 +++++-
 xen/include/public/platform.h        | 14 +++++++
 11 files changed, 97 insertions(+), 49 deletions(-)

-- 
2.42.0


