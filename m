Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AB290F4D7
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 19:09:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743951.1150956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJyoI-0004r2-C7; Wed, 19 Jun 2024 17:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743951.1150956; Wed, 19 Jun 2024 17:09:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJyoI-0004p1-8Z; Wed, 19 Jun 2024 17:09:26 +0000
Received: by outflank-mailman (input) for mailman id 743951;
 Wed, 19 Jun 2024 17:09:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vpHL=NV=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sJyoG-0004ov-UA
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 17:09:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac499f95-2e5e-11ef-b4bb-af5377834399;
 Wed, 19 Jun 2024 19:09:22 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-87-17-171-46.retail.telecomitalia.it [87.17.171.46])
 by support.bugseng.com (Postfix) with ESMTPSA id B02384EE0738;
 Wed, 19 Jun 2024 19:09:21 +0200 (CEST)
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
X-Inumbo-ID: ac499f95-2e5e-11ef-b4bb-af5377834399
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/2] automation/eclair_analysis: deviate MISRA C Rule 21.2
Date: Wed, 19 Jun 2024 19:09:08 +0200
Message-Id: <cover.1718816397.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series aims to address several violations of Rule 21.2 which states the
following: A reserved identifier or reserved macro name shall not be declared.
The series contains two patches, one changes x86/APIC which used an identifier
starting with '__', the second deviates all reserved identifiers with the 
exception of those starting with "__builtin_" which still remain available.

Alessandro Zucchelli (1):
  automation/eclair_analysis: deviate MISRA C Rule 21.2

Nicola Vetrini (1):
  x86/APIC: address violation of MISRA C Rule 21.2

 automation/eclair_analysis/ECLAIR/deviations.ecl | 11 +++++++++++
 xen/arch/x86/apic.c                              |  4 ++--
 2 files changed, 13 insertions(+), 2 deletions(-)

-- 
2.34.1


