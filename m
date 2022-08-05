Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4114358A83D
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 10:44:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380893.615321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJsw8-0007C4-IK; Fri, 05 Aug 2022 08:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380893.615321; Fri, 05 Aug 2022 08:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJsw8-00079T-ER; Fri, 05 Aug 2022 08:44:04 +0000
Received: by outflank-mailman (input) for mailman id 380893;
 Fri, 05 Aug 2022 08:44:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gvBN=YJ=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oJsw6-00079N-45
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 08:44:02 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0f271ce-149a-11ed-bd2d-47488cf2e6aa;
 Fri, 05 Aug 2022 10:44:01 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 j4-20020a05600c1c0400b003a4f287418bso969286wms.5
 for <xen-devel@lists.xenproject.org>; Fri, 05 Aug 2022 01:44:01 -0700 (PDT)
Received: from uni.. ([2a02:587:ac1d:6c00:c429:6f10:af3f:7c1d])
 by smtp.googlemail.com with ESMTPSA id
 bd6-20020a05600c1f0600b003a2cf1535aasm4087504wmb.17.2022.08.05.01.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 01:43:59 -0700 (PDT)
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
X-Inumbo-ID: c0f271ce-149a-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=nrVG778qlddv5kWc+Pow6sJfuzXjB6BFzDCgPT4Wf2Y=;
        b=mw7llrkZOb3cFGx1HyvQNzQx4PtveDxJHCszcE59RENXUfXjFVBzcw43Bv0Um9oAyB
         MMoIFDyfV4U1nNgeddZTetmX0GOjdfM8yygbZO8VJek6T3ObSuV9dMu0uWTgb07nEt/V
         /0YvQL8KtCVt6rTGXqifx9XXrSWPXmqrXTfn1VmIGwgv4Hv6kOKnOngt6wDuZVAjRGoM
         8Fo+VJDZe9zst9XB3uYKp/LWhVPYsWNBFtiYRhuwhJlVyrRkR72qAv0gbOBSUOMu8LJy
         MOn6fZejjtfwynBGoSbQURI5xl5VCOV5q9jEFPZp1cEbuyVOhOhDkR9vpm8LEasdNLaJ
         si0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=nrVG778qlddv5kWc+Pow6sJfuzXjB6BFzDCgPT4Wf2Y=;
        b=0caG9FPPbQy9BYvWZu+Q3aaQlnNF7KBJm++K2nkicGRcjUowKXvpeYOam1Oq4kZ6R/
         z4J2Xf8dXOkI2h8m1S86BG4ES1zgfAyhN67EnjIrvVp8iCpHXdFQnSnV/kKlape8Ctw1
         XiPEBdWZ5kYw6Tds8vcysUqdEYcpmeztYynOjXIZOwG6/kMGOViWcEMU0LbDr/vKhV29
         svTbUB/3smfLo6DFF0BwnXWOrW/iui3XDukkrE8zfV704HmoCnSpfPT8Jy2HvZ6d454v
         kqvTRKwW6Z1+jtJ32CRqgqDkiqFSIZdB8/mpFtxtCdGqJklYqCadDRsGAR7xxKwsIJbN
         ndpg==
X-Gm-Message-State: ACgBeo1hLCergfGsnnN5CpW64oZAbGiYOEBKzPqvSUcgrG36PQhfqcpn
	omkNx6he8pRVmkI0KXxwZY2woKncwVk=
X-Google-Smtp-Source: AA6agR7nnazu+foZdktq4/E273LY+sGZ71hATMz4EU2CQlLsanx5yy2NQpsNCpYTU5VUuE3iwQwzUA==
X-Received: by 2002:a1c:7209:0:b0:3a3:1f31:ef3a with SMTP id n9-20020a1c7209000000b003a31f31ef3amr8677361wmc.87.1659689040479;
        Fri, 05 Aug 2022 01:44:00 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/cpu: Fix MISRA C 2012 Rule 20.7 violation
Date: Fri,  5 Aug 2022 11:43:54 +0300
Message-Id: <20220805084354.1847282-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In MASK_DECLARE_1(), the macro parameter 'x' is used as expression and
therefore it is good to be enclosed in parentheses to prevent against
unintended expansions.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/common/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/cpu.c b/xen/common/cpu.c
index b0b63cdb36..31fb5be5d9 100644
--- a/xen/common/cpu.c
+++ b/xen/common/cpu.c
@@ -25,7 +25,7 @@ const cpumask_t cpumask_all = {
  */
 
 /* cpu_bit_bitmap[0] is empty - so we can back into it */
-#define MASK_DECLARE_1(x) [x+1][0] = 1UL << (x)
+#define MASK_DECLARE_1(x) [(x)+1][0] = 1UL << (x)
 #define MASK_DECLARE_2(x) MASK_DECLARE_1(x), MASK_DECLARE_1(x+1)
 #define MASK_DECLARE_4(x) MASK_DECLARE_2(x), MASK_DECLARE_2(x+2)
 #define MASK_DECLARE_8(x) MASK_DECLARE_4(x), MASK_DECLARE_4(x+4)
-- 
2.34.1


