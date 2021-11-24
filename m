Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9124E45C7A4
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 15:39:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230456.398372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mptQJ-0005sd-8W; Wed, 24 Nov 2021 14:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230456.398372; Wed, 24 Nov 2021 14:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mptQJ-0005q2-57; Wed, 24 Nov 2021 14:38:59 +0000
Received: by outflank-mailman (input) for mailman id 230456;
 Wed, 24 Nov 2021 14:38:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mptQH-0005pw-Af
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 14:38:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mptQH-0000Pg-97
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 14:38:57 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mptQH-0003I7-60
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 14:38:57 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mptQ5-0002v9-1m; Wed, 24 Nov 2021 14:38:45 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From;
	bh=yL3nNJ0wENfliK/XlGH4BPoHU6YQulLqCIVl+AZ8Vk0=; b=p6Zb6Z44rbTxz2QhMuF+FogfYr
	T3+f69qEJ4J0T3uXBYMUMWhKSqarF1a+RkGbgNNG771/YghwmXxlbHeh1HrIiqg0QbfDOP/VnJheJ
	nfWn/y6OkBYv6ExOCl00NwAFBk8I8tF8Wpo2Cr4Xup+83wbEP/JqzdyDRgfN5y4WZkTk=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [OSSTEST PATCH] mg-repro-setup: Make ordinary alloc: work again
Date: Wed, 24 Nov 2021 14:38:33 +0000
Message-Id: <20211124143833.23480-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In e7febe5f6edc, we hosted an error earlier in the script.  But in the
old location, OSSTEST_TASK would always be set if statictask was.  In
the new one, that hasn't been done yet.

No release implications since it touches a by-hand utility only.

Fixes: e7febe5f6edc "mg-repro-setup: Promote an error test to before builds (nfc)"
CC: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
---
 mg-repro-setup | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mg-repro-setup b/mg-repro-setup
index 895f29963..b00e182f3 100755
--- a/mg-repro-setup
+++ b/mg-repro-setup
@@ -254,7 +254,7 @@ while [ $# -ne 0 ]; do
 done
 
 if [ "${alloc_idents[*]}" ]; then
-        if [ x"$OSSTEST_TASK" = x ]; then
+        if [ x"$OSSTEST_TASK" = x ] && ! $statictask; then
                 # We would have to make a dynamic task and hold the
                 #  fd for it in this script.  Would be quite awkward.
                 echo >&2 'cannot hand-allocate in a way that will free'
-- 
2.20.1


