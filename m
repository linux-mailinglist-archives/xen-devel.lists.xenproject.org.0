Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8837F780A34
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 12:33:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585935.917157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWwmZ-0000wU-MP; Fri, 18 Aug 2023 10:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585935.917157; Fri, 18 Aug 2023 10:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWwmZ-0000uo-Ji; Fri, 18 Aug 2023 10:32:43 +0000
Received: by outflank-mailman (input) for mailman id 585935;
 Fri, 18 Aug 2023 10:32:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvKd=ED=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qWwmY-0000ft-3O
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 10:32:42 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e31a73c-3db2-11ee-9b0c-b553b5be7939;
 Fri, 18 Aug 2023 12:32:39 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fe5695b180so6857545e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Aug 2023 03:32:39 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j7-20020adfea47000000b00317731a6e07sm2321479wrn.62.2023.08.18.03.32.38
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
X-Inumbo-ID: 8e31a73c-3db2-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1692354759; x=1692959559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDZ7Vp1jLyi3LKLmEsGeEcZnjO4sUh6qrbR20c648A8=;
        b=crQ5eUYqvLql0LCDSfoyj0jc0PEnYmx9+5Hmmv8Y5K+E4Dr46CUibahMK5YpPR7rJB
         CXJqjJ+YmNDQNKi0CLRVu5At/641k1fZ2Ji+B7x2fxg+o3Je4OIzeVam6pK08WqREhhe
         LMNFqFQjIbtJqh6MsX559i9wBsOKBHoqAOls4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692354759; x=1692959559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aDZ7Vp1jLyi3LKLmEsGeEcZnjO4sUh6qrbR20c648A8=;
        b=gmx4AcIUTmE5vyUAQpsrDRaoNbgD+EO8zTRIvSdS7A33XBIvWvzPdo0JY0p6gLAj/G
         qlhJ22VT98+yQ4U6MJg5G53HtCJY4IfnEaFAZDAWt9MfNDYytVu85dhNfdQdLgQCsixY
         vztYoruig1VsziqPPhXGIm9D+4sc2s78h8OH8NS0D+3yBiUWFrwKwLl5RnHzw7GMUMJU
         fG/DI+FtwRLXxGcShQdbiNH/rJfQZaORwHj8vIjK0v/mvoM9eTV1pjHHfJmhxPKbJg/K
         NUhzD5wknsM7paeo1ZG+nWSv+2uOme1+GHoP9m+MfOQK9oIGjTnV93Oe5RG1zi+LurI9
         Pt9Q==
X-Gm-Message-State: AOJu0YwsamHmlh8UMxVgu2ybVg7iLOQusmudMgLeXJ1/nlKymuUY3E8x
	ofS8eQcpc942t1LeoIMG0pSpnwOg9JJybzSV3to=
X-Google-Smtp-Source: AGHT+IHEcm+t7S+OsjeaUJRz52PPZcNjfIYgZ1CrigUo2mH1zkkfhkJ+T0JSyhjKjm2TnMxP5BoSyA==
X-Received: by 2002:adf:f74f:0:b0:313:ebf3:f817 with SMTP id z15-20020adff74f000000b00313ebf3f817mr1786374wrp.22.1692354758781;
        Fri, 18 Aug 2023 03:32:38 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: kelly.choi@cloud.com,
	George Dunlap <george.dunlap@cloud.com>
Subject: [PATCH 2/2] code-of-conduct.rst: Update George Dunlap's email address
Date: Fri, 18 Aug 2023 11:32:36 +0100
Message-Id: <20230818103236.51696-2-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230818103236.51696-1-george.dunlap@cloud.com>
References: <20230818103236.51696-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
 source/code-of-conduct.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/source/code-of-conduct.rst b/source/code-of-conduct.rst
index c6003bb..6ef11c8 100644
--- a/source/code-of-conduct.rst
+++ b/source/code-of-conduct.rst
@@ -79,7 +79,7 @@ Conduct Team members
 Conduct Team members are project leadership team members from any
 sub-project. The current list of Conduct Team members is:
 
-* George Dunlap <george dot dunlap at citrix dot com>
+* George Dunlap <george dot dunlap at cloud dot com>
 * Stefano Stabellini <sstabellini at kernel dot org>
 
 Conduct Team members are changed by proposing a change to this document,
-- 
2.40.0


