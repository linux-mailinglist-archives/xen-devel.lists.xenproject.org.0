Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3992AA8426D
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 14:05:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945473.1343663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qes-0007Oc-2n; Thu, 10 Apr 2025 12:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945473.1343663; Thu, 10 Apr 2025 12:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qes-0007Lb-09; Thu, 10 Apr 2025 12:05:26 +0000
Received: by outflank-mailman (input) for mailman id 945473;
 Thu, 10 Apr 2025 12:05:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C125=W4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2qer-00077g-0O
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 12:05:25 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14b43bd0-1604-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 14:05:23 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so5951015e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 05:05:23 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8938a6e7sm4522476f8f.44.2025.04.10.05.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 05:05:22 -0700 (PDT)
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
X-Inumbo-ID: 14b43bd0-1604-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744286722; x=1744891522; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2ggeKlrc0LSDFd6EuqXpDyHFlaXpuPoevqPE8wNviIE=;
        b=eDRCQ5tQ9LAv11DuytD1ufqJPQy1QmOo+bCLA0lDHXaK+Cfd7feCVhHxWqAk1UXQGR
         6ZCvDicNVFXThX9KSMJjt8JORSY8HX4m7CgHMPaNHFZeBfBflbg5Pf2IzNAmNIHuDLHt
         7ZqkQ3NAyX0ab8JXctks1PiT828Yfj/Hypj5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744286722; x=1744891522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ggeKlrc0LSDFd6EuqXpDyHFlaXpuPoevqPE8wNviIE=;
        b=Ty4Gklh2cpmMNHZn9M54GEMHQIRnjcKU9IeXy24wpkeQbqr9LKoQQRRuaxNuqckVFq
         w2FZox6tvVTW+rnOEpBhQmD+N46dPHGhfxuz90hzu1+uxQb1AAC+xZo4nMEuWVNn7UlY
         yTxbthtnI10R0U9wAqJ3wnPAS8ksY2VRLSoS6B5w8svaOMqq8iSE0izp3tif+hk8nekz
         9xluV+RGd1yEss1XFObHDml9GT6cNkhaV4GNPccQc4qeKVdJXRhxUa1qKArdpPmAO5l7
         W311qw/XvBuI/DZEN1h9lcRgZRzfFvU5koJ3zfbEZ22thkyVUMQtX8nzHnd2DOxlwhDZ
         0hFQ==
X-Gm-Message-State: AOJu0YwhQX5T3cvFv7G1cegoydffuINX+wb1JxAZmFPKpcOswo9Ej4gG
	jwD1i8xt0OzNIVrugEmGaYfRhl9bsoCjsV73aTN6baqEVZeiIJf/f4rs5ogAgOHf45h74GYs3SE
	qtbg=
X-Gm-Gg: ASbGncsy3XCR7JtOAlxqh7CZ5j1TH0dvOLvp2rSAJ6iu0P8GM0OFIAzqKWIpwkkogMi
	1hPQQZqO/EZq5Q0CeeYO9HAmjiqxFXm3ciR4g6sADtPbdiQquoltEUYBtzTygl/o7TxiXJFTSeo
	644GBa02ZDIVf/+fU177Zc+nuCJ74Iwtjq3gRmFRRB2IT9fQURyHstoDTkHk+LD4HjzTfCD5+3i
	mX2vsMStijqoMzfThPGfEMuotEwC0M6sLTm2PI49ol2OuNSIHQODUNrrZhhIKPSjARMH60sADHL
	r/Y2FbKVjG4Bk6FG4Fdf86RdLDGU7eQELtQ1KC4WhIISR9zqE1wL+CgdnzHma7v1sk7Xf0KS7x6
	WJRgVLOidZ+IzuA==
X-Google-Smtp-Source: AGHT+IFEKh+i8+0gcX5Stv66c/x1etme26vDsQrdxGjEB2LV3OUkfS88YtfFsu147gh+HI7ciZ0j2w==
X-Received: by 2002:a05:6000:40df:b0:39c:1258:2dc7 with SMTP id ffacd0b85a97d-39d8f4facc0mr1884369f8f.56.1744286722421;
        Thu, 10 Apr 2025 05:05:22 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 0/3] CI: Cleanup/Upgrade of Linux used for testing
Date: Thu, 10 Apr 2025 13:05:17 +0100
Message-Id: <20250410120520.2062328-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Switch fully on to test-artefacts for Linux.

Patch 3 is a repost.  Patch 1 supercedes a prior posting.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1762221755

Andrew Cooper (3):
  CI: Update x86 tests from Linux 6.1.19 to 6.6.56
  CI: Update ARM64 tests from Linux 6.6.74 to 6.6.86
  CI: Drop stale test-artifacts/alpine/3.18.dockerfile

 automation/gitlab-ci/build.yaml               | 24 -------
 automation/gitlab-ci/test.yaml                |  8 ++-
 .../tests-artifacts/alpine/3.18.dockerfile    | 67 -------------------
 .../tests-artifacts/kernel/6.1.19.dockerfile  | 41 ------------
 .../kernel/6.6.74-arm64v8.dockerfile          | 38 -----------
 5 files changed, 6 insertions(+), 172 deletions(-)
 delete mode 100644 automation/tests-artifacts/alpine/3.18.dockerfile
 delete mode 100644 automation/tests-artifacts/kernel/6.1.19.dockerfile
 delete mode 100644 automation/tests-artifacts/kernel/6.6.74-arm64v8.dockerfile

-- 
2.39.5


