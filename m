Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A42561EB7CF
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 11:02:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg2nq-000379-1T; Tue, 02 Jun 2020 09:01:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BVk0=7P=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jg2nn-000374-RB
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 09:01:43 +0000
X-Inumbo-ID: adb4e34c-a4af-11ea-81bc-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id adb4e34c-a4af-11ea-81bc-bc764e2007e4;
 Tue, 02 Jun 2020 09:01:43 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id r9so2111949wmh.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 02:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3JNG7ZWFZFUreW9L1zqRVccKLXwRJSgbQ6YgyQQA0f0=;
 b=IN/IUtOO9onupCSCc+1cnFrmVyBv0CN4GE4Eje04Jr3pmswY0klQk1x0kpoD7odDQj
 H9aVc9ujHQiE4CoSf8/iDHjh09HVLmn50nYncAvKBjS79xWogYTIp5vWMZhD6VjkEEpZ
 Ti3O/iqS8RiN5NL0On4vi2J2BEJkJEhLmYTT8bIc25y7UUx5W+EO38esTuaQ/Mi+IF7h
 nZ3Vxs/4CSs39kjlRjx6Rbst/iKoOhdIhX3Ll4zs2944bKM59J3SwLFth4yX1NzghJMP
 Q3rFGMl6x7PqZorsbH+OzqU+y0GM/Ls2Acih8/qdubMqRqqJWMt/BZEvx0pLtWMlkqUU
 HjsA==
X-Gm-Message-State: AOAM530scjsBnhEdiMtHKquucNjkUr0MTHJ3qBw1Cz3BQNwmMf28bxmN
 Q7kthvrdFuYrEGJKfrYe/OcDT6NL
X-Google-Smtp-Source: ABdhPJylltjD0CFAqG7U19U+D11dZnub9ISStuvQGfwt9kuUahdwU/AHozVyhY9XGouhvZoq19Pb4w==
X-Received: by 2002:a1c:c203:: with SMTP id s3mr3098455wmf.174.1591088502270; 
 Tue, 02 Jun 2020 02:01:42 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id b81sm2932688wmc.5.2020.06.02.02.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 02:01:40 -0700 (PDT)
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Subject: [[PATCH v2 for-4.14]] m4: use test instead of []
Date: Tue,  2 Jun 2020 09:01:38 +0000
Message-Id: <20200602090138.28656-1-wl@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: paul@xen.org, Roger Pau Monne <roger.pau@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

It is reported that [] was removed by autoconf, which caused the
following error:

  ./configure: line 4681: -z: command not found

Switch to test. That's what is used throughout our configure scripts.
Also put the variable expansion in quotes.

Signed-off-by: Wei Liu <wl@xen.org>
Reported-by: Bertrand Marquis <Bertrand.Marquis@arm.com>
Fixes: 8a6b1665d987 ("configure: also add EXTRA_PREFIX to {CPP/LD}FLAGS")
Signed-off-by: Wei Liu <wl@xen.org>
---
v2: Address Ian's comment.

Run autogen.sh before committing.

Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>
Cc: paul@xen.org
---
 m4/set_cflags_ldflags.m4 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/m4/set_cflags_ldflags.m4 b/m4/set_cflags_ldflags.m4
index 08f5c983cc63..23706e256b42 100644
--- a/m4/set_cflags_ldflags.m4
+++ b/m4/set_cflags_ldflags.m4
@@ -15,7 +15,7 @@ for ldflag in $APPEND_LIB
 do
     APPEND_LDFLAGS="$APPEND_LDFLAGS -L$ldflag"
 done
-if [ ! -z $EXTRA_PREFIX ]; then
+if test ! -z "$EXTRA_PREFIX" ; then
     CPPFLAGS="$CPPFLAGS -I$EXTRA_PREFIX/include"
     LDFLAGS="$LDFLAGS -L$EXTRA_PREFIX/lib"
 fi
-- 
2.20.1


