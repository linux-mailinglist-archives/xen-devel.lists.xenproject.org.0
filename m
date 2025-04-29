Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FDDAA0837
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 12:13:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971781.1360173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9hxV-0002n1-KD; Tue, 29 Apr 2025 10:13:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971781.1360173; Tue, 29 Apr 2025 10:13:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9hxV-0002lP-HF; Tue, 29 Apr 2025 10:13:01 +0000
Received: by outflank-mailman (input) for mailman id 971781;
 Tue, 29 Apr 2025 10:13:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b72w=XP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u9hxU-0002lF-Nj
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 10:13:00 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 872c7894-24e2-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 12:12:59 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39ee5ac4321so6250886f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 03:12:59 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a073e5cffasm13694881f8f.96.2025.04.29.03.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 03:12:58 -0700 (PDT)
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
X-Inumbo-ID: 872c7894-24e2-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745921579; x=1746526379; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5L+6d2q8Wk9MF3nhIfwH6850QZ4KjtnLngGsQnw0sNI=;
        b=uh/Smm7lNfA2NOkMjbWdDGqSYLYw3kK/tSVZg4JhLrONB+qYTxPE61HqVPR0C3Y5vl
         HuCwWIHQQJvaDt/QWjUBPznhiXfaqdUFEFVSEFyN0xG0KbAIXL2nK8WizVR/YfUUQndB
         RsY2HI3BeISag1ntPIpsKYVpxyl5JpmSSsdzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745921579; x=1746526379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5L+6d2q8Wk9MF3nhIfwH6850QZ4KjtnLngGsQnw0sNI=;
        b=Y7bQrfFC2P+ayl59YhjL67GgPiasmi5nV+Iw5LUjCcWfXOcrW0Ne0XSAwuVj1pL+eP
         iiC7q+oToqhm6b0x475AIAbwq2aHZIwOEogOcVoBri4xKQvQRNRi4172v9x6zJlw6kq0
         QZMpCcyjUe10hjhPS5JOSI/e49AneEHRYi+ez7IDi3h3kDFeoT6SAgNqIoLcER6zxbrb
         tpvVGMaORJrx5KeqNRFpqgV+AvOEXXUrFhd0jVYUn3oiUZNmNY1r84P/EQBZxodPVT4Y
         qsOXG9HJojT6S5PhHTZRdp62T6pqoEKK8FZ7zbzxjmIKgKvKF60OM1kdwRDqW0GrunQN
         DZzQ==
X-Gm-Message-State: AOJu0Yz7C7WMOJcjlSFs0n+QLWJBnIHuc3B0nKwA3JUI921JACUmJ04V
	fKI6CsRaIg3Rx5hjY/nB4fS9810RPyCanzK6cdFRmOJzOI80+S5JgxS0CdwVLz++B34seukibWp
	I
X-Gm-Gg: ASbGncs6erE6YqdoVC/QPh524Ipy/Lp2mY8atpagyJUmjBZTkbhZSf6JEVXh6vHasyt
	rMb9H9wxw/XWfGWzJBYHG4hOGhboWX+d+uF8admPjTHhKEyfK/VszDqE/1kVdAx2wBQRdWtHbp7
	za/dmAzhdGEfs7A6yXvkDs5X552/BV9WV5kybZhEi5fIVO7AeC0vSKX5jNLHADs1cgfApBp+Ji+
	4wnBLgcHZBZojdk6Zgxr1lEh45gYF33JxNBhnZm5GAoeHZUq7U5DcI8fzzpVt2osz/oEQcYHLpO
	7PyzjkWHfIgqMIHvjSrgcWVPkNDQ6faTmqqHnLfx+GRIww==
X-Google-Smtp-Source: AGHT+IGToBnPY9o5JSj/yUw2DnvFQzlwSTb6uC328F6EkbagHdVaK9h7wAvZ6vDRC01kA3+KCtgXog==
X-Received: by 2002:a05:6000:22c3:b0:39a:ca05:54a9 with SMTP id ffacd0b85a97d-3a0891b809dmr2060790f8f.29.1745921578998;
        Tue, 29 Apr 2025 03:12:58 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 0/4] xen/x86: fix implementation of subpage r/o MMIO
Date: Tue, 29 Apr 2025 12:12:48 +0200
Message-ID: <20250429101252.50071-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Following series include some bugfixes and improvements to the handling
of subpage r/o MMIO accesses.

Patch 1 introduces a helper to reduce code duplication when performing
MMIO accesses.

Patch 2 is a bugfix for using subpage in HVM guest, and patch 3 is an
optimization to only register the HVM subpage handler when needed.

Finally patch 4 moves some PV only code to a PV specific file.

Thanks, Roger.

Roger Pau Monne (4):
  xen/io: provide helpers for multi size MMIO accesses
  x86/hvm: fix handling of accesses to partial r/o MMIO pages
  x86/hvm: only register the r/o subpage ops when needed
  x86/mm: move mmio_ro_emulated_write() to PV only file

 xen/arch/x86/hvm/Makefile              |   1 +
 xen/arch/x86/hvm/emulate.c             |  54 ++---------
 xen/arch/x86/hvm/hvm.c                 |  18 ++--
 xen/arch/x86/hvm/mmio.c                | 125 +++++++++++++++++++++++++
 xen/arch/x86/hvm/vmsi.c                |  47 +---------
 xen/arch/x86/include/asm/hvm/emulate.h |   1 -
 xen/arch/x86/include/asm/hvm/io.h      |   3 +
 xen/arch/x86/include/asm/mm.h          |  21 +++--
 xen/arch/x86/mm.c                      | 106 +++++----------------
 xen/arch/x86/pv/ro-page-fault.c        |  41 ++++++++
 xen/drivers/vpci/msix.c                |  47 +---------
 xen/include/xen/io.h                   |  70 ++++++++++++++
 12 files changed, 296 insertions(+), 238 deletions(-)
 create mode 100644 xen/arch/x86/hvm/mmio.c
 create mode 100644 xen/include/xen/io.h

-- 
2.48.1


