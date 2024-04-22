Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D898AD3B8
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 20:15:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710190.1109294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryyBd-0000N5-3i; Mon, 22 Apr 2024 18:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710190.1109294; Mon, 22 Apr 2024 18:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryyBd-0000LY-0Q; Mon, 22 Apr 2024 18:14:41 +0000
Received: by outflank-mailman (input) for mailman id 710190;
 Mon, 22 Apr 2024 18:14:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/m7Q=L3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ryyBb-0000IX-GP
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 18:14:39 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e4f197e-00d4-11ef-909a-e314d9c70b13;
 Mon, 22 Apr 2024 20:14:38 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a559b919303so249723666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 11:14:38 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 z15-20020a170906668f00b00a51d073da7esm5994224ejo.82.2024.04.22.11.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 11:14:37 -0700 (PDT)
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
X-Inumbo-ID: 2e4f197e-00d4-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713809677; x=1714414477; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2PmRo4WbCvn8vCpF4S5VSf24st9479k1Re5mhFEYIv8=;
        b=p8s1+JVcZUPKWAGzpAy3ISG7P1xRZUA96Jx+V8yqRgyGM42WLBUooG4g1kV6vAphVG
         tcRyPvPw/rUlUjYvPjUxEYpFQsKHzdtfxZ6SMbV3UGANjuKIhuw5SCuS3Es7fdjZPBWn
         tU3AZUn/jNXA0U/j+5Pw3ro2MVGHvhPSHi6mU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713809677; x=1714414477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2PmRo4WbCvn8vCpF4S5VSf24st9479k1Re5mhFEYIv8=;
        b=ayo+OErhNnas5GDY4fOGAxMGIa8jsqjbYOkUls4Hkh5RLB092nS+ngnnzRIhtPQLUA
         HyknQlHRLVe3/Vr/WVSESqKD9E5zzOhlNV68o1yTMr/CqRXHPmguzppSnL03NOzt0MPa
         sGOjIqHMu6wYI2pDm6IlUe1qO4EkD3uDnHxuXJ+3IavzOfLjcW/tXmK75GLOD1T1u/1C
         thkPwcckVj4UeAhB2XGycNRbb3g1cJcG083up2tAA/BY/LQeLjWMB9DeqKbPzazF33qJ
         yOGx7+oBbG6BYGIAxw0RLVbnRcZpCDB8Oc9ymYsd88NfpWkXf2HRM3Pb3qGVDH/nXGD8
         D4UQ==
X-Gm-Message-State: AOJu0Yz/gQNBKGCkg1u+pbyCKg/czavMDLldwqSemjNwJ7p513Ge/3in
	untjfOYU5UZgykqepLSj5gR2d7rg1besACCyXZqDN7GuLkhuqCL5p6jANRZ8DlZZk34WGb2zG5J
	8eEQ=
X-Google-Smtp-Source: AGHT+IH9H7TZn9KZ/OdIbtCEvsuP8jwqv/yDfksTBG1pbw9kuLR0i22H/tcGcJEK9Ze8oLQQcbA0mA==
X-Received: by 2002:a17:906:5282:b0:a55:3488:f730 with SMTP id c2-20020a170906528200b00a553488f730mr7152807ejm.31.1713809677336;
        Mon, 22 Apr 2024 11:14:37 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/6] x86/alternatives: Adjust all insn-relative fields
Date: Mon, 22 Apr 2024 19:14:28 +0100
Message-Id: <20240422181434.3463252-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Alternatives have had a reasonably severe restriction since their
introduction.  This has been the source of several bugs, and several
inefficiencies particularly in the speculative safety paths, and I've finally
gotten bored enough to fixing it.

Introduce the new infrastructure, and adjust the BHB scrubbing logic to use
it.

Andrew Cooper (6):
  x86: Introduce x86_decode_lite()
  x86/alternative: Walk all replacements in debug builds
  x86/alternative: Intend the relocation logic
  x86/alternative: Replace a continue with a goto
  x86/alternative: Relocate all insn-relative fields
  x86/spec-ctrl: Introduce and use DO_COND_BHB_SEQ

 xen/arch/x86/alternative.c               | 210 +++++++++++++------
 xen/arch/x86/hvm/vmx/entry.S             |  12 +-
 xen/arch/x86/include/asm/spec_ctrl_asm.h |  43 ++--
 xen/arch/x86/x86_emulate/Makefile        |   1 +
 xen/arch/x86/x86_emulate/decode-lite.c   | 245 +++++++++++++++++++++++
 xen/arch/x86/x86_emulate/private.h       |   2 +
 xen/arch/x86/x86_emulate/x86_emulate.h   |  17 ++
 7 files changed, 445 insertions(+), 85 deletions(-)
 create mode 100644 xen/arch/x86/x86_emulate/decode-lite.c

-- 
2.30.2


