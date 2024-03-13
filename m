Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 124B187A9F2
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 16:03:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692491.1079671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQ8l-0003vq-70; Wed, 13 Mar 2024 15:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692491.1079671; Wed, 13 Mar 2024 15:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQ8l-0003tM-4L; Wed, 13 Mar 2024 15:03:35 +0000
Received: by outflank-mailman (input) for mailman id 692491;
 Wed, 13 Mar 2024 15:03:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwto=KT=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rkQ8j-0003t5-Cn
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 15:03:33 +0000
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [2607:f8b0:4864:20::830])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dafe30e7-e14a-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 16:03:32 +0100 (CET)
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-43091ff5ff2so3355791cf.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 08:03:32 -0700 (PDT)
Received: from rossla-lxenia.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 s9-20020ac85ec9000000b0042ef4b5f4fbsm4930034qtx.38.2024.03.13.08.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 08:03:29 -0700 (PDT)
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
X-Inumbo-ID: dafe30e7-e14a-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710342210; x=1710947010; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gyMo0vp7Ia8GOxu6JetmxFN6a0wgE8s9nbiG4XTX1oM=;
        b=QpPs91DCuKaur+GetAaSBLaQ5cv6kQ0whGB/DSs4KzhMo741mdfDaBZcxMQJxu5eru
         pnndm1oyaOjPoog9umTVgTp1+NZA3bcQsFzfjY1/nVfhiJ9KQqqi+sbDikwpUpbemNNY
         3hF5aqKOPONKNc6h8KpjHvjdKBOsRTbRkpOZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710342210; x=1710947010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gyMo0vp7Ia8GOxu6JetmxFN6a0wgE8s9nbiG4XTX1oM=;
        b=ECbOd5ZmUx3ga7xOnZNgRrySFbn8Pxv4Cm/6PKhFE0kI0Ak4FwZ6fURhwG8w4/8vF5
         8sGAeVFTkK+Va2jPw4ZzMDaEzlaP16GOP6lJv+O1Qz/E5/lnbNEW8cbsmt/ro4KNZ1Br
         d4dCW1WwBBuAvg6zVahE/SHvsJxr+yjr+PtBubMPDoox6czetPkqES6+4C5sZg4cqBKH
         7YD6FS6pz3DGeg0bgLkGLSsbwGMN7fzZ1Z43d13sWlWWDLFOiZlGIu+u5Eh1o+BJO8Aw
         DYNdT1cSooxDwg5Bk5UYyL3CbgCAc9EhiG0U0zbBLs+e3AOQyxPr5Pbx1ZSdjmMPHi06
         HdfQ==
X-Gm-Message-State: AOJu0YyxzuBt/cgoRqA+Ee/2rMm4/9riSoC1kxNjYFrLcDm9Vy6Co3WL
	QkOziv8E87kqmgFDrqi3tlRdGurzIFCoAlSfrEchnQ9+g/8uLKRSQk8MjjLAJg3XB2+3fJGUIyT
	wxEq+
X-Google-Smtp-Source: AGHT+IGq88QEvIT5QVAmqYyi6OtMdPviJhS9zNFLE+BDu9sGsWgW321ehOXkJ7ssIk/mwNN0AE9CYA==
X-Received: by 2002:ac8:7d55:0:b0:42e:7a9a:f13b with SMTP id h21-20020ac87d55000000b0042e7a9af13bmr17157139qtb.58.1710342210257;
        Wed, 13 Mar 2024 08:03:30 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/4] x86: Multiboot PE support
Date: Wed, 13 Mar 2024 15:04:35 +0000
Message-ID: <20240313150439.791213-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patches series implements support for xen.gz being a gzipped
multiboot-capable PE binary rather than an ELF binary. The purpose of
this is to allow the same xen.gz to be booted using BIOS, UEFI, and UEFI
with Secure Boot verification just like it can be done with a Linux
kernel. It also means that it is possible to enable Secure Boot while
still retaining the flexibility of a full bootloader like GRUB2 - not
currently possible when using xen.efi.

This requires some (backwards-compatible) extensions to the multiboot2
protocol which will be sent in a separate series along with the GRUB
changes which implement the extensions.

Ross

Ross Lagerwall (4):
  multiboot2: Advertise the load type
  x86: Add support for building a multiboot2 PE binary
  x86: Hand-edit coff flags to remove RELOCS_STRIPPED flag
  x86: Call Shim Verify in the multiboot2 path

 .gitignore                        |  1 +
 xen/Makefile                      |  1 +
 xen/arch/x86/Kconfig              |  6 +++
 xen/arch/x86/Makefile             | 50 +++++++++++++++++++
 xen/arch/x86/boot/head.S          | 40 ++++++++++++++-
 xen/arch/x86/efi/efi-boot.h       | 65 +++++++++++++++++++++++-
 xen/arch/x86/efi/set-coff-flags.c | 83 +++++++++++++++++++++++++++++++
 xen/include/xen/multiboot2.h      |  6 +++
 8 files changed, 250 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/x86/efi/set-coff-flags.c

-- 
2.43.0


