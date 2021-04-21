Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50816366D82
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:03:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114523.218266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDRV-0006P0-Or; Wed, 21 Apr 2021 14:03:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114523.218266; Wed, 21 Apr 2021 14:03:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDRV-0006Oe-La; Wed, 21 Apr 2021 14:03:01 +0000
Received: by outflank-mailman (input) for mailman id 114523;
 Wed, 21 Apr 2021 14:02:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lZDRT-0006OZ-NS
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:02:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZDRS-0000k4-Bz; Wed, 21 Apr 2021 14:02:58 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZDRR-00038h-W3; Wed, 21 Apr 2021 14:02:58 +0000
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
	bh=zycCPYwQEgxyGHJsgz1zrCejyYIMfuUu6Nb5wZjZeBw=; b=YL6QfigyQynC76r11KgRz0tNVc
	FgCOqWL2dVm2jeT8b04Lwb0zveLDZz9Qev21PxZF0oJvsxSPJjLGlIDlEyJmumg3TpAijcoSFfxp7
	Ucpabr57WwUY2nl764ButoLQjhkiEisB9BMuzS24cS3v2skZ4IrvCLra++/qlh3Jg40E=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/xenstored: Wire properly the command line option -M/--path-max
Date: Wed, 21 Apr 2021 15:02:55 +0100
Message-Id: <20210421140255.23437-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

The command line option -M/--path-max was meant to be added by
commit 924bf8c793cb "tools/xenstore: rework path length check" but this
wasn't wired through properly.

Fix it by adding the missing "case 'M':".

Fixes: 924bf8c793cb ("tools/xenstore: rework path length check")
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 591b28e4552f..c638e46221eb 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2148,6 +2148,7 @@ int main(int argc, char *argv[])
 		case 'A':
 			quota_nb_perms_per_node = strtol(optarg, NULL, 10);
 			break;
+		case 'M':
 			quota_max_path_len = strtol(optarg, NULL, 10);
 			quota_max_path_len = min(XENSTORE_REL_PATH_MAX,
 						 quota_max_path_len);
-- 
2.17.1


