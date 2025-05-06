Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C676BAABD51
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 10:35:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976748.1363902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCDlK-0004PI-Oc; Tue, 06 May 2025 08:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976748.1363902; Tue, 06 May 2025 08:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCDlK-0004Lh-JJ; Tue, 06 May 2025 08:34:50 +0000
Received: by outflank-mailman (input) for mailman id 976748;
 Tue, 06 May 2025 08:34:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vx1h=XW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCDlJ-00041m-5V
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 08:34:49 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7bd8322-2a54-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 10:34:47 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39c1ef4ae3aso3159025f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 01:34:47 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a099ae0cd6sm12761237f8f.5.2025.05.06.01.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 01:34:46 -0700 (PDT)
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
X-Inumbo-ID: f7bd8322-2a54-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746520486; x=1747125286; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFdCdonHRi/V3I4AjrrMy18B5UWA7t/AwxBRWIfPBMg=;
        b=khONc6ytuiUIT1BJ+pmydxnoDLJL7xYURNcVYV2TPgZ+kQQYrgnV7nPCvNWEEsJDKB
         FrWEnKjvGNFAapErAI4FbOxLESigcYwLNPQZXOCKrqhxsUaKqyKP17ubHXRR57mcAydZ
         PqqHmwYdpuPo+z03OYgdLr5cf6myJk5bHkzGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746520486; x=1747125286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFdCdonHRi/V3I4AjrrMy18B5UWA7t/AwxBRWIfPBMg=;
        b=jE/A902WPABNkVH53gPSk1nXHu1TqYQGw5HRDgVoSIrMc16EVfuGvnHGqP2ufHV2wl
         JDI1Swi2+IQEea/OI8ReyFOmbBMzfTwn9cnyOr5B0qda71Z4kYNzqs66fCz6p00WJJ8U
         YyxETfElmBfmrGfww/0bDGhsG7wV90H0YA1O2QB96qUSAimuWotGjH9HR24vKIhCLQId
         MJ5LSK5bQ1rJLw2zPYaPDJno5R6XYcRcgbPR+xbTEGVDIqtvxgYPkPk1K6sQpQhaZwz5
         5rgmfEz8nTmETg0XEsdFmf4tMdAIdPup9GdLiApf5VKj0WNpYsjKUvh4KDMxeZvEL3wk
         RtjQ==
X-Gm-Message-State: AOJu0YxpOPyfkgRkCr+wU8TFIO5WLgPP3cHOv7HRInF9uygESwfnSGBp
	yGknYyTWbttDoEykmbHEG6PXALNRsLiU25QzEhi1lv4RJMnOl2rkn+aaoY/Sj2Y0z6d+Uvl2lZ7
	O
X-Gm-Gg: ASbGncvUUdHjYs0P8EJzdmWqPGkw67eir056azg5C/iqtWsljRlUdy3chGwUftpsrDl
	rBvqhFHzJEbBZEQX2qFc7DPqwyLnAhzRczHYt3/WAL53CDwH5ChZ0Bj7x00umvsOGCOSgfBdGGm
	HAkOeEzWSBUDNypouZg+Q0XtIsf23UzAST3p0boON8Tmi2U4yYD9BPjBGue2PkdsEwG/530MZk2
	eOcxHSM5cMyUanmLxvoWfpniOJ09Y3ytJZd/x5bQjihLRIRrkWTtlf33oYNprY8IOao6kJwlN3V
	k82ElcvRft0ffSwwm3VlIEVtMNHTtwk1353gBQiSMySXAA==
X-Google-Smtp-Source: AGHT+IEEJgMoX/Ygxj+QlDyIS89kjsS1lbFo+fjNJSn53rHstrrpDwm8RRtBETzoxMFmPHbFlEJ1/g==
X-Received: by 2002:a05:6000:2902:b0:39f:c05:c220 with SMTP id ffacd0b85a97d-3a0ab5b32bemr1901163f8f.22.1746520486355;
        Tue, 06 May 2025 01:34:46 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 2/9] x86/pv: fix emulation of wb{,no}invd to flush all pCPU caches
Date: Tue,  6 May 2025 10:31:41 +0200
Message-ID: <20250506083148.34963-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250506083148.34963-1-roger.pau@citrix.com>
References: <20250506083148.34963-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current emulation of wb{,no}invd is bogus for PV guests: it will only
flush the current pCPU cache, without taking into account pCPUs where the
vCPU had run previously.  Since there's no tracking of dirty cache pCPUs
currently, resort to flushing the cache on all host pCPUs.  Also as a
result of having no mechanism to broadcast a wbnoinvd instruction, resort
to emulating it using wbinvd behavior, which is more expensive performance
wise, but correct.

Fixes: 2f6070f0b988 ("Priv-op emulation in Xen, for RDMSR/WRMSR/WBINVD")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Note further patches will limit the broadcast cache flush to only pCPU
where the vCPU has ran.
---
 xen/arch/x86/pv/emul-priv-op.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 70150c272276..089d4cb4d905 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -1193,17 +1193,18 @@ static int cf_check cache_op(
 {
     ASSERT(op == x86emul_wbinvd || op == x86emul_wbnoinvd);
 
-    /* Ignore the instruction if unprivileged. */
-    if ( !cache_flush_permitted(current->domain) )
+    /*
+     * Ignore the instruction if domain doesn't have cache control.
+     * Non-physdev domain attempted WBINVD; ignore for now since
+     * newer linux uses this in some start-of-day timing loops.
+     */
+    if ( cache_flush_permitted(current->domain) )
         /*
-         * Non-physdev domain attempted WBINVD; ignore for now since
-         * newer linux uses this in some start-of-day timing loops.
+         * Handle wbnoinvd as wbinvd, at the expense of higher cost.  Broadcast
+         * the flush to all pCPUs, Xen doesn't track where the vCPU has ran
+         * previously.
          */
-        ;
-    else if ( op == x86emul_wbnoinvd /* && cpu_has_wbnoinvd */ )
-        wbnoinvd();
-    else
-        wbinvd();
+        flush_all(FLUSH_CACHE);
 
     return X86EMUL_OKAY;
 }
-- 
2.48.1


