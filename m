Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF735B15D9A
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 11:57:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063645.1429377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh3YU-0006Nr-DU; Wed, 30 Jul 2025 09:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063645.1429377; Wed, 30 Jul 2025 09:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh3YU-0006Kf-8J; Wed, 30 Jul 2025 09:57:02 +0000
Received: by outflank-mailman (input) for mailman id 1063645;
 Wed, 30 Jul 2025 09:57:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=06yH=2L=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uh3YS-00066r-Pu
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 09:57:00 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 885af468-6d2b-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 11:56:58 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ae35eb87810so102019566b.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 02:56:59 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af635a60e68sm722900966b.94.2025.07.30.02.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 02:56:57 -0700 (PDT)
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
X-Inumbo-ID: 885af468-6d2b-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753869418; x=1754474218; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPlqHXskDbw2/VqWKhqdl7xdZizcs3bRouTx3ma38YA=;
        b=CWVNpR6mfKRbuQpHPaV6fOOWavHWqnYrwA5KA0i9//F4iDShIPlFBgnTz5W1q58an8
         EhVcR0L9qcQwjbPDNIk3132NxkhUr4ebqyNl1MeMOZaTjWPtuQpsAworUDJ0DK8RPz1X
         RqYVEYGvWoMGQxPlB6I/alBRN0Bb8kmzWqr5EVWMxhMaYdClf4DmMVBehChv5BOEEoaA
         rs6zz+hdx5rRaY2mqOXYJrQK+R3gBBxDdWT/LbVonKvDJfi7jqmvt7U6D80xH00U2m7N
         4HhyjHgYu7ubOv2y0oKiU0eWWLmXcEGN2PXkig5VpQUh5hqYGDEwOXbuKnow5UUgQpA2
         bG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753869418; x=1754474218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPlqHXskDbw2/VqWKhqdl7xdZizcs3bRouTx3ma38YA=;
        b=XyiH6ET6HDeDbBJbE+T9rZes9tYAHRQiPHgI3prM+kCZvZ2demCLvSSsfqAi6jcUqp
         yDrPRGVypONJ7DGrc9Fc2xgFR3XSct61Zexea46l31CdbUUj4LAfbLKZj/1nj0Pw/hQ0
         HG3hJyRJ/jXr+WQctWFZDa23ebFanjlE91/0MRpxX6/ghdvsx38EkCZ0adg0d/dB1vSa
         ht5+W2c0IDZ2a9mphQ3clmk8o0B1WngwLnC+R0Sewzr1kJII5lpNWy+/qYIyghMEz5On
         nrN9L7T7MESHYgz/ogb67E2bdiv3zMDM36vTBk4h3oUprsq9QtAGQgbKVQ4oP/G9Ucf0
         kiMA==
X-Gm-Message-State: AOJu0YyWCrlUkWuIGVXlE1bvVkUY9M1qm3QkBFhrTyjRBsIVXJfGLm8s
	ujulYRH8hxXT+WhdLkNsCQJbSB0XONSS+Fus89trj9Sn7eBP2zK9sW5oajgyaTK9DIQ=
X-Gm-Gg: ASbGncvfZ3JxE+4mK4oWvHj1YDhq4rP2Sm57o6ClKhJ/GPkzlcrIOf3lEnhApin4zrt
	P5R1bTj0PxnKAnLULeWhHJt/wKNAxhKDlsfsPbGEzCvbQr3ok67ppacnScB7krGLH4eEYDMYXKO
	MfkoD+PJHnwrPI7XVIHHObW7M/+Ciexg6B8LkJI8nuessRf1WcL9h1heqJkkpCSy9aO1wUwhBJz
	UCI5hxb97euTnkw15TBMtepEU9kq2h5taOEFHWX/+PgWgxlWy7AetltsGZaklItrXQm4zYc1bF7
	KN8ncrq0AF5CyrvkSFTwjup/3o/176gsg1aE6zmuuNuLGCBmt+e+je7lqbbRiN3DZ74Bfh4Fcae
	JecrzBUelIu8qnzGrLLpwYHAAYs6lcbx8ogXtWFj8UnTvecrLlc2IYFOgf1Lcl/Sp/PVprUuPrs
	0/D3D3d5K3iLOylJwyy/zOyA==
X-Google-Smtp-Source: AGHT+IG2twmTL90g2cOGaPewf7uIzhzWTIOpSwoEPSQMH/r6oPYWV35Fz7guqXJJv5VTapjHIy4iOw==
X-Received: by 2002:a17:907:3e10:b0:af8:fd22:6e28 with SMTP id a640c23a62f3a-af8fd794dc6mr124864066b.7.1753869417878;
        Wed, 30 Jul 2025 02:56:57 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v4 1/3] tools: add sizeof_field and offsetof_end macros
Date: Wed, 30 Jul 2025 09:56:51 +0000
Message-Id: <8cfd773bd5cc9ecac25a4a92104483f07021c991.1753869323.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1753869323.git.w1benny@gmail.com>
References: <cover.1753869323.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

* `sizeof_field` returns the size of a specific struct member
* `offsetof_end` returns the offset to the end of the member within the struct

It will be useful in upcoming layout checks of SMBIOS structs.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 tools/include/xen-tools/common-macros.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
index 0088208c2e..3899e06753 100644
--- a/tools/include/xen-tools/common-macros.h
+++ b/tools/include/xen-tools/common-macros.h
@@ -83,6 +83,11 @@
 #define __packed __attribute__((__packed__))
 #endif
 
+#define sizeof_field(type, member) sizeof(((type *)NULL)->member)
+
+#define offsetof_end(type, member) \
+    (offsetof(type, member) + sizeof_field(type, member))
+
 #define container_of(ptr, type, member) ({              \
     typeof(((type *)0)->member) *mptr__ = (ptr);        \
     (type *)((char *)mptr__ - offsetof(type, member));  \
-- 
2.34.1


