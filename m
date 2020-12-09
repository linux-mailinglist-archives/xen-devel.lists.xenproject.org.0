Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5962D46D2
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 17:35:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48542.85913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn2Qp-0007UW-EN; Wed, 09 Dec 2020 16:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48542.85913; Wed, 09 Dec 2020 16:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn2Qp-0007Te-9y; Wed, 09 Dec 2020 16:35:11 +0000
Received: by outflank-mailman (input) for mailman id 48542;
 Wed, 09 Dec 2020 16:35:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiOm=FN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kn2Qo-0007Fp-F9
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 16:35:10 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id b4d68c8c-474d-45c1-be3a-5e462c638463;
 Wed, 09 Dec 2020 16:35:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 108B31FB;
 Wed,  9 Dec 2020 08:35:01 -0800 (PST)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FE4A3F68F;
 Wed,  9 Dec 2020 08:35:00 -0800 (PST)
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
X-Inumbo-ID: b4d68c8c-474d-45c1-be3a-5e462c638463
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 7/7] xen/arm: Activate TID3 in HCR_EL2
Date: Wed,  9 Dec 2020 16:31:00 +0000
Message-Id: <956cf336ffce24f0cabfc7a98ae855bc71d5f028.1607524536.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607524536.git.bertrand.marquis@arm.com>
References: <cover.1607524536.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1607524536.git.bertrand.marquis@arm.com>
References: <cover.1607524536.git.bertrand.marquis@arm.com>

Activate TID3 bit in HSR register when starting a guest.
This will trap all coprecessor ID registers so that we can give to guest
values corresponding to what they can actually use and mask some
features to guests even though they would be supported by the underlying
hardware (like SVE or MPAM).

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in V2: Rebase
Changes in V3: Rebase

---
 xen/arch/arm/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 28d9d64558..c1a9ad6056 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -98,7 +98,7 @@ register_t get_default_hcr_flags(void)
 {
     return  (HCR_PTW|HCR_BSU_INNER|HCR_AMO|HCR_IMO|HCR_FMO|HCR_VM|
              (vwfi != NATIVE ? (HCR_TWI|HCR_TWE) : 0) |
-             HCR_TSC|HCR_TAC|HCR_SWIO|HCR_TIDCP|HCR_FB|HCR_TSW);
+             HCR_TID3|HCR_TSC|HCR_TAC|HCR_SWIO|HCR_TIDCP|HCR_FB|HCR_TSW);
 }
 
 static enum {
-- 
2.17.1


