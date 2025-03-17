Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77972A64E66
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 13:16:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916684.1321752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9Of-0001vG-Jt; Mon, 17 Mar 2025 12:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916684.1321752; Mon, 17 Mar 2025 12:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9Of-0001tH-GD; Mon, 17 Mar 2025 12:16:45 +0000
Received: by outflank-mailman (input) for mailman id 916684;
 Mon, 17 Mar 2025 12:16:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VoqB=WE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tu9Oe-0000mc-6G
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 12:16:44 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af4d0c9c-0329-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 13:16:42 +0100 (CET)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-226185948ffso12881275ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 05:16:42 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-7371167e099sm7411866b3a.112.2025.03.17.05.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 05:16:40 -0700 (PDT)
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
X-Inumbo-ID: af4d0c9c-0329-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742213801; x=1742818601; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnASASfNWSWjwx+8Xspzq3EIms/zWgQ7WFMJesY+L+c=;
        b=oEGVgmnLYy7OALIQ+RXaKfMCL/4aeAlAIbqbIeZbQY78WFzz7hS6/hJ8/Tn/HSw9Bj
         t+NzQvtVwAh2IZZatB11kwz6Fhnkl2DvBSHgPnemfNaRJ1ezosAsotb9PaKdrxtloIBj
         wUGs6x2n7dmITYNbPHfy9LFzVYXn/OfH0eirs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742213801; x=1742818601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnASASfNWSWjwx+8Xspzq3EIms/zWgQ7WFMJesY+L+c=;
        b=SLJJb9M7eYkPwj1bKn1f1ZBBWYf0Gfbi44dA3J1Te421A170wR9k/iLM4ulTZESImH
         MF6fqtrQJC5bhpSGmqvkQZ4O4iMf8JoFlDBH/0sJn7dWfPoTs96wk3woWkX+0bAfbZNo
         f45a0+PcR9eUYxIHNawkGrVjOEqPFCAnF04l4rWIaJ6SZxiayZUWkH6rHXiwEVaS8F07
         ffYWh1h4abU4Wl8cyr7L9/9Z4L1SbnJBCJupmmbPQqt5yFCBVEHYpdKtbwSS9mdAsTgr
         47V9egq7P6UPCBr4PZ9E/NqqnVUdr4ecMJYpbbXC/HC2hy6+bONvoeKKHhMq0eMiR4sf
         wXLA==
X-Gm-Message-State: AOJu0YyMy/hsacLsYI5ngH8YJTtCbYYjyBD9cH4QLM3gJ188cHBamX5L
	x8rgShexhiavahyGiyCWERGn5BHc+Dnsl6VW6vyo5jttbVq5YbSDb5SXKU5vkyHc1cH+wBiWsRf
	2
X-Gm-Gg: ASbGncvQKf2KV5q/biRjFIUuf07Fx2FWiaFfbsg/tLrTiZjF2ezcLuoZpQ5ITmr40Hz
	SUYvrxb/uACbbrVolIT+Dos9tnCvPBJ9r/e1M+guNlWA2eqwQekJmi+Sckp8c0vnLnkRWJj2WNY
	m840dQu4qa7DKvYbv0sOe6uo1f3sz8JScW+UakR5pE88xx0WxjbEp9Sc5kRx2fTxPEJmmgHsqFz
	72X7vwKOc3KQVVogzVb7LGhoPVzbu4yA7OFKdOvFdndtSVEULaV9BMuoi6UE53wmh1EQTU1pCBE
	xlq5SS0K2HwX45fPcCobfKy21G3ThvIy0iCZeZbbmXSp7P3Xn0X8RFI=
X-Google-Smtp-Source: AGHT+IGXwxzDL6xraLlGOi11RL2cH519tbwA4S6+ANilN8DdLDRkl4B1hdPJeviKOLeYSI1tYZtB3g==
X-Received: by 2002:a05:6a00:2e25:b0:730:9801:d3e2 with SMTP id d2e1a72fcca58-7372238e7d9mr17105784b3a.8.1742213800609;
        Mon, 17 Mar 2025 05:16:40 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/8] automation/cirrus-ci: update FreeBSD to 13.5
Date: Mon, 17 Mar 2025 13:16:10 +0100
Message-ID: <20250317121616.40687-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317121616.40687-1-roger.pau@citrix.com>
References: <20250317121616.40687-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 .cirrus.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index aa195ba370ac..ce7588b7b6b1 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -1,7 +1,7 @@
 # https://cirrus-ci.org/guide/tips-and-tricks/#sharing-configuration-between-tasks
 freebsd_13: &FREEBSD_13
   freebsd_instance:
-    image_family: freebsd-13-4
+    image_family: freebsd-13-5
 freebsd_14: &FREEBSD_14
   freebsd_instance:
     image_family: freebsd-14-2
-- 
2.48.1


