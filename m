Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5A444770D
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 01:48:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222883.385373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjspT-000722-3g; Mon, 08 Nov 2021 00:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222883.385373; Mon, 08 Nov 2021 00:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjspS-0006tF-Lg; Mon, 08 Nov 2021 00:48:06 +0000
Received: by outflank-mailman (input) for mailman id 222883;
 Mon, 08 Nov 2021 00:48:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZOPF=P3=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mjspQ-0004R0-Oe
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 00:48:04 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87b2cf1f-402d-11ec-9787-a32c541c8605;
 Mon, 08 Nov 2021 01:48:03 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id 1so26205313ljv.2
 for <xen-devel@lists.xenproject.org>; Sun, 07 Nov 2021 16:48:03 -0800 (PST)
Received: from localhost.localdomain (79-139-188-96.dynamic.spd-mgts.ru.
 [79.139.188.96])
 by smtp.gmail.com with ESMTPSA id p17sm1625266lfu.209.2021.11.07.16.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 16:48:03 -0800 (PST)
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
X-Inumbo-ID: 87b2cf1f-402d-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4G0wXMIRKtQjgiQjhPPTWIJTonbxBMvj833mzQfGVdU=;
        b=pZM4dyJLpZuQQN9MKxqxWh2ay9Jz9HrL1fmeqS9nNncTMinNNbkFifMYemIkP10ewq
         aOcgRrY2mflO6w4CU4DWVtb4NJf8LJ09cb+4I8lu5CAdpcgFHZOWypryMKjG6pxQk30v
         HHxKdMnWsewf0Lr72sA/4D7j/+oVMAz5NIT6Dx+WfODzgJWcHLPwHQK2bS9nspE9HbYj
         KH8pWjHJhFKX5cXseGASxtgst4Xb08IYLLh7demjjXrnAtHZBLUGzPWDO0sopO7ORAdB
         IyKha6Jx2vHEF711na9BlaXxWi+SIASVGoKUbBydRwNdpvlEee/heWG+rY08IofMyDYw
         LNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4G0wXMIRKtQjgiQjhPPTWIJTonbxBMvj833mzQfGVdU=;
        b=rUhy25YBhGhDPY7hKEDRg0C7nR4bjq+mIRJoKt1+R74MgMBGT+U5tRMivuGPzIzBve
         zzRWOLvE7aK6oHQJgDsP5QYTd7Cv8qww6Mrvv0cthVum164b+fXQ3/6xBNjM3I9YABm+
         e5B/AApoJMya1Uvtd+iAPL75LBBJtV+/WmhbXcEOi8ApSV/cC1O0YjwBtMatjMzORIzb
         Pcc9FQ+kpWoTdQSDev6J7QBRRxTgTpUMUsovtD9Ym6KZIipIoLqeyy37cJdPyHBVk2fV
         RDIJPmAtk4BJBUvKAhzIS1QvlZhYUGp+YhNG3ISVN8bJKKYKnIrgpi6UDUkY6OG8FBBV
         n7XQ==
X-Gm-Message-State: AOAM530FdKsAgiOAQ51E9SbH14rPIyZDy6JiwME1AhnovDurf3W/cbDY
	rF2PeKtxGSfodmF5qkgY6l0=
X-Google-Smtp-Source: ABdhPJzQFKfMNiNYXj5yRO7/OE5m8N3DghG1lL0tpJVZgkyYCLISgT4TNAK4FZaulcFD/pTPpnDcrA==
X-Received: by 2002:a05:651c:1102:: with SMTP id d2mr11428220ljo.52.1636332483418;
        Sun, 07 Nov 2021 16:48:03 -0800 (PST)
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
Subject: [PATCH v3 09/25] ARM: Use do_kernel_power_off()
Date: Mon,  8 Nov 2021 03:45:08 +0300
Message-Id: <20211108004524.29465-10-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108004524.29465-1-digetx@gmail.com>
References: <20211108004524.29465-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kernel now supports chained power-off handlers. Use do_kernel_power_off()
that invokes chained power-off handlers. It also invokes legacy
pm_power_off() for now, which will be removed once all drivers will
be converted to the new power-off API.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/kernel/reboot.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/kernel/reboot.c b/arch/arm/kernel/reboot.c
index 3044fcb8d073..2cb943422554 100644
--- a/arch/arm/kernel/reboot.c
+++ b/arch/arm/kernel/reboot.c
@@ -116,9 +116,7 @@ void machine_power_off(void)
 {
 	local_irq_disable();
 	smp_send_stop();
-
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 }
 
 /*
-- 
2.33.1


