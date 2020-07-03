Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7EC214036
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 22:10:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrS0f-0003Jx-7T; Fri, 03 Jul 2020 20:10:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=krI5=AO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jrS0d-0003Js-MU
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 20:10:07 +0000
X-Inumbo-ID: 2fd856b6-bd69-11ea-8a39-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2fd856b6-bd69-11ea-8a39-12813bfff9fa;
 Fri, 03 Jul 2020 20:10:06 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id k6so33940400wrn.3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2020 13:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=klbXbAQrxeBsYlQA+DIpNswrBH4JAUwBVstVHGzKcO4=;
 b=GMn+Tba+t++zEhgaCEt/UeiCkmknpCNbEXUA75gMWj1UUl4O8o7TzL5pAVDi5crXr6
 eA+WIA3feq5sgWh8kIlGsXegQMyoG3PTN4OaQcuHoDyER1JDfOfKgZ0g+GLemIXGo1bb
 3NTjey0UoAcDkUXZbMhQb6wvDFUB3LL8Ri83+YE72hm2v/QMXHzyAG28ApOAT+gDMm8w
 BYdpCjjHL+57iAGnE3Llozm3qFKi7MnqbHO/F5aVs2OZmNZS7AJS/PtsKBb4QNA6jtPE
 HL17jMOwQYm/qpqzttQYwT3fRbc5gT09j0rERyorf2lN30/ErVts9LNB8wEIgfMbQgWz
 XndA==
X-Gm-Message-State: AOAM531mP5bBhxz9svjeqFdg4a3WfBiCUPbM/Menx7A9hTuY/HkwYEbK
 +Xi/Nztyjv+OO/b4Syy+9FHrdZfn
X-Google-Smtp-Source: ABdhPJx1sjbvu0J1HtcM2K6vJf5RrYh9I9M52pTqf9A0vMzCu/X0uLhG6SQBSWRCNPh09MLsQj917w==
X-Received: by 2002:a5d:6342:: with SMTP id b2mr37910381wrw.262.1593807005561; 
 Fri, 03 Jul 2020 13:10:05 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id c18sm14443214wmk.18.2020.07.03.13.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 13:10:05 -0700 (PDT)
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14] kdd: fix build again
Date: Fri,  3 Jul 2020 20:10:01 +0000
Message-Id: <20200703201001.56606-1-wl@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <paul@xen.org>,
 Tim Deegan <tim@xen.org>, Wei Liu <wl@xen.org>,
 Michael Young <m.a.young@durham.ac.uk>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Restore Tim's patch. The one that was committed was recreated by me
because git didn't accept my saved copy. I made some mistakes while
recreating that patch and here we are.

Fixes: 3471cafbdda3 ("kdd: stop using [0] arrays to access packet contents")
Reported-by: Michael Young <m.a.young@durham.ac.uk>
Signed-off-by: Wei Liu <wl@xen.org>
---
Cc: Tim Deegan <tim@xen.org>
Cc: Paul Durrant <paul@xen.org>
Cc: Michael Young <m.a.young@durham.ac.uk>
---
 tools/debugger/kdd/kdd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/debugger/kdd/kdd.c b/tools/debugger/kdd/kdd.c
index 866532f0c770..a7d0976ea4a8 100644
--- a/tools/debugger/kdd/kdd.c
+++ b/tools/debugger/kdd/kdd.c
@@ -79,11 +79,11 @@ typedef struct {
 /* State of the debugger stub */
 typedef struct {
     union {
-        uint8_t txb[sizeof (kdd_hdr)];           /* Marshalling area for tx */
+        uint8_t txb[sizeof (kdd_pkt)];           /* Marshalling area for tx */
         kdd_pkt txp;                 /* Also readable as a packet structure */
     };
     union {
-        uint8_t rxb[sizeof (kdd_hdr)];           /* Marshalling area for rx */
+        uint8_t rxb[sizeof (kdd_pkt)];           /* Marshalling area for rx */
         kdd_pkt rxp;                 /* Also readable as a packet structure */
     };
     unsigned int cur;       /* Offset into rx where we'll put the next byte */
-- 
2.20.1


