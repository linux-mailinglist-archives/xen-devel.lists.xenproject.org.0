Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F71683D766
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 11:09:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671912.1045442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTJ8g-0007uS-Sk; Fri, 26 Jan 2024 10:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671912.1045442; Fri, 26 Jan 2024 10:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTJ8g-0007s3-PH; Fri, 26 Jan 2024 10:08:46 +0000
Received: by outflank-mailman (input) for mailman id 671912;
 Fri, 26 Jan 2024 10:08:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rljN=JE=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rTJ8f-0007rm-Pi
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 10:08:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2eab20f-bc32-11ee-8a43-1f161083a0e0;
 Fri, 26 Jan 2024 11:08:44 +0100 (CET)
Received: from Dell.homenet.telecomitalia.it
 (host-87-16-84-78.retail.telecomitalia.it [87.16.84.78])
 by support.bugseng.com (Postfix) with ESMTPSA id D90774EE073E;
 Fri, 26 Jan 2024 11:08:42 +0100 (CET)
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
X-Inumbo-ID: e2eab20f-bc32-11ee-8a43-1f161083a0e0
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH v2 0/3] Introduce and use STATIC_ASSERT_UNREACHABLE()
Date: Fri, 26 Jan 2024 11:05:40 +0100
Message-Id: <cover.1706259490.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce macro STATIC_ASSERT_UNREACHABLE(),
use it to replace __{get,put}_user_bad(),
update ECLAIR configuration to allow the use of such macro at the end of
switch-caluses.

Federico Serafini (3):
  xen: introduce STATIC_ASSERT_UNREACHABLE()
  x86/uaccess: replace __{get,put}_user_bad() with
    STATIC_ASSERT_UNREACHABLE()
  automation/eclair: add deviation for MISRA C:2012 Rule 16.3

 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
 docs/misra/deviations.rst                        | 5 +++++
 xen/arch/x86/include/asm/uaccess.h               | 7 ++-----
 xen/include/xen/compiler.h                       | 7 +++++++
 4 files changed, 18 insertions(+), 5 deletions(-)

-- 
2.34.1


