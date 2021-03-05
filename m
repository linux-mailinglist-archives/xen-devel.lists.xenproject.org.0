Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C722932E7B0
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 13:11:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93649.176619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI9Hu-0006sK-Mp; Fri, 05 Mar 2021 12:10:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93649.176619; Fri, 05 Mar 2021 12:10:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI9Hu-0006rv-JP; Fri, 05 Mar 2021 12:10:34 +0000
Received: by outflank-mailman (input) for mailman id 93649;
 Fri, 05 Mar 2021 12:10:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lI9Ht-0006ro-HI
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 12:10:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lI9Ht-0005IS-0Y; Fri, 05 Mar 2021 12:10:33 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lI9Hs-0005Ic-Jw; Fri, 05 Mar 2021 12:10:32 +0000
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
	bh=AkU/ANV9klxVdLN7G3kMf/GAXYSfZF8V6M9T6Dtmmvg=; b=sDlT0iBjxSNh9clhBwQph5ueUl
	tOwpM7MHbN1AOlrMRJ6ifZ17u6OPX8qrpA576AFWwp762E0/5/rZ1RB5Fv8p/YjvpwjpRXOM4p6Kp
	tBJSSipL/3U90eHb+qg9jCq9K12+1knS6fdYgutz+sMhecx3MJ4Wo+yBofobltj5X3Vw=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	iwj@xenproject.org,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH for-4.15] tools/xenstored: liveupdate: Increase the maximum number of parameters
Date: Fri,  5 Mar 2021 12:10:29 +0000
Message-Id: <20210305121029.7047-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

The longest possible command line for LiveUpdate is:

  liveupdate -s -t <timeout> -F

This is 5 parameters. However, the maximum is currently specified to 4.
This means the some of the parameters will get ignored.

Update the field max_pars to 5 so and admin can specify the timeout and
force at the same time.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

This is a candidate for Xen 4.15. Without it, it would not be possible
to pass -F and -t together.

The change is only modifying behavior for XenStored LiveUpdate.
---
 tools/xenstore/xenstored_control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index a1652219b247..8e470f2b2056 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -768,7 +768,7 @@ static struct cmd_s cmds[] = {
 	 */
 	{ "live-update", do_control_lu,
 		"[-c <cmdline>] [-F] [-t <timeout>] <file>\n"
-		"    Default timeout is 60 seconds.", 4 },
+		"    Default timeout is 60 seconds.", 5 },
 #endif
 #ifdef __MINIOS__
 	{ "memreport", do_control_memreport, "" },
-- 
2.17.1


