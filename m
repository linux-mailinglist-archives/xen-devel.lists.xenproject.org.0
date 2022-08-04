Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8602D589BE4
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 14:48:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380305.614410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJaGO-00076A-TP; Thu, 04 Aug 2022 12:47:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380305.614410; Thu, 04 Aug 2022 12:47:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJaGO-00072p-O3; Thu, 04 Aug 2022 12:47:44 +0000
Received: by outflank-mailman (input) for mailman id 380305;
 Thu, 04 Aug 2022 12:47:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x682=YI=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oJaGM-00072T-Le
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 12:47:42 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a076b22e-13f3-11ed-bd2d-47488cf2e6aa;
 Thu, 04 Aug 2022 14:47:41 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id j1so16772920wrw.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Aug 2022 05:47:41 -0700 (PDT)
Received: from uni.. ([2a02:587:ac1d:6c00:8556:d1ea:dcb6:c7a1])
 by smtp.googlemail.com with ESMTPSA id
 f5-20020a5d58e5000000b0021eed2414c9sm1066614wrd.40.2022.08.04.05.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 05:47:39 -0700 (PDT)
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
X-Inumbo-ID: a076b22e-13f3-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=MpNcmb2hnEu6GcDIJ3KzQgG2533n49yeVIN27EhZr7U=;
        b=UCw+/cRrKckbcLHYq+nMtjWyqlYVUh6PGCU9d/ZNSCHr+ysb7KchpE9O8BL2OvHOPS
         LIQscYNq2ce1pnNLt0GOH8gMWc6ceauuLImmTfnVvmAgDx/flJkRxRDKQNXGjeJSXzfT
         4nx+2FTaKFNTUrs/ZFvKweBKT/DIqE0YH7530b8R10artPy/V9SHfHDzeXL7i/4DLmTu
         RKnWt/4mn5tRSsFFOjua5aEsLczTIWGjnF0y6XF/TwDoKPLR7C8uzeFc+2nqt7UsCv3L
         Wxv0iJPeDYu5Xzlx/CoyDX8FvZ9Jfml89vjy5lNyvK5prGvBiE26tcOyFdDg63dnbSTP
         wQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=MpNcmb2hnEu6GcDIJ3KzQgG2533n49yeVIN27EhZr7U=;
        b=j4i6EJxgmb7aiJZV+BUf3h3sY3re6Y7Lbj+kbPKra+EEZcS3GD96K1s3yq5uWnZdU1
         fVrrp+fed0gNAEm0oPh/KG2SE3TG+cnh5+d8W0MKJ0gsFTOQ9STJM4GDI/yVgWsYNhFh
         z4AciTB8F1DAyR+8GwBjtvLClmT8wrgjnjnif2gAa34qbqj6yXmbXPnWf63WuiWzFJn2
         Hu2GklNMp4vGhdE7rCdildZs2V1zhcT9jseUk1CIVZ/Y8awrzotiUm45eX0JFteC1UuF
         gKWzMsmDxbOp8BhLI4dCLad2wfejIpRV9eKZ9muDfIUPEV3NMbisovyEmXsRS3YR7zHL
         1sHA==
X-Gm-Message-State: ACgBeo0SVW2Jg6+Y6WTesx12cUFPtXEc6IaXDd/rEvMVjnnO+yVYV4Tg
	gHWyTGQlmzjtUOq97DDYSsYenlJXHRw=
X-Google-Smtp-Source: AA6agR4wzGed+zTDTwm/lvkyd6L82b752jvz2Z+WiggVXS9sPSn9RZcQe5OpjXKqvY0Q+iDFnJrx5g==
X-Received: by 2002:a5d:54cb:0:b0:220:6426:6219 with SMTP id x11-20020a5d54cb000000b0022064266219mr1283046wrv.461.1659617260324;
        Thu, 04 Aug 2022 05:47:40 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>
Subject: [PATCH v2] xen/hypfs: check the return value of snprintf to avoid leaking stack accidently
Date: Thu,  4 Aug 2022 15:47:36 +0300
Message-Id: <20220804124736.1827246-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function snprintf() returns the number of characters that would have been
written in the buffer if the buffer size had been sufficiently large,
not counting the terminating null character.
Hence, the value returned is not guaranteed to be smaller than the buffer size.
Check the return value of snprintf to prevent leaking stack contents to the
guest by accident.

Also, for debug builds, add an assertion to ensure that the assumption made on
the size of the destination buffer still holds.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2:
- add ASSERT_UNREACHABLE()
- update commit message accordingly

 xen/common/hypfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index 66026ad3e0..7b3377d46e 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -377,8 +377,10 @@ int hypfs_read_dyndir_id_entry(const struct hypfs_entry_dir *template,
     unsigned int e_namelen, e_len;
 
     e_namelen = snprintf(name, sizeof(name), template->e.name, id);
-    if ( e_namelen >= sizeof(name) )
+    if ( e_namelen >= sizeof(name) ) {
+        ASSERT_UNREACHABLE();
         return -ENOBUFS;
+    }
     e_len = DIRENTRY_SIZE(e_namelen);
     direntry.e.pad = 0;
     direntry.e.type = template->e.type;
-- 
2.34.1


