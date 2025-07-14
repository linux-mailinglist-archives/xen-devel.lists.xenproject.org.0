Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 666A5B04B09
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 00:50:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043213.1413366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubS0P-0000xO-MZ; Mon, 14 Jul 2025 22:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043213.1413366; Mon, 14 Jul 2025 22:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubS0P-0000up-Hg; Mon, 14 Jul 2025 22:50:41 +0000
Received: by outflank-mailman (input) for mailman id 1043213;
 Mon, 14 Jul 2025 22:50:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c3lH=Z3=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1ubRzE-00040h-Vy
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 22:49:28 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb9d08f3-6104-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 00:49:27 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a4e62619afso496491f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 15:49:27 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d4cbsm13713725f8f.50.2025.07.14.15.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 15:49:26 -0700 (PDT)
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
X-Inumbo-ID: cb9d08f3-6104-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752533366; x=1753138166; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EJSxHFYpSzFCKcxn/+9vlcfxUSfLrBPs68d15xOntgc=;
        b=F4VeiBAPyQNcTicCe6nbJwnsxn80ZbFeq1Auh6duYawI2jMrCObdG+3S3NfSXCRwPH
         xGqfG4Jnp0x5G2Kzau6HjEVGKDuHcZZex9j0ZyS1iKHg52F0q7f6JyccL8Kv5laRjVd/
         0jVEAPACktKqHp5F2cn5Z1sJzXakPOmJbT9P/cyMszqpi9NWMV8jvGNNrFamgy3/RAAa
         4TYPy5XmTfPnl7xC0Ms1lQgq7YWPUuITkKDlkDKVG+nmOdk/m5HtDjKFljB7eNkFN3a5
         TpNNaJTbILBgWHoEuRtWt91id94AY7IggWysbn/x9LGs9ZGdFuW3VI0mvPwYzUMWkkgD
         MuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533366; x=1753138166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJSxHFYpSzFCKcxn/+9vlcfxUSfLrBPs68d15xOntgc=;
        b=CqFSyUbMtIKePXxxBVEG7qN2HDKVJps4SpnNQqDZLAHLpWB9Q0PAyrPrcwuQp++Rhs
         73JatKkoxpRkwB7DOX1wpgnZrONLQKaJSwRgoHl19oaS9KCPShJPh+weqndds/2iX4TO
         mZYD7A81EP2j7+j/APuzFrlsUV7wqVgh8zGVAkoUJjEOoRJiE+0UjoaV9RvdHmvWMPG6
         G4NZ3iGWHM8pD48hsf606kBGJ3wm0r/hl2nJJADgcewHvBAePwZTJBClwJZjUQbto+3Z
         etZlIjHFft9fivyljOmWsSHFwutMgznp5r39x+EQdjA64Okhh8rRF5QqBrc19xQYqPh8
         zzZw==
X-Gm-Message-State: AOJu0Yxap9XQmy800Me6GckCiGbRy7Onz1kqqUt024/0d7job01+kzxx
	oooz240d5/46M9t81fTMQkkMB+LUZk8+9mmLAtYF23nCk7ThiEI9Qx69g8MVJQ==
X-Gm-Gg: ASbGnct1Q1C5/3xChCMLvcWhJqYTIVWJyqSfU/VRhcmRAeB0jHuBpnhjzWg8YVeFDPw
	hxAlULYBCCsATycqjIwW3cVAAkMflZqe9TRK8EsquT5G+XTH6YVERuuv4FWD2KBrGMd5uUtMXCM
	C/Z/oi7ghGqA6h4+qsavXcckt7UEp4BKXxGl5hR37pgJRh1iSkX/I3m5wwdRMEzbLEnQYzucB1I
	Xkdzym61Q4184jfHdWszVKCNNo2rb422JC7PXA97ryVr37VWQamuCF4Y9NkgREq8f7mau1C7tQw
	7QT2EY5RbezUpL3EbhlGbEPSU4y190H6bJybA1S+YNkpEOlFBbNZLjDmXIm9Go7cqI2NgLSVOzq
	cH+QrcsrDsITww4C7FicAxb6Yp4nPyPwPTXWVS/Yr+ir057DGTSnFnsMyP+UqM6euHhrFjHtd7d
	CC82QZhJdlAurr9JhNvYzh+A==
X-Google-Smtp-Source: AGHT+IGl2hg0vupaO5ojxYLHSOyAV77tc0YD9sav+HHfvvwkO3G4ZhEPbEcp92gzIZ8N7BuN6VcDkw==
X-Received: by 2002:a05:600c:8b84:b0:453:7be3:3956 with SMTP id 5b1f17b1804b1-454f42721fbmr45206605e9.6.1752533366439;
        Mon, 14 Jul 2025 15:49:26 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 0/3] hvmloader: add new SMBIOS tables (7,8,9,26,27,28)
Date: Mon, 14 Jul 2025 22:49:20 +0000
Message-Id: <cover.1752533080.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Changes since v1:
- Swapped the order of S-o-b in the last commit message.

Resubmitting patch from Anton Belousov and addressing review comments
from Jan: https://old-list-archives.xen.org/archives/html/xen-devel/2022-01/msg00725.html

Original message:
> SMBIOS tables like 7,8,9,26,27,28 are neccessary to prevent sandbox detection
> by malware using WMI-queries. New tables can be mapped to memory from binary
> file specified in "smbios_firmware" parameter of domain configuration.
> If particular table is absent in binary file, then it will not be mapped to
> memory. This method works for Windows domains as tables 7,8,9,26,27,28 are not
> critical for OS boot and runtime. Also if "smbios_firmware" parameter is not
> provided, these tables will be skipped in write_smbios_tables function.

Further explanation:
Some malware samples are known to check presence of various hardware components
(like CPU fan, CPU temperature sensor, etc.) by WMI queries. If these components
are not present, then malware can assume that it is running in a sandbox and
will not execute its payload.

This patch will allow security researchers to create a custom SMBIOS
firmware binary file that contains these tables.

Petr Beneš (3):
  hvmloader: clean up SMBIOS code style and formatting
  hvmloader: fix SMBIOS table length checks
  hvmloader: add new SMBIOS tables (7, 8, 9, 26, 27, 28)

 tools/firmware/hvmloader/smbios.c       | 354 +++++++++++++++---------
 tools/firmware/hvmloader/smbios_types.h |  83 +++++-
 2 files changed, 299 insertions(+), 138 deletions(-)

-- 
2.34.1


