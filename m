Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4231FBD68
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 19:59:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlFrq-0007UJ-A3; Tue, 16 Jun 2020 17:59:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QOm8=75=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jlFro-0007Ta-6d
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 17:59:24 +0000
X-Inumbo-ID: 1c2ca34a-affb-11ea-b923-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c2ca34a-affb-11ea-b923-12813bfff9fa;
 Tue, 16 Jun 2020 17:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wGfJn96R3ZlVVuYZ9IwqkUyeFMh4LTwYfmmbem1Z51E=; b=tVQhtFigcnMutcLTi5GeqlfvhN
 YL1zs1vJkFKer+dmngOqbZboQXhLIaVontpJE1+6VKxw7YK92lwiNNslLANTETeQ1eqofTOH93M6B
 NbulPRnmaGeto2t4j8dxlwFYS1s+Dz5nqsTIvSJg8fBNr2QilNJMndRN5qP8DOYbr5Rc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jlFri-0003kY-8n; Tue, 16 Jun 2020 17:59:18 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jlFrh-00036w-Uo; Tue, 16 Jun 2020 17:59:18 +0000
From: Julien Grall <julien@xen.org>
To: security@xenproject.org
Subject: [PATCH 0/2] xen/arm: Mitigate straight-line speculation
Date: Tue, 16 Jun 2020 18:59:11 +0100
Message-Id: <20200616175913.7368-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: sstabellini@kernel.org, paul@xen.org, Andre.Przywara@arm.com,
 Julien Grall <jgrall@amazon.com>, Bertrand.Marquis@arm.com,
 xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

Hi all,

Arm recently released a whitepaper about a new category of speculation.
(see [1] and [2]). In short, a processor may be able to speculate past
some of the unconditional control flow instructions (e.g eret, smc, br).

In some of the cases, the registers will contain values controlled by
the guest. While there is no known gadget afterwards, we still want to
prevent any leakage in the future.

The mitigation is planned in two parts:
   1) Arm provided patches for both GCC and LLVM to add speculation barrier
   and remove problematic code sequence.
   2) Inspection of assembly code and call to higher level (e.g smc in our case).

I am still waiting on more input for 1), so this series only address 2)
for the moment.

Note that the ERET instruction was already addressed as part of XSA-312.

The patch series is directly sent on the mailing list as the
security team has been aware of the issues after the whitepaper was
publicly released.

Cheers,

[1] https://developer.arm.com/support/arm-security-updates/speculative-processor-vulnerability
[2] https://developer.arm.com/support/arm-security-updates/speculative-processor-vulnerability/downloads/straight-line-speculation

Julien Grall (2):
  xen/arm: entry: Place a speculation barrier following an ret
    instruction
  xen/arm: Mitigate straight-line speculation for SMC call

 xen/arch/arm/arm32/entry.S   |  1 +
 xen/arch/arm/arm64/entry.S   |  2 ++
 xen/arch/arm/arm64/smc.S     |  1 +
 xen/include/asm-arm/smccc.h  | 13 +++++++++++++
 xen/include/asm-arm/system.h |  8 ++++++++
 5 files changed, 25 insertions(+)

-- 
2.17.1


