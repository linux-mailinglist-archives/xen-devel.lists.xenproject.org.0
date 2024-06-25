Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 981AD916974
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 15:52:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747740.1155285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM6ah-0000TU-DH; Tue, 25 Jun 2024 13:52:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747740.1155285; Tue, 25 Jun 2024 13:52:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM6ah-0000Mp-2f; Tue, 25 Jun 2024 13:52:11 +0000
Received: by outflank-mailman (input) for mailman id 747740;
 Tue, 25 Jun 2024 13:52:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sI+y=N3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sM6af-0006cc-8S
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 13:52:09 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d53011f-32fa-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 15:52:08 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a725282b926so310375266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 06:52:08 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf560627sm521042666b.148.2024.06.25.06.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 06:52:07 -0700 (PDT)
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
X-Inumbo-ID: 1d53011f-32fa-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719323528; x=1719928328; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jEpERKbIeLIcrdrPaGfmWPlnxuIgAzhJqctJSX0ZEE=;
        b=iLMINnuNJjAyveQZ6kbruV3Gw6d0HEvs/IvtN1/YbNFATWdeeaAJT5r5flQ6SMml1a
         AjDTQ+VWFI/or5LYV5Ll2ooJZ5IXX9S+TbLQrxzQ5rBzsJ55Wsy8ZvtC2SVDCeSQBgII
         C7+wa1IccIy7BTo2NqP2KTd6PFZXFcf/dHc1c2gw3ahkZSV1IOBjwOUE3RDXqnj8HLAI
         7jiGfF84VC7IqZZDAtfHvgXEgyYipfThMgAiblnUVTjfd1Kx4PQ6rrPRQ0MFljCKfFIW
         BikEwQkjKzJyQivp8rrIrsH8IXFAmgRN23gbXbqd6q1jkS7FXWqeRTA6E3NaSPCxxDll
         /fQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719323528; x=1719928328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3jEpERKbIeLIcrdrPaGfmWPlnxuIgAzhJqctJSX0ZEE=;
        b=CXcYiRFbMzs1c1a/2d+ptt1Q9SeWIeVn0cQpU1TeqGc5sfBYVGTkMSz9Dla7c4BbDz
         704XxBb17XaiwXFviaHo0flinGGesFnwUu+I3lu4uco//gwRAlLOW0IDwJhGHR5oc+gA
         Tu1k/Y34fp3SB5/O/4t/zJgAL9L4RnIhbEZtaVBceme+hGFxRA23Lv4y/jWzx50RqOrc
         tLpkr8snXPjVOYTxhirdAEwZ5z+5K8BpmLd1cnqDLG7IEI5D3IVL77oSWUbrFvu9g0GS
         McWTIOznwfVYZEVBsBr/e+26/EuQ++5mWUBQOx40r7tM1lkLhe4rrybGBQbNXRvVeLx0
         GLdA==
X-Gm-Message-State: AOJu0YwjuZ2VDW+0lslFFXYmJiNWpvGzXouGzJtYFMqoeu+iyPaZ9+vD
	uVq3b0VitD+l4+Podfiqa0xGEupyoEGJWADwb/7Y/8vVGpBCW15ta/U3KP+P
X-Google-Smtp-Source: AGHT+IHn4l2awNVb//uMg4A4C7V4b9RleGetFINhGc0xQMysSLqYLmieB0t3yGy8Dc4SoNd0L1EqbQ==
X-Received: by 2002:a17:906:1cd0:b0:a6f:bae6:f56c with SMTP id a640c23a62f3a-a7245c85b84mr456988166b.3.1719323527990;
        Tue, 25 Jun 2024 06:52:07 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v13 10/10] xen/x86: drop constanst_test_bit() in asm/bitops.h
Date: Tue, 25 Jun 2024 15:51:52 +0200
Message-ID: <edd341a6e86ceac2717c59680d4e5e7fc3321b5d.1719319093.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1719319093.git.oleksii.kurochko@gmail.com>
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

constant_test_bit() is functionally the same as generic_test_bit(),
so constant_test_bit() can be dropped and replaced with
generic_test_bit().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 Changes in V13:
  - new patch ( this patch is dependent on
    xen: introduce generic non-atomic test_*bit() )
---
 xen/arch/x86/include/asm/bitops.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index f9aa60111f..8c0403405a 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -277,12 +277,6 @@ static inline int test_and_change_bit(int nr, volatile void *addr)
     test_and_change_bit(nr, addr);                      \
 })
 
-static inline int constant_test_bit(int nr, const volatile void *addr)
-{
-    return ((1U << (nr & 31)) &
-            (((const volatile unsigned int *)addr)[nr >> 5])) != 0;
-}
-
 static inline int variable_test_bit(int nr, const volatile void *addr)
 {
     int oldbit;
@@ -297,7 +291,7 @@ static inline int variable_test_bit(int nr, const volatile void *addr)
 
 #define arch_test_bit(nr, addr) ({                      \
     __builtin_constant_p(nr) ?                          \
-        constant_test_bit(nr, addr) :                   \
+        generic_test_bit(nr, addr) :                    \
         variable_test_bit(nr, addr);                    \
 })
 
-- 
2.45.2


