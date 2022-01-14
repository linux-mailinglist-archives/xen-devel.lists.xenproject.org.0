Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CFD48EF02
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jan 2022 18:08:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257665.442904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8Q3C-0005us-3J; Fri, 14 Jan 2022 17:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257665.442904; Fri, 14 Jan 2022 17:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8Q3B-0005re-Vs; Fri, 14 Jan 2022 17:07:41 +0000
Received: by outflank-mailman (input) for mailman id 257665;
 Fri, 14 Jan 2022 17:07:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FcrT=R6=gmail.com=rosbrookn@srs-se1.protection.inumbo.net>)
 id 1n8Q3A-0005rY-Tt
 for xen-devel@lists.xenproject.org; Fri, 14 Jan 2022 17:07:40 +0000
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [2607:f8b0:4864:20::833])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79cfc7cb-755c-11ec-9bbc-9dff3e4ee8c5;
 Fri, 14 Jan 2022 18:07:39 +0100 (CET)
Received: by mail-qt1-x833.google.com with SMTP id y10so11348120qtw.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jan 2022 09:07:38 -0800 (PST)
Received: from localhost.localdomain (c-73-89-138-5.hsd1.vt.comcast.net.
 [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id i28sm3520556qkl.64.2022.01.14.09.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 09:07:36 -0800 (PST)
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
X-Inumbo-ID: 79cfc7cb-755c-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hG1heKFwl0hdiTbpdFKU4PWIaIJt6NPGdq894MAhenU=;
        b=APMTK0i5fRtQFz4FCIu+bTbJsaH0Qw3hG3fCmGWhIE/bkcLIUP3kdfcLHYDifkJuAH
         GaagUnkbK4UEPnHqR3KTuFGIjKVgChdjlyh05AqLn0RRC4M+MpN+FsEnkHGoq24yYrx4
         6SjHwkws1FCQX2oJRCOmjwnnO8V/GLVXfFn/H0nesWkuwlVd7GI3CZMMPHm+GXRQDQHN
         cDZFshh16/C/Sj1iZOtbAS7CcAeRFzQolFTy3SqD7lkypXWPOur8uMNgAXsrCe08JOt8
         Lp6aJc0/Vmu+dAM9tHJI0+bIHGAOpr3uCiwWODGIClyOMU1bBe45H6ojccmw+RJt7KAP
         /BQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hG1heKFwl0hdiTbpdFKU4PWIaIJt6NPGdq894MAhenU=;
        b=GRP8pJYdESJpqOzpOAxD4iMT5csgXawtTsmTCJZCxJK/lpyf8vI60xFi4VGqQDQMUP
         HhUNsLKJ0lrEI1v9Qz298vUQTb91Xu/n67X1aRr4a8o9J53koNNDczLZRz/JHW97XMMT
         lAngImkFyzLuArCHZwluYlXGg0rY50rZgeld0DRIGOC+Z+l5WGxqRnHgFeLbZaaFCp/I
         yCFMVKKnXtNrlj4MrRGePADA1MP6T9PXwBN+PdmgCpLQRoLc/9KDNvaQJLOjLP+t3nRV
         B1KfsFZdN5K9WZkcSIX0ym7Ym9BfNev3WfYGBC9Y+Dl7Fnww5oA/eEJ/J+0NBaY0D6oo
         CLVw==
X-Gm-Message-State: AOAM531eMTc7Yw8e7Z8ZpCi/nBV6qnkM0MokpBUqaZ2CaDIF+nhm+ell
	BwOalyqojA6dGr1Ugyn9LOLPtoJGbjY=
X-Google-Smtp-Source: ABdhPJzKHJ2PEDwovoQEWGv+ik1/UoFLLFT46O7Xamflwav4W+YIm6RxVqM8aYEElRo7gwpDJHa6oA==
X-Received: by 2002:ac8:5b96:: with SMTP id a22mr1803946qta.675.1642180057518;
        Fri, 14 Jan 2022 09:07:37 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] MAINTAINERS: update my email address
Date: Fri, 14 Jan 2022 12:07:33 -0500
Message-Id: <20220114170733.55750-1-rosbrookn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I am no longer an employee at AIS. Use my personal email address
instead.

Signed-off-by: Nick Rosbrook <rosbrookn@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4a2884dfa7..feea7d14cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -302,7 +302,7 @@ F:	tools/debugger/gdbsx/
 
 GOLANG BINDINGS
 M:	George Dunlap <george.dunlap@citrix.com>
-M:     Nick Rosbrook <rosbrookn@ainfosec.com>
+M:	Nick Rosbrook <rosbrookn@gmail.com>
 S:	Maintained
 F:	tools/golang
 
-- 
2.25.1


