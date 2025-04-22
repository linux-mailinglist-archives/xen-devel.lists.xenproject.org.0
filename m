Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62863A9677D
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 13:33:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962486.1353692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Bs6-0004A9-Qs; Tue, 22 Apr 2025 11:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962486.1353692; Tue, 22 Apr 2025 11:33:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Bs6-00048f-Lm; Tue, 22 Apr 2025 11:33:02 +0000
Received: by outflank-mailman (input) for mailman id 962486;
 Tue, 22 Apr 2025 11:33:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9r0M=XI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7Bs5-00048Z-Br
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 11:33:01 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f75dce3-1f6d-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 13:32:40 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso37840495e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 04:32:51 -0700 (PDT)
Received: from localhost.localdomain ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa420837sm15138139f8f.10.2025.04.22.04.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 04:32:49 -0700 (PDT)
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
X-Inumbo-ID: 7f75dce3-1f6d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745321570; x=1745926370; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jpTKQttLiBHNEDZW3APbDimIwb5bokk8sMguz82w6ms=;
        b=M9xQ7vs83EkJ/p1UEvgYNDQ5Oduv7wkyU5tUaXOPZV7muE5opDEfLa5xt78SBJlO+o
         Ui32VNN9FzoBkPnoUaT+Ww1RfExiwD5uJFKKBNxoaWjE2wc7VBn343r4RNgueCD23+YN
         k0N29s5NTDs6xtM/VccD0iamMdQlaKsS6sjv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321570; x=1745926370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jpTKQttLiBHNEDZW3APbDimIwb5bokk8sMguz82w6ms=;
        b=G5IcwVauR+V4zGmCdpTGQPtcyD3NixIfmfaQNQH7NDZHoMfOAIjhUCRVhqT61xeDai
         bHhNdnXarhwGSIh12S2diRG539tk35IwQbEEI8x1Yu1JOXOPEzBHrZO7+kj3GpKWOZWI
         MFcsel0bsf6KPyA69GyZpUXLiX30SrksF18kvzX3tOCDPhTc2cipqqdXVbpyrMN7dk5/
         eHvNUXMmW1wlGHxyh/Nv4XYzSktzyhuqHw67zYvp0s+A+uV1XIS+Mh1zMM96yGBZcM7P
         Oj/tMYKqGhKXNTC6+AdJMcKXH9h4ax8FHr6llnHYZzVTpDrp0i5lg+HsHBfMG5hJaEtu
         g7ew==
X-Gm-Message-State: AOJu0YzSp1EGIpbJ5JXYRtGcqsLHu9jb9JVmVMRoPcHEQ9j5n3eqScsQ
	FXtPAR6KWCSTcCp2QMnbchiorBXViBV0kp0luJJdsVLFhzL7e4emHaE2d8KCY3i+zi9kf+c/POk
	NeASQNQ==
X-Gm-Gg: ASbGncuRN0/2N3y22MX/6AoUGJa0dL2760+zgFiIvP8y7RvGJRlV51RDZff1QEkTmBe
	meIiQc37aGSx2Lifo6pEPJza94n4VaV07vQOitzKNL0NHNk8hR79WRoYJfgo729QMcwj7PR5emR
	CqgSXeHoFtgMPfq0nsu9YTBtNh9E+R9ImJmC0eP1b2zXwpAZ8thPEn9gE76X2PcYA3X4v8hqC3H
	zblMTpOjZCo8bdUdQFphWfLde9h6NEkkuTb0wQjV86NrvcC9MdMP6Thfh8gZ69ut/vcpW2KfrrP
	/qwmH1+E7naTh/ENi7sYu79eiBUxNC1n2JfM4bBMO5qukvqO7yQnkxXH+EAGiw==
X-Google-Smtp-Source: AGHT+IEHB7DQNU06KK65+/JOA++i3WFvjLEGq5NuQ05z5O5lxmRUsa04T5POqrW5ysiX4SEErh9Zlg==
X-Received: by 2002:a05:6000:144a:b0:39e:f9e8:d083 with SMTP id ffacd0b85a97d-39efbb05a20mr12020177f8f.50.1745321570274;
        Tue, 22 Apr 2025 04:32:50 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/link: Include .debug_str_offsets in DWARF2_DEBUG_SECTIONS
Date: Tue, 22 Apr 2025 12:32:47 +0100
Message-Id: <20250422113247.1285339-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Building Xen with Clang-17 yields the following warning:

  ld: warning: orphan section `.debug_str_offsets' from `prelink.o' being placed in section `.debug_str_offsets'
  ld: ./.xen.efi.0xffff82d040000000.0:/4: section below image base
  ld: ./.xen.efi.0xffff82d040000000.1:/4: section below image base
  ld: warning: orphan section `.debug_str_offsets' from `prelink.o' being placed in section `.debug_str_offsets'
  ld: xen.efi:/4: section below image base

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/include/xen/xen.lds.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index 16a9b1ba03db..bf75e22953bc 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -56,6 +56,7 @@
   DECL_DEBUG2(.debug_info, .gnu.linkonce.wi.*, 1) \
   DECL_DEBUG(.debug_types, 1)                     \
   DECL_DEBUG(.debug_str, 1)                       \
+  DECL_DEBUG(.debug_str_offsets, 1)               \
   DECL_DEBUG2(.debug_line, .debug_line.*, 1)      \
   DECL_DEBUG(.debug_line_str, 1)                  \
   DECL_DEBUG(.debug_names, 4)                     \
-- 
2.39.5


