Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B943E8671D3
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 11:49:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685438.1066155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYXD-0004M1-F0; Mon, 26 Feb 2024 10:48:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685438.1066155; Mon, 26 Feb 2024 10:48:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYXD-0004Jo-CM; Mon, 26 Feb 2024 10:48:35 +0000
Received: by outflank-mailman (input) for mailman id 685438;
 Mon, 26 Feb 2024 10:48:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FdVt=KD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1reYXB-0004Ji-Uq
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 10:48:33 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94f8aea2-d494-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 11:48:31 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a3ddc13bbb3so425934466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 02:48:31 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 m16-20020a1709061ed000b00a3d99415705sm2294599ejj.73.2024.02.26.02.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 02:48:31 -0800 (PST)
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
X-Inumbo-ID: 94f8aea2-d494-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708944511; x=1709549311; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8zVpDwchDEJOfDQ6FiF4/+UrPVWrsLuWj02A8p+uBQ=;
        b=Ejnf7BEZWFZ0eOLgrkikIDr8D0ceQ1+LwPKrNmic0Kp0JoQJL58s3QUl9J/Ry9V5XS
         hCzPhG3+rGyz1XUwt166RXTHcQMsFe4Lmfi4tAGcMWLYMEesdqc+Aw+fzTvSx0MbGbo9
         DLqTnEUMsuezY7BvBAXCPgZMf4+kuLezMo9kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708944511; x=1709549311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q8zVpDwchDEJOfDQ6FiF4/+UrPVWrsLuWj02A8p+uBQ=;
        b=VedqTQKZ4DHSeByDmwCPqgZqToEwqSkk92ncOrjzRYcFX5DuyYnDBHhIQwQTPXVwBx
         RHvdfGBX8guWXbJLd81giUa2cdc85+fXc+hIeo3tttoAnMc7RWuetREuVWU9wEgkTx79
         FgAlZqkR/gTVzJI6fhHKJF1c0RLeBzsgYoo8/Rqb/o9tXiuFjvrbxWPiB94HbIcyqEjs
         5Hrgvkrsx83WXkSqZIXE+2F0JY0U6QgjA5UnUSuj4LGVuN4jRibYdMOOHxsjIlna0UT7
         34cUA4pUnJI8K6U0i0P8XX9PrY10K7HLI2HnSuNxtxsjXa+/Zktt/BBc+gIGOZOXkYHF
         YkWg==
X-Gm-Message-State: AOJu0YwXXRR2fG2EZk+zMW1L3L/oQ0EZ9AZdAwEMh39SmsrUDO5azXv+
	WMsBfaU0kGaMG7KFV1bZ//Y5fovMrSZQqsXRR/Ar20NubRIyiyE/hvUMw2rXoKgYZAfdESBd0CS
	H
X-Google-Smtp-Source: AGHT+IE0dfRmVXZQ1UyuFMvRkiWjqXqO1MUL/BEfX2Ra1lI8bXduWYRqnPBjMC6mdzYFg9S38B5W1w==
X-Received: by 2002:a17:906:bc54:b0:a3f:c736:526d with SMTP id s20-20020a170906bc5400b00a3fc736526dmr5285610ejv.31.1708944511338;
        Mon, 26 Feb 2024 02:48:31 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Rob Hoes <Rob.Hoes@citrix.com>
Subject: [PATCH] tools/oxenstored: Re-format
Date: Mon, 26 Feb 2024 10:48:29 +0000
Message-Id: <20240226104829.1044479-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rerun make format.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: Edwin Török <edwin.torok@cloud.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
---
 tools/ocaml/xenstored/quota.ml | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tools/ocaml/xenstored/quota.ml b/tools/ocaml/xenstored/quota.ml
index 1f652040d898..082cd25f26fc 100644
--- a/tools/ocaml/xenstored/quota.ml
+++ b/tools/ocaml/xenstored/quota.ml
@@ -55,13 +55,13 @@ let _check quota id size =
     raise Data_too_big
   );
   if id > 0 then
-  try
-    let entry = DomidMap.find id quota.cur in
-    if entry >= quota.maxent then (
-      warn "domain %u cannot create entry: quota reached" id;
-      raise Limit_reached
-    )
-  with Not_found -> ()
+    try
+      let entry = DomidMap.find id quota.cur in
+      if entry >= quota.maxent then (
+        warn "domain %u cannot create entry: quota reached" id;
+        raise Limit_reached
+      )
+    with Not_found -> ()
 
 let check quota id size =
   if !activate then
@@ -88,4 +88,4 @@ let merge orig_quota mod_quota dest_quota =
     | diff -> update_entry dest id diff (* update with [x=x+diff] *)
   in
   {dest_quota with cur = DomidMap.fold fold_merge mod_quota.cur dest_quota.cur}
-  (* dest_quota = dest_quota + (mod_quota - orig_quota) *)
+(* dest_quota = dest_quota + (mod_quota - orig_quota) *)

base-commit: 8de3afc0b402bc17f65093a53e5870862707a8c7
-- 
2.30.2


