Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6423F96C171
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 16:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790437.1200191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slrRS-0001KI-7k; Wed, 04 Sep 2024 14:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790437.1200191; Wed, 04 Sep 2024 14:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slrRS-0001F4-4l; Wed, 04 Sep 2024 14:57:06 +0000
Received: by outflank-mailman (input) for mailman id 790437;
 Wed, 04 Sep 2024 14:57:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S0IR=QC=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1slrRQ-0001Bm-AI
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 14:57:04 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f13457af-6acd-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 16:57:02 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c24ebaa427so1329718a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 07:57:02 -0700 (PDT)
Received: from fziglio-xenia-fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc56c501sm18862a12.52.2024.09.04.07.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 07:57:00 -0700 (PDT)
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
X-Inumbo-ID: f13457af-6acd-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725461821; x=1726066621; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wjVZTVNCRpvS5aCzrzAh7uYMP3IDPAnNfZT/d8l3gkk=;
        b=lY5ZGsGc/VNhsMccO1LGzZGtyfKCfS4oY5EXov30K9sYvV1yJqG+mjth3h6MCorYsO
         ASN1Kq1A5pjYeC9GouAH2mwfQzGmDCzUvXy5zjcTFMDyoBHef25mHw2lTp/NwbTvBaaQ
         NeGp7xKJztKGNRZCoUVKRT/X3Y9CBjBi90y0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725461821; x=1726066621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wjVZTVNCRpvS5aCzrzAh7uYMP3IDPAnNfZT/d8l3gkk=;
        b=WMhj+lch3Q5COqj0JoCkWifPRvoZojMUJ1Tq8iLgYkfvZH/XG+zIil2G0/9087I8sN
         5CQjkrhBP6PhYkWr9td03b2XTBtN4fRVrk3PPcjrgbleHCwA5n5a4Ip/RVTn20QtjGuH
         1HR74+BCmuPZHgKUfSD4x5icm4WDbl83DbFntC/5YeKNh1/Kq9CVsW76zrbHUFEHDAB+
         ROGO2HYfKv+Ig7qaKhT75qswozwMbuUvpkbo7ZsIM43pypXTgZ+JlmfFvrZaJX90Pvbz
         Si84J28O+c1UyR6SkK4E7sPMsIzN3YYc/OrqY93Uahqwc1N5imxlgz3Qi+4nHAd0cm31
         e0/A==
X-Gm-Message-State: AOJu0YzVL8rbxoOW8+d+Ae3toYU3fb7Idjyn5/Z0/Sjbe9HFA6dMCfR2
	RHfd5TTNIahtIfU5ePEni/uuFQ/ywQCTuT9uPaV4iAf5xCCCUEdoLYli5bRch6GpTWdm4p1ceNt
	I
X-Google-Smtp-Source: AGHT+IEeTb5cESA7yQkfy1YDNrPTTlFIpRm/E8yy/aK4TqdHdZt8pJOIwy2NKa4aCg2Ou/23rKob8A==
X-Received: by 2002:a05:6402:3509:b0:5c2:76a3:fba4 with SMTP id 4fb4d7f45d1cf-5c3b291f14emr2516519a12.0.1725461821024;
        Wed, 04 Sep 2024 07:57:01 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [RFC 0/5] Reuse 32 bit C code more safely
Date: Wed,  4 Sep 2024 15:56:43 +0100
Message-ID: <20240904145648.33707-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This RFC series attempt to:
- use more C code, that is replace some assembly code with C;
- avoid some code duplication between C and assembly;
- prevent some issues having relocations in C code.

The idea is extending the current C to binary code conversion
done for 32 bit C code called from head.S making sure relocations
are safe and allowing external symbols usage from C code.

Note that, as an addition, scripts generating code check for no
data to allow code and data separation.

More details of the implementation are in commit message 2/5,
which is the largest patch.
Patch 1/5 is to prepare code and avoid data.
Patch 3/5 is an example of code reuse between 32 and 64 bit.
Patch 4/5 is also another example of code reuse but is more hacky and
dirty due to not being possible include use some headers.

Code boot successfully using:
- BIOS boot;
- EFI boot with Grub2 and ELF file;
- direct EFI boot without Grub.

Suggestions/opinions are welcome.

Code is currently based on "staging" branch, currently commit
6471badeeec92db1cb8155066551f7509cd82efd.

Frediano Ziglio (5):
  Avoid usage of global in reloc.c
  x86/boot: create a C bundle for 32 bit boot code and use it
  Reuse code to relocate trampoline
  Remove duplication preparing pages
  setup mapping for trampoline in setup_pagesXX

 .gitignore                                    |   3 +-
 xen/arch/x86/boot/Makefile                    |  30 ++-
 .../x86/boot/{build32.lds => build32.lds.S}   |  60 +++++-
 xen/arch/x86/boot/cmdline.c                   |   7 -
 xen/arch/x86/boot/head.S                      |  89 +--------
 xen/arch/x86/boot/reloc-trampoline.c          |  28 +++
 xen/arch/x86/boot/reloc-trampoline64.c        |   1 +
 xen/arch/x86/boot/reloc.c                     |  69 ++++---
 xen/arch/x86/boot/setup-pages.c               | 116 ++++++++++++
 xen/arch/x86/boot/setup-pages64.c             |   1 +
 xen/arch/x86/boot/x86_64.S                    |   2 +-
 xen/arch/x86/efi/efi-boot.h                   |  67 +------
 xen/arch/x86/include/asm/page.h               |   3 +-
 xen/tools/make_output                         | 177 ++++++++++++++++++
 14 files changed, 446 insertions(+), 207 deletions(-)
 rename xen/arch/x86/boot/{build32.lds => build32.lds.S} (52%)
 create mode 100644 xen/arch/x86/boot/reloc-trampoline.c
 create mode 120000 xen/arch/x86/boot/reloc-trampoline64.c
 create mode 100644 xen/arch/x86/boot/setup-pages.c
 create mode 120000 xen/arch/x86/boot/setup-pages64.c
 create mode 100755 xen/tools/make_output

-- 
2.46.0


