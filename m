Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CFA78C7A7
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 16:35:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592335.925040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaznz-00019I-4g; Tue, 29 Aug 2023 14:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592335.925040; Tue, 29 Aug 2023 14:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaznz-00016B-1K; Tue, 29 Aug 2023 14:34:55 +0000
Received: by outflank-mailman (input) for mailman id 592335;
 Tue, 29 Aug 2023 14:34:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C8Qf=EO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qaznw-0000r8-NS
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 14:34:52 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 357457de-4679-11ee-9b0d-b553b5be7939;
 Tue, 29 Aug 2023 16:34:49 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4ffae5bdc9aso7114382e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Aug 2023 07:34:50 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 21-20020ac24835000000b00500a2091e30sm1963770lft.115.2023.08.29.07.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 07:34:49 -0700 (PDT)
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
X-Inumbo-ID: 357457de-4679-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693319690; x=1693924490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6CsfWRLerK9jeSjo8esZwyLr1ca8YVOS48gV3POFw8Q=;
        b=LWUbHG2Tn/d1JzM3No6ZKSlI3v7JhvRlBspUN+8P7FvEjMNZbWfWtsC42OqesYD6LG
         ljlP4/VUI7wKjqhrQcDR8fDkG0cbrANcYWuAjvhygHH1okN+IDl40t3qTrL3XdeFP3Lb
         vC6R2RhqJB2tFduRx+FHfcGlL1hbFSxmjlVRbexQzM5SYfVm3a6OfCjVWwzApAcC2EpB
         9ikEwK58uz1atP7Kpeo7m49yDxsIDd+WbCDO7Vh68gjrV78KXM7nc6ukNHkhef+ui5p1
         62ibPz0xL5qwPm1B3ujeP5z4Z5WjkCErhmYZ14P8SBlrqPKdVhRJZ2q4Aqr+lUWgqSBF
         UxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693319690; x=1693924490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CsfWRLerK9jeSjo8esZwyLr1ca8YVOS48gV3POFw8Q=;
        b=I7ZkFBOV0h1jGxdHwtittEDin3McRV3qIeQiv+1RB+7hS+kLwXjn91kBKUtM7vukvD
         +nnI3owie2ANlUQHaDYBmSRyUe1xCIAWCxaJzAOY6o9hu+0/Bjp4soADUinVZifwo4H2
         Oc6uQIjGi33do8EnVhhbiE24x/py1jr163WQZxuaROMaGZKjvDoC+kYIGaOaKQqHm4dR
         vU9Ec1CEJRVotv8zi8gTD9xM89tLzinmYmkJ93MNw/xhAWCScqc91VHs9TCMKjR/XKXD
         Xbi/jwT7/hF8RJyrBWrk9cWhfpIOj/OxetONCjcDVgXSZckjjgvFd3aUrC+ydwNh6lnQ
         8G6Q==
X-Gm-Message-State: AOJu0YwOO2/4nunacv1/Pw16M+8Y9s4U158zwMZZT2yd8dNXwivA+obx
	T+mkng+hCUA2TIQ0ubcqI5U0Fw0e38I=
X-Google-Smtp-Source: AGHT+IF/HMz7udtM/JBvLr4EjWf9Ohu2c4L78Kifn74qwpIBmlRMciV2AQzXf2mq1xQCe4BNgHJ3RA==
X-Received: by 2002:a05:6512:6d5:b0:500:b9e3:91bd with SMTP id u21-20020a05651206d500b00500b9e391bdmr4793242lff.41.1693319689609;
        Tue, 29 Aug 2023 07:34:49 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 0/2] introduce stub directory to storing empty/stub headers
Date: Tue, 29 Aug 2023 17:34:37 +0300
Message-ID: <cover.1693319118.git.oleksii.kurochko@gmail.com>
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

Changes in V2:
 - change public/domctl.h to public/vm_event.h.
 - update commit message of [PATCH v2 2/2] xen: move arm/include/asm/vm_event.h to stubs

Oleksii Kurochko (2):
  xen: add stubs dir to include path
  xen: move arm/include/asm/vm_event.h to stubs

 xen/Makefile                        |  1 +
 xen/arch/arm/include/asm/vm_event.h | 66 -----------------------------
 xen/include/stubs/asm/vm_event.h    | 55 ++++++++++++++++++++++++
 3 files changed, 56 insertions(+), 66 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/vm_event.h
 create mode 100644 xen/include/stubs/asm/vm_event.h

-- 
2.41.0


