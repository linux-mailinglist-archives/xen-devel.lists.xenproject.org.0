Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6237743D3EF
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 23:18:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217217.377162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqJM-0002N8-IG; Wed, 27 Oct 2021 21:18:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217217.377162; Wed, 27 Oct 2021 21:18:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqJM-0002Iz-E5; Wed, 27 Oct 2021 21:18:16 +0000
Received: by outflank-mailman (input) for mailman id 217217;
 Wed, 27 Oct 2021 21:18:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nMly=PP=gmail.com=digetx@srs-us1.protection.inumbo.net>)
 id 1mfqJL-0000sJ-8f
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 21:18:15 +0000
Received: from mail-lj1-x22e.google.com (unknown [2a00:1450:4864:20::22e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ba8bc2f-320b-42ee-a31a-b7b5adb59c29;
 Wed, 27 Oct 2021 21:18:01 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id 17so3837676ljq.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Oct 2021 14:18:01 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:17:59 -0700 (PDT)
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
X-Inumbo-ID: 7ba8bc2f-320b-42ee-a31a-b7b5adb59c29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TugVlbRXpFiQ9yttEJ2CYhwYKdBA8PSz6pBjqNjtqe8=;
        b=LxdZEWQx3suPqkadhSlrIg8Y/wBbCgZ19oaPbtBfHJRBGXgu8OvRhmKtGBeiAtGOi+
         liDoShgJoGfChatXJvVHlGfhJqZTZfaSa614IMYrTFjYDb/peXO5oxQ8SJntz+ROu8lH
         ob1M7/DUPmtXRrZcD8cMolSz0IhB48FDFGrv8rmurlnFUtz5GHTwT3bfswp5rSRPgw7Q
         Bzriun3on2U4+nPpGH/7v8uRLlN52ALrwjKmwn0fNW7IfodPJ5+z4OBz44Q0tz7qr3AI
         hQkqoobZyhuG5/zdS6+8c5M7BaM8ouPopuZJKxbxjokH3QVc4vnRaK15kTyz9igV7eYm
         7uUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TugVlbRXpFiQ9yttEJ2CYhwYKdBA8PSz6pBjqNjtqe8=;
        b=IXqTipDTIzwpDTqhy+sJ2IQ63aPFevIucceFggjYkAVfMl3MI6aNEqDCQfnsfxrg2s
         6VnoCLe5tfoxmzSy7XljZfqR/ilFIOpVD0D1LfIa2zHN6T9LSq79Mx8g/yvcsD2ua433
         Fvk1iG3ZgfmxkpWG4Jc0M23rechwMW+3zslGdsEhvJd9Y6GtTQQ4nlEsNgIrReITu6+f
         AiiMFoud53eEVERoPpF0MunLXXFE/ckYHwklRyCrvUpcFM2qe0brRfhX8psi/4YxpI5M
         v0bjbuGv0rszvopx/HTYHD9r0jRXGNb/yora4p2RkcD3s9gijk469dyy/TaZuYp26WYI
         B9Zg==
X-Gm-Message-State: AOAM530g3PbQi30kHQQWbJVfy4MbDUuh6VD4iKoe3XmfJJoPCb6vBRmo
	3uhPgOnOkAvij/g1YEC/UD8=
X-Google-Smtp-Source: ABdhPJzuqmviV3vutEjHAVvh6ry+9Hwrmd//Nm2QPeCY1TzVEUwjdrrEOpdr1ds5exnt/bZhRUUrMg==
X-Received: by 2002:a2e:a5c8:: with SMTP id n8mr301030ljp.307.1635369480150;
        Wed, 27 Oct 2021 14:18:00 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Lee Jones <lee.jones@linaro.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Joshua Thompson <funaho@jurai.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nick Hu <nickhu@andestech.com>,
	Greentime Hu <green.hu@gmail.com>,
	Vincent Chen <deanbo422@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Pavel Machek <pavel@ucw.cz>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org,
	linux-omap@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-tegra@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 04/45] reboot: Correct typo in a comment
Date: Thu, 28 Oct 2021 00:16:34 +0300
Message-Id: <20211027211715.12671-5-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct s/implemenations/implementations/ in <reboot.h>.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/reboot.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/reboot.h b/include/linux/reboot.h
index af907a3d68d1..7c288013a3ca 100644
--- a/include/linux/reboot.h
+++ b/include/linux/reboot.h
@@ -63,7 +63,7 @@ struct pt_regs;
 extern void machine_crash_shutdown(struct pt_regs *);
 
 /*
- * Architecture independent implemenations of sys_reboot commands.
+ * Architecture independent implementations of sys_reboot commands.
  */
 
 extern void kernel_restart_prepare(char *cmd);
-- 
2.33.1


