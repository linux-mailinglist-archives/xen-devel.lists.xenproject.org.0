Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FD06A951E
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 11:24:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505760.778683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2aV-0008MW-G4; Fri, 03 Mar 2023 10:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505760.778683; Fri, 03 Mar 2023 10:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2aV-0008Jq-Cr; Fri, 03 Mar 2023 10:24:31 +0000
Received: by outflank-mailman (input) for mailman id 505760;
 Fri, 03 Mar 2023 10:24:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y5Qx=63=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pY2aT-0008Jc-Ut
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 10:24:29 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94a16a1d-b9ad-11ed-96af-2f268f93b82a;
 Fri, 03 Mar 2023 11:24:29 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id y14so1829303ljq.4
 for <xen-devel@lists.xenproject.org>; Fri, 03 Mar 2023 02:24:29 -0800 (PST)
Received: from fedora.. (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 j22-20020a2e3c16000000b00295a36fedadsm239600lja.26.2023.03.03.02.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 02:24:28 -0800 (PST)
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
X-Inumbo-ID: 94a16a1d-b9ad-11ed-96af-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677839068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=owPv0a54uHGorwHjZDHmJke//fXpPjY+3gRWJ6cI89Y=;
        b=VkIs84X3XwY7zjjf56Z+jxNtOOKoBdMTAi1oSMMEXLIBffoODqODTCEhwMCplNPsYO
         BW48qp5VJ2awgAq8gQ3oxHtCfXvGxF8hdsVTcZc2qmsvGCQZ+7UVsfONpElGWL3GjoKn
         T0peMySbv7KwTx+W7vjAUlLF5pnKaWmZBoVf7YdNK/wKG0v7zGlKSbQW98aG9xvjg/ky
         4gaoKIdVN/+7htBr8LlyUQ6o9Gyktu4ivuYVcs3xLWRdR4QWlVXN3hyxulCujFljFQyS
         t74JY2WL0BunWM8mKTydl6ETtvpWKBmHS8hiezhFKHbowMNCCmEenSDE5DtdEsL+4rcB
         9ozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677839068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=owPv0a54uHGorwHjZDHmJke//fXpPjY+3gRWJ6cI89Y=;
        b=jr5m/gM0J4E2OgtYZ3ChwlNwYvtMK+vsP+wzF+qOeaDYdInmNYFbkMCBy7nysvAnpA
         t4/vkEA19xqegU7NTBHM8UGgbJ+e6pgoa9J9/7Cun5m05B+Pn8kSeALiOQTvbHEuQTIX
         s1oa04LqycbicswFpIChZ3TeQBbkodNuy7vXFzu3H1ivVYzjb/8QqSl+pePgE1OmVGhA
         762jCZKOEc/g6cvuDHIJSkJ2YW/jxzOaj3gVl/EoaTXqRwBj7YDIdDN+Yv101Qdkrz6g
         XyprMhQt33zLwqaluOylOdo6UJxmHwYDgw52xAs4dIFQMSXYKAIAjUGG7UY+WKmrqq9k
         ALdw==
X-Gm-Message-State: AO0yUKXl7ZLbLNTlTvnlZ6RmYofwI7sAb5POsE5RFCkodSDt8FZhVP5j
	ae64Hem5woyjXLrcyj1yMFdUQMz8EoE=
X-Google-Smtp-Source: AK7set9wgYAOoYBnL6LpOSc4cKBF8wBpNNBhSmToPXkqy+6hz8iIGKR+tjvr7Wvm48FmaIYRAJ0jPA==
X-Received: by 2002:a05:651c:1204:b0:28f:265d:11da with SMTP id i4-20020a05651c120400b0028f265d11damr324233lja.13.1677839068449;
        Fri, 03 Mar 2023 02:24:28 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v3 0/3]  Do basic initialization things
Date: Fri,  3 Mar 2023 12:24:21 +0200
Message-Id: <cover.1677838213.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series groups and updates the following patches:
1. xen/riscv: disable fpu
2. xen/riscv: initialize .bss section
3. xen/riscv: read/save hart_id and dtb_base passed by bootloader

---
Changes since v2:
 * Patch [xen/riscv: disable fpu] was moved to the start of start()
   function  to detect illegal usage of floating point
   earlier.
 * Add dummy_bss variable to make .bss initialization code more simple.
 * Change comparison of addresses from signed to unsigned.
 * Add the comment for start() function with the explanation what and
   how OpenSBI pass to start() function.
 * Clean up start() code related to read&save hart_id & dtb_base.   
---
Changes since v1:
 * initialization of .bss was moved to head.S
 * read/save/pass of hart_id and  dtb_base passed by a bootloader
   were moved to head.S. Also, it was updated start_xen() arguments
   to recieve hard_id & dtb_base
---

Oleksii Kurochko (3):
  xen/riscv: disable fpu
  xen/riscv: read/save hart_id and dtb_base passed by bootloader
  xen/riscv: initialize .bss section

 xen/arch/riscv/riscv64/head.S | 21 +++++++++++++++++++++
 xen/arch/riscv/setup.c        | 11 ++++++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

-- 
2.39.0


