Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B586ABE535
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 22:53:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991131.1375038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHTx7-0006Nq-DM; Tue, 20 May 2025 20:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991131.1375038; Tue, 20 May 2025 20:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHTx7-0006MP-9B; Tue, 20 May 2025 20:52:45 +0000
Received: by outflank-mailman (input) for mailman id 991131;
 Tue, 20 May 2025 20:52:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BmRr=YE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uHTx6-0006MJ-AM
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 20:52:44 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fd129eb-35bc-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 22:52:43 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a36efcadb8so2140560f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 13:52:43 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a3674fed67sm13346626f8f.89.2025.05.20.13.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 13:52:41 -0700 (PDT)
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
X-Inumbo-ID: 5fd129eb-35bc-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747774362; x=1748379162; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C/l2BVJeDm+UzPcDvtIlIYkEo9QuHWXfEJ0aG0HjNrM=;
        b=EBjqDlvG7Z95XSX8jLIQBNhXnEfz8VAKSA+EocNr9oJ4CT9QqeU2PgVJFHoKK17+fE
         qUcbFiovy37JdEebs7ywMTxNdDc60mf+vOWMhR0b4Xdz9V2FfPaU/r6xnIs+aH8HMk5g
         y0fjek2VFx2cp2VN8SqK0H4nwbk0yIJ7dzdgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747774362; x=1748379162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/l2BVJeDm+UzPcDvtIlIYkEo9QuHWXfEJ0aG0HjNrM=;
        b=gWvRHQwtnE1IOtaFMgks5c49WNL0euetHXWEFiK1Jxz8bxyGZVIccbSUhER3w6zWzT
         K0FJ0D8UmtegUaLRJ97v44wEsXwb+ooFWJBiEXPpip/CUkjKguBZQUa2susSQ4IIW9yB
         1/b2DQu+K57zsGAdQt97MALw/Tjg3nmi2oOX63a8Wp4r8oWw4OOnFNLyO1OGD0kkxBau
         D6Or9rrbEDI/GXpV4ntth800vv1IShbUNwoMDMTuBjjvWIIxFTf/L00TI4GZ6LfmPMiL
         JD3iT36ivFWeu+Iwo6NwTPtv4fbH4odDI/5DfpA6zXFtKGFAe/F5q4acUEAP4Z+6AiPw
         LpDA==
X-Gm-Message-State: AOJu0YyeEpn0rf3mixuUMTVfkDld0DFjI5AWezkADtftOx6eJtnaPH4n
	MI0jx6WlSddCXqkJ5F8Y1h4x2niVExjI4MFXmP6C3aSrEDK/2kYVnDemi2VEGnwqrQrWE5W/R9Y
	9jLrR
X-Gm-Gg: ASbGnctaNgHAe65irekCecAlzDNPw8kiKXMYdieKZaTZIxKlIH5DAiBXS9pPJ0RoqDu
	sAL4JqtL+CWj4QwF2zTFIH9pSov/htwOTPpGhbh1x4wlwdRJpGet1mRTRpOHPWVpEEiC37md0nl
	2LpjHpWay1bjHYRnZCK9Br74m4O3uJtE6ILu+22G4vR4Madjp0Yw5P7RrC3FFSqUDtnXJRxl/Zd
	vUWKNlernXshd0LxqZkhil4PlYbEv6yCN2ayNuVTlrg4a9nyuTh7j2shagA8Y0/r1GCwIZAcfEw
	Hx1F6rOvWksIrjyW2WLcXh4oG1iUDY5a++fAF36rGY7EvaKp+06yp162kA9AQ8OVy2uXtmvuYHC
	bU4DTv4POxUPXBcUYZDSp1D1a
X-Google-Smtp-Source: AGHT+IFStY4KEKg8qLifm7M4qeyzKCHLerqxOma2rp7r8/dmuIzEV5YDIoXOEX1u99YgHzsf9RK1cQ==
X-Received: by 2002:a05:6000:184d:b0:3a0:b539:f330 with SMTP id ffacd0b85a97d-3a35c808ba8mr18168534f8f.2.1747774362014;
        Tue, 20 May 2025 13:52:42 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 0/3] CI: Improvements to *-tools-test-* jobs
Date: Tue, 20 May 2025 21:52:36 +0100
Message-Id: <20250520205239.203253-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rearrange tools/tests to be more ameanable to running in CI, and drop the
special casing holding it together.



Andrew Cooper (3):
  tools/tests: Drop depriv-fd-checker
  tools/tests: Install tests into $(LIBEXEC)/tests
  CI: Drop custom handling of tools/tests

 .gitignore                             |   1 -
 automation/scripts/build               |   1 -
 automation/scripts/qubes-x86-64.sh     |   7 +-
 automation/scripts/run-tools-tests     |  43 ++-
 tools/tests/Makefile                   |   1 -
 tools/tests/cpu-policy/Makefile        |   6 +-
 tools/tests/depriv/Makefile            |  52 ---
 tools/tests/depriv/depriv-fd-checker.c | 436 -------------------------
 tools/tests/paging-mempool/Makefile    |   6 +-
 tools/tests/rangeset/Makefile          |   6 +-
 tools/tests/resource/Makefile          |   6 +-
 tools/tests/tsx/Makefile               |   6 +-
 tools/tests/xenstore/Makefile          |   6 +-
 13 files changed, 40 insertions(+), 537 deletions(-)
 delete mode 100644 tools/tests/depriv/Makefile
 delete mode 100644 tools/tests/depriv/depriv-fd-checker.c

-- 
2.39.5


