Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E687943DF
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 21:45:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596799.930852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdyRx-0007B4-Qn; Wed, 06 Sep 2023 19:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596799.930852; Wed, 06 Sep 2023 19:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdyRx-00076B-NN; Wed, 06 Sep 2023 19:44:29 +0000
Received: by outflank-mailman (input) for mailman id 596799;
 Wed, 06 Sep 2023 19:44:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UMkA=EW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qdyRw-00073v-SK
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 19:44:28 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c92f2313-4ced-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 21:44:26 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-500a398cda5so263204e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Sep 2023 12:44:26 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 x26-20020a19e01a000000b00500d1f67be9sm2895825lfg.43.2023.09.06.12.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 12:44:24 -0700 (PDT)
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
X-Inumbo-ID: c92f2313-4ced-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694029465; x=1694634265; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nu8c+OXjObLS2FHHyrswi2cSK7EbSvooNIqpjeFoORY=;
        b=YEkVBpY3lFnOzmqGsfQcWizFFCc0cbGdTMloL8lPvGwR52DWMpwk8MJkOHlg67X01P
         HP/mlOt/aWSuz8AQyrhRizBo36QfcNKhb3/o1drd9x0Ktpigan4V0u45nsUHq5hGYvIW
         YhY5UQBIMRJ+D5NdLhDfJkhWpoZgJTUS8kMdc3lXjgksnr8tvP6L2qMSrzukJSRaKn6p
         lPumwfC8pB+WQDrmb78+tL9MfSV78koS1zpc1hkrNlF0tsFZUO56SMi1JCl5ghfYx+UJ
         7m4hp1JG5APEd4qaJMbNPnbWO9BUNdghNZkGgYJoBRm/wmlzlHpIhqMv3TIeH+A3ei8/
         iEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694029465; x=1694634265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nu8c+OXjObLS2FHHyrswi2cSK7EbSvooNIqpjeFoORY=;
        b=PawDJWI14T32cK1mbzB9k+NNbvLi9YyKzg2Wm/4d3Ws35JpQi/IFaSJm5FzPFuN6VK
         iGjiz0ppp26Qj3PK5gvXcvkAd4Hc58haU2h2+x79OC/jmNtt8k3XpycGt6HsoxWpV0Av
         /ZzPG7HIb7rwRA0n+MDHhpOnRt56CZW/TYjmQD6pzFcn7SkQ/D9j/uznFeN7Ljgmcyq0
         PC1PnNBXmlL6ifiLoPr+djcJ2TIE8FHuVcZiN0qURI0C9TvqbMRdsuEwV8sThim6kPm3
         Oh1Lv8Eb9qJMDJzwJnc9fc02+reZED/amPCEaVh4/zjqt1egU1KmzWCCGJ+LGL+CMnYO
         mDpw==
X-Gm-Message-State: AOJu0YybIHhTqlmav6nR8vSYPoljFs8LMDblqfzAAcQ7EtSixMoux+ys
	ijgVLe9WIJyBo6fjE1H+2RkBzA3HUWw=
X-Google-Smtp-Source: AGHT+IFneTb7KcpbzzF/8Fu+HVhD2IDpbc+8z5RSYFtpSWrhWuQUKF+/ro7DFp7mCg9SG3Le8Sm9/A==
X-Received: by 2002:a05:6512:2399:b0:501:bae0:36 with SMTP id c25-20020a056512239900b00501bae00036mr3666998lfv.16.1694029465069;
        Wed, 06 Sep 2023 12:44:25 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 0/2] introduce stub directory to storing empty/stub headers
Date: Wed,  6 Sep 2023 22:44:20 +0300
Message-ID: <cover.1694024884.git.oleksii.kurochko@gmail.com>
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
  xen: move arm/include/asm/vm_event.h to stubs

 .gitignore                          |  1 +
 xen/Makefile                        | 10 ++++-
 xen/arch/arm/include/asm/Makefile   |  2 +
 xen/arch/arm/include/asm/vm_event.h | 66 -----------------------------
 xen/include/asm-generic/vm_event.h  | 55 ++++++++++++++++++++++++
 xen/scripts/Makefile.asm-generic    | 53 +++++++++++++++++++++++
 6 files changed, 120 insertions(+), 67 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/Makefile
 delete mode 100644 xen/arch/arm/include/asm/vm_event.h
 create mode 100644 xen/include/asm-generic/vm_event.h
 create mode 100644 xen/scripts/Makefile.asm-generic

-- 
2.41.0


