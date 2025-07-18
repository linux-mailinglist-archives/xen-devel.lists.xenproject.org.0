Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC33B0A60D
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 16:20:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048841.1419037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uclwc-0005vj-2U; Fri, 18 Jul 2025 14:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048841.1419037; Fri, 18 Jul 2025 14:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uclwb-0005sw-VS; Fri, 18 Jul 2025 14:20:13 +0000
Received: by outflank-mailman (input) for mailman id 1048841;
 Fri, 18 Jul 2025 14:20:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00bL=Z7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uclwZ-0005sk-SL
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 14:20:11 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50451be3-63e2-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 16:20:11 +0200 (CEST)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-4563cfac2d2so6109995e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 07:20:11 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca48cb9sm2005490f8f.45.2025.07.18.07.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 07:20:09 -0700 (PDT)
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
X-Inumbo-ID: 50451be3-63e2-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752848410; x=1753453210; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2BOKcGeIDl9E0a2EmN9SZkFnCoDGCuHRYDNOE99HgqE=;
        b=cQsuNS0pJcaZ/xpnira6zt2s+mdoyCnf+pFON3NVl1O3VCx6sm6IVAlrql14h/ovmE
         pPJQq3l3y41I7s07nu/8iNnMb5KKuv47ql2tdefKXKMBY/DoR4YLAU4VtuevrcuQWCTv
         eXxvDBIzk3dSEOSzpy5AMv680JgvuaTTA3ffk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752848410; x=1753453210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2BOKcGeIDl9E0a2EmN9SZkFnCoDGCuHRYDNOE99HgqE=;
        b=dZLJV+fuy1G98pQc8En66lWxgQErBivFNITHSfv6Tib8cwPtRO+8muT974DkQWwjRJ
         CCNC8uRg8qE81IRZ4R3HGwYp/e1OZ1DOZ56ZYgr7j8QQDNj5NskC1eJJw6RtovpZVy/x
         rX/3ljAxaZFNIwhf0GsAl2TVBxtRhCn33r+AxB0REKc5tWTVcx7wSYGw6DHis7ojWwgp
         cQFbHaiczOa3GOq7m6IdrW5vBHoGWsuohVkMpNriYQ3WJdXSbgI6iDeBBN/rEkAeS2qI
         N8XuBBhZ9YMVYyGjU+jUHe4RkQ6Wn3AIqsyKm8qf5VxIXKsov7Xzdx4Eir9FRNWKjO4A
         gRCg==
X-Gm-Message-State: AOJu0YyMoL9UaB7Wwn29bwql4yfNUI9niJWFZcnBxWP1xvms4zncPczm
	7wMsmy3W/wz2ZBi4JAQsbSO6yH0Q32IbZqgAGLI+m5OtUN83l2lm9RIygyc6Aaip3Ax9q7CVLVD
	kgaFqxlCxjxzU
X-Gm-Gg: ASbGncv1lzeBsycElydQouCkX8k5K58dbDQT/E75Ci68ff6pMCjA1evm1xX+x1opRRv
	NvtcNMTIvmsnBtRzR/cM8C6exdYCyHd59cVEqFUs3PyjT+sJwknSlpbiWL8LUU/dDx36kZlqBpX
	jlXCqPSV5x0AdOGbwLZi3hguTzetcciXYJWAPp2QJtGyjIS79Aocy8EfANyDziKySIldg9GllKP
	hDEvFxclAxmraWStpONHksxQsVqmcZ5g9TNmaEk5G3tZZyLZJ7+ze2AvYC3t4kFWAdvgjizsLAp
	ML8xhsCqMiyBeOdV7CMv7r2XMzn5np61sTs8xSFJo30nN43KFQD0v/LVwQYUnItSpyWIqg3ljAd
	0knaUcQ8BqI1PklSMnaDh7wnzop3TaJ3FOl1I4DBBYReSKwqBcgzBegg3caOVz+OVNT9wvLulXJ
	49
X-Google-Smtp-Source: AGHT+IGgls4RtvGxkI5vILgbhfXM1qb+sjVcgErsiZyI9EHxGKyKTEqkENufwTbkDMB7yK7ktq6W+A==
X-Received: by 2002:a05:600c:444f:b0:456:26d1:445d with SMTP id 5b1f17b1804b1-4562e38007cmr121331115e9.31.1752848410253;
        Fri, 18 Jul 2025 07:20:10 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 0/3] x86: Convert x86_cpu_id to VFM
Date: Fri, 18 Jul 2025 15:20:03 +0100
Message-Id: <20250718142006.2471129-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is the next part of the VFM converstion, focusing on struct x86_cpu_id.

Some parts are already committed.  See patches for details vs v1.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1934588566

Andrew Cooper (3):
  x86/match-cpu: Improvements to x86_match_cpu()
  x86/match-cpu: Support matching on steppings
  x86/apic: Convert the TSC deadline errata table to X86_MATCH_*()

 xen/arch/x86/apic.c                  | 95 +++++++---------------------
 xen/arch/x86/cpu/common.c            | 37 +++++++----
 xen/arch/x86/include/asm/match-cpu.h | 17 +++--
 3 files changed, 60 insertions(+), 89 deletions(-)

-- 
2.39.5


