Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D61B98DF15
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 17:27:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808904.1221024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw1GS-0000kz-C8; Wed, 02 Oct 2024 15:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808904.1221024; Wed, 02 Oct 2024 15:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw1GS-0000g7-5g; Wed, 02 Oct 2024 15:27:44 +0000
Received: by outflank-mailman (input) for mailman id 808904;
 Wed, 02 Oct 2024 15:27:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VgkK=Q6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sw1GQ-00070n-E7
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 15:27:42 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd84ee6f-80d2-11ef-a0ba-8be0dac302b0;
 Wed, 02 Oct 2024 17:27:42 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5389917ef34so8060512e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 08:27:42 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c299ac8esm880024566b.222.2024.10.02.08.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 08:27:38 -0700 (PDT)
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
X-Inumbo-ID: dd84ee6f-80d2-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727882861; x=1728487661; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lEtOt7sJb/gqHGmXN1HeKQkSgPlz46zJUquNaFSqHg=;
        b=IbFFFTol0BkenkkcaEl9GD18KalA1qN950jkkIiCGZBZLpQ1CgdChHaWMFoZ98poQa
         Msg/0RAktQZsO+mqeNsa6rbEAqKYE1dRSC36c+ySkBCSVc31UiHPp3aV5fiWH4VbVKt/
         CmmZGLHLJqkzarLYyH+TXX22F2LRE6T6idtSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727882861; x=1728487661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5lEtOt7sJb/gqHGmXN1HeKQkSgPlz46zJUquNaFSqHg=;
        b=H32bKwzqbi61V65LLz099JrvCCu+s2SIoJNNmFYfihgmDn3mKcn4CRp/QroRqFlueH
         /DoaTLixsBBLYYGR157uZ0OO2Aj2VDTLDK1ChEISli7RrPReraVX51OZaqWjZ+QYL6oC
         bO7dFbz2mXGJ3L37Pf01gw/+s5V0vwKIhQaLecRO/aXuAT2KJpUu/X0/6+gV+31KZMTq
         Msalk85ynxWKmDSnUsbSIzATv3KE6GOAdkFxxIez8X3H9Y7vOGpRzD9yTHEZx0K5Qmof
         pMhsmMaoi1GsVvJUk0qxUNUSqnVsbXhkjMKD/OtyaUUMM0VgGAgQ8f4gNbP+VW9IyZhl
         8a0w==
X-Gm-Message-State: AOJu0Yxpn9LAlznVmOAjrmQdYINIwPYX+ABVfgQohZw8zyyHHlqaXrxY
	8agYCsc+OeTehIHBcY6kzBqBUDv2QF17IJ6lu6Ow/PPFnWRZWRLe3gn+TU8XwDnpPSnRxyabwJ9
	C4qg=
X-Google-Smtp-Source: AGHT+IFMz20lzYRyDTFBCZuZGX8TbKWpGePrGdiPdDMdq/Mk7wnanI7JzKks4Wc91CB+zV8GtQaQpg==
X-Received: by 2002:a05:6512:2245:b0:535:6cde:5c4d with SMTP id 2adb3069b0e04-539a065c3e0mr2158383e87.3.1727882860654;
        Wed, 02 Oct 2024 08:27:40 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 5/7] x86/alternative: Replace a continue with a goto
Date: Wed,  2 Oct 2024 16:27:23 +0100
Message-Id: <20241002152725.1841575-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241002152725.1841575-1-andrew.cooper3@citrix.com>
References: <20241002152725.1841575-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A subsequent patch is going to insert a loop, which interferes with the
continue in the devirtualisation logic.

Replace it with a goto, and a paragraph explaining why we intentionally avoid
setting a->priv = 1.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/alternative.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 5ea7f51b007c..b745f112154a 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -328,7 +328,15 @@ static int init_or_livepatch _apply_alternatives(struct alt_instr *start,
                         buf[4] = 0xff;
                     }
                     else
-                        continue;
+                    {
+                        /*
+                         * The function pointer we're wanting to devirtualise
+                         * is still NULL, and we're not sealing yet.  Leave
+                         * the alternative fully un-processed, in order to try
+                         * again next time around.
+                         */
+                        goto skip_this_alternative;
+                    }
                 }
                 else if ( force && system_state < SYS_STATE_active )
                     ASSERT_UNREACHABLE();
@@ -343,6 +351,7 @@ static int init_or_livepatch _apply_alternatives(struct alt_instr *start,
 
         add_nops(buf + a->repl_len, total_len - a->repl_len);
         text_poke(orig, buf, total_len);
+    skip_this_alternative:;
     }
 
     /*
-- 
2.39.5


