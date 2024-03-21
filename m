Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 327ED8857C8
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 12:06:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696331.1087208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnGEs-0001eD-Bl; Thu, 21 Mar 2024 11:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696331.1087208; Thu, 21 Mar 2024 11:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnGEs-0001ax-74; Thu, 21 Mar 2024 11:05:38 +0000
Received: by outflank-mailman (input) for mailman id 696331;
 Thu, 21 Mar 2024 11:05:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbdV=K3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rnGEq-0001ar-UU
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 11:05:36 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0be5665-e772-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 12:05:34 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4146a1ac117so5114985e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 04:05:34 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 q18-20020adff792000000b0033ec9b26b7asm16943227wrp.25.2024.03.21.04.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Mar 2024 04:05:33 -0700 (PDT)
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
X-Inumbo-ID: f0be5665-e772-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1711019133; x=1711623933; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0RtmqqzFd4YUtX95+8cJsuMlOVlknAi1XayUzUdt2k=;
        b=cISF5faALJ6IRD1WaDsUMTc4y040Qh8DVscH3aBH038IIvyQRYnIAk5L0rsgFCZYHo
         jvn70fmnjbv7touRRM1lwfGmeb8I12aYKtuj2GEqG9BLbtpWCeGHPDHmBCk2p2cVEfDu
         SNx/hLSNRs3hBX3cODZzC3fN/uU+nTfTb/UAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711019133; x=1711623933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0RtmqqzFd4YUtX95+8cJsuMlOVlknAi1XayUzUdt2k=;
        b=ipDtM0qjoV9ap6Iz0vyCYLqkrwBN0LfKj4zMHtgoOuRMFPr4RbZv4MC0g2Yd1knb0I
         B3r2JnF5PbUgJkXTJegnWEpikSNNSZHdG2ske5cBt207Stk5auQj4ssHuD0ylIJDAUNC
         va9BztloKfhM4D2b5AroiATrgA4e1Oj6/Hqwv2j98mYH2eSivRsf0OprZ7yqZP7b5IrH
         vDRErFRcONioz6PmGoeLiS4LRPInEMv1ieVFhmhMCC9H18IGTUfq0lB6cXLXWvxbSyOS
         qNXHd8CFoz8k+crvTPrUHR0q057AGSpXxdWLc96M0n7fxvUvsfRok6GuG7XomSowqDif
         H6cw==
X-Gm-Message-State: AOJu0YzsPyvXVVVqylpRqJjKwzaB2EpZP2jFpoba4iPiuaF4NsZ4Pv+g
	+9VxXW6MNVw4qbDFDgv49Duv1Vfzeg0ZCbhQbsKXOpvXALm/4NvzrZabNb1qlRwxVPLHoRTeas5
	4
X-Google-Smtp-Source: AGHT+IGewDTEX5eCSP+WcLGjdD9PesY412II1Kwnpspv5QujOnEl8L9XgUrrHyPfl1vyfJM1XPIzXw==
X-Received: by 2002:a05:600c:3149:b0:413:fdc2:d9da with SMTP id h9-20020a05600c314900b00413fdc2d9damr2144437wmo.12.1711019133582;
        Thu, 21 Mar 2024 04:05:33 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/console: add comment about external console lock helper
Date: Thu, 21 Mar 2024 12:05:03 +0100
Message-ID: <20240321110503.72916-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current console_lock_recursive_irqsave() implementation is not speculation
safe, however it's only used to prevent interleaved output.  Note this in the
function declaration in order for callers to be aware of the limitation.

No functional change.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/include/xen/console.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/include/xen/console.h b/xen/include/xen/console.h
index 68759862e88d..6dfbade3ece3 100644
--- a/xen/include/xen/console.h
+++ b/xen/include/xen/console.h
@@ -20,6 +20,7 @@ void console_init_postirq(void);
 void console_endboot(void);
 int console_has(const char *device);
 
+/* Not speculation safe - only used to prevent interleaving of output. */
 unsigned long console_lock_recursive_irqsave(void);
 void console_unlock_recursive_irqrestore(unsigned long flags);
 void console_force_unlock(void);
-- 
2.44.0


