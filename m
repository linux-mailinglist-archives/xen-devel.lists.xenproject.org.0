Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0E8589BB2
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 14:29:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380297.614398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJZyU-0004by-AI; Thu, 04 Aug 2022 12:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380297.614398; Thu, 04 Aug 2022 12:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJZyU-0004a1-6a; Thu, 04 Aug 2022 12:29:14 +0000
Received: by outflank-mailman (input) for mailman id 380297;
 Thu, 04 Aug 2022 12:29:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x682=YI=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oJZyS-0004Zt-H1
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 12:29:12 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b437b90-13f1-11ed-924f-1f966e50362f;
 Thu, 04 Aug 2022 14:29:11 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id v5so10229862wmj.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Aug 2022 05:29:11 -0700 (PDT)
Received: from uni.. ([2a02:587:ac1d:6c00:8556:d1ea:dcb6:c7a1])
 by smtp.googlemail.com with ESMTPSA id
 n11-20020a5d660b000000b0021f13097d6csm1039829wru.16.2022.08.04.05.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 05:29:10 -0700 (PDT)
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
X-Inumbo-ID: 0b437b90-13f1-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=HePqTUzyk9/b4igAC6lHec/l8gyqdbLONAp25vjDuio=;
        b=E/3lrULZJ5AKCVGfhnqtOBV6gfyibXO8zLwWkSCifpl9JkfU2Djxn0Op8GGH962w1I
         AW3FwboZWfGhqqJZiguvfeqBzsUBVy7OH8JSJL3olaeENp1LIoFK8G51uA2rX70kp9nS
         PDS6IZlDkK3Z/T5PTufsFhJQo6/jsI8n5hG2AO/K+GcCIVbkYbrumDUalNWGlGGMzMzm
         NuuA99Q4dyrIddl6wvUmwxHfoGBrCNDoaMv0i23tPGxgbHAX0FEKHJptWNLrvlcFU3fc
         JKHwugLyZad0tGEIimYqIRH5COzUSB6S2ZIkwqhOKOIgC/dVI9tsCk8cP0J2ymM54/eN
         aHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=HePqTUzyk9/b4igAC6lHec/l8gyqdbLONAp25vjDuio=;
        b=Seh/EyqZihl9u7ICVctFf7IdmmWLFol9J8HrXUqJMCrTDhBigVHtGk6JJZQH/ng28a
         Hn25IyxZcwD3B8g8xgVboqs3c15Oa6fgFQVq68cPxhKkYZ5OvYL+15YdXMAiuDtQXYHY
         dftJiGlck1L2YZTr7KJXZjQQllqck7sAD6blkHuGBRz6kgIWHdAB7gMiYF7ut7CM3B46
         giv/L/2pzzoLNyoDDJ64uH/zGzQnL/lacQF1cyJegU8JmgCoj5h0EWHYEJP05Ckbo21z
         D6wJFdWWAKwhuAALFBkHf+g+yjCcucLFaMjyayVj/W3l5LzAG8EvBwpeGTXWNFz3A6Pt
         mhWA==
X-Gm-Message-State: ACgBeo0axIpGskxQxAltb9BmQOGQjVoEbJh0/4VTGro747/pB1OOsDvu
	ljU3ctodLyRkGixM0vzQigsyqqxY/2s=
X-Google-Smtp-Source: AA6agR4sLjOdzR9fkgwEBrQv8pv8XGkU33ANqzACiDWZxf85jY8dNrJ+UkBeJxx0hmAuAbOhBhQimg==
X-Received: by 2002:a05:600c:a45:b0:3a4:d07e:112d with SMTP id c5-20020a05600c0a4500b003a4d07e112dmr1281750wmq.141.1659616151004;
        Thu, 04 Aug 2022 05:29:11 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/compiler: Fix MISRA C 2012 Rule 20.7 violation
Date: Thu,  4 Aug 2022 15:29:07 +0300
Message-Id: <20220804122907.1821730-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In __must_be_array(), the macro parameter 'a' is used as expression and
therefore it is good to be enclosed in parentheses to prevent against
unintended expansions.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/include/xen/compiler.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index 933aec09a9..a563130334 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -123,7 +123,7 @@
 
 /* &a[0] degrades to a pointer: a different type from an array */
 #define __must_be_array(a) \
-  BUILD_BUG_ON_ZERO(__builtin_types_compatible_p(typeof(a), typeof(&a[0])))
+  BUILD_BUG_ON_ZERO(__builtin_types_compatible_p(typeof(a), typeof(&(a)[0])))
 
 #ifdef CONFIG_CC_HAS_VISIBILITY_ATTRIBUTE
 /* Results in more efficient PIC code (no indirections through GOT or PLT). */
-- 
2.34.1


