Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2132C339F05
	for <lists+xen-devel@lfdr.de>; Sat, 13 Mar 2021 17:06:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97575.185321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lL6mP-00053h-TA; Sat, 13 Mar 2021 16:06:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97575.185321; Sat, 13 Mar 2021 16:06:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lL6mP-00053L-Pz; Sat, 13 Mar 2021 16:06:17 +0000
Received: by outflank-mailman (input) for mailman id 97575;
 Sat, 13 Mar 2021 16:06:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lL6mN-00053B-SY
 for xen-devel@lists.xenproject.org; Sat, 13 Mar 2021 16:06:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lL6mN-0006Qw-Fg; Sat, 13 Mar 2021 16:06:15 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lL6mN-0001Ff-0z; Sat, 13 Mar 2021 16:06:15 +0000
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
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=OiaaY8Ipo2EWvkLByzV6dgLZ0290eAYdoAl27NRpKL8=; b=lF2SY2TSQJb6MEEbIWlItDhbB1
	yowEdMkWaIAhjEisw2XbRZM0INs4zxDmpOWB3bGGUBBXy2Z7HrOnq9ihysWp4gpMmhJ0UjOXEkPpw
	x6l00G9swlncLN9lKkkeYnArzDJy9j0Y7v7C9p8XOdN+d16Ed0deP5IOZO+691QND6ow=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH for-next v2 0/2] xen/arm: Mitigate straight-line speculation
Date: Sat, 13 Mar 2021 16:06:09 +0000
Message-Id: <20210313160611.18665-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Hi all,

Last year, Arm released a whitepaper about a new category of speculation.
(see [1] and [2]). In short, a processor may be able to speculate past
some of the unconditional control flow instructions (e.g eret, smc, br).

In some of the cases, the registers will contain values controlled by
the guest. While there is no known gadget afterwards, we still want to
prevent any leakage in the future.

The mitigation is planned in two parts:
   1) Arm provided patches for both GCC and LLVM to add speculation barrier
   and remove problematic code sequence.
   2) Inspection of assembly code and call to higher level (e.g smc in our case).

I still haven't looked at 1) and how to mitigate properly Arm32 (see
patch #1) and SMC call. So this issue is not fully addressed.

Note that the ERET instruction was already addressed as part of XSA-312.

Cheers,

[1] https://developer.arm.com/support/arm-security-updates/speculative-processor-vulnerability
[2] https://developer.arm.com/support/arm-security-updates/speculative-processor-vulnerability/downloads/straight-line-speculation

Julien Grall (2):
  xen/arm: Include asm/asm-offsets.h and asm/macros.h on every assembly
    files
  xen/arm64: Place a speculation barrier following an ret instruction

 xen/arch/arm/Makefile                |  2 +-
 xen/arch/arm/arm32/entry.S           |  2 +-
 xen/arch/arm/arm32/head.S            |  1 -
 xen/arch/arm/arm32/lib/lib1funcs.S   |  1 +
 xen/arch/arm/arm32/proc-v7.S         |  1 -
 xen/arch/arm/arm64/debug-cadence.inc |  1 -
 xen/arch/arm/arm64/debug-pl011.inc   |  2 --
 xen/arch/arm/arm64/entry.S           |  2 --
 xen/arch/arm/arm64/head.S            |  2 --
 xen/arch/arm/arm64/smc.S             |  3 ---
 xen/include/asm-arm/arm64/macros.h   |  6 ++++++
 xen/include/asm-arm/config.h         |  6 ++++++
 xen/include/asm-arm/macros.h         | 18 +++++++++---------
 13 files changed, 24 insertions(+), 23 deletions(-)

-- 
2.17.1


