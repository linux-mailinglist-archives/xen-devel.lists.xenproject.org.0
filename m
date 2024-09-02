Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1330B9688EE
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 15:33:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787948.1197395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl7Ar-0000he-Kf; Mon, 02 Sep 2024 13:32:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787948.1197395; Mon, 02 Sep 2024 13:32:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl7Ar-0000g5-HF; Mon, 02 Sep 2024 13:32:53 +0000
Received: by outflank-mailman (input) for mailman id 787948;
 Mon, 02 Sep 2024 13:32:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qspk=QA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sl7Aq-0000fj-9y
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 13:32:52 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da1521dc-692f-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 15:32:51 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a866cea40c4so485748166b.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 06:32:51 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989196975sm562333666b.135.2024.09.02.06.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 06:32:49 -0700 (PDT)
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
X-Inumbo-ID: da1521dc-692f-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725283970; x=1725888770; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I1EQz+Bh/zIdTksmTIYlFFjGCJNCzD5NEDhhU2acvzA=;
        b=cve2PdZUnqBiIRz09mzbBRA0n5NAb03N9ah1K7Tlp+kobDgYYOCtZ9OsEGXDDaX4yE
         BsF44YbZVSy2mspIVSJnAbhg77ua07i6VECGFeJq/9++PzMVdFnFHIqD6gH+fz1WFBiN
         tDpZarZ63ZYE9anhnrZrzRhodbRIiT4Yo81Tk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725283970; x=1725888770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I1EQz+Bh/zIdTksmTIYlFFjGCJNCzD5NEDhhU2acvzA=;
        b=YwcZ3HRSbH12lerQ1NHPFp20n11RJOTSskwODcBwDaUQVyaw7DO4lV2otoJjKG794+
         hn5b3JAB8lldC7xlvgFTg8ug09edlRlmsSMf48zaJ2ESYhPD+U6zkYzf8dr0Yq7oqqgt
         Sh2psxqz6HpbpyqjY84FaIl8/XLhBoGJJhOnvUdZitdR5ulEa60OyudkXtAi9Sfjk6Ly
         Q384bHJMgwjRXAb50/Eakv2K2Gj4Vwa3qY8ujXEEhmdWbxFUCbAuZE0QuMwY1PmJZt6X
         odSYkc6Ji4VAZ2l2Bh0NtR3HnPsOEv28UeigYuAd4+j1JkZb4OnOPGiI+jBQhdxfO/KM
         WRSQ==
X-Gm-Message-State: AOJu0YxO+rSnUjdpd6/zvpQEThV4h44NFPK9jZwOpEWbpEclO96Qhn+U
	t++CtArSu2oeafROyeFEecgWigP8Dwmywo6A0urjbh4yq9VJU59tcrvOHjjHMMRdb8XmELHnkK0
	m
X-Google-Smtp-Source: AGHT+IFzlcY1LHel0ItFhrDpvMs8DzWqskTqMcOJzz56Yozm2J+JdSn7/hYzkgkzGuXNXurXPFVN4w==
X-Received: by 2002:a17:907:9490:b0:a72:40b4:c845 with SMTP id a640c23a62f3a-a8a1d4c36b9mr13352766b.51.1725283970051;
        Mon, 02 Sep 2024 06:32:50 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>
Subject: [PATCH 0/4] xen/boot: Remove defs.h
Date: Mon,  2 Sep 2024 14:32:28 +0100
Message-Id: <20240902133232.3302839-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patch 1 posted in isolation before.

Patches 2 and 3 complete the removal of defs.h.

Patch 4 doesn't work yet and needs further debugging.

Andrew Cooper (4):
  x86/boot: Use <xen/types.h>
  x86/boot: Use <xen/macros.h>
  x86/boot: Use <xen/compiler.h>
  x86/boot: Use fastcall for 32bit code

 xen/arch/x86/boot/Makefile  |  2 +-
 xen/arch/x86/boot/cmdline.c | 14 ++++++---
 xen/arch/x86/boot/defs.h    | 63 -------------------------------------
 xen/arch/x86/boot/head.S    | 15 +++++----
 xen/arch/x86/boot/reloc.c   | 26 ++++++++-------
 xen/include/xen/kernel.h    | 36 +--------------------
 xen/include/xen/lib.h       |  2 --
 xen/include/xen/macros.h    | 44 ++++++++++++++++++++++++++
 8 files changed, 79 insertions(+), 123 deletions(-)
 delete mode 100644 xen/arch/x86/boot/defs.h


base-commit: e884903ec56be8b0cc658cc5ba7c1cb70f25208d
-- 
2.39.2


