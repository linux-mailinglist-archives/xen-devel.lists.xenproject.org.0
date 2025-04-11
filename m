Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAC0A85A8B
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 12:54:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947030.1344767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3C1c-0000Cf-UI; Fri, 11 Apr 2025 10:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947030.1344767; Fri, 11 Apr 2025 10:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3C1c-00009Y-P5; Fri, 11 Apr 2025 10:54:20 +0000
Received: by outflank-mailman (input) for mailman id 947030;
 Fri, 11 Apr 2025 10:54:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U3ez=W5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u3C1b-00006G-H0
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 10:54:19 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 508a5674-16c3-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 12:54:17 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39c1efc4577so1006694f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 03:54:17 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39eaf445772sm1653640f8f.91.2025.04.11.03.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 03:54:16 -0700 (PDT)
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
X-Inumbo-ID: 508a5674-16c3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744368857; x=1744973657; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LSyXE7wc9e2524lavEzjKTn0JnKserEyBzI8q+Ec3FQ=;
        b=csZy3alTZqCq5aP9sFj/LTnB3zWHbyWqz8xuLKkum7VDg5YP6YQr9BLu6K6+8/jTxr
         AL4WeKMnxjxvVGHcim7dxLX41PxYn0w3zqxQIrKeCEHAT3ITGiNEwJ+o7sMi2hrmzstX
         GI7S+V13Vx4IdSAhNfExFbib0S5xJd/RX3Ygc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744368857; x=1744973657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSyXE7wc9e2524lavEzjKTn0JnKserEyBzI8q+Ec3FQ=;
        b=Xq/uszNIf8OEgHwFCErulmRarGh0dbLuCvikKzy4Indnn1SWPP+FL4ILE5kqryQ5Yc
         2Zn+LUrdDpNjdyPFBZsN0peLtUgFzWnOvTHuly3GwGP3MGx3L/PvqrQiRcdHK1AY1TKU
         eTfgGaSMM2Kp9llmw6AUPG1cQtF1AEpizLNB1TP/KF5ShyXPsn67dhkQ0DJl3jQSTO2E
         5NwvhVGSiQ9hYsOuDb8AKcB6b3Mts0qhgx+5UFjch/agElfYzo7nklg8FpsKQ35iXK8B
         GLNKHBmd4aVNHyFHHD4ITd7bAWcB6XvmSlFesrFxo0C+fuhxSWeQCF/dDMPDJOLM+VFG
         NTVA==
X-Gm-Message-State: AOJu0YzhUKWvNVcJggAiTghDxIyTJtgYcnjz2u0LjXAf5e368IDulxRt
	xvMqCh9Y4lDorPmVB4d4Tgzarg14eLF7Xntq9pKjNZJzVSSo5YomlOYmI5TpBWGjgZlQPq4MweA
	4
X-Gm-Gg: ASbGncu0jifXl1AJAdwIvEdsomqC7sqBayMMVq1STzDA5tL3MHT0G5eOqSJ+N+E4Eaw
	Z9Vug0cU6RbdZ1TOi/Dt2QOsSPOiyNfjFkxOSrfSzgvi73lT5llq+jVXzKbje9D5Xh18pyR5VbG
	6PCakFoH8R4xTCNctqDWDMcXw/Zdd81vLPmsk5jiGT0pNoUkZ3sOZJ7YZiDvHDgSXompYLI9T8h
	2+LETrPPzWItm6KRPYhQrL70MxkWfYulKn6OiGiAqJDNjprGvLUrHqRo+08UnMnW2Kc8WtXuLZO
	lz9UOxpETEmvH653aYtFTeQYze+L/UjUMoPqRjVh0hoTyg==
X-Google-Smtp-Source: AGHT+IElwm/oXB9fN0my5kbhtM/HKlwyU/UABYZbzfkHS6Q/YFgk/n8Vg6DGgSAZPtg4BEIsWYCs+w==
X-Received: by 2002:a5d:648a:0:b0:399:737f:4de3 with SMTP id ffacd0b85a97d-39ea521f9f5mr1650526f8f.29.1744368856742;
        Fri, 11 Apr 2025 03:54:16 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/5] xen/x86: fix implementation of subpage r/o MMIO
Date: Fri, 11 Apr 2025 12:54:06 +0200
Message-ID: <20250411105411.22334-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Following series include some bugfixes and improvements to the handling
of subpage r/o MMIO accesses.

First patch is a bugfix that applies to subpage accesses for both PV and
HVM.

Patch 2 introduces a helper to reduce code duplication when performing
MMIO accesses.

Patch 3 is a bugfix for using subpage in HVM guest, and patch 4 is an
optimization to only register the HVM subpage handler when needed.

Finally patch 5 moves some PV only code to a PV specific file.

Thanks, Roger.

Roger Pau Monne (5):
  x86/mm: account for the offset when performing subpage r/o MMIO access
  xen/io: provide helpers for multi size MMIO accesses
  x86/hvm: fix handling of accesses to partial r/o MMIO pages
  x86/hvm: only register the r/o subpage ops when needed
  x86/mm: move mmio_ro_emulated_write() to PV only file

 xen/arch/x86/hvm/emulate.c             |  47 +-----------
 xen/arch/x86/hvm/hvm.c                 |  90 +++++++++++++++++++---
 xen/arch/x86/hvm/vmsi.c                |  47 +-----------
 xen/arch/x86/include/asm/hvm/emulate.h |   1 -
 xen/arch/x86/include/asm/mm.h          |  21 ++---
 xen/arch/x86/mm.c                      | 102 ++++++-------------------
 xen/arch/x86/pv/ro-page-fault.c        |  34 +++++++++
 xen/drivers/vpci/msix.c                |  47 +-----------
 xen/include/xen/io.h                   |  63 +++++++++++++++
 9 files changed, 218 insertions(+), 234 deletions(-)
 create mode 100644 xen/include/xen/io.h

-- 
2.48.1


