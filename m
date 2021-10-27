Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6142E43D3EE
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 23:18:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217215.377141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqJC-0001XZ-Tw; Wed, 27 Oct 2021 21:18:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217215.377141; Wed, 27 Oct 2021 21:18:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqJC-0001TX-Qc; Wed, 27 Oct 2021 21:18:06 +0000
Received: by outflank-mailman (input) for mailman id 217215;
 Wed, 27 Oct 2021 21:18:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nMly=PP=gmail.com=digetx@srs-us1.protection.inumbo.net>)
 id 1mfqJB-0000sJ-8S
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 21:18:05 +0000
Received: from mail-lf1-x132.google.com (unknown [2a00:1450:4864:20::132])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69deffbd-45dd-4bf9-95f2-79beb43a3f9b;
 Wed, 27 Oct 2021 21:17:57 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id u11so9038212lfs.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Oct 2021 14:17:57 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:17:56 -0700 (PDT)
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
X-Inumbo-ID: 69deffbd-45dd-4bf9-95f2-79beb43a3f9b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4OzDm5Q6AH2k+PTLkkEFou1ZT7VKkxRv+kE3WUpAOf8=;
        b=UQ/1aCiL3zbAzp7+64ENWMFEP+bdpmbq+KH3NTi7hX2kN+fFVrO8S32QtOPwQfMxxS
         B4dmeXUf/BzuJhhzqG8VnHaUgY25bdcGnTrwxpDILzBPa9fYkIseD/FA90YqGQJP6GXZ
         PaIGof4Fo+LwMmngjVzKDktvBb6N6F/Oq7yFljDHwAcSrBHnke6Ooi6gGMrQtQGLY6gt
         DkEqtfwDzQkavBqxwLa+DWQ8L/Pn42h6a2KO1Y5kAXNNdt6/bA2gpVm767XfMu2cU+ZD
         8088MqymRILm5tETDMubwXrrDQl/PbR2eeFdMLFjmwWobAMprcx5uRuWc88/LBbNkX13
         zK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4OzDm5Q6AH2k+PTLkkEFou1ZT7VKkxRv+kE3WUpAOf8=;
        b=7j3IyY68TzNv5tdjXXE7+W/Y4efqcM8OnXKuAUH0Z8HvLDEFMXzNPu6dQHlZM2Bq4k
         2XMmCYgN/gKzXFUHPrldfDTGKZfnHbhr9hkuOvMqN6WIf3IGmqiT+weFsFjAhHr/EKvs
         aOuAfgf/EAYRMfyK87S/XfsSkK+h5vEafjKRWEkI16n5T+j5UiJKjopd0y12IxjN1bFc
         LNFFymRqB48awzR9T/MqGxj019M0ARI67Y+vGa970a8Y8np89rjBXcDs/o8h6tX1eCAE
         vb28fJJPMuPUFj7NwgvIUhcP9w+C/CrzveBO8k0Gm2p1IaOmQNekmjhxRvAbuLRMrG8T
         ptBg==
X-Gm-Message-State: AOAM532EQOPWywgYQYpDqQupjgGQhMZrohxfLb9FnyAqGCRXduFX+OPy
	jaESA1jIXeeXUVrpjp2ZHH0=
X-Google-Smtp-Source: ABdhPJyeN/kGQE6WfHsDgri2jvM3EdB0FfWjlbwbrCss0fAIUEYOe9Prwt7QavBIliqBuOmpkw05Og==
X-Received: by 2002:a05:6512:3f04:: with SMTP id y4mr128266lfa.180.1635369476308;
        Wed, 27 Oct 2021 14:17:56 -0700 (PDT)
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
Subject: [PATCH v2 02/45] notifier: Add blocking_notifier_call_chain_empty()
Date: Thu, 28 Oct 2021 00:16:32 +0300
Message-Id: <20211027211715.12671-3-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add blocking_notifier_call_chain_empty() that returns true if call chain
is empty.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/notifier.h |  2 ++
 kernel/notifier.c        | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/linux/notifier.h b/include/linux/notifier.h
index 4b80a815b666..054271e9cb20 100644
--- a/include/linux/notifier.h
+++ b/include/linux/notifier.h
@@ -173,6 +173,8 @@ int blocking_notifier_call_chain_robust(struct blocking_notifier_head *nh,
 int raw_notifier_call_chain_robust(struct raw_notifier_head *nh,
 		unsigned long val_up, unsigned long val_down, void *v);
 
+bool blocking_notifier_call_chain_empty(struct blocking_notifier_head *nh);
+
 #define NOTIFY_DONE		0x0000		/* Don't care */
 #define NOTIFY_OK		0x0001		/* Suits me */
 #define NOTIFY_STOP_MASK	0x8000		/* Don't call further */
diff --git a/kernel/notifier.c b/kernel/notifier.c
index b8251dc0bc0f..1f7ba8988b90 100644
--- a/kernel/notifier.c
+++ b/kernel/notifier.c
@@ -322,6 +322,20 @@ int blocking_notifier_call_chain(struct blocking_notifier_head *nh,
 }
 EXPORT_SYMBOL_GPL(blocking_notifier_call_chain);
 
+/**
+ *	blocking_notifier_call_chain_empty - Check whether notifier chain is empty
+ *	@nh: Pointer to head of the blocking notifier chain
+ *
+ *	Checks whether notifier chain is empty.
+ *
+ *	Returns true is notifier chain is empty, false otherwise.
+ */
+bool blocking_notifier_call_chain_empty(struct blocking_notifier_head *nh)
+{
+	return !rcu_access_pointer(nh->head);
+}
+EXPORT_SYMBOL_GPL(blocking_notifier_call_chain_empty);
+
 /*
  *	Raw notifier chain routines.  There is no protection;
  *	the caller must provide it.  Use at your own risk!
-- 
2.33.1


