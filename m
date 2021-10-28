Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D945243F269
	for <lists+xen-devel@lfdr.de>; Fri, 29 Oct 2021 00:11:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218337.378718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgDbM-0005Ag-LP; Thu, 28 Oct 2021 22:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218337.378718; Thu, 28 Oct 2021 22:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgDbM-00057q-IG; Thu, 28 Oct 2021 22:10:24 +0000
Received: by outflank-mailman (input) for mailman id 218337;
 Thu, 28 Oct 2021 22:10:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CzqG=PQ=gmail.com=digetx@srs-us1.protection.inumbo.net>)
 id 1mgDbK-00057k-JX
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 22:10:22 +0000
Received: from mail-lj1-x22f.google.com (unknown [2a00:1450:4864:20::22f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0aa95140-c52b-4e65-8fdd-845e731cab82;
 Thu, 28 Oct 2021 22:10:21 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id 1so7292795ljv.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Oct 2021 15:10:21 -0700 (PDT)
Received: from [192.168.2.145] (46-138-44-18.dynamic.spd-mgts.ru.
 [46.138.44.18])
 by smtp.googlemail.com with ESMTPSA id x26sm406331ljh.24.2021.10.28.15.10.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 15:10:20 -0700 (PDT)
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
X-Inumbo-ID: 0aa95140-c52b-4e65-8fdd-845e731cab82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oJ/0ZuzBVjUo38Wh85+gleqyoNxUo2tupcS3OG//HMk=;
        b=oyp+4ZpoBN8sNbj4o8xY6UXK7DWV+2AXCzvhz53IZDVW7yBXuU0WcYtlG9nrr26Gko
         pspAZNzk5nSawwOoCboqqIBx1NtwU9YP7ClGYgBOs5f5QS+oYjdLS6Chq+lHwnAJsaRE
         aw808EWXPhfWuOImaYWLgQPkx/4+EXGI76qDso1CJ2aKNZ2aChJYUzNXxoU4wlUL2Pxg
         oy7RsSyXKkJJvyMzgbQsMkVQ26q7g1vnPJco9ifX2k6oVsTB9g0J3QdHglNbFRrrT6c8
         P9uyPf++7eB6LV3eSwFOc5BxbfYBVDwZrUUANM1FlvuP72N8IokbXokq1o8sSzQ34LI5
         dsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oJ/0ZuzBVjUo38Wh85+gleqyoNxUo2tupcS3OG//HMk=;
        b=eF6E/13K+/QILADZS2G85WkBLSlXfXzCvrKPzmyPJUcijsrkrvdT5BANPXuFigxQTe
         gQEoLLttxW8AD8xoVzmch+uq26PybzA8HhGHk+UWBqzfxGpuoYEx1yUHZN6pwUwKeFz0
         Gvv8lSABguA9/xALSgY/eVJrx8DKVLr5EfQ1adsiq7XunQbpf7CEzpxOK5DxvZZq3znP
         gIAxR1551BRAWzc0sGcNv0gQrU8YCqCMSPUWiJGSNVMF4IRgv2vXLA4t/uqLQZNIY4LX
         picy8pGk0Vg6iJitKOREi12VJfz8JeGjWKQ1Isqe98YRzh0cDf7YtH8YOZAYzpWlx9KJ
         ka9Q==
X-Gm-Message-State: AOAM533lPjrPsxJhpRUPtJXXVyeRYWqiJY0QyTIGV1RLF5kY6Q53ynK8
	Qq+7h4dyJRw4cYVx8/JLw6Y=
X-Google-Smtp-Source: ABdhPJykwIAUVmO5wKdpzX+/iWk6pBH4AnIAWbvXPbs4nxxBZpydFbV5fsYhpk8QZgUr9D29NxqkEQ==
X-Received: by 2002:a2e:361a:: with SMTP id d26mr7788286lja.104.1635459020939;
        Thu, 28 Oct 2021 15:10:20 -0700 (PDT)
Subject: Re: [PATCH v2 03/45] notifier: Add
 atomic/blocking_notifier_has_unique_priority()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Len Brown <lenb@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Pavel Machek <pavel@ucw.cz>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-4-digetx@gmail.com>
 <YXqCz/utp2DFJJ45@smile.fi.intel.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ba9d1a3f-c3e4-7060-9859-97014aa633b4@gmail.com>
Date: Fri, 29 Oct 2021 01:10:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YXqCz/utp2DFJJ45@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

28.10.2021 14:00, Andy Shevchenko пишет:
>> +	while ((*nl) != NULL && (*nl)->priority >= n->priority) {
> ' != NULL' is not needed.
> 

I'll change it in v3, thanks.

