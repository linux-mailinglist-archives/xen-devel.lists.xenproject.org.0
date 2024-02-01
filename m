Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBE6845FEC
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 19:30:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674669.1049743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVbph-0002IH-CU; Thu, 01 Feb 2024 18:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674669.1049743; Thu, 01 Feb 2024 18:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVbph-0002FV-9G; Thu, 01 Feb 2024 18:30:41 +0000
Received: by outflank-mailman (input) for mailman id 674669;
 Thu, 01 Feb 2024 18:30:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzG+=JK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rVbpg-00020T-Im
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 18:30:40 +0000
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [2607:f8b0:4864:20::f32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffd0bc85-c12f-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 19:30:40 +0100 (CET)
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-6818a9fe380so7291216d6.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 10:30:40 -0800 (PST)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 pf8-20020a056214498800b0068c75141e73sm25824qvb.2.2024.02.01.10.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 10:30:37 -0800 (PST)
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
X-Inumbo-ID: ffd0bc85-c12f-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706812238; x=1707417038; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+F33WLb8SsbhR8svkMBYfGDsCEmngZ8q/7ZaljEVS3M=;
        b=UwPIDUq10isCpumWgi97FEc+KPHMV/lzjQUdUJom8FKLNOJFrxvg3FpDxy5n1gp0SE
         ILP/i+JESIXyEntN9bZ7ZnT0kSF9Lghvd2zwS+Ry47cSDo81pHYekxtpC4VRgBVOFAK/
         a1Yld2ffKmAMfgyouFIDep2M93QDSeBunhSO4rlgMxWgc3obZ0v6hJoL3n1Xv7GSDkMi
         OPccFDprcDcMguOjOwAyltWBf8EWXT58S4poeFpQKBBALojtDoGsdS2+p8gToes8vzkC
         uPGaBEHFBmakozTIu8ss+w5px7ICfrjYndxV+xBhNnPn2AQScBW7p7OEV2VSRyJHvWF4
         S6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706812238; x=1707417038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+F33WLb8SsbhR8svkMBYfGDsCEmngZ8q/7ZaljEVS3M=;
        b=u0KzJ0SFsLvWzqhs/El9QLGfcKEqRfX3qbSny+BaEjNoJdGm3O6rFscApUIUTrpQzg
         W6G5pQPE6ih1PCBMbbVG/K/gvZT67NSCah02mii74/K2cP4Pn1Vq9zpm3lXgq+gyCSAG
         XPT+z45wV1qjxAu0suGPhimK1LBdPDCB3DRcHFC3M4loetB6+/5KfsDfdG8FSGQ7uZoT
         8cEfIPWkkk+BUwrX29FLYmXHB6X8bSyzUky0xN5IBYJTLxpum/KtzPWWzNTFJCYyO6PF
         HgSfdW8teWeWgdW77qbHMfiuaUTc9vUyG/kXH3eKcwC0FMt+KjUJ3EzdUfqYKwaRF8Gs
         3Ahw==
X-Gm-Message-State: AOJu0YygHjLqaUkQdraYAfzk38lBy+7c1hE0yaC5XANj1aZlbcEJKohG
	3rdjr2+ZCagm4bTxfzDClSljNQ3KCgQtJzOsaqj3mGIhsikuCBauWSv//0im
X-Google-Smtp-Source: AGHT+IEShpw6JudIZoJMi92UdXTK/nz8GoPmUq8wT+imB1lMTJxLIqgl6uF2XZHxabDNwONIF0UnIA==
X-Received: by 2002:ad4:5746:0:b0:686:a472:1205 with SMTP id q6-20020ad45746000000b00686a4721205mr6139692qvx.0.1706812238079;
        Thu, 01 Feb 2024 10:30:38 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVCqkg7ZSjgpD/6/3COlNsVpzNskT++aPAlEYlQcK/J6/X50n8ZfzMbMgXQu2IqIT3VJLJ2pWTsNJ/JK/rhpjASjcHk5PBWTPpYhRO3amEmvhZkTGv+
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 1/4] block-common: Fix same_vm for no targets
Date: Thu,  1 Feb 2024 13:30:21 -0500
Message-ID: <20240201183024.145424-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201183024.145424-1-jandryuk@gmail.com>
References: <20240201183024.145424-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

same_vm is broken when the two main domains do not have targets.  otvm
and targetvm are both missing, which means they get set to -1 and then
converted to empty strings:

++10697+ local targetvm=-1
++10697+ local otvm=-1
++10697+ otvm=
++10697+ othervm=/vm/cc97bc2f-3a91-43f7-8fbc-4cb92f90b4e4
++10697+ targetvm=
++10697+ local frontend_uuid=/vm/844dea4e-44f8-4e3e-8145-325132a31ca5

The final comparison returns true since the two empty strings match:

++10697+ '[' /vm/844dea4e-44f8-4e3e-8145-325132a31ca5 = /vm/cc97bc2f-3a91-43f7-8fbc-4cb92f90b4e4 -o '' = /vm/cc97bc2f-3a91-43f7-8fbc-4cb92f90b4e4 -o /vm/844dea4e-44f8-4e3e-8145-325132a31ca5 = '' -o '' = '' ']'

Replace -1 with distinct strings indicating the lack of a value and
remove the collescing to empty stings.  The strings themselves will no
longer match, and that is correct.

++12364+ '[' /vm/844dea4e-44f8-4e3e-8145-325132a31ca5 = /vm/cc97bc2f-3a91-43f7-8fbc-4cb92f90b4e4 -o 'No target' = /vm/cc97bc2f-3a91-43f7-8fbc-4cb92f90b4e4 -o /vm/844dea4e-44f8-4e3e-8145-325132a31ca5 = 'No other target' -o 'No target' = 'No other target' ']'

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/hotplug/Linux/block-common.sh | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tools/hotplug/Linux/block-common.sh b/tools/hotplug/Linux/block-common.sh
index f86a88c4eb..5c80237d99 100644
--- a/tools/hotplug/Linux/block-common.sh
+++ b/tools/hotplug/Linux/block-common.sh
@@ -112,14 +112,12 @@ same_vm()
                   "$FRONTEND_UUID")
   local target=$(xenstore_read_default  "/local/domain/$FRONTEND_ID/target"   \
                  "-1")
-  local targetvm=$(xenstore_read_default "/local/domain/$target/vm" "-1")
+  local targetvm=$(xenstore_read_default "/local/domain/$target/vm" "No Target")
   local otarget=$(xenstore_read_default  "/local/domain/$otherdom/target"   \
                  "-1")
   local otvm=$(xenstore_read_default  "/local/domain/$otarget/vm"   \
-                 "-1")
-  otvm=${otvm%-1}
-  othervm=${othervm%-1}
-  targetvm=${targetvm%-1}
+                 "No Other Target")
+
   local frontend_uuid=${FRONTEND_UUID%-1}
   
   [ "$frontend_uuid" = "$othervm" -o "$targetvm" = "$othervm" -o \
-- 
2.43.0


