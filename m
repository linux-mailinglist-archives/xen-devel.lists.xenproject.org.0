Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA8B8AD3BA
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 20:15:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710194.1109323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryyBf-0000tL-Dw; Mon, 22 Apr 2024 18:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710194.1109323; Mon, 22 Apr 2024 18:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryyBf-0000oY-6u; Mon, 22 Apr 2024 18:14:43 +0000
Received: by outflank-mailman (input) for mailman id 710194;
 Mon, 22 Apr 2024 18:14:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/m7Q=L3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ryyBe-0000IX-6f
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 18:14:42 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ffeed76-00d4-11ef-909a-e314d9c70b13;
 Mon, 22 Apr 2024 20:14:41 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a55ab922260so203926466b.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 11:14:41 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 z15-20020a170906668f00b00a51d073da7esm5994224ejo.82.2024.04.22.11.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 11:14:39 -0700 (PDT)
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
X-Inumbo-ID: 2ffeed76-00d4-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713809680; x=1714414480; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FaF1+jq0lOG0Zt+SDR+w7NABaf8lTc4H+2KHEf8aMyg=;
        b=BJFT2JallZ/j//2MXYLr2gSSAMRBSs91NowYyRZw2r13Q85exIpfAnABt4KqaiUoV9
         0Vg30zKnMkh7CSHkaXkjpQmHLqMv/eMn/dG6qDzr4n7wIL8+9NM4h8tNpEpACGpMMUVi
         2IF4ZFViGMHFOKUmCUZNq3Cab7WnNgcCkC+bU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713809680; x=1714414480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FaF1+jq0lOG0Zt+SDR+w7NABaf8lTc4H+2KHEf8aMyg=;
        b=JZuVlHWOy8PWnTFXnKhTy85wWu56b2o6nIHlo7rLskynZ+KP2v3B00CjHAttAzd7wo
         g2SFKt70VgrhytUxHDVEuATy1lCw0vy0cNBiOqfWwuaCUZRO5CXqBzVzavjp7EXWLHdL
         qcB5YpHWdt9JPbd9DryaGaWOGs3S0LzhrYBBAcJpaIRuvyV5gIA+jhPKISlxPrz6rWfE
         pfiJe9P9Vs8gH/NHOke4iblbd+VkQKHfYaqOj7V/bIiP3z2njEL0aXfcQkvHAWzeQx29
         H6i7pvn0a8sjNZ3V2Kj7jmuP9ztHBSEzl7VsclLlVXPR6K1aBJpFRCEQy5WH11SeFSxT
         K2Ng==
X-Gm-Message-State: AOJu0Yy80mRYXNI8DOw+y1h1t3mqlIhPVyK2Egz8VlOk/pcRpgke57Qu
	kY0z5d+/Y8RkiBRK1rRQSwvocAhdEN8BXh8VAqxELbsluSXH/jB/LbpLnT42H0vm83EgjLyz+sn
	ZRr4=
X-Google-Smtp-Source: AGHT+IHmqFdmdVeYAFVG6c/DuwA7Wp3vBh4M41S2ewoBL7esKFiKG2mvjUAjL/oIHx92bkOiFta4Xg==
X-Received: by 2002:a17:906:1d47:b0:a58:7507:d4ed with SMTP id o7-20020a1709061d4700b00a587507d4edmr440811ejh.15.1713809680447;
        Mon, 22 Apr 2024 11:14:40 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 4/6] x86/alternative: Replace a continue with a goto
Date: Mon, 22 Apr 2024 19:14:32 +0100
Message-Id: <20240422181434.3463252-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240422181434.3463252-1-andrew.cooper3@citrix.com>
References: <20240422181434.3463252-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A subsequent patch is going to insert a loop, which interferes with the
continue in the devirtualisation logic.

Replace it with a goto, and a paragraph explaining why we intentionally avoid
setting a->priv = 1.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/alternative.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 2ca4dfd569bc..c86ea235e865 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -308,7 +308,15 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
                         buf[4] = 0xff;
                     }
                     else
-                        continue;
+                    {
+                        /*
+                         * The function pointer we're wanting to devirtualise
+                         * is still NULL, and we're not sealing yet.  Leave
+                         * the alternative fully un-processed, in order to
+                         * process it the next time around.
+                         */
+                        goto skip_this_alternative;
+                    }
                 }
                 else if ( force && system_state < SYS_STATE_active )
                     ASSERT_UNREACHABLE();
@@ -323,6 +331,7 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
 
         add_nops(buf + a->repl_len, total_len - a->repl_len);
         text_poke(orig, buf, total_len);
+    skip_this_alternative:;
     }
 
     /*
-- 
2.30.2


