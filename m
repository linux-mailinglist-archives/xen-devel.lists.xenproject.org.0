Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E836E87AA09
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 16:07:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692516.1079732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQBm-0007Fi-0l; Wed, 13 Mar 2024 15:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692516.1079732; Wed, 13 Mar 2024 15:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQBl-0007EA-U7; Wed, 13 Mar 2024 15:06:41 +0000
Received: by outflank-mailman (input) for mailman id 692516;
 Wed, 13 Mar 2024 15:06:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwto=KT=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rkQBl-0007E2-36
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 15:06:41 +0000
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [2607:f8b0:4864:20::72f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4aa96ae8-e14b-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 16:06:39 +0100 (CET)
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-7810827e54eso499590585a.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 08:06:39 -0700 (PDT)
Received: from rossla-lxenia.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a0ccb8a000000b0068fba49ae81sm4786811qvk.57.2024.03.13.08.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 08:06:37 -0700 (PDT)
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
X-Inumbo-ID: 4aa96ae8-e14b-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710342398; x=1710947198; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7dNacejZJRMQu9t2c+pDCXl+dVVU+S1TMISMGfwPh5c=;
        b=fBk9saJOu0U5/qgHpI4jL832doMC1WcFlUOVINcA+uodwu/XXalWWWQ8svxK5deug8
         azm9ykTuxehdavkbareWpGLRgLPgvEKyVjM9jmkUre0IWYTbJFGean/kEXQpks5IaCgk
         v2dEYmoQwu8msLkR10QwhsgxcSX1oGzd2q+9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710342398; x=1710947198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dNacejZJRMQu9t2c+pDCXl+dVVU+S1TMISMGfwPh5c=;
        b=dErGe+BQikU2/MsJZZ/20eF0jpjyxTUdzwit0r22ygtQw2xCmSn5eHUdYFTN4mGKmN
         k2Rg5DIVXnZv9Y7QmF5ujJiw6bTqTAWHV+e7/RqmiSMMcPmrT8rDk7kqg4cXPQH8ReQ5
         NXC25r6/9SYdjHn2Hch2q6VOf7TWyWwiSqXpjlX1wMbnk/lwECKI0NHCpc/r0Rjiiwos
         +ZOJMDcNeYJnHjOZpjrx47B9cJt67sHF4q4Muv6GaYM0NxkN/NbJhaf1APo79C188xfo
         mZf/HuiIvJ/tVsQgmbk4k/pA33Oi9QjkGOSEIDqP916o0XRyLwcRweCQ4doA/yqS52ki
         dWlA==
X-Gm-Message-State: AOJu0YzQSZPQZkW1dNjqdubVCOjRAAsv4YR0yQia7RVxK3vcUXyDsDbo
	I3yf1gsvfN8ELYxPAATjpMX0mdPyZnKMACfCmshTsn+3bVlWaUjQdARA+RknyA==
X-Google-Smtp-Source: AGHT+IFhMt8DXtazFgVZd/4MjyU0qWHW0Ln8qk4yZbgM72DpJVggRE7M2YW+oFuMogX6QJsGiBk0wQ==
X-Received: by 2002:a0c:ee8a:0:b0:690:e65d:4b26 with SMTP id u10-20020a0cee8a000000b00690e65d4b26mr109507qvr.31.1710342397898;
        Wed, 13 Mar 2024 08:06:37 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: grub-devel@gnu.org
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Daniel Kiper <daniel.kiper@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 0/7] GRUB: Supporting Secure Boot of xen.gz
Date: Wed, 13 Mar 2024 15:07:41 +0000
Message-ID: <20240313150748.791236-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series implements support for loading and verifying a signed
xen.gz binary. This would allow the same xen.gz binary to be used for
BIOS boot, UEFI boot, and UEFI boot with Secure Boot verification.
There is an accompanying Xen patch series.

The first two patches update the multiboot2 specification with the
necessary changes.

Patches 3 through 5 implement the spec changes.
Patches 6 and 7 are a couple of small changes to allow the Secure Boot
verification to happen.

Ross

Diff stat for 0001 and 0002 (to be applied to  the "multiboot2" branch)
Ross Lagerwall (2):
  multiboot2: Add load type header and support for the PE binary type
  multiboot2: Allow 64-bit entry tags

 doc/multiboot.texi | 71 ++++++++++++++++++++++++++++++++++------------
 doc/multiboot2.h   | 19 ++++++++++++-
 2 files changed, 71 insertions(+), 19 deletions(-)

Diff stat for 0003 to 0007 (to be applied to the "master" branch)
Ross Lagerwall (5):
  multiboot2: Add support for the load type header tag
  multiboot2: Add PE load support
  multiboot2: Add support for 64-bit entry addresses
  efi: Allow loading multiboot modules without verification
  verifiers: Verify after decompression

 grub-core/Makefile.core.def       |   1 +
 grub-core/kern/efi/sb.c           |   1 +
 grub-core/loader/multiboot_mbi2.c |  66 ++-
 grub-core/loader/multiboot_pe.c   | 694 ++++++++++++++++++++++++++++++
 include/grub/efi/pe32.h           |  64 +++
 include/grub/file.h               |   2 +-
 include/grub/multiboot2.h         |   4 +
 include/multiboot2.h              |  19 +-
 8 files changed, 844 insertions(+), 7 deletions(-)
 create mode 100644 grub-core/loader/multiboot_pe.c

-- 
2.43.0


