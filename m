Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9CE447706
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 01:48:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222878.385317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjspJ-0005FE-0U; Mon, 08 Nov 2021 00:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222878.385317; Mon, 08 Nov 2021 00:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjspI-0005Bn-RK; Mon, 08 Nov 2021 00:47:56 +0000
Received: by outflank-mailman (input) for mailman id 222878;
 Mon, 08 Nov 2021 00:47:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZOPF=P3=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mjspH-0004MH-9c
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 00:47:55 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82577403-402d-11ec-a9d2-d9f7a1cc8784;
 Mon, 08 Nov 2021 01:47:54 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id i63so914282lji.3
 for <xen-devel@lists.xenproject.org>; Sun, 07 Nov 2021 16:47:54 -0800 (PST)
Received: from localhost.localdomain (79-139-188-96.dynamic.spd-mgts.ru.
 [79.139.188.96])
 by smtp.gmail.com with ESMTPSA id p17sm1625266lfu.209.2021.11.07.16.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 16:47:54 -0800 (PST)
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
X-Inumbo-ID: 82577403-402d-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TugVlbRXpFiQ9yttEJ2CYhwYKdBA8PSz6pBjqNjtqe8=;
        b=qGyzuk9bzwP/18mgZA5opqkVY0uVUy+tVPfW2WYN1KphXlcW2Q+w2WAU/6WZNf57LM
         qJ4eYesG/AVtiYQbx6XiDRV7T5AuMxyGQ216v1qPIOzs89Hff+bf4lZf1jt+ER21rBOl
         HONymPsCAtxnkmv4pkJQTsQypH0+0XmtAGzllxDhcASTyvxis2fFkz6lytuE8myfCgCw
         m9JFB37KExTbVRxVqh3r/x0jYz92VN4nsKWVD0nWCm1XktHXgkzuksbVdAjBiuLFaKZ/
         AY7V9wqwv7IWe10elmoqy019vMjtrGfbjo+zM6o4NTXkbvdPF08pHM+GsNheZd6RkSJl
         Fhsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TugVlbRXpFiQ9yttEJ2CYhwYKdBA8PSz6pBjqNjtqe8=;
        b=SGJdwyS8l+2hYawjW3SX4Hj2vYs++xiy08jbvAM4gIe+0pbS620XM1N1YS53JokA3g
         1WC4aL7JVzafK2Wzj+/MydC1OXaCOhGnKr96Q3jghppCUmoXBqoBsKFWx/UmPyRK0A6y
         /ZQvD6dBLhLP4w9+e+0TtPpNDOPNdT3WN7bvOAO1/PzsPx/w0cN5bMZisGkpxqKJ+2FG
         9mOXHkPUvOP+NVAubZwwW4cO/t472UAMB8XaqL+Zy7A4TPAGQcorEHCKYhgFuoTvxCSy
         OplaAzlaTnrzug2AV2SPrd0CcBdVEaMo6QCNANpIqXvhGAlsLrmtNRv+l7XtWVkQTG/n
         4yGw==
X-Gm-Message-State: AOAM531yhtm+rELMmDQc/zNh/KpHGim91mdULAnwVNyUHQwb1T9OkA+7
	h52mbrl5WhH2Ny7VXtgAHIE=
X-Google-Smtp-Source: ABdhPJzFYVx5IFgfdDhOR9e83sgbkaPAeNsCANjmWUXHuabW0BVJv1Mhw8sAAFHy3OCvobmKncQgJA==
X-Received: by 2002:a05:651c:907:: with SMTP id e7mr81850646ljq.300.1636332474410;
        Sun, 07 Nov 2021 16:47:54 -0800 (PST)
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
Subject: [PATCH v3 04/25] reboot: Correct typo in a comment
Date: Mon,  8 Nov 2021 03:45:03 +0300
Message-Id: <20211108004524.29465-5-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108004524.29465-1-digetx@gmail.com>
References: <20211108004524.29465-1-digetx@gmail.com>
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


