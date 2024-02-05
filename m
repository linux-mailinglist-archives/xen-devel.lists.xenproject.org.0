Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C41D0849805
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 11:48:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675778.1051245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwW8-0007pv-I0; Mon, 05 Feb 2024 10:48:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675778.1051245; Mon, 05 Feb 2024 10:48:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwW8-0007mv-FI; Mon, 05 Feb 2024 10:48:00 +0000
Received: by outflank-mailman (input) for mailman id 675778;
 Mon, 05 Feb 2024 10:47:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/8nl=JO=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1rWwW6-0007md-Qe
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 10:47:58 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0523a1f2-c414-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 11:47:56 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-511538be947so476423e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 02:47:56 -0800 (PST)
Received: from localhost.localdomain ([185.25.64.249])
 by smtp.gmail.com with ESMTPSA id
 vg7-20020a170907d30700b00a354a5d2c39sm4188301ejc.31.2024.02.05.02.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 02:47:55 -0800 (PST)
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
X-Inumbo-ID: 0523a1f2-c414-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1707130075; x=1707734875; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/qYpJWJ6YrcOns7diE+XyCUeN2tM6yt9XGqkK0qPIH4=;
        b=l0P1LythzGj619cydLWyxJigwYnXpbhFvA3dDp/D8uzu/Ar0Bw6FKUt7COc88aV6Lm
         telLIbj/cYo1Q8z6hmGZLoM0RKLyTRDxIiVAZsnp9cbTcahuomMvDCTvaFtgnAOtAugp
         V3TXNgas21klU3CAkir3+MifqT2c7bfN6kUtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707130075; x=1707734875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/qYpJWJ6YrcOns7diE+XyCUeN2tM6yt9XGqkK0qPIH4=;
        b=HYNTSNo1Ba0Dam0OChJHzrL/tXyAIyn1hR8yXraXfS+JiWOuzADn3QdyKovfZruFSn
         O+PwqJrCrNjN9DuDcELMXdiugZ/p8HVqzkvPkLhskGgIvbAxBkVATDQcLqsn2SLzx/TW
         5YnGJoXab0VaGIO8GIx8GoRj0DBuR+dWmK5y3Zkon46CxwCI0Qy3xMdOYeHK1pmNPBED
         Y9wG+BXbnZ2JZYicsMcNSTDQEs4JrCfEFTDwcnRVfXtMNkSubnWU7nxD3yrxsfR9HvkG
         eVfZ0YpdpRagDp8o+vQy/hFxOKtt+qK9nl4b1nDHjyRWk3l5iDMkbQVuOWNlhkk29n8V
         ObyQ==
X-Gm-Message-State: AOJu0YxBG5x2nkB13Sio5W17+3Mi8aUlmZLnVOPWTFOeJy3cLmmzFkTJ
	dSsy141IOF/hMvjrie/1TOmqDyreLL+rzOnUd1FEU09zCRiGpkeHwqexpQEjRNA=
X-Google-Smtp-Source: AGHT+IFjkCT9bPQ+NJkTyB8Yw50hamladXzXCjyeZSV28bhMrO5ypS+sRo/VpPqf781XBVZi81ypYw==
X-Received: by 2002:a05:6512:21ce:b0:511:add:cfe9 with SMTP id d14-20020a05651221ce00b005110addcfe9mr6991715lft.26.1707130075494;
        Mon, 05 Feb 2024 02:47:55 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWPMEAR/GZxphCk5ZD6P8CiDrKyXeA8r/3M9Ldir3dqtahAJXXBP/QdSnf4VW9aiwxDkBcL08qVdLA2bMuAlvZXSz2z1G0FD18ntWniP+zWVS9emXF1OoK6PrM+rYsY4dtmVBqwifzOotQKh1DqDVqcoXWjSsf7bFVmWmcgyas5I8Xuq11Qe0yEF7EqF9Ka18IYpuAxauGiQKrkLyw7kxbm
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@cloud.com>
Subject: [PATCH 3/5] Use more specific constant
Date: Mon,  5 Feb 2024 10:47:40 +0000
Message-Id: <20240205104740.14905-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__HYPERVISOR_arch_1 and __HYPERVISOR_paging_domctl_cont for x86
have the same value but this function is handling
"paging_domctl_cont" hypercall so using the latter mnemonic in
the code is more clear.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/mm/paging.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index 541c2ea9b2..2961ca734d 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -783,7 +783,7 @@ long do_paging_domctl_cont(
     rcu_unlock_domain(d);
 
     if ( ret == -ERESTART )
-        ret = hypercall_create_continuation(__HYPERVISOR_arch_1,
+        ret = hypercall_create_continuation(__HYPERVISOR_paging_domctl_cont,
                                             "h", u_domctl);
     else if ( __copy_field_to_guest(u_domctl, &op, u.shadow_op) )
         ret = -EFAULT;
-- 
2.34.1


