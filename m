Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7D29B6B92
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 19:03:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828387.1243250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6D2m-0000a2-Dv; Wed, 30 Oct 2024 18:03:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828387.1243250; Wed, 30 Oct 2024 18:03:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6D2m-0000Xa-BJ; Wed, 30 Oct 2024 18:03:44 +0000
Received: by outflank-mailman (input) for mailman id 828387;
 Wed, 30 Oct 2024 18:03:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LV2z=R2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t6D2l-0000XB-BQ
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 18:03:43 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49a10237-96e9-11ef-99a3-01e77a169b0f;
 Wed, 30 Oct 2024 19:03:38 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9932aa108cso8435166b.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 11:03:38 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1e75ff3bsm588693266b.1.2024.10.30.11.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 11:03:36 -0700 (PDT)
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
X-Inumbo-ID: 49a10237-96e9-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmQiLCJoZWxvIjoibWFpbC1lajEteDYyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQ5YTEwMjM3LTk2ZTktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzExNDE4LjA0NDU3Nywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730311417; x=1730916217; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nb6McFM7jDV7KGX5nUJbpRNVXqqSWbqonW1RqwdBEYU=;
        b=pO/g6zlTYT4AlOQtKIEWMZwz9djoOc8QFBETRi/CWc9/Hx2i/LVWntctSURYFmEUeA
         tKmvCj00AksdS10oqXQzqFCZGvERE6fNEcqgfUPLUiiwDf4X9Q4NzzW1qz4sZgNK4n2J
         /Iw+Hb3dSknKucjkOPKY1jBpCI67C1umeyK/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730311417; x=1730916217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nb6McFM7jDV7KGX5nUJbpRNVXqqSWbqonW1RqwdBEYU=;
        b=MD5igr4kgps7Md8L1QtH8adzZFrR6Ok23nfue166JZcJtM2j8QhPFovqwhOezFjGsQ
         t/OHqM6udj3QB5M5XuYiGhYSbMyX4S93F+h8QnKLPRf6LTPVwL/+VfOkv6AMBht2uUkn
         lSwACixnB77doaucLXmN9xJUyEw8QnBJ8iV62d3hp9y1llPZF1ByVokIQb/Ss6qUN8m2
         FLza1k9JcT1Ty5mcmBPjqOrlWlyUuwRqA38SjyC5tnqRd7QJPn8YEqGB/MSB2uJqnFnV
         gGKVhri8H1KIbAeY1pkMU6nsa7ioGB8J0oPN1L2fzM8KM4+mqfh0eTcOI0KIS26bFlU8
         fAJg==
X-Gm-Message-State: AOJu0YwNUlqkM+FpMFFzViDHl60SvC3d3/PGZEVMcmpBW4qNZ26ZwDC+
	MOa5N9gofciZA0el5T2gOZdeKxuTJeiMeBp3DXMyw4Tkw91zF4KRtGSfoT4WmvSH9ry63tBLqKF
	1
X-Google-Smtp-Source: AGHT+IEAyP2OqI5xUptQxiME+wnp4NUI10nWUWIuu9eFDQPQyMiQObDGAAHi3TVbZ5Ue/is1JOWJhQ==
X-Received: by 2002:a17:907:2d8e:b0:a9a:3705:9ad9 with SMTP id a640c23a62f3a-a9e50b95730mr29714766b.50.1730311416901;
        Wed, 30 Oct 2024 11:03:36 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH for-4.19] Config: Update MiniOS revision
Date: Wed, 30 Oct 2024 18:03:32 +0000
Message-Id: <20241030180332.2726909-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A new branch from xen-RELEASE-4.19.0, for now containing commit
a400dd517068 ("Add missing symbol exports for grub-pv").

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Juergen Gross <jgross@suse.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
---
 Config.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index 03a89624c77f..aa3d5843f1ed 100644
--- a/Config.mk
+++ b/Config.mk
@@ -224,7 +224,7 @@ QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/qemu-xen.git
 QEMU_UPSTREAM_REVISION ?= qemu-xen-4.19.0
 
 MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
-MINIOS_UPSTREAM_REVISION ?= xen-RELEASE-4.19.0
+MINIOS_UPSTREAM_REVISION ?= xen-stable-4.19
 
 SEABIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/seabios.git
 SEABIOS_UPSTREAM_REVISION ?= rel-1.16.3

base-commit: fadbc7e32e42f1a4199b854a895744f026803320
-- 
2.39.5


