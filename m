Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C43B792FAE2
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 15:08:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758024.1167233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSG0R-0005Hk-4t; Fri, 12 Jul 2024 13:08:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758024.1167233; Fri, 12 Jul 2024 13:08:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSG0R-0005FZ-0x; Fri, 12 Jul 2024 13:08:11 +0000
Received: by outflank-mailman (input) for mailman id 758024;
 Fri, 12 Jul 2024 13:08:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/nkX=OM=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1sSG0P-0005Dz-N9
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 13:08:09 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8104f19-404f-11ef-8776-851b0ebba9a2;
 Fri, 12 Jul 2024 15:08:07 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-57d05e0017aso2679838a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 06:08:07 -0700 (PDT)
Received: from fhilly.. ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a87204esm343023466b.222.2024.07.12.06.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 06:08:05 -0700 (PDT)
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
X-Inumbo-ID: c8104f19-404f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1720789686; x=1721394486; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RpgKWIfSIalzMFA1Wsr4pVU5CzKV4qllD5rfAWoZ3vs=;
        b=gJEJFVl/RnGuepDVMACN5cL/Mkwf9DsIlY8x5y5MjNqT2zohrGbtdDHj0sZjgXbsdh
         28AsEZ8PeCYuLskpWIHnuoEWP8egJDkLiYZYGezzU3kTjhJa90Jp3nxWHfNKGFqA8ru2
         tp5jNV+E+meOmQJu041IajwpmFN+xcrE8nNtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720789686; x=1721394486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RpgKWIfSIalzMFA1Wsr4pVU5CzKV4qllD5rfAWoZ3vs=;
        b=ad7MW4Iz3f8f3MlxloATm/23UyupEAY2q2y4pe5QCP/TTlzMRRYeAMIPPT+uNB5r7h
         5ms13BPjcB4cmAfvOTF/eYRekfnUs9dvDD370cnzwToGfB6I7u32O3Q8+4eXV9bN311T
         1bMhrZ9S+jAwRzWcK5wnlOziGpa9oFStn1ZIMfsS3udtIgbP4xROLdHXdnYrQweVSEhC
         UBqIX6AgDnaWDHje/fSMdHcbM1MezZKkuapXdOiPtEFr2KUuGs28/7xDqoKYfnV09Lfy
         s28nuIx37fh72o3oGgUYgcC3JHR5Vap/n3XD/jEBx9IWvEU+7n01u+W8lci5CiEqGx5z
         7XQg==
X-Gm-Message-State: AOJu0YyC/Qp/joR0uL4D4+PDwpL3SV3EUm0sIk4FlXCIwPNUz/FwabZF
	jvDxH77YKu7J2cinN+JcTiaZChZP70Z8Qbh1qm3y6BOxb+pzma+RbKT01AO2a7zF8RX7vY7SqlY
	F
X-Google-Smtp-Source: AGHT+IFb9LbnnrHKtiSlrWSVIpW7RNrcmHMIxZ6oagLMBqE9hRLCKUZfYLi7yno36j95mbUkd3zXsg==
X-Received: by 2002:a17:906:7745:b0:a77:cf09:9c70 with SMTP id a640c23a62f3a-a780b70526bmr728271366b.43.1720789686136;
        Fri, 12 Jul 2024 06:08:06 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 0/4]  x86/xen-ucode: Introduce --force option
Date: Fri, 12 Jul 2024 14:07:45 +0100
Message-ID: <20240712130749.1272741-1-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor and introduce --force option to xen-ucode, which skips microcode
version check when updating x86 CPU micocode. A new hypercall introduced
with flags field to facilitate the new option and allow for future flags
as needed.
This change is required to enable developers to load ucode that is the same version as the
one already loaded or downgrade for testing.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>

Fouad Hilly (4):
  x86/ucode: Introduce XENPF_microcode_update2 with flags parameter
  x86/ucode: refactor xen-ucode to utilize getopt
  x86/ucode: Introduce --force option to xen-ucode
  x86/ucode: Utilize ucode_force and remove opt_ucode_allow_same

 docs/misc/xen-command-line.pandoc    |   7 +-
 tools/include/xenctrl.h              |   3 +-
 tools/libs/ctrl/xc_misc.c            |  12 ++--
 tools/misc/xen-ucode.c               |  63 +++++++++++++---
 xen/arch/x86/cpu/microcode/amd.c     |   8 ++-
 xen/arch/x86/cpu/microcode/core.c    | 104 +++++++++++++++++----------
 xen/arch/x86/cpu/microcode/intel.c   |   9 ++-
 xen/arch/x86/cpu/microcode/private.h |   5 +-
 xen/arch/x86/include/asm/microcode.h |   3 +-
 xen/arch/x86/platform_hypercall.c    |  13 +++-
 xen/include/public/platform.h        |  14 ++++
 11 files changed, 172 insertions(+), 69 deletions(-)

-- 
2.42.0


