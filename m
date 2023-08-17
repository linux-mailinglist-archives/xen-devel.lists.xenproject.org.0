Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DA5780016
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 23:44:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585634.916793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWkmn-0007kq-Cw; Thu, 17 Aug 2023 21:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585634.916793; Thu, 17 Aug 2023 21:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWkmn-0007i9-8t; Thu, 17 Aug 2023 21:44:09 +0000
Received: by outflank-mailman (input) for mailman id 585634;
 Thu, 17 Aug 2023 21:44:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWkml-0007hx-CP
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 21:44:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWkml-0001Ja-2k; Thu, 17 Aug 2023 21:44:07 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWkmk-0002Ab-QJ; Thu, 17 Aug 2023 21:44:07 +0000
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
	Subject:Cc:To:From; bh=GuQY1S0IKRpg79xq/AqjyzN/9Y7Flg4Rjxb/ukFW0PQ=; b=Q25gQ2
	JR8S4E19dbsuW+T1z1mvglr6zqJf6DkbrpGp3z1FVB37omYcwd4/IEGJRn1bs9txS+OoolNStWzaj
	O9p9rKYlaY7nbwr7dvdn+OZ79jApdMovC/HycynrKxE78Da9u+5SdlX3VfjbpCrfCK1zEk3042RPk
	eX77fjyITtY=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/3] xen/arm: Some clean-up found with -Wconversion and -Warith-conversion
Date: Thu, 17 Aug 2023 22:43:53 +0100
Message-Id: <20230817214356.47174-1-julien@xen.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Hi all,

This is a small series to fix some of the issues found while playing
with -Wconversion and -Warith-conversion.

There are a lot more but the bulk are in
 - bitmap
 - cpumask
 - nodemask
 - bitops/atomics
 - find_*

Some are not too difficult to address but other there are even
prototype conflicts between arm x86.

Cheers,

Julien Grall (3):
  xen/arm: vmmio: The number of entries cannot be negative
  xen/arm: vgic: Use 'unsigned int' rather than 'int' whenever it is
    possible
  xen/public: arch-arm: All PSR_* defines should be unsigned

 xen/arch/arm/domain.c           |  3 +-
 xen/arch/arm/include/asm/mmio.h |  6 ++--
 xen/arch/arm/include/asm/vgic.h | 17 ++++++-----
 xen/arch/arm/io.c               |  2 +-
 xen/arch/arm/vgic-v2.c          | 14 +++++++--
 xen/arch/arm/vgic-v3.c          |  2 +-
 xen/arch/arm/vgic.c             | 23 ++++++++-------
 xen/arch/arm/vgic/vgic-init.c   |  2 +-
 xen/include/public/arch-arm.h   | 52 ++++++++++++++++-----------------
 9 files changed, 68 insertions(+), 53 deletions(-)

-- 
2.40.1


