Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC94372A59
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 14:49:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122293.230661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lduUi-0006FR-42; Tue, 04 May 2021 12:49:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122293.230661; Tue, 04 May 2021 12:49:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lduUh-0006Ej-Vp; Tue, 04 May 2021 12:49:43 +0000
Received: by outflank-mailman (input) for mailman id 122293;
 Tue, 04 May 2021 12:49:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMRT=J7=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lduUg-0005hX-S2
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 12:49:42 +0000
Received: from mail-qk1-x733.google.com (unknown [2607:f8b0:4864:20::733])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08ac263e-1521-4c02-b1de-0a817ac8cc6b;
 Tue, 04 May 2021 12:49:18 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id v20so8316949qkv.5
 for <xen-devel@lists.xenproject.org>; Tue, 04 May 2021 05:49:18 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:92e5:6d58:b544:4daa])
 by smtp.gmail.com with ESMTPSA id
 i11sm2355001qtv.8.2021.05.04.05.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 05:49:17 -0700 (PDT)
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
X-Inumbo-ID: 08ac263e-1521-4c02-b1de-0a817ac8cc6b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IY3688lCpOSYrT/VQUB4uhc+PuFxy7DpqKpBTNFfpKA=;
        b=Mmc0fH56zWwQ1LV01pYXV2jkRXyynZHWJ0rK/6gwah0byGawyFX+lzPw27/dn4vimR
         2Z0A+1mrOZzPJa635380x7QGdS2hUTtoU/IGhRUE4b6qhvfnW4UREWvlZG2mXdTQLApm
         wAdtgNk8NgJl1weCwggzmNt1lT4iLv50X1xulz/Zkax8Mqy20a+A1/aK9jf8J7WYja+T
         0fZxu5dobo999pwIni2ajUiWmWg0tT3fZAklntLd/Q090Rm0Fn92eybjhq8/JKQvfV8T
         Fu2WxaVYcWlBDGsGk1/xuN9lGn1hyQTl23/ss2aTxahrVg/4vtHpOZUqMKDVYxhYaqg6
         wYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IY3688lCpOSYrT/VQUB4uhc+PuFxy7DpqKpBTNFfpKA=;
        b=dGtoihiYnQn3Bpw4Jwm8CJGesOzU1rXoMBovYcq5Sei61MHNqQ34+baLywxaNkVyWz
         n+CnPChuAm4IPJdU5kq/afeD6Y8UqSWCAYgVVl8UT/hBgyLUOdFzTigPg5SJuSZxibdc
         58W4xsZJpg1Qwcru8zBtkYxsfL2N/3nU6Y07h+Vtt8M9/IDZ+FkPNgsKFqnd1xaaqQBL
         Bw6L6nn37YjtOD/XdDwhxkewTG7wODjVQMz0k4dd1KrcOEs8Mg9j28jDSk8tlM3X7+eP
         jaynb29h/Z49+eODwu2wkq3sY6v1VFrgwT1HgfAw2H5t5Rmx07/EHGVT0y8fh2EtzT2d
         5U2g==
X-Gm-Message-State: AOAM533+UCjOHvSPOUWqVAATkgHzFHci0fM/m0URpnTu6wBzEZRKTKpw
	/FPcxtGJYOFM3MFG+eXS7/bnOMuwv8A=
X-Google-Smtp-Source: ABdhPJy0DBjg5zaFaKwENUOB2K3O2SgQN2b1tHKM5coz0xMFMeNl88Nbu+peZEA7nvp5D8XkuqesaQ==
X-Received: by 2002:a37:ae44:: with SMTP id x65mr24485640qke.9.1620132557845;
        Tue, 04 May 2021 05:49:17 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH 7/9] vtpmmgr: Flush all transient keys
Date: Tue,  4 May 2021 08:48:40 -0400
Message-Id: <20210504124842.220445-8-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210504124842.220445-1-jandryuk@gmail.com>
References: <20210504124842.220445-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We're only flushing 2 transients, but there are 3 handles.  Use <= to also
flush the third handle.

The number of transient handles/keys is hardware dependent, so this
should query for the limit.  And assignment of handles is assumed to be
sequential from the minimum.  That may not be guaranteed, but seems okay
with my tpm2.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 stubdom/vtpmmgr/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/stubdom/vtpmmgr/init.c b/stubdom/vtpmmgr/init.c
index d9fefa9be6..e0dbcac3ad 100644
--- a/stubdom/vtpmmgr/init.c
+++ b/stubdom/vtpmmgr/init.c
@@ -656,7 +656,7 @@ static TPM_RC flush_tpm2(void)
 {
     int i;
 
-    for (i = TRANSIENT_FIRST; i < TRANSIENT_LAST; i++)
+    for (i = TRANSIENT_FIRST; i <= TRANSIENT_LAST; i++)
          TPM2_FlushContext(i);
 
     return TPM_SUCCESS;
-- 
2.30.2


