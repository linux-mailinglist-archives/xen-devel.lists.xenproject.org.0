Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F14149AB994
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 00:40:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824298.1238412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3NXo-0002mK-Q9; Tue, 22 Oct 2024 22:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824298.1238412; Tue, 22 Oct 2024 22:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3NXo-0002fX-IP; Tue, 22 Oct 2024 22:40:04 +0000
Received: by outflank-mailman (input) for mailman id 824298;
 Tue, 22 Oct 2024 22:40:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjUh=RS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3NXm-00026E-PT
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2024 22:40:02 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 934a1319-90c6-11ef-a0be-8be0dac302b0;
 Wed, 23 Oct 2024 00:40:02 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c9362c26d8so498724a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Oct 2024 15:40:02 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a913076f5sm396704066b.95.2024.10.22.15.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 15:40:00 -0700 (PDT)
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
X-Inumbo-ID: 934a1319-90c6-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729636801; x=1730241601; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WngS3EfMpOQgHq1eT2hKFkIIl1PwfdoEnZaYAyPIS0Y=;
        b=caVDELXM4yNVyesTEAxyBZrEvr80A+n5sW5OXcxsmZW3C+1iMmRa+aPPR15j0lNVcY
         Zn0fXPrS6PSlOcNcS05uhbyTdTqOSBzA75cAlfY2xz3JMzUFtBDz3RMmP976hEjSsPpx
         huXc/4wsO5YQSYYCCggkMZNPW3GckShNJrup4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729636801; x=1730241601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WngS3EfMpOQgHq1eT2hKFkIIl1PwfdoEnZaYAyPIS0Y=;
        b=TYs4+zCjCd4ZyK12fSyyZiBgZMAQUgXxcuFoAeY6HPMBNgbYezIE3uFk2JXX0b13Ve
         37S9Jhu7g5ofWatIeMa1pwwieGmYTvOm5d5RniU4WfK0WCVmZEWi4z5nKu6F4SHURHm9
         xvROIcu9EZHqPPRRbs4CMtjpd8AkWQfU53u+bMe8TL6wYo6bbwapCQ+kQHzjDtAXhxcB
         TIvtOUTFcW3E0zBYMjog/5VelE408sV1NZaDCDooU4y1XQIIj0B+hoZXnxgJIwhCNCqY
         fWQQhwNzUaAkwYjgGCrkwRY6MyHcXz4RuRxZdhNfevS+eoKS9ushoC9SUaNA6tt5CqeE
         829Q==
X-Gm-Message-State: AOJu0Yw9fyPWSDCaVHSaDE6/ieoNRtt/kRgzFzMz9/YoIzpNLalSq5rN
	oKfR0sSO61PEZYsnM3g7lEvuT+rSbufpLxummAM1LngTeBTlNBwQ/pCTV2RNzP8HMK+Fi1Jy99x
	m
X-Google-Smtp-Source: AGHT+IGYbzpAehcj4kjuhSByj7lL7Vk3fUVnYYt45ZxrfT07Vh8a70eWMMNBBW/cqUbEd6U548aJ1A==
X-Received: by 2002:a17:907:2cc5:b0:a99:5f65:fd9a with SMTP id a640c23a62f3a-a9aaa620d5cmr534730466b.21.1729636801041;
        Tue, 22 Oct 2024 15:40:01 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 3/3] x86/boot: Simplify size calculations in move_memory()
Date: Tue, 22 Oct 2024 23:39:54 +0100
Message-Id: <20241022223954.432554-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241022223954.432554-1-andrew.cooper3@citrix.com>
References: <20241022223954.432554-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While both src and dst are similar, src is mapped only accounting for src's
size, while dst is mapped based on the minimum of both.  This means that in
some cases, an overly large mapping is requested for src.

Rework the sz calcuation to be symmetric, and leave an explanation of how
logic works.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>

And as if by magic, all transient fields from converting module_t are gone,
with bloat-o-meter reporting:

  add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-74 (-74)
  Function                                     old     new   delta
  move_memory                                  265     191     -74

which is all removal of logic inside the while loop.
---
 xen/arch/x86/setup.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 152cd696d6c2..bb525980cdd8 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -492,23 +492,22 @@ static void __init noinline move_memory(
 
     while ( size )
     {
-        unsigned int end   /* mapsz */;
         unsigned int soffs = src & mask;
         unsigned int doffs = dst & mask;
         unsigned int sz;
         void *d, *s;
 
-        end = soffs + size;
-        if ( end > blksz )
-            end = blksz;
-        sz = end - soffs;
-        s = bootstrap_map_addr(src, src + sz);
+        /*
+         * We're copying between two arbitrary buffers, as they fall within
+         * 2M-aligned regions with a maximum bound of blksz.
+         *
+         * For [ds]offs + size <= blksz, sz = size.
+         * For [ds]offs + size >  blksz, sz = blksz - [ds]offs.
+         */
+        sz = max(soffs, doffs);
+        sz = min(sz + size, blksz) - sz;
 
-        end = doffs + size;
-        if ( end > blksz )
-            end = blksz;
-        if ( sz > end - doffs )
-            sz = end - doffs;
+        s = bootstrap_map_addr(src, src + sz);
         d = bootstrap_map_addr(dst, dst + sz);
 
         memmove(d, s, sz);
-- 
2.39.5


