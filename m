Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E40D0792283
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 14:21:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595650.929243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdV3y-0001MH-Ra; Tue, 05 Sep 2023 12:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595650.929243; Tue, 05 Sep 2023 12:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdV3y-0001Ja-OK; Tue, 05 Sep 2023 12:21:46 +0000
Received: by outflank-mailman (input) for mailman id 595650;
 Tue, 05 Sep 2023 12:21:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddRg=EV=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qdV3x-0000wD-CJ
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 12:21:45 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7062385-4be6-11ee-8783-cb3800f73035;
 Tue, 05 Sep 2023 14:21:44 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2bd0d135ca3so40691601fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Sep 2023 05:21:44 -0700 (PDT)
Received: from localhost.localdomain ([37.69.27.38])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a7bc854000000b003feef5b0bb7sm16637862wml.40.2023.09.05.05.21.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Sep 2023 05:21:44 -0700 (PDT)
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
X-Inumbo-ID: c7062385-4be6-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693916504; x=1694521304; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vo1aRaoDGIJk9TkLkiwceh/LZhlV95aaWzCdG9GKBDU=;
        b=BfgVQRCDJOnM3yMK0uJ3hBQUY/9lG2QjDWObb9idP19MoTmhXCYk5gwxVxqivRiY6F
         rO+SxPxF3M0VD2JB2MT+wQZtZWyH0YDmfP/uAPRem+8nwlleXLKS48nwnLZPQFP0hVsu
         sg+uufTwnPaP07U13wyGyyh4TIxXkxqwElbPf+RCwmuCHYGkmulkgEQlJ6UViKB608K4
         iMA9/LoWsaPnhrsRnKzZ4bbHZRogChpdLlnmC2DoPxoU/NuiH6R1S8pZ/O7NrOuYG9J0
         Wr1XXoH+6NtbfIpzjuF8OGcVGPft4jQ8G6bt1ZZ+zMvD3UjnCeG52+BvnckdfKmnXMbv
         0k+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693916504; x=1694521304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vo1aRaoDGIJk9TkLkiwceh/LZhlV95aaWzCdG9GKBDU=;
        b=dlbH4n9/2PJ4dX5N8KSat/9kNDoGXFMRmdpNckxG9AaXNKUYdpvr6XzMCnuNg3nxso
         J8Lrn1gV49TrB1HcF20ROLysTcm5HfU6HmRdOgSz7NR3GVkseuUxc715GZirfyAQ+Mdb
         FEIyNtigEtQorfM2AH4Kl17Smf+JpqrUfFmWlveoPh0ePlzh+oO1j7LlvJ8RhyR1dbzA
         A0STg8T3TP2QJ3NHFCQMHEUlQdaL0MO5Cqm5Wtb4VDj4YeZ7hkNPussQ3K4eBuXHczwi
         442xfMXkOLR7NIUzQ3dG71VYHvtIGW6wpOnTnRTtRGsYWBRxJEJNNPxN21pOW8/HZXWO
         iWkA==
X-Gm-Message-State: AOJu0YyyAEDnEdUutRBkdpGf5oiEOpAKXwUKEg8vbkn2A6Mly/bdg5fQ
	32xltAGYWehadO878+Gb0dspjw==
X-Google-Smtp-Source: AGHT+IGHceR0DxOo08btZrf4dHcOI+V5se4WRpPBquf7QOLcWBYqYSVeTEjv9tLfnWmKk2ZrPPRgjg==
X-Received: by 2002:a2e:9c06:0:b0:2bc:b8f5:aaf1 with SMTP id s6-20020a2e9c06000000b002bcb8f5aaf1mr8949290lji.35.1693916504432;
        Tue, 05 Sep 2023 05:21:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/3] sysemu/accel: Simplify sysemu/xen.h
Date: Tue,  5 Sep 2023 14:21:39 +0200
Message-ID: <20230905122142.5939-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Trivial cleanups which simplify "sysemu/xen.h".

Philippe Mathieu-Daudé (3):
  sysemu/xen: Remove unuseful CONFIG_USER_ONLY header guard
  sysemu/xen: Remove unreachable xen_ram_alloc() code
  sysemu/xen: Allow elision of xen_hvm_modified_memory()

 include/exec/ram_addr.h |  8 ++++++--
 include/sysemu/xen.h    | 24 +++---------------------
 2 files changed, 9 insertions(+), 23 deletions(-)

-- 
2.41.0


