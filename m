Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AD2C9E9EA
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 11:00:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176560.1501056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQjex-0004tU-9U; Wed, 03 Dec 2025 10:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176560.1501056; Wed, 03 Dec 2025 10:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQjex-0004ns-6Q; Wed, 03 Dec 2025 10:00:31 +0000
Received: by outflank-mailman (input) for mailman id 1176560;
 Wed, 03 Dec 2025 10:00:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1EAn=6J=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vQjev-0003xW-6g
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 10:00:29 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4a1ad3a-d02e-11f0-980a-7dc792cee155;
 Wed, 03 Dec 2025 11:00:27 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-64162c04f90so12009517a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Dec 2025 02:00:27 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-211.as6723.net. [185.5.253.211])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647510615c0sm18190969a12.30.2025.12.03.02.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 02:00:25 -0800 (PST)
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
X-Inumbo-ID: e4a1ad3a-d02e-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764756026; x=1765360826; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXdf7WuWMyXQpmMPvQ2wyLtkzf1aXZKEnXZRs84dpyw=;
        b=l2OndIrhi+lYpgMfWItPzwvkUve7BalYca9B1CVaXQe0A5j8s78TrJ573TlJYW8mnZ
         vF+GDKfXjQhM8o2F4wUWhPYJiyCMs91F/JGfvKzyjYyZmbQP/6ndo5jiW+YrN81TRMze
         h2Wx7EzfrcQ5BEINIe8iI4ivS1DsMTzhZBzTkuxWRmRZppRxhPw6IYfrcOZW8uhhHKQZ
         fUhvNauErPvgB6CsdEVtXP/dEM6pRfjwpRIp5v9PTMbpT6fBwQ8ttHFLTIHluAloEurI
         Ks5lEs28e+HvyRn2UVBlziEAAqSQThN/F+BMCng8V3+EgB8ce3ICp9Kf7/uZWC2sVL0q
         C1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764756026; x=1765360826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nXdf7WuWMyXQpmMPvQ2wyLtkzf1aXZKEnXZRs84dpyw=;
        b=bfduIFE0zkoALnFVBeMLiNjkiQHMWSYcIYWCLx0uSI04Jv5T1+lzz2cuzaCGyRWZeY
         zknX+5SvesHqq5fz0nzfK7Yi7z+RGOuA9o1FP3qKxgSOQwAHtkTUipx6vhcBSjeByUue
         CN5YqPpzMBwjSBdhFiJBIhNeUi9GBqqy+1cBj8R/CYzmaRxmQjBgcAweHO0YI8iFUkq/
         MwEUdnbJuUc7zITm5U3WTir/PxabaQo6V0gSpburQ5jg9iZtL92UU+aLeC0JUViN7gZ5
         cSuuGpPxPuqWH+fC3fB+xNWITb72ia+KD08pZPS57I18/2HdrfpzghxcdDVEEPlAirM2
         PZfA==
X-Gm-Message-State: AOJu0YzD799t2QP+0vq8zlj9/C4+IWCrhN9TsOB058El+8vdO2gq67jf
	bYHb79yoOnaCvZU6gbMzLIQEbC6lfmKj3lpeiVNVd4vaCpmBnBVqPndgA06A6a9x
X-Gm-Gg: ASbGncvHOnwp8s/OYHpLGDuFr07LEPZv6+R65zoIu4pfqSsvjpmwbM9lgnqwntqEkIk
	C1Hh7KyTzQHgPaC1SOjmjYM504u8r161NQvDXotISo0Z6Ac3VAEZXX4p4ypfGmsqAI8OIaXX7WQ
	0ZRfZ5tPjNWkqcZULS7Adn6Ky3+MvsswB7T/77kFq97WfTbAsogJbQjiOk80+u63Hzxv5WXPwRU
	GNpaOxW+XMVE4lSTINbH+3tN8yPUf6RH+uelHlbTTFPJlci/xCIqXs6fkBEdIt7KlefyJ8L9vkD
	hZ/m/wDWRrLZ/ydhUo7XSjPWaIfq/2nHb/GXgXlADXV8SKczy+G96jowljE2akhT/L3tqmduEjK
	bq1t+tTKmPlFYcdKGzPFI4lX2XHuxquT9/E5Ya+2azJJTJoNBpNBmvSWvaqTg9CG0vB7BR3J0b4
	jP1t9czcPHxQNbTuxNnJP2vRt/ozRAjCx7/2JK0kpWb1qs3Q==
X-Google-Smtp-Source: AGHT+IHN9WVLht4jgbNWDLGX4jppGZHfv1eLrOxJM+UkFra0ijDkGDuRMIp1r+Ddoxf/rDGyn0IOxw==
X-Received: by 2002:a05:6402:2687:b0:640:c8b7:f2bd with SMTP id 4fb4d7f45d1cf-6479c51971fmr1062217a12.29.1764756026191;
        Wed, 03 Dec 2025 02:00:26 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v15 3/4] SUPPORT.md: Document PSCI SYSTEM_SUSPEND support for guests
Date: Wed,  3 Dec 2025 11:57:06 +0200
Message-ID: <f92317db2d3d6ec1d1ee8978661f34206d50415c.1764755558.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764755558.git.xakep.amatop@gmail.com>
References: <cover.1764755558.git.xakep.amatop@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Add a new entry under the "Virtual Hardware, Hypervisor" section
documenting support for the optional PSCI SYSTEM_SUSPEND function
exposed to guests.

This function is available via the virtual PSCI interface and allows
guest domains (domUs) to initiate system suspend operations.

The feature is currently marked as "Tech Preview".

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in V15:
- no changes.
---
 SUPPORT.md | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index d441bccf37..8e7ab7cb3e 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -962,8 +962,9 @@ Emulated PSCI interface exposed to guests. We support all mandatory
 functions of PSCI 1.1. See below for the list of optional PSCI call
 implemented and their status.
 
-   Status, Mandatory: Supported
-   Status, MIGRATE_INFO_TYPE: Supported
+    Status, Mandatory: Supported
+    Status, MIGRATE_INFO_TYPE: Supported
+    Status, SYSTEM_SUSPEND: Tech Preview
 
 ## Virtual Hardware, QEMU
 
-- 
2.43.0


