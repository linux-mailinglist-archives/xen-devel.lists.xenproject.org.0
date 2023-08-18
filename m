Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2A1780A33
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 12:33:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585934.917147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWwmY-0000im-Fg; Fri, 18 Aug 2023 10:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585934.917147; Fri, 18 Aug 2023 10:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWwmY-0000g3-Cm; Fri, 18 Aug 2023 10:32:42 +0000
Received: by outflank-mailman (input) for mailman id 585934;
 Fri, 18 Aug 2023 10:32:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvKd=ED=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qWwmX-0000ft-F2
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 10:32:41 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8df4a4c0-3db2-11ee-9b0c-b553b5be7939;
 Fri, 18 Aug 2023 12:32:39 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-31783d02093so712824f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Aug 2023 03:32:39 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j7-20020adfea47000000b00317731a6e07sm2321479wrn.62.2023.08.18.03.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 03:32:38 -0700 (PDT)
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
X-Inumbo-ID: 8df4a4c0-3db2-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1692354758; x=1692959558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BMACnGsKcrQoSw+QPY8i4YHgj0UkaKfz4CG3+niEko4=;
        b=FIdZgFAuKQPI0hokvWTGizvV2qyAnjo+Ny+HEKfUl/o7MAwKS5sD36r5o6OmGbFETW
         BbTszDHH01ryLRDyxni2XNn2eqbxOceu49uZzVTgboDRLVYBbBWkOD+V2IiIrC1E3nVC
         +wqgAHcKRfga1Cg2TDl+1LIPrN6CgvYP1GpPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692354758; x=1692959558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BMACnGsKcrQoSw+QPY8i4YHgj0UkaKfz4CG3+niEko4=;
        b=gbfbgvH/RPOfyCP6PRiMdSHYPpPsAm18QfoHTjTi043dR3FdDS3kZ67HH1b29DZIcj
         PXxKNXx6FTMPsCD6/qjQRVVXODSnn6s96l+fw1N9Hmra+zaZQz2aDtxYr4g5N7IP6lqp
         kVicCnY5vFaUtCTvPBn1ojTEihX0mKHbed3EpYbHQ+aCMJb42c3bJ7DhF92gdjZyTPXu
         kGHxK6E9snINVqF+5BJsIMyRE2ue1wNhORng8QNuu9DkwwH10WjmaK/f2kSFD2aRxqd5
         C3C3t7cF5xq+rBM1Oucni2nXbN4GJuJ388jjP2T4DiLVL0rQPmnDfR1ErBxqz58QQn9n
         7KWg==
X-Gm-Message-State: AOJu0YzJIX8dwWTm3HWNk8tqk5PLx5vlGUsEajFOG/UudhjV16xxmRV4
	EO0TlcmFKQgk/7PP+tPtjSg1HFzbx7lR2/xMVVk=
X-Google-Smtp-Source: AGHT+IFOSjfMz4xzcNYjoZrMIt8NtuD2TdPqStj4EXKo+FW7oSGKqDzH3IJr0zd6jZQqvxSccks2ew==
X-Received: by 2002:adf:f011:0:b0:319:83e4:bbbf with SMTP id j17-20020adff011000000b0031983e4bbbfmr1650167wro.20.1692354758346;
        Fri, 18 Aug 2023 03:32:38 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: kelly.choi@cloud.com,
	George Dunlap <george.dunlap@cloud.com>
Subject: [PATCH 1/2] code-of-conduct.rst: Remove Ian Jackson as a team member
Date: Fri, 18 Aug 2023 11:32:35 +0100
Message-Id: <20230818103236.51696-1-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ian Jackson is no longer involved with the Xen Project.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
 source/code-of-conduct.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/source/code-of-conduct.rst b/source/code-of-conduct.rst
index 963d605..c6003bb 100644
--- a/source/code-of-conduct.rst
+++ b/source/code-of-conduct.rst
@@ -80,7 +80,6 @@ Conduct Team members are project leadership team members from any
 sub-project. The current list of Conduct Team members is:
 
 * George Dunlap <george dot dunlap at citrix dot com>
-* Ian Jackson <ian dot jackson at citrix dot com>
 * Stefano Stabellini <sstabellini at kernel dot org>
 
 Conduct Team members are changed by proposing a change to this document,
-- 
2.40.0


