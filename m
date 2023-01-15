Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A619966B0AA
	for <lists+xen-devel@lfdr.de>; Sun, 15 Jan 2023 12:31:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477857.740750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pH1EN-0004fL-Hz; Sun, 15 Jan 2023 11:31:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477857.740750; Sun, 15 Jan 2023 11:31:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pH1EN-0004cu-EY; Sun, 15 Jan 2023 11:31:19 +0000
Received: by outflank-mailman (input) for mailman id 477857;
 Sun, 15 Jan 2023 11:31:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ytYW=5M=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1pH1EL-0004ci-7y
 for xen-devel@lists.xenproject.org; Sun, 15 Jan 2023 11:31:17 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ee07df1-94c8-11ed-91b6-6bf2151ebd3b;
 Sun, 15 Jan 2023 12:31:15 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id hw16so50183816ejc.10
 for <xen-devel@lists.xenproject.org>; Sun, 15 Jan 2023 03:31:15 -0800 (PST)
Received: from dsemenets-HP-EliteBook-850-G8-Notebook-PC.. ([91.219.254.73])
 by smtp.gmail.com with ESMTPSA id
 uj42-20020a170907c9aa00b0084d4e612a22sm7459961ejc.67.2023.01.15.03.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 03:31:13 -0800 (PST)
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
X-Inumbo-ID: 1ee07df1-94c8-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7XAphPrE39ytJWfoWHxTfI0tyCLfujC+d0fBUUNoF74=;
        b=JvrZoBJe8PUuaG7x7fP/I2qQZ6QMKEQwzm4Mt9TAn2RN3tK8xK0iaP5t4zvPDvxqAP
         osDi9CDWl3oyGvvcVbJwLRJyboMwTw4OSi3USoEpL871jdYj1m9suv12yu03yrASQiq7
         DdySg1woP5U1uPfDV8EAt3IYuUulbHpuQl61SinOBV4Xl2fWkpGKndlDtU5MZJHPpjjS
         VlMULBEYoGvbjeAADFyymegoJrQNV1T1+UM/7yJ2Ax7s4Qi+YbWc0GQ4TJFcNn5W0pqi
         khZec1Tr+VbpgP1GpQhFbCttQkli8Jd3TiCyJ8XsrzhOH4ObE88LE+swNZm1EX+7pNYp
         lANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7XAphPrE39ytJWfoWHxTfI0tyCLfujC+d0fBUUNoF74=;
        b=d7Gz2+Hee2Yla3n/xx6GEximInfEZhEyvWn8F4bVO0qE5QlpEL5F+lWwjBvBtcztfe
         uCaNtrBs5TDiQtMD8lYc9PVNoue7gsWr4fDokU0y0SFHNzs+5YQTdE5HdJmY2w80gA8D
         LtqPY9iklX7uTcOZtNEZUVp6sPpYe7yjKCzQiteL30Ry47Gv1cyBrVNERlDm/vhuJCru
         enr/Fks9QU53R56TPhbPCn+T/lcQQryqUxRcGtIaPyhSfqqUiiKNIsj/eUyo8TtW3D5X
         +1ypLb/TFO18d4yeQN6kvM0Lef/YJuKJtTkp5NeHusKQYExUoY3eo7riiZJEXtWt+r/a
         ZVlg==
X-Gm-Message-State: AFqh2krlCZdzqeJe/8CegZ65uZX6TEIwdAvqoxPSpy1roJHG7iHREuoO
	YKARkDQZMLeSHH96R28CanBws0FeIUuV8pGC
X-Google-Smtp-Source: AMrXdXtzJ3uR1zUwQqYLE9gXRcxLuTgDDYkx+NCVgp+9bAVY6JpmUT1R8r3hUxngS28aUXRSPJRdWw==
X-Received: by 2002:a17:907:7707:b0:844:c651:ce4b with SMTP id kw7-20020a170907770700b00844c651ce4bmr71819279ejc.33.1673782274232;
        Sun, 15 Jan 2023 03:31:14 -0800 (PST)
From: Dmytro Semenets <dmitry.semenets@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Dmytro Semenets <dmytro_semenets@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [RFC PATCH v3 00/10] PCID server
Date: Sun, 15 Jan 2023 13:31:01 +0200
Message-Id: <20230115113111.1207605-1-dmitry.semenets@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmytro Semenets <dmytro_semenets@epam.com>

PCID server used if domain has passthrough PCI controller and we wants
assign some device to other domain.
pcid server should be launched in domain owns the PCI controller and process
request from other domains.
pcid server needs if domain which owns the PCI controller is not Domain-0.
Changes:
patch with subject "remove xenstore entries on vchan server closure" removed
from patchset because it already merged.
patch with subject "Add pcid daemon to xl" divided on several patches because
it was very large.
Fixed crash in some cases
Fixed memory leak
Fixed false client detection.

Dmytro Semenets (6):
  tools/libs/light: Add vchan support to libxl
  tools/xl: Add pcid daemon to xl
  tools/libs/light: pcid: implement is_device_assigned command
  tools/libs/light: pcid: implement reset_device command
  tools/libs/light: pcid: implement resource_list command
  tools/libs/light: pcid: implement write_bdf command

Oleksandr Andrushchenko (2):
  tools: allow vchan XenStore paths more then 64 bytes long
  tools/libs/light: pcid: implement list_assignable command

Volodymyr Babchuk (2):
  tools/light: pci: describe [MAKE|REVERT]_ASSIGNABLE commands
  tools/light: pci: move assign/revert logic to pcid

 tools/configure                               |    8 +-
 tools/configure.ac                            |    1 +
 tools/helpers/Makefile                        |    4 +-
 tools/hotplug/FreeBSD/rc.d/xlpcid.in          |   75 ++
 tools/hotplug/Linux/init.d/xlpcid.in          |   76 ++
 tools/hotplug/Linux/systemd/Makefile          |    1 +
 .../hotplug/Linux/systemd/xenpcid.service.in  |   10 +
 tools/hotplug/NetBSD/rc.d/xlpcid.in           |   75 ++
 tools/include/pcid.h                          |  228 ++++
 tools/libs/light/Makefile                     |    8 +-
 tools/libs/light/libxl_pci.c                  |  673 +++++-----
 tools/libs/light/libxl_pcid.c                 | 1110 +++++++++++++++++
 tools/libs/light/libxl_vchan.c                |  496 ++++++++
 tools/libs/light/libxl_vchan.h                |   94 ++
 tools/libs/vchan/init.c                       |   28 +-
 tools/xl/Makefile                             |    5 +-
 tools/xl/xl.h                                 |    1 +
 tools/xl/xl_cmdtable.c                        |    7 +
 tools/xl/xl_pcid.c                            |   81 ++
 19 files changed, 2613 insertions(+), 368 deletions(-)
 create mode 100644 tools/hotplug/FreeBSD/rc.d/xlpcid.in
 create mode 100644 tools/hotplug/Linux/init.d/xlpcid.in
 create mode 100644 tools/hotplug/Linux/systemd/xenpcid.service.in
 create mode 100644 tools/hotplug/NetBSD/rc.d/xlpcid.in
 create mode 100644 tools/include/pcid.h
 create mode 100644 tools/libs/light/libxl_pcid.c
 create mode 100644 tools/libs/light/libxl_vchan.c
 create mode 100644 tools/libs/light/libxl_vchan.h
 create mode 100644 tools/xl/xl_pcid.c

-- 
2.34.1


