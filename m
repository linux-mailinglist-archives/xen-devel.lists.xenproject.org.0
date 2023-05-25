Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D80711675
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 21:07:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539820.841069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2GI3-0007VG-8d; Thu, 25 May 2023 19:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539820.841069; Thu, 25 May 2023 19:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2GI3-0007SX-4e; Thu, 25 May 2023 19:06:23 +0000
Received: by outflank-mailman (input) for mailman id 539820;
 Thu, 25 May 2023 19:06:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qmlc=BO=rabbit.lu=slack@srs-se1.protection.inumbo.net>)
 id 1q2GI1-0007SR-5s
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 19:06:21 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b0a44ba-fb2f-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 21:06:19 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-30a1fdde3d6so2445840f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 May 2023 12:06:19 -0700 (PDT)
Received: from localhost.localdomain (82-64-138-184.subs.proxad.net.
 [82.64.138.184]) by smtp.googlemail.com with ESMTPSA id
 e2-20020adffc42000000b002ff2c39d072sm2624203wrs.104.2023.05.25.12.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 12:06:18 -0700 (PDT)
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
X-Inumbo-ID: 3b0a44ba-fb2f-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rabbit-lu.20221208.gappssmtp.com; s=20221208; t=1685041579; x=1687633579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CVMTxMc7NLMK+GzBqb2fW25lHCbqVo5E3F7PbRyMJ0E=;
        b=E1x+B8OwDE+9ZOZsnPE8s3ImkRyxNSZx5za53rzkgxyEgIe6XIHXCc9xMSMKtjKLwV
         On3/EPpMvHELvZe+D/yj3fMKWETXFslpKsf+7tyEaUV9S+8ijKKOGvl+i7LUmpb6J5mX
         j7wD/YNPe9K2f8a1EdpCcMglpZTQLnfgAd3Tv7gdav0ETw+KhRH2s1lS3x5CZG4EhwH0
         hq6ay0dO9RtWVHZXWqZzO4SCg56fwLCap3TlE9aJ7swqQ0in0i5CZenbQMEcNzXoc37Q
         TZaJj0kEWN5e1TilFvxD4LGarBOprPxWPFDBYg/eha5qLRbdPR+Dn+pP2UtZePUJ1EHZ
         5bbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685041579; x=1687633579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CVMTxMc7NLMK+GzBqb2fW25lHCbqVo5E3F7PbRyMJ0E=;
        b=hz0wYzqU9oECZ1O3vmp2Us+VwR1QgrwnA0Ms1x/CPMZGNYNwtpEAJaz123DLs1Yvwo
         22uaxXJGNQuTiClwBSe/54ETEEWZn1dpXJfn2asZodn1wqT7BbGV94LyU5BSlVWd5DDg
         h1xSOk3I+Jmkr+pKzRCp4hwhOiRPF8y0KZkVD2dbu9IAykyg1dP+ZregPwftoZAfFGt0
         HHqve17ezOT24BVQ27ol2YM/jw/WjOeAZdqMRr+URCmBcmSEQFkueHhkig5TGH2JYwqD
         5o46kImfr/7BMKf1ocKBE6Afkf53EP1w/BvpAr+YFPqcS9UVFbJoMtH7pn++Ye+JLY+j
         xRTA==
X-Gm-Message-State: AC+VfDwDEmh7SkHCrGvZ/FN7QdaW+BWGwJONvoJVa+sX68O+udfARU4Q
	ZD3RePbOEQwfJH2VgFjlnz4E0ZH7HBjKfkpPKgJh76mW
X-Google-Smtp-Source: ACHHUZ5Kj/eKkrWE7kUTwbV8I9sL80o2vyGOfJTc3zMd7PAaSVBeTLLPOTty5menZwj75qxZCQCb6g==
X-Received: by 2002:adf:e843:0:b0:2f1:e162:d48 with SMTP id d3-20020adfe843000000b002f1e1620d48mr3102266wrn.47.1685041578697;
        Thu, 25 May 2023 12:06:18 -0700 (PDT)
From: =?UTF-8?q?Cyril=20R=C3=A9bert?= <slack@rabbit.lu>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Cyril=20R=C3=A9bert?= <slack@rabbit.lu>,
	Yann Dirson <yann.dirson@vates.fr>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [XEN PATCH] tools/xenstore: remove deprecated parameter from xenstore commands help
Date: Thu, 25 May 2023 21:06:04 +0200
Message-Id: <47cbac6bcf8f454b47bc6430c101f064a5623261.1685041564.git.slack@rabbit.lu>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Completing commit c65687e ("tools/xenstore: remove socket-only option from xenstore client").
As the socket-only option (-s) has been removed from the Xenstore access commands (xenstore-*),
also remove the parameter from the commands help (xenstore-* -h).

Suggested-by: Yann Dirson <yann.dirson@vates.fr>
Signed-off-by: Cyril Rébert <slack@rabbit.lu>
---
 tools/xenstore/xenstore_client.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/xenstore/xenstore_client.c b/tools/xenstore/xenstore_client.c
index 0628ba275e..de788b3e0a 100644
--- a/tools/xenstore/xenstore_client.c
+++ b/tools/xenstore/xenstore_client.c
@@ -94,25 +94,25 @@ usage(enum mode mode, int incl_mode, const char *progname)
 	errx(1, "Usage: %s <mode> [-h] [...]", progname);
     case MODE_read:
 	mstr = incl_mode ? "read " : "";
-	errx(1, "Usage: %s %s[-h] [-p] [-s] [-R] key [...]", progname, mstr);
+	errx(1, "Usage: %s %s[-h] [-p] [-R] key [...]", progname, mstr);
     case MODE_write:
 	mstr = incl_mode ? "write " : "";
-	errx(1, "Usage: %s %s[-h] [-s] [-R] key value [...]", progname, mstr);
+	errx(1, "Usage: %s %s[-h] [-R] key value [...]", progname, mstr);
     case MODE_rm:
 	mstr = incl_mode ? "rm " : "";
-	errx(1, "Usage: %s %s[-h] [-s] [-t] key [...]", progname, mstr);
+	errx(1, "Usage: %s %s[-h] [-t] key [...]", progname, mstr);
     case MODE_exists:
 	mstr = incl_mode ? "exists " : "";
 	/* fallthrough */
     case MODE_list:
 	mstr = mstr ? : incl_mode ? "list " : "";
-	errx(1, "Usage: %s %s[-h] [-p] [-s] key [...]", progname, mstr);
+	errx(1, "Usage: %s %s[-h] [-p] key [...]", progname, mstr);
     case MODE_ls:
 	mstr = mstr ? : incl_mode ? "ls " : "";
-	errx(1, "Usage: %s %s[-h] [-f] [-p] [-s] [path]", progname, mstr);
+	errx(1, "Usage: %s %s[-h] [-f] [-p] [path]", progname, mstr);
     case MODE_chmod:
 	mstr = incl_mode ? "chmod " : "";
-	errx(1, "Usage: %s %s[-h] [-u] [-r] [-s] key <mode [modes...]>", progname, mstr);
+	errx(1, "Usage: %s %s[-h] [-u] [-r] key <mode [modes...]>", progname, mstr);
     case MODE_watch:
 	mstr = incl_mode ? "watch " : "";
 	errx(1, "Usage: %s %s[-h] [-n NR] key", progname, mstr);
-- 
2.30.2


