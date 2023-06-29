Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A52A3742E2B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 22:11:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557070.870104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qExzL-0005gl-SO; Thu, 29 Jun 2023 20:11:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557070.870104; Thu, 29 Jun 2023 20:11:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qExzL-0005e0-PB; Thu, 29 Jun 2023 20:11:35 +0000
Received: by outflank-mailman (input) for mailman id 557070;
 Thu, 29 Jun 2023 20:11:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qExzK-0005dm-N5
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 20:11:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qExzK-0006ky-Az; Thu, 29 Jun 2023 20:11:34 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qExzK-0000KI-37; Thu, 29 Jun 2023 20:11:34 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=qGgBhJ0QVywDswP/P6XQDrfhzAcORmDwmn/RFl5JH5E=; b=jl0JYk
	3Z2OlkJS3s0LMyr9fBlFaWZByKb6E/+zgrhpA6VChuheswRMfHkoYn4aVGPWovpQ6KQAzO4OZDg7R
	sAhS+uDsJL4F05+wyXrIdWOBzElms3AYoJUVOHJrfU4qEjPkAnZMG/YIgChg0eRZQPE+E/VlIeq0H
	fiodzPBVqTo=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	michal.orzel@amd.com,
	Henry.Wang@arm.com,
	Julien Grall <jgrall@amazon.com>
Subject: [v2 0/4] xen/arm: Enable USBAN support
Date: Thu, 29 Jun 2023 21:11:25 +0100
Message-Id: <20230629201129.12934-1-julien@xen.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Hi all,

At the moment, we are not able to enable UBSAN on Arm because the
final binary will be over the maximum size of Xen we currently support
(i.e. 2MB).

This patch series aim to lift the restrictions and also
enable UBSAN.

Cheers,

Julien Grall (4):
  xen/arm64: head: Don't map too much in boot_third
  xen/arm32: head: Don't map too much in boot_third
  xen/arm: Rework the code mapping Xen to avoid relying on the size of
    Xen
  xen/arm: Allow the user to build Xen with UBSAN

 xen/arch/arm/Kconfig              |  1 +
 xen/arch/arm/arm32/head.S         | 79 ++++++++++++++++++++++++-------
 xen/arch/arm/arm64/head.S         | 69 ++++++++++++++++++++++-----
 xen/arch/arm/include/asm/config.h | 23 +++++----
 xen/arch/arm/include/asm/lpae.h   | 10 ++--
 xen/arch/arm/mm.c                 | 24 ++++++----
 xen/arch/arm/xen.lds.S            |  9 ++++
 7 files changed, 161 insertions(+), 54 deletions(-)

-- 
2.40.1


