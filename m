Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F026B4A3B77
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 00:38:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262556.454815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEJlD-00043j-24; Sun, 30 Jan 2022 23:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262556.454815; Sun, 30 Jan 2022 23:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEJlC-00041H-UI; Sun, 30 Jan 2022 23:37:30 +0000
Received: by outflank-mailman (input) for mailman id 262556;
 Sun, 30 Jan 2022 23:37:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=imrt=SO=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1nEJlB-0003lI-4m
 for xen-devel@lists.xenproject.org; Sun, 30 Jan 2022 23:37:29 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9570ed19-8225-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 00:37:27 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id u14so23249771lfo.11
 for <xen-devel@lists.xenproject.org>; Sun, 30 Jan 2022 15:37:27 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:37:26 -0800 (PST)
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
X-Inumbo-ID: 9570ed19-8225-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6/CD3Yv31GR8y8GlEUTCAOWsPgz1l4zxLQQTTW1e5nA=;
        b=eMhJF7grCwjcHhcO0w6NJcJWCpwGV9U0gCsMg0TGwobGBXDG7Vx/L97nAcGbsxn/0t
         lOUlBHMB48PlUMU15vUurm7j0pvN5BFXkJhFXzQtsg8F+BsiLTVvb3ey/9EANWthyhTT
         we8glm85/CmQP0QZ8+T+Lm4inD6Om2LbGaB9R6csyvcPXIEYpw/bulY/B/lTyYKOPz5Q
         wxGxNLfaFVrUEh4p7rOa6O9dbsq2pKYOYPMchljsZ3p2oxyKvQjmDp8knc5kaAt3dCPj
         bpgTHYROYSaO5OyxFwKNgiQ6VFzTC+FU7O5VMWWPycH5YgdBO3xjR5PNbDcl/bJI2s7Z
         GBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6/CD3Yv31GR8y8GlEUTCAOWsPgz1l4zxLQQTTW1e5nA=;
        b=e6WZ6Do4MwhebRncLyDamMXc4JqxHT66p3uyYqEORVoCwY6eBiBKRIiEh56mOviwnL
         kK+KjWCoXeb8A243O44ylxlj3IKoKONDg+NuqxzTHDn7hY+fQWhyRJWThhDOKi2+bs32
         tzBg7TPFTYoXd02CQ9Vn4CwQSyQz4FdP2ZMm6xeL/1JSuLSnlM6TKdLvWLr4Jxpp43UK
         XY/vivsVxMtNNvLLfjuCr6ItHUuWmXRK4D8Alg2ssUukPdGfCQlSj5ND2nBQCHuYDCDN
         v6YCjyK7AcnzrZcxcKwQH3vhpqgVxKoAduNcHjiNaqbhf++lQm5ga/BDd7YqvpKSxGUX
         Ol1A==
X-Gm-Message-State: AOAM533QjAOXQQYiBqISbWEX2Ivg1IQGjjrhBxWRw8lnjACdXvzNUuYG
	0OLxGlzNKxtaMyfKP4Oy3NY=
X-Google-Smtp-Source: ABdhPJx51hnlnQqEq7wZo+FkbVvoWM1PpIEWobaBlkXpSMr/tjqFbuGZX/Rv6DdZhPEAEqmSsBcOEQ==
X-Received: by 2002:a05:6512:38a6:: with SMTP id o6mr13194842lft.4.1643585847142;
        Sun, 30 Jan 2022 15:37:27 -0800 (PST)
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
Subject: [PATCH v6 01/21] notifier: Add blocking_notifier_call_chain_is_empty()
Date: Mon, 31 Jan 2022 02:36:58 +0300
Message-Id: <20220130233718.21544-2-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
References: <20220130233718.21544-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add blocking_notifier_call_chain_is_empty() that returns true if call
chain is empty.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/notifier.h |  2 ++
 kernel/notifier.c        | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/linux/notifier.h b/include/linux/notifier.h
index 87069b8459af..d4717bc0ab85 100644
--- a/include/linux/notifier.h
+++ b/include/linux/notifier.h
@@ -173,6 +173,8 @@ extern int blocking_notifier_call_chain_robust(struct blocking_notifier_head *nh
 extern int raw_notifier_call_chain_robust(struct raw_notifier_head *nh,
 		unsigned long val_up, unsigned long val_down, void *v);
 
+extern bool blocking_notifier_call_chain_is_empty(struct blocking_notifier_head *nh);
+
 #define NOTIFY_DONE		0x0000		/* Don't care */
 #define NOTIFY_OK		0x0001		/* Suits me */
 #define NOTIFY_STOP_MASK	0x8000		/* Don't call further */
diff --git a/kernel/notifier.c b/kernel/notifier.c
index ba005ebf4730..4ed6bda8f127 100644
--- a/kernel/notifier.c
+++ b/kernel/notifier.c
@@ -323,6 +323,19 @@ int blocking_notifier_call_chain(struct blocking_notifier_head *nh,
 }
 EXPORT_SYMBOL_GPL(blocking_notifier_call_chain);
 
+/**
+ *	blocking_notifier_call_chain_is_empty - Check whether notifier chain is empty
+ *	@nh: Pointer to head of the blocking notifier chain
+ *
+ *	Checks whether notifier chain is empty.
+ *
+ *	Returns true is notifier chain is empty, false otherwise.
+ */
+bool blocking_notifier_call_chain_is_empty(struct blocking_notifier_head *nh)
+{
+	return !rcu_access_pointer(nh->head);
+}
+
 /*
  *	Raw notifier chain routines.  There is no protection;
  *	the caller must provide it.  Use at your own risk!
-- 
2.34.1


