Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0337673A782
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 19:42:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553874.864693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCOK8-00074A-MW; Thu, 22 Jun 2023 17:42:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553874.864693; Thu, 22 Jun 2023 17:42:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCOK8-00072s-J8; Thu, 22 Jun 2023 17:42:24 +0000
Received: by outflank-mailman (input) for mailman id 553874;
 Thu, 22 Jun 2023 17:42:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VOAB=CK=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qCOK7-00072l-PT
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 17:42:23 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24a081d8-1124-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 19:42:22 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f900cd3f69so58677825e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 10:42:22 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j11-20020a5d604b000000b003078681a1e8sm7558457wrt.54.2023.06.22.10.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 10:42:21 -0700 (PDT)
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
X-Inumbo-ID: 24a081d8-1124-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1687455742; x=1690047742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGWd4toS3IkNfM131vkRv5VsP8bjWS9kmyCgBgojdfY=;
        b=bVD1FT3qa56pFK8e4oCv3OnnvGvHhX7wcHPnoy/WANgs4cGQYAgvVhAnv038Yy3vkT
         bmKiA9Ei+j6k0pg0h9mYQzYcU6sd57H50q3li3btjapEVMLxhjJ2CQbk0Q2985fk3qi5
         Rdf5HPTVNCv+FXscZwhnR7wwM3HLMWvjPF09o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687455742; x=1690047742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGWd4toS3IkNfM131vkRv5VsP8bjWS9kmyCgBgojdfY=;
        b=TP19V4xYOIHkX+9CcjbSTyzrLFCGIH60Ab1td4eSzfnMdD1pngmMPKtHXXz0oL+h9P
         8WTVtexEO5xx0/K496Flcq4PebGKAt4sLM/SiJvZcq545jwHJBtkRQV4tQ7Jj5Q0QPv6
         aYifU5b2hCxr06Ndq+/7teuTsnKmMkezRJ4uQKb3jGdPWmWSEkCHkQHSM/+dCPdvdCtI
         xTNXm04Hx75mlCY6du6ZyJm/NiFYGQwcHmNaWP41BdeZkF7LBQrrJl8DRZipgFvMB1zd
         wPT9RkC7AWXv+ZLSaBHv/MItZAdQRhSDu5HARw+dRqyBNFzlToV2nhY+7ydNUEzmqyg6
         EJZQ==
X-Gm-Message-State: AC+VfDxdsazJ7aZMqLoaQL1Q6CqRgFGlRIg0gVDToKErIcOpK6k48yTc
	e/UClC6a1LDKS+SExUJZxF5Gw6e9qOLtdmOUou0=
X-Google-Smtp-Source: ACHHUZ6mbYJvq7iopIkcaLKIhWxgTvRnUwyGp934mPbC9g9ZSCOJtxiNgWWjEXyKY8TCf+6TqRPcyg==
X-Received: by 2002:a1c:6a0e:0:b0:3fa:78d1:572 with SMTP id f14-20020a1c6a0e000000b003fa78d10572mr798252wmc.0.1687455742137;
        Thu, 22 Jun 2023 10:42:22 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 1/4] x86/microcode: Allow reading microcode revision even if it can't be updated
Date: Thu, 22 Jun 2023 18:42:16 +0100
Message-Id: <20230622174219.8871-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230622174219.8871-1-alejandro.vallejo@cloud.com>
References: <20230622174219.8871-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

microcode_update_one() currently assumes all microcode handlers are set or
none are. That won't be the case in a future patch, as apply_microcode()
may not be set while the others are. Hence, this patch allows reading the
microcode revision even if updating it is unavailable.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v4:
  * Only remove the assumptions on handler contents from
    microcode_update_one() and leave early_microcode_init() alone (Andrew)
---
 xen/arch/x86/cpu/microcode/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index c3fee62906..bec8b55db2 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -750,11 +750,12 @@ __initcall(microcode_init);
 /* Load a cached update to current cpu */
 int microcode_update_one(void)
 {
+    if ( ucode_ops.collect_cpu_info )
+        alternative_vcall(ucode_ops.collect_cpu_info);
+
     if ( !ucode_ops.apply_microcode )
         return -EOPNOTSUPP;
 
-    alternative_vcall(ucode_ops.collect_cpu_info);
-
     return microcode_update_cpu(NULL);
 }
 
-- 
2.34.1


