Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2997FAE63C8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 13:45:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023613.1399607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU25q-0002i6-PJ; Tue, 24 Jun 2025 11:45:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023613.1399607; Tue, 24 Jun 2025 11:45:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU25q-0002fE-M0; Tue, 24 Jun 2025 11:45:38 +0000
Received: by outflank-mailman (input) for mailman id 1023613;
 Tue, 24 Jun 2025 11:45:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aTSQ=ZH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uU25p-0002f8-Ep
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 11:45:37 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be2bf8d6-50f0-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 13:45:36 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso221121f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 04:45:36 -0700 (PDT)
Received: from localhost.localdomain (253.226.6.51.dyn.plus.net.
 [51.6.226.253]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e81105f0sm1781157f8f.90.2025.06.24.04.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 04:45:35 -0700 (PDT)
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
X-Inumbo-ID: be2bf8d6-50f0-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750765535; x=1751370335; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lVyqVpj2wY8y5hqZjGDjJCe56r4pMVR0ASveM16L3g0=;
        b=SqMc1WPMuLmBOJWmCW1kROUeIBKgXFge9WlYQwU1djK8XB+FjtmOocn2c6AAIKm0KY
         MBtOy7mOcKNsuDlhClOuOWZi7gxq/6RyyuM+b/epj0M1whtP/EMsEAeyeqNjz8gh99td
         OnW6GxphxwzKwAWJrVS+RYyakbY1bzZh8GdOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750765535; x=1751370335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVyqVpj2wY8y5hqZjGDjJCe56r4pMVR0ASveM16L3g0=;
        b=KrnoTa+rmH1cXr5A6ghgXh20A0qmepdrh/s6clunza17aEpTQiRPrXCfeLviBQZUWW
         Q/pT3o4kmUqgU0XNBTEOPsAOcJk66/8mRpSP55sQiDK3a7uPmJEdNcIMNqCgWbCBctxo
         8EZnNlinEh5pJ/EHfpZOctvmdA3naDGARNd8tTtuitO6gNtXZREFrer8NbyXWmczgUMO
         t05OV5CPVdTfx8UK+PaCQkgH90ut0+4V5mQzf17C176C55E02FKf5QN0j19WZX+LFbGq
         QLjVTmFfOoWvba3/IlAPGQ31YWPRUJyNt7ouWnY79FNeHqt3bdP9toiLy7zqnlpjzdZ2
         hYxA==
X-Gm-Message-State: AOJu0YwfUYBZdS8l6pAT7V6Su9hcSP+SxhDVD2mO6PLI9b+ZAywLZIFU
	EhD9lqGhkAFuRn1T+/QoRFdoEpepwWL/Xb1cAYHXEFmtX+/WEEDRowR6fsoYFPTCQgZPt8i36kU
	5H2Gp2pOiVA==
X-Gm-Gg: ASbGncsyIc0xavkd0Zjq+Ais0fch9eJ/OcodjXACqgJQH6oayXmkBevV6rHUu4Hh3jR
	w62jBkk2ODjWxvQ7l1vjk8qOjstFQ0No31f6vxc9PT+olWyygl8T1pMafyFZe1TpfzJ4fd8LF0r
	Mox2PHqA3k8MdDE2PIC6UkGPBxie0RjFYfLf/LQfyxdS7GJ1zd24D0MrPkc7tGLZk97Jig33IZ6
	owDBfYbEaKkfyHzasMdcdcTojxgEfENBb7syUIBFl+cHM+oRrojDLxk/hRYoP00vLzx9+RimAwv
	owCmuzkOfK9LSdWRPUPlvuDwZlJw9ynveA3/y9GFS+0T+xkBfdvtj9j2fsFGL5x/vjx8bFzeDMY
	uB4i+OLtHpu376YJILixzp9byPpWmZA==
X-Google-Smtp-Source: AGHT+IGjo5UPM8nJJTYnA7I630aKGqBdSDjlyvu7EJU0isHFK2HqZkJnsu/yiGeT6a0v0SnTYP2X9A==
X-Received: by 2002:adf:9c8d:0:b0:3a5:2ec5:35ba with SMTP id ffacd0b85a97d-3a6d1322917mr10060924f8f.30.1750765535477;
        Tue, 24 Jun 2025 04:45:35 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] xen/efi: Do not undefine not defined macro
Date: Tue, 24 Jun 2025 12:45:26 +0100
Message-ID: <20250624114529.34743-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The "buffer" macro is not defined.

Fixes: 59e087bf6a9c ("xen/keyhandler: Drop keyhandler_scratch")
Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes since v1:
- fixed commit message;
- added Acked-by.
---
 xen/common/efi/boot.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 1a181ba933..c5625ccecf 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -556,7 +556,6 @@ static EFI_FILE_HANDLE __init get_parent_handle(const EFI_LOADED_IMAGE *loaded_i
     else
         *leaf = buffer;
 #undef BUFFERSIZE
-#undef buffer
 
     return dir_handle;
 }
-- 
2.43.0


