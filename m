Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EED8B5C36
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:01:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714126.1115165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SUn-0006Zp-GA; Mon, 29 Apr 2024 15:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714126.1115165; Mon, 29 Apr 2024 15:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SUn-0006XF-CP; Mon, 29 Apr 2024 15:00:45 +0000
Received: by outflank-mailman (input) for mailman id 714126;
 Mon, 29 Apr 2024 15:00:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hXAa=MC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s1SUl-0006Ve-Vo
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:00:43 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f2b3c33-0639-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 17:00:42 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-790605809cbso420317085a.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 08:00:42 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 pa2-20020a05620a830200b0078ede2e9125sm10422151qkn.57.2024.04.29.08.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 08:00:39 -0700 (PDT)
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
X-Inumbo-ID: 3f2b3c33-0639-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714402840; x=1715007640; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SiQeSFoT/wXbOVQjeXcAWBiOE9S9/ogSwfjl5ofYfjE=;
        b=UJMh97+hl4Old0cahbYH5d+r4/9LYzJy9lgZ+VkqVojsktRGxB8PnHuTGbAWJsRr5S
         X2VEE6BqRmFR9Ns9R4Domwt3I4YfNrOGoKoRzwH6KnDURslxny8/iNoTVwnW6YpQBqap
         GR5UedV+qlLgu9rsN6hUVF/aU/ypHiG6759K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714402840; x=1715007640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SiQeSFoT/wXbOVQjeXcAWBiOE9S9/ogSwfjl5ofYfjE=;
        b=cPydUbqrl3h/nBY97pEFSGgAfRwiwTOZyae4ivdTbjpnDCmoQiPI8mEK2QMoyI2ur1
         LTi8IjTHuULg7iwYA9SEpOgcWwt3EnyURcWpE+iIrZ8ftZgVp2gxsYknim3X9V+ofimz
         LAdM1Uzz3z7PnRGLcqV8y/fvHPUd2Ftd+4zNpSld8km3v/5n32XPBVwxh1f+Jyp+ZCFK
         d8UvOCEgh+BsyP/Tp4mi4pklKkLwJp89jfzjfyGYdw8qxifYLZzCRL464Fcy4i7Xxsa/
         F58WrnY4v9MyzTUfBVrBOSKQriUylItwU+76dnJLtyzEyGaLx9zxzq8NlAdv3z2togF5
         e3cA==
X-Gm-Message-State: AOJu0YwMpJaV9xj9bV7lByctIW1ZttVTYu1dyRnGdjWlhu3jlKteW9Id
	E6U6UcLTUijYZG7/rwYFqSoPgxOz1IFwm/utYJjCNb7JRer6NbV7e985bVcgXTJmw/9y1TTDg5R
	4
X-Google-Smtp-Source: AGHT+IGyzndRvqqRSoKqlx/mXjkWwqb7cfTC/no9JTMWUvvtw0nuLVnO4nxSXwkIu/HziZUgZD6Gxg==
X-Received: by 2002:a05:620a:1a16:b0:790:8926:a69e with SMTP id bk22-20020a05620a1a1600b007908926a69emr12973353qkb.74.1714402840107;
        Mon, 29 Apr 2024 08:00:40 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: konrad.wilk@oracle.com,
	ross.lagerwall@citrix.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 2/9] create-diff-object: update default alt_instr size
Date: Mon, 29 Apr 2024 16:56:47 +0200
Message-ID: <20240429145654.71669-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429145654.71669-1-roger.pau@citrix.com>
References: <20240429145654.71669-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The size of the alt_instr structure in Xen is 14 instead of 12 bytes, adjust
it.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 create-diff-object.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/create-diff-object.c b/create-diff-object.c
index fed360a9aa68..d8a2afbf2774 100644
--- a/create-diff-object.c
+++ b/create-diff-object.c
@@ -1000,7 +1000,7 @@ static int altinstructions_group_size(struct kpatch_elf *kelf, int offset)
 	char *str;
 	if (!size) {
 		str = getenv("ALT_STRUCT_SIZE");
-		size = str ? atoi(str) : 12;
+		size = str ? atoi(str) : 14;
 	}
 
 	log_debug("altinstr_size=%d\n", size);
-- 
2.44.0


