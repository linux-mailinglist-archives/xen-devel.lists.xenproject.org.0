Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9662B98F2
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 18:08:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31209.61511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfnQA-0007hy-OE; Thu, 19 Nov 2020 17:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31209.61511; Thu, 19 Nov 2020 17:08:34 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfnQA-0007hZ-L1; Thu, 19 Nov 2020 17:08:34 +0000
Received: by outflank-mailman (input) for mailman id 31209;
 Thu, 19 Nov 2020 17:08:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfnQ9-0007hP-44
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:08:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfnQ8-0000ul-Jv; Thu, 19 Nov 2020 17:08:32 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfnQ9-0000U1-8M; Thu, 19 Nov 2020 17:08:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfnQ9-0007hP-44
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:08:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=c1eUtv3J3QHRIBeiCg5Q3ir6r4CZrIczVaetKRD/GdY=; b=sC2SSNZnPUJPw2Au3OaNYf3nSC
	TWyjRmaEGydMixitAOQhunixsaw/pHUGiSTl6Q1yIMKibGB60F3PH1o8xxOfCmMi9bRA3d2knlxg9
	R9bNKQjiAYD1e6zOwsEQzQ3ujkXlI0HlEzqLGAnbtmWda+gbkz/A06hZK6GWI3hd3kTg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfnQ8-0000ul-Jv; Thu, 19 Nov 2020 17:08:32 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=ufe34d9ed68d054.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfnQ9-0000U1-8M; Thu, 19 Nov 2020 17:08:33 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: alex.bennee@linaro.org,
	bertrand.marquis@arm.com,
	andre.przywara@arm.com,
	Rahul.Singh@arm.com,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 0/3] xen/arm: Allow Xen to boot with ACPI 5.1
Date: Thu, 19 Nov 2020 17:08:26 +0000
Message-Id: <20201119170829.9923-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Hi all,

This series was originally called "xen/arm: Unbreak ACPI". It was
renamed because only the part to allow boot with ACPI 5.1 is not
merged.

After this series, it is possible to boot Xen on QEMU with ACPI 5.1.

Cheers,

Julien Grall (3):
  xen/arm: gic: acpi: Guard helpers to build the MADT with CONFIG_ACPI
  xen/arm: gic: acpi: Use the correct length for the GICC structure
  xen/arm: acpi: Allow Xen to boot with ACPI 5.1

 xen/arch/arm/acpi/boot.c  |  6 +++---
 xen/arch/arm/gic-v2.c     | 13 ++++++-------
 xen/arch/arm/gic-v3.c     | 17 +++++------------
 xen/arch/arm/gic.c        |  4 +++-
 xen/include/asm-arm/gic.h | 10 ++++++++--
 5 files changed, 25 insertions(+), 25 deletions(-)

-- 
2.17.1


