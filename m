Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2AFAE5F60
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 10:32:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023357.1399337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTz4g-00023B-B7; Tue, 24 Jun 2025 08:32:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023357.1399337; Tue, 24 Jun 2025 08:32:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTz4g-000208-7o; Tue, 24 Jun 2025 08:32:14 +0000
Received: by outflank-mailman (input) for mailman id 1023357;
 Tue, 24 Jun 2025 08:32:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aTSQ=ZH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uTz4e-0001zK-OQ
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 08:32:12 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b96903b0-50d5-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 10:32:11 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45348bff79fso55640205e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 01:32:11 -0700 (PDT)
Received: from localhost.localdomain (253.226.6.51.dyn.plus.net.
 [51.6.226.253]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e8050f53sm1322365f8f.3.2025.06.24.01.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 01:32:10 -0700 (PDT)
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
X-Inumbo-ID: b96903b0-50d5-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750753931; x=1751358731; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yEKcMdqGBUYMaK8hVsdH0Ud6UR9wmE3/cnH1SRqJ8e8=;
        b=QhQNvW6m0gWK6gbbJgxESSmULWPcVfQOR1PiRwJNAIcvqKKE5PldzNtc6qZ6BmhHVU
         JSHfcAsZVI3p1h7l/CpO7HQgj4uXYlLI/KZvtNev/4BbKI6T6pLGlbdgoJTHkqZTKiDV
         7LrF+IHCcseGtoH59gipncBtLpG7yyQXwwbuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750753931; x=1751358731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yEKcMdqGBUYMaK8hVsdH0Ud6UR9wmE3/cnH1SRqJ8e8=;
        b=GLV3TWZiMgzkm5G8+bwZzMMy+Qpvr+Ppuzjf3E2cG2X5lTg5cGz/skNOaon31hIu3X
         Qzv3Sxsn/M4K8cAUIL86IferoFXCfHZBGhauBguhEpwSINLs3dcuniAfIDfkuV8OeZZh
         wF81B4Be3VHVxV0l2MCSR3uf33kJOdSQPQj5Y6QlFHFwRdwMS8V+ZldfXWQaC98t5lWS
         qJk8zJmH7Qg4QCVbszQH2dHDOOFT+DDKbYKm745kbfr9yz4+AwTIEayE2QU72ifM/Lne
         UcJQgeyobmgEuep4haO8LjcAHrnKkEDD+eUasG7xtJ9ypGTU6yGUdO6U3W3cxcTdvB6a
         bOdA==
X-Gm-Message-State: AOJu0YwMLf6DQWiK4Sn4zyna5MG4oQWge64JFT0sT+GbX+S6d8Q8gGb3
	mJ8BLrRWEQMemCHn9/sLTX7QsEkZ5QPRnzi7Dzq0+38pfAM3RMri2PFAcX9BBaJe3EeiS9okEn6
	+44MM7q4GSw==
X-Gm-Gg: ASbGnctgp+WHVvuQDlsB4zGJe3R7JWy8CVsY4DuvbVENL20B+sxexY6dEH9RRteL5U2
	Rk2qeH3ho1mvWV0RFIvNcJpivcL3klDo/JB+kqdi6Qf2JI/93ENlrBk1FKY9xLNxsO69SSs9cpc
	cMyeVvRiPL50JOOhv+Y9ejEThOtSpIG3SuNDRyW0Szd5RC8yqVlinIS+mLwAUsKoSgF3XTimjQd
	ET6dAbMRykcctfbgjNjVkchKPIkOFQKNeJc/RdvS5eTtcGPx1dbslOhx0d+BYVdV/qMRkZFh1M1
	xjnLnnhx2PE2p92Kh17HDKHTtYy4o8ZtgIDD0cLQlNrq3vQ6x8maQLcUBIk5NHOM939HWU130a/
	AJworVzKmBCLJzeP7XGwLcnAAkpQwYg==
X-Google-Smtp-Source: AGHT+IGAtjt0m5rF6HsoH8uL19IHgC1D08/2KiW3QwwtBYuh93HJxdezCPFwKw86fsqnQHAqKtBWpQ==
X-Received: by 2002:a05:6000:4282:b0:3a5:783f:5296 with SMTP id ffacd0b85a97d-3a6d13339f6mr13449619f8f.56.1750753930894;
        Tue, 24 Jun 2025 01:32:10 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] xen/efi: Make boot more flexible, especially with GRUB2
Date: Tue, 24 Jun 2025 09:31:53 +0100
Message-ID: <20250624083157.9334-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The combination of GRUB2, EFI and UKI allows potentially more flexibility.
For instance is possible to load xen.efi from a no ESP partition leaving
a boot loader like GRUB2 taking care of the file loading.
This however requires some changes in Xen to be less restrictive.
Specifically for GRUB2 these changes allows the usage of "chainloader"
command with UKI and reading xen.efi from no ESP (so no DeviceHandle
set) and usage of "linux" and "initrd" commands to load separately
the kernel (embedding using UKI) and initrd (using LoadFile2 protocol).

Frediano Ziglio (2):
  xen/efi: Handle cases where file didn't come from ESP
  xen/efi: Support loading initrd using GRUB2 LoadFile2 protocol

 xen/common/efi/boot.c     | 98 +++++++++++++++++++++++++++++++++++++--
 xen/include/efi/efidevp.h | 21 +++++++++
 2 files changed, 116 insertions(+), 3 deletions(-)

-- 
2.43.0


