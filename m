Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 982137F7205
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:48:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640511.998856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Tjw-0004vc-Iv; Fri, 24 Nov 2023 10:48:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640511.998856; Fri, 24 Nov 2023 10:48:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Tjw-0004sq-FF; Fri, 24 Nov 2023 10:48:52 +0000
Received: by outflank-mailman (input) for mailman id 640511;
 Fri, 24 Nov 2023 10:48:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TTQ-0006hy-Lv
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:48 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aad39247-8ab4-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 11:31:46 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-54af2498e85so681570a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:46 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:45 -0800 (PST)
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
X-Inumbo-ID: aad39247-8ab4-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821905; x=1701426705; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mx7qjLmwj3uVtX+Ndzq6GqRVOTLP95SGTxuClseF48U=;
        b=VoDyOlV2nHD46jHjpQXBqPys0sSFukCYkHzBsnYSIBsT0W+KlkfrhRF0UPkOR4JBN5
         UhYzkaNc4/ou69VePPisKUS2in5uhTze4CZum8q8e8lh2QlqWfaswVB/CTcV3i02TbET
         HC02ReJDJfjEEBHPa5dWRv2QYTUx/xL/pChzPmjMTGrHiSAFw1M/b7pI9FC1DnG1wCuM
         MpC4Y8Ojr1l4z9S3HhLYZm7iBu10kLMKUonmvwGCknZ92h+UZOjzdiQy4/qkyVYdAZ/x
         G4XvdjWVW8/70PnbJwM0lp5KMZZkv63Q/SPgkKn0x5S6N1eTob7B3IZtVAN9JTuGgTg+
         Zb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821905; x=1701426705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mx7qjLmwj3uVtX+Ndzq6GqRVOTLP95SGTxuClseF48U=;
        b=nNDcXDH8TVs1wsyBU3DuUZTRZ+Lu6HYOn2qQgKEUOAtIFpqS7XmYxeAA2cn0P/GVh5
         uFgpVIGNnHtZA/ujDZktE2bBeVJBxr8ewlGyA1YItBIShyBVxsrihgeOpQ9awtCPaY3t
         /lJf5B7ay1tqaRsl0fXTD5LV1Zyew0vKgHYUDnOaSTXRQcuy5u5qNWO+bXlyaTM57jVl
         7cFnup+8C0et+J3sEl8e6jLVrXnGJHDjyLjJOGSTeshdzp6FT0boFwZtG5P9Q2WSOW2I
         GJiBUyq7mSmBxtJXq640KjfgbkF8PZbBN/Ex7Y/o20fUkUpCpk7MKsVfCVvl9qlOR5hL
         +Frw==
X-Gm-Message-State: AOJu0YxAYyzI02kIIgsfDyQcoL6oBkV1342H/pXoqZQuT9b7YbzSZVEV
	yisalpF9yiplk294FbYG4iqsM74xUMdSYA==
X-Google-Smtp-Source: AGHT+IEvOFr6h2HR0lDByP5Lxw8dorUuG6/oPkB+wEAsCnw+tIli/lYGEC2ns3VjXIsSs6cXalrcSQ==
X-Received: by 2002:a17:906:c307:b0:9d4:2080:61dc with SMTP id s7-20020a170906c30700b009d4208061dcmr1821573ejz.22.1700821905318;
        Fri, 24 Nov 2023 02:31:45 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 35/39] xen: add necessary headers to common to build full Xen for RISC-V
Date: Fri, 24 Nov 2023 12:30:55 +0200
Message-ID: <88bab81d8412588dab82bb53193105ff4993961a.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/include/xen/domain.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 54d88bf5e3..a4e11342e3 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -4,6 +4,7 @@
 
 #include <xen/types.h>
 
+#include <public/domctl.h>
 #include <public/xen.h>
 
 struct guest_area {
-- 
2.42.0


