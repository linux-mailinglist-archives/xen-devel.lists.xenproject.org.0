Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE914A3BE8
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 00:47:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262624.454980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEJuQ-0005so-E1; Sun, 30 Jan 2022 23:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262624.454980; Sun, 30 Jan 2022 23:47:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEJuQ-0005qx-9l; Sun, 30 Jan 2022 23:47:02 +0000
Received: by outflank-mailman (input) for mailman id 262624;
 Sun, 30 Jan 2022 23:47:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=imrt=SO=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1nEJlg-0003l1-40
 for xen-devel@lists.xenproject.org; Sun, 30 Jan 2022 23:38:00 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7ccc007-8225-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 00:37:58 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id x23so23420527lfc.0
 for <xen-devel@lists.xenproject.org>; Sun, 30 Jan 2022 15:37:58 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:37:57 -0800 (PST)
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
X-Inumbo-ID: a7ccc007-8225-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6m8P3WoXpjmgm4wPv3Z7h5cBjPxfBSCYucbGZeGzChw=;
        b=pw0lvBk+dTz3ObiHx+Tziue58w6zUuZQVNJvU9S7GB+pTzwAHhgcj/iJlwXXxw2erP
         SjJaIXCKqSP4ZUdeywJtZKFLRYiUBBH6flK45216wEu+kAKbGqsUiHPKIi82YM1bz/wq
         bMKu0rK0969KEuxg/PSMaDE+zRgG2hxtPkS3M1mFIZPAgYW4ktfU2t1MzGq6fvtQ0WCp
         Y+7PFXh6gcLp4xF5Q6p6cFH24zY5vWjbmW+bewwmKwBTNzJ37xEIcDLIFgNsMgKiVVBl
         Kl81Cxsay4XTPckhsJ1WeXkyEjcWdoSjNX8wa8Lm2Ykdw2ly2wOfBD20u+sG0elmdIGM
         o1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6m8P3WoXpjmgm4wPv3Z7h5cBjPxfBSCYucbGZeGzChw=;
        b=jkEs2njEW84gNVPpCYG8+2LP1CDUpWpwSgeBeIGL+pDZ4iPRxVKQRKJHXuCfzlI3+2
         GFYyttjKRIx6JYAEJc7wiz7pOwkMyVfFCQxKPJd5ipYthx1apxBNnHyN42hkuL/JU+S9
         fyUzF37g0cdJmzOKAeB+Ca8GamqCl33+LdAqljEL6nPtwS35Mw1vayMgz+G1p1J3rmDP
         pTRMzWHVy8vja6KUZI9UK3GYGgZRNZrJ6ua5SM6cMRfwPb3x7Oz9YAzgGnbkTDiGo5wK
         XsFw/tnNrqdIOtSZtZetjmHV/7+77zv/UM6MVlrdMampmidoasR+DmfcFHlxUZM1xB99
         Bd+g==
X-Gm-Message-State: AOAM532tSX1ZFWBJbT3vDiSbHQ+FTQqcqa72AgrpQV7yq3wFOXnuJnea
	rjmohBJLHgDlrXi2dgrXfvk=
X-Google-Smtp-Source: ABdhPJym+9e+qz3b9Eox6rk6EROG58IYAq1gwBJQdx3IJq9mRqA6OUoE67/3HvdiOb6Vb5OIHzS4jw==
X-Received: by 2002:a05:6512:10c4:: with SMTP id k4mr13546209lfg.63.1643585878009;
        Sun, 30 Jan 2022 15:37:58 -0800 (PST)
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
	Sebastian Reichel <sre@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
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
	Ulf Hansson <ulf.hansson@linaro.org>,
	alankao@andestech.com,
	"K . C . Kuen-Chern Lin" <kclin@andestech.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v6 18/21] memory: emif: Use kernel_can_power_off()
Date: Mon, 31 Jan 2022 02:37:15 +0300
Message-Id: <20220130233718.21544-19-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
References: <20220130233718.21544-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace legacy pm_power_off with kernel_can_power_off() helper that
is aware about chained power-off handlers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/emif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/emif.c b/drivers/memory/emif.c
index 762d0c0f0716..cab10d5274a0 100644
--- a/drivers/memory/emif.c
+++ b/drivers/memory/emif.c
@@ -630,7 +630,7 @@ static irqreturn_t emif_threaded_isr(int irq, void *dev_id)
 		dev_emerg(emif->dev, "SDRAM temperature exceeds operating limit.. Needs shut down!!!\n");
 
 		/* If we have Power OFF ability, use it, else try restarting */
-		if (pm_power_off) {
+		if (kernel_can_power_off()) {
 			kernel_power_off();
 		} else {
 			WARN(1, "FIXME: NO pm_power_off!!! trying restart\n");
-- 
2.34.1


