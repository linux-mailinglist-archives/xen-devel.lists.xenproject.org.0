Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 112E3447709
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 01:48:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222880.385345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjspN-00065X-1l; Mon, 08 Nov 2021 00:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222880.385345; Mon, 08 Nov 2021 00:48:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjspM-000620-RO; Mon, 08 Nov 2021 00:48:00 +0000
Received: by outflank-mailman (input) for mailman id 222880;
 Mon, 08 Nov 2021 00:47:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZOPF=P3=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mjspK-0004MH-TH
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 00:47:59 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 847dc7d0-402d-11ec-a9d2-d9f7a1cc8784;
 Mon, 08 Nov 2021 01:47:58 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id i26so26172911ljg.7
 for <xen-devel@lists.xenproject.org>; Sun, 07 Nov 2021 16:47:58 -0800 (PST)
Received: from localhost.localdomain (79-139-188-96.dynamic.spd-mgts.ru.
 [79.139.188.96])
 by smtp.gmail.com with ESMTPSA id p17sm1625266lfu.209.2021.11.07.16.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 16:47:57 -0800 (PST)
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
X-Inumbo-ID: 847dc7d0-402d-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=idp+KUM0Lads56hMjVdKoUEucrYOLC8M0llXkHYfiR0=;
        b=MSIokg9fBl5wCKU+YCh/ZsTnRbPxtyYkn0IXkmz1QgysWSCzedTHzXunmbe5h3S6bm
         UnVL+wV6mqmFlzA/9Cm1DjvGCGyG1UlF0UpjGzAyekOseWLiiFHuU/rzzoJCNBaI+Ut+
         tXv3jqiyClz8c/yGI+0sql8rliP5FMVBt2m13PFdeI0ncEKECxTJKTD2uIvZxfhnpZtc
         pTtiL6yFqIiWFaztPJXKxizN2sS1pJLHyx55ZI+6yNFLo/Lx5fkTcHCO0Wef47K1i5ee
         hCd51zpj+5nuMAdYUzdECYDopq77neBqCsiLrTGv9/feFU5+CZJd4t4x88wQvcjrAxlc
         1+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=idp+KUM0Lads56hMjVdKoUEucrYOLC8M0llXkHYfiR0=;
        b=iVOnovTtf/lAlmregCVYiSL33aPy45i+j/B+ViMmbQKRdVqzIsihs0DQvdmFhvtFF0
         ftvQqGCaClYkTwrlxhHfv9Gqv2uIA69Y/RGRMlZnPMdddJLGJXrUnlOWZM2z+JfDtbMP
         GjCd3SljAWpWuX1eEwBrzh4f8r0ocMIXYnY5WOYsaAcoToEkZz4AC8c+EEpyXmsIEgfJ
         dPARWLbopkrIoyUOgYI3MDf+xAcAyPdRm1sNmieIKd4T7oo6lkDho2OTnK0enA0vJn1T
         dTlLIzOwawrmGw9DVxqGmtFDjoSbeusIFBVggeJnua/80j5/YufVdysXkaNcM2JzYCka
         tP/Q==
X-Gm-Message-State: AOAM531OxRaqc+gqADGTflt3U0C1GVgRmA9NRTzAE/SVOQUuxOb/g4Vr
	jRq/kSPL6npD6AHBC9GGeDs=
X-Google-Smtp-Source: ABdhPJxSy/O3ZKQtb6VfZ0yaPaYZOmyzwu5OdP3V3ve+XGbVnBVt+toWzoBqdj+8FoRHXqlPFKwvJw==
X-Received: by 2002:a2e:b88f:: with SMTP id r15mr57944203ljp.309.1636332477998;
        Sun, 07 Nov 2021 16:47:57 -0800 (PST)
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
Subject: [PATCH v3 06/25] reboot: Warn if unregister_restart_handler() fails
Date: Mon,  8 Nov 2021 03:45:05 +0300
Message-Id: <20211108004524.29465-7-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108004524.29465-1-digetx@gmail.com>
References: <20211108004524.29465-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Emit warning if unregister_restart_handler() fails since it never should
fail. This will ease further API development by catching mistakes early.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 kernel/reboot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index e6659ae329f1..f0e7b9c13f6b 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -210,7 +210,7 @@ EXPORT_SYMBOL(register_restart_handler);
  */
 int unregister_restart_handler(struct notifier_block *nb)
 {
-	return atomic_notifier_chain_unregister(&restart_handler_list, nb);
+	return WARN_ON(atomic_notifier_chain_unregister(&restart_handler_list, nb));
 }
 EXPORT_SYMBOL(unregister_restart_handler);
 
-- 
2.33.1


