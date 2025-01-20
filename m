Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F18A170DB
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2025 17:55:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875026.1285360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZv3A-0005he-Ka; Mon, 20 Jan 2025 16:54:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875026.1285360; Mon, 20 Jan 2025 16:54:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZv3A-0005fT-Hn; Mon, 20 Jan 2025 16:54:56 +0000
Received: by outflank-mailman (input) for mailman id 875026;
 Mon, 20 Jan 2025 16:54:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1xfr=UM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tZv39-0005fM-MT
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2025 16:54:55 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 453dd124-d74f-11ef-99a4-01e77a169b0f;
 Mon, 20 Jan 2025 17:54:53 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-30225b2586cso53775291fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2025 08:54:53 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a35aec4sm16581501fa.56.2025.01.20.08.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 08:54:51 -0800 (PST)
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
X-Inumbo-ID: 453dd124-d74f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737392092; x=1737996892; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2wmguJZGAmdCa6h8C+hITCEE8sE0M2/Z9lgrMQrF6jo=;
        b=c62LsOP8QSFLIQswVJn5PJ32ex1tPJ9YktnMGjYOMGEoi/ykndE8jCg9EzI8tOBapv
         80zDoi8DuX488+SR5BvF7nc/Nv8gRhb6mhuMsceY5uyFuGC2AVhZyxvWDx+lRPV78FR2
         6PyHMGtk+5PqZEHpbgX4ac20HgjfNoE4kkxJHkqPPHw7Qp9+E90Asqy3Zw+Iq0hefLI/
         2NFpZOBRk2MTzD6WDMjuA6C3AsJwNYW6UR/wqV7J846f7OUE++VKuwxLwoYJrG55Jq4d
         3ZnSWqCKHb16yujrylrCSMhcWqg65/K4ExCLfI6lmUNdeVhL9mRNWodcHV9GJzt2JTbY
         FcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737392092; x=1737996892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2wmguJZGAmdCa6h8C+hITCEE8sE0M2/Z9lgrMQrF6jo=;
        b=T2O0Us09APZHHAAsEtXZ9d4YW0cyHxPAoJUNzRagfnB+grtszr4qvk7TCJky5jzdO2
         zivR4YWHCQBmhQqA0fk8XFdkqQXfaqUYzHrTgssolJ8y8VHH/3PvGtv26sVM6eLioeZo
         73tjs8X3RPHM2LhtDbpKeRPUWa0wdIXy+SdtBbhy5jIPOnc0R7aVHUHTjQuj+/9yxuPg
         PmsbOKUM97T/QMfoS6+q4ztzPnqC4a5AaBvU7ZyvUrkr0JrDfpRmqcZOopbcCLGNz/TO
         g63Ls1M5T2O2HD4hydQA+y9mwlltYPCHODZ+WUmvqpWMwfdMH7ENgs+W/OjcdahY8K35
         YUfw==
X-Gm-Message-State: AOJu0YxxPkL/CBRK8XZBzJrgSmUqSasY2ruF9WrgOwELEXEJjnIoveKE
	u5zbfIaKxipHkT9TYywZmvqTZ/x+6Ow8uYWuZEEd5+x0T5FOosXE6f/CIw==
X-Gm-Gg: ASbGnctlOe1xjGYZME/hwBd0q7j+54TUs7qvbx6OV6lF8AxyRDRSQsT1BBCWgNbeKZ7
	0hzDSKa3saGhV9WHwezkudj4hIsysNcCqMEAccp7gA1QJQePwsrRpBALQ/1vSbOsPxi1xirxMLr
	W0jJkkh9d7tjcZm5f77j7w86zEAwejcIYdv73WFEeVeJjFpWJx7hvBghXzS12KxDOiO4jnELUWM
	neScDNKAUH9y+ODAYFN7aJjsuLusTvlJA+4S5Bd00mRC2C8wRqJkPUiHuuCsNJfWpa7UwE=
X-Google-Smtp-Source: AGHT+IHS/he8PSwbOJuVFJ4wvA8HOKfU67IvvWM2roebx+FbhzRiGY4cH+9P/bHOXHLBjKmCoYw7OA==
X-Received: by 2002:a05:651c:118d:b0:302:23a7:1ee8 with SMTP id 38308e7fff4ca-3063057702fmr67983861fa.3.1737392092013;
        Mon, 20 Jan 2025 08:54:52 -0800 (PST)
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
Subject: [PATCH for 4.20? v1 0/3] Fixes for vmap_to_mfn() and pt_mapping_level
Date: Mon, 20 Jan 2025 17:54:46 +0100
Message-ID: <cover.1737391102.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce pt_walk(), which does software page table walking to resolve the
following issues:
1. vmap_to_mfn() uses virt_to_maddr(), which is designed to work with VA
   from either the direct map region or Xen's linkage region (XEN_VIRT_START),
   thereby an assertion will occur if it is used with other regions, in
   particular for the VMAP region. The solution is usage of pt_walk() for
   vmap_to_mfn().
2. pt_mapping_level() returns incorrect page table level in the case when
   mfn==INVALID_MFN when, for example, VA was mapped to PA using 4k mapping,
   but during destroying/modification pt_mapping_level() could return incorrect
   page table level as when mfn==INVALID_MFN then only VA is taking into account
   for page table level calculation and so if VA is page table level 1 aligned
   then page_mapping_level() will return level 1 ( instead of level 0 as VA was
   mapped to PA using 4k mapping so there is incostinency here ). The solution is
   usage of pt_walk() to recieve mfn and use both mfn and VA for proper page
   table level calculation.

It would be nice  to have these fixes in Xen 4.20 but isn't really critical as
there is no any users for RISC-V port at this moment.

Oleksii Kurochko (3):
  xen/riscv: implement software page table walking
  xen/riscv: update defintion of vmap_to_mfn()
  xen/riscv: update mfn calculation in pt_mapping_level()

 xen/arch/riscv/include/asm/mm.h |  4 +-
 xen/arch/riscv/pt.c             | 84 ++++++++++++++++++++++++++++++++-
 2 files changed, 85 insertions(+), 3 deletions(-)

-- 
2.48.1


