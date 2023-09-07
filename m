Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D46B6797145
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 11:35:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597191.931393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeBPN-0007Pg-Sa; Thu, 07 Sep 2023 09:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597191.931393; Thu, 07 Sep 2023 09:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeBPN-0007KG-My; Thu, 07 Sep 2023 09:34:41 +0000
Received: by outflank-mailman (input) for mailman id 597191;
 Thu, 07 Sep 2023 09:34:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tY2=EX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qeBPL-0007He-UH
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 09:34:39 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c33d7eb3-4d61-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 11:34:37 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2bcc331f942so8693141fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Sep 2023 02:34:37 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 u19-20020a2e9b13000000b002ba586d27a2sm3797539lji.26.2023.09.07.02.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 02:34:36 -0700 (PDT)
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
X-Inumbo-ID: c33d7eb3-4d61-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694079277; x=1694684077; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EbyA2D/GZCbk8wBzL+USNEjWy5BB6J46sDBfjFKHfug=;
        b=n8+oyIXILv0/eE++AJR39Xlw2z4cJBONDqnqq46qeMAswkRbFNbK1p9bcE59YCAyAq
         txMdziQcCwkSTb5ZQtRnSf1ojbEHICrYYIlNb8Gfqa2MNEo5mu/UbMhMI+OdGHH5kxs+
         5IsgM4bc6RbDn5V3Tbdmy55Mswht80kDTHDMKfVXRJAKv+mn9u8arddJpPYHiImAKAR2
         c8MPYJvmbq9VlhVk6NGZVk0FGhMFaIpdeivHxvfblEtZe4DyMepzB6ngzN2FPGbZGiIl
         DqPPeHAveHIReQUlWEWxQqfFXvioGdLkFBihsupqr9MJndP9q6J4Pf81fulLhdmcLIZM
         nWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694079277; x=1694684077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EbyA2D/GZCbk8wBzL+USNEjWy5BB6J46sDBfjFKHfug=;
        b=dbPWeg0zXQunOFbX94s9djf0m7PJpvc2wYCRCi+E/ACfexYnNdipNrtB8TCJOdQkDz
         MeYMBhfixwfxlrfBa6mNY0YmiWkXsc2D4sEEDzJ3sJexQqNcOVyles5mwlorwH0cHKHd
         tzO+5DCmgJDNknt/e8ZwsC7o93r7wc4RubT548YqFj7I1PAvy3GVG683YjAPphhCWej8
         DKtXPZuq3dE5g4l0bgeXRNMtLM4l5kP4X5K2E1/PPaS1g6sasf95piBD030uQ1qFD7aJ
         L2hx0TM7EuoXzvaEY8DDp1TdEnDZ57hy44r8ah9VAITxyZW4tGn9unnCvc4OGBear9ub
         RJLw==
X-Gm-Message-State: AOJu0Yw75cyroRi2nmxs/uvhC7KLxtDizrhHcMXEtmQjvc2OAqrBSNS0
	OvgUcHA2eZpbq+egr0n/sZDhB2m5LAs=
X-Google-Smtp-Source: AGHT+IHE2Gecn2NdhcJmgK0hOXTUJWBpm69OlukNpq28YdZka7ID1P4AeZlM2+6dCpMY0dhseUN6Iw==
X-Received: by 2002:a2e:b98d:0:b0:2bc:d3b1:d6c1 with SMTP id p13-20020a2eb98d000000b002bcd3b1d6c1mr743039ljp.9.1694079276788;
        Thu, 07 Sep 2023 02:34:36 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 0/2] introduce stub directory to storing empty/stub headers
Date: Thu,  7 Sep 2023 12:32:55 +0300
Message-ID: <cover.1694078544.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A lot of empty/stub headers should be introduced during the early steps of adding
support of new architecture.

An example can be found here:
1. https://lore.kernel.org/xen-devel/cover.1692181079.git.oleksii.kurochko@gmail.com/
2. https://lore.kernel.org/xen-devel/a92f99e8f697da99d77bfde562a549dbef3760ce.1692816595.git.sanastasio@raptorengineering.com/

As part of the patch series, asm/vm_event.h was moved to the stubs directory because
It is the same for ARM, PPC, and RISC-V.

---
Changes in V6:
 - introduce $(asm-generic) macro in Kbuild.include.
 - move "asm-generic" after the rule "__distclean".
 - update the commit message.
---
Changes in V5:
- Update SPDX license.
- Remove code related to UML in Makefile.asm-generic.
- Include $(src)/Makefile instead of $(kbuild-file).
- Update comment message in Makefile.asm-generic.
- Update .gitignore.
- Update path to generated headers in CFLAGS.
- Use the latest version of Linux's Makefile.asm-generic.
- Introduce asm-generic's vm_event.h.
- Switch ARM to use asm-generic/vm_event.h.
---
Changes in V4:
 - add asm-generic support
 - update path of vm_event.h from include/asm-generic/asm to include/asm-generic
---
Changes in V3:
 - add Acked-by: Stefano Stabellini <sstabellini@kernel.org> for "xen: move arm/include/asm/vm_event.h to asm-generic"
 - update SPDX tag.
 - move asm/vm_event.h to asm-generic.
 - rename stubs dir to asm-generic.

---
Changes in V2:
 - change public/domctl.h to public/vm_event.h.
 - update commit message of [PATCH v2 2/2] xen: move arm/include/asm/vm_event.h to stubs

Oleksii Kurochko (2):
  xen: asm-generic support
  xen: move arm/include/asm/vm_event.h to asm-generic

 .gitignore                          |  1 +
 xen/Makefile                        |  9 +++-
 xen/arch/arm/include/asm/Makefile   |  2 +
 xen/arch/arm/include/asm/vm_event.h | 66 -----------------------------
 xen/include/asm-generic/vm_event.h  | 55 ++++++++++++++++++++++++
 xen/scripts/Kbuild.include          |  6 +++
 xen/scripts/Makefile.asm-generic    | 53 +++++++++++++++++++++++
 7 files changed, 125 insertions(+), 67 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/Makefile
 delete mode 100644 xen/arch/arm/include/asm/vm_event.h
 create mode 100644 xen/include/asm-generic/vm_event.h
 create mode 100644 xen/scripts/Makefile.asm-generic

-- 
2.41.0


