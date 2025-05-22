Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3378AC0D89
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 16:04:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994038.1377091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI6Wu-0005le-NM; Thu, 22 May 2025 14:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994038.1377091; Thu, 22 May 2025 14:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI6Wu-0005im-JS; Thu, 22 May 2025 14:04:16 +0000
Received: by outflank-mailman (input) for mailman id 994038;
 Thu, 22 May 2025 14:04:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GVKv=YG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uI6Wt-0005FJ-2D
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 14:04:15 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3fd8eab-3715-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 16:04:13 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a37a243388so3013307f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 07:04:13 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a35ca5a7cbsm23663863f8f.35.2025.05.22.07.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 07:04:11 -0700 (PDT)
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
X-Inumbo-ID: a3fd8eab-3715-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747922652; x=1748527452; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AtChMzwK5++U3Ymy4zTRlMVtRVgKCf/lu2BCXNEbl+o=;
        b=HutKwm5YkmDHOKtirX2SGvDRUM2yxYBpZy0cF8+YmrGPnAsGBcZT0cV5FzwXDpSJqi
         Rcdk/79se3EzvL2282NTz36HySTE0XQwLOol4VKRHmoOUtBacxrqbKNl5kFUEGZxDI+b
         WuVOsIElzfZIdEz7/mWWOWXbAfEm2ensjZgzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747922652; x=1748527452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AtChMzwK5++U3Ymy4zTRlMVtRVgKCf/lu2BCXNEbl+o=;
        b=UswjwW3WRx8LoFHRn4WvUlR17xZ0zm3zfaVXtpiM3BKs7wyrZPuKarfGkE9FMH2AW+
         5r7AKjHQCFQZLs3QrR9uTu4Y+mRtTBNERctXtsxi9PRflxpf6B6o0s2I4ujq8Mc/9I5G
         1PKSeSeO3nY3LiWPhA+SdKP0wpnazcQwAIlR9zHcCaJ1deDrPurp/mNJH9eIlINjAYFx
         p6aSwO95Aer3TNPgclWgqpHguwoQ7lAVtBgxPSjTFWUHkB3CFIcyzlR+YcEaZUWOlbdT
         PY9SsL8L8v2MYiY4+M81bJ6I7SLT8KIpog4tGfS9xk4vYFwWjdTGn9CU7SdpLFr4zR+i
         cNiA==
X-Gm-Message-State: AOJu0YzQu5A/t8IZRm28TaOOqzvDO/qSWoEQWr+p3lq8112TOAsVPAAj
	vPGopeIwggSvk830tJeEYi/KOu/f6zCR2uBI86s/DPj6b3LjD61FVxD1MTumcN1vzn9MOFFxdU3
	LfB4A
X-Gm-Gg: ASbGncv8ycQvl7gGplI+dfbvOTQKTIEwvt/ibmtSp2ZtGje+0texSo7MiAengU8OJng
	kzlhRJ54t6VWVwO9qP95gLgJyRPYGfQ3JNtMYNBw/fIxqDeQw7j5ZPDV7L1/kjvIy1/BqeGcZZY
	ATXiN2USqIIFi38Fh1gjIpDfNoppjkX4yQrZiiKMa/TDF3amzTNlQvKnF9vVMGymPtF+aPOTqnF
	G89bhuPGkw3vawSqCpGeYhI22gMwctuG8EdtTmuftAp6sTUNFlTM5tsceoU2YB2LyIEFhMkeEYt
	HQr8vyQV6b+8oquft3/anN/6CkZE0u98bGg8K/8A+6jK4omyzbRB2Cu1lBuXZLaPO/B95TQWHxn
	YZFICyVKBUTjBWMOwvB0=
X-Google-Smtp-Source: AGHT+IEQSmb2g2Tp5adBDx1cXodRHDdoZCyJp+7sZXMZRxMGwnl4cqfYrfNVxG+DHBoMHXMs2rQN7Q==
X-Received: by 2002:a05:6000:400f:b0:39f:175b:a68d with SMTP id ffacd0b85a97d-3a35c808b3dmr22770652f8f.11.1747922652530;
        Thu, 22 May 2025 07:04:12 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 2/2] x86/vpci: refuse to map BARs at position 0
Date: Thu, 22 May 2025 16:03:56 +0200
Message-ID: <20250522140356.5653-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522140356.5653-1-roger.pau@citrix.com>
References: <20250522140356.5653-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A BAR at position 0 is not initialized (not positioned).  While Xen could
attempt to map it into the p2m, marking it as mapped will prevent dom0 to
change the position of the BAR, as the vPCI code has a shortcomming of not
allowing to write to BAR registers while the BAR is mapped on the p2m.

Workaround this limitation by returning false from pci_check_bar() if the
BAR address is 0, thus causing the bar->enabled field to also be set to
false and allowing bar_write() to change the BAR position.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/pci.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
index 26bb7f6a3c3a..39fd5a16a4aa 100644
--- a/xen/arch/x86/pci.c
+++ b/xen/arch/x86/pci.c
@@ -101,6 +101,15 @@ int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
 
 bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
 {
+    /*
+     * Refuse to map BARs at position 0, those are not initialized.  This might
+     * be required by Linux, that can reposition BARs with memory decoding
+     * enabled.  By returning false here bar->enabled will be set to false, and
+     * bar_write() will work as expected.
+     */
+    if ( mfn_eq(start, _mfn(0)) )
+        return false;
+
     /*
      * Check if BAR is not overlapping with any memory region defined
      * in the memory map.
-- 
2.49.0


