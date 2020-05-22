Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB381DE551
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 13:25:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc5nV-00013Y-IA; Fri, 22 May 2020 11:25:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nXpb=7E=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jc5nT-00013T-QL
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 11:25:03 +0000
X-Inumbo-ID: dfff8454-9c1e-11ea-abb2-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dfff8454-9c1e-11ea-abb2-12813bfff9fa;
 Fri, 22 May 2020 11:25:01 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id x14so4438432wrp.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2020 04:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i3xrpgs1A8xyf57KGQZcB/Jp+HBtDGSdAF+ZjKHnwQ0=;
 b=lt7TGAYpXFrn/2dwUDZx1csOp5RKHkMZeRFLt5ixXgk8HH13RDsa9HBwZD1GcBbX7X
 mbmAoQqvRP7JUVecJTOGXUfSBaQ8SLrTTw7MCmCvg3pWHBi5gQqRCMqFegdg5FI5LeC8
 K16cp3/J7UBjOqBdYju6NEI6XSPbmCiqaBA9t7Ej4my61jiTcw5WzJvBboV8yAHgDDBN
 LjPsJveP6FM8Tnh0iZE06Y4iM7m1368SSz/fTqkRym9L+Rdg1jSJeAfkyMBez6Ar991k
 XN6KgTdu8/D6KU578MSaxsAlcaVKxr8cKuufzyjVA4pK572uXdVk4kHeOYR4SN5nDnqx
 djwQ==
X-Gm-Message-State: AOAM5335cszqKQ6BD8P/gnKMDAi1lQLCWcpGoEQXzO/OCC6JjEE2sOAj
 HjM19fLnoDXUk/6MYHy3ryOw9NOSWJo=
X-Google-Smtp-Source: ABdhPJx0e0a0JKYI+AzIrD22tApaVJZRHKrcdjfx3djni1RVAwuZEjROBG0HQozMuoZ62tcu6A4P5A==
X-Received: by 2002:adf:e588:: with SMTP id l8mr271699wrm.255.1590146700383;
 Fri, 22 May 2020 04:25:00 -0700 (PDT)
Received: from localhost.localdomain (82.149.115.87.dyn.plus.net.
 [87.115.149.82])
 by smtp.gmail.com with ESMTPSA id 1sm648806wms.25.2020.05.22.04.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 04:24:59 -0700 (PDT)
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Subject: [PATCH] m4: use test instead of []
Date: Fri, 22 May 2020 12:24:57 +0100
Message-Id: <20200522112457.6640-1-wl@xen.org>
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
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

It is reported that [] was removed by autoconf, which caused the
following error:

  ./configure: line 4681: -z: command not found

Switch to test. That's what is used throughout our configure scripts.

Reported-by: Bertrand Marquis <Bertrand.Marquis@arm.com>
Fixes: 8a6b1665d987 ("configure: also add EXTRA_PREFIX to {CPP/LD}FLAGS")
Reviewed-by: Roger Pau Monne <roger.pau@citrix.com>
Signed-off-by: Wei Liu <wl@xen.org>
---
Run autogen.sh before committing.

Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>
---
 m4/set_cflags_ldflags.m4 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/m4/set_cflags_ldflags.m4 b/m4/set_cflags_ldflags.m4
index 08f5c983cc63..cd34c139bc94 100644
--- a/m4/set_cflags_ldflags.m4
+++ b/m4/set_cflags_ldflags.m4
@@ -15,7 +15,7 @@ for ldflag in $APPEND_LIB
 do
     APPEND_LDFLAGS="$APPEND_LDFLAGS -L$ldflag"
 done
-if [ ! -z $EXTRA_PREFIX ]; then
+if test ! -z $EXTRA_PREFIX ; then
     CPPFLAGS="$CPPFLAGS -I$EXTRA_PREFIX/include"
     LDFLAGS="$LDFLAGS -L$EXTRA_PREFIX/lib"
 fi
-- 
2.20.1


