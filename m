Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFCD952EE1
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 15:16:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778060.1188109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seaKq-0000y7-Sb; Thu, 15 Aug 2024 13:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778060.1188109; Thu, 15 Aug 2024 13:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seaKq-0000wU-P3; Thu, 15 Aug 2024 13:16:12 +0000
Received: by outflank-mailman (input) for mailman id 778060;
 Thu, 15 Aug 2024 13:16:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZnf=PO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1seaKp-0000wG-FR
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 13:16:11 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88a93964-5b08-11ef-a505-bb4a2ccca743;
 Thu, 15 Aug 2024 15:16:08 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a7aada2358fso305550366b.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2024 06:16:08 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383947151sm100868666b.161.2024.08.15.06.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2024 06:16:06 -0700 (PDT)
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
X-Inumbo-ID: 88a93964-5b08-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1723727767; x=1724332567; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MT5Jtu8/bT2qy49tYsdXvgJt2x74cDF3t6xAZwYF8D8=;
        b=hgqkH/KA7r4rLmTZ1/pqFddBCsxQm+Zhz/qWtZGd7Pnd5atHaj1dMhftEL3srAITfX
         fjgblc6IF4bzhDBdOyN4ESHTL6cq8HUtzSAGuF9Ivr1UM502a4YIta8IeShJIBE6+Enz
         06THo8BeRs+KO0w3UxTmIYb8DjAH7psnp6Ubw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723727767; x=1724332567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MT5Jtu8/bT2qy49tYsdXvgJt2x74cDF3t6xAZwYF8D8=;
        b=f0WHzA4O9rHP8K5tkwCsFksMrwCJaoPzFxp8RdTsjF/PG3aKqRHliKWFG3oaA3Zstj
         w0LI81KWR4yuWiRfKqT8w97xRJLRv3giyiC94h9EcKCjKAmb3yEQwVP0Qs6P+/DhALJp
         oMPsYeGrdQSFfXOBm2/ERAWBBDvvTGuQMynH51PL1rtMDWJbrfxcofqgMzuG4J9a87ly
         M/mNjjpoU7S02/8p3fOpX2a2jV2uI60SpiZmRdmavCkp8s5W5Dvorif3ee7NE1oHE9p5
         8/FEuvneLWYY9wgTiKoc5XE7bZqFbmSxtuN1tSSpByaL7xCgbT0Nh0ajbKYUgu1U3sQS
         cKBw==
X-Gm-Message-State: AOJu0Yzsrd7rb0cJN8vz9BvGF0NpEz6Wq8iQBjNbgA4XVykNsjhXLeGf
	yDz1oWx4n/9ZWEhn2wf05rn6yLMiy6rxjfv0GZysUWociki9nPPy7KY+vIVt9/Dkkmk3Ozb9WTz
	6
X-Google-Smtp-Source: AGHT+IGlLgbfNL8+Heo8QvpukDUBqtGLbCM/biLJaLLkZ8+7/Qi9W0XmkYWfcgP0DQ/Wne1FvPjT6w==
X-Received: by 2002:a17:907:7ea4:b0:a7a:acae:340b with SMTP id a640c23a62f3a-a837cd61afemr275384466b.31.1723727767254;
        Thu, 15 Aug 2024 06:16:07 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Matthew Barnes <matthew.barnes@cloud.com>
Subject: [PATCH v2 0/3] x86/pv: More debugging fixes
Date: Thu, 15 Aug 2024 14:15:57 +0100
Message-Id: <20240815131600.4037415-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patches 1 and 2 already reviewed, and split out of a larger series covering
HVM too.  However, as it's been 6 years (yes really), I've reposed them just
in case.

Patch 3 fixes a Coverity complaint, highlighted by Matt's recent change to fix
IO breakpoint recognition.

Andrew Cooper (3):
  x86/pv: Introduce x86_merge_dr6() and fix do_debug()
  x86/pv: Fix merging of new status bits into %dr6
  x86/pv: Address Coverity complaint in check_guest_io_breakpoint()

 xen/arch/x86/debug.c                   | 20 +++++++++++++++
 xen/arch/x86/include/asm/debugreg.h    | 34 ++++++++++++++++++++++++++
 xen/arch/x86/include/asm/domain.h      | 12 +++++++++
 xen/arch/x86/include/asm/x86-defns.h   |  7 ++++++
 xen/arch/x86/pv/emul-priv-op.c         | 26 ++++++--------------
 xen/arch/x86/pv/emulate.c              |  6 ++---
 xen/arch/x86/pv/ro-page-fault.c        |  2 +-
 xen/arch/x86/pv/traps.c                | 16 +++++++++---
 xen/arch/x86/traps.c                   | 12 ++++++---
 xen/arch/x86/x86_emulate/x86_emulate.h |  5 +++-
 10 files changed, 107 insertions(+), 33 deletions(-)

-- 
2.39.2


