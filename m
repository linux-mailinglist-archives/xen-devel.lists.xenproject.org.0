Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A24019F88BB
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 00:56:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861543.1273510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOQMZ-0000eH-58; Thu, 19 Dec 2024 23:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861543.1273510; Thu, 19 Dec 2024 23:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOQMZ-0000cb-24; Thu, 19 Dec 2024 23:55:27 +0000
Received: by outflank-mailman (input) for mailman id 861543;
 Thu, 19 Dec 2024 23:55:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Om7t=TM=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1tOQMY-0000c1-A7
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 23:55:26 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b763e244-be64-11ef-a0d8-8be0dac302b0;
 Fri, 20 Dec 2024 00:55:25 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3862f11a13dso106700f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 15:55:25 -0800 (PST)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8a6dd3sm2628996f8f.96.2024.12.19.15.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 15:55:21 -0800 (PST)
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
X-Inumbo-ID: b763e244-be64-11ef-a0d8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734652525; x=1735257325; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R344QuDchp2T4urLkcV5o0R8WnBSuoK+n3GnVVOAnuE=;
        b=MKJIhEEXEMjQk78+JDxD7r6yCbJ6HDFJvL8yApzbpKkb/7XgPLKWQ4bR68/P+Nghm3
         1stuNNyz4mV/NsE39O9thHfa3ul7uQRBpZnz8alXJam6OrXuKbR3wIsULYxUR/VmvJlH
         QE6xeQWrvTzmjmrZr6r8YmObZUq42WjLBxsnI8dMYmZ9ByUvuAS4zWx8gJzaLZDUC7RO
         WYQS8ZQyP5AVfs6iP402915UoNJnxLuIuhnohiXrQNSTkRC/ZtKIinNK/pDtZEl8/zhT
         IZlnQ/jsJdFyeHkHiCuCTw0nM02Q39OlOOFCsCNnjpyYY1uvnI32VBxRh17YSpB7boW3
         Pfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734652525; x=1735257325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R344QuDchp2T4urLkcV5o0R8WnBSuoK+n3GnVVOAnuE=;
        b=gcLSmR0NOde/bFX1FvtIjJP+IB+gf9uqG7RIX1CvNI3ST7lUM4ExXZJzG153SUNLfc
         gXHOn+Jz0pjgedI/DYQGONv3wTFCdoChMrx2NS7Unv8ZSsSt1WTBetNIcknOoqS3wSii
         aQYb/G2wr8FJbIuoS3j8DuqQaorrv+xeFTg8eoqUTQUpf2Ec4zBNw9KqWYxfZG1Kpmp6
         af2qTDTgWOJosSmUfQv/RqfCvksDY0n1GfbSBC49BkmTVdyvcQJBGZPGypG81g4U1IMg
         D4EnMwtJZVAA28jIOzySG8myteFHXa+M5VNyeKusERnAe4h9Ll+6fmb1yzRUs1/RvVBp
         Hgmw==
X-Gm-Message-State: AOJu0YxOBI8f7AJ1I+S8w3ZP1aheXcJnSBMaOxV5VQ0Q9v85JAe+y8pQ
	kiuagIA7MXdWEY+0IxXr364es0XSFf8rokuAwchS7AW7wiOAMDs4YMIGQg==
X-Gm-Gg: ASbGnctbz0otx77j2GoxCeEODbznQNrf8V+31zkYxJZO0HJ3W5YAsQYF5gENAk2yBq1
	o2rOJsKvUe+uD78ffVMlbRPovryP5NUTAdaR2WEkbm67BDL3Z6M8OLEKc9chf7Nh2GW2fdu4KUF
	RSZ1IrjNQ2zeruyWF39j6gV5oeJ1XoQY6GrztXiPQTho7a5mkkkiNlbQxqodNTtUjWwNV5Kjekc
	xMT/hQBah3EuCsH/gxM213lsOqfSQqdpYkjPlf5b/4A8J35ntFZdk0Xxz8M7UxI0eWNsuAk5PmM
	ScMbo483xjO9xnzbA2XKG+xMLWGAh/sBWAgn/I/ZXtvi1UnyL4V9PUSR
X-Google-Smtp-Source: AGHT+IGMAvQQlpb3pXPTVIMpPYz3tMugaW0YO2HTh+q1S2+CAHasQgYWxTPEhvmUpCFPu57koazZKA==
X-Received: by 2002:a5d:6487:0:b0:385:de67:229e with SMTP id ffacd0b85a97d-38a223f74f7mr240619f8f.11.1734652523093;
        Thu, 19 Dec 2024 15:55:23 -0800 (PST)
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
Subject: [PATCH v2 0/2] x86: Add Support for Paging-Write Feature
Date: Thu, 19 Dec 2024 23:55:00 +0000
Message-Id: <cover.1734652343.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Changes since v1:
- Added signed-off-by tags

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
  x86: Add Support for Paging-Write Feature

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


