Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8632CC44F2
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 17:33:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188082.1509336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVXyZ-0001YW-U0; Tue, 16 Dec 2025 16:32:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188082.1509336; Tue, 16 Dec 2025 16:32:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVXyZ-0001Ra-NX; Tue, 16 Dec 2025 16:32:39 +0000
Received: by outflank-mailman (input) for mailman id 1188082;
 Tue, 16 Dec 2025 16:32:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6n8=6W=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vVXyY-0001QJ-DF
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 16:32:38 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4527952-da9c-11f0-9cce-f158ae23cfc8;
 Tue, 16 Dec 2025 17:32:36 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47789cd2083so25845165e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 08:32:36 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47bd994a221sm12994765e9.7.2025.12.16.08.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 08:32:35 -0800 (PST)
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
X-Inumbo-ID: d4527952-da9c-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765902755; x=1766507555; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AzlUr9Z7O7FkvFve9JYZC9mC2bZxc1cQwAvhgbd09v0=;
        b=UY/v+r+mFCGtri1065aVCTHkm4BFg09sn2mLCsqVvD0zGvH3S9DlOqRE48eo7Qp8/h
         L3Tn/0/T9Zl15u8e2Jo0zKoO27RHyd3wpXO9Cu1wRbdnl1iU5adkw755IX5jArf7VZQp
         6yg/kvi5nzihSX8DvysNqJcWlnUtU97J/FURw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765902755; x=1766507555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzlUr9Z7O7FkvFve9JYZC9mC2bZxc1cQwAvhgbd09v0=;
        b=b/Qc/E8/ZQGuy072+BC87aK0Rxu+oebLfHLfgxXpvuBclqg4jK8Iqln7Cpp7TCBwDw
         G3Sq/covGdVhCxuVVV6t3YgmNDRaDTOMOoQaXGXDipGbYwMKRfep/Qk20RipfCoaEaUZ
         xEOaI7OQZDCLkbv26bScPsoFZoQEFtyL/5aXrEvxEB1kigZ3Dqr0Y9bTFA+lUjq+somS
         WfiT4cbHgiwmrXf5nF/xBFtLWRK7SjcU0d5cg7jHu02q46rriH6RG9F6yEciPeONFWzS
         Luf2qDjHsWRCky4J9gD4SYa2jtvrkv2Vh0aFoszGicEEB+6tQUR/0Y/pehpLFun/calC
         0+Mw==
X-Gm-Message-State: AOJu0YyLUm7bI/SZDEibVJF1Zng19+3I1jfMOfIEUBA8EmcH1QFKNxuG
	yvk+UiZ1JUoogLYjr+uEkThX5YS0Kq327mFT+62swgijWo9IQ9vPu6LfQxT3uNoJ50ygnTd1wWx
	bgElk
X-Gm-Gg: AY/fxX5qdABnluos68Mwhhp1agHRag0mG9EUm2S5A3O0CrLPnDF6QxcJ7n6bl+IOZck
	74frGYwokFg2pYkmy46tpOknkoh9KrqPoV7MYqb5yjRnyBeM8Mq3nJYYILfPF6Xldza5lz8EBYU
	bGHVZDXKzKxkOZtUSFsoRXpdqLQ0eAO692ifcDYFEFdMezwQUXtg376aShVz7Da1bNjtySPOhP6
	jGhsK/4Zlug1iXQkIZ1TzolAPyGi400xZ53zYz/vTTCflAD4eIr+fqRAskXbaL34CQSS2P8jMqs
	7sJahFRbDcdZxZvTshDdDQZynmwe3JVmA8/XhCyFBVlDAKehDPF2JzthkypdokjuANTefHKXNeV
	4UZgSsV9poSRikbCq7HBjOL/Z8ZjWKpwk37lJ9ysbXTgwSdCooOiQojRX/ZqdxrGjEZBtq9SGjo
	o2kGBme65v1J65FBpRI7L37sTB3Vz9lYtvFikJn7k4A6y5DYBdo4fAWAVpRFmsTA==
X-Google-Smtp-Source: AGHT+IElS7NXgVoHB73gqnkka36Zc/RQtUBB/74fl2msSH3CWLZNET7IxNzEx4TIOpIe55AiH4LZWw==
X-Received: by 2002:a05:600c:870b:b0:477:214f:bd95 with SMTP id 5b1f17b1804b1-47a970ee01fmr95640125e9.23.1765902755373;
        Tue, 16 Dec 2025 08:32:35 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/4] xen: Memory claims fixes and testing
Date: Tue, 16 Dec 2025 16:32:26 +0000
Message-Id: <20251216163230.2768186-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Two bugfixes, and a test for some basic behaviour.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2218133231

Andrew Cooper (4):
  xen/domain: Disallow XENMEM_claim_pages on dying domains
  tools/libxc: Delete ENOSYS squashing in xc_domain_claim_pages()
  tools/tests: Sort Makefile
  tools/tests: Memory Claims

 tools/libs/ctrl/xc_domain.c            |   9 +-
 tools/tests/Makefile                   |  12 +-
 tools/tests/mem-claim/.gitignore       |   1 +
 tools/tests/mem-claim/Makefile         |  38 +++++
 tools/tests/mem-claim/test-mem-claim.c | 190 +++++++++++++++++++++++++
 xen/common/memory.c                    |   3 +
 6 files changed, 240 insertions(+), 13 deletions(-)
 create mode 100644 tools/tests/mem-claim/.gitignore
 create mode 100644 tools/tests/mem-claim/Makefile
 create mode 100644 tools/tests/mem-claim/test-mem-claim.c


base-commit: 46f3ed0d53db6daf38c230dff0d2910bcb61fbe2
-- 
2.39.5


