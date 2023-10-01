Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 827177B46FF
	for <lists+xen-devel@lfdr.de>; Sun,  1 Oct 2023 12:42:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610999.950442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmtsq-0000MC-8L; Sun, 01 Oct 2023 10:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610999.950442; Sun, 01 Oct 2023 10:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmtsq-0000FS-41; Sun, 01 Oct 2023 10:41:08 +0000
Received: by outflank-mailman (input) for mailman id 610999;
 Sun, 01 Oct 2023 10:41:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vg4g=FP=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1qmtsp-0000CG-3Z
 for xen-devel@lists.xenproject.org; Sun, 01 Oct 2023 10:41:07 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05e223a0-6047-11ee-878e-cb3800f73035;
 Sun, 01 Oct 2023 12:41:05 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9b281a2aa94so1532197566b.2
 for <xen-devel@lists.xenproject.org>; Sun, 01 Oct 2023 03:41:05 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
 by smtp.gmail.com with ESMTPSA id
 jx14-20020a170906ca4e00b0099caf5bed64sm15333657ejb.57.2023.10.01.03.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Oct 2023 03:41:04 -0700 (PDT)
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
X-Inumbo-ID: 05e223a0-6047-11ee-878e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696156865; x=1696761665; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6ur2qb0x8q/rSGOpgVJ8elvvt/Yb95eKWrvLo4QZJM=;
        b=fLCBdRga6In0ISY52389OVu1Sef8QQrL/3vlC5+YvKN0aRwu9of1czxC2lc/pozA4u
         NVZfqdIXHXSAivZYIXfcZv3RfAuZgoDziY4VqAVxQk7nJjIzzqdCZnpIHkL+ctLJbVxW
         Zi4lis9Jbk/HKUamEc/gAc0DPHJQd3+j0SGFa0kmKsxLHjE+RChkizMPh2xRSo1g+pAM
         x69xfq+cQaBNzvQgZ9p0PEBTppCYUfCFD2DcdpLcWskLiAwxP/eQNZG+78/davFGCpan
         w4ZgM262hZqACC49H89RxBOvzwwxFVHyuCbRFPFTRgJQ4x+s5sSVV026LVt6uiCx2Vcs
         33pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696156865; x=1696761665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6ur2qb0x8q/rSGOpgVJ8elvvt/Yb95eKWrvLo4QZJM=;
        b=wcoOekZpzrpQ5zwScuu4ji6C1JGwx8a/EmatnhlCGCKq7F9x4lzGliNDfLMxwdecPd
         3Zv0FNptiAQThrx+tOBk1AZMcs6diIeu3PHad2ltNOs3PtYUypFGRGnTLe4rUHZh2wKu
         ay63fGMNnvJTqbyLYFCt0+Z1XtBm2+aBMutuAQmWGpg+G0bIclRyaTQfJE/kgmiGpPSO
         yOqKj4oGT7dIC3CeoBcwnVdf0LijJ2pE29GzlHsZ8Cbirw+WLI5o8TTJH1BMM1RzTi7V
         xJHvh7//VaoEvl2+YL8gCSKXsMknX5id9R9EmpA7Wyz/lqnwZBIQYNOatZrhHzhJMSsr
         lO2g==
X-Gm-Message-State: AOJu0YyQB5W9G/VLwalE9OmrNecChjoHORquNkqMdOAC0P2lCPnsKvDT
	9S2XvqNaglLhk14kaqD6SIo=
X-Google-Smtp-Source: AGHT+IHiSe0AHyaEO3R17ZhQDfsCes5+q/9A9cLMJMLgBfw1ghBgw9I+0cdDupifN0wboisrAnr7BQ==
X-Received: by 2002:a17:906:51d5:b0:9a2:26d8:f184 with SMTP id v21-20020a17090651d500b009a226d8f184mr7068105ejk.51.1696156864627;
        Sun, 01 Oct 2023 03:41:04 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	xen-devel@lists.xenproject.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 2/3] locking/x86: Introduce arch_sync_try_cmpxchg
