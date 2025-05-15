Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0A3AB82F7
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 11:38:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985049.1370979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFV33-0005a2-Cz; Thu, 15 May 2025 09:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985049.1370979; Thu, 15 May 2025 09:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFV33-0005Wu-9n; Thu, 15 May 2025 09:38:41 +0000
Received: by outflank-mailman (input) for mailman id 985049;
 Thu, 15 May 2025 09:38:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DjGQ=X7=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uFV31-0005Wo-HE
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 09:38:39 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60b03bb2-3170-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 11:38:37 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5fc5bc05f99so1521018a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 02:38:37 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad23ad2b386sm895152066b.104.2025.05.15.02.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 02:38:31 -0700 (PDT)
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
X-Inumbo-ID: 60b03bb2-3170-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747301917; x=1747906717; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ra3Af8iHOGAhRe8Msi9f22YdlWPBGx9XtxlgTPr25PQ=;
        b=Fln9s8n3Z8umh4atYd8I2nrvWcuXgagdVDoRXEH8stQ+G3fFCgCBPYGwKdZohasKSY
         E+Dgc3YyPJ8eVytI3UlGv7wjbvP5Vr8W4LTIVf0gbLWe5JXQDG/+WzwENIjDwhhnO/vF
         B6JoYebvyqHTbA+ssWm0NhlqlR5Mlmv6NP3w0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747301917; x=1747906717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ra3Af8iHOGAhRe8Msi9f22YdlWPBGx9XtxlgTPr25PQ=;
        b=aNwKxrW08Sc136jBxVkzG1qmsWhe8URC6fzx2tI0Q424Lu8b0SjB6TMuzDpl6hb1pq
         1FRubY/yYHR9yrGxfeejnQGj8OitioejHpT3Goe4EixLG4RoaZBwNK0RUb/Qmh0ayUUp
         GqcqZUUGoeIChpk/mMdC6FRWTdY7qqWFroo5DuXGKbREKRTt3wSz0lJPFnGuVpjsxvhx
         WogqjVzVbQ6pNVqAXZgbkaghhxqZ+hPYO5fdTy4bgkv4IJQDq998diK2ZkjKizE90N/X
         Lm7Y63P31RMUDi9CkUOXcjhAAUhsPyJEBZ/qLS/ad9OCIjDiYc6LjyZh0rFa9I3WXofD
         730g==
X-Gm-Message-State: AOJu0YwZNHODvhY/TBlWshCKvM9BOLqqSdmLckZJm2VQGPMXuDx5nVeH
	uGc/cTzLGQRHFmetqSvgKmwZH/VW/RjF0V0avlOFCR08okBFAUx/+dh74nqJDg6zzE5p3Ds0/78
	=
X-Gm-Gg: ASbGncv4LXw/kwV2zv4wZKmgSJvtyIENUScr0yEbBO1//bT3mE9qCDR8H+tuxmU16iT
	+tFRn9alJsZo8ZdrBrfmYAk0vVcXXAqMpuE7RufiaxoNbNCm1dsfWNwuUYq+xN1SJ4dBedSf133
	oHh5hjFgml6uQaA+bvOeNPC4xucJAqOi9JTvFQkZz836iBAKQ1o+HNp+zcMFfBZkLInnf0GEZAr
	r9TbPeJ9zos/v5ofSYhMjN/Hmtf2nIHuBtZeZ7hDiRVBRJtBgZW+Lud7yt7R/XOE3ZSd0RCJLvE
	qACM/Fu5iUKcTFrsxmRTII1mPTWO+7EXld9DF7t5yFIz7aFMGcaE+zqLBJyAM30pujDs9qyqoyx
	uRlCk+bBOwA==
X-Google-Smtp-Source: AGHT+IFGadtjS10+DB0YdgBSo3n/4vmWf5gQA3da8bQt8VFRxhYOMOmktzkr8YepWOULhidwUwnEqA==
X-Received: by 2002:a17:907:868c:b0:ad2:28a0:4248 with SMTP id a640c23a62f3a-ad4f70fb96cmr707716566b.3.1747301912306;
        Thu, 15 May 2025 02:38:32 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/5] LivePatch signing support
Date: Thu, 15 May 2025 10:38:15 +0100
Message-ID: <20250515093822.659916-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Live patch signing support was mentioned as future work in the design
document several years ago. This series finally implements support for
it since it is a requirement of Secure Boot to prevent loading unsigned
code into Xen.

See the individual patches for what has changed in v2.

Jennifer Herbert (1):
  livepatch: Verify livepatch signatures

Kevin Lampis (1):
  livepatch: Embed public key in Xen

Ross Lagerwall (3):
  docs: Introduce live patch signing
  crypto: Add RSA support
  livepatch: Load built-in key during boot

 docs/misc/livepatch.pandoc      |  106 +-
 xen/common/Kconfig              |   18 +
 xen/common/Makefile             |    1 +
 xen/common/livepatch.c          |  145 +++
 xen/common/livepatch_elf.c      |   55 +
 xen/common/mpi.c                | 1729 +++++++++++++++++++++++++++++++
 xen/crypto/Makefile             |   14 +
 xen/crypto/rsa.c                |  196 ++++
 xen/include/xen/livepatch.h     |   16 +
 xen/include/xen/livepatch_elf.h |   18 +
 xen/include/xen/mpi.h           |   68 ++
 xen/include/xen/rsa.h           |   74 ++
 xen/tools/extract-key.py        |   37 +
 13 files changed, 2425 insertions(+), 52 deletions(-)
 create mode 100644 xen/common/mpi.c
 create mode 100644 xen/crypto/rsa.c
 create mode 100644 xen/include/xen/mpi.h
 create mode 100644 xen/include/xen/rsa.h
 create mode 100755 xen/tools/extract-key.py

-- 
2.49.0


