Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D22C960CBF
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 15:58:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784069.1193444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siwho-0004EM-As; Tue, 27 Aug 2024 13:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784069.1193444; Tue, 27 Aug 2024 13:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siwho-00049Y-64; Tue, 27 Aug 2024 13:57:56 +0000
Received: by outflank-mailman (input) for mailman id 784069;
 Tue, 27 Aug 2024 13:57:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovuO=P2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1siwhn-00047p-G2
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 13:57:55 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b7e8350-647c-11ef-a0b0-8be0dac302b0;
 Tue, 27 Aug 2024 15:57:54 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a86859e2fc0so687341566b.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 06:57:54 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e588adf2sm113898966b.173.2024.08.27.06.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 06:57:52 -0700 (PDT)
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
X-Inumbo-ID: 5b7e8350-647c-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724767073; x=1725371873; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWli70jhXRT+1zJ4cUaW5oqtYkf8vd8SYDQrICxm6yE=;
        b=GL+XsUdCoKBKeDoVN5cq+4tEMei5ooCUDi9pbzHFIow3n67/+r3Ae6ojAL/u5nozU0
         heAwoM91N2n+x1a4aq/AxUqd2ld+2lY9lT8w9EH90uWI4yZHGt80KUOFvHivyY0Z0D98
         kOXzdoM/2Rr7LQBR41mEQcuVJCtOynCSik5FI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724767073; x=1725371873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lWli70jhXRT+1zJ4cUaW5oqtYkf8vd8SYDQrICxm6yE=;
        b=txEYLNAbcM4RnLk+Kp52JVFhckpTk7I9hKYTHZV7Xi7KxRdMMb+8WwgnrIcdfNzm9r
         AcrYDX/bsjI6izUi1DJXrTeb1v+jL96Ooes8kgqI4F2Yg4eV73HPHtfy+1bqwlAlKt4w
         gy/j6QNXEQnFDo1Jttr7HP1kLOtVicKIswijt/gHHqbu9sISj1AIbJ+2sVAPb3aLRLuW
         g2x0DrMq0Fd97N3Uw3GK3zxNh0zzYpVnps3kPTgGkvQgGPRDS44y5oZo0EuJnwCeCk7L
         dHPq/LqypqfveHQbxYx0pYdRyXqrVsyaghnEISG8N+fkZu0GZRGUW91nmqijZgkZaY1Q
         oIWg==
X-Gm-Message-State: AOJu0Ywj/7r2FE0nqiByu46D2GUu+Io0Hrf0y2Rr9ICKewsN9/4QkEk3
	Gy/rTx7PAVnoGai9W46FbbvAOBdmTqLcyk0a0yU9BAEklI2ZFTtb62Atd9Sd+jbKfLSDZZJFm4T
	X
X-Google-Smtp-Source: AGHT+IFfGcZL/pIGlbHYGOiP8yeTKhRtLOJUjxssu5EVYTfskAuuK/Tmx6RF7IRtiN49AhGs0Q7hKw==
X-Received: by 2002:a17:907:7d94:b0:a86:b504:42ea with SMTP id a640c23a62f3a-a86e3bdbd2bmr197554766b.45.1724767073100;
        Tue, 27 Aug 2024 06:57:53 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 1/4] xen/evtchn: Use bitmap_for_each() in evtchn_check_pollers()
Date: Tue, 27 Aug 2024 14:57:43 +0100
Message-Id: <20240827135746.1908070-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827135746.1908070-1-andrew.cooper3@citrix.com>
References: <20240827135746.1908070-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is a preprocessor-identical opencoding.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
---
 xen/common/event_channel.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 13b97c94d7fa..8db2ca4ba23e 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -1517,9 +1517,7 @@ void evtchn_check_pollers(struct domain *d, unsigned int port)
         return;
 
     /* Wake any interested (or potentially interested) pollers. */
-    for ( vcpuid = find_first_bit(d->poll_mask, d->max_vcpus);
-          vcpuid < d->max_vcpus;
-          vcpuid = find_next_bit(d->poll_mask, d->max_vcpus, vcpuid+1) )
+    bitmap_for_each ( vcpuid, d->poll_mask, d->max_vcpus )
     {
         v = d->vcpu[vcpuid];
         if ( ((v->poll_evtchn <= 0) || (v->poll_evtchn == port)) &&
-- 
2.39.2


