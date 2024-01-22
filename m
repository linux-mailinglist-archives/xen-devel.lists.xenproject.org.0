Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0478364B3
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 14:48:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669904.1042417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRuf2-0007dk-0a; Mon, 22 Jan 2024 13:48:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669904.1042417; Mon, 22 Jan 2024 13:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRuf1-0007aW-Qq; Mon, 22 Jan 2024 13:48:23 +0000
Received: by outflank-mailman (input) for mailman id 669904;
 Mon, 22 Jan 2024 13:48:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t9EV=JA=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rRuf0-0007Ly-AP
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 13:48:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7856e42-b92c-11ee-98f2-6d05b1d4d9a1;
 Mon, 22 Jan 2024 14:48:21 +0100 (CET)
Received: from Dell.homenet.telecomitalia.it
 (host-87-16-84-78.retail.telecomitalia.it [87.16.84.78])
 by support.bugseng.com (Postfix) with ESMTPSA id 1AB3A4EE0738;
 Mon, 22 Jan 2024 14:48:20 +0100 (CET)
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
X-Inumbo-ID: e7856e42-b92c-11ee-98f2-6d05b1d4d9a1
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
Subject: [XEN PATCH 0/3] Introduce and use static_assert_unreachable()
Date: Mon, 22 Jan 2024 14:48:05 +0100
Message-Id: <cover.1705930767.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce macro static_assert_unreachable(), use it to replace
__{get,put}_user_bad() and update ECLAIR configuration to allow the use of
such macro at the end of switch-caluses.

Federico Serafini (3):
  xen: introduce static_assert_unreachable()
  x86/uaccess: replace __{get,put}_user_bad() with
    static_assert_unreachable()
  automation/eclair: add deviation for MISRA C:2012 Rule 16.3

 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
 docs/misra/deviations.rst                        | 4 ++++
 xen/arch/x86/include/asm/uaccess.h               | 7 ++-----
 xen/include/xen/compiler.h                       | 8 ++++++++
 4 files changed, 18 insertions(+), 5 deletions(-)

-- 
2.34.1


