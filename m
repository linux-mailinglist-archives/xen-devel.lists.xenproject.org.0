Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAAAA65DC9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 20:20:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918006.1322797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuG0n-0006Mc-Pk; Mon, 17 Mar 2025 19:20:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918006.1322797; Mon, 17 Mar 2025 19:20:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuG0n-0006HG-Le; Mon, 17 Mar 2025 19:20:33 +0000
Received: by outflank-mailman (input) for mailman id 918006;
 Mon, 17 Mar 2025 19:20:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kom6=WE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tuG0l-0005ZC-NL
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 19:20:31 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1c8d915-0364-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 20:20:27 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso23556095e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 12:20:27 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe292d0sm113505845e9.20.2025.03.17.12.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 12:20:25 -0700 (PDT)
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
X-Inumbo-ID: e1c8d915-0364-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742239226; x=1742844026; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=30kozOqzBnzCWTQYWHSp+IcPE2+WRRE7/JFoo2OjvsE=;
        b=qcGUfvmuaEo8RhLcwVjrL6I70Wb4nT6xtNiKnNdcKDwjBUTkYKoppCDPxMLWPrxpWU
         ++yzRNNz/H2W/2DRsUA6W2fkscsLE2y7dnWIRubBdq9Q+GE6GEBei9GWz+ehTPd9KhpQ
         g8Gcs7Dp53QVUt+EGNvtwo76erNHUnOf5XO5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742239226; x=1742844026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30kozOqzBnzCWTQYWHSp+IcPE2+WRRE7/JFoo2OjvsE=;
        b=HNKgMkxw1hTmyBhCnTv/VoDyVnoLXaIsyFhi8ILat3Y9GIV76q0cHbxy4cgCnJE5A8
         D+axk12OONAN8d4C2LtcQcHseMuj7jTlny8Tw0X0Fm0ZAZvuf6s9u/mI2voLvRHsL3Yb
         TPllm4sJHSux/txYOLnhNzdCCjDNFjbZgejtTFlQ6Xjao7Y8FnOZuq6m3hgiC7vJYVQi
         3aErlQHLaDkASCzE2yqnMSnBwbyeW5GaepCquKhSNfwm4V1LqdVrCWXgrCYDMb+/GIlH
         10/PZ2uY4ZTXhth36eL1nA/j/5mmKBOIk65lBPDyPU4emETVLwUWnwXwYy9b3hOg9nkB
         35Xw==
X-Gm-Message-State: AOJu0YzrRiiUlnQ0Zz1JdDJKyEd2ESDw40uQwQSOvV8lQa+BtsuiHq7C
	kgx+beS6gEIcsKxm743hifOWWfRyaAhzSo2FFgim4vAtI8xFEacmNMPMgw1Pbo21ktgM2+/Ky9K
	j
X-Gm-Gg: ASbGncttJhTEpL4mnZ3zGQrqcTPQ6A2IUdcRPGVPunCHWPjqpf8aDq5FTldo6MA0Pj6
	+s7vSyozsQJLFyHR4ClINBW7TX/0Xsr3vjmnlwVWbKYHU3Z1K/OLZXECeklwyIK6adykzBXIM2t
	vmDK2f+8hIxuS9JvGwhB6Vsw5oqeqq9Y1HObJgDDlj9rGko6EFUquQ4/iqGygS/BDB+EX8xhtIZ
	iiP23s8RmDp7F7xQSVH0xqtdIcXAJQ0u3iUXW0aoJX8/rJMScI+rnNbXOz2jrqXs4wFf9RBZCza
	Sv8RTIRqlJMgwg7l7w2PvrKvxKiFiE1ktmyw5Alo4xpbP1AJohdAtIrlO1RWrcBb9zFT4AivRT4
	ZDR87+E3rbYUSABT9Dl5bIUBe
X-Google-Smtp-Source: AGHT+IHUOSu+KfgW88mcaAq0OWqnCen+Y2z+fFFqurEnXoXIZYgtmJ8cr5We+B6gkukpT2VG81mXkg==
X-Received: by 2002:a05:600c:350a:b0:43d:1b74:e89a with SMTP id 5b1f17b1804b1-43d1ec82869mr136666755e9.9.1742239226195;
        Mon, 17 Mar 2025 12:20:26 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/4] x86/traps: Simplify exception setup
Date: Mon, 17 Mar 2025 19:20:19 +0000
Message-Id: <20250317192023.568432-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a small series pulled out of the FRED work.

It is cleanup of our init APIs, moving logic into traps-setup.c, and a
simplificiation of early exception setup prior to having exception support.

In the future, it will be traps_init() deciding whether to activate FRED or
not, so we'll always be using IDT for early exception handling.

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1720849629
https://cirrus-ci.com/build/6194032705011712

Andrew Cooper (4):
  x86/traps: Move cpu_init() out of trap_init()
  x86/traps: Move percpu_traps_init() into traps-setup.c
  x86/traps: Move trap_init() into traps-setup.c
  x86/traps: Introduce early_traps_init() and simplify setup

 xen/arch/x86/acpi/power.c         |   1 +
 xen/arch/x86/include/asm/msr.h    |   2 -
 xen/arch/x86/include/asm/system.h |   3 -
 xen/arch/x86/include/asm/traps.h  |   6 ++
 xen/arch/x86/setup.c              |   8 ++-
 xen/arch/x86/smpboot.c            |   1 +
 xen/arch/x86/traps-setup.c        | 113 ++++++++++++++++++++++++++++++
 xen/arch/x86/traps.c              |  84 ----------------------
 8 files changed, 126 insertions(+), 92 deletions(-)


base-commit: e7e0d485e993e97b1c816adcfc610e7c7258ce96
-- 
2.39.5


