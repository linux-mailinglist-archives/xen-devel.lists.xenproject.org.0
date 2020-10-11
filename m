Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E8F28AB19
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 01:32:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5742.14899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRkoU-0002NT-3L; Sun, 11 Oct 2020 23:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5742.14899; Sun, 11 Oct 2020 23:31:38 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRkoT-0002N2-Vz; Sun, 11 Oct 2020 23:31:37 +0000
Received: by outflank-mailman (input) for mailman id 5742;
 Sun, 11 Oct 2020 23:31:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0GLi=DS=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1kRkoS-0002Lo-F7
 for xen-devel@lists.xenproject.org; Sun, 11 Oct 2020 23:31:36 +0000
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2ba78f8-565f-4991-b089-5e2dcd0adf6c;
 Sun, 11 Oct 2020 23:31:32 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id c23so12468674qtp.0
 for <xen-devel@lists.xenproject.org>; Sun, 11 Oct 2020 16:31:32 -0700 (PDT)
Received: from six.home (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id
 j88sm11321663qte.96.2020.10.11.16.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 16:31:30 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0GLi=DS=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
	id 1kRkoS-0002Lo-F7
	for xen-devel@lists.xenproject.org; Sun, 11 Oct 2020 23:31:36 +0000
X-Inumbo-ID: b2ba78f8-565f-4991-b089-5e2dcd0adf6c
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b2ba78f8-565f-4991-b089-5e2dcd0adf6c;
	Sun, 11 Oct 2020 23:31:32 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id c23so12468674qtp.0
        for <xen-devel@lists.xenproject.org>; Sun, 11 Oct 2020 16:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=9vyBvmU6s28EMBTFGVMlypGGZgndJL2zkc8914Z6eIg=;
        b=OZp2ylPMg5oq9jIFwDPPskU2kCUhf+CSNX5I7d20KPIlT0rQEJjo1/D7ahdz5g9oTg
         Y/MH+1HoEWiihnm7DnKnPqKFeuApl9qQ/qyRFo3Z1k3mJOcka3NYYaO59hyYXvMm5g9P
         Y2IWFhz0j4/ymzATH+o0C8/7+1XIOGXaWYVZj4pFfv9S/MYxLMz5x0vDP1uL6hcy3fbY
         hIhqtmMrHewxkcHEhGAEbEfdRMDa9CGBYDokT9wLo4SSFIYZN7qPHIKbFtFrSQ3nYvbj
         PZArnunik4Yz3Rgbu8JN4X1ITxb2it5nT40KfXTj3HWwtD9Hn+ECemvdOYcOp/GUyqnx
         314w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=9vyBvmU6s28EMBTFGVMlypGGZgndJL2zkc8914Z6eIg=;
        b=mk6BFBsj7N1DL6YiBc1gIjSgZJbLT2BL2u3jGC0i27gTXgopMCkheT3aFwPBw3nRIl
         kLGtPgKMuOHAr5qVMj1olYPfLVSLHgHbG1wt6XwngNNIkPmVGNE1rPRfEn5V1MnmLt6e
         dc4SFioZaqwmGV1hBTki4iwAbOk/QDMATAPYGGeQCCphwVyRi5X1CDB+vpLjMPr+DIO2
         UIMRNTt/Q75HZsLzctTqw78RSj51940wikFWLSH4yKVh/XOnvFTFBIa7Z0peV+0pCDIG
         ekVJTT85bn1+bRyUGX+s6NkIX3FX/oE2WwyBp7COtX2HGlKLcD5HRMovM9twdIE6T2QD
         36aw==
X-Gm-Message-State: AOAM5308Ye8cRWUtboiwC3UELoTSBnYHD5r7sN1kGSSnateX7vIHpbn2
	whU4LhxXKeqlpLOWR4Ks9rlWjz5h+LI=
X-Google-Smtp-Source: ABdhPJzlhws5PGusVnBacW74kDIwu7qmamBSo/l1QQaXh2Cj6Bq6Riy0FDdXDTHmh52A1aNe13s3fg==
X-Received: by 2002:ac8:5185:: with SMTP id c5mr7860279qtn.349.1602459091271;
        Sun, 11 Oct 2020 16:31:31 -0700 (PDT)
Received: from six.home (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
        by smtp.gmail.com with ESMTPSA id j88sm11321663qte.96.2020.10.11.16.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 16:31:30 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] golang/xenlight: standardize generated code comment
Date: Sun, 11 Oct 2020 19:31:25 -0400
Message-Id: <d8615f72d205b8a818ea397ccbb86f6ade1cd158.1602458773.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <8e66cd2d53bb9f14bdfa0a2539773f3a6a3526b6.1602458773.git.rosbrookn@ainfosec.com>
References: <8e66cd2d53bb9f14bdfa0a2539773f3a6a3526b6.1602458773.git.rosbrookn@ainfosec.com>
In-Reply-To: <8e66cd2d53bb9f14bdfa0a2539773f3a6a3526b6.1602458773.git.rosbrookn@ainfosec.com>
References: <8e66cd2d53bb9f14bdfa0a2539773f3a6a3526b6.1602458773.git.rosbrookn@ainfosec.com>

There is a standard format for generated Go code header comments, as set
by [1]. Modify gengotypes.py to follow this standard, and use the
additional

  // source: <IDL file basename>

convention used by protoc-gen-go.

This change is motivated by the fact that since 41aea82de2, the comment
would include the absolute path to libxl_types.idl, therefore creating
unintended diffs when generating code across different machines. This
approach fixes that problem.

[1] https://github.com/golang/go/issues/13560

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/gengotypes.py  | 10 ++++------
 tools/golang/xenlight/helpers.gen.go |  7 ++-----
 tools/golang/xenlight/types.gen.go   |  7 ++-----
 3 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/tools/golang/xenlight/gengotypes.py b/tools/golang/xenlight/gengotypes.py
index 4ac181ae47..3e40c3d5dc 100644
--- a/tools/golang/xenlight/gengotypes.py
+++ b/tools/golang/xenlight/gengotypes.py
@@ -731,13 +731,11 @@ if __name__ == '__main__':
         name = b.typename
         builtin_type_names[name] = xenlight_golang_fmt_name(name)
 
-    header_comment="""// DO NOT EDIT.
-//
-// This file is generated by:
-// {0}
-//
+    header_comment="""// Code generated by {}. DO NOT EDIT.
+// source: {}
 
-""".format(' '.join(sys.argv))
+""".format(os.path.basename(sys.argv[0]),
+           ' '.join([os.path.basename(a) for a in sys.argv[1:]]))
 
     xenlight_golang_generate_types(types=types,
                                    comment=header_comment)
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 152c7e8e6b..c8605994e7 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1,8 +1,5 @@
-// DO NOT EDIT.
-//
-// This file is generated by:
-// gengotypes.py ../../libxl/libxl_types.idl
-//
+// Code generated by gengotypes.py. DO NOT EDIT.
+// source: libxl_types.idl
 
 package xenlight
 
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 663c1e86b4..b4c5df0f2c 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -1,8 +1,5 @@
-// DO NOT EDIT.
-//
-// This file is generated by:
-// gengotypes.py ../../libxl/libxl_types.idl
-//
+// Code generated by gengotypes.py. DO NOT EDIT.
+// source: libxl_types.idl
 
 package xenlight
 
-- 
2.17.1


