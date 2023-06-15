Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8A0731CC3
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 17:32:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549693.858374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9oxH-0003S6-Mg; Thu, 15 Jun 2023 15:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549693.858374; Thu, 15 Jun 2023 15:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9oxH-0003PF-JC; Thu, 15 Jun 2023 15:32:11 +0000
Received: by outflank-mailman (input) for mailman id 549693;
 Thu, 15 Jun 2023 15:32:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IrMH=CD=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q9oxF-00039m-LK
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 15:32:09 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9d6b4e4-0b91-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 17:32:08 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f8ca80e889so19732085e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jun 2023 08:32:08 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0acc00b003f195d540d9sm20829986wmr.14.2023.06.15.08.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 08:32:02 -0700 (PDT)
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
X-Inumbo-ID: c9d6b4e4-0b91-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1686843123; x=1689435123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xa5LqqAnhhZGhhNjydhBSa/TUirey21KtPrdKQ3hxdY=;
        b=aAG0yzb67hfuEGZfLDlzi0UDhjpMzstR9Dmp3CojQLYZszamDzAMkgyhFDqdppSrJZ
         bQ9H8NyWjS9NYy1L7+ZU1nOMoNjuBjDjrOr/ruMlqQxY0fDu+HnQdvbTjAlyy9sMaTql
         drAbk5AaOVreUSZT2D0UwyyTYfZG0d8Ki19sI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686843123; x=1689435123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xa5LqqAnhhZGhhNjydhBSa/TUirey21KtPrdKQ3hxdY=;
        b=DjdU8LJowUJCW9SCg+Kuykk05V69QDHzmYXlkyecsax5+Dynk1/W5/CZOmrtKMKF6U
         RVoVOkdUfjw5xoE/EJTgdmmO2/pvWlHo2lBR57ERbM5p22pIWiXCrtWt3dvZUU9UOMxh
         nyYDgrBnbdQWUu/dXNsvUG1sWmArRfacPaUTfGhA8LtfguzV9pEanErEkFeUw8MR+Az8
         8RdDJbSSK4FjrvT0B7Von+f2870+elJ2M64h7qJ8xUVVKbyRIwN3+lL3E39svaMagIdn
         R5/m5y4yyBhtI6HG4LMY0WGMZA+myCh+UhAIPFqfpobm0+N5860B9+ZWfwktTQoXpZLE
         Cezw==
X-Gm-Message-State: AC+VfDzRCBMmCWLahdTXVnQNodCo3JAHjOOYrxQQU3EIjGNPJJjwJjNR
	hcoaQEOLVfb/n6ubnMkfUYReWS/BacQ4tznh1Ac=
X-Google-Smtp-Source: ACHHUZ6Os8mhpaayczU4KQ9NRqUIYSRAjYf2iei7pM2+pYKl80DJwA3vhK6eJRqFYxEt9Nwx741IDQ==
X-Received: by 2002:a7b:cd97:0:b0:3f7:678a:cf24 with SMTP id y23-20020a7bcd97000000b003f7678acf24mr12201855wmj.39.1686843123399;
        Thu, 15 Jun 2023 08:32:03 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/2] Introduce a REQUIRE_NX Kconfig option
Date: Thu, 15 Jun 2023 16:31:55 +0100
Message-Id: <20230615153157.444-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2:
  * Created assembly override for cases where XD_DISABLE is set
  * Turned rdmsrl() into rdmsr_safe() when reading IA32_MSR_MISC_ENABLE in C

This option hardens Xen by forcing it to write secure (NX-enhanced) PTEs
regardless of the runtime NX feature bit in boot_cpu_data. This prevents an
attacker with partial write support from affecting Xen's PTE generation
logic by overriding the NX feature flag. The patch asserts support for the
NX bit in PTEs at boot time and if so short-circuits the cpu_has_nx macro
to 1.

Alejandro Vallejo (2):
  x86/boot: Clear XD_DISABLE from the early boot path
  x86: Add Kconfig option to require NX bit support

 xen/arch/x86/Kconfig                  | 16 ++++++
 xen/arch/x86/boot/head.S              | 73 ++++++++++++++++++++++++---
 xen/arch/x86/boot/trampoline.S        |  3 +-
 xen/arch/x86/cpu/intel.c              | 32 ++++++------
 xen/arch/x86/efi/efi-boot.h           |  9 ++++
 xen/arch/x86/include/asm/cpufeature.h |  3 +-
 xen/arch/x86/include/asm/msr-index.h  |  2 +-
 7 files changed, 111 insertions(+), 27 deletions(-)

-- 
2.34.1


