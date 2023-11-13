Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7223A7EA0FC
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 17:10:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631766.985465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2ZVy-0001MA-Jd; Mon, 13 Nov 2023 16:10:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631766.985465; Mon, 13 Nov 2023 16:10:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2ZVy-0001JF-GL; Mon, 13 Nov 2023 16:10:18 +0000
Received: by outflank-mailman (input) for mailman id 631766;
 Mon, 13 Nov 2023 16:10:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h1x5=G2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r2ZVv-0000kV-2j
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 16:10:15 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2075e6e3-823f-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 17:10:13 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50a6ff9881fso5115678e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 08:10:13 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 l10-20020adfa38a000000b0032dbf26e7aesm5768973wrb.65.2023.11.13.08.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 08:10:12 -0800 (PST)
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
X-Inumbo-ID: 2075e6e3-823f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699891812; x=1700496612; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEyJPbz5vLaL820Iu2zEMIkHFyVdUrRe5Vuo+rlUsto=;
        b=Mis/sw99hubGjZD36g1d1MBuwUVB+T2G95NCiAgTbwlUpj7fa2tBA+EWlbQ3a4d9J1
         v9fF8wmJYfHOS1WhCx9684NuqJMJ2iJPGPfJe1s8PqfpBTsscLxaDiwlo/HSrcZpZYFD
         xmW5sIKpje1soy0MOsdeYcnq5m7ptg/KxcNfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699891812; x=1700496612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEyJPbz5vLaL820Iu2zEMIkHFyVdUrRe5Vuo+rlUsto=;
        b=dDbp+JB2plHZDA6Qfs1pDNmF/is0uP3pFDQBMFehiPcP7QQptLhmWDAkjkt/z+qdCU
         7C6i2pZgRK+awVsDBeReBQ/V9Hu20HzAoSoF4tyfCbTcscPtic1eu8uXdtnk95c1HBde
         eBOGxlFKT017LD8OMAKCiRvTzzCFs8WS3KkdI8Vgdj3hNKGhkSuva2cOvu2tXSBkHSNk
         auUqFWR8K3ixXzUZdUH3ooNcJPrbr4pm4YheAdL+zrd+q8wbSShSa5yNc0IjzbTLce7x
         TgM1uYlopaSbBBV2mBsFTb/bo/GgaPABrfxQtkSDfyu4cRBAlRBOhR4PC9dra0F0btzS
         qQWQ==
X-Gm-Message-State: AOJu0YwjFFHEyJZxeuTOfIWH7zY3uAMhm19HTvHoFUyl8/oNnXOCx1vr
	nMxLwyWQkyRuU2TD0rl9b1tUmfkqQ+vJBWsTep4=
X-Google-Smtp-Source: AGHT+IGywKZgKPdGiy6N9PoH+At+Tuafu6qeoZrvgjPcbES4qr0U9kIS4TqkCINRmv2eh82aCAweKA==
X-Received: by 2002:ac2:43a3:0:b0:509:3bba:e8a with SMTP id t3-20020ac243a3000000b005093bba0e8amr4325582lfl.39.1699891812416;
        Mon, 13 Nov 2023 08:10:12 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 2/2] livepatch-tools: fix isnumber() function clash
Date: Mon, 13 Nov 2023 17:09:40 +0100
Message-ID: <20231113160940.52430-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113160940.52430-1-roger.pau@citrix.com>
References: <20231113160940.52430-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

isnumber() is already defined for some libcs [0] but the interface is not the
same, the isnumber() helper just checks if a single character is a digit.

Rename isnumber() to is_number() in order to avoid the clash.

[0] https://man.freebsd.org/cgi/man.cgi?query=isnumber&sektion=3

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 create-diff-object.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/create-diff-object.c b/create-diff-object.c
index 67784642bcd7..d0e14e3a62bb 100644
--- a/create-diff-object.c
+++ b/create-diff-object.c
@@ -1352,7 +1352,7 @@ static void kpatch_process_special_sections(struct kpatch_elf *kelf)
 }
 
 /* Returns true if s is a string of only numbers with length > 0. */
-static bool isnumber(const char *s)
+static bool is_number(const char *s)
 {
 	do {
 		if (!*s || !isdigit(*s))
@@ -1380,13 +1380,13 @@ static bool is_rodata_str_section(const char *name)
 
 	/* Check if name matches ".rodata.str1.[0-9]+" */
 	if (!strncmp(name, GCC_5_SECTION_NAME, strlen(GCC_5_SECTION_NAME)))
-		return isnumber(name + strlen(GCC_5_SECTION_NAME));
+		return is_number(name + strlen(GCC_5_SECTION_NAME));
 
 	/* Check if name matches ".rodata.<func>.str1.[0-9]+" */
 	s = strstr(name, GCC_6_SECTION_NAME);
 	if (!s)
 		return false;
-	return isnumber(s + strlen(GCC_6_SECTION_NAME));
+	return is_number(s + strlen(GCC_6_SECTION_NAME));
 #undef GCC_5_SECTION_NAME
 #undef GCC_6_SECTION_NAME
 }
-- 
2.42.0


