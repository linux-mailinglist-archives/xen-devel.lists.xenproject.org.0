Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAAA7FF1CF
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:31:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644748.1006211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8i4H-0005e7-Gz; Thu, 30 Nov 2023 14:31:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644748.1006211; Thu, 30 Nov 2023 14:31:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8i4H-0005bW-CI; Thu, 30 Nov 2023 14:31:05 +0000
Received: by outflank-mailman (input) for mailman id 644748;
 Thu, 30 Nov 2023 14:31:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Jom=HL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r8i4F-0004ZQ-1o
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:31:03 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16677a52-8f8d-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 15:31:02 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-332ed02ccd9so679754f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Nov 2023 06:31:02 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 f14-20020adfe90e000000b00327b5ca093dsm1673593wrm.117.2023.11.30.06.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 06:31:01 -0800 (PST)
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
X-Inumbo-ID: 16677a52-8f8d-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701354661; x=1701959461; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itD9aYJVZiQmj7BEzrk6sR1Ahs79xsAwrmOZilzma4o=;
        b=YK/6MP/o6zCpa2ZcakEhlFN/zNVyoYa0fSvvmGfKgIJs3+goZaPgRo5atLmjAyufFo
         0NyKJ8hMlONKP+1pRT9XyEIdu7rOLZKdFOAosIu4+zhRCUHam6iMcYaXCRU8fSQWQq1W
         o4cokhEQ/InG9ddPxJrU6dEv3YjX2/lI2+yAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701354661; x=1701959461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itD9aYJVZiQmj7BEzrk6sR1Ahs79xsAwrmOZilzma4o=;
        b=l4HxwOmmYv/px2HYpzduSadbtZhHdk3ZHeK9zkBkXrt/2JDXueUDxa2IjQQB20ZrOG
         LaTi29v2RYeHEZYDjoFU2S159KGob6smiCYwE75XBvK/EBF+XHA+hfqsvKTuru9gAzwO
         6jwxjXBXH+SQOTEOvBzK74QkI4MCuG8sHyn91yuZFMmUdTRu4Dy57mJz8ZCKyBger1sT
         dMuO0hjYMHR7+NAv3q6bKyTCoP5oxWbLz4syY8dr3RYaXn9OfkPAFFVbozy7crQcA4Ni
         oS89cBoqgDp+a60HgvlerehzUVLhN/qTP/goUJrI9b+SwrtjBmkeFp4YjXuDvRNpcBtQ
         B0AA==
X-Gm-Message-State: AOJu0Yy8zBR9Mm7XLtGSpt8hqelqcKIO3j2b43y4/z+yQV2uWz9O6Hzg
	YsReq2jOozBbJTbw3nw7hC2hDDPbr+SFeWo8G/g=
X-Google-Smtp-Source: AGHT+IHgwHhQ/n+cUe7PQsDuJSfWpr81r0/7KpbRdw1/ChIpwgV2QO6OkX+Gd5x4Zbrhdyew0wcZHA==
X-Received: by 2002:a5d:624f:0:b0:333:57:9552 with SMTP id m15-20020a5d624f000000b0033300579552mr8512025wrv.63.1701354661350;
        Thu, 30 Nov 2023 06:31:01 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 5/5] xen/livepatch: properly build the noapply and norevert tests
Date: Thu, 30 Nov 2023 15:29:44 +0100
Message-ID: <20231130142944.46322-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231130142944.46322-1-roger.pau@citrix.com>
References: <20231130142944.46322-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It seems the build variables for those tests where copy-pasted from
xen_action_hooks_marker-objs and not adjusted to use the correct source files.

Fixes: 6047104c3ccc ('livepatch: Add per-function applied/reverted state tracking marker')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/test/livepatch/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/test/livepatch/Makefile b/xen/test/livepatch/Makefile
index c258ab0b5940..d987a8367f15 100644
--- a/xen/test/livepatch/Makefile
+++ b/xen/test/livepatch/Makefile
@@ -118,12 +118,12 @@ xen_action_hooks_marker-objs := xen_action_hooks_marker.o xen_hello_world_func.o
 $(obj)/xen_action_hooks_noapply.o: $(obj)/config.h
 
 extra-y += xen_action_hooks_noapply.livepatch
-xen_action_hooks_noapply-objs := xen_action_hooks_marker.o xen_hello_world_func.o note.o xen_note.o
+xen_action_hooks_noapply-objs := xen_action_hooks_noapply.o xen_hello_world_func.o note.o xen_note.o
 
 $(obj)/xen_action_hooks_norevert.o: $(obj)/config.h
 
 extra-y += xen_action_hooks_norevert.livepatch
-xen_action_hooks_norevert-objs := xen_action_hooks_marker.o xen_hello_world_func.o note.o xen_note.o
+xen_action_hooks_norevert-objs := xen_action_hooks_norevert.o xen_hello_world_func.o note.o xen_note.o
 
 EXPECT_BYTES_COUNT := 8
 CODE_GET_EXPECT=$(shell $(OBJDUMP) -d --insn-width=1 $(1) | sed -n -e '/<'$(2)'>:$$/,/^$$/ p' | tail -n +2 | head -n $(EXPECT_BYTES_COUNT) | awk '{$$0=$$2; printf "%s", substr($$0,length-1)}' | sed 's/.\{2\}/0x&,/g' | sed 's/^/{/;s/,$$/}/g')
-- 
2.43.0


