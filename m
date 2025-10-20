Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 545CBBF182A
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 15:20:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146287.1478732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vApnw-00085P-Bl; Mon, 20 Oct 2025 13:20:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146287.1478732; Mon, 20 Oct 2025 13:20:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vApnw-00081V-6L; Mon, 20 Oct 2025 13:20:04 +0000
Received: by outflank-mailman (input) for mailman id 1146287;
 Mon, 20 Oct 2025 13:20:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZoK0=45=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vApnu-0007j7-Rh
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 13:20:02 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b341866-adb7-11f0-980a-7dc792cee155;
 Mon, 20 Oct 2025 15:20:00 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3ecdf2b1751so2454007f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 06:20:00 -0700 (PDT)
Received: from localhost.localdomain (host-78-149-11-196.as13285.net.
 [78.149.11.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3c65sm15267835f8f.15.2025.10.20.06.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 06:19:59 -0700 (PDT)
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
X-Inumbo-ID: 7b341866-adb7-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1760966400; x=1761571200; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5IaBFRI0HVSt9Cq5uv5vfSGl7wjiSLcV7S1/pivoqT8=;
        b=V1nTgH1UPpA7t5WmZ5djYR2payyQ1E93XWE5c2wbD7lF2xZS2y8OwG8xf62ZVNT99j
         zs8mnJIk52/qDCwc5X1jRkmyzOYrH5MEldhR1u/yPqxKx8S2ivf97RcFb7di5GHCGA1D
         ZcoyiIsmq5Dd3I+uXEZEg5fiztDBEk0vmtppM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760966400; x=1761571200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5IaBFRI0HVSt9Cq5uv5vfSGl7wjiSLcV7S1/pivoqT8=;
        b=ZBxCD9AVh+K+BSVk1O86lnohCwxiLn2YQB+Mo0W6OYGUEud4vXoDRZjswpv2l7b7my
         0GZBW7SymsOFCbxePevwdl7kJPzQ4z6BaeJCUcU9uHBLUcWlcv1jIkwx7kJ26rFUCCeo
         zzSH6NH3XSk2izFGFQ9c5pgEqfEPxAoTFk7SwcVDvkJ7E7EFSJWCPWcutaOwwGXjbNwo
         4QP/vt6q6IoiRp06smtbkBpmOx/QTXOniW5uT2fpzaDoekJ4NBIcay7D/djjjencsBdV
         EgmBRMTAKz5npywoaoI3a4bHTxIxHKGub39kV+DwU3O/bl2AyJyyw7q2u7Su9DeAg1v6
         vH+A==
X-Gm-Message-State: AOJu0YzPuofWjhLtc1sJh1+bRcGqZo8Kr+1HasWT+QkyM6Ik+nQb4h3H
	8rFs2usZ7NF6tnT7Ee5R2wkuwSM4D0BOYcbtu2lPh2qPPLCAAF7ICauOujKwZZrU32x694NNtB8
	Fp730zhU39g==
X-Gm-Gg: ASbGncuYDpWij9Z2Snfgyc7fA1QXwRcW08lF7OCeS36lXtZc+4T2wcsIsCCMqJXBUgu
	HZUPgVYAcgnAtIsE5JotYhztHvAAgXH6Td7qw/7PMVjGZXZqO9fyV2qiqiyD/EhiHiK70l1YI99
	3gSNw86Epv+y0LSfgeZgiYvcRctUH+u02tOP0q6Ec81cswDWYfkWO7FAp22DL45ObttKcFQj2DX
	7zJVglOZf9IUo1qHjmclQw96d4VFN16Tm4NRJqhpuwirs1nLLmBY/21LnhCCBsc/fTeDcunAhJ1
	6H0OuUqlSIYOO7aGZiDuD5nCa0rMUO71A019huShx72zzEKzXqU5pIqca17O4kq4P3lg2DtteDS
	0skH+HvylJl2yH1fUSQZWk4rinjn6WW4bGImYtwYmkQFGw7baxvOPwoTmkeLGBtqZZY4dBM7Npg
	Oas9jVDcYAFSHRXak2A1hX1BTbZGT98tkxn6yifeysfs9Codx1Za0=
X-Google-Smtp-Source: AGHT+IHx1GeyO8rjU1V8kZEzdPKeU0qqteQ7aCBYV6w53GJoxF6XaUjSjS+wLyYPa6m4TIicLBzB4g==
X-Received: by 2002:a05:6000:22c6:b0:427:15:ff3b with SMTP id ffacd0b85a97d-42704d145d4mr8830013f8f.13.1760966399907;
        Mon, 20 Oct 2025 06:19:59 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.21? 0/5] x86/ucode: Support loading latest ucode from linux-firwmare
Date: Mon, 20 Oct 2025 14:19:50 +0100
Message-Id: <20251020131955.2928261-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

linux-firmware now contains microcode signed with the new signature scheme.
Xen currently refuses to load these as we've not updated the digest list.

The plan was always to stop using the digest list in due course, which is what
this series does.

Patch 1 has already been posted and acked.  I included it again here for
completeness.

Andrew Cooper (5):
  x86/ucode: Fix missing printk() newline in ucode_probe_amd()
  x86/ucode: Abort parallel load early on any control thread error
  x86/ucode: Refine TLB flush fix for AMD Fam17h CPUs
  x86/ucode: Cross check the minimum revision
  x86/ucode: Relax digest check when Entrysign is fixed in firmware

 xen/arch/x86/cpu/microcode/amd.c     | 145 +++++++++++++++++++++++++--
 xen/arch/x86/cpu/microcode/core.c    |   6 +-
 xen/arch/x86/cpu/microcode/private.h |   2 +
 xen/arch/x86/flushtlb.c              |   3 +-
 xen/arch/x86/include/asm/flushtlb.h  |   5 +
 5 files changed, 151 insertions(+), 10 deletions(-)

-- 
2.39.5


