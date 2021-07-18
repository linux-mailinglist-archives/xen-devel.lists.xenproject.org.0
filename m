Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD8E3CC96D
	for <lists+xen-devel@lfdr.de>; Sun, 18 Jul 2021 15:58:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157979.291017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m57Hr-0002wV-JX; Sun, 18 Jul 2021 13:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157979.291017; Sun, 18 Jul 2021 13:56:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m57Hr-0002tj-GZ; Sun, 18 Jul 2021 13:56:55 +0000
Received: by outflank-mailman (input) for mailman id 157979;
 Sun, 18 Jul 2021 13:56:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pnag=MK=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1m57Hq-0002td-67
 for xen-devel@lists.xenproject.org; Sun, 18 Jul 2021 13:56:54 +0000
Received: from mail-qt1-x834.google.com (unknown [2607:f8b0:4864:20::834])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d3f3b1a-32d3-40eb-b63d-3bc8a2cc4509;
 Sun, 18 Jul 2021 13:56:52 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id c9so11027903qte.6
 for <xen-devel@lists.xenproject.org>; Sun, 18 Jul 2021 06:56:52 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:b886:bc1c:3d0e:ab25])
 by smtp.gmail.com with ESMTPSA id c2sm5497073qtw.30.2021.07.18.06.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jul 2021 06:56:51 -0700 (PDT)
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
X-Inumbo-ID: 0d3f3b1a-32d3-40eb-b63d-3bc8a2cc4509
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N0ciib42lc8SDMc+D3+65PSpJblmgENvpAajq+eW12w=;
        b=Bl6rbdRCyCYWA5sxttA9XKolMN+5cawJtXE9Ggu1+ywdbAuYi6L+v+bLy0S3HlBsuH
         jB01tIP9GtXYiD7hnb1F0EbCC7BG9st3rsE9QmnvHz8sCziRfBKrhEp4jEx+OLLSXFag
         nnIxpetCZtLNHxs67+AyRIDjF6AcN4FTyDwSNkfmxbHDG/tth/GLPfoTzFksASTQ5qq9
         EYW21RJP1elQIM76H9/QxO76CJ+ssQ248pojhM4UXq65GJcNBI8EobCGScUOu751d1u4
         i8c0STJko4UBCxPTN5mhV+KqPSlRLHVIPZlRTdDGiSDfkL4ti5qPpnVoYozS6ubzKK6Z
         fl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N0ciib42lc8SDMc+D3+65PSpJblmgENvpAajq+eW12w=;
        b=QLnYzKxgo0/pErWnu8+0o4dFuS0bwkJo8gKv9sYXT0rSnOU9/PkQhsfo0bZPxO2qOv
         Xxj+yHcw/JMP55nv5a1cT6U9SYkMLH28TB6BZ6xnM2MWqhekY6PSvaJ3H+vtRmaBomBX
         Jnycy9T5P+1exvAhDDb7lxzeU41ME8SG5GnWZNHmI4oMD1558cgezjDyk+ESSsksiqwR
         tmvNVJH+g/8szzyKpyEHmPCQT5Px6EOR68oSggPVXwyG4M23MR1BsoQY7u7CfwgRWVTM
         aqFVemrGcIMpPmjvVDJACIVQyTedBd+cDq46zQQjdpu5qAZ7jQxgbuxlOdoHwM/X9SGO
         6X+g==
X-Gm-Message-State: AOAM533RQBAxcmZKIVyDzaxpxRYzACZHDQteiE/FeUccE6j7bT9J0+OR
	OnaI0RZLIA/uvs1ZUwO3Yh7D5rsP1a4=
X-Google-Smtp-Source: ABdhPJwqjbzV9mGRAXDoGf5PawxbkyDM9sjYxGwpKTXSG1gYeKDSe9nGg7GkuJLtM48UXjC6NuU8xA==
X-Received: by 2002:ac8:5a55:: with SMTP id o21mr18042333qta.0.1626616612165;
        Sun, 18 Jul 2021 06:56:52 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com,
	Jason Andryuk <jandryuk@gmail.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] tests/xs: Check asprintf result
Date: Sun, 18 Jul 2021 09:56:33 -0400
Message-Id: <20210718135633.28675-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Compiling xs-test.c on Ubuntu 21.04 fails with:

xs-test.c: In function ‘main’:
xs-test.c:486:5: error: ignoring return value of ‘asprintf’ declared with attribute ‘warn_unused_result’ [-Werror=unused-result]
  486 |     asprintf(&path, "%s/%u", TEST_PATH, getpid());
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Check the asprintf return and exit if it failed.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
Using exit(2) since it is used for the xs_open failure.
---
 tools/tests/xenstore/xs-test.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tools/tests/xenstore/xs-test.c b/tools/tests/xenstore/xs-test.c
index c4c99c0661..f42c1cfe66 100644
--- a/tools/tests/xenstore/xs-test.c
+++ b/tools/tests/xenstore/xs-test.c
@@ -483,11 +483,20 @@ int main(int argc, char *argv[])
         return 0;
     }
 
-    asprintf(&path, "%s/%u", TEST_PATH, getpid());
+    ret = asprintf(&path, "%s/%u", TEST_PATH, getpid());
+    if (ret == -1) {
+        perror("asprintf");
+        exit(2);
+    }
+
     for ( t = 0; t < WRITE_BUFFERS_N; t++ )
     {
         memset(write_buffers[t], 'a' + t, WRITE_BUFFERS_SIZE);
-        asprintf(&paths[t], "%s/%c", path, 'a' + t);
+        ret = asprintf(&paths[t], "%s/%c", path, 'a' + t);
+        if (ret == -1) {
+            perror("asprintf");
+            exit(2);
+        }
     }
 
     xsh = xs_open(0);
-- 
2.30.2


