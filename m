Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F920B29BDC
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 10:18:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085562.1443874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unv4Y-0004UF-9O; Mon, 18 Aug 2025 08:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085562.1443874; Mon, 18 Aug 2025 08:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unv4Y-0004Rz-65; Mon, 18 Aug 2025 08:18:30 +0000
Received: by outflank-mailman (input) for mailman id 1085562;
 Mon, 18 Aug 2025 08:18:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GLF1=26=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1unv4X-0004Rt-Gd
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 08:18:29 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eac82f3f-7c0b-11f0-b898-0df219b8e170;
 Mon, 18 Aug 2025 10:18:27 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45a1b0c8867so30403075e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 01:18:27 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a23e97c11sm116746055e9.1.2025.08.18.01.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 01:18:26 -0700 (PDT)
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
X-Inumbo-ID: eac82f3f-7c0b-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755505107; x=1756109907; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=067q2AjcoYjPVFAvXZaDbsE2Gw8SxtghbkprnJcBiao=;
        b=v96GZOxHIbE4wgU4rC4fRwAWmoMG2hPgAq5deNQkv9zqiJQ9BzEg0MTztB5baIm0Sr
         EGG3xN9fj7l2VZCEbKHU8xQBflagy/Nfn9vVR+BLu8saqgzFfYN8AeStCJy6Pc6RNI6/
         DvZ++F0ASzi+ldIbBEs3BLBABCBXlB6lxEMuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755505107; x=1756109907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=067q2AjcoYjPVFAvXZaDbsE2Gw8SxtghbkprnJcBiao=;
        b=G8xgh/EEvC7QP4on6nGyI62JveFtAr4nsp8z9adQZwRo+94NjBP+REz1454E3wT+jB
         jHNOQ5IePDrNbpEzb+DQJlJLydaqZHF6l/kVKjR9lbWPJ0rSDiBWYG1NxMzrEA2Ghl7c
         QqqQyT9oNaPNsYWMdpUF/oKj81CaOPvGbcB59jwgJCPcHenxbkakCBEV+xKs1y//mqCA
         BB9S7HUVyLC1AyEMKgXdTc5trjtjXVzI1YAY3PgZCAt3wu+4azFXG07eIx2NsqQN0Adp
         iACOn/NH114AK1juOOObfdSX1P2XIsVZZsCexPRKkhcUfuo16qHubN5Nq7SyGzuGU8jN
         3sWQ==
X-Gm-Message-State: AOJu0YxPXYWq2Kfzi9uraTaN+59mQS+NH2mDZ0nOOiHXgFY/eAWly1Xl
	+uLZumvEeRHU19c8ZPFuyvVTF4ZfmG5BBpIAJEjII5BP2eNnfODLfS3ePCsv5jM1DYBr3vzHLcj
	rSeio
X-Gm-Gg: ASbGncsoNbO3kkC6+F2m6IHENesFiDY3hbl2cb/oOtaPL6U0P2774NMy9Gb+ynyxvjg
	9imWwsDqGjlE6YBEahYEnLoQAG9Ndt05Jx1yUU3vAZXopbOKA52NEowFPv9N6O9gjH3DhsR2sv2
	9am2VILlF5NERT4tntKmBWZDlLHI2R4DVzZgyvHGyqkJ3h8YWLx046ch8ZjfckfIWQ8qKgAfHPx
	BFomaF8LiFi48R2iKzbUJ6ioL+kAnayNXXFfYyUQAFOUIV/U01U76i4NlqqItxZ4bJA2BQGwfru
	BoREbsr0CB8YJynWkDimp8VFyyYJz8D4JOd919OOMfn3ZpMpqKr+22DWyVGV0wKcfwYSOqxQKbK
	JVNBlNg1KjvRFn4JGnJIH0yKMDz+DUVQt9HOBoi6WP1JDuUXvPbZkTaKjKR/WpEOxlcthgp4nQx
	eM
X-Google-Smtp-Source: AGHT+IGHfN+AceJlN3nZWkqFiV9yZG8xzFCbXkv7C+0N9ju8kDecQH4tnxqTwGV/P3/zdhpcZuCHNg==
X-Received: by 2002:a05:600c:5287:b0:456:f9f:657 with SMTP id 5b1f17b1804b1-45a2185e6cbmr73896295e9.27.1755505106700;
        Mon, 18 Aug 2025 01:18:26 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH] arm/link: Remove exception table sections
Date: Mon, 18 Aug 2025 09:18:24 +0100
Message-Id: <20250818081824.3538065-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was almost certainly copy&paste from x86.  ARM does not us these nor
selects HAS_EX_TABLE, so drop the sections and their boundary markers.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>

Found because I'm getting rid of .ex_table.pre on x86 too.
---
 xen/arch/arm/xen.lds.S | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 9f30c3a13ed1..db17ff1efa98 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -86,16 +86,6 @@ SECTIONS
   } : text
 
   .data.read_mostly : {
-       /* Exception table */
-       __start___ex_table = .;
-       *(.ex_table)
-       __stop___ex_table = .;
-
-       /* Pre-exception table */
-       __start___pre_ex_table = .;
-       *(.ex_table.pre)
-       __stop___pre_ex_table = .;
-
        *(.data.read_mostly)
   } :text
 
-- 
2.39.5


