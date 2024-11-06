Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C55D29BE5D1
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 12:42:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830779.1245862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8eQG-0007dF-Hu; Wed, 06 Nov 2024 11:42:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830779.1245862; Wed, 06 Nov 2024 11:42:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8eQG-0007b8-En; Wed, 06 Nov 2024 11:42:04 +0000
Received: by outflank-mailman (input) for mailman id 830779;
 Wed, 06 Nov 2024 11:42:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6nbp=SB=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t8eQF-0007aw-6J
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 11:42:03 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22b6c34a-9c34-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 12:42:00 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-37d4c1b1455so4047180f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 03:42:00 -0800 (PST)
Received: from fziglio-desktop.lan (99.149.115.87.dyn.plus.net.
 [87.115.149.99]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10e7465sm18840783f8f.53.2024.11.06.03.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 03:41:59 -0800 (PST)
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
X-Inumbo-ID: 22b6c34a-9c34-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzAiLCJoZWxvIjoibWFpbC13cjEteDQzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjIyYjZjMzRhLTljMzQtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODkzMzIwLjg0MTI3OCwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730893320; x=1731498120; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e9iO0ekAbJbMiutjh+/AEpam/mXqpLJNfgJlAMLyzug=;
        b=jVfc8pYwxh/+bcNwUBCYeDCM+GjNiahvSg3HBgQHcf6h0Z8HzgC3fkjzGpRVre0Ehs
         DCrERKFB6m3xAngySPZzhqOt/BGB1Xy1AmaJUvBcaRfzqVB61u3Vo1OLDu3x1O0YV0oP
         /BR+Prpc+1FDRnZf4HLHPvz/HB8QPCJWLSDi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730893320; x=1731498120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9iO0ekAbJbMiutjh+/AEpam/mXqpLJNfgJlAMLyzug=;
        b=fNE4fU17lo0MoAP6sEkAj0Stp9/TlXNT+qMFM86vF0x8MRKdjlJmjFSCIjO1qnFzhB
         7mK5gWya+bBomffiJP5jAdjMbN7Rgwmdc0HF738M/3UJr9A0zoPovCZBBldtASS0acLr
         DLz3OoLt/lCWZ0lBudMp+7/72ap/sQy/6Br4lCipWo1i/VRNwtIL0Q0iMEPj+4hfQSws
         2e6ksXTVnARsUrHQ6cnNwKn1NqvlHGckdfxhFhXTpr1M8MF/Sltg6zjiSFSNcQ7DoGwV
         wtQY0j1OixfCx3my6paZQ+cGo4eWdBYV5izfgmKsplY8ffdNDR+c7i8WBCmsHq1GXKb3
         j7hA==
X-Gm-Message-State: AOJu0YyLJfmzwau/fvDWlQvnRV/1pl6dtCJOGoMlZpfhG70S3lgIhNyW
	H+BlvsSNaj11Wqu2gpjVz51qdszcwON/TS3oHe/e7l9lym8qFBUgxYC2LVpNSvtAvkQWZpin3Jz
	NgHM=
X-Google-Smtp-Source: AGHT+IEwr3gHQCAAnnplRL9hiBryrbGJJV2vkgJDhQTB2TvXILagsN2FRuD2teqy7Z3cnmaQRJmKsw==
X-Received: by 2002:a5d:638b:0:b0:37d:387b:f080 with SMTP id ffacd0b85a97d-381b7075edfmr18768444f8f.15.1730893320006;
        Wed, 06 Nov 2024 03:42:00 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/3] x86/boot: Fix build with LLVM toolchain
Date: Wed,  6 Nov 2024 11:41:47 +0000
Message-Id: <20241106114150.1432512-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix some compatibility generating 32 bit code.
LLVM has different object files and map files.
Do not use map file as they are not standard.

Changes since v1:
- do not use map files;
- add a fix for file names and preprocessor definition name.

Frediano Ziglio (3):
  x86/boot: Fix intermediate file names to generate 32 bit code
  x86/boot: Uses nm command instead of map file to get symbols
  x86/boot: Fix build with LLVM toolchain

 xen/arch/x86/boot/Makefile        | 10 ++++++----
 xen/arch/x86/boot/build32.lds.S   | 11 ++++++++++-
 xen/tools/combine_two_binaries.py | 28 ++++++++++++++++++----------
 3 files changed, 34 insertions(+), 15 deletions(-)

-- 
2.34.1


