Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3747CA87D61
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 12:19:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949559.1346116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Gu2-0006wF-Gk; Mon, 14 Apr 2025 10:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949559.1346116; Mon, 14 Apr 2025 10:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Gu2-0006uZ-4X; Mon, 14 Apr 2025 10:18:58 +0000
Received: by outflank-mailman (input) for mailman id 949559;
 Mon, 14 Apr 2025 10:18:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KxE1=XA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4Gu0-0006cA-Ea
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 10:18:56 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd8d35ce-1919-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 12:18:53 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so21765845e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 03:18:53 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233a2f08sm171340495e9.12.2025.04.14.03.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 03:18:52 -0700 (PDT)
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
X-Inumbo-ID: dd8d35ce-1919-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744625932; x=1745230732; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ALhgfa8xDZiAvk4KRkCYhHo7ZCFxaNbuuSEWDWlOxI=;
        b=hx1iT8nLetYOZcZnTYrqHr6i4nFuFaKjkDUBKiqgBbh8HNzTnI3G+xkYzXU6roc7ir
         bxyHlhk3U9VN1SKYABrxBIxaPiXIH3MxeC0ENh2Dk1DN9yu+z5JwN2lUfWrmP++/Ir2O
         +hS6JJmHPlnZp2daQIV0gegApoc33kKJK2Zc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744625932; x=1745230732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ALhgfa8xDZiAvk4KRkCYhHo7ZCFxaNbuuSEWDWlOxI=;
        b=bklqnJ0hEAm9gVsi95E7LRTJQkQes3ElD+UeVywnBIXzSihOCLtzO3zBur7pngwM1t
         528PrK1FWhIJNsImX38TKlSjgu7UeDoWroD/t4fVToycUiaRj7/tFS0rNdH8HooMsT2U
         zxe86AzjjQtZFk0DiVstOnEtpfsTX7QQLOZfnQ0ARtWoU1vj0a41rTe3eFXQPxTap6d4
         uQSyG5rJzXsUHe9x8DMLAW9MhEiqgEuO8oX818LhRSHwYW0I9URb+pk31Z6U9UDcoH4r
         MIW9X5tKVrn0Zq9STKaF2m9HnzNQsBiSxJLP7pVgqilTYI9+42HTQkxRQ8JHBSIgkzRF
         I+TA==
X-Gm-Message-State: AOJu0YwCiknDRdysgDR621S+Bw6XP915fyr0o8cAdfuRnmoAzm+WGib8
	CT0NVx6jpeiiih0B4mmZlFyP0PpeIlD8l9al2FAdVC+LFG72ynRfncOXacjVIfhjCQgaE5T50lF
	GNtY=
X-Gm-Gg: ASbGnctz1bV3E6+Mq9OyDNgx/NLFZML+/vUqydnsRQDvG4kbeuk6W9XbJCuSTSAE8KU
	eYAb26A4B1E9FJsfXt9SH0sHqgO36xBPN5XOGnfvT54CBLyyRFYEeBx0AuTblEtUMudwsHLsFqB
	e0qdLksmn8tLGQcI3tSENyLNPsXZj1eioXMjUlTzw/6xfYe735F0sOaj9mOhY8BprGShCBZTlJi
	OrRSH9aFaHJYPcy9QFAiTNJTfHx835L6yRG7lM0WL1A77kYUpz7Vh+Kal3otlfEo/WTUhKfn0jH
	lXRnn6xvLHG1bAXTsMQrWjvjqpC1ATeLk0b+oQ55x2i6oTEwR0iC7ElqLQKYq27kn1Ii19h/jpq
	7GWlHlGZfazs4iHjJpMRqsWyG
X-Google-Smtp-Source: AGHT+IGUOhJ8hOJ+FLCHu2qubXmKfJOTDyLGchtAUpKntvTfEbGETJQ7zhU/aAU5N7j+PXHlWs1cbw==
X-Received: by 2002:a05:600c:1911:b0:43d:526:e0ce with SMTP id 5b1f17b1804b1-43f3a9ab03bmr80051015e9.21.1744625932482;
        Mon, 14 Apr 2025 03:18:52 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 5/7] Adjust directory layout for rootfs.cpio.gz
Date: Mon, 14 Apr 2025 11:18:41 +0100
Message-Id: <20250414101843.2348330-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414101843.2348330-1-andrew.cooper3@citrix.com>
References: <20250414101843.2348330-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All tests using the rootfs currently modify it with:

  mkdir proc
  mkdir run
  mkdir srv
  mkdir sys
  rm var/run

This is because the rootfs doesn't have the correct top level directories.
Furthermore, dev is currently included when it oughtn't to be.

srv is easy.  It's an empty directory and can be included in PATHS.

dev, proc, run and sys are all mount points, which OpenRC knows how to
populate on boot.  Create only the top level directories in rootfs, without
`find` recursing into them.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

v2:
 * New
---
 scripts/alpine-rootfs.sh | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
index 72c29e0a0a13..53547b5c5282 100755
--- a/scripts/alpine-rootfs.sh
+++ b/scripts/alpine-rootfs.sh
@@ -71,8 +71,11 @@ passwd -d "root" root
 cd /
 case $1 in
     cpio)
-        PATHS="bin dev etc home init lib mnt opt root sbin usr var"
-        find $PATHS -print0 | cpio -0 -H newc -o | gzip > "${COPYDIR}/rootfs.cpio.gz"
+        {
+            PATHS="bin etc home init lib mnt opt root sbin srv usr var"
+            find $PATHS -print0
+            echo -ne "dev\0proc\0run\0sys\0"
+        } | cpio -0 -H newc -o | gzip > "${COPYDIR}/rootfs.cpio.gz"
 
         # Print the contents for the build log
         zcat "${COPYDIR}/rootfs.cpio.gz" | cpio -tv
-- 
2.39.5


