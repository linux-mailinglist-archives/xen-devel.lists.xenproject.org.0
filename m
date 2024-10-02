Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A10398DF0A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 17:27:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808899.1220985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw1GM-00080c-Ue; Wed, 02 Oct 2024 15:27:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808899.1220985; Wed, 02 Oct 2024 15:27:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw1GM-0007yP-R8; Wed, 02 Oct 2024 15:27:38 +0000
Received: by outflank-mailman (input) for mailman id 808899;
 Wed, 02 Oct 2024 15:27:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VgkK=Q6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sw1GK-0007h7-VB
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 15:27:36 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9347e47-80d2-11ef-99a2-01e77a169b0f;
 Wed, 02 Oct 2024 17:27:34 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a8d60e23b33so996971366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 08:27:34 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c299ac8esm880024566b.222.2024.10.02.08.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 08:27:33 -0700 (PDT)
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
X-Inumbo-ID: d9347e47-80d2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727882853; x=1728487653; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QNpzenwNX1xQ9mu7HMeabzs8vltFJnRXlsr3r5RUzqo=;
        b=BHcqN9ciFN1OnXnQ2n7ibhwEDFrBO8RU2exthpJ9CJqdCkzVaGk0LE7E4uyr7ehE/m
         cKWe/UwhpBstNSQsZnP/3OHlfH3qv6qmDm0Krh7obGtDiUZiFpbIq+5yoBU/zxY/i3F5
         4sNSibCxFeU5CcTe4h7U2JomL3AmTl8emlTgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727882853; x=1728487653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNpzenwNX1xQ9mu7HMeabzs8vltFJnRXlsr3r5RUzqo=;
        b=htTQzGN3mrdrqKz5d7Ot7Hfkxu4D2BXjDXC1qyPn05ZodYf6l5A2JPhJkKTgcdL0NL
         +64FoXXmedxqh+9YGZjiJDcp3cDnCvTbWbvnsBR3G8R1dxaOl143liu9Ve/qMBQUd0gc
         DsqxgJmxu3dEwHN1N5PIUjA2NoXMvoKqiXnAkoLBwN2uZwVhX+Uy5OHaQzTCb6mzjyTr
         YhH+TUjBcUQYBxZAVaIlfSRWWcwhJ2pTovnp9UiCQPqgcYG4rP7QIGh8iiZeYcSeMOTa
         1rGr9OgVvkVJObNkpTPH31eDODVDqpvcFq09ynfpHqhFnMRfLJNuMHOQINh/pPAzwGKa
         2+2A==
X-Gm-Message-State: AOJu0YydX/+D4tgph+20Tlyrnc2IvFQVSEI+gGeBoivs4rv85J9At/r3
	FZyoHfJgA68+iVBaG8yvND8Vax5Jajo04eQ5DOUKVbvQy1oLyFBZP54NkJuG9dZ27TlwtyIOBYb
	QuII=
X-Google-Smtp-Source: AGHT+IFQ2XX6ISngkSTnqF89HuOKeJjRhoa7+qtvJ67fSE4AOF1Zgmx8YWcGi7gmdPIBoldy4uAzPw==
X-Received: by 2002:a17:907:6d1b:b0:a86:a1cd:5a8c with SMTP id a640c23a62f3a-a98f823cbb3mr296401266b.22.1727882853483;
        Wed, 02 Oct 2024 08:27:33 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 0/7] x86/alternatives: Adjust all insn-relative fields
Date: Wed,  2 Oct 2024 16:27:18 +0100
Message-Id: <20241002152725.1841575-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Alternatives have had a reasonably severe restriction since their
introduction.  This has been the source of several bugs, and several
inefficiencies particularly in the speculative safety paths.

v2:
  Most work is in patch 1 and the new patch 2 (userspace harness).  Other
  patches with minor or no change.

Andrew Cooper (7):
  x86: Introduce x86_decode_lite()
  tests/x86: Introduce a userspace test harness for x86_decode_lite()
  x86/alternative: Walk all replacements during self tests
  x86/alternative: Indent the relocation logic
  x86/alternative: Replace a continue with a goto
  x86/alternative: Relocate all insn-relative fields
  x86/spec-ctrl: Introduce and use DO_COND_BHB_SEQ

 tools/tests/Makefile                      |   1 +
 tools/tests/x86-decode-lite/.gitignore    |   1 +
 tools/tests/x86-decode-lite/Makefile      |  45 ++
 tools/tests/x86-decode-lite/insns.S       | 703 ++++++++++++++++++++++
 tools/tests/x86-decode-lite/macro-magic.h |  52 ++
 tools/tests/x86-decode-lite/main.c        | 111 ++++
 tools/tests/x86-decode-lite/x86-emulate.h |  27 +
 xen/arch/x86/alternative.c                | 213 +++++--
 xen/arch/x86/hvm/vmx/entry.S              |  12 +-
 xen/arch/x86/include/asm/spec_ctrl_asm.h  |  43 +-
 xen/arch/x86/x86_emulate/Makefile         |   6 +
 xen/arch/x86/x86_emulate/decode-lite.c    | 311 ++++++++++
 xen/arch/x86/x86_emulate/private.h        |   2 +
 xen/arch/x86/x86_emulate/x86_emulate.h    |  14 +
 14 files changed, 1456 insertions(+), 85 deletions(-)
 create mode 100644 tools/tests/x86-decode-lite/.gitignore
 create mode 100644 tools/tests/x86-decode-lite/Makefile
 create mode 100644 tools/tests/x86-decode-lite/insns.S
 create mode 100644 tools/tests/x86-decode-lite/macro-magic.h
 create mode 100644 tools/tests/x86-decode-lite/main.c
 create mode 100644 tools/tests/x86-decode-lite/x86-emulate.h
 create mode 100644 xen/arch/x86/x86_emulate/decode-lite.c

-- 
2.39.5


