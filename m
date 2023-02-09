Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A871C690DB0
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 16:56:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492669.762316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ9Ha-0006eY-01; Thu, 09 Feb 2023 15:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492669.762316; Thu, 09 Feb 2023 15:56:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ9HZ-0006cr-TU; Thu, 09 Feb 2023 15:56:21 +0000
Received: by outflank-mailman (input) for mailman id 492669;
 Thu, 09 Feb 2023 15:56:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vyas=6F=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1pQ9HY-0006cl-9b
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 15:56:20 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a1763a9-a892-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 16:56:18 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id h3so2494206eda.5
 for <xen-devel@lists.xenproject.org>; Thu, 09 Feb 2023 07:56:18 -0800 (PST)
Received: from dsemenets-HP-EliteBook-850-G8-Notebook-PC.. ([91.219.254.72])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a170906b00100b0087862f45a29sm1027594ejy.174.2023.02.09.07.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 07:56:16 -0800 (PST)
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
X-Inumbo-ID: 4a1763a9-a892-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nhWZ5xP8ug0pEon/NuBy4vBE1mK/xsvyvXyQ+nn10LI=;
        b=F3S1iq+pYwlbIvtE9ysvRCapCGdVf7bX2eizENTk5/zHuTdIBpY8oFM4g8Lvs9NQ1z
         eMsdBhQQCMvwNxFKNYin6UQg2Bit/a9UADIPlj0+HiEAFW6dk0Lg8rL+NqbCS7V9t+KB
         ec9EVK/RNM0/6UvLrjDjYl0n1RIFISfba5vCTgGN5RtGS/XLhkQFbbShegNbeHRpxZE8
         NiLKHth+4icena/W/lkUt1kihn/s9z5hQazg5HgqEn0/UwOIIOz6C1tL9IIBsuyuqiPE
         /CqkK+YOQThPNclh90cK6fmAnfz+j4TsiWx1ouiR7xEmodanldR4FHo4qPl4sGavelFE
         Nq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhWZ5xP8ug0pEon/NuBy4vBE1mK/xsvyvXyQ+nn10LI=;
        b=MZQVUSAWXhtt7bA9VV+hN3keF9TF7y3XPB6eV9WemKRREgHW9xNUjRu5sn55d6TzlZ
         RMxMXxMZp9njdQ6ZGfhli650BnZ230pqq6sIGp/ARtrbtTBBmfOjqAGIS5lRjFkZjyxZ
         +Ab5Ck2m5ZqGHAmO9KWR0VQMeEyzt4kKhJAzC/f92I9mlzG2ui9wYbRM4Fr9BREPDNoW
         P4K82sGT8l1xFnQs9V/u1cliiFhDesrOC5Awcp4gZsQ5VTw0fdBniCAgu7/qHzW3SXVl
         Ma3oQ2UYkltOQ3O5eudcZf9rKEceI2cysFpYM9/KyXb4cmcGIepRWGaCQFPMChvdmJwz
         TUWg==
X-Gm-Message-State: AO0yUKUhu5XuZTns2WxTlDpytvXy8TZ5CVJeMFcdMAtuMsy/NWu9JP+9
	2PL6Z45qdItVTKqb2yEG6TaQRoJvWHU=
X-Google-Smtp-Source: AK7set+rJYqjx31sRsBUjiRMqE30uHApRRjyJs6X7bFGirA6EBV05Hr1VhZ/KDDlkWe0nXG+s5QbUA==
X-Received: by 2002:a05:6402:34cc:b0:4a2:5b11:1a51 with SMTP id w12-20020a05640234cc00b004a25b111a51mr13552279edc.2.1675958177318;
        Thu, 09 Feb 2023 07:56:17 -0800 (PST)
From: dmitry.semenets@gmail.com
To: xen-devel@lists.xenproject.org
Cc: Dmytro Semenets <dmytro_semenets@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [RFC PATCH v4 0/9] PCID server
Date: Thu,  9 Feb 2023 17:55:54 +0200
Message-Id: <20230209155604.2753219-1-dmitry.semenets@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmytro Semenets <dmytro_semenets@epam.com>

Moved pcid server from xl command to standalone application

Dmytro Semenets (7):
  tools/libs/light: Add vchan support to libxl
  tools/xlpcid: Add xlpcid daemon
  tools/libs/light: pcid: implement list_assignable command
  tools/libs/light: pcid: implement is_device_assigned command
  tools/libs/light: pcid: implement reset_device command
  tools/libs/light: pcid: implement resource_list command
  tools/libs/light: pcid: implement write_bdf command

Oleksandr Andrushchenko (1):
  tools: allow vchan XenStore paths more then 64 bytes long

Volodymyr Babchuk (1):
  tools/light: pci: move assign/revert logic to pcid

 tools/Makefile                                |    1 +
 tools/configure                               |    8 +-
 tools/configure.ac                            |    1 +
 tools/helpers/Makefile                        |    4 +-
 tools/hotplug/FreeBSD/rc.d/xlpcid.in          |   75 ++
 tools/hotplug/Linux/init.d/xlpcid.in          |   76 ++
 tools/hotplug/Linux/systemd/Makefile          |    1 +
 .../hotplug/Linux/systemd/xenpcid.service.in  |   10 +
 tools/hotplug/NetBSD/rc.d/xlpcid.in           |   75 ++
 tools/include/xen-pcid.h                      |  229 ++++
 tools/libs/light/Makefile                     |    8 +-
 tools/libs/light/libxl_pci.c                  |  673 +++++-----
 tools/libs/light/libxl_pcid.c                 | 1110 +++++++++++++++++
 tools/libs/light/libxl_vchan.c                |  496 ++++++++
 tools/libs/light/libxl_vchan.h                |   94 ++
 tools/libs/vchan/init.c                       |   28 +-
 tools/xl/Makefile                             |    3 +-
 tools/xlpcid/Makefile                         |   52 +
 tools/xlpcid/bash-completion                  |   20 +
 tools/xlpcid/xlpcid.c                         |  213 ++++
 20 files changed, 2810 insertions(+), 367 deletions(-)
 create mode 100644 tools/hotplug/FreeBSD/rc.d/xlpcid.in
 create mode 100644 tools/hotplug/Linux/init.d/xlpcid.in
 create mode 100644 tools/hotplug/Linux/systemd/xenpcid.service.in
 create mode 100644 tools/hotplug/NetBSD/rc.d/xlpcid.in
 create mode 100644 tools/include/xen-pcid.h
 create mode 100644 tools/libs/light/libxl_pcid.c
 create mode 100644 tools/libs/light/libxl_vchan.c
 create mode 100644 tools/libs/light/libxl_vchan.h
 create mode 100644 tools/xlpcid/Makefile
 create mode 100644 tools/xlpcid/bash-completion
 create mode 100644 tools/xlpcid/xlpcid.c

-- 
2.34.1