Date: Sun,  1 Oct 2023 12:39:10 +0200
Message-ID: <20231001104053.9644-2-ubizjak@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231001104053.9644-1-ubizjak@gmail.com>
References: <20231001104053.9644-1-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce arch_sync_try_cmpxchg macro to improve code using
sync_try_cmpxchg locking primitive. The new definitions use existing
__raw_try_cmpxchg macros, but use its own "lock; " prefix.

The new macros improve assembly of the cmpxchg loop in
evtchn_fifo_unmask() from drivers/xen/events/events_fifo.c from:

 57a:	85 c0                	test   %eax,%eax
 57c:	78 52                	js     5d0 <...>
 57e:	89 c1                	mov    %eax,%ecx
 580:	25 ff ff ff af       	and    $0xafffffff,%eax
 585:	c7 04 24 00 00 00 00 	movl   $0x0,(%rsp)
 58c:	81 e1 ff ff ff ef    	and    $0xefffffff,%ecx
 592:	89 4c 24 04          	mov    %ecx,0x4(%rsp)
 596:	89 44 24 08          	mov    %eax,0x8(%rsp)
 59a:	8b 74 24 08          	mov    0x8(%rsp),%esi
 59e:	8b 44 24 04          	mov    0x4(%rsp),%eax
 5a2:	f0 0f b1 32          	lock cmpxchg %esi,(%rdx)
 5a6:	89 04 24             	mov    %eax,(%rsp)
 5a9:	8b 04 24             	mov    (%rsp),%eax
 5ac:	39 c1                	cmp    %eax,%ecx
 5ae:	74 07                	je     5b7 <...>
 5b0:	a9 00 00 00 40       	test   $0x40000000,%eax
 5b5:	75 c3                	jne    57a <...>
 <...>

to:

 578:	a9 00 00 00 40       	test   $0x40000000,%eax
 57d:	74 2b                	je     5aa <...>
 57f:	85 c0                	test   %eax,%eax
 581:	78 40                	js     5c3 <...>
 583:	89 c1                	mov    %eax,%ecx
 585:	25 ff ff ff af       	and    $0xafffffff,%eax
 58a:	81 e1 ff ff ff ef    	and    $0xefffffff,%ecx
 590:	89 4c 24 04          	mov    %ecx,0x4(%rsp)
 594:	89 44 24 08          	mov    %eax,0x8(%rsp)
 598:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
 59c:	8b 44 24 04          	mov    0x4(%rsp),%eax
 5a0:	f0 0f b1 0a          	lock cmpxchg %ecx,(%rdx)
 5a4:	89 44 24 04          	mov    %eax,0x4(%rsp)
 5a8:	75 30                	jne    5da <...>
 <...>
 5da:	8b 44 24 04          	mov    0x4(%rsp),%eax
 5de:	eb 98                	jmp    578 <...>

The new code removes move instructions from 585: 5a6: and 5a9:
and the compare from 5ac:. Additionally, the compiler assumes that
cmpxchg success is more probable and optimizes code flow accordingly.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
v2: Improve commit description.
---
 arch/x86/include/asm/cmpxchg.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/include/asm/cmpxchg.h b/arch/x86/include/asm/cmpxchg.h
index d53636506134..5612648b0202 100644
--- a/arch/x86/include/asm/cmpxchg.h
+++ b/arch/x86/include/asm/cmpxchg.h
@@ -221,12 +221,18 @@ extern void __add_wrong_size(void)
 #define __try_cmpxchg(ptr, pold, new, size)				\
 	__raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
 
+#define __sync_try_cmpxchg(ptr, pold, new, size)			\
+	__raw_try_cmpxchg((ptr), (pold), (new), (size), "lock; ")
+
 #define __try_cmpxchg_local(ptr, pold, new, size)			\
 	__raw_try_cmpxchg((ptr), (pold), (new), (size), "")
 
 #define arch_try_cmpxchg(ptr, pold, new) 				\
 	__try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
 
+#define arch_sync_try_cmpxchg(ptr, pold, new) 				\
+	__sync_try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
+
 #define arch_try_cmpxchg_local(ptr, pold, new)				\
 	__try_cmpxchg_local((ptr), (pold), (new), sizeof(*(ptr)))
 
-- 
2.41.0


