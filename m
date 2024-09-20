Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC9B97D3BB
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2024 11:37:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801079.1211123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sra4a-0000u2-Eq; Fri, 20 Sep 2024 09:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801079.1211123; Fri, 20 Sep 2024 09:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sra4a-0000r7-BX; Fri, 20 Sep 2024 09:37:08 +0000
Received: by outflank-mailman (input) for mailman id 801079;
 Fri, 20 Sep 2024 09:37:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wh1w=QS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sra4Y-0000Rx-SS
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2024 09:37:06 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e58a31f6-7733-11ef-99a2-01e77a169b0f;
 Fri, 20 Sep 2024 11:37:05 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a8d4093722bso252044266b.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Sep 2024 02:37:05 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9061331912sm819203566b.224.2024.09.20.02.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 02:37:03 -0700 (PDT)
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
X-Inumbo-ID: e58a31f6-7733-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726825024; x=1727429824; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Yw+McaTbOIDt285z9kIG0EGJl/eZichmUIvhOHqphI=;
        b=aaoCjCXp1M5mXqlYDZ79ape65lurR3hUnDqIVsritUlDOBM43P4lGOi+mbSVXxqz/I
         OQzH87SueuOH1R9gen1V4PV1ialuUXcuek7QNSWYSvTKLGbI7WrOGt0mCgWvjmUodjWM
         EZdV1zOpkW4EDW/9bDeL8399Y8RgqY8nOA9wU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726825024; x=1727429824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Yw+McaTbOIDt285z9kIG0EGJl/eZichmUIvhOHqphI=;
        b=W7uzdaEMO/zmQ3+SRKYLQD4dLEEL42P40TfmnuWk39LO8IC6IXITkUNX+UEUC8tzuU
         KvVxVRdqSxt8WxHZj1Jnjbkxq1es5fTRK6dU2StJpE5vivrurw/0KBQaq53oirf0K34Q
         vZcrH5JDydj5/tjnBYZposkAUqzj4HVEkObpBGM8X8GrE173z+UUnpaQibU3pJ/05ROC
         j6P6OXu5fsysq5TYMWoTEHQS128BC2Csy5oGmkEfC6sTKyahUCcBInCrhNyfYZgnjxu+
         lgFD1wGwzQyzeDHH12dPrSXXxLySmFmYTvSg/BY1EpJAaGsslG1HS3QNP515/Fa9c7ab
         Sayw==
X-Gm-Message-State: AOJu0YynDhjKOoi2kkxJJAOD4QZbGg+fXUJa5+qJlMVpWR4zQNGIEvui
	4LqU9NGVQIK8qGDzI8RBfcZmjtxKFvbc6ZVh8grG1173ed8tQj2DGqzSyM1JtQOu5HbrmZmgWYU
	h
X-Google-Smtp-Source: AGHT+IHsZ1A4NJ3WtcEZAJ45KM+h0JI0+1C4dofBl5M1N6nbvtufF6wlQnArm6URR76OaFCB6oMAig==
X-Received: by 2002:a17:907:f7a7:b0:a90:3498:93b2 with SMTP id a640c23a62f3a-a90d55e1be5mr160689466b.1.1726825024166;
        Fri, 20 Sep 2024 02:37:04 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 2/3] xen/livepatch: do Xen build-id check earlier
Date: Fri, 20 Sep 2024 11:36:54 +0200
Message-ID: <20240920093656.48879-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920093656.48879-1-roger.pau@citrix.com>
References: <20240920093656.48879-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The check against the expected Xen build ID should be done ahead of attempting
to apply the alternatives contained in the livepatch.

If the CPUID in the alternatives patching data is out of the scope of the
running Xen featureset the BUG() in _apply_alternatives() will trigger thus
bringing the system down.  Note the layout of struct alt_instr could also
change between versions.  It's also possible for struct exception_table_entry
to have changed format, hence possibly leading to other errors.

Move the Xen build ID check to be done ahead of any processing of the livepatch
payload sections.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/livepatch.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index cea47ffe4c84..3e4fce036a1c 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -767,6 +767,11 @@ static int prepare_payload(struct payload *payload,
     if ( rc )
         return rc;
 
+    /* Perform the Xen build-id check ahead of doing any more processing. */
+    rc = xen_build_id_dep(payload);
+    if ( rc )
+        return rc;
+
     /* Setup the virtual region with proper data. */
     region = &payload->region;
 
@@ -1099,10 +1104,6 @@ static int load_payload_data(struct payload *payload, void *raw, size_t len)
     if ( rc )
         goto out;
 
-    rc = xen_build_id_dep(payload);
-    if ( rc )
-        goto out;
-
     rc = build_symbol_table(payload, &elf);
     if ( rc )
         goto out;
-- 
2.46.0


