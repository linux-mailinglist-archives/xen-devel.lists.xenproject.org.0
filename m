Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C93178D7BB
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 18:57:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593173.926115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbOVI-00038n-Pa; Wed, 30 Aug 2023 16:57:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593173.926115; Wed, 30 Aug 2023 16:57:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbOVI-00035x-Le; Wed, 30 Aug 2023 16:57:16 +0000
Received: by outflank-mailman (input) for mailman id 593173;
 Wed, 30 Aug 2023 16:57:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6FTw=EP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qbOVH-00034Q-3j
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 16:57:15 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44b1e743-4756-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 18:57:14 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-500a8b2b73eso97158e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Aug 2023 09:57:14 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 er7-20020a05651248c700b004fd36c89c3csm2458240lfb.43.2023.08.30.09.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 09:57:12 -0700 (PDT)
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
X-Inumbo-ID: 44b1e743-4756-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693414633; x=1694019433; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l++Zpa9W3cVegRsEsIxzmI6J+GeofQzkS3WKSaWLCrY=;
        b=d7jMPKmZTiYsL1CLUQB8VLiQGy+9hEU2Yevc4WlBR8EncxWsrGGzYdIyYwKufBkRXE
         Zxerkhgz0uBBhDe2r5pRifQz1RJJHEshgSloncl+70kvKQJS8wbMjZdHkrflUgpczWCw
         qeeOJnUs/m7eiK3uowD3YMDJPgHEkuAn73+gR5a5UkwjrV/4px5F8rJehGhVapYIB0aU
         25EwO18feNfG1gCqr/xDq7j4jqPBMsJAvQWzlV2fTmnyvUrt0ZEnmWExBrL8FEVI7MqI
         tttdePKyG0vEzfNz8Df28BdPDAb1T2E7qYWr8wdshMiudTuYCn+/m7AXPnok1Si/NbGR
         TaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693414633; x=1694019433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l++Zpa9W3cVegRsEsIxzmI6J+GeofQzkS3WKSaWLCrY=;
        b=BNcLaZkju3zdJy6LcFxLC1uL3TcNfpDu8E4dg3BSJ6CCAQ/M20aic3F5vqtu1sxVnf
         tHWxbKAT7CQQSAnHcklo//sHJ9fo0+lU2BYtXRCgrNMA0fwxfJszIhhW/y6GfGIDWjkm
         2qDW3G4+VEVGjcDUNedZidxNh6J5vtAzSovz7mQgPdpARpxEek0UfkItcYw99QIYTUxD
         igx1l92wBRLTLY5eBaJXaPsClr8wrPSa/HCYlEeeDTNBVgh3OLXztLryzOAftDjX/Ivt
         Zb7MMmu65pIgxcWnTHaCGlbzDhan4fAvRKIMZv3TrV33l4tQKYjENR+9ov1Ro1lxSLTU
         yW6w==
X-Gm-Message-State: AOJu0YxlL090lFfY3+wZX1/FfbnapiPNsowj954ujEFzj86ptW4mXKYd
	N1Bc+1M63iN5gxPokVHrbzEFiIaRhwo=
X-Google-Smtp-Source: AGHT+IFBoVzr/rUfHRjhoFg22flNv3fLTNX3h1DFKGxL0xeQtc8pcyZO3B5nCSXsLQFDNd8wtqArOg==
X-Received: by 2002:a05:6512:519:b0:500:7de4:300e with SMTP id o25-20020a056512051900b005007de4300emr1668737lfb.58.1693414632868;
        Wed, 30 Aug 2023 09:57:12 -0700 (PDT)
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
Subject: [PATCH v3 0/2] introduce stub directory to storing empty/stub headers
Date: Wed, 30 Aug 2023 19:57:05 +0300
Message-ID: <cover.1693414172.git.oleksii.kurochko@gmail.com>
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
  xen: add asm-generic dir to include path
  xen: move arm/include/asm/vm_event.h to stubs

 xen/Makefile                           |  1 +
 xen/arch/arm/include/asm/vm_event.h    | 66 --------------------------
 xen/include/asm-generic/asm/vm_event.h | 55 +++++++++++++++++++++
 3 files changed, 56 insertions(+), 66 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/vm_event.h
 create mode 100644 xen/include/asm-generic/asm/vm_event.h

-- 
2.41.0


