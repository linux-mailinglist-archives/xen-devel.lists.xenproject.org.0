Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DFC9982AF
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 11:46:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815893.1230121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sypjo-0003vM-Bg; Thu, 10 Oct 2024 09:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815893.1230121; Thu, 10 Oct 2024 09:45:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sypjo-0003sC-81; Thu, 10 Oct 2024 09:45:40 +0000
Received: by outflank-mailman (input) for mailman id 815893;
 Thu, 10 Oct 2024 09:45:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5QbA=RG=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sypjl-0003rE-V9
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 09:45:37 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66621f4c-86ec-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 11:45:36 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9943897c07so101598866b.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 02:45:36 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80dcf0dsm64513266b.175.2024.10.10.02.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 02:45:34 -0700 (PDT)
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
X-Inumbo-ID: 66621f4c-86ec-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728553535; x=1729158335; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k3RPrePZquwV8SZBuNQYRhTuWb72JZMdmXye/XAjEYY=;
        b=DgX4bL8x5q8W6fB71mPAweoWiYCZfffyMy01QKZgD+3Cas6vMGrSisJm3zSZjwT+U1
         dTN287/xr95PmMgvMXZKGWbAgkaCCddtNGgj6AgV3oTCNDUoAfCmE35wHFPr9PM7ycSj
         R15ZXCdZ5g06eFpRkalEYXm40Fjc2SPloPFDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728553535; x=1729158335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3RPrePZquwV8SZBuNQYRhTuWb72JZMdmXye/XAjEYY=;
        b=aRBNx/EgqXJKIWgA5OoDZnCm0Opsz5+ViR1MJMrXV8MmCPW/9tWetoBNPKLSX0qfuw
         GfssS5hzb/rYYwjgwMMFZtDT9P58IL94F4sscmnfQGr3RlDEZ4IIGrGBWn2ka27MlATA
         hIrg3zLV7oK538u7DtocHAMTOB4PGBVBg4MAFUVhOwXxidcXriwiVNKXlkHzEKmeyDKx
         VET2fIYwt2Y9ocuEpblDuoga8XxRWVqXYVaCdpoKcSPMo4BhjjAA4uXb6twj3eeyrreu
         EB9uRvb3pOeFVVPa/sSCEBt5x3/ZHh4BrlpWP5MpKPydtIhq9fNWelblEIGbf9PBajcC
         qbKw==
X-Gm-Message-State: AOJu0YwC1osFP2hVwiB0Nld6d5XRRpfrd89NSksEfYSFDpdGTrrfWHhH
	bz8nWZyS4Lh0scF81zDaPaUvmrjlb5x94CH42dai9mtmBuJQFLbK3DHu8cWnvoqIgToxgSaEGGI
	w
X-Google-Smtp-Source: AGHT+IFRTvJ+WTdOiAwVL77n0UFJqyVWtyjJ23rbs1cRoimQg06klyV1CZQKmEWjaqofyLB1cjhZLQ==
X-Received: by 2002:a17:906:7313:b0:a99:5957:b8f0 with SMTP id a640c23a62f3a-a998d31c11emr493145066b.49.1728553535111;
        Thu, 10 Oct 2024 02:45:35 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v9 0/2] x86/boot: Improve MBI2 structure check (was: Reduce assembly code)
Date: Thu, 10 Oct 2024 10:45:22 +0100
Message-Id: <20241010094524.1836495-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series came from part of the work of removing duplications between
boot code and rewriting part of code from assembly to C.

Changes since v1, more details in specific commits:
- style updates;
- comments and descriptions improvements;
- other improvements.

Changes since v2:
- rebased on master, resolved conflicts;
- add comment on trampoline section.

Changes since v3:
- changed new function name;
- declare efi_multiboot2 in a separate header;
- distinguish entry point from using magic number;
- other minor changes (see commens in commits).

Changes since v4:
- rebase on staging;
- set %fs and %gs as other segment registers;
- style and other changes.

Changes since v5:
- fixed a typo.

Changes since v6:
- remove merged patch;
- comment and style;
- change some pointer checks to avoid overflows;
- rename parse-mbi2.c to mbi2.c.

Changes since v7:
- removed merged parts;
- add required stack alignment.

Changes since v8:
- added "Fixes:" line;
- typo in commit message: Adler -> Alder;
- add ".init" to mbi2.o;
- reduce difference in Makefile.

Frediano Ziglio (2):
  x86/boot: Align mbi2.c stack to 16 bytes
  x86/boot: Improve MBI2 structure check

 xen/arch/x86/efi/Makefile | 4 ++--
 xen/arch/x86/efi/mbi2.c   | 7 +++++--
 2 files changed, 7 insertions(+), 4 deletions(-)

-- 
2.34.1


