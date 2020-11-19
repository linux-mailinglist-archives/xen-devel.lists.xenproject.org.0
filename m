Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD802B923A
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 13:14:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30659.60815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfioy-0003l2-Pb; Thu, 19 Nov 2020 12:13:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30659.60815; Thu, 19 Nov 2020 12:13:52 +0000
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
	id 1kfioy-0003kd-MS; Thu, 19 Nov 2020 12:13:52 +0000
Received: by outflank-mailman (input) for mailman id 30659;
 Thu, 19 Nov 2020 12:13:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfiox-0003kY-Df
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 12:13:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfiow-0002Z8-SK; Thu, 19 Nov 2020 12:13:50 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfiow-0001xd-EF; Thu, 19 Nov 2020 12:13:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfiox-0003kY-Df
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 12:13:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=rWPk71Vp8kXcGTXjihT8/dmwuZbriucRIZWicAo1F0g=; b=MwshuQS2Vhr4Er725RWGSPwn2L
	C0ovpV2elBSsahLOX7tuqcqnpgeTxZJgNtW7q907aGuQ8wssosi83PSu/HbKQvhaAALx55znO282N
	foyVG3cWMaAO5+/QOto+jLgK3fHoxOjBmJUs5SSfg4xTBNm5iLAp5ucIKykrBe/QHM74=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfiow-0002Z8-SK; Thu, 19 Nov 2020 12:13:50 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=ufe34d9ed68d054.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfiow-0001xd-EF; Thu, 19 Nov 2020 12:13:50 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: alex.bennee@linaro.org,
	bertrand.marquis@arm.com,
	andre.przywara@arm.com,
	Rahul.Singh@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 0/2] xen/arm: Allow Xen to boot with ACPI 5.1
Date: Thu, 19 Nov 2020 12:13:45 +0000
Message-Id: <20201119121347.27139-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Hi all,

This series was originally called "xen/arm: Unbreak ACPI". It was
renamed because only the part to allow boot with ACPI 5.1 is not
merged.

With the two changes, it is possible to boot Xen on QEMU with ACPI 5.1.

Cheers,

Julien Grall (2):
  xen/arm: gic: acpi: Use the correct length for the GICC structure
  xen/arm: acpi: Allow Xen to boot with ACPI 5.1

 xen/arch/arm/acpi/boot.c | 6 +++---
 xen/arch/arm/gic-v2.c    | 5 +++--
 xen/arch/arm/gic-v3.c    | 6 +++---
 xen/arch/arm/gic.c       | 2 +-
 4 files changed, 10 insertions(+), 9 deletions(-)

-- 
2.17.1


