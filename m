Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05286299237
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 17:21:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12427.32357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX5F4-0005w4-KR; Mon, 26 Oct 2020 16:21:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12427.32357; Mon, 26 Oct 2020 16:21:06 +0000
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
	id 1kX5F4-0005vf-HM; Mon, 26 Oct 2020 16:21:06 +0000
Received: by outflank-mailman (input) for mailman id 12427;
 Mon, 26 Oct 2020 16:21:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ht1Y=EB=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kX5F2-0005va-RK
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 16:21:04 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 7c77dcec-9fc8-4869-807b-b29d31f37240;
 Mon, 26 Oct 2020 16:21:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A82F01042;
 Mon, 26 Oct 2020 09:21:02 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.198.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D63D3F719;
 Mon, 26 Oct 2020 09:21:01 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ht1Y=EB=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kX5F2-0005va-RK
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 16:21:04 +0000
X-Inumbo-ID: 7c77dcec-9fc8-4869-807b-b29d31f37240
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 7c77dcec-9fc8-4869-807b-b29d31f37240;
	Mon, 26 Oct 2020 16:21:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A82F01042;
	Mon, 26 Oct 2020 09:21:02 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com [10.1.198.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D63D3F719;
	Mon, 26 Oct 2020 09:21:01 -0700 (PDT)
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/3] xen/arm: Warn user on cpu errata 832075
Date: Mon, 26 Oct 2020 16:20:36 +0000
Message-Id: <cover.1603728729.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1

This serie is a v2 after a discussion of [1] to introduce several
changes to handle properly the warning for Arm cpu errata 832075:
- use printk_once instead of warning add
- introduce a tainted type "Unsecure"

The last patch is adding the warning and flags A57 core affected as
unsupported.

[1] https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg00896.html

Bertrand Marquis (3):
  xen/arm: use printk_once for errata warning prints
  xen: Add an unsecure Taint type
  xen/arm: Warn user on cpu errata 832075

 SUPPORT.md               |  1 +
 xen/arch/arm/cpuerrata.c | 23 +++++++++++++++--------
 xen/common/kernel.c      |  4 +++-
 xen/include/xen/lib.h    |  1 +
 4 files changed, 20 insertions(+), 9 deletions(-)

-- 
2.17.1


