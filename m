Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E224989B21
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 09:15:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807023.1218196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svAd4-0008C4-E4; Mon, 30 Sep 2024 07:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807023.1218196; Mon, 30 Sep 2024 07:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svAd4-00089O-B4; Mon, 30 Sep 2024 07:15:34 +0000
Received: by outflank-mailman (input) for mailman id 807023;
 Mon, 30 Sep 2024 07:15:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yzc1=Q4=flex--ardb.bounces.google.com=3ElD6ZggKCdk5M86+BDOBJJBG9.7JHS9I-89Q9GGDNON.S9IKMJE97O.JMB@srs-se1.protection.inumbo.net>)
 id 1svAd2-0007Ms-Ud
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 07:15:32 +0000
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [2607:f8b0:4864:20::b4a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6ac2bd1-7efb-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 09:15:31 +0200 (CEST)
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-e2605ce4276so5055480276.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 00:15:31 -0700 (PDT)
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
X-Inumbo-ID: c6ac2bd1-7efb-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727680530; x=1728285330; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cfFkwKi7wORkaITTIVySWZ1TVCuKZibVqWlFRxA8TaE=;
        b=l4egizkhDIUtdL31EDmHqQ79Q+TNQkbr9PPPLCO5uRQzthIDLvscvDsSrsgHhM6QJG
         A6dAPV2DPsP0SM8nRplFQiAwAl4pl01SYt57BD0Hm6maOTTCgNtdXkv5zzseudxnzmwM
         3vbp0DSsIWv/2jrQmWhs2uJoP/5ieKyOcNWV+G7x/rGPBNmfIzFjZmJSLtHwLD2DKMOh
         rY/alWdDv4AaeiwDIHttRNZ+/+pWo25/ZaTxgHrTVJemuSZpWYlUD3eF+vnq5s09xIja
         5CxmAibUcFxguIoZznJWklouZAkb2LXFeXLZh41mjv3CkI1D0lYWA6dP7rtRDX0mKTat
         0Gmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727680530; x=1728285330;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cfFkwKi7wORkaITTIVySWZ1TVCuKZibVqWlFRxA8TaE=;
        b=R+6qWmA0DNfxPAZYRFcEaSoaluy8aKcGX4u38ra1SUFjQ/ofksRz0t56gtsq33E+sk
         yV/hV7pN31OhkuE0Rej+kv87wFhpEG5YZovsgBM9zhu5ak/lgaJBSwNKSfAnC3rZ1Vgy
         sCbVX1+kfDObkBM0+qqLIEQ6G9fY1FEE0ZRst1t3gdOUenXg8teqf3B7HQaB6I5HiUSk
         OsTiQoD3Gkzxnj+2G9mJvl6rs8KYIo7DTsDOcEuOb6TDqqCDB5+2ICCMhEQcGMseyyGt
         2QrMDtdb/PkiQfuUFZj2ccIypEUA/ug7gwjGgZsGoiR5n2Q3yoK5R5Uvz8ZyRvzPocPG
         sGGA==
X-Forwarded-Encrypted: i=1; AJvYcCWABUx/EnpFnbSFErqW51BmWltc2TeIiCfOKKkR6p8HgfnB7cGT+qa+HeI8XkjyABUoPFpyeKLViIc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNQrXTyq9XaFn6Io9LPLfdGUNlSQxstPPp7qXh7Q4EHgo0ym+6
	SfuxYr3ew0Kmz/XBBUwDImENtSWN1SyLhJUhKPY19VaUc/3ea5STZv+TbI9iRtms9iYk7Q==
X-Google-Smtp-Source: AGHT+IHlT3DMxohKe03A8TS0L1Z75WqAqi49LWkf8IAgG/1tHRvVHLfRdZ6a9GNwWISbp2f0lryrnggP
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a25:5105:0:b0:e0e:c9bc:3206 with SMTP id
 3f1490d57ef6-e2604b3e6b8mr7576276.5.1727680530050; Mon, 30 Sep 2024 00:15:30
 -0700 (PDT)
Date: Mon, 30 Sep 2024 09:15:16 +0200
In-Reply-To: <20240930071513.909462-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20240930071513.909462-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=866; i=ardb@kernel.org;
 h=from:subject; bh=XYVHEk+fyc+b419KXfVjv9/VU6bLywLl8KdcTe49YAY=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe1XAMvKaXsePbde5td+dfnhwmiXT5KtMpOUj2dUMoenF
 PtWLmnoKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABMxjWX4n/+KZ1mOY5Nuo17G
 w1N8j1fMPBPO8OCstkrBmZ0/Sus5axkZZtSdcld0/rF9HlvL4njeqq+1F5aYmnDrf7A/OrWtvjW CHQA=
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240930071513.909462-9-ardb+git@google.com>
Subject: [PATCH v2 2/5] x86/pvh: Use correct size value in GDT descriptor
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The limit field in a GDT descriptor is an inclusive bound, and therefore
one less than the size of the covered range.

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Tested-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/platform/pvh/head.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index ce4fd8d33da4..5a196fb3ebd8 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -224,7 +224,7 @@ SYM_CODE_END(pvh_start_xen)
 	.section ".init.data","aw"
 	.balign 8
 SYM_DATA_START_LOCAL(gdt)
-	.word gdt_end - gdt_start
+	.word gdt_end - gdt_start - 1
 	.long _pa(gdt_start) /* x86-64 will overwrite if relocated. */
 	.word 0
 SYM_DATA_END(gdt)
-- 
2.46.1.824.gd892dcdcdd-goog


