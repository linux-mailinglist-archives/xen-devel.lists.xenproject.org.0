Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D464F447714
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 01:48:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222879.385333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjspK-0005hD-Fa; Mon, 08 Nov 2021 00:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222879.385333; Mon, 08 Nov 2021 00:47:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjspK-0005bP-9r; Mon, 08 Nov 2021 00:47:58 +0000
Received: by outflank-mailman (input) for mailman id 222879;
 Mon, 08 Nov 2021 00:47:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZOPF=P3=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mjspJ-0004R0-2p
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 00:47:57 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 836ce4f1-402d-11ec-9787-a32c541c8605;
 Mon, 08 Nov 2021 01:47:56 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id b40so3076245lfv.10
 for <xen-devel@lists.xenproject.org>; Sun, 07 Nov 2021 16:47:56 -0800 (PST)
Received: from localhost.localdomain (79-139-188-96.dynamic.spd-mgts.ru.
 [79.139.188.96])
 by smtp.gmail.com with ESMTPSA id p17sm1625266lfu.209.2021.11.07.16.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 16:47:55 -0800 (PST)
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
X-Inumbo-ID: 836ce4f1-402d-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xS83fHvJX20ICn8zHYRDKvqQ1GY72vd2riIHxwkjweU=;
        b=KpydubZgLJ3vuCT00hrCdbf3OtAnjru1YwdDJxo9+hC27tQN3Q4KiomzYSDJMCZXbA
         EhaYZwalwwy91+aZLY1TS0S40bR84eElruKYesdGlVKFC/aUwPezwIPn/067lWyDW0+Z
         x4XmqT3PESi2/Nn4WIINCY94V/zeTchenrXpu2fqnWvEylnT7LN71F2WHWj7NjlVp0tD
         ugoKO0gc6fQ1WUgdslo/PfvFMxmzh/vxeeDZA6/emihAeEIqzA/7Lk07cW3q8vRXpO5g
         t/bVMWqe23nOV5HEFivxqx8tKkAzcIdw5EiLLiV/QpkyUezErBQd+Ycn225L15v7txub
         fGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xS83fHvJX20ICn8zHYRDKvqQ1GY72vd2riIHxwkjweU=;
        b=IbnzZolLb6TyGalImr++BgT4uNUHOaVG1KK/2ebvAWa5con1qocGtOmLx0x1nHThlU
         e+Sm7qwZX/+ZSCaKzM2WtiA/1kTci/Koh6u4e/J+rDfM3h5RlEhDz2QU7wHvxfs5H+L4
         kSQHgVvvyC1G/UIKMCUfeLuF6SCmpJfKOtPORUqmsXFyBTdkU07sY9ugGNvCi89w1uNq
         Wf0VrhmO2vP0BBXga9SMQI0x/ULljno8LWoVDRMT4svvflKZEkhPtKmtvmPBWabZ08in
         eeAXLnhDHqtE4LW+WHb52fFMWBTlKD7FMeCPCB7gbFlBjmFCQNXiuwWJeYQnvHo/90qF
         seKQ==
X-Gm-Message-State: AOAM533hEweRl4jzU6xQBOJGH9hcvpHXAMcwMb7+ph2YlTDx4bii1Tl4
	HiqsHDPgRXmIIOwiV5vgHsg=
X-Google-Smtp-Source: ABdhPJxCboLcXN9lEOmhNp5QiL1yAnh5Fr04KXxv3nzMPaKilPbSu8P/FkJk3gpH04kDYFe9UJDOXg==
X-Received: by 2002:a05:6512:1323:: with SMTP id x35mr74261803lfu.613.1636332476232;
        Sun, 07 Nov 2021 16:47:56 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
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
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee.jones@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
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
	linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3 05/25] reboot: Warn if restart handler has duplicated priority
Date: Mon,  8 Nov 2021 03:45:04 +0300
Message-Id: <20211108004524.29465-6-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108004524.29465-1-digetx@gmail.com>
References: <20211108004524.29465-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add sanity check which ensures that there are no two restart handlers
registered with the same priority. Normally it's a direct sign of a
problem if two handlers use the same priority.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 kernel/reboot.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index 6bcc5d6a6572..e6659ae329f1 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -182,7 +182,20 @@ static ATOMIC_NOTIFIER_HEAD(restart_handler_list);
  */
 int register_restart_handler(struct notifier_block *nb)
 {
-	return atomic_notifier_chain_register(&restart_handler_list, nb);
+	int ret;
+
+	ret = atomic_notifier_chain_register(&restart_handler_list, nb);
+	if (ret)
+		return ret;
+
+	/*
+	 * Handler must have unique priority. Otherwise call order is
+	 * determined by registration order, which is unreliable.
+	 */
+	WARN(!atomic_notifier_has_unique_priority(&restart_handler_list, nb),
+	     "restart handler must have unique priority\n");
+
+	return 0;
 }
 EXPORT_SYMBOL(register_restart_handler);
 
-- 
2.33.1


