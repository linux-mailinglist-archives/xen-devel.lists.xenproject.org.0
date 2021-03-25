Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A333490F7
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 12:43:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101382.193879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPOO8-0007Au-7M; Thu, 25 Mar 2021 11:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101382.193879; Thu, 25 Mar 2021 11:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPOO8-0007AV-4A; Thu, 25 Mar 2021 11:42:56 +0000
Received: by outflank-mailman (input) for mailman id 101382;
 Thu, 25 Mar 2021 11:42:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lPOO6-0007AQ-6M
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 11:42:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lPOO4-0002q2-M4; Thu, 25 Mar 2021 11:42:52 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lPOO4-0004ON-9g; Thu, 25 Mar 2021 11:42:52 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=z+vsNgBK9l3wShAjdTSgrGCHBKpK3MehG+GnO8o0ivQ=; b=VH97DEXvG39dtg/08DSDIWwqaN
	TDg2wdbTEJq+F2YPGeCMjlhno6xwIB3PQuOLXKLsq0jVZFXJHc1KRZFtVmwocAHwKWRPNf78n1H2W
	2YPBgcYgJmeqOX6j5C7n4Ak2BeUyilKWMPQXCeqO0Ya5Sv2nKvqKYQFOjwn1pfVkIgw8=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/xenstored: Remove unnecessary define XC_WANT_COMPAT_MAP_FOREIGN_API
Date: Thu, 25 Mar 2021 11:42:43 +0000
Message-Id: <20210325114243.12284-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

The last use of the compat foreign API was dropped in commit
38eeb3864de4 "tools/xenstored: Drop mapping of the ring via foreign
map".

Therefore, we don't need to define XC_WANT_COMPAT_MAP_FOREIGN_API.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_core.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 0c9a0961b57e..1cdbc3dcb5f7 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -19,7 +19,6 @@
 #ifndef _XENSTORED_CORE_H
 #define _XENSTORED_CORE_H
 
-#define XC_WANT_COMPAT_MAP_FOREIGN_API
 #include <xenctrl.h>
 #include <xengnttab.h>
 
-- 
2.17.1


