Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0238548A3
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 12:42:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680622.1058685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDeR-0006qv-FJ; Wed, 14 Feb 2024 11:42:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680622.1058685; Wed, 14 Feb 2024 11:42:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDeR-0006n7-Av; Wed, 14 Feb 2024 11:42:07 +0000
Received: by outflank-mailman (input) for mailman id 680622;
 Wed, 14 Feb 2024 11:42:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WArD=JX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1raDeQ-0006Bc-07
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 11:42:06 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13158367-cb2e-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 12:42:04 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d0d7985dfdso75380661fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 03:42:04 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 bl20-20020a05620a1a9400b007871de8ec59sm1213626qkb.129.2024.02.14.03.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 03:42:03 -0800 (PST)
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
X-Inumbo-ID: 13158367-cb2e-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707910924; x=1708515724; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJNvqG2IGk9PsE23BxVL4PP6tdgbjCcG8XCSUoGj9SA=;
        b=fYam6ZkLBgALIdNuWAFx7UiX271DdFtImeyeOUyx0kknu/6atDJK797eneyGEVVYhS
         Re7FTwNIL6a7pRFuGgV2Iyr+2hpPlEB7IXFqUl91lG075/qjkC0lMAiyo+yDzpdRYj7E
         dH2BKL9+62Ej1Omt6nIJkUIPx44P07ojnFS/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707910924; x=1708515724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GJNvqG2IGk9PsE23BxVL4PP6tdgbjCcG8XCSUoGj9SA=;
        b=Jv1OUFNCs97A6mBuOwtiX8IwfECfW+cxMgtARfOKdbg2I09j5QnwKkGSmdrSJot9Yo
         fvym4KYl37Zbb+HKlqKILlXnPuLn4CkwTs1wEIq+Pq0VabNapjYSYBT44eFEwW5sdHhh
         JE3R5NwmPgUy6z5JenAXkSARBZWWtacd/GMsz1cZ3XXBQHYfiDaTNtGotEVobFMqQt/2
         5+n1EDtMe8HXspF77yEV7Ju5Tzerm15h+WMBUnDaJujgdKkMpNTidvJRr5f797q/w/CQ
         ZpEi/FA6DWJEcbyZLlIphEI04JRhEQIop7w2AIYDDDFx0Q6B3lsi0/9BYzzmPldanmik
         zXQg==
X-Gm-Message-State: AOJu0YwNYjinrEf71GABLCv30e9q9xxP6NHdHcR/nxqbKtKKfV6Oi9oZ
	6jXy6f7JvR0ER0b/TQlDMgAkSpO9mCuBBhA6g8pb5qToX6b6s+yRRxPgxmdQYrZoB9zCEJJQbm7
	V
X-Google-Smtp-Source: AGHT+IERu49AGLIkPi283NJAq1+/A4S0ucosD9AQdE9Pv8SPP/1s0udEm7HZ9T+ks4n26Nx+Dh+bSQ==
X-Received: by 2002:a05:651c:1425:b0:2d0:aa28:6f77 with SMTP id u37-20020a05651c142500b002d0aa286f77mr1534669lje.45.1707910923934;
        Wed, 14 Feb 2024 03:42:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUiClLFOh55PWam1Jc8L+bOL+KWodINot4ElxIAPkcWyyWduLUh/Prog/oIShPDXpmPyM3yEHr7dTmShha8Q3352O8rjla6S86V9p2imJdeYf6w26ogCW+bDGotQ1PWpRU9QYo/3P1p28QE3F9akc6c0XsZnqZDq11Gfk7rmbmUlusoxxZmcFHZ6gcDyeeTzaTBbc1XbKZZoEFkRSmCp1gcSLuILQsOZvtiYQ==
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 5/5] mm: add the __must_check attribute to {gfn,mfn}_add()
Date: Wed, 14 Feb 2024 11:37:41 +0100
Message-ID: <20240214103741.16189-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214103741.16189-1-roger.pau@citrix.com>
References: <20240214103741.16189-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's not obvious from the function itself whether the incremented value will be
stored in the parameter, or returned to the caller.  That has leads to bugs in
the past as callers assume the incremented value is stored in the parameter.

Add the __must_check attribute to the function to easily spot callers that
don't consume the returned value, which signals an error in the caller logic.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/include/xen/mm-frame.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/xen/mm-frame.h b/xen/include/xen/mm-frame.h
index 922ae418807a..c25e836f255a 100644
--- a/xen/include/xen/mm-frame.h
+++ b/xen/include/xen/mm-frame.h
@@ -23,7 +23,7 @@ TYPE_SAFE(unsigned long, mfn);
 #undef mfn_x
 #endif
 
-static inline mfn_t mfn_add(mfn_t mfn, unsigned long i)
+static inline mfn_t __must_check mfn_add(mfn_t mfn, unsigned long i)
 {
     return _mfn(mfn_x(mfn) + i);
 }
@@ -62,7 +62,7 @@ TYPE_SAFE(unsigned long, gfn);
 #undef gfn_x
 #endif
 
-static inline gfn_t gfn_add(gfn_t gfn, unsigned long i)
+static inline gfn_t __must_check gfn_add(gfn_t gfn, unsigned long i)
 {
     return _gfn(gfn_x(gfn) + i);
 }
-- 
2.43.0


