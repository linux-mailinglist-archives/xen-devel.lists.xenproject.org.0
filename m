Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D59CB3C26
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 19:30:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183169.1505972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTOxJ-0005Rh-Dx; Wed, 10 Dec 2025 18:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183169.1505972; Wed, 10 Dec 2025 18:30:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTOxJ-0005LR-AK; Wed, 10 Dec 2025 18:30:29 +0000
Received: by outflank-mailman (input) for mailman id 1183169;
 Wed, 10 Dec 2025 18:30:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=unxu=6Q=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vTOxI-0004ng-E8
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 18:30:28 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cd9e046-d5f6-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 19:30:27 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so918205e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 10:30:27 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a886affb4sm1696105e9.3.2025.12.10.10.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 10:30:26 -0800 (PST)
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
X-Inumbo-ID: 4cd9e046-d5f6-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765391427; x=1765996227; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUBQ+EjjlmRnrYL1o1ghPld6WT4JV9PjEtakOWMelRw=;
        b=VKvrRrGZiOOcN1P1IfR4SgxWwv17ROavzzQ5BFF5qTSxSU2EDC8GmD5HRVrnyigqrW
         TqJ05dyjFAHdyYz6wx9W3p6b9lWl/a/WRE+JRvdAioUcpY1Z3YYrxfbfCw6zNEQG+YSP
         IvG6O0Ndgw/Wla+ng+2dagM7/2lavTcn/vVAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765391427; x=1765996227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xUBQ+EjjlmRnrYL1o1ghPld6WT4JV9PjEtakOWMelRw=;
        b=r+Qpgbxk9GjXAHnAHn8hpO+Ub4bHacT5v+C2q63UeuSQH1g3CSdwNKipXswj/r2W2h
         RzG6fuhVqFd2l2f7/afy5jVXEfdxYTBfGLYt6M+2TWRZBuUaMJ9U6rmfldpMyapJw8iP
         c9EszjUcHUQHBZyVeL9BSM+cz+iX6NzB9JVxm3bswAJ+Z/qrV42CTE+G3TQ7Q58CMpiY
         8ydToyIOkPpk3MfXuKtW4DMS17NyMp0mf+zWKxPnh5Ltn/nriw2DZ937UUcv4ND7cG6r
         RUGIjbfgNLcQQfVlNf44KJBJJo3ZeOpt7PANGwG9ODEx0mI9JkCUDkWmLyhQ/EBcx++N
         OkXQ==
X-Gm-Message-State: AOJu0YyXGMgracMHzDJurux0PngcW2S8k1eoO5Dm1+imS4OKOYTHBXOa
	3pboGNa70cO9pSt4l0BValYMkHff6qyQrkyW/0inoTtQ+Ssm0QUo0IGj0/JTMuJPQwwyAGU+o47
	E4LL4
X-Gm-Gg: ASbGncsytfJVETsp4iy/DkFippag6dZdOo+x7DbWuvL9omf3mzGVOvNsCtNPEGevIAU
	+wNN++pqpmwmRNeN6OcebQba29Uu8lyd/T0xXJXpKNZMoXwDwWJPHplzuucJy7hmfwb3FwWYPdg
	lEjhdAUxnyyPPe19TlTk+ot5MTt4oFY/28LxodFdiVZuG9RtuWEWAQ+eDx09FKYYg3daC7zTD88
	Su/p4vHXwwWkaqN5QvKW+bY/un6GiV1f1JDmr4tiIPMbLXVR1tzf7oIpU1D/SvFDGLdk0kE8Ucf
	Q1Bv6cou9ozTq5BHb0KPWTiuQQMjsYK60nChN/qib8bYfRkHGuoucyWMAyzNBgEmLXPZvsQHlZD
	yw+GhgijUn754Tql3dQul32ybjF7BxbvE+ljD+VqtJMiCJw7oyig53lU/Kxl9qyClF6fH1QLx/1
	Z2NDP2a6oUigxTuVzfJghJnBO/Df+pOSoh3WcRriS9SzQDp+T31G+1d/xx5Z/fUw==
X-Google-Smtp-Source: AGHT+IGHzYeimNoaPx8M3atd7epetX7tgiDEdgF73E1tDPW3yjPZvnhoUx8aBX88w2lQfEP4Yji+Qg==
X-Received: by 2002:a05:600c:8010:b0:479:3046:6bb3 with SMTP id 5b1f17b1804b1-47a837aca24mr29805455e9.23.1765391426830;
        Wed, 10 Dec 2025 10:30:26 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 4/5] x86: Fix missing breaks
Date: Wed, 10 Dec 2025 18:30:18 +0000
Message-Id: <20251210183019.2241560-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251210183019.2241560-1-andrew.cooper3@citrix.com>
References: <20251210183019.2241560-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the wider testing, some more violations have been spotted.  This
addresses violations of Rule 16.3 which requires all case statements to be
terminated with a break or other unconditional control flow change.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/domain.c          | 1 +
 xen/arch/x86/mm/shadow/hvm.c   | 1 +
 xen/arch/x86/pv/emul-priv-op.c | 1 +
 xen/arch/x86/pv/emulate.c      | 1 +
 xen/common/livepatch.c         | 1 -
 xen/common/livepatch_elf.c     | 1 +
 6 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 5e37bfbd17d6..b15120180993 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1517,6 +1517,7 @@ int arch_set_info_guest(
         {
         case -EINTR:
             rc = -ERESTART;
+            fallthrough;
         case -ERESTART:
             break;
         case 0:
diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
index 114957a3e1ec..69334c095608 100644
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -268,6 +268,7 @@ hvm_emulate_cmpxchg(enum x86_segment seg,
     default:
         SHADOW_PRINTK("cmpxchg size %u is not supported\n", bytes);
         prev = ~old;
+        break;
     }
 
     if ( prev != old )
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 08dec9990e39..fb6d57d6fbd3 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -407,6 +407,7 @@ static void _guest_io_write(unsigned int port, unsigned int bytes,
 
     default:
         ASSERT_UNREACHABLE();
+        break;
     }
 }
 
diff --git a/xen/arch/x86/pv/emulate.c b/xen/arch/x86/pv/emulate.c
index 8c44dea12330..b201ea1c6a97 100644
--- a/xen/arch/x86/pv/emulate.c
+++ b/xen/arch/x86/pv/emulate.c
@@ -120,6 +120,7 @@ void pv_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
         printk(XENLOG_G_ERR "%s(%pv, 0x%08x, 0x%016"PRIx64") Bad register\n",
                __func__, v, reg, val);
         domain_crash(d);
+        break;
     }
 }
 
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 9285f88644f4..b39f8d7bfe20 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -1924,7 +1924,6 @@ static void noinline do_livepatch_work(void)
                             p->name);
                     ASSERT_UNREACHABLE();
                 }
-            default:
                 break;
             }
         }
diff --git a/xen/common/livepatch_elf.c b/xen/common/livepatch_elf.c
index 25ce1bd5a0ad..2e82f2cb8c46 100644
--- a/xen/common/livepatch_elf.c
+++ b/xen/common/livepatch_elf.c
@@ -347,6 +347,7 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
                 dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Symbol resolved: %s => %#"PRIxElfAddr" (%s)\n",
                        elf->name, elf->sym[i].name,
                        st_value, elf->sec[idx].name);
+            break;
         }
 
         if ( rc )
-- 
2.39.5


