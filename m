Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 575999BEF50
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 14:43:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831076.1246232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8gJp-0006Zo-Gn; Wed, 06 Nov 2024 13:43:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831076.1246232; Wed, 06 Nov 2024 13:43:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8gJp-0006Y0-Dd; Wed, 06 Nov 2024 13:43:33 +0000
Received: by outflank-mailman (input) for mailman id 831076;
 Wed, 06 Nov 2024 13:43:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6nbp=SB=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t8gJn-00061k-SF
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 13:43:31 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b4c4cf7-9c45-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 14:43:29 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a9acafdb745so182031166b.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 05:43:29 -0800 (PST)
Received: from fziglio-desktop.lan (99.149.115.87.dyn.plus.net.
 [87.115.149.99]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa6ae615sm21785875e9.8.2024.11.06.05.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 05:06:30 -0800 (PST)
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
X-Inumbo-ID: 1b4c4cf7-9c45-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzYiLCJoZWxvIjoibWFpbC1lajEteDYzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjFiNGM0Y2Y3LTljNDUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTAwNjA5LjgxMjUwNywic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730900608; x=1731505408; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iC/ssupFSJTkxCKBaHe1Umzon0/xq/exjo7F/imeSNg=;
        b=EAUNq6nw/Nz17/07Rn5yc5xq0R7xhddAoit6lNCsyzTz5QQjvHvImsEsOTKdStRYGs
         Oiws2ezk5G2RW4Siu/+6c17Hf0w2W6qxsoxa0RXB0r/o6Lp7xmmXEb7KD5Tx0ynS7Yib
         MTJlhh7v6eNH5RZlwfnb82YykKW+iTtit2KgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900608; x=1731505408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iC/ssupFSJTkxCKBaHe1Umzon0/xq/exjo7F/imeSNg=;
        b=ek95aqTbYrzrn3QLwZ0GenhqZa3WaSkYsBkZGOZPmx68MfcGSCXS0xisRr59wPtYmR
         y/Dq21w3pihEJ1gG4oj6egXSBBRt/Gg8DYAcm9hFw9rF9NHwS/DGqev6emm10BPyERXw
         2i6oSpO5PrR/Jm+lN4ylMiICCR724ypin7gCHTIvg2HD1rCrsauw2jvSE+YUetJKXhtM
         Sl6Gq8jwtc9aBZNYU821wFsXRi/cwOrUVxDVHYZ3py+98XCpEZsBIU8AnZ31a0V5TLy3
         L7sddAPQEF11ElatU4o0QhdF2ga7908EhQP/4L9Ow8FwI69E5Piw84XWkI1YXeFsSnNw
         inyg==
X-Gm-Message-State: AOJu0YwTA0anN9gUIbOg58FBVIjeC2V4LrdhJbJEYc9GnZgSQ+8K8c5r
	TlN2JaiS12FkDI965UsR6UGagGVzF5BNiFrGS9SY7S6I0jB8ewD3Xq3+YtsZ+EHmHC91AoZnk9k
	sL7Q=
X-Google-Smtp-Source: AGHT+IEENntri2GwURKmd0G7AZsIiYX384VHLbSgMbsVrqloeuvfhgfJSThdcXYnsWD/hYuXD7pGdA==
X-Received: by 2002:a05:600c:1553:b0:42c:b98d:b993 with SMTP id 5b1f17b1804b1-432a9a74e90mr22612125e9.2.1730898390871;
        Wed, 06 Nov 2024 05:06:30 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 0/3] x86/boot: Fix build with LLVM toolchain
Date: Wed,  6 Nov 2024 13:06:17 +0000
Message-Id: <20241106130620.1928109-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix some compatibility generating 32 bit code.
LLVM has different object files and map files.
Do not use map file as they are not standard.

Changes since v1:
- do not use map files;
- add a fix for file names and preprocessor definition name.

Changes since v2:
- address comments.

Frediano Ziglio (3):
  x86/boot: Fix intermediate file names to generate 32 bit code
  x86/boot: Uses nm command instead of map file to get symbols
  x86/boot: Explicitly list .{sym,shstr,str}tab in build32.lds.S

 xen/arch/x86/boot/Makefile        |  9 +++++----
 xen/arch/x86/boot/build32.lds.S   | 11 ++++++++++-
 xen/tools/combine_two_binaries.py | 19 ++++++++++++-------
 3 files changed, 27 insertions(+), 12 deletions(-)

-- 
2.34.1


