Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C4C4A3B7E
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 00:38:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262558.454831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEJlE-0004Nu-ML; Sun, 30 Jan 2022 23:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262558.454831; Sun, 30 Jan 2022 23:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEJlE-0004J5-FS; Sun, 30 Jan 2022 23:37:32 +0000
Received: by outflank-mailman (input) for mailman id 262558;
 Sun, 30 Jan 2022 23:37:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=imrt=SO=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1nEJlD-0003lI-Nv
 for xen-devel@lists.xenproject.org; Sun, 30 Jan 2022 23:37:31 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 978fc314-8225-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 00:37:31 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id t14so17068583ljh.8
 for <xen-devel@lists.xenproject.org>; Sun, 30 Jan 2022 15:37:31 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:37:30 -0800 (PST)
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
X-Inumbo-ID: 978fc314-8225-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=omD9ii6hdmOPOLz0ZrMYTS/dF5Fa75SnRoAvSUBcMXk=;
        b=cQofKfpuj96FPKIuElG4JVB5ebsyCGvTeW5J4j2MH7X0WRLgzbVACf4DTute0QixNl
         XMz7+003bKZlwkXkPIQbN8oTinvwUmojDoYGjYhv7pjY2trTgrMx6mGzRdNnLsY8mkl2
         7WmE4naskN1xx+dSFpiWKWqfRvBmvOtiRbW6rsCNAcLJPNEVLDCe91z6iUu5+BFugaT2
         bIk9Hfq63C50xsIBoY2u595h9M/qG+2YlE2Nn78b7kg2gyK8fxA4P0H2C4WFKliLAVXZ
         7qPk0tNjqYTPF3ucU8/++kKEXP9ZHsFeIbMKK+4hihzAWu5kciFNMvK+pAj6fKNfAPQ5
         xmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=omD9ii6hdmOPOLz0ZrMYTS/dF5Fa75SnRoAvSUBcMXk=;
        b=TNqFMX/lCN/kF+KdaH2efVW/685vGXbXGrJBEbyapLPS6OyU70/2NekDKjbNtaGZCB
         VlR84cW1ese7GNzRcyGO+wYdAbv/MODmoWLSmgZOZJSyQ1ysjtLNtHXK73kueWxwmNpg
         xP5xlIwXWWphIWZa+76m7cBaxxLQBqYvsf/8cZdJewttLCOJY7cDJIoD2R4PCGOWZuTA
         5oFtHxS8s5jmwd/flz00rI++Q0qLQqG60N/o+TyzboM0lqee3g01I9Yfv9c+K9tLw+G6
         vsmeesRe92CtFuIJdznqSJ13gO4OFhzh5fywRXLlW3gsO/WpZQMyW/oc+RWqi6EM+/Qp
         /kEQ==
X-Gm-Message-State: AOAM533nbiNDcIwZHaHSeQo0bX4miikXIpWTCdYU0skZzsHxe5kMl+T5
	Ya+smpP8PEdOCPF/Bom5/6Q=
X-Google-Smtp-Source: ABdhPJzH4GGHER1dd7BkRpS9JCpguXkNuEOfM70GPh5pyei2pr3VhMNQQj2zlKMHcg7OCQ6lFFEolA==
X-Received: by 2002:a2e:7a06:: with SMTP id v6mr12281006ljc.301.1643585850758;
        Sun, 30 Jan 2022 15:37:30 -0800 (PST)
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
Subject: [PATCH v6 03/21] reboot: Print error message if restart handler has duplicated priority
Date: Mon, 31 Jan 2022 02:37:00 +0300
Message-Id: <20220130233718.21544-4-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
References: <20220130233718.21544-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add sanity check which ensures that there are no two restart handlers
registered using the same priority. This requirement will become mandatory
once all drivers will be converted to the new API and such errors will be
fixed.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 kernel/reboot.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index 6bcc5d6a6572..35f0cde641c1 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -182,6 +182,21 @@ static ATOMIC_NOTIFIER_HEAD(restart_handler_list);
  */
 int register_restart_handler(struct notifier_block *nb)
 {
+	int ret;
+
+	ret = atomic_notifier_chain_register_unique_prio(&restart_handler_list, nb);
+	if (ret != -EBUSY)
+		return ret;
+
+	/*
+	 * Handler must have unique priority. Otherwise call order is
+	 * determined by registration order, which is unreliable.
+	 *
+	 * This requirement will become mandatory once all drivers
+	 * will be converted to use new sys-off API.
+	 */
+	pr_err("failed to register restart handler using unique priority\n");
+
 	return atomic_notifier_chain_register(&restart_handler_list, nb);
 }
 EXPORT_SYMBOL(register_restart_handler);
-- 
2.34.1


