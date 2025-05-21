Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AB3ABF177
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 12:25:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991670.1375509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHgcA-0006mq-0T; Wed, 21 May 2025 10:23:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991670.1375509; Wed, 21 May 2025 10:23:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHgc9-0006lM-Td; Wed, 21 May 2025 10:23:57 +0000
Received: by outflank-mailman (input) for mailman id 991670;
 Wed, 21 May 2025 10:23:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fb4M=YF=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1uHgc8-0006lG-Fn
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 10:23:56 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2c6d047-362d-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 12:23:55 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a376da332aso2026902f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 03:23:55 -0700 (PDT)
Received: from localhost.localdomain ([91.85.47.110])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f38142aasm62329635e9.27.2025.05.21.03.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 03:23:53 -0700 (PDT)
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
X-Inumbo-ID: b2c6d047-362d-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747823034; x=1748427834; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BaaopXGzVQVS3ui+bxnu+lj+jxPd2TC7KpOv7bUuDVY=;
        b=h4dDYknn30F8kw4++/wL49r2dINwkMIKVbMioWhDLlxdzDrstqdo3sZ6UXCFlUiIPn
         0gseKl3c2r4C8ZC+KkAQFL9Agg0fQoXXGkAetU0qe+ioFLQ6smprchcm4+ulX0JyY9FM
         vW/hCjXYOT1PEKCnNBfO37EAtExMk4luVBT6gy2fS79CfhLu6vCMxik0LTdmo7APCt/Q
         nBifOitJ+YyQyGprJ/IXFZnjtHtcrFpWea4hnNaU6uz6qkulGDYf88nvsXSuIWRiXu+T
         Ge4ZgIc3hI6/wbaXqKo4y75mW2Tq99dqr28CHM+CXckh7ivtj4AszmdqVU65d2dP9E64
         1yFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747823034; x=1748427834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BaaopXGzVQVS3ui+bxnu+lj+jxPd2TC7KpOv7bUuDVY=;
        b=IAbIbZlz8+691X6unXHE4SocJewiueYXLNmI3HyA4JHzrsnGgL1GTwqdkaqO9jtd6V
         yB1xNmFP8vhw9Q8fbFGCZFgDrW5OGkYjMAW/mxKDvYgzX/wdNikvyaQPps38HGY+aJwe
         qWCXjOpP+tpmWIB2bs408BNNQ+Mr/K0K/78ujuKJejCFBFIenHrQVlaGgBOAx+ZKgLOF
         KdNDng/vxBE4yRhEKZZ5/QCJxIfYkRbfRRaU5Epqnw/lAdtjcCP1twSEt7XV+5W8Q8K2
         ow517xrEVhFn6cZMf5foPcX+F/IdDUAsqdKnXCLLzHUf6kX+4cJOhqe98VZHl20hr2KX
         +qog==
X-Gm-Message-State: AOJu0Yzo6GgG7LwAjDiRafHALrtPptVaTgQMxt/JjSYsF03E1OIIhVEU
	MLOwMYZYvS7sC+CF/4OY6sBKbVx7XUxe5OdZpCR39gbuPzZH2Q70jaHdtve2Tkaq
X-Gm-Gg: ASbGncvQ+fhp/XrCHI6dN2JmaY+QskYmv/bznLYhpHG7lqbZ+lb4BO21dwMs8Hlfxwd
	bfTMyAQN2sc7ksMgzBV7993fPhGlWWYcoGZBQjgrhkY+TWBjkMRpzE5oIcmjd/XRK2MCI2FoW3e
	Mx9kGHTygy2+blZRgR//DOZ6O/UsLL3PlR7FVA6Gkmgu0lYlKOb7mLQ0nC29tIPifzaOPqjBdWF
	G3k0HqoyBEIPkQiJxoQ/AtzEWAIbjxZUM2ATshuaKs522v5aDEyBB/zmkptqwHY2QQv+z3MoBX3
	aaJiapK1v6ZQs4XwJ3/F1IgSG9Sjxb7d0XB8f5vMwZv40Pe23d9rb37dRVHkanQubPefmPbjZ3g
	=
X-Google-Smtp-Source: AGHT+IGxmvRFi9KDEqAcIldo/Ag0nJf9tNOFdValeBXjknF6xvVgmXmMKi3lufkrQMJG2CSMnt7ndg==
X-Received: by 2002:a05:6000:400f:b0:3a0:b4f1:8bd5 with SMTP id ffacd0b85a97d-3a35fe67aa7mr15728914f8f.18.1747823033960;
        Wed, 21 May 2025 03:23:53 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Rich Persaud <persaur@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] MAINTAINERS: add a reviewer for Argo
Date: Wed, 21 May 2025 11:23:33 +0100
Message-Id: <20250521102333.870789-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adding Daniel P. Smith as a reviewer.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
since v1: add to R: role

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c11b82eca9..517143075d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -222,6 +222,7 @@ F:	tools/libacpi/
 
 ARGO
 M:	Christopher Clark <christopher.w.clark@gmail.com>
+R:	Daniel P. Smith <dpsmith@apertussolutions.com>
 S:	Maintained
 F:	xen/include/public/argo.h
 F:	xen/include/xen/argo.h
-- 
2.25.1


