Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8B746D1F2
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 12:17:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242199.418950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muux9-0005eV-Tv; Wed, 08 Dec 2021 11:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242199.418950; Wed, 08 Dec 2021 11:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muux9-0005bD-Qt; Wed, 08 Dec 2021 11:17:39 +0000
Received: by outflank-mailman (input) for mailman id 242199;
 Wed, 08 Dec 2021 11:17:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KNkV=QZ=gmail.com=jiangshanlai@srs-se1.protection.inumbo.net>)
 id 1muupE-0007Ud-1V
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 11:09:28 +0000
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e6e9293-5817-11ec-9d12-4777fae47e2b;
 Wed, 08 Dec 2021 12:09:27 +0100 (CET)
Received: by mail-pj1-x102d.google.com with SMTP id
 gf14-20020a17090ac7ce00b001a7a2a0b5c3so4089251pjb.5
 for <xen-devel@lists.xenproject.org>; Wed, 08 Dec 2021 03:09:27 -0800 (PST)
Received: from localhost ([47.251.3.230])
 by smtp.gmail.com with ESMTPSA id e4sm2315444pgi.21.2021.12.08.03.09.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Dec 2021 03:09:25 -0800 (PST)
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
X-Inumbo-ID: 4e6e9293-5817-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Kd9tDbqkXgV+uDS+ZN2PkifPpO4nwWCGziDx4Ai290=;
        b=DZBRV+VFT9+KfIlW9vI1YNTWjjSwY9UVdpausVhNvxvTeFCAhQr4BL86f1ZVb5wqYx
         daMm0jsnf1EZop+hPS3Rsl+eU347P7jXAR0P3RT2+WtY7EQ2A2yWN79dg12hx04Hs3DY
         iR2cUpLa4sLw2jps+ZS2rPZ95nG7mTU3J1k/V23q7IYOzjDvAuCF7BShXIc9S6F75RGg
         tKsQ5jKl/9h3kXq8Er5D+XxIEwR7FRorkvKKVlKBNuLRh7xuwrknY5JB9iLYWlgPc5Ip
         brHSmlHdSmwtVh6ZsE/XtTcbGI9NZy6tbBUp6sONJacjKJ0aJI0Wz9IDXReHISQ2qhXx
         46UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Kd9tDbqkXgV+uDS+ZN2PkifPpO4nwWCGziDx4Ai290=;
        b=ckuCa7xf9HC2M7SwH15Lt1z8BgwaooPpW6t1czVAVVQAPj06lA66j/cuEOg0gGDiq8
         qCMu924EbpK4NrVia2+RkulnNLNEmmVlIEhrZE3sfZhfYwHETvXuUEQ7fsRqFV0oXiVz
         Fz60KjtB3aCUkja55SN90v2hrrCWCV0inUl1cN5JkSQbFyUU0Swv5jZbJy1XcC0QJjH7
         NImcJZHjnV58vbz8ejbsIh21dgPHUsDeHcVAlLoTlIKhl2/g6P8MT0Ikj7Ygk5RtYE5A
         KG7LyTTj4NdV5VuZV5vGY69extgE9UzIJPzAAGJwD6uR41GAhlwjxcaCQz6nxrdlRlJX
         ABpQ==
X-Gm-Message-State: AOAM532DNMvkNCHxmy84mqytauBDn5WagnP9SatAoNoe912g8uN6bGNJ
	i1K7Rb/zvkyuFkgLCEvDjW8=
X-Google-Smtp-Source: ABdhPJwtuS/bFQhmnmbhADvj6guciKxV5lk7NvScGFOlc2udq8C8NxlaMojhnh/rnPK9YGSNXl3k8g==
X-Received: by 2002:a17:90a:e00c:: with SMTP id u12mr6251592pjy.139.1638961766047;
        Wed, 08 Dec 2021 03:09:26 -0800 (PST)
From: Lai Jiangshan <jiangshanlai@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	xen-devel@lists.xenproject.org,
	Lai Jiangshan <laijs@linux.alibaba.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juergen Gross <jgross@suse.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	"Kirill A. Shutemov" <kirill@shutemov.name>
Subject: [PATCH 10/11] x86: Remove the definition of SWAPGS
Date: Wed,  8 Dec 2021 19:08:32 +0800
Message-Id: <20211208110833.65366-11-jiangshanlai@gmail.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20211208110833.65366-1-jiangshanlai@gmail.com>
References: <20211208110833.65366-1-jiangshanlai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lai Jiangshan <laijs@linux.alibaba.com>

There is no user of the pv-aware SWAPGS anymore.

Signed-off-by: Lai Jiangshan <laijs@linux.alibaba.com>
---
 arch/x86/include/asm/irqflags.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/include/asm/irqflags.h b/arch/x86/include/asm/irqflags.h
index 87761396e8cc..ac2e4cc47210 100644
--- a/arch/x86/include/asm/irqflags.h
+++ b/arch/x86/include/asm/irqflags.h
@@ -140,13 +140,11 @@ static __always_inline void arch_local_irq_restore(unsigned long flags)
 #else
 #ifdef CONFIG_X86_64
 #ifdef CONFIG_XEN_PV
-#define SWAPGS	ALTERNATIVE "swapgs", "", X86_FEATURE_XENPV
 #define INTERRUPT_RETURN						\
 	ANNOTATE_RETPOLINE_SAFE;					\
 	ALTERNATIVE_TERNARY("jmp *paravirt_iret(%rip);",		\
 		X86_FEATURE_XENPV, "jmp xen_iret;", "jmp native_iret;")
 #else
-#define SWAPGS	swapgs
 #define INTERRUPT_RETURN	jmp native_iret
 #endif
 #endif
-- 
2.19.1.6.gb485710b


