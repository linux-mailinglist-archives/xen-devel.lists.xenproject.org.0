Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 304BB8902B8
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 16:11:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698954.1091250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rprP5-0001aZ-LG; Thu, 28 Mar 2024 15:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698954.1091250; Thu, 28 Mar 2024 15:10:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rprP5-0001Xs-I7; Thu, 28 Mar 2024 15:10:55 +0000
Received: by outflank-mailman (input) for mailman id 698954;
 Thu, 28 Mar 2024 15:10:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jyVg=LC=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rprP4-0001Xk-I8
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:10:54 +0000
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [2607:f8b0:4864:20::829])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dda0f01-ed15-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 16:10:52 +0100 (CET)
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-430acf667afso5448661cf.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:10:52 -0700 (PDT)
Received: from rossla-lxenia.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 cr7-20020a05622a428700b004313f54aaa9sm696300qtb.5.2024.03.28.08.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 08:10:50 -0700 (PDT)
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
X-Inumbo-ID: 5dda0f01-ed15-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1711638651; x=1712243451; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D7ZTVrLp8nqWSOYziUzeIG369jCymeRAwqlJzMSZjtw=;
        b=eC+S9M3BYMJA/WkVDNzdc+/Rs2Pj5KrrPpNqGU6whYD6OHTUyad2oeERh3THOJjI/7
         Xs5+O8neCIJq0isvSjDqoCxrr0SgYFq3Ds8AGhZtwP1D41HsURF4T7s12dPa3iukq+Ea
         lV8p9b0wFs+2WVZe+2SEy3wfzUOP8GVsqJf+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711638651; x=1712243451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D7ZTVrLp8nqWSOYziUzeIG369jCymeRAwqlJzMSZjtw=;
        b=IzwMWs76Mamf85LZYZrJH2x8xbtyFKH8v9SVihecgisKMLcCIWEylPvjZ3OIBAAvfZ
         3g3nd155wxROXLfKjtZrWtWYqSvwjILUe66w8xilQtOyGMa0/uXqq068+q0EDtXo4UA7
         h2cncywKC5d09Nal+igKFRJS+wxh2zY70dlQeWvga2mN8ghvJlNmkZ/NDPBcIg2sc5E5
         FFP87tS4IBz/QYBV6M2Ev3elWVkeQtJZp+R+9lv17hGqThFxDK6N5NtranSsQmCZSE6s
         +CBhcZzhCtRUWK5y89uMMJd2LNevhLTXwofYdoLlPdZyWqvHFxvJh+pKszxPePA//BFh
         3uyQ==
X-Gm-Message-State: AOJu0Yxu7TePHI+LPKTLgrr7LYIKUClCIwDxv8q+G+QW4giKYsaxAvyL
	LhWk0POXws5hfaSKhRhEzdzhaNRxBqo5xs/bpM86r89c/VWGuKcApcIWwmTl2A==
X-Google-Smtp-Source: AGHT+IH+f8EDLf9KaL9c0bwJt6k3fppNPjsyLjLixhJayQ1QFvhFrKJAZcpweX+igkrDOrT/SdPcLw==
X-Received: by 2002:ac8:5ac2:0:b0:431:7f86:958f with SMTP id d2-20020ac85ac2000000b004317f86958fmr3650447qtd.8.1711638651543;
        Thu, 28 Mar 2024 08:10:51 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: grub-devel@gnu.org
Cc: xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Daniel Kiper <daniel.kiper@oracle.com>,
	Daniel Kiper <dkiper@net-space.pl>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/3] GRUB: Supporting Secure Boot of xen
Date: Thu, 28 Mar 2024 15:12:59 +0000
Message-ID: <20240328151302.1451158-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series implements support for loading and verifying a signed
xen binary. This would allow the same xen binary to be used for BIOS
boot, UEFI boot, and UEFI boot with Secure Boot verification.
There is an accompanying Xen patch series.

The first patch updates the multiboot2 specification to allow PE
binaries.

Patch 2 implements the spec change.
Patch 3 allows loading multiboot modules without verification since the
multiboot kernel is expected to verify them if needed.

Ross

Changed in v2:

* Use magic numbers to determine whether to load as ELF or PE rather
  than introducing a load type tag.
* Drop the 64 bit entry address extensions to the protocol - this is no
  longer necessary after some Xen build changes.
* Dropped the patch to allow verification after compression since it is
  not critical to make this work.

Diff stat for patch 1 (to be applied to  the "multiboot2" branch):

Ross Lagerwall (1):
  multiboot2: Add support for the PE binary type

 doc/multiboot.texi | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

Diff stat for patch 2 and 3 (to be applied to the "master" branch):

Ross Lagerwall (2):
  multiboot2: Add PE load support
  efi: Allow loading multiboot modules without verification

 grub-core/Makefile.core.def       |   1 +
 grub-core/kern/efi/sb.c           |   1 +
 grub-core/loader/multiboot.c      |   7 +
 grub-core/loader/multiboot_mbi2.c |  11 +-
 grub-core/loader/multiboot_pe.c   | 702 ++++++++++++++++++++++++++++++
 include/grub/efi/pe32.h           |  64 +++
 include/grub/multiboot.h          |   3 +
 include/grub/multiboot2.h         |   9 +
 8 files changed, 797 insertions(+), 1 deletion(-)
 create mode 100644 grub-core/loader/multiboot_pe.c

-- 
2.43.0


