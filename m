Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6497BDCDC
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 14:52:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614363.955404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qppjn-00082L-JQ; Mon, 09 Oct 2023 12:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614363.955404; Mon, 09 Oct 2023 12:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qppjn-0007yb-EJ; Mon, 09 Oct 2023 12:51:55 +0000
Received: by outflank-mailman (input) for mailman id 614363;
 Mon, 09 Oct 2023 12:51:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nTJG=FX=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qppjl-0007s6-EK
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 12:51:53 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b7511a3-66a2-11ee-9b0d-b553b5be7939;
 Mon, 09 Oct 2023 14:51:47 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3231df68584so4187563f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Oct 2023 05:51:47 -0700 (PDT)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a5d4f10000000b00324ae863ac1sm9589576wru.35.2023.10.09.05.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 05:51:46 -0700 (PDT)
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
X-Inumbo-ID: 9b7511a3-66a2-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1696855907; x=1697460707; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DD/Rtcmf93B68CFAL5jWDoRcvsTne4a1HEEQsNM+F40=;
        b=l0sln6m8nBF7dF4t8pdCSij8Tgs86p94L3ICslQuE09vCyXcufLg3uKedeLUWtv3vU
         4b+1Ghiu82S/8JHmiEQpyUFqAIaYFDaPsC/rxkzFpuB80O3LZsIlTx5s2EeTSBuQmYZR
         B9I4rqSorWCL6wpQ8JNHMEPvfaFUQoMA+KsHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696855907; x=1697460707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DD/Rtcmf93B68CFAL5jWDoRcvsTne4a1HEEQsNM+F40=;
        b=UKK4d24BjZQkpG7ClJA2OxJNjwssIDjAH5pUb4DwudvIa3dDStmVNnksMPJZTIzNX5
         MPDoAqzViH11rbzfYO2ulLcQaOK2BbWrczh/PDqiyHKwQIpR+OiRexy1L+AekOEFaRO3
         +/jsPpn6UNIJGrMr7gvr/61qUYZtf+ul4UWPrxi2H00A0Jv/JlkzuOcydIC+sCQq6jFh
         PmndvV3nhX6kJ0hHD2/FiP34+hs95gTxYXs3Mvs1ezU9QRNF/lD89QlayfYalsojHOIa
         Jq6RH+w7dkVT4COzjA6X70coBhqxdlNlyuHkgKtmDHfI+0CbeLl5nEFNvYApkToy8Hba
         gO/g==
X-Gm-Message-State: AOJu0Yz0lQj/Twh4f5RZBLs8FC/8C/n0CrnXC6I/5idii+dm0WlXECH9
	cAcVbvS8qxn5xW4oqqDSCkiWX4jPKvTrla1wh5I=
X-Google-Smtp-Source: AGHT+IHWmt4KguiMPo7Vjsf42uLk6RSQqhQqtBY8Q5VlJ+kitI+BnI6wYokp+Gg5XEHJcYs8F0a22g==
X-Received: by 2002:a5d:6681:0:b0:317:618a:c72 with SMTP id l1-20020a5d6681000000b00317618a0c72mr12976740wru.64.1696855906869;
        Mon, 09 Oct 2023 05:51:46 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Henry Wang <Henry.Wang@arm.com>,
	George Dunlap <george.dunlap@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Anthony Perard <anthony.perard@cloud.com>
Subject: [PATCH for-4.18 2/5] xenalyze: AMD's VMEXIT_VINTR doesn't need a trace record
Date: Mon,  9 Oct 2023 13:51:34 +0100
Message-Id: <20231009125137.1329146-3-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231009125137.1329146-1-george.dunlap@cloud.com>
References: <20231009125137.1329146-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just like Intel's PENDING_VIRT_INTR, AMD's VINTR doesn't need an HVM
trace record.  Expect that.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
Release justification: This is a bug fix.  It's a *very* small one,
but then the code path is not very critical either.

CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
CC: Anthony Perard <anthony.perard@cloud.com>
---
 tools/xentrace/xenalyze.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index 1359e096f9..fc25ac3589 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -4628,6 +4628,13 @@ void hvm_generic_postprocess(struct hvm_data *h)
         /* Some exits we don't expect a handler; just return */
         if(opt.svm_mode)
         {
+            switch(h->exit_reason)
+            {
+            case VMEXIT_VINTR: /* Equivalent of PENDING_VIRT_INTR */
+                return;
+            default:
+                break;
+            }
         }
         else
         {
-- 
2.25.1


