Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CEFC5DD69
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 16:25:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162730.1490267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJvfS-00029r-9t; Fri, 14 Nov 2025 15:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162730.1490267; Fri, 14 Nov 2025 15:24:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJvfS-00027J-74; Fri, 14 Nov 2025 15:24:54 +0000
Received: by outflank-mailman (input) for mailman id 1162730;
 Fri, 14 Nov 2025 15:24:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z9GA=5W=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vJvfQ-00027D-Tv
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 15:24:52 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fbae941-c16e-11f0-9d18-b5c5bf9af7f9;
 Fri, 14 Nov 2025 16:24:50 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47117f92e32so18108935e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Nov 2025 07:24:50 -0800 (PST)
Received: from localhost.localdomain (host-92-29-237-183.as13285.net.
 [92.29.237.183]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4779528bc65sm12875045e9.15.2025.11.14.07.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 07:24:49 -0800 (PST)
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
X-Inumbo-ID: 0fbae941-c16e-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1763133889; x=1763738689; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GoihnkQQg7m2cTYgG2dfKNFZpyLnFip0S/RUqN+DEps=;
        b=F8zWacwVvpK3CXKXQJlTR1IZLGnd3uklkyCFGZ+5wXzDVHHbNKrbsvErGsH681bMiO
         kOfCu/4JM4JyAX9IfIS8/Ev6itgbWdRv8D2DfQj1OxPTfD20Sxq0PuQOv6eZGXXyH78C
         jG+MvGZQ8dC+73D+igpoNaRRANNSOUvGSCA5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763133889; x=1763738689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GoihnkQQg7m2cTYgG2dfKNFZpyLnFip0S/RUqN+DEps=;
        b=cPPZ0dPMI0/OhB578ZqEJTM/xxVJ/jXGKB+qmf199j+ynDGVzGvzOBfwRacRA4ENF3
         sBC9dqlPemAm5ZQlcoa+pGPQaS5gFKzSAC0pDfi4qEnisGYo2I3SLv3aPbo4YGroToUM
         0vaqZ7694QhPFzWOhZ+HPAEPDeac7V1DznT5AUpBm/UGniLbsdpZdrh5+F4RnEDabkA4
         j3kkGgdztQY952awN/SFk2G1aLXkEkGJAwSErSPK4Tseet2eHp9cuBxGplWjRo8ya0sO
         S11608Oh9TCqdzAZX6D4ctn7ZKuVugopSLoClQOK736Fn/w/EG7wT8HdvfBlenGEoLIt
         QEgA==
X-Gm-Message-State: AOJu0YywLle69q37QbW5TYfx0RJcVmtOyb3r/s5lqL4Bflb9dWlGGqlF
	+VYM5jCYczTL5kxN+UchgToFxGBEJVO6uQo+pa2afn0k2HSX4q8P7YT5qQQVtJBXttPaYNDoVQD
	SXKv3tho=
X-Gm-Gg: ASbGncsUOOAeMu4RgtsMj/IIkWlz5ZswTHooG8Rwi1R+8XOYrVfI8fF/+e+5nfSx9Wv
	+dySc7KcSeh/lthfF7xbjI3Rx9jVPo0qpJ0pi5DfjSteucHmpUPCvdVk0n3gcbICxUaBIWMTNIU
	f06nOev2/Tbl36zh+Z3GVmCAn7/bkXPcHzwWpVWAFg5TXyHPWZg8uGoUNwvqoglYNf9uDxMTn9s
	OCMgaX06xq1sn5lhKArfw/uIu07KHyzfazBC+2kz/2Z+oUEHyRNHz1K0mRV3ZL814k+pWUid5vL
	2IZBa5cXXxM1mUYYbr6ePQMQ/y/lEGD0zse/zvB98zQvdaPHPcPuJ8JGWFV84oVk1YSNURtMF8G
	Sh9MyHr2GfsMG6t/SfdZnJCMBXJMWs4s+yNq0drO9sGdETvnoL9M1reeWs73ToL1XxJ2FyulKCp
	S4VsAet1QE6faVP2kGlqIgzpmySJwrAYYlcna43nC8De7gEmwNKsa8rcHdp7opiJqa0Z/4GWFx
X-Google-Smtp-Source: AGHT+IEw9Ty9IG/AH5XB+9Vx2DcGUaupVx0MzT5Wpp78jLleU3KLy5Q6qluD0X+trz+1+J7geL8PiA==
X-Received: by 2002:a05:600c:484a:b0:477:94e6:1c67 with SMTP id 5b1f17b1804b1-47794e61ce5mr5716935e9.35.1763133889544;
        Fri, 14 Nov 2025 07:24:49 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.21] x86/ucode: Add extra rows to the entrysign model table (again)
Date: Fri, 14 Nov 2025 15:24:47 +0000
Message-Id: <20251114152447.272823-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Link: https://git.kernel.org/tip/dd14022a7ce96963aa923e35cf4bcc8c32f95840
Fixes: ff8228ab4658 ("x86/ucode: Relax digest check when Entrysign is fixed in firmware")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Found because AMD have released ucode to fix RDSEED on this CPU, and I
cross-referenced the tables.

Again, for 4.21 even at this juncture.  It wants backporting everywhere in due
course.
---
 xen/arch/x86/cpu/microcode/amd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 550b8c1e57ec..4a7573c885e5 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -659,6 +659,7 @@ void __init amd_check_entrysign(void)
     case 0x0b1010: fixed_rev = 0x47; break;
     case 0x0b2040: fixed_rev = 0x32; break;
     case 0x0b4040: fixed_rev = 0x32; break;
+    case 0x0b4041: fixed_rev = 0x02; break;
     case 0x0b6000: fixed_rev = 0x32; break;
     case 0x0b6080: fixed_rev = 0x32; break;
     case 0x0b7000: fixed_rev = 0x32; break;
-- 
2.39.5


