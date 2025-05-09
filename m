Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE59CAB197F
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 17:58:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980130.1366604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDQ6o-0006N8-9S; Fri, 09 May 2025 15:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980130.1366604; Fri, 09 May 2025 15:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDQ6o-0006L3-6O; Fri, 09 May 2025 15:57:58 +0000
Received: by outflank-mailman (input) for mailman id 980130;
 Fri, 09 May 2025 15:57:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZIRI=XZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uDQ6n-0006Kr-7I
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 15:57:57 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5eac162d-2cee-11f0-9ffb-bf95429c2676;
 Fri, 09 May 2025 17:57:55 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5fbf52aad74so5314699a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 08:57:55 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad21947a88fsm168723766b.81.2025.05.09.08.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 08:57:53 -0700 (PDT)
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
X-Inumbo-ID: 5eac162d-2cee-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746806274; x=1747411074; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hdBFaBjxY+qxq8rNUwVC/SGZ98nsiyPPDeD8bqV1Wcg=;
        b=S243LQ4Kxz0mlNLo3peXJ3pI17QlImY+CoSP2NbaAYNEGZvAMN6eT6LqryjnTFdvgi
         EL/m9wQ4B2oRVS4ldWQR34Li/TqZXKF9v1EWFyliG5JbQAUxEFsaoCzIkH5qPWFudLLc
         Aki5eojX1k5CcANa6On1vVALKny9yS0r1oFwezoZw8das7BgvJ57WKqzMemglRB9wn3N
         ij/xNKvniVH1imJoLcqhr7L4EvzAxZb3sTnYsSSX93Lw0nAC2DX5CZhJKUofteE6iOPw
         ZvJx4kVBZ146TMXsICjbRMNe75U1PwIi28k/2B1ONeDzaGWW93QXl4ZJbSG3EE2VdUjS
         Kgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746806274; x=1747411074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hdBFaBjxY+qxq8rNUwVC/SGZ98nsiyPPDeD8bqV1Wcg=;
        b=d3R74QURJRfRDEWru8DBpgoMFEIEzWn2Ln6OBzlLEcNOPvLunqzbUL+CpzHvE8HL3z
         5SXsEsBnAazfoLdJBzpgv6Ow5KLbNzHHeLlNgtGYiK+/7+bUJorMfak696UKqEST5idI
         UwHxCwV/+xRK2JfHgryuXbkYF4xACrVlKwR1WBQA6I7tugMc5u7F7mtOpzl9mLGjlGgD
         NqLwCFCWJMGqgXqaeJUH/pQbqa9ijk5wOzqQwHIVwzWo3NL/0ZfsQcvhCj5HsnquAKsB
         BWTiFPzd1pmqtroskmBKBDicaOIYkboUbvqz/3Ucwrn3cACmubuW+plKqJKglLjop9o/
         Jx2w==
X-Gm-Message-State: AOJu0Yz0SPgXpBtKzBVOBHuLJu/0TaKsKHm3PnJMlsp0WF7d+xt9h4eQ
	5/niVojGbQ2b7aS3laq35yqS2PycxiWtJH6ydypOGZfNuvmxpw7krJy+Eg==
X-Gm-Gg: ASbGnct7Hp6l1Ngw4JwHTLa6mOuv5L3v4qEbqj6g6+u35fziFkGLtBckY+WEODSujLI
	+re3lA2rHba0FulvFibRjnedYubihVEPd6FSAF0AqD/3Q7+Vgo8q44uAHoa6D3W1ndZq+eO1NEM
	2LFErCSH909gZVYep1GBwWG541LMe6/U5v9Diqlh6Dz9uNB/PTCIwe2WaUM/oFsty4s2Pp3WY8B
	S5hdXp0nMjBjVe1yoIDJlKlFbYqxitfIlvpXmOqRm+OxurA/yg5F/tUZenxU/C+NPZOZot9Gndw
	1UIKPdEYDkOfyNqJp02geK0bNl+ErBDUYtLV6bCr8mspGcv7UJ/QlVUr59/cq8Femwi7GAJX7xn
	EhiysJ5JdxQ==
X-Google-Smtp-Source: AGHT+IEWPkUQh+9oHAHNqG7J7e7AmMoN35jhSt+vKN6nZqmfHf50OPMROWUxr/gEw3OTC8Q1bCM1Rg==
X-Received: by 2002:a17:907:1c92:b0:ac7:b231:9554 with SMTP id a640c23a62f3a-ad21b196510mr365556366b.11.1746806274109;
        Fri, 09 May 2025 08:57:54 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 0/6] xen/riscv: introduce p2m functionality
Date: Fri,  9 May 2025 17:57:45 +0200
Message-ID: <cover.1746805907.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In this patch series are introduced necessary functions to build and manage
RISC-V guest page tables and MMIO/RAM mappings.

This patch series is based on the patch [1]:
  https://lore.kernel.org/xen-devel/da9273c20dc7ac1c131322e38a8cef361dfd86a9.1746530883.git.oleksii.kurochko@gmail.com/T/#u

Oleksii Kurochko (6):
  xen/riscv: add inclusion of xen/bitops.h to asm/cmpxchg.h
  xen/riscv: introduce things necessary for p2m initialization
  xen/riscv: construct the P2M pages pool for guests
  xen/riscv: define pt_t and pt_walk_t structures
  xen/riscv: add new p2m types and helper macros for type classification
  xen/riscv: implement p2m mapping functionality

 xen/arch/riscv/Makefile              |    1 +
 xen/arch/riscv/include/asm/cmpxchg.h |    1 +
 xen/arch/riscv/include/asm/domain.h  |   16 +
 xen/arch/riscv/include/asm/mm.h      |   36 +-
 xen/arch/riscv/include/asm/p2m.h     |  121 ++-
 xen/arch/riscv/include/asm/page.h    |   65 +-
 xen/arch/riscv/p2m.c                 | 1015 ++++++++++++++++++++++++++
 7 files changed, 1243 insertions(+), 12 deletions(-)
 create mode 100644 xen/arch/riscv/p2m.c

-- 
2.49.0


