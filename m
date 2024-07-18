Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7819350E6
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 18:49:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760592.1170482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUUJH-0007YR-SO; Thu, 18 Jul 2024 16:48:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760592.1170482; Thu, 18 Jul 2024 16:48:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUUJH-0007SJ-L9; Thu, 18 Jul 2024 16:48:51 +0000
Received: by outflank-mailman (input) for mailman id 760592;
 Thu, 18 Jul 2024 16:48:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AEHZ=OS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sUUJF-0007P6-PN
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 16:48:49 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a69529b-4525-11ef-8776-851b0ebba9a2;
 Thu, 18 Jul 2024 18:48:48 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a77c4309fc8so114537066b.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 09:48:48 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc820f2bsm576882466b.206.2024.07.18.09.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 09:48:46 -0700 (PDT)
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
X-Inumbo-ID: 9a69529b-4525-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721321327; x=1721926127; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4BlkI7qVe6JhZnQJA32AL/5m5qn3kLrFdL0fvOwv9E=;
        b=QId9VnrsLlQpKF/Si9WMO4UhvwLsgLrJnr/v/bmCWR8VJ3KISHotq04bwGvBPbkf0T
         EXiEF6NTW2J0EF6Fka82hC3M87mailb9+uJuxDtkNDq0syvyF8HoHRl+veh9RGrV9IO3
         QA1ZtfgC2Fkry4IWAyGzAThNkRq5wZNXADtaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721321327; x=1721926127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X4BlkI7qVe6JhZnQJA32AL/5m5qn3kLrFdL0fvOwv9E=;
        b=lNymHf1wZERyxzuG9ONRi1XmtjBKyS0VQVxr+NFSTBxXyK7oUOAtoBUTHNYMNO8Y6O
         WGPrf8svILfINM3/z4BHmO/h/RMu4XGaX9eMpDw5vDWzR5uvcpYdAzcXLECQO4tNQgC4
         GHD9oTPnOv2OSEYkXa5tb7bVggvI9Gd4GdEbfxOqK7DiELMpzZAHOBNIlbi52G3ZwQGC
         PWh4+mUBwL4nEdU4qrb+6P1yjNeer4Y6YkoyYlJVfQ10g9NiJe/k1z2KkoZwNIfEHTbQ
         ilJ0mbB5XZmBX+3VAVJk1LwRGuELbytIs616T+lRfw6ukhRvPNhUb+CDuH3xaB8sTCXt
         83qA==
X-Gm-Message-State: AOJu0YxWlknmIw23gXBHMoGUw/FrtMoHsxQp/KYEWXNJgi9f/xOOaLJR
	2johc89AAuvifOSo0SoYtK2PCh6foxMZLEKDP3DaBuVsVVMwldooJTsi8u0sZ/zfh+gZ4htMW/r
	E
X-Google-Smtp-Source: AGHT+IG1xfD5N/kjpMelrT1RzzK/qXkkDG3AdIB0KNVjemyCKq0rzXa1y6vcnYgDZraTZ/yBRKWF5w==
X-Received: by 2002:a17:907:366:b0:a77:d773:54ec with SMTP id a640c23a62f3a-a7a01120edamr333454566b.8.1721321326786;
        Thu, 18 Jul 2024 09:48:46 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/6] tools/libxs: Fix length check in xs_talkv()
Date: Thu, 18 Jul 2024 17:48:37 +0100
Message-Id: <20240718164842.3650702-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
References: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the sum of iov element lengths overflows, the XENSTORE_PAYLOAD_MAX can
pass, after which we'll write 4G of data with a good-looking length field, and
the remainder of the payload will be interpreted as subsequent commands.

Check each iov element length for XENSTORE_PAYLOAD_MAX before accmulating it.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
---
 tools/libs/store/xs.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index ec77379ab9bd..81a790cfe60f 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -571,21 +571,24 @@ static void *xs_talkv(struct xs_handle *h, xs_transaction_t t,
 	struct xsd_sockmsg msg;
 	void *ret = NULL;
 	int saved_errno;
-	unsigned int i;
+	unsigned int i, msg_len;
 	struct sigaction ignorepipe, oldact;
 
 	msg.tx_id = t;
 	msg.req_id = 0;
 	msg.type = type;
-	msg.len = 0;
-	for (i = 0; i < num_vecs; i++)
-		msg.len += iovec[i].iov_len;
 
-	if (msg.len > XENSTORE_PAYLOAD_MAX) {
-		errno = E2BIG;
-		return 0;
+	/* Calculate the payload length by summing iovec elements */
+	for (i = 0, msg_len = 0; i < num_vecs; i++) {
+		if ((iovec[i].iov_len > XENSTORE_PAYLOAD_MAX) ||
+		    ((msg_len += iovec[i].iov_len) > XENSTORE_PAYLOAD_MAX)) {
+			errno = E2BIG;
+			return 0;
+		}
 	}
 
+	msg.len = msg_len;
+
 	ignorepipe.sa_handler = SIG_IGN;
 	sigemptyset(&ignorepipe.sa_mask);
 	ignorepipe.sa_flags = 0;
-- 
2.39.2


