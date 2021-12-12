Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96814471D1F
	for <lists+xen-devel@lfdr.de>; Sun, 12 Dec 2021 22:04:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245687.423828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwW0V-00051b-P8; Sun, 12 Dec 2021 21:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245687.423828; Sun, 12 Dec 2021 21:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwW0V-0004yt-Lf; Sun, 12 Dec 2021 21:03:43 +0000
Received: by outflank-mailman (input) for mailman id 245687;
 Sun, 12 Dec 2021 21:03:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lDYB=Q5=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mwW0T-0004BS-B7
 for xen-devel@lists.xenproject.org; Sun, 12 Dec 2021 21:03:41 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb8ff8de-5b8e-11ec-a74f-db008197e53d;
 Sun, 12 Dec 2021 22:03:40 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id i63so21125104lji.3
 for <xen-devel@lists.xenproject.org>; Sun, 12 Dec 2021 13:03:40 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id y4sm1197172ljp.16.2021.12.12.13.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 13:03:40 -0800 (PST)
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
X-Inumbo-ID: fb8ff8de-5b8e-11ec-a74f-db008197e53d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SiVmxmlmX7gD18KWJKuTaPa7pNX7A6+5Wut7BQEWlWA=;
        b=qyaqAU+HSKD+HsUBKg5AB4Grj9JsCbr9g/kNEIZtJUYDPkR5w7X3oEBoqbhkveHPA0
         i7WuMCFDqVmy4v4uwmxmKqJQgyKWbZxAuezUxU7vJ7Js6Vv9mGU7AXWM79sgkKDLmhWK
         jFp8UPoUTDTrVPMbjiOZPw0kaHhZEow7vk98bEAvorv4PN2Ae1WrpFauYpbNmt6sURPu
         EHsFzc94IQPacNeM0GpGjXTCkggEJqqfF6pqgsflI/TGqDXRSOm8kaL/erYImjVTvQQe
         TKd1cdir2wKhwb/5hDwmkKqbCAzORiU/FXU4xaDIEAT35buQchr71urUuURu0JjCKmA+
         4E2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SiVmxmlmX7gD18KWJKuTaPa7pNX7A6+5Wut7BQEWlWA=;
        b=A+Kj8svMQxNEGnEJSVZ9HSMEvBT1g4ryfbHLM/fllXW5MRzcjDJpCD20lIC9HQsdUt
         XZ7nD8HgCCs0dwnCEZlY1uxKlxxvtHiSKiY7q5ITJ4Ikf1BZuNIEi74Y1teMB/OvlCe3
         Pyy+q1wD5pamZzGnEjhmSkmbDWbcjYtaM7l4g3jXEQ1vWfAPKpMGcVDRD4nqLMsFNO+s
         dWWvwdegiifdM/fQCbJTSg/kCo4oTSna0joIcLUn6fVS+IX3BVyDgXUEOLt9cyLGw3uC
         xXg8N2/+Q1zaGOebomIIu8wWnvJObwENFR20HejxjqV0ZOXbedBRhVy+wKZvODLK+pOX
         MXHA==
X-Gm-Message-State: AOAM531ewvfvnFlwo+JmHu2IDnNAJukW7VUGBKc1d7BByrFniml8r28c
	yAOyNZULoN4+GM2BflnzFsU=
X-Google-Smtp-Source: ABdhPJzPB5bwYAfFOn1aDytHDcrWq16AdXdyLAU7ztJCQFx3xpkh7jhCINcDSwIbtlftQmSbgta8Pw==
X-Received: by 2002:a2e:9903:: with SMTP id v3mr25528327lji.143.1639343020440;
        Sun, 12 Dec 2021 13:03:40 -0800 (PST)
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
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v5 03/21] reboot: Print error message if restart handler has duplicated priority
Date: Mon, 13 Dec 2021 00:02:51 +0300
Message-Id: <20211212210309.9851-4-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211212210309.9851-1-digetx@gmail.com>
References: <20211212210309.9851-1-digetx@gmail.com>
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
2.33.1


