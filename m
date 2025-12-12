Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BFCCB9EA0
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 23:21:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185900.1507871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUBVD-0005Dm-DZ; Fri, 12 Dec 2025 22:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185900.1507871; Fri, 12 Dec 2025 22:20:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUBVD-000574-9E; Fri, 12 Dec 2025 22:20:43 +0000
Received: by outflank-mailman (input) for mailman id 1185900;
 Fri, 12 Dec 2025 22:20:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SbWK=6S=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vUBVB-0004B7-9A
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 22:20:41 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca0a9fd6-d7a8-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 23:20:39 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-477770019e4so16863965e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Dec 2025 14:20:39 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fb38a977esm6314350f8f.12.2025.12.12.14.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 14:20:38 -0800 (PST)
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
X-Inumbo-ID: ca0a9fd6-d7a8-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765578039; x=1766182839; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfkvTJmyvWd8Ib+Znwac2Y3alEgJkpaVp966xVhqbZ8=;
        b=pge0gbyCPLoRblFKpyNGnKUO5Z3hD0UMKep1KgtwH6U1SPSSVodKO2hqMlQdXokUal
         crtVMYacsSoKrvxWp0yGgQVSxV65sT5En84f/hxCup0FaVIztU+UTlDreoPpED5hyGr7
         yAZykkXpdFmZe+JcLQyIy29hxB2K/+TVm/28k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765578039; x=1766182839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tfkvTJmyvWd8Ib+Znwac2Y3alEgJkpaVp966xVhqbZ8=;
        b=F2Q7wJa7eBTlIr5vEbOFVVPjKLjCJvtvzuSp2TtKg+0Qd1nw6orT6o6xk8XKleED/n
         W3UHWmy4pJ2Mq7Y7T431c3YvRANhrCJj9C42FFU4O/lDKu7Psas4QrNpZOJbrIpwougk
         jD5PUSzgl0HBzw6BxQb7JA+fa8g8b6XZYS2RQgY/gcIl2aX27hVnbnbFsDKSMhpBEpHY
         s6b0/wW2zaNfkpXQyZSGSuri6CBvUMKKQangmFz6NhPHV7k3ysMp7De0mQ5avmrTvMyi
         cEoclUICMOL+RSGD4gkw1tgpkKIPMdYo6u9slsSFd8p1doMPUp/UVaTcKxpzp+2/jnHk
         2LtQ==
X-Gm-Message-State: AOJu0Yx/3WvS3EDIeKa6KrDzh2x90gt3Y+4HILYJhDz6ebW+aZfzJhrJ
	vvEtnPzlj/M0XiexmJqo4BIrDA2UL7V6+HoEmsmjfdU+DFbodZaZE1B7NMLcXm4IB8CipUW0Oq9
	MYgts
X-Gm-Gg: AY/fxX7ZDWS5uqsBHvpu2ZBhCSXXeErT3De5AIWDw+tppQnfeRtYYdox7sb6dDd3Lfm
	UVTBq2WPHyJPPy3xoVkcsqKN5S6whXbxu578KBs99FNMlTSVXf0JHhClD8f8sLsvpMKidlXCN/K
	yWlzNVc5evYIoiJm2/8BOB9+Qf1ZFClRWyeiR9DQPKqamlJdMAFPxmeT7IODFi2xr//Qw/2wo0P
	VxIq1eVvWHR5ZVqgizow7aSSCt96LAlGE9YcBFjwexReHoApSRlRMpxzzEm6hBCbefxn0ri/5/E
	c0rmha9S9f1EfKVfFMkyqMaNx3pTWMoKBN/N4TwIY2cXWdXmn3AzlWMl1XBY39/0JFId7xDKojE
	rAOZ6xAjKU7ZIypnhmZQWpuBbWV2CB8bfWurR0JzWwBZQ6Ry1b2uifiQkYo2V/2KKXqrdvQ+Y72
	DTsasxIqC3ANdZi//HyVaowxf6p3EtahXlV9Z7kUK7jfOf3CMnBd1vqPfMd90Hmw==
X-Google-Smtp-Source: AGHT+IHdF9m62eD1Ikz/kZO9MXFgP9h75erp/0VVpujT6Tox93FPGCENjkQEcOL6RQPreOyqY88KTg==
X-Received: by 2002:a05:600c:468c:b0:477:7f4a:44b0 with SMTP id 5b1f17b1804b1-47a8f9142bcmr38481295e9.33.1765578038633;
        Fri, 12 Dec 2025 14:20:38 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH RFC 5/5] x86/shadow: Deviate multi.h as being included multiple times
Date: Fri, 12 Dec 2025 22:20:32 +0000
Message-Id: <20251212222032.2640580-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251212222032.2640580-1-andrew.cooper3@citrix.com>
References: <20251212222032.2640580-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This resolves the Eclair complaint about a MISRA D4.10 violation.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>

RFC - this doesn't actually squash the violation, despite being the requisite
magic string.  I suspect the Eclair config needs tweaking to allow the magic
anchor string to be after the SDPX tag.
---
 xen/arch/x86/mm/shadow/multi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/mm/shadow/multi.h b/xen/arch/x86/mm/shadow/multi.h
index fc86d7a8d9cd..b4a6cf1362a6 100644
--- a/xen/arch/x86/mm/shadow/multi.h
+++ b/xen/arch/x86/mm/shadow/multi.h
@@ -2,6 +2,8 @@
 /******************************************************************************
  * arch/x86/mm/shadow/multi.h
  *
+ * This file is intended to be included multiple times.
+ *
  * Shadow declarations which will be multiply compiled.
  * Parts of this code are Copyright (c) 2006 by XenSource Inc.
  * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
-- 
2.39.5


