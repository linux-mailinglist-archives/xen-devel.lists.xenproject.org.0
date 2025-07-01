Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E21AF0709
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 01:46:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030116.1403760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWkfE-000873-G6; Tue, 01 Jul 2025 23:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030116.1403760; Tue, 01 Jul 2025 23:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWkfE-00085J-Cu; Tue, 01 Jul 2025 23:45:24 +0000
Received: by outflank-mailman (input) for mailman id 1030116;
 Tue, 01 Jul 2025 23:45:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u5am=ZO=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uWkfD-00085D-96
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 23:45:23 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7382e5de-56d5-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 01:45:21 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a4e749d7b2so1057851f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 16:45:21 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a87e947431sm14509037f8f.0.2025.07.01.16.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 16:45:19 -0700 (PDT)
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
X-Inumbo-ID: 7382e5de-56d5-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751413521; x=1752018321; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OofgqVfnZofG2Ok8ImHga//K217vg60fQZ2u9VIlI3I=;
        b=k/xVltIKCw7DmNxkOu/Tjf6PtRbfNqj9/TR9KeQDNT6uTrk3jFcg/rILFAqf4Ih4rG
         7SpqQS9MpXZJVKfD0pxVieb1oI8exbPCJktVhGmAUjJU3KYov3SusLgg73Rlf6PYo6Zj
         ed0ig/JP6B56qHhu06dW5gwkAPq3DXp1UlUZ/FKv81gPjVja4E3eJ2Wd83kM8TEXNvIK
         lIZNS0x1HLUaG9CsuFhLVwYaSyNd6kuYrUArlRhyNrQIF9zwPiWlqfb5qW9SLIv4FZLg
         AK6wlkUws292X/E0t0gt8NwpHD/zkRPu6g/AcQOYnk62bI1VPtcZxSuoQPZqQJLB57AT
         TJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751413521; x=1752018321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OofgqVfnZofG2Ok8ImHga//K217vg60fQZ2u9VIlI3I=;
        b=n4R7TDlSwF0y6wHr5RDlJQYm082VG1Kkxxwo0hkjy42VfZXPqb/tvylWhLyfudI2pY
         wafVp7wkXqz8u0AMD7vhzJ9auprm6e3ccBK7LcYBMXuymHX+B2/hDzzQjI6NVgHaY6qZ
         QTvqJvgWdBIss82Kp4zRuSAYQ7CZ707pA4RRc5L6nEJFLB3bkA0mB32UR3U6yTISmd9v
         lwp4XuljTRCjX6HXHvzjxtwNB3/4/LvLJG42JeC87yZ9YIYYqH/cU9HhN63vzm9T3dWZ
         sRrjbOFd6cw1n3NFweFVUP+OW2NRpi1j+ZRX1zq+qU4LNithyE1IX2Oy5r+L8MRu5f4z
         knfQ==
X-Gm-Message-State: AOJu0YyhpQEgq9qO2SdCLgKL9/G+QJ4bSThAh94PeCxO7hMcbVWIevar
	6sSQvvfWg10w/P63uzDBn6gUi+i3zKTaK8HmT/sKqLHL9sW82n+qSAXt9Ns7oQ==
X-Gm-Gg: ASbGncuspOYCpGcsYXgMIoVak9GNW32y2yGOdZD9y6XSB57w/g+HilbPm5pnrNuwyJr
	yapS4PPo2HrMNnFxIzQBp33kwA4uCLWCo1aEL2ziT/WsZjJbZhQNUFMnppXlUok62zoAR6WWsDo
	CV+bzqO36uZOQc8RYqJnFMo9XYrN7RGT7cmJRyPyvPsLvWu1oGheWkLGJMQB+Ihk6NAzr5bCkDv
	TxbKUUlQbOFEXEi3g3ZIiODO2HoVauUf0btk9b/gx3d4rMBOOQskm9IpKcGRWdbkB0g16inVUmu
	mPZZRcVNE9ndX5Q42T4d+w2Ov6bpAcRFYomidRXGFyrM6Q6N8+lfypJ5k/YWDN0HPYrYPk3iPl1
	eHZ9X/Lxqc2jBotNTJa+VJ+6dw2HE98GzsYQ+eNCTo9o1GoXwXcNj9u/8/6pkVzmgzstz799o
X-Google-Smtp-Source: AGHT+IH/kLFGhb/5o+HVe9X/dgY+dHOtkuC/GQLrj9aew81IkS2lsXmBfhvB5oADsVAT7KtA2c/thA==
X-Received: by 2002:a05:6000:440b:b0:3a4:dd00:9ac3 with SMTP id ffacd0b85a97d-3b2002a19efmr63894f8f.12.1751413520461;
        Tue, 01 Jul 2025 16:45:20 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 0/3] hvmloader: add new SMBIOS tables (7,8,9,26,27,28)
Date: Tue,  1 Jul 2025 23:45:09 +0000
Message-Id: <cover.1751412735.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

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
  hvmloader: fix code style violations
  hvmloader: fix SMBIOS table length checks
  hvmloader: add new SMBIOS tables (7,8,9,26,27,28)

 tools/firmware/hvmloader/smbios.c       | 204 ++++++++++++++++++++----
 tools/firmware/hvmloader/smbios_types.h |  83 +++++++++-
 2 files changed, 254 insertions(+), 33 deletions(-)

-- 
2.34.1


