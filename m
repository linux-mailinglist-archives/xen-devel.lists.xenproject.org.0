Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A48A74B69
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 14:45:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930659.1333242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA0l-0005KD-QV; Fri, 28 Mar 2025 13:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930659.1333242; Fri, 28 Mar 2025 13:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA0l-0005GA-K0; Fri, 28 Mar 2025 13:44:39 +0000
Received: by outflank-mailman (input) for mailman id 930659;
 Fri, 28 Mar 2025 13:44:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZL4=WP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tyA0k-0005Dj-0v
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 13:44:38 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c99722b8-0bda-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 14:44:36 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso20815185e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 06:44:36 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8314f5c6sm73339085e9.40.2025.03.28.06.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 06:44:34 -0700 (PDT)
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
X-Inumbo-ID: c99722b8-0bda-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743169475; x=1743774275; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRRILQjHDNKqdyGUmo0RrPw+FSAhpbsG/wvAGzdfUcA=;
        b=n4f2eUb3f7BAGYc/xAi9LRmo/tU0Tmdf2BQbIwO7mH1IsDheKbtfmh3LwabA5xsLop
         ffUGB1I6PZOs8m0ECCpFTpFgGZvhz2VDwFx9wpgFe4XoS4LLeBakIaOue774+MeN9hTG
         vxDVj/N9WydIpqhdcgOVt9FbqL6kWWERzD37A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743169475; x=1743774275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NRRILQjHDNKqdyGUmo0RrPw+FSAhpbsG/wvAGzdfUcA=;
        b=NSAsqyx5UQB4GITmaeirf16vlp1Ia9aRBXSXJ/2ZVwqy8OTCQvdfr+Rk1pnhL7I7Xj
         nLPfjVSprDX1OGwjc6A3m13Gql9co3xL1b+bd5u0602bI8/dDvsjATDvbeOUmXM9Sjaj
         TDfc/jOFk/18BfgF0XP27XRK+MvbQl2wSbJ0VWkugxrtHTmxP1J92snk2haD03Z1avra
         d7s0YNYuS4nMjGDjX2ezEZdaNNoy6aBDIa4Rh+rwucdITyHwC//ht6uz9iHURQPWwKoi
         D78BBvy0BHuzzaD1x1Sq3Y1DNleNh4PbRrrlbpwT9BZwuJiSQ0B/DqJW1ZcWTzrMHEFM
         Kcdg==
X-Gm-Message-State: AOJu0YwlGGjq+qjMhN5a5IFzpfg+8kCOtGqd15QAq34wfMJNVxxp083e
	iIikG+VHN/wz4fQxpjGMA9BCOpMrwyony1MgskRnqjJeDK1EKlczSCN+61veC7XJzFAtYDjKTJk
	uqOk=
X-Gm-Gg: ASbGncvrwEuD+5RnRCMfvxr/IFiHIIhLo921mtX+R53vQ3IZTofZ6up+E25Vl7kf+Q3
	yTl/FCid5gDBsCYRyzcDU8DfvwXKrEV4oMT1G1vzMVYMhv3Qm9ik8pqUo93PkEGFmOnluKUMRNe
	/e2lQSi+HsghpIzKtB17ePSsXzeOtklZ9SKomm7qm3ADjyN1cFOZJvHTTtM85PNUNogO0Qogddb
	K6XzcOixzAp7ES591kNyjQeRY9dYsNY0gxCJM9abUaTypmacgR3qGcI/JqS4wWKzuLN7sZenc0y
	5TN0+UwL1QEcVFhduzg4znlAsswJEaxso4f8xw1Oq/SIzcFw+SZ2zlaIpwjTRkjGJPxtYb/48Gh
	kSODgUo4MKV3OdtbmDw==
X-Google-Smtp-Source: AGHT+IHqbQoB2iudC36JECsuxphrbT5v04XPCLu6L9Tg3pfb5AB90XdZUhIW+UVjFQbaG4W6hLUIAg==
X-Received: by 2002:a05:6000:1448:b0:391:11b:c7e9 with SMTP id ffacd0b85a97d-39ad175ba00mr6474469f8f.28.1743169475371;
        Fri, 28 Mar 2025 06:44:35 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Lin Liu <lin.liu@citrix.com>
Subject: [PATCH v5 02/16] xen: Remove __{BIG,LITTLE}_ENDIAN_BITFIELD
Date: Fri, 28 Mar 2025 13:44:13 +0000
Message-Id: <20250328134427.874848-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250328134427.874848-1-andrew.cooper3@citrix.com>
References: <20250328134427.874848-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There is a singular user.  It's unlikely we'll gain a big-endian build of Xen,
but it's far more unlikely that bitfields will differ from main endianness.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Lin Liu <lin.liu@citrix.com>

I'm tempted to simply drop the logic in maptrack_node.  If any big-endian
build of Xen came along, that's probably the least of it's worries.

v5:
 * New.
---
 xen/common/grant_table.c                  | 4 ++--
 xen/include/xen/byteorder/big_endian.h    | 3 ---
 xen/include/xen/byteorder/little_endian.h | 3 ---
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 6c77867f8cdd..d6886ee74847 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -979,12 +979,12 @@ static struct active_grant_entry *grant_map_exists(const struct domain *ld,
 union maptrack_node {
     struct {
         /* Radix tree slot pointers use two of the bits. */
-#ifdef __BIG_ENDIAN_BITFIELD
+#ifdef __BIG_ENDIAN
         unsigned long _0 : 2;
 #endif
         unsigned long rd : BITS_PER_LONG / 2 - 1;
         unsigned long wr : BITS_PER_LONG / 2 - 1;
-#ifndef __BIG_ENDIAN_BITFIELD
+#ifndef __BIG_ENDIAN
         unsigned long _0 : 2;
 #endif
     } cnt;
diff --git a/xen/include/xen/byteorder/big_endian.h b/xen/include/xen/byteorder/big_endian.h
index ce395a17f64b..9cfb567d51d5 100644
--- a/xen/include/xen/byteorder/big_endian.h
+++ b/xen/include/xen/byteorder/big_endian.h
@@ -4,9 +4,6 @@
 #ifndef __BIG_ENDIAN
 #define __BIG_ENDIAN 4321
 #endif
-#ifndef __BIG_ENDIAN_BITFIELD
-#define __BIG_ENDIAN_BITFIELD
-#endif
 
 #include <xen/types.h>
 #include <xen/byteorder/swab.h>
diff --git a/xen/include/xen/byteorder/little_endian.h b/xen/include/xen/byteorder/little_endian.h
index 8b118afba5e3..96c80eab2b12 100644
--- a/xen/include/xen/byteorder/little_endian.h
+++ b/xen/include/xen/byteorder/little_endian.h
@@ -4,9 +4,6 @@
 #ifndef __LITTLE_ENDIAN
 #define __LITTLE_ENDIAN 1234
 #endif
-#ifndef __LITTLE_ENDIAN_BITFIELD
-#define __LITTLE_ENDIAN_BITFIELD
-#endif
 
 #include <xen/types.h>
 #include <xen/byteorder/swab.h>
-- 
2.39.5


