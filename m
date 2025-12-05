Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97342CA7B8C
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 14:16:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179048.1502687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRVf8-0008DJ-Uf; Fri, 05 Dec 2025 13:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179048.1502687; Fri, 05 Dec 2025 13:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRVf8-0008Bq-Rc; Fri, 05 Dec 2025 13:15:54 +0000
Received: by outflank-mailman (input) for mailman id 1179048;
 Fri, 05 Dec 2025 13:15:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mBPq=6L=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vRVf8-0008Bk-8J
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 13:15:54 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86004280-d1dc-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 14:15:52 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b736ffc531fso348600666b.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Dec 2025 05:15:52 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-252-83.as6723.net. [185.5.252.83])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f449c375sm382752866b.24.2025.12.05.05.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 05:15:50 -0800 (PST)
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
X-Inumbo-ID: 86004280-d1dc-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764940551; x=1765545351; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+37JBfB5+wQxvtxVtuUdkwH2Nl76SjI3TMQGP6fdEhw=;
        b=hm0yTq62G9cvhmEBaRpbWeC8J0E2vCjdFlTn0B58OQ9K9NdHsO/OXY1RFsRFGDHeGU
         GzTnp/vsSDuW1A/H7VjBPVdWNLWIIIHoBjC1N16Y8183iYOUbFSWpsupjH5I8qkcV/O+
         /xXa+zGluZmJ8jrT3Z11ZR3tXEPiGLqsFL3EnYyPxzNbOjrdkibrBBub8UBBn16sw3t6
         MEQsqbZ5zGxGgD0uV8UNw3+xfVgjWMM1QdGyHXvVGR/qwXsXS0xgSz/04xxaPJzmZC9O
         IXGl1yQJ7PtLaRDz8Kr9ffrpig4zAqO1EgaxiSUpmsJNgKwmSU1FyF79E56Bcb84YiwI
         oh/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764940551; x=1765545351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+37JBfB5+wQxvtxVtuUdkwH2Nl76SjI3TMQGP6fdEhw=;
        b=p9Pru/tud9YrMtEDAQYQ6xRZKtaPUXCxQgav5bB5Ce9ATdDusNWv8mlQWdJu9ddZTH
         13u8wHBuXhRq0R8IxKUw/7BlupxjEy3XyruRpLPLzPLT7wWPXK4B9sZvqXwZE+HP8+z1
         wKx8IwHZ2iQ2hao4jaxfLjm2bL3GrAFij3JiVjDrCAcXiYg2jodQ+x9+NxfccXMH/IFA
         9rm2eFu/qkdG3etOGJRxueHbVEHLQXzrhfqYD4WWh17SAlGe0zJqkfNsQQo8/LV6vnu/
         ha+0Vzt2RvpsOC4l7aiKq6PljNgC27sd0+lAXJWdvcTssP3+c3m8S8L2dWk3ncUGOh3J
         y89g==
X-Gm-Message-State: AOJu0Yx5g7sCGdPBHsh35AABholK6VxjAa7JOIzOprntQAO8kQUIp7XC
	hpmtbHUIp5N5ce5Qpj8HWRIb+bJgDnuwkNcMtk1DyujnW2ca8XLXNgzVy3shQA==
X-Gm-Gg: ASbGnct/OI6O45KEdTkPWoqNA4LjYYiNmuBnGPAiPlD+L8Xzg5JkZ7lR8leXl00kzjb
	JrE70NPp9rEmG/nYcIHeiwcvF9vZmgzfxCNPSzItUZRhdDEX4ayalArdnPixjDAMO9+ZFNO4hDP
	WStzY7uwbLeVNcStngqQmj5HilF5wFQs4O2jFDJKQUKXceQZmmFdRLs/hONrTT5nFYXAwBb1cbe
	dLx6gN9VK7wCRUKJk7B7bI39Lc9npa1bsfvLztQm684GOgvbl1jlmJSF68kUzd5mUqo2vnFmL67
	tcxP4A2OSTiv7IGJDVHzXb34U29d4BC/I8V3BglDBJOKHyKt3QWIBM/+aBbCb6Yc9VLWoTEd3Xz
	ghRP4aCH3gCyq2nzWYs+BCCF/X4FU46MTiaBq4Z+ttTzIpocbr1bK6Ehh2PSY/L41gk6sUzSenc
	9+HoYdzTFFswKwoc5/+lYIsPh2hrewLyhNaXhn4ImhrJk=
X-Google-Smtp-Source: AGHT+IGk27sIY3D5JG/RQZdI+Cdpm9L97RAPIOfdyIrDJiaFo117rQYO/GlI8vKTivzIxrEeUjYC/g==
X-Received: by 2002:a17:907:3c8e:b0:b76:84d1:5dc9 with SMTP id a640c23a62f3a-b79dc732920mr1072932566b.45.1764940551068;
        Fri, 05 Dec 2025 05:15:51 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] systemd: default system-sleep dir without pkg-config
Date: Fri,  5 Dec 2025 15:13:32 +0200
Message-ID: <f03c8a2fe81527841966ed6c8ed603d1d90ee5c4.1764940296.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Using PKG_CHECK_VAR() to obtain SYSTEMD_SLEEP_DIR reintroduced a build-time
dependency on systemd-devel. This breaks --enable-systemd builds that only
need the initscripts.

Use the same defaulting scheme as other systemd paths: if SYSTEMD_SLEEP_DIR
isn't provided, set it to "$(prefix)/lib/systemd/system-sleep/".

Fixes: e54a6cd6a1f3 ("systemd: Add hooks to stop/start xen-watchdog on suspend/resume")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Build in which the regression was detected:
https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/10959608099
---
 m4/systemd.m4 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/m4/systemd.m4 b/m4/systemd.m4
index c47a25ef93..ee684d3391 100644
--- a/m4/systemd.m4
+++ b/m4/systemd.m4
@@ -77,7 +77,7 @@ AC_DEFUN([AX_CHECK_SYSTEMD_LIBS], [
 	], [])
 
 	AS_IF([test "x$SYSTEMD_SLEEP_DIR" = x], [
-	    PKG_CHECK_VAR([SYSTEMD_SLEEP_DIR], [systemd], [systemdsleepdir])
+	    SYSTEMD_SLEEP_DIR="\$(prefix)/lib/systemd/system-sleep/"
 	], [])
 
 	AS_IF([test "x$SYSTEMD_SLEEP_DIR" = x], [
-- 
2.43.0


