Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E558287EE23
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:56:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694947.1084305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHH-00047R-W0; Mon, 18 Mar 2024 16:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694947.1084305; Mon, 18 Mar 2024 16:55:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHH-00042F-Rt; Mon, 18 Mar 2024 16:55:59 +0000
Received: by outflank-mailman (input) for mailman id 694947;
 Mon, 18 Mar 2024 16:55:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHG-0002f9-42
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:55:58 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63843ede-e548-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:55:56 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41411421113so7763755e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:55:56 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:55:55 -0700 (PDT)
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
X-Inumbo-ID: 63843ede-e548-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780956; x=1711385756; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxOm50nBYccC83Ra9oGTkRkIB7zi8ZuMsoGfL9HmHqU=;
        b=trkv0WHAGgaLUO2UcAApmNANrQo/R5PhuJw6L1ErGdytuhfL/q6va9iyrYZSs9adyz
         /meN5zP0qnJJkfnHhLN6anROemEI89PQVkYIFBb7Vq2AY7TYYf1ydKaJY62HVKKI1qjF
         hDlVnCF+WC7nZVZAXewDi4sB1RaiK40FFQkQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780956; x=1711385756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OxOm50nBYccC83Ra9oGTkRkIB7zi8ZuMsoGfL9HmHqU=;
        b=bcHuV4yjBw9eNm4kzk9yo+fVBjJO1/hYRqSPYxnpKMYPjiovPD061jUYEWvglFGByQ
         E7lB7iS52eMCytTi4e1rFTNasxU/e9SCpaxf+rXUZW7LHzCIJOLKJxgG/5vPpbuF2tlz
         dzABMl0r8xd0PvwhjB2v2Rznmoi28NHvw1lJwI+3vUg09JqC6g4dcBbHFkicRnD0OGXm
         g4FqLZz2BT5bCsjTLlBcqIffLHqrskeB8rQ4z2msCwe5O7ZXb40F8Qwpztds2JG3LJXT
         K23rzFynxzNs6HvOoAHz7Yc1uN5LWIP9T8Cch762hWqFOLViKv4Sf86Pf0K1Hfso/xKn
         1mzQ==
X-Gm-Message-State: AOJu0Yzsu21iOC9y2WFkimdzVel7keHB+lwsaBIbfGd8IoUrRl8o3NU2
	ipNIELljpSp8xgX47JokFWE6tX9ar6Xyi91iuEFay1egefBP4tQcTqu1fcATiU2TI4OalCT/UUq
	2
X-Google-Smtp-Source: AGHT+IEs0T2xUdzMiCM9wX1GUfZ4c07htL6c5G668fyp8ybNjhYPol7w21y72KJ30v6arccsWDXdqw==
X-Received: by 2002:a05:600c:1554:b0:414:39c:d9f0 with SMTP id f20-20020a05600c155400b00414039cd9f0mr26678wmg.2.1710780955895;
        Mon, 18 Mar 2024 09:55:55 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 06/36] ts-host-install: fix ntp server setting
Date: Mon, 18 Mar 2024 16:55:15 +0000
Message-Id: <20240318165545.3898-7-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Debian #778564 bug report is still open, the ntp.conf file doesn't
contain the setting from NtpServer after installation, so we still
need to edit ntp.conf on Bookworm.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 ts-host-install | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ts-host-install b/ts-host-install
index 61433e64..00277485 100755
--- a/ts-host-install
+++ b/ts-host-install
@@ -161,7 +161,7 @@ END
 	    my $done= 0;
 	    while (<EI>) {
 		if (m/^server\b|^pool\b\s/) {
-		    if ($ho->{Suite} =~ m/lenny|squeeze|wheezy|jessie|stretch|buster/) {
+		    if ($ho->{Suite} =~ m/lenny|squeeze|wheezy|jessie|stretch|buster|bookworm/) {
 			$_= $done ? "" : "server $ntpserver\n";
 		    } else {
 			m/^server \Q$ntpserver\E\s/ or
-- 
Anthony PERARD


