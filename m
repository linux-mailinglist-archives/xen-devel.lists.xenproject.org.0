Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A488EA5F9FC
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 16:32:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912511.1318791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskY1-0000XP-96; Thu, 13 Mar 2025 15:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912511.1318791; Thu, 13 Mar 2025 15:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskY1-0000Pa-1E; Thu, 13 Mar 2025 15:32:37 +0000
Received: by outflank-mailman (input) for mailman id 912511;
 Thu, 13 Mar 2025 15:32:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a3gq=WA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tskXz-0007tP-QY
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 15:32:35 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61e3d338-0020-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 16:32:33 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ac2bfcd2a66so195988166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 08:32:33 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac3147e75f6sm94542466b.50.2025.03.13.08.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 08:32:30 -0700 (PDT)
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
X-Inumbo-ID: 61e3d338-0020-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741879952; x=1742484752; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pnkqaluj8B9YBV7qcBYIqpLoiXoQSDu6pxVexTlitI=;
        b=NrAf98HlnJiNUst+0n8I9m+0aWIvQL/Ygzabp3Y97fyO21SQHYEWcTLEg+x8tOFNFo
         6TV7rE4Y9wFJcadskO0ggEpugkvndhYFa7ib2nsoSiXLUyudi72DybQCyxUI1kaEF9kq
         ICoDrsfFg7Vj4tJtTQz5/iox824iUzaXEeu6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741879952; x=1742484752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0pnkqaluj8B9YBV7qcBYIqpLoiXoQSDu6pxVexTlitI=;
        b=eTucIz6jvyqM0/69gzNCZyI1HZOcITq0oFQ3914GBauppVLARw80kHiZ/zZx22sSIw
         ypLOdKTpn4X/4uextv+qQZdkP0ao9qFvsbnHvIcq1fQVlx/99YtARn5F2yVmiGfcQqwX
         kmLdo79QHxepJQpZSs4gKRw28wJkbKUlEwU/Pr4TjcVNV3s4pJz/2j4jmNTLVnwP0FX4
         waUQza/99BvA1rKOFVWQXspDkuYwukiBwEbRdOonx4AK4kW9cRaVVRFUCPjewtjiwlv5
         ZH7u0sBvuw53NGxU8EmYZgxQYwhmM6uh0cQoIIjPCq3V0C4yTmCnN08NyTBijzxKh29s
         bJmw==
X-Gm-Message-State: AOJu0YwMjGuJ9IKGhaV3dvWSpixc3JfvILqHelOJGyHKO77QV+2JNR00
	sxDt+61ymHs80iubFCTG9Otpb6+qoDhHaLjRna3DtkLz+qjGkQmllLo18B0cZxthYH4AAX4+y+/
	v
X-Gm-Gg: ASbGncsZMpEMjiwZGqFNOgxyPlxLwPDuJflnEv+bnvAVPQhfC0uBp0NwnuvZ/KKkzk1
	Lw8yK6OJ48ida/+OGXEvgyTKwbNaq6NpLss7bElcbjA5I5xSRsBLSQti+5umk7EPP94wMIawPqW
	+FGoYrlCSHRg2dR0XydIPXOm4c8uEfwNAt4KStMIb1pyITHOwtf4cHt0+5YR0n9sE0c3QwUW+My
	e5ZDiGj1++vY/yGePhKD7qPn3VkF2Ccem0p9uAsmmlEBgwET2CDRZxpgD6Xv6Iw3/J8WcbyhSLt
	1dSx/YZ9PrB7MUsbkDLNiMfVTPBqeoWjqE9d+8mqGUyInmSqXA==
X-Google-Smtp-Source: AGHT+IGiOn2t/rq7mDNKUqoGOEzt+MuTENHsD8/W2dHi4WucDuFyXSyonSuzTfGfMEGBBvn8+slrPw==
X-Received: by 2002:a17:907:2da6:b0:abf:6f44:bffa with SMTP id a640c23a62f3a-ac2b9ea39cdmr1744531166b.36.1741879950362;
        Thu, 13 Mar 2025 08:32:30 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 3/7] x86/dom0: placate GCC 12 compile-time errors with UBSAN and PVH_GUEST
Date: Thu, 13 Mar 2025 16:30:25 +0100
Message-ID: <20250313153029.93347-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313153029.93347-1-roger.pau@citrix.com>
References: <20250313153029.93347-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When building Xen with GCC 12 with UBSAN and PVH_GUEST both enabled the
compiler emits the following errors:

arch/x86/setup.c: In function '__start_xen':
arch/x86/setup.c:1504:19: error: 'consider_modules' reading 40 bytes from a region of size 4 [-Werror=stringop-overread]
 1504 |             end = consider_modules(s, e, reloc_size + mask,
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 1505 |                                    bi->mods, bi->nr_modules, -1);
      |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/setup.c:1504:19: note: referencing argument 4 of type 'const struct boot_module[0]'
arch/x86/setup.c:686:24: note: in a call to function 'consider_modules'
  686 | static uint64_t __init consider_modules(
      |                        ^~~~~~~~~~~~~~~~
arch/x86/setup.c:1535:19: error: 'consider_modules' reading 40 bytes from a region of size 4 [-Werror=stringop-overread]
 1535 |             end = consider_modules(s, e, size, bi->mods,
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 1536 |                                    bi->nr_modules + relocated, j);
      |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/setup.c:1535:19: note: referencing argument 4 of type 'const struct boot_module[0]'
arch/x86/setup.c:686:24: note: in a call to function 'consider_modules'
  686 | static uint64_t __init consider_modules(
      |                        ^~~~~~~~~~~~~~~~

This seems to be the result of some function manipulation done by UBSAN
triggering GCC stringops related errors.  Placate the errors by declaring
the function parameter as `const struct *boot_module` instead of `const
struct boot_module[]`.

Note that GCC 13 seems to be fixed, and doesn't trigger the error when
using `[]`.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 4a32d8491186..bde5d75ea6ab 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -684,7 +684,7 @@ static void __init noinline move_xen(void)
 #undef BOOTSTRAP_MAP_LIMIT
 
 static uint64_t __init consider_modules(
-    uint64_t s, uint64_t e, uint32_t size, const struct boot_module mods[],
+    uint64_t s, uint64_t e, uint32_t size, const struct boot_module *mods,
     unsigned int nr_mods, unsigned int this_mod)
 {
     unsigned int i;
-- 
2.48.1


