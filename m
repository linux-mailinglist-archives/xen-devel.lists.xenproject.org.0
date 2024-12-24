Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5399FC19D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2024 20:17:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863127.1274610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQAO3-0000fb-DI; Tue, 24 Dec 2024 19:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863127.1274610; Tue, 24 Dec 2024 19:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQAO3-0000dK-9s; Tue, 24 Dec 2024 19:16:11 +0000
Received: by outflank-mailman (input) for mailman id 863127;
 Tue, 24 Dec 2024 19:16:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XM6K=TR=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tQAO2-00005t-1W
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2024 19:16:10 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 880b1e13-c22b-11ef-a0da-8be0dac302b0;
 Tue, 24 Dec 2024 20:16:09 +0100 (CET)
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
 by drago1i.eurecom.fr with ESMTP; 24 Dec 2024 20:16:09 +0100
Received: from ntu.. (88-183-119-157.subs.proxad.net [88.183.119.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtps.eurecom.fr (Postfix) with ESMTPSA id 0BBDB2BC0;
 Tue, 24 Dec 2024 20:16:09 +0100 (CET)
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
X-Inumbo-ID: 880b1e13-c22b-11ef-a0da-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1735067769; x=1766603769;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p+XiT9wY1Ed3nislo24Z9ZFwlemo29xWJsjCkC72kpA=;
  b=WPUPx60prGHuBpP4//Vb2yeca9QdNeAhuNB//WefRft35P4Nmn7ZZcoc
   Mgn/2ttvia9ngE+CuLH7JFwA7XSmvkN/lHOppkVxyV59LedfJ/tS0vCNq
   NmL/uNFhXC87n6SRmaG0eJ9rE9Vbsan8VWL7K1nUM49c3ik/ZY/SfQX+i
   E=;
X-CSE-ConnectionGUID: W6qU7jSvSXCB1dz6r37o6A==
X-CSE-MsgGUID: bpSynhVWStGaiOLyAugljg==
X-IronPort-AV: E=Sophos;i="6.12,261,1728943200"; 
   d="scan'208";a="28314862"
From: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>,
	Doug Goldstein <cardoe@cardoe.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 2/2] xen/tools: remove dead code
Date: Tue, 24 Dec 2024 20:13:55 +0100
Message-ID: <20241224191529.138119-3-Ariel.Otilibili-Anieli@eurecom.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241224191529.138119-1-Ariel.Otilibili-Anieli@eurecom.fr>
References: <20241220165837.937976-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241224191529.138119-1-Ariel.Otilibili-Anieli@eurecom.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original file was imported from Linux; patched the entire
expr_compare_type() with the diff from Linux.

Commits wherein it might have been fixed in Linux:
- dfe8e56fc604 ("kconfig: add fallthrough comments to expr_compare_type()")
- 9ad86d747c46 ("kconfig: remove unreachable printf()").

```
$ diff -u xen/xen/tools/kconfig/expr.c linux/scripts/kconfig/expr.c | \
    sed -ne '/expr_compare_type/,/return 0/{N;p}'

 static int expr_compare_type(enum expr_type t1, enum expr_type t2)
 {
        if (t1 == t2)
@@ -1106,30 +999,27 @@
        case E_GTH:
                if (t2 == E_EQUAL || t2 == E_UNEQUAL)
                        return 1;
+               /* fallthrough */
        case E_EQUAL:
        case E_UNEQUAL:
                if (t2 == E_NOT)
                        return 1;
+               /* fallthrough */
        case E_NOT:
                if (t2 == E_AND)
                        return 1;
+               /* fallthrough */
        case E_AND:
                if (t2 == E_OR)
                        return 1;
-       case E_OR:
-               if (t2 == E_LIST)
-                       return 1;
-       case E_LIST:
-               if (t2 == 0)
-                       return 1;
+               /* fallthrough */
        default:
-               return -1;
+               break;
        }
-       printf("[%dgt%d?]", t1, t2);
        return 0;
 }

$ cd linux/;
$ git log --oneline -1 --pretty='%h ("%s")'
8155b4ef3466 ("Add linux-next specific files for 20241220")

$ git remote -v
next    git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git (fetch)
next    git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git (push)

$ cd ../xen/
$ git log --oneline -1 --pretty='%h ("%s")'
6419020270 ("CHANGELOG: Mention LLC coloring feature on Arm")

$ git remote -v
up      git://xenbits.xen.org/xen.git (fetch)
up      git://xenbits.xen.org/xen.git (push)
```

Coverity-ID: 1458052
Fixes: 8c271b7584 ("build: import Kbuild/Kconfig from Linux 4.3")
Cc: Doug Goldstein <cardoe@cardoe.com>
Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
---
 xen/tools/kconfig/expr.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/xen/tools/kconfig/expr.c b/xen/tools/kconfig/expr.c
index 77ffff3a05..84af124626 100644
--- a/xen/tools/kconfig/expr.c
+++ b/xen/tools/kconfig/expr.c
@@ -1106,26 +1106,23 @@ static int expr_compare_type(enum expr_type t1, enum expr_type t2)
 	case E_GTH:
 		if (t2 == E_EQUAL || t2 == E_UNEQUAL)
 			return 1;
+		/* fallthrough */
 	case E_EQUAL:
 	case E_UNEQUAL:
 		if (t2 == E_NOT)
 			return 1;
+		/* fallthrough */
 	case E_NOT:
 		if (t2 == E_AND)
 			return 1;
+		/* fallthrough */
 	case E_AND:
 		if (t2 == E_OR)
 			return 1;
-	case E_OR:
-		if (t2 == E_LIST)
-			return 1;
-	case E_LIST:
-		if (t2 == 0)
-			return 1;
+		/* fallthrough */
 	default:
-		return -1;
+		break;
 	}
-	printf("[%dgt%d?]", t1, t2);
 	return 0;
 }
 
-- 
2.43.0


