Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CDA984398
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 12:28:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802566.1212854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st2mQ-0007Jj-Gr; Tue, 24 Sep 2024 10:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802566.1212854; Tue, 24 Sep 2024 10:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st2mQ-0007HG-EH; Tue, 24 Sep 2024 10:28:26 +0000
Received: by outflank-mailman (input) for mailman id 802566;
 Tue, 24 Sep 2024 10:28:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CoXS=QW=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1st2mP-0007HA-2E
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 10:28:25 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba852646-7a5f-11ef-a0ba-8be0dac302b0;
 Tue, 24 Sep 2024 12:28:24 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c413cf5de5so7133213a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 03:28:24 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4c5081sm591002a12.64.2024.09.24.03.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 03:28:21 -0700 (PDT)
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
X-Inumbo-ID: ba852646-7a5f-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727173703; x=1727778503; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=As5YhO2E4kEosURNNmNwaJhpaUekZm36NnA61q/rzHg=;
        b=LHGlJNr6Klkgq4g0KPp+C2ihix6kZ04IyeFcCD1YQndHUMxeQiNSgj+6olpGSpZm6l
         1CpbleDWpy0Ev2FNGBJRpr1QEfxWD/iBIW87A8k1oXjLHFf9nXHE15YzTMzHyJH8SUWA
         a4Vy0R+/LaP8vQTm9lYp60j1rNvIplybofY0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727173703; x=1727778503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=As5YhO2E4kEosURNNmNwaJhpaUekZm36NnA61q/rzHg=;
        b=jqC6hxyyXuracffEms2sBlQdRaikS4YuGYy3bW/ANP2+cb8O8oFvubYe6lcskqem77
         XeXTNDUxVnGpbxrbdkCD3A8CeiFZeCctMASxzjHNmAuxT51tZW3YbOMjcHooGhrmGolZ
         XJMbn+G1IjVNGlJOH/gglw56lAdC7wMfqyhbxZwdkbz2cz4BBq5A1+viUAsQHZjLZPGu
         /7eZKo00tQ7A2ZMq3X1xw1N4QXP0j5G3tdSaRUPbUaqoz2TLtsT8jPqSLI4JFZKWKVlM
         8jWyNkfIwReg1RxKs+57ssHyH7aI2YIImLiN6zfnED4F9S1WqgUl8IjhLuxXxc4Z4fK7
         2uuQ==
X-Gm-Message-State: AOJu0YyGDuhvCxhwGcaRwYRY8o/uKJ54MBGRbQlm2/UNhpgnlGTIRVCQ
	vwfTMnV9QsJeVFcJUEqY+OM2segacDSBglUqX5iL3F8tVY5GXLdBV/HYt+0iTduGEUis1R36C/R
	v
X-Google-Smtp-Source: AGHT+IGKImXB1zE/y6b1KpbobcXT7R00tkCsIxWt8u2eZ8owRNoBkaa0KEsYJOufv1QMUXfLp+MnCA==
X-Received: by 2002:a05:6402:518b:b0:5c3:c1f7:200a with SMTP id 4fb4d7f45d1cf-5c464a39fcemr10617675a12.11.1727173702687;
        Tue, 24 Sep 2024 03:28:22 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v3 0/4] x86/boot: Reduce assembly code
Date: Tue, 24 Sep 2024 11:28:07 +0100
Message-Id: <20240924102811.86884-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series came from part of the work of removing duplications between
boot code and rewriting part of code from assembly to C.
First 2 patches rework BIOS/PVH paths to reuse some code.
Third patch rewrites EFI code in pure C.

Changes since v1, more details in specific commits:
- style updates;
- comments and descriptions improvements;
- other improvements.

Changes since v2:
- rebased on master, resolved conflicts;
- add comment on trampoline section.

Frediano Ziglio (4):
  x86/boot: Initialise BSS sooner
  x86/boot: Refactor BIOS/PVH start
  x86/boot: Rewrite EFI/MBI2 code partly in C
  x86/boot: Improve MBI2 structure check

 xen/arch/x86/boot/head.S      | 288 +++++++++++-----------------------
 xen/arch/x86/efi/Makefile     |   1 +
 xen/arch/x86/efi/efi-boot.h   |   6 +-
 xen/arch/x86/efi/parse-mbi2.c |  61 +++++++
 xen/arch/x86/efi/stub.c       |   3 +-
 5 files changed, 155 insertions(+), 204 deletions(-)
 create mode 100644 xen/arch/x86/efi/parse-mbi2.c

-- 
2.34.1


