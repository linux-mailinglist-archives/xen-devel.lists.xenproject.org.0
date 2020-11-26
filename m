Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5E92C588E
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 16:53:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38708.71531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiJaG-0004gL-Ip; Thu, 26 Nov 2020 15:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38708.71531; Thu, 26 Nov 2020 15:53:24 +0000
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
	id 1kiJaG-0004f6-CX; Thu, 26 Nov 2020 15:53:24 +0000
Received: by outflank-mailman (input) for mailman id 38708;
 Thu, 26 Nov 2020 15:53:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YrL6=FA=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kiJaF-0004Ch-IV
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 15:53:23 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a4884ce1-4f93-440f-a742-a98e93937557;
 Thu, 26 Nov 2020 15:53:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D67FA31B;
 Thu, 26 Nov 2020 07:53:07 -0800 (PST)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 330C63F23F;
 Thu, 26 Nov 2020 07:53:07 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YrL6=FA=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kiJaF-0004Ch-IV
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 15:53:23 +0000
X-Inumbo-ID: a4884ce1-4f93-440f-a742-a98e93937557
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id a4884ce1-4f93-440f-a742-a98e93937557;
	Thu, 26 Nov 2020 15:53:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D67FA31B;
	Thu, 26 Nov 2020 07:53:07 -0800 (PST)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com [10.1.199.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 330C63F23F;
	Thu, 26 Nov 2020 07:53:07 -0800 (PST)
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 7/7] xen/arm: Activate TID3 in HCR_EL2
Date: Thu, 26 Nov 2020 15:51:09 +0000
Message-Id: <4d48107fb864222aa6f32ebf691e169a14c3e6b9.1606151462.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1606151462.git.bertrand.marquis@arm.com>
References: <cover.1606151462.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1606151462.git.bertrand.marquis@arm.com>
References: <cover.1606151462.git.bertrand.marquis@arm.com>

Activate TID3 bit in HSR register when starting a guest.
This will trap all coprecessor ID registers so that we can give to guest
values corresponding to what they can actually use and mask some
features to guests even though they would be supported by the underlying
hardware (like SVE or MPAM).

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
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


