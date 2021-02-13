Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CC131AC66
	for <lists+xen-devel@lfdr.de>; Sat, 13 Feb 2021 15:49:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84620.158702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAwEB-0000lG-2t; Sat, 13 Feb 2021 14:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84620.158702; Sat, 13 Feb 2021 14:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAwEA-0000kt-Vt; Sat, 13 Feb 2021 14:48:54 +0000
Received: by outflank-mailman (input) for mailman id 84620;
 Sat, 13 Feb 2021 14:48:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uKQL=HP=daemonizer.de=maxi@srs-us1.protection.inumbo.net>)
 id 1lAwE9-0000ko-Kf
 for xen-devel@lists.xenproject.org; Sat, 13 Feb 2021 14:48:53 +0000
Received: from mx1.somlen.de (unknown [89.238.87.226])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0be3515e-d966-4bb2-aa4a-a8bf189a4583;
 Sat, 13 Feb 2021 14:48:51 +0000 (UTC)
Received: by mx1.somlen.de with ESMTPSA id F2934C36AAE;
 Sat, 13 Feb 2021 15:48:49 +0100 (CET)
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
X-Inumbo-ID: 0be3515e-d966-4bb2-aa4a-a8bf189a4583
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: xen-devel@lists.xenproject.org
Cc: Maximilian Engelhardt <maxi@daemonizer.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [RESEND] [XEN PATCH v1 0/1] Use reproducible date in docs
Date: Sat, 13 Feb 2021 15:48:24 +0100
Message-Id: <cover.1613227389.git.maxi@daemonizer.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a resend of my v1 patch from [1] which has not been accepted
yet.

The -d "@..." syntax was introduced in GNU date about 2005, so I assume
a version supporting this syntax is available, if SOURCE_DATE_EPOCH is
defined. If SOURCE_DATE_EPOCH is not defined nothing changes with
respect to the current behavior.

In response to my first submission Jan Beulich mentioned in [2] it would
be good to probe for the availability of the -d "@..." syntax of GNU
date, as Jan couldn't find it when looking at an older documentation of
GNU date. I later found out and reported in [3] that while the syntax
has been implemented in GNU date in about 2005, the documentation has
only been updated in 2011.

I also submitted a v2 version that implemented the suggested probing of
the capabilities of the "date" command in [4]. However Wei Liu responded
a shorter version of the patch would be preferred, so I'm resending v1
now.

I'm fine with v1 or v2, both fix the issue of generating reproducible
documentation. This patch is the last upstream patch needed for get xen
built reproducibly in the next Debian release.

If both patches are not seen as appropriate, please tell me what changes
I should implement.

Thanks,
Maxi

[1] https://lists.xenproject.org/archives/html/xen-devel/2020-12/msg01518.html
[2] https://lists.xenproject.org/archives/html/xen-devel/2020-12/msg01564.html
[3] https://lists.xenproject.org/archives/html/xen-devel/2020-12/msg01698.html
[4] https://lists.xenproject.org/archives/html/xen-devel/2020-12/msg01715.html
[5] https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg00178.html

Maximilian Engelhardt (1):
  docs: set date to SOURCE_DATE_EPOCH if available

 docs/Makefile | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

-- 
2.20.1


