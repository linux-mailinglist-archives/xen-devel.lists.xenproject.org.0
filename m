Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B1DBD0D1B
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 00:29:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141662.1475838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v84Yl-0002hu-De; Sun, 12 Oct 2025 22:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141662.1475838; Sun, 12 Oct 2025 22:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v84Yl-0002fZ-AU; Sun, 12 Oct 2025 22:28:59 +0000
Received: by outflank-mailman (input) for mailman id 1141662;
 Sun, 12 Oct 2025 22:28:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=//GD=4V=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1v84Yj-0002fA-V4
 for xen-devel@lists.xenproject.org; Sun, 12 Oct 2025 22:28:57 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7614481-a7ba-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 00:28:57 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46e509368caso6966055e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 12 Oct 2025 15:28:57 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce57d404sm15310798f8f.3.2025.10.12.15.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 15:28:55 -0700 (PDT)
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
X-Inumbo-ID: d7614481-a7ba-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760308136; x=1760912936; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VCGD0qltgfkdPVMxwYzFialyqTveUepsC02eDveo6Ek=;
        b=GBA2PBQZnYSGtRm+sgM+C9vrjxiD5ldUmLl5omk8aPEk5gV9GJz38Epcvhqs30pmh5
         62+pJUUQKcu+HS18/88HqEo7MTLno4kFgeXrmxSUKjbwfXEIMQeGctjP7LA4N3pKWxM0
         JqwYnzOpFBWYGqcONzt/z6ht9wI8OQhglUyaE0V+zw9BxMWumBt68HdaZA59wdYXmKkU
         D+hOZO1mk4aAUFOor7sAVQYqqqpE7aU3Me39H8EDgIR6Oq6Hu3XewDsQ86eVCrwt5Na2
         YFjvT0tQ4rL2IVjMO6IoZO0kk+Zb+Dt09t10jTFu8Al0QUVgoyKvAkFnSHH7GRd4pRPf
         WvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760308136; x=1760912936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VCGD0qltgfkdPVMxwYzFialyqTveUepsC02eDveo6Ek=;
        b=I3wHveZue3b7nd3rilcWzhvRoe/y/6xmisge5mK6Qd51t5VCpUhzv20OdC3ViRuQBX
         9mT9han/jRJIDrwXtFaMRtxTtTkByjwSJCCNIPp7I6zTaWvdipZAORQoaL/Be4IYVKxU
         Oko6EhyGKojGdbd4PrGc6mUexonU8c7GbQGHqDorOZOm/AAlMTbEGRT5AOSJtRqiYJxn
         2NFXdiqokibkbo1ioS5RD1kAQwc+ZoeBBG6W2JsSIum5z6V7U2wk9wSauGLHDxFBqDxV
         GRXe9sabqPwoWu8wXwuxtc8BRsmfmV4Vn4vWE4uKDdA6XxVvGgN/JNUnN2qkdeWCbRdW
         ra0Q==
X-Gm-Message-State: AOJu0YwGJypAdAgnq5gtyucjHHwibfE0jGVq5T45MJdyFo9FDzkiKI3K
	iCFSybc7MtMG0QMNGunjJmJVZrHQPUvIfDLlzYMSyFdYcK5+lQpOpmPzrXGD4Q==
X-Gm-Gg: ASbGnctzsrYfWSNNN+5X17F9/kuzbSa3zuGspzxf5IvuTDHjWD7g0PfPgXXsoO75TR2
	+3O5OundYwCfTLcHqMUj993/NwXhZxPfq0eHfTCFTLJziS4PgjouLjRThZnz+eEnF59raTx0R/y
	GIxAI1QRadg7zBlnr1qIzfMMUrpEt3nMERO2mRuOGoCOZ2SjAXrpdOcjFzMUjklwC0dRCs/C0KQ
	LlGDTc+QI0zECyTFVZWmLY5eb5NXuMLG003GgdzFtIOpQz6fuFrrBlJATHWT++ZK/Mf9KEVmtSR
	ztbuOvlJSD0gCUv51MpTVkUxTOYpiZD0BUNee+r6LFhDpyHt+YDO1HF2K5y98H5Kh0ue+sgibdr
	Z9Asy5aDyuwRtcDVV3yfUO3w4DdybREkyd4arUnS1zpAQJvstxeTxiSz8o60w1fNhMTGAN4m8C7
	FRkCw9sLIB636wYoqkoTBxwfiZ8LfsYDXEOEA/BxQHlA==
X-Google-Smtp-Source: AGHT+IGvHNZNsZC9og0iWm8Voa4/jr0yKRRzyAXovYs4b9Okuf31KEEHmIf4eHH/8iy25LXUtB/nRQ==
X-Received: by 2002:a05:6000:4387:b0:3fc:740f:ff65 with SMTP id ffacd0b85a97d-4266e8e092emr6371313f8f.6.1760308135805;
        Sun, 12 Oct 2025 15:28:55 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.21] CHANGELOG.md: mention the introduction of configurable altp2m count
Date: Sun, 12 Oct 2025 22:28:52 +0000
Message-Id: <35ba6d10b77893edbacbaea872c1ca742c767af5.1760308066.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5c70bc0250..0cf9ad2d95 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -23,6 +23,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Allow controlling the MTRR cache attribute of the Xen platform PCI device
      BAR for HVM guests, to improve performance of guests using it to map the
      grant table or foreign memory.
+   - Allow configuring the number of altp2m tables per domain via vm.cfg.
 
 ### Added
  - Introduce new PDX compression algorithm to cope with Intel Sierra Forest and
-- 
2.34.1


