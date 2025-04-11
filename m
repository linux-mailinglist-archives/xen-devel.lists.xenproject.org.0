Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 446E1A855EC
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 09:55:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946727.1344512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u39EM-0000x9-8K; Fri, 11 Apr 2025 07:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946727.1344512; Fri, 11 Apr 2025 07:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u39EM-0000vh-5H; Fri, 11 Apr 2025 07:55:18 +0000
Received: by outflank-mailman (input) for mailman id 946727;
 Fri, 11 Apr 2025 07:55:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U3ez=W5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u39EL-0000vb-Bi
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 07:55:17 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4daf760d-16aa-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 09:55:15 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39ac56756f6so1369928f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 00:55:15 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43f2338d802sm79968545e9.1.2025.04.11.00.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 00:55:14 -0700 (PDT)
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
X-Inumbo-ID: 4daf760d-16aa-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744358114; x=1744962914; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ov4EfJkaMKa+xBxdMimAVCnDzVpZxc3hmE0W2T2Ygdc=;
        b=t4ew3lGuHLqkW/EdPlQkQN43WCe4mf9iZrJF3fDxmkmgeBuT/ghRO124buj1tTKGVW
         UtYEWX5Cnl21sYgiJqive6a+3heGfSJcICX0hc38h/0KPawIrGUc6jAyyEDhW5pmxCJI
         DevQQKAMRAH7etQAJCbizjfrTDB5ZYSSqKVpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744358114; x=1744962914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ov4EfJkaMKa+xBxdMimAVCnDzVpZxc3hmE0W2T2Ygdc=;
        b=T9zQgfmC6NBzEig3y2XEMp0yw5qnJAOKtHpGifEQpoVo3zJ2OrQlsr+17t9uryiwW/
         b3buJGVIcCTuuBGb98edew/2iYpiXgE1QQYwN6Jz4lghRM9hSjZMq/AFscPi1W4+GXDz
         6oP275mKZ4dkoOlcFqCiqo6AJL9OSsRQvFp3OpIQuIwfr8DU3LJHC3YTNrbUwEphnaEm
         9SOYaCA2aohPl98+2eE/jnNGgSWCNrQbg9iaDmS0xB4Lx6oYmd6AnkEQFphMJipSkj6D
         3wkBFgoJKBHKK70BpqzFCm7dR6iM3UlZYBikAr877323NFukfitPWTdEfSGEnYKo3hg1
         kaXg==
X-Gm-Message-State: AOJu0YzYzzMVLMOba7408+plWfr2xLrF6rMQkmemizBnBgvNYOfEcHRh
	mX4LnUCk9bcGzaFO6OyEs274nTMnqI+yqGj5stHHVHkV/EFL0LAx4LPYdDcp9nGxkt3zcpJi+k8
	t
X-Gm-Gg: ASbGncveCwQE4ocpH1zCssSy0l83LE95FW8pe18V8vbN4Xo+kvH9dJ1XNzwILmCFyUA
	1dXofZX5pZrrlnqrXGENKk6/9fbJMNZp4isrylE1/j8fYYvpTPUxOnYr4gpxJzRNUNivsgp610G
	vkNAWI9WKGyHOR8CSatMiOBhrY0kLVq6lP2fDsI9rLdOAgkiupXACrAgirCU/h8AZO2Ia8evB0u
	aoKaXujHkfubyXffDcYXCqQ0moCasK9kWj4EbG5LgMvibJa4RScgLXcepWLytwGJIwYRs/ZEwun
	Yl+ZPkABGShRnSfeX9FLbDH99f13AgVgLmGszxl6hs81RPEFDiHIx7dE
X-Google-Smtp-Source: AGHT+IF1SM69BCevH+O623myLwh4fMhZERQR6Tqf3z/sVILYd8xeWaYC+C6jPSC6p2BmXZvT4wizgw==
X-Received: by 2002:a5d:6daa:0:b0:39c:dfa:d347 with SMTP id ffacd0b85a97d-39ea51f4467mr1279669f8f.2.1744358114587;
        Fri, 11 Apr 2025 00:55:14 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/2] xen/rangeset: one bugfix and unit testing
Date: Fri, 11 Apr 2025 09:55:00 +0200
Message-ID: <20250411075502.19926-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Rangesets are extensively used inside of Xen, yet we had no
unit tests to ensure it's correctness.  rangeset_remove_range() is in
fact bogus and will generate an incorrect output rangeset depending on
the inputs.

Patch 1 fixes the bug, patch 2 adds some basic unit testing to ensure
the fix done by patch 1 is correct.  The unit testing should likely be
expanded (in a different series) to further assert the correctness of
other rangeset operations.

Thanks, Roger.

Roger Pau Monne (2):
  xen/rangeset: fix incorrect subtraction
  tootls/tests: introduce unit tests for rangesets

 tools/tests/Makefile                 |   1 +
 tools/tests/rangeset/Makefile        |  45 ++++++
 tools/tests/rangeset/harness.h       |  71 +++++++++
 tools/tests/rangeset/test-rangeset.c | 228 +++++++++++++++++++++++++++
 xen/common/rangeset.c                |   3 +-
 5 files changed, 347 insertions(+), 1 deletion(-)
 create mode 100644 tools/tests/rangeset/Makefile
 create mode 100644 tools/tests/rangeset/harness.h
 create mode 100644 tools/tests/rangeset/test-rangeset.c

-- 
2.48.1


