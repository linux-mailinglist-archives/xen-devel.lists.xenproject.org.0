Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3D459A6AC
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 21:44:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390438.627885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP7ux-0005Gk-B2; Fri, 19 Aug 2022 19:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390438.627885; Fri, 19 Aug 2022 19:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP7ux-0005F7-7j; Fri, 19 Aug 2022 19:44:31 +0000
Received: by outflank-mailman (input) for mailman id 390438;
 Fri, 19 Aug 2022 19:44:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yp9C=YX=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oP7uv-0004jJ-5f
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 19:44:29 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 562e351b-1ff7-11ed-9250-1f966e50362f;
 Fri, 19 Aug 2022 21:44:28 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id gi31so4144483ejc.5
 for <xen-devel@lists.xenproject.org>; Fri, 19 Aug 2022 12:44:28 -0700 (PDT)
Received: from uni.. (adsl-47.176.58.181.tellas.gr. [176.58.181.47])
 by smtp.googlemail.com with ESMTPSA id
 r17-20020a1709061bb100b00731745a7e62sm2695059ejg.28.2022.08.19.12.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 12:44:27 -0700 (PDT)
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
X-Inumbo-ID: 562e351b-1ff7-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=/HbANI3UeAtTK4BSnuJuxW7e2mu0WZGzY+TmqE1A7bY=;
        b=mYnFGTkCEIxQYyuCFlnzy+qIf7fcTM7SWqBrDw3j9zoLc626t2DGNjyFrKiqgHsn7M
         JB8HI2urhJiZn7rMFz84Zj4np7uXRe0apjN/hLWitx05BOR7GioDQxErOfRfA+z4mAo4
         r5W65T+O6xIWOHNCUTwAo8KYTHmF+e35mkU7i3xYh5cu6Gd8ob+ypxF/Uyanz/21pFc1
         7HVmEJLeY/c+F3sjictsCzEgYT3UgRyGDG5DenBSuuRI8lfRFechk1e1KGbCD8KIvouo
         DeM4/aNMlsn3x+OTxvdekjBZAfgxmiaXYryhfSGw+bq9pplJ//sDjBvZZxSeqfXh2RJ9
         CuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=/HbANI3UeAtTK4BSnuJuxW7e2mu0WZGzY+TmqE1A7bY=;
        b=cC2dzX7k2UWDElSKILjonbOx1ESfyXpTjpI/ImskmZrJ9zRf6iVXRNN3YOEK6kwT3O
         NFKEhNVL7T3W8kh2+XitnX9yMewLb2QMqkZLsZJZZcmX33r9ZLHOVzVyMU1ysxUnC1Dg
         xd3lE5Nm1I0OInvH0d9IbSD6EirPGN9BnloQHCnuOyQyFj7v2wzFP7lbwEDfw8PTS33W
         nYNcaF6sg/eFZQQW9QQ7i5Xs0CGr9xDJjfLNIx0GuClRTVditvskEH+hqnQrlw5nujHb
         ktsAy2drvr3YbHj2ts+bZcHQedjw4XfAQVdUr4PL3D01wuGfRZACSJvcBjbTWuSE1eUL
         dFpw==
X-Gm-Message-State: ACgBeo20sapyvtCR1eaos8MDOGCt3jRgI6rGNFP+WQNitvG7CxrjLm1x
	j1dYuAVDQdWhsllcLnEmS4nzjtWNhJc=
X-Google-Smtp-Source: AA6agR6JAOo63yvmQzBV6tN/muN9TPp6fGbM8KwYzl4I1ICVIld73kLbCHnhFkhsZKr+dkt6Pms/Yw==
X-Received: by 2002:a17:907:2c78:b0:730:df57:1237 with SMTP id ib24-20020a1709072c7800b00730df571237mr5690032ejc.196.1660938267549;
        Fri, 19 Aug 2022 12:44:27 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 2/7] xsm/flask: sidtab: Fix MISRA C 2012 Rule 20.7 violations
Date: Fri, 19 Aug 2022 22:43:54 +0300
Message-Id: <20220819194359.1196539-3-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819194359.1196539-1-burzalodowa@gmail.com>
References: <20220819194359.1196539-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In macros SIDTAB_HASH(), INIT_SIDTAB_LOCK(), SIDTAB_LOCK() and SIDTAB_UNLOCK(),
add parentheses around the macro parameter to prevent against unintended
expansions.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/xsm/flask/ss/sidtab.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/xsm/flask/ss/sidtab.c b/xen/xsm/flask/ss/sidtab.c
index 74babfac9c..69fc3389b3 100644
--- a/xen/xsm/flask/ss/sidtab.c
+++ b/xen/xsm/flask/ss/sidtab.c
@@ -14,11 +14,11 @@
 #include "security.h"
 #include "sidtab.h"
 
-#define SIDTAB_HASH(sid) (sid & SIDTAB_HASH_MASK)
+#define SIDTAB_HASH(sid) ((sid) & SIDTAB_HASH_MASK)
 
-#define INIT_SIDTAB_LOCK(s) spin_lock_init(&s->lock)
-#define SIDTAB_LOCK(s) spin_lock(&s->lock)
-#define SIDTAB_UNLOCK(s) spin_unlock(&s->lock)
+#define INIT_SIDTAB_LOCK(s) spin_lock_init(&(s)->lock)
+#define SIDTAB_LOCK(s) spin_lock(&(s)->lock)
+#define SIDTAB_UNLOCK(s) spin_unlock(&(s)->lock)
 
 int sidtab_init(struct sidtab *s)
 {
-- 
2.34.1


