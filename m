Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FC18902AA
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 16:09:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698947.1091220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rprNL-0007Zp-O0; Thu, 28 Mar 2024 15:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698947.1091220; Thu, 28 Mar 2024 15:09:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rprNL-0007Wf-L7; Thu, 28 Mar 2024 15:09:07 +0000
Received: by outflank-mailman (input) for mailman id 698947;
 Thu, 28 Mar 2024 15:09:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jyVg=LC=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rprNK-0007WX-1s
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:09:06 +0000
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [2607:f8b0:4864:20::f35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cfad02c-ed15-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 16:09:04 +0100 (CET)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-696499bd61eso7585436d6.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:09:04 -0700 (PDT)
Received: from rossla-lxenia.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4-20020a0562140d0400b00690bfb6aac7sm722826qvh.51.2024.03.28.08.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 08:09:01 -0700 (PDT)
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
X-Inumbo-ID: 1cfad02c-ed15-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1711638542; x=1712243342; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RTkiM6vXFtQFsCu0X4ejO2hYV6vHlc9WzpCQvZsNC4w=;
        b=g+tUxEqI5TjjyrOApQf4gwui4tvZ1wOyM8Ggj4KaOR6XvK5GANAUYx12k15WJ73WF3
         QQxVEqnzCmLJT3j/60X9cRpCuNyMCmvImU+roqIyHEFwtyXOmRAJyKtnLDuFPr9+QsDy
         H4z/if900NIyVXRFZYhBezKj6ZJ8GsZT+NQKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711638542; x=1712243342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTkiM6vXFtQFsCu0X4ejO2hYV6vHlc9WzpCQvZsNC4w=;
        b=kbn8aKqRjBfarQCzCBFkdQC09P0xAzTpogYeRm+LlQ81XnlMdPCU5ixrZ+O+SdrbiL
         y5dxM3Gk1xo7HHhdmzWzhchRqjOYlIAH74XP2sfN9s+M13iOAdO1fO/y60+B7miOme7V
         gmVr0JC8tGoSCRcd/KN7SrVSlRMshGr271W4hn3zCcy/BAfmZafLERT4RXRlCoN1XtZU
         me2IvJyHonTTHn2hIb1h8/7PueCskLa4bvi8gvA8NYM4jx9O9Sddj6m9kxhTI+77G8Lg
         ztmQyWCjFbFlXi3I4oA/o3yRmyq0CN+1QrlVj9fZpfClykuNqA7HwBQlTQhDiteh6xYU
         MtrQ==
X-Gm-Message-State: AOJu0YxHpdosvOaG6xJCxm5zK1S9DBoN87L76Xi2YxLbSzo8Ycyrj+Q/
	1HKwkonLiQzKeFAgwEZj8gAjcpMHWwxPl91qzLUGDcRwTKEnvBWERRYQZefI+OoXhpMjxm5dZO/
	TgQ==
X-Google-Smtp-Source: AGHT+IH53j3UHtxlBcXfIUmAiCXlmNL2FpfZKgl4bvEiYcHXmk9lQfHTKhaDbj7nh4q7fy+lPvzQ+Q==
X-Received: by 2002:a0c:e805:0:b0:696:8234:3ab with SMTP id y5-20020a0ce805000000b00696823403abmr2707085qvn.49.1711638541872;
        Thu, 28 Mar 2024 08:09:01 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/2] x86: Multiboot PE support
Date: Thu, 28 Mar 2024 15:11:04 +0000
Message-ID: <20240328151106.1451104-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patches series implements support for building a multiboot-capable
PE binary in addition to the existing xen.efi and xen.gz. The purpose of
this is to allow the same binary to be booted using BIOS, UEFI, and UEFI
with Secure Boot verification just like it can be done with a Linux
kernel. It also means that it is possible to enable Secure Boot while
still retaining the flexibility of a full bootloader like GRUB2 - not
currently possible when using xen.efi.

This requires a multiboot2 loader that supports loading PE binaries.
Changes to implement this in GRUB will be sent in a separate series.

Ross

Changed in v2:

* Adjusted for changes to the proposed multiboot2 spec changes. In
  particular, there are no new multiboot2 tags needed.
* Unconditionally build a new binary rather than adding a build option.
* Avoid compressing it since this makes verification more difficult.
* Build the new binary as a modification of xen.efi rather than
  relinking from scratch.

Ross Lagerwall (2):
  x86: Add support for building a multiboot2 PE binary
  x86: Call Shim Verify in the multiboot2 path

 .gitignore                        |  2 +
 xen/Makefile                      |  1 +
 xen/arch/x86/Makefile             | 16 ++++++-
 xen/arch/x86/boot/head.S          |  4 +-
 xen/arch/x86/efi/efi-boot.h       | 65 +++++++++++++++++++++++++-
 xen/arch/x86/efi/modify-mbi-exe.c | 77 +++++++++++++++++++++++++++++++
 6 files changed, 162 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/x86/efi/modify-mbi-exe.c

-- 
2.43.0


