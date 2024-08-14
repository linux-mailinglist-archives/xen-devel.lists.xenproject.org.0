Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3069516AB
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 10:35:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776848.1187039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9TA-00048E-N8; Wed, 14 Aug 2024 08:35:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776848.1187039; Wed, 14 Aug 2024 08:35:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9TA-00044a-IZ; Wed, 14 Aug 2024 08:35:00 +0000
Received: by outflank-mailman (input) for mailman id 776848;
 Wed, 14 Aug 2024 08:34:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jxPN=PN=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1se9T8-0002t1-MZ
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 08:34:58 +0000
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 160e20d9-5a18-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 10:34:57 +0200 (CEST)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-7a1d067d5bbso416764485a.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 01:34:57 -0700 (PDT)
Received: from fziglio-xenia-fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a4c7e05595sm407786785a.122.2024.08.14.01.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2024 01:34:55 -0700 (PDT)
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
X-Inumbo-ID: 160e20d9-5a18-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723624496; x=1724229296; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gz57YRc5BprGPTvdYo9SU35adCn77Ws3eV4wwb5cJIk=;
        b=M7LwU/cRPzolVj+d1NoK/05YuxazJIyRsktCHWXfG8FMeuG9e7NjtKipy7UpEnG0Ob
         lidRiThI9unKGfYG0pvcE7AUTRWPqSLlVGxc0mLcPSSbpVJNuBLyGF2Xo8HQHOX3Q9cz
         8DboQc8GJ2k5faSB5h9+G6FzoHp8lFufSATlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723624496; x=1724229296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gz57YRc5BprGPTvdYo9SU35adCn77Ws3eV4wwb5cJIk=;
        b=gjbaQBWYTl35dDsJ4l+PhrJNQaLpRjaN+G5HX8vovGbOd9Xb1EiM1+562MSaY39R5r
         yNBtDE3s0AxxWGPCVhqHxv/MMUbTn7FXg2/7cgu3cVDCNYkjdZMHjrQX2TcBtySm+A2I
         CJ74GqHnroBbUp8QTAswvM9OMR+W8Dcb77dWmlYbS64cpWVULSohjsxX12zQfRlZG0KC
         nobQWCiAh9GZtVxU+CpHJAf88XIGH063yx2WrQE01oA+ZBZ3fS60g7+Gv11mptUYaFUw
         /KlK2mghN0ph5+MVsO7V1Y3c+9w91UgA8Z6FmlHROXLzxS0aKBnk196Yr6KkhfH11YAG
         y25g==
X-Gm-Message-State: AOJu0YwoYpn84edwH4UT0T+o7D1ZW5obwDcm4et1oaMlYQPvsvO5eM4a
	5QorccwcgDz0ji9HL480hn5Z2YBXPA3MhuZNdjmxgVUIYeYMXNvfQeGgZyOobaQI2l5uh9q4+jT
	y
X-Google-Smtp-Source: AGHT+IEVCJQeVFkZOhco5FcI3nGMRX2zjGWj3Gwlx3oxDXdB2Rk7Mq7EaVpIZTamEuWTOGgtNoJUVQ==
X-Received: by 2002:a05:620a:24d4:b0:79e:fbef:d23e with SMTP id af79cd13be357-7a4ee335132mr231733185a.17.1723624495972;
        Wed, 14 Aug 2024 01:34:55 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/5] x86: Put trampoline in .init.data section
Date: Wed, 14 Aug 2024 09:34:10 +0100
Message-ID: <20240814083428.3012-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240814083428.3012-1-frediano.ziglio@cloud.com>
References: <20240814083428.3012-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change allows to put the trampoline in a separate, not executable
section. The trampoline contains a mix of code and data (data which
is modified from C code during early start so must be writable).
This is in preparation for W^X patch in order to satisfy UEFI CA
memory mitigation requirements.
At the moment .init.text and .init.data in EFI mode are put together
so they will be in the same final section as before this patch.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/head.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index d8ac0f0494..16830f636f 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -870,6 +870,8 @@ cmdline_parse_early:
 reloc:
         .incbin "reloc.bin"
 
+        .section .init.data, "aw", @progbits
+
 ENTRY(trampoline_start)
 #include "trampoline.S"
 ENTRY(trampoline_end)
-- 
2.45.2


