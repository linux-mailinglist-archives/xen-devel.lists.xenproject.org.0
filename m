Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A242A3B82E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 10:22:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892509.1301477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkgHJ-00084p-Fo; Wed, 19 Feb 2025 09:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892509.1301477; Wed, 19 Feb 2025 09:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkgHJ-00082w-BB; Wed, 19 Feb 2025 09:22:01 +0000
Received: by outflank-mailman (input) for mailman id 892509;
 Wed, 19 Feb 2025 09:21:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bQLC=VK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tkgHH-00082q-Tu
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 09:21:59 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7b21f37-eea2-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 10:21:59 +0100 (CET)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-220bfdfb3f4so130942185ad.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 01:21:58 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-732425463ebsm11840304b3a.19.2025.02.19.01.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 01:21:56 -0800 (PST)
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
X-Inumbo-ID: f7b21f37-eea2-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739956917; x=1740561717; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gGcvgLQoClXs80g5vbFFNvxScD5flsZCA4rpWM74C3M=;
        b=tAVyodOvx23w+DPuFEUAD7xYHDTvBp/VcxX/82CVoLUXD4xrQNttDyt44JaaKTJnU/
         XD53ZIVUeKUPtQxbpgxYAy/He9XfrR58T3vIpgES+5ULTfsHVk+7PwMsUNeOmMksR62M
         HuAyEhgRiJejd/UNeOROnc7x+Z9ygvMHqQ3Oc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739956917; x=1740561717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGcvgLQoClXs80g5vbFFNvxScD5flsZCA4rpWM74C3M=;
        b=hvH44OFHbPS1JDubkV/FSJy1YaTj1nS/w5ZqHJN60zEtHQiKVwekPdk5iufFgClXxC
         ZkqrIh2hhSK+nbRwvx/tolzlnsLfJMp/iuvoTHWa7Ch9PeMhQ/VQnJhEiicPxvua+VQy
         5c33dpJTl6g3015vZIOXl3+Hkid/ig42/BatY0MelRGS/6zcMBrESTGVVyh3knxxGUns
         +y/q+iqXR8olRHlRJ5wdEtMXA9h2Zc0+4Cwzulh6vTufw1iodT56C7SsvBd8NjPi2OHs
         S8xDi9WQKq/ASZpAMYR7LqGN+fFyNp9Zjn8ZB9ZXbeCf9Fi+nJarpIZjxWWB5mUixdlb
         K7bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVANHm2Q4vDDQ9UPr14Fts/gYDxVjDeDLo3Wa3DSnEWkJiGcvnnQAFFZthBGoMmbEbZao8wct0PysA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7/KWlUqBMNkmiWW2sQV8dXf7OXX56QCobGlbaIQRcAlVeFrsO
	6apIkA8OYxcxjELMmQyjaMf7LmqzslKdcsFqRFi6GCEYPazSYPZjx5Cp9H38hBQ=
X-Gm-Gg: ASbGncveSIBM5u8gHPz2zy/Fqce7F/Iq/XRCOGXGH7BodyYW5YKjyAJn4ut+erA5Fip
	ze3tiEHDi+G+By38zL2I1s+kdq8v5dcYEHPEN8nFrrGy2TGIfNjcVoxnCE8ElRod75LAduvLKfW
	2CGkIPguRZ9MkbH+r3X3ok7trndGZsTtGbRWtHjyd/mpipNLo9kZtBH4F6nZLIXtNJbjz8i+aI2
	Mc34vc8Q4pQ0Mgy3rHJ47pRmPlFLhQkZJKgg4ifr4Cd0O6k+b7Y0GMjIbUy42tDQwMGf6UAZlbJ
	WM1Ux0ftAP0v0hg1Qxhq
X-Google-Smtp-Source: AGHT+IGOkbPUG9s+Z3lR4D6l0Ibe4DlEnvm9sm1otOt0YJAICtmcrmiifBkRnfDukKfWwvlGEv6ryg==
X-Received: by 2002:a05:6a00:2d22:b0:730:8ed8:6cd0 with SMTP id d2e1a72fcca58-7329df25424mr4415076b3a.16.1739956917207;
        Wed, 19 Feb 2025 01:21:57 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v3 0/3] xen: Fix usage of devices behind a VMD bridge
Date: Wed, 19 Feb 2025 10:20:54 +0100
Message-ID: <20250219092059.90850-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The following series should fix the usage of devices behind a VMD bridge
when running Linux as a Xen PV hardware domain (dom0).  I've only been
able to test PV. I think PVH should also work but I don't have hardware
capable of testing it right now.

I don't expect the first two patches to be problematic, the last patch
is likely to be more controversial.  I've tested it internally and
didn't see any issues, but my testing of PV mode is mostly limited to
dom0.

Thanks, Roger.

Roger Pau Monne (3):
  xen/pci: Do not register devices with segments >= 0x10000
  PCI: vmd: Disable MSI remapping bypass under Xen
  PCI/MSI: Convert pci_msi_ignore_mask to per MSI domain flag

 arch/x86/pci/xen.c           |  8 ++------
 drivers/pci/controller/vmd.c | 20 +++++++++++++++++++
 drivers/pci/msi/msi.c        | 37 ++++++++++++++++++++----------------
 drivers/xen/pci.c            | 32 +++++++++++++++++++++++++++++++
 include/linux/msi.h          |  3 ++-
 kernel/irq/msi.c             |  2 +-
 6 files changed, 78 insertions(+), 24 deletions(-)

-- 
2.46.0


