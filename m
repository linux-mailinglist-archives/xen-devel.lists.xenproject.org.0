Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D99B22B88
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 17:19:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078828.1439860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulqms-0000Q3-N8; Tue, 12 Aug 2025 15:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078828.1439860; Tue, 12 Aug 2025 15:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulqms-0000NK-JQ; Tue, 12 Aug 2025 15:19:42 +0000
Received: by outflank-mailman (input) for mailman id 1078828;
 Tue, 12 Aug 2025 15:19:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ysgX=2Y=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1ulqmr-0000N9-0n
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 15:19:41 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3f4359f-778f-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 17:19:40 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-459e1338565so52542995e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 08:19:40 -0700 (PDT)
Received: from localhost.localdomain ([87.114.69.104])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3ac51asm45600090f8f.1.2025.08.12.08.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 08:19:38 -0700 (PDT)
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
X-Inumbo-ID: c3f4359f-778f-11f0-a327-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1755011979; x=1755616779; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B6BPOciZ41jdzwaS+oIgHfhtkYMYHeNYwaWDWKleqGE=;
        b=MNC2Zv/QE+y2t8vydtZffYlc3U07GkylEG7GT0JfiN6A9VJ4outi1Nm2uLvX7CbnZS
         YLYh7qC2/VxnTze4pYxqUf+oCCEVzdZzT2tj4fZBTvQl0AxEr7bcvzxZH/RA0gVb9fOV
         B0UMTakN5f/EOW0iiEvhRXw1Jz5qfNNZyFsYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755011979; x=1755616779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B6BPOciZ41jdzwaS+oIgHfhtkYMYHeNYwaWDWKleqGE=;
        b=poS1C1Fzp3Ozf0C+N7xS6CXyJnFLslCP03UB9fAE2OoOhGKpYd64oSvBw0fLwXUS/b
         7pF1+3dbBIVmm94IlDRDvFtrGxaWW/zOj29ASmF8nah/TMrGr1pIxg5F5TAS4WTW1Pc6
         V4bbTBBZwc6zjUiiLq2CGKxzmCg92qvC1ZQPLhSqpBMC++zLuWcZzEVTKE6EXncO6km6
         AzJNZNgFpwrT+3wHfTPw7HxwNGlUvXOXqfp4zhbHtzAng1jOjhiX80fsfn8hETx/CuBZ
         dAq0NFti+ibc8wNVF/3b28SOxMdz5uXnV5A8bRlSMJV/VWREXLoCg2a/kIW9RHeCUc1u
         5p0A==
X-Gm-Message-State: AOJu0YxaqYArUh1fxa/8Sws4+Mzd1CUoogGpDj/9sP7Qw2WHLqCt/2Li
	elco08KSQRmJ9qJyuqq4f0MnUISoLSJXCxHHSoTRkVxHgz1tgK890E1QQzhh5Db/Fi7b01duuYj
	/nvxXo2Y=
X-Gm-Gg: ASbGncsnEh/MQuNMJK7L65WbHp7LTxCz40TC8R3Hzr7ltZ+BRei5nG777/75MqtPjAP
	Gezk3RLqKbTKviFZUm9m7vhVuadCA3kijW+BMRi4UMZ6J6zRrLF31ZJT+edkBQnZEC6FQu9yadS
	Bc8+uDzibKf6j2uOLZXjjjNeQY6nQgQV5ogC3ynz+EXJ8xi369LelnlQA82gGuAhmC0nirgu0u3
	Poq0ahiMNaVwmKooP0pgSWzWebFzhweNwC5agox0rEMiToDepnwAFDks9v+bwsJB0sUBflyOXQf
	Soh6+DetmHRzHbu6ES15jpbRPKcfUtB/kkc1P7mnijKVbnaadGt+4fYxjVR55XuCDyQ6pp1IAPf
	jkBqQPvxCmHTARrYaJ8Rxp71Gr4NpZoLNBVcCz+jc0mZolQQbCKbp
X-Google-Smtp-Source: AGHT+IHUl/R4Rp9eeiywIRtYcqIPk90a+VSgojhER703Ql1VvheWY3jg/0I4D6kwo0gSEaLAEYKHcA==
X-Received: by 2002:a05:6000:2c03:b0:3b7:8832:fde5 with SMTP id ffacd0b85a97d-3b900b4d7f2mr13111540f8f.13.1755011979185;
        Tue, 12 Aug 2025 08:19:39 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/boot: Remove unused symbols from linker script
Date: Tue, 12 Aug 2025 16:19:20 +0100
Message-ID: <20250812151923.96832-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The symbols declared with DECLARE_IMPORT are meant to be
used by the 32 bit code.
The __base_relocs_{start,end} symbols were not used by the
code.
No functional changes.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/build32.lds.S | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/arch/x86/boot/build32.lds.S b/xen/arch/x86/boot/build32.lds.S
index 1e59732edd..e4f7c7fc2f 100644
--- a/xen/arch/x86/boot/build32.lds.S
+++ b/xen/arch/x86/boot/build32.lds.S
@@ -43,8 +43,6 @@ SECTIONS
          * Attention should be paid to pointers taking care of possible later
          * relocation.
          */
-        DECLARE_IMPORT(__base_relocs_start);
-        DECLARE_IMPORT(__base_relocs_end);
         DECLARE_IMPORT(__trampoline_rel_start);
         DECLARE_IMPORT(__trampoline_rel_stop);
         DECLARE_IMPORT(__trampoline_seg_start);
-- 
2.43.0


