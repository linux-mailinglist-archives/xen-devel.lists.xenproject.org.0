Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E421851BD54
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 12:36:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321938.543098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmYqG-0002Zj-Hn; Thu, 05 May 2022 10:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321938.543098; Thu, 05 May 2022 10:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmYqG-0002XP-En; Thu, 05 May 2022 10:36:16 +0000
Received: by outflank-mailman (input) for mailman id 321938;
 Thu, 05 May 2022 10:36:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pu9C=VN=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nmYqF-0002XD-A8
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 10:36:15 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 2f346267-cc5f-11ec-a406-831a346695d4;
 Thu, 05 May 2022 12:36:13 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66FC5106F;
 Thu,  5 May 2022 03:36:12 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.3.137])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E37D63FA27;
 Thu,  5 May 2022 03:36:10 -0700 (PDT)
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
X-Inumbo-ID: 2f346267-cc5f-11ec-a406-831a346695d4
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/2] xen/arm: gnttab: macros modifications
Date: Thu,  5 May 2022 12:35:59 +0200
Message-Id: <20220505103601.322110-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series modifies macros inside xen/arch/arm/include/asm/grant_table.h
to be resistant to static analyzer/compiler warnings about unused-but-set
variables.

The first patch acts as a fix for a gcc warning when -Wunused-but-set-variable
flag is enabled by converting the macro to static inline helper. The
adjacent macro is modified as well. These macros can be converted to inline
helpers as they do not take argument of type struct grant_table which is not
fully defined yet.

The second patch modifies the remaining macros to evaluate all their arguments
and only once.

Previous discussion:
https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg119708.html

Michal Orzel (2):
  xen/arm: gnttab: use static inlines for gnttab_{release_}host_mapping*
  xen/arm: gnttab: modify macros to evaluate all arguments and only once

 xen/arch/arm/include/asm/grant_table.h | 80 +++++++++++++++++++-------
 1 file changed, 59 insertions(+), 21 deletions(-)

-- 
2.25.1


