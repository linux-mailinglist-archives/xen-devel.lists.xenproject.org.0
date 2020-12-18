Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5952DEAB9
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 22:04:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56695.99322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqMv7-0003Ub-QM; Fri, 18 Dec 2020 21:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56695.99322; Fri, 18 Dec 2020 21:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqMv7-0003UC-Mt; Fri, 18 Dec 2020 21:04:13 +0000
Received: by outflank-mailman (input) for mailman id 56695;
 Fri, 18 Dec 2020 21:04:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dpih=FW=daemonizer.de=maxi@srs-us1.protection.inumbo.net>)
 id 1kqMv7-0003U7-4Y
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 21:04:13 +0000
Received: from mx1.somlen.de (unknown [2a00:1828:a019::100:0])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e145b88-3f89-4536-879d-b3ffebf4cdcc;
 Fri, 18 Dec 2020 21:04:11 +0000 (UTC)
Received: by mx1.somlen.de with ESMTPSA id B30FEC3AF0B;
 Fri, 18 Dec 2020 21:45:24 +0100 (CET)
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
X-Inumbo-ID: 3e145b88-3f89-4536-879d-b3ffebf4cdcc
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: xen-devel@lists.xenproject.org
Cc: Maximilian Engelhardt <maxi@daemonizer.de>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 0/3] Improvements for reproducible builds
Date: Fri, 18 Dec 2020 21:42:32 +0100
Message-Id: <cover.1608319634.git.maxi@daemonizer.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While working on a reproducible build of xen in Debian I came up with
the following three patches which are needed to build xen reproducibly
in Debian. Reproducible builds are useful to verify the binary has
actually been built from the corresponding source.

The first patch is an extension of [1] which only omits the timestamp if
SOURCE_DATE_EPOCH is defined. Patch two fixes an ordering issue in the
generated documentation and the last patch uses the date from
SOURCE_DATE_EPOCH if available in the documentation.

[1] https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg02161.html

Maximilian Engelhardt (3):
  xen/arch/x86: don't insert timestamp when SOURCE_DATE_EPOCH is defined
  docs: use predictable ordering in generated documentation
  docs: set date to SOURCE_DATE_EPOCH if available

 docs/Makefile         | 8 +++++++-
 docs/xen-headers      | 2 +-
 xen/arch/x86/Makefile | 6 ++++++
 3 files changed, 14 insertions(+), 2 deletions(-)

-- 
2.20.1


