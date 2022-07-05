Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEA1567926
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 23:03:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361536.591107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8pgh-000480-MX; Tue, 05 Jul 2022 21:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361536.591107; Tue, 05 Jul 2022 21:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8pgh-000468-Iu; Tue, 05 Jul 2022 21:02:27 +0000
Received: by outflank-mailman (input) for mailman id 361536;
 Tue, 05 Jul 2022 21:02:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TLZa=XK=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o8pgf-0003lq-Ul
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 21:02:25 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c524462e-fca5-11ec-924f-1f966e50362f;
 Tue, 05 Jul 2022 23:02:25 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id s1so19237088wra.9
 for <xen-devel@lists.xenproject.org>; Tue, 05 Jul 2022 14:02:25 -0700 (PDT)
Received: from uni.. (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.googlemail.com with ESMTPSA id
 l26-20020a1ced1a000000b003a03ae64f57sm2897401wmh.8.2022.07.05.14.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 14:02:24 -0700 (PDT)
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
X-Inumbo-ID: c524462e-fca5-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2dN0B8zmPwKiHY8p7Il+e7JbeI1aQAoit1LVTiMKcLU=;
        b=qTK4Va1hmn9ohnH4FMyIgYbT7056l29OKtk+X4/QlVnhHjUkDqKah6paQRdHzk01hu
         0Dvb7Dq05GxhI/Hrr1HdpWnI1MhLWUgG42yWxUdsr0/+g6HZT3YoBccC0SuptxpvMVlr
         WGqsAyNkzARye3oH/Pky/YiP2pLn1szcYcVOqg5IhjVLdq1U2RF9fbi6YXjboCRJplGK
         l9SVDrufSnsBflrB8ksbZ4uDi1edSIaIx4cE2LHwuw+3zz+3S3sh4Mgjk8gKDWUNTk/Y
         B6NsnS82u/GJEa3k2d+3zVWf1ACtq0pgwn24GddnKUZ6QkEgV4TBIDqVnLcTGkMCh0IU
         Peew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2dN0B8zmPwKiHY8p7Il+e7JbeI1aQAoit1LVTiMKcLU=;
        b=3FMh+dlUbliDnRfkWJQe2kSpU1EVDh0PO3HJOAWFn65A3WkUEa8MThZLvSzq+LjbZQ
         N71HT67EWa0eHNucMxUQNUEYgxI0JTPqLLAH4EmxZvFaaI1dBOz5nNlv+UQf3AnRJWZl
         FQC8Rsh5wwHtDynJMF+CFmN8+mhyjxTo8xuUuzjNJSaRyvV7cbGYhFbyA1oD6vE5BFUK
         3b+obclT6HRZjf1uWNcLpT2Fh1bVWSFTJocnJOMvCup2cutL/a8T+30aEiFsrX9gSH1h
         gpUwdcMBXvGFMfnSssJP7El1iyQlmhI/E3bPKzP6pXn6WRtSRV6Quf6OzTzBmgN8nkBp
         uWng==
X-Gm-Message-State: AJIora/wf4+cjAKbeW6txiUOdskmj7hGu2viTZJQNb+vxlSY2gyn4lG4
	ObOGEIQsBjoGi3Shrf/2enaCp9hyYnw=
X-Google-Smtp-Source: AGRyM1sP9RfOibNcXJdbvksizclgfrXbx73MiR//wCf/Pc9eWTz6chQXRh308WzUU+ea4PDMr+g9pg==
X-Received: by 2002:a5d:5908:0:b0:21d:6e91:9f3 with SMTP id v8-20020a5d5908000000b0021d6e9109f3mr7917149wrd.52.1657054944466;
        Tue, 05 Jul 2022 14:02:24 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/4] xen/common: time: Fix MISRA C 2012 Rule 8.7 violation
Date: Wed,  6 Jul 2022 00:02:16 +0300
Message-Id: <20220705210218.483854-3-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220705210218.483854-1-burzalodowa@gmail.com>
References: <20220705210218.483854-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable __mon_lengths is referenced only in time.c.
Change its linkage from external to internal by adding the storage-class
specifier static to its definitions.

Also, this patch resolves indirectly a MISRA C 2012 Rule 8.4 violation warning.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/common/time.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/time.c b/xen/common/time.c
index 22379f4ae2..92f7b72464 100644
--- a/xen/common/time.c
+++ b/xen/common/time.c
@@ -28,7 +28,7 @@
   ((year) % 4 == 0 && ((year) % 100 != 0 || (year) % 400 == 0))
 
 /* How many days are in each month.  */
-const unsigned short int __mon_lengths[2][12] = {
+static const unsigned short int __mon_lengths[2][12] = {
     /* Normal years.  */
     {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31},
     /* Leap years.  */
-- 
2.34.1


