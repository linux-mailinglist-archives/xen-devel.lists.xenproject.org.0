Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C069F830C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 19:17:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861431.1273381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOL53-0007al-Uu; Thu, 19 Dec 2024 18:17:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861431.1273381; Thu, 19 Dec 2024 18:17:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOL53-0007ZD-RR; Thu, 19 Dec 2024 18:17:01 +0000
Received: by outflank-mailman (input) for mailman id 861431;
 Thu, 19 Dec 2024 18:17:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Om7t=TM=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1tOL52-0007Z2-Kq
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 18:17:00 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 702bb5d0-be35-11ef-a0d8-8be0dac302b0;
 Thu, 19 Dec 2024 19:16:59 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3862f11a13dso65861f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 10:16:59 -0800 (PST)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8ac93csm2089713f8f.95.2024.12.19.10.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 10:16:58 -0800 (PST)
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
X-Inumbo-ID: 702bb5d0-be35-11ef-a0d8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734632219; x=1735237019; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l4LKRJak7JgaW1Ee5afpTsgw3p3Qau2b0vog00+IaPg=;
        b=fp3R1c01s1ipdqfsYgUL09dOdMFwBGZcp/Yu7WdDgJwHFV5oDNikqz5jHH81qe/Xxv
         Zacl5ABz2uz8Gd1j8Dj4974JcjeOHYRQIECBqAjhA5t3NJQKuCkFXcyZac4tlgPXSTUm
         P/xGDsJ+aftbS2e1UnCT6X51o3V6IMOXCrinQ8fYU+0YUkeF4Szeo9cQ0kT237Vxxlvu
         GYJqCHiGTJB/smMgAuk7TIpWwI1Z3X7Jgnx/QUzTohW+xm2mUF9Znb8F2y3mNJD3aU2y
         pWyd65i5t2t3qxsKgrygPr4JpHTr+pcCeKJoK/BZQoyt5dW9vDGseN3eQ52eXSUVmvDm
         TgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734632219; x=1735237019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l4LKRJak7JgaW1Ee5afpTsgw3p3Qau2b0vog00+IaPg=;
        b=e6giEniiIsly59YCLtWKALN2CJzITFWtPyYj8CBtKQFmsZCvsDtHj+O1N+ST0m1XOj
         iQOcgfAf4LxV6hqrT0PuA3hLVr+C6D+kukwsdpsV8I/uslD3wiUdojzGBm8/itva+qal
         CfGZFv/y+cpaxoHwa3t1JfsiJWRbZj19m782tmMXlyEclMm5feeY6Za2xq6sKwxQcJLO
         SKALDbc4CRqcFnYDoIzCS4Cba1KB2BAhD/+2fo+pPtp2w+z4v9kQ617kwZQlmBaWe8re
         15NwRdZqcXaOO2wL2OmbQCWrMyxj6eoh5DqEJSJI+EBuZsteAXnUlppgcRU5+xAzLGL+
         t4rg==
X-Gm-Message-State: AOJu0Yz2uHW6MP5YgjhjYFgfc2dtZRy4YNj/vsyzJ9pM99SlNJQMZ8dB
	d1OX7+rhb8yg6D3Q+01Hbu0Qo6A9QQGfMnFJlD1z+Wgk0wg4TYgeTyBong==
X-Gm-Gg: ASbGncv0IdL9Jlx4kLbgu8TMu/vRO3gAqOhwsPrhFaFR9fJys72WuoCCs7eQvZ80vND
	pnZbDKANqKwTsb+uY6bQzOtpg71yVP1MglWIqbvM2ZNIcMTYtcnAg8NUMNt9pIz/RRXWFILUY97
	lrS5uap5s6R/E/cczAeA5BBeKnKBdkSQbVfWlRF2MH0jvjNUSUcxsjcyVAFJMn5BvAJIumxUO7K
	G2I/8dnv3UFzHPFFn2OKS/gRpO1eeEPLJxOHfOPqDvWLGDM/UMZtVPJS/SuSt96CbQidC0OSab5
	kg1Xlyf3Do2Ik8EQAzyYp78k77zKwiueUyLu2p7kDl5LzwFDTrrc03x4
X-Google-Smtp-Source: AGHT+IEBH2Iy2i8mC8lK9kMsZD8IIVnupvhGnHC7oAkQLKPT/UepIk8gmf748Gnr5HgQOn+mJ4jC2w==
X-Received: by 2002:a05:600c:3d0b:b0:436:488f:4e4 with SMTP id 5b1f17b1804b1-4365540ef7emr31660585e9.8.1734632218430;
        Thu, 19 Dec 2024 10:16:58 -0800 (PST)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 0/2] x86: Add Support for Paging-Write Feature
Date: Thu, 19 Dec 2024 18:16:50 +0000
Message-Id: <cover.1734631969.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

This patch introduces a new XENMEM_access_r_pw permission. Functionally, it is similar to XENMEM_access_r, but for processors with TERTIARY_EXEC_EPT_PAGING_WRITE support (Intel 12th Gen/Alder Lake and later), it also permits the CPU to write to the page during guest page-table walks (e.g., updating A/D bits) without triggering an EPT violation.

This behavior works by both enabling the EPT paging-write feature and setting the EPT paging-write flag in the EPT leaf entry.

This feature provides a significant performance boost for introspection tools that monitor guest page-table updates. Previously, every page-table modification by the guest—including routine updates like setting A/D bits—triggered an EPT violation, adding unnecessary overhead. The new XENMEM_access_r_pw permission allows these "uninteresting" updates to occur without EPT violations, improving efficiency.

Additionally, this feature simplifies the handling of race conditions in scenarios where an introspection tool:

- Sets an "invisible breakpoint" in the altp2m view for a function F
- Monitors guest page-table updates to track whether the page containing F is paged out
- Encounters a cleared Access (A) bit on the page containing F while the guest is about to execute the breakpoint

In the current implementation:

- If xc_monitor_inguest_pagefault() is enabled, the introspection tool must emulate both the breakpoint and the setting of the Access bit.
- If xc_monitor_inguest_pagefault() is disabled, Xen handles the EPT violation without notifying the introspection tool, setting the Access bit and emulating the instruction. However, Xen fetches the instruction from the default view instead of the altp2m view, potentially causing the breakpoint to be missed.

With this patch, setting XENMEM_access_r_pw for monitored guest page-tables prevents EPT violations in these cases. This change enhances performance and reduces complexity for introspection tools, ensuring seamless breakpoint handling while tracking guest page-table updates.

Petr Beneš (2):
  x86: Rename _rsvd field to pw and move it to the bit 58
  x86/EPT: Add Support for Paging-Write Feature

 xen/arch/arm/mem_access.c               | 4 ++++
 xen/arch/arm/mmu/p2m.c                  | 1 +
 xen/arch/x86/hvm/hvm.c                  | 1 +
 xen/arch/x86/hvm/monitor.c              | 1 +
 xen/arch/x86/hvm/vmx/vmcs.c             | 4 +++-
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 3 +++
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  | 4 ++--
 xen/arch/x86/include/asm/p2m.h          | 1 +
 xen/arch/x86/mm/hap/nested_hap.c        | 3 +++
 xen/arch/x86/mm/mem_access.c            | 3 +++
 xen/arch/x86/mm/p2m-ept.c               | 4 ++++
 xen/include/public/memory.h             | 9 +++++++++
 xen/include/xen/mem_access.h            | 6 ++++++
 13 files changed, 41 insertions(+), 3 deletions(-)

-- 
2.34.1


