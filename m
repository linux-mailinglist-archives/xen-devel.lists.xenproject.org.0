Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ED8589CB0
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 15:31:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380398.614530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJawM-0001Kg-Tc; Thu, 04 Aug 2022 13:31:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380398.614530; Thu, 04 Aug 2022 13:31:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJawM-0001It-QS; Thu, 04 Aug 2022 13:31:06 +0000
Received: by outflank-mailman (input) for mailman id 380398;
 Thu, 04 Aug 2022 13:31:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x682=YI=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oJawL-0001In-3U
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 13:31:05 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aff86402-13f9-11ed-bd2d-47488cf2e6aa;
 Thu, 04 Aug 2022 15:31:04 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id z12so15180303wrs.9
 for <xen-devel@lists.xenproject.org>; Thu, 04 Aug 2022 06:31:03 -0700 (PDT)
Received: from uni.. ([2a02:587:ac1d:6c00:8556:d1ea:dcb6:c7a1])
 by smtp.googlemail.com with ESMTPSA id
 i5-20020a05600c2d8500b003a325bd8517sm1509220wmg.5.2022.08.04.06.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 06:31:02 -0700 (PDT)
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
X-Inumbo-ID: aff86402-13f9-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=XlX0vsdDdgcBaiTlPcK9IhoP2wis7BryXBuo8UIjhnk=;
        b=cC0mpEf4Jj1W17i53fZIUAFpVvXOe/BilMXT8Xw74P8H5mQrj3PFTIezMV/xDtks9Z
         afo8pjdUpyTDAgvFnXeCOsKDFyWoDnvqdPrLEp7YdvYDKNtgSXPzP4+qD/tq1jAdiWMP
         HeZRKfu9SUc+iYZQNcwn2NeQvuda33CPsJoRNGdbweNN1X2KehaHpVUs5EA1oiiql0D4
         qxDPSsGj76Knbeuft1zxBnmQmuYM3z0KWgDyPO1rlb3at1GcRMA3OKwHmkf2SrEjmvQ6
         yDlJ2/arw0D8kq+yqoGwuR3gTCIvkwww3zVr/NxF2H0+RDZWEJKkNplLonbMRBUXqqci
         SZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=XlX0vsdDdgcBaiTlPcK9IhoP2wis7BryXBuo8UIjhnk=;
        b=l3NIsLAA5gG3pR+q+Esmd+jAyF3bvLWmufaHaWcWCeTlT8pmZCctWcmD0tpqiidDxm
         d1BLviZcXVtRGo9MaRRJMob4/t4y/6NktOEHJ7M+UMbITTxPDCdGLh5lL32asLHA9Qdl
         JlsftB1ArDmj79pBInOkykzUZXwMnhJuJRLShiLRdYym7WSHwnXtRqvGlTCWzhoSYwOm
         CkLryW1/hOdgRtzE9elsVnX8LLFlZ301uFRY7qk4QgQO1ojVlOH4T863VTsp3eaOKKNk
         hNeda3VwDM/HRskXrn24+X83vqUvBBbT8YxTgFN1vfYT11P0Rl6qBLl8s2NvgTEr46um
         cIbw==
X-Gm-Message-State: ACgBeo0TcCohraEVA65fA1Z/nbXMkFSb2w5IDUDioLVveAXlvqsN806l
	PjKFm9lO+GG/ofbCIBZBbcUWHbUpPPk=
X-Google-Smtp-Source: AA6agR45E/L6XVq2WUBKXnntLUtaOVMG9jr8J41ufJFuGHYqny1j+E8BcUQe2U4meg7csE7Hs6fBaQ==
X-Received: by 2002:a5d:64a4:0:b0:220:960e:518a with SMTP id m4-20020a5d64a4000000b00220960e518amr1497428wrp.374.1659619863255;
        Thu, 04 Aug 2022 06:31:03 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>
Subject: [PATCH v3] xen/hypfs: check the return value of snprintf to avoid leaking stack accidently
Date: Thu,  4 Aug 2022 16:30:58 +0300
Message-Id: <20220804133058.1832142-1-burzalodowa@gmail.com>
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

Changes in v3:
- place braces according to the coding style
- add the changes made in v1 because v2 was incremental to v1

 xen/common/hypfs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index acd258edf2..cdf4ee0171 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -377,6 +377,11 @@ int hypfs_read_dyndir_id_entry(const struct hypfs_entry_dir *template,
     unsigned int e_namelen, e_len;
 
     e_namelen = snprintf(name, sizeof(name), template->e.name, id);
+    if ( e_namelen >= sizeof(name) )
+    {
+        ASSERT_UNREACHABLE();
+        return -ENOBUFS;
+    }
     e_len = DIRENTRY_SIZE(e_namelen);
     direntry.e.pad = 0;
     direntry.e.type = template->e.type;
-- 
2.34.1


