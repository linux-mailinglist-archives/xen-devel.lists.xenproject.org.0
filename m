Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D94FBB076ED
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 15:29:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045188.1415314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc2Bq-0000Pz-C1; Wed, 16 Jul 2025 13:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045188.1415314; Wed, 16 Jul 2025 13:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc2Bq-0000OV-9J; Wed, 16 Jul 2025 13:28:54 +0000
Received: by outflank-mailman (input) for mailman id 1045188;
 Wed, 16 Jul 2025 13:28:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFaK=Z5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uc2Bo-00089u-Mg
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 13:28:52 +0000
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [2a00:1450:4864:20::442])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd8acd52-6248-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 15:28:47 +0200 (CEST)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso4949430f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 06:28:47 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e8075d6sm21076205e9.16.2025.07.16.06.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 06:28:46 -0700 (PDT)
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
X-Inumbo-ID: cd8acd52-6248-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752672527; x=1753277327; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lPn6DW8204WPKZS2b+8OxZ4/co6aG1KQR9kOVW1bhSQ=;
        b=JhmoHsfRvi0Coqwn2IaFCJQVaowYEZItK8hmK+ILzkZPyhmdu1/fh39ucRnHet7p5K
         3gMXnPSY+3bXysPgSdcm6wCuWzXvkyaTek77xi8E+V8Ar0nEdhO9yTkcYY5eSfYhxBiz
         94T9TiAgbvK8LncSO28BidkHGXaeXNlc/mEUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752672527; x=1753277327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lPn6DW8204WPKZS2b+8OxZ4/co6aG1KQR9kOVW1bhSQ=;
        b=tOvjRYJ++hr5l7aoJdL8uachwco5qVGGQH/I+ao1sQwI8pYtE+FtK3/vsMxnz0fs2S
         3+QL8oG+4WuVIp5aMNh+0iwEnKdyokILxfkEwhTY79QYu+1+W7IMSNnsnjU/uV8TJCED
         Mzl/p2tg7Raainm3IJ7F2WCLMbM6IYGoFWSdo99DjP7c3Hte/H1PirTcCYpJhXjAA9V+
         uWPD70MA6tQXnwQ1HOBgyjmdgzZpJ7YJD4U0HFyoZUR3TUW9NWRRz7/R/zG2Tpa5B95U
         ORpt8A+UWpOkSgrdfqG2eyEYyMGk+5YgKMCTsJo32QGohJUGy9aaTVJTtBfIKMB9pIaS
         xF8Q==
X-Gm-Message-State: AOJu0YzuwqsTFz4lVKZ3+BGABePUGKPEMZCyQ0KY4SzXAaujl1Otu+2Z
	9u3yKpt3+eODtp4iu6Y10KSVePvPD3Fww8k6Tsb4LtkmG/GZHSrrowf4ubjkhG+T0JcMHhml/e1
	USfb35DWqZaEV
X-Gm-Gg: ASbGncvpJu/WOvpfmsV8psNQMbcYQUxzsKbthSAsC1XzNck5j+YSdaZgRnVwfmTl1TN
	j/dsWCKiAUEt6kR4YW7iDRcC8SsxX1KAjV9Nm545o2QLwWNwIfUbfzrXzzDNg7hiG9/eztSWZRK
	AWFnfGU/ScqX8mmzhZhRqP6zSmZ+9UkLVA1kNLXdWS2H7pZZdu9m/dPrBdabY/6XJa+dJS7tLeh
	nzFFl4c1tW3nrcLsG/lTURaAY453hRV8JbE23jNu9iPOT3cyJf/TsZRfLlaJiGjDYSIxKQXzc0P
	T5Vp7ynuJiDzXvnVIPUQ/1KYiDBl9dBKoIbXwMP9BGVd2PZURLRVKYGCFQ8pFENSw6DJgmV3HUZ
	4VbGHytHGPBI0aoDRQlt7Eo97jHoFlGHhzmpbeakZaBjCJUajGaNyi0ZwXbZ7W3KDxsM6ji3iYl
	vB
X-Google-Smtp-Source: AGHT+IFoQQ/CdGbKbQh7kVHuEOq4Eelj6defOlpP29GsNv2I2IO9V/mRYZ0MgooUI8PiAnD9Qw4Yvw==
X-Received: by 2002:a05:6000:2892:b0:3a4:f7e3:c63c with SMTP id ffacd0b85a97d-3b60e435a46mr2185123f8f.0.1752672526642;
        Wed, 16 Jul 2025 06:28:46 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/3] x86: Overhaul of vendor/family/model logic to support DMR
Date: Wed, 16 Jul 2025 14:28:40 +0100
Message-Id: <20250716132843.2086965-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Intel have run out of model space in Family 6 and will start using Family 19
starting with Diamond Rapids.  Xen, like Linux, has model checking logic which
will malfunction owing to bad assumptions about the family field.

Follow Linux's lead and combine Vendor / Family / Model into a single
constant, so it is harder to mismatch family and model checks.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1930124712

Andrew Cooper (3):
  x86: Rearrange struct cpuinfo_x86 to introduce a vfm field
  x86/intel-family: Resync with Linux
  x86/vtd: Switch model check to VFM

 xen/arch/x86/include/asm/cpufeature.h   | 45 ++++++++++--
 xen/arch/x86/include/asm/intel-family.h | 96 ++++++++++++++++++++++++-
 xen/arch/x86/setup.c                    |  4 +-
 xen/drivers/passthrough/vtd/quirks.c    |  7 +-
 4 files changed, 141 insertions(+), 11 deletions(-)

-- 
2.39.5


