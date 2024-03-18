Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EEA87EE24
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:56:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694943.1084262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHE-0002yd-Da; Mon, 18 Mar 2024 16:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694943.1084262; Mon, 18 Mar 2024 16:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHE-0002vx-7j; Mon, 18 Mar 2024 16:55:56 +0000
Received: by outflank-mailman (input) for mailman id 694943;
 Mon, 18 Mar 2024 16:55:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHD-0002gq-5S
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:55:55 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 621d9fcd-e548-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 17:55:54 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-41400a9844aso17118995e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:55:54 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:55:53 -0700 (PDT)
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
X-Inumbo-ID: 621d9fcd-e548-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780953; x=1711385753; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8kMmfgRq+uIvUAnPJWzu57cwgfUkor1PWJ6MGv3dPY=;
        b=jLdOEag0dDzCt2HMeAKogbxsrj/VL4ryTnec5X0ImhJMVvooJdBc+t/0z3VnrfAxC1
         OIIyUR92gi6mCVxvuKt5a3YxQXcPt0fHlWPa2cZ0A6EZKGYMktADOsnHfWuXHh/gP/sP
         M46IDWHvhZNnpWZ5/Y7IqI53caAUvNRGUDDrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780953; x=1711385753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8kMmfgRq+uIvUAnPJWzu57cwgfUkor1PWJ6MGv3dPY=;
        b=TUigHAH4AlQCGOfbt8D7Re5NW5Do9nelw8Z9KsNahAws+BxMMFhua4RlSQyp7J+9as
         REoo3Nr7Ux/uuid11HlG+uz1ur8ECkLY8AcfiChO1G48+jHbZgd9oE6qhIxi9QaTG0K1
         JJorcm+Hx0KkeUMfYcHtD2+k6ulFnwJB64i7KCPj5Anz0Gi/MDbIlG/ppWHUOLGpQWxV
         JNwVnweRUVn3MGr9OaaGCd9ZFCM8Ob9JWejQ0AS84czA0qOpSNb7junSwk/CH+L9h1xM
         1lVws9719MZ15NhDOLFUJYS6+uEiKWZYgMAbWJzn25QDaoMVxYb3xdPnRFBOsgaoFZav
         Xy0w==
X-Gm-Message-State: AOJu0YzsiMkvecqElLq7/VMHjzcMsiVoJG1PR7Vq5FailhDS+VW4TNXE
	OgKmSAwBnhQ3GOQvZRN2z1XWA2ZzuW62sb3YVbph7NdAqqqIqOcwygdkTEdKROWgpKNj21sbPyA
	x
X-Google-Smtp-Source: AGHT+IH6j9RfgTsn7+po8KRRANVQ3xRpnv0hTecjgJ3XM5FB9vDJ9H1qgvfABbSR1BvxNI42chVO1Q==
X-Received: by 2002:a05:6000:cc5:b0:33e:c0fc:5e4b with SMTP id dq5-20020a0560000cc500b0033ec0fc5e4bmr185338wrb.2.1710780953624;
        Mon, 18 Mar 2024 09:55:53 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 03/36] mgi-common: Fix fetch_debian_package error message
Date: Mon, 18 Mar 2024 16:55:12 +0000
Message-Id: <20240318165545.3898-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

$@ expand to two or more words, but fail() only take one argument.
So if there's more than one argument left, fail() only shows the first
one, and don't event display "not found".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 mgi-common | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mgi-common b/mgi-common
index 6ce34162..98f795b1 100644
--- a/mgi-common
+++ b/mgi-common
@@ -49,7 +49,7 @@ fetch_debian_package () {
     set -e
 
     if [ $rc -ne 0 ] || [ x$pkgfile = x ]; then
-	fail "package matching $@ not found";
+	fail "package matching $* not found";
     fi
 
     fetch "$site/$pkgfile"
-- 
Anthony PERARD


