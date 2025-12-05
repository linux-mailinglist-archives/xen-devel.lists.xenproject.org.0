Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CD5CA851A
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 17:10:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179250.1502828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRYN5-0003bv-NS; Fri, 05 Dec 2025 16:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179250.1502828; Fri, 05 Dec 2025 16:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRYN5-0003Yo-KN; Fri, 05 Dec 2025 16:09:27 +0000
Received: by outflank-mailman (input) for mailman id 1179250;
 Fri, 05 Dec 2025 16:09:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mBPq=6L=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vRYN4-0003Yi-1P
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 16:09:26 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c471271c-d1f4-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 17:09:24 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b72bf7e703fso374252466b.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Dec 2025 08:09:24 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-252-83.as6723.net. [185.5.252.83])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f44597e6sm402147866b.12.2025.12.05.08.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 08:09:22 -0800 (PST)
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
X-Inumbo-ID: c471271c-d1f4-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764950964; x=1765555764; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n5y5EpV8247Sc4CQoDyJ/08kMzJSZMGppYTZMleuDQA=;
        b=fzxk3Y7JFx5hwNkQIBnBIBTLAn3ECCELiqD4kOgZ/znTwLPPFic3xgJigAd+FZespM
         hrLiUiyUxHpFxR6xIqAK5cu5igXxSE26yN+ZR+2gBwpKuSPQQ5XVRMoE1h2XIrERdS3S
         qy6cYqC9VooQcdYrhrBgFHkR3pPo5yz+xqNsOtrQTl4KH+fwSd7hUXCtb/wJGSA3pvQ5
         SAvUc6l1w4V8ihquYXHqb1Aogw2QNnA0YWl5iR5u10WNsnUvXvFlKsUi/vWJbc2D339R
         1QT8BK7PxQMCQhC0DdwlHMWbbPdZtbhISznWSgel8qoPQlh8EvptGp3S9LNnjtI5IBNr
         zejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764950964; x=1765555764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5y5EpV8247Sc4CQoDyJ/08kMzJSZMGppYTZMleuDQA=;
        b=fniQpKjxqfqJP0l02yu+r438LV/EO7MU8lKv1OuZk0Y592nQN5zPQUNe5VTSghSDEF
         wbGAFr3uJGL/+phdaaJKRWzC4MuJ5JZZ5t8sRrPcaRsAPS16ROvM1pbIjMizn6qPkYj5
         Ubagux2Hfy3a+eMjVmGYABWOr6fhsgYqGx7eZd55QLjY2VkvrDbjQOAGlORQBEWdtyYM
         GrMi+tuzjBCikG52KM52Zu+yKQK/jfOP7LIfF4u6O4zk78geQHErwZyblrOd0hXwT+IG
         CK0XuUMKsdqjgvzWhLFJaDO+TMRYJaPa1xrDLa4WSIts98EisdsXEEuI73R6CV4kLltS
         oNcw==
X-Gm-Message-State: AOJu0YyFyGydIFGSJOnpYDK26r+UluNLXxJ6+A8HArfd3hBS78SzomzL
	BdZCDOD4sbf5SHhB+qpghFvm+bWQ4fDbcmhCPyachpd8o/aw6eA0slYNn7pUJA==
X-Gm-Gg: ASbGncv0ocRaaCgTF0O3zy/gPmybzwOmz/JsxlsgYEh63fp8cM5g3WpSRWOzdmLLNr8
	F9e6/F++bnPX8m1loqWhBs/Z1DNkwgnb4hZ1vlD/ogNXrvo3oTQLc5G9Crls62ZlU/N6gazZQG+
	dZHH7tOb4OaefIgaqBWAIaAUBEbQFQC3ZFwkAhrn5RRi9Civ69Pjd/WUJOeCz6pK7YMYw8AFb2G
	c7G5mGHy0Iw8dGwvcIocaznD0OOp16s1VjKINAhL8Mwe6RQjkYC692eHaIPxS+ejP3wsrmF9tKb
	VIejSgrI2ycLyNLKlo56VhzcdFweX3tO/yXhgVT30JHvtZvqyIdmgBy3JFb1zUHBaE/s0vZkUvQ
	U7oi4w9C2RkE07bx70DtoQSF3W3jyJ+EB6o2AfjFkjy97WtUy2QngcP4yBGVJXByYYLzBQkhUD7
	+TDEsFLeGsc6BCZFVC4Ha+60jLxVY55FqH4Xlq1oS2hcA=
X-Google-Smtp-Source: AGHT+IG7h4TlXXkxHQq/K+IrmRaNM5DGJroFC9Uij/MqQfR3j4Z4wQulyJEBouo8wzbUw/GmiFfmbg==
X-Received: by 2002:a17:906:eec4:b0:b72:eaba:aac2 with SMTP id a640c23a62f3a-b79dbea99aamr1132963066b.26.1764950963598;
        Fri, 05 Dec 2025 08:09:23 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2] systemd: fall back to default system-sleep dir without systemd-devel
Date: Fri,  5 Dec 2025 18:07:15 +0200
Message-ID: <aa1ed166473c7eeb442ebf3961c4e7513fd0ff82.1764950250.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Keep the pkg-config lookup for SYSTEMD_SLEEP_DIR, but fall back to
"$(prefix)/lib/systemd/system-sleep/" if the variable remains unset.
This avoids reintroducing a build-time dependency on systemd-devel while
still honoring the path provided by pkg-config when present.

Fixes: e54a6cd6a1f3 ("systemd: Add hooks to stop/start xen-watchdog on suspend/resume")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Build in which the regression was detected:
https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/10959608099
---
 m4/systemd.m4 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/m4/systemd.m4 b/m4/systemd.m4
index c47a25ef93..5fb5a7089e 100644
--- a/m4/systemd.m4
+++ b/m4/systemd.m4
@@ -81,7 +81,7 @@ AC_DEFUN([AX_CHECK_SYSTEMD_LIBS], [
 	], [])
 
 	AS_IF([test "x$SYSTEMD_SLEEP_DIR" = x], [
-	    AC_MSG_ERROR([SYSTEMD_SLEEP_DIR is unset])
+	    SYSTEMD_SLEEP_DIR="\$(prefix)/lib/systemd/system-sleep/"
 	], [])
 ])
 
-- 
2.43.0


