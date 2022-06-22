Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 218F4554EDF
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 17:15:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354108.581152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o424y-0007ki-W9; Wed, 22 Jun 2022 15:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354108.581152; Wed, 22 Jun 2022 15:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o424y-0007hs-SQ; Wed, 22 Jun 2022 15:15:40 +0000
Received: by outflank-mailman (input) for mailman id 354108;
 Wed, 22 Jun 2022 15:15:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P1Wy=W5=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o424x-0007hK-HZ
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 15:15:39 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c2f0946-f23e-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 17:15:38 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id a10so9427087wmj.5
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jun 2022 08:15:38 -0700 (PDT)
Received: from uni.. (adsl-190.37.6.169.tellas.gr. [37.6.169.190])
 by smtp.googlemail.com with ESMTPSA id
 p11-20020a05600c418b00b00397342e3830sm5069392wmh.0.2022.06.22.08.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 08:15:37 -0700 (PDT)
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
X-Inumbo-ID: 2c2f0946-f23e-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c+ahs+W5z01z1jHgynxKQadBuWdjH3bP2ezB1yrKqeg=;
        b=T6kQHr09Iy4hMQ9c/qninA2CbkRABuS+Dz4AGPrcZ6sJBG5WVlYEaw1UK5aPmIBLYy
         uLq4cN+eITTPco9HZqerchUMBcjDZL1xtBUF1NfkEgA1MWXKI2hx9IGRmCSUC25962iF
         uHFB2C6Y1T0h0LVNqjqAachojjUUoKi+uw6x7LpGzdaRNNM6DVPfptTzxghGOGCUtMVD
         wnj5/9zA34SDfvzsq/RAfUOJy3KqSMgmqlwx+Uk6RWMfx1/szJeAEg0QoFFcl//a2h0a
         tjWOLq3y+zj2fZ23bR3swivYDfPZW/ZqavB9kYzWz6lpavoObV5+gGUNzoFwieFmqOgc
         PvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c+ahs+W5z01z1jHgynxKQadBuWdjH3bP2ezB1yrKqeg=;
        b=oscj6mSCERckzHEvf4JNmmiUjOQ8Lqq23fgZY5/xkdzvwulrY3gWUhUebRcfFtLo32
         IP2lK7SiMwS4Ltiu+AFjqhS5KGyZ6aSp8l5SwFy66JMgD4KrdIpDd1qvv3B5LR4LgJTT
         xV5x9ooraC+CzrDpy1x30uyNrQrX/VAOwJUzdQU+V4uF0Go6LUszN60Cke8RXQ7lF0Ba
         DyDoS4qEGECh09K6OwhnTfbYaNhSj++A6wQkSP7Wfw4+smqeE2n8LcdP+mKYb9Z5JdvH
         /qmmdzMOhHxKT14I1DApxIRvU05UJ4niINQRIALylwetpi4GfScedSt1R0fCamX1UxKA
         XjZw==
X-Gm-Message-State: AJIora8j9NE/VoYbJmC8QCYncxXGtubLmPZGNtV7JFPK/hTOUvbJi1Wo
	i/tGWgSwTbUt7hV94ky7mzXSzIP4AWE=
X-Google-Smtp-Source: AGRyM1vZsIGFhZMcy0B+6c/CWT9Ry2qKRhhtM10UJFKyMD2j+HGK67wQQk34kh8WegJs1FBgbej7sA==
X-Received: by 2002:a7b:cc8e:0:b0:39c:829d:609b with SMTP id p14-20020a7bcc8e000000b0039c829d609bmr4773932wma.160.1655910937608;
        Wed, 22 Jun 2022 08:15:37 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/3] xen/lib: list-sort: Fix MISRA C 2012 Rule 8.4 violation
Date: Wed, 22 Jun 2022 18:15:13 +0300
Message-Id: <20220622151514.545850-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220622151514.545850-1-burzalodowa@gmail.com>
References: <20220622151514.545850-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Include header <xen/list_sort.h> so that the declaration of the function
list_sort(), which has external linkage, is visible before the function
definition.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/lib/list-sort.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/lib/list-sort.c b/xen/lib/list-sort.c
index f8d8bbf281..de1af2ef8b 100644
--- a/xen/lib/list-sort.c
+++ b/xen/lib/list-sort.c
@@ -16,6 +16,7 @@
  */
 
 #include <xen/list.h>
+#include <xen/list_sort.h>
 
 #define MAX_LIST_LENGTH_BITS 20
 
-- 
2.34.1


