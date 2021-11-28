Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34342460A75
	for <lists+xen-devel@lfdr.de>; Sun, 28 Nov 2021 22:54:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234264.406568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrS7X-0004qB-3a; Sun, 28 Nov 2021 21:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234264.406568; Sun, 28 Nov 2021 21:54:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrS7W-0004nZ-Vj; Sun, 28 Nov 2021 21:54:02 +0000
Received: by outflank-mailman (input) for mailman id 234264;
 Sun, 28 Nov 2021 21:54:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YMG7=QP=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mrS7V-0004nQ-Pc
 for xen-devel@lists.xenproject.org; Sun, 28 Nov 2021 21:54:01 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b20f51a3-5095-11ec-976b-d102b41d0961;
 Sun, 28 Nov 2021 22:54:01 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id u3so39445017lfl.2
 for <xen-devel@lists.xenproject.org>; Sun, 28 Nov 2021 13:54:01 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id w15sm1168884ljo.97.2021.11.28.13.53.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Nov 2021 13:54:00 -0800 (PST)
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
X-Inumbo-ID: b20f51a3-5095-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6vgwLT/ouzyM4jlzEumPwuoC7gyZzE5j02z7WHT5gL0=;
        b=Ve2rGzh1LJA0+OcOlbbQ73O4vszbugE425G36NIT/LJkRhFMX190Vmwf9Z1u+DozQy
         nt7KBoHLP6NcqsCJJVf/XMiWi1msgC02rhfjLu8CKl0SI+0RrFvUKjFjlZH7bdfHOiEX
         jvvRM0yX0DY0N616Cr6USUXBiFSTo4izfqBOoNpjwV+G+cH1cFHUwmonpjoWJX8Ppl5i
         8dEUJUKATxCUbOfS4VM/cGGt6HuPu0povTPAj3Y6GTkQG70Ogmn5eg+CfWVBj+3pxNr6
         ReZIvwRQlO/G/fnEj5DP0/liBCD4UXfZ78eAcvQevgGY/DQsBvKDeMEPHSEvbIQ59N2I
         efCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6vgwLT/ouzyM4jlzEumPwuoC7gyZzE5j02z7WHT5gL0=;
        b=UHzw20klSYhU9JreG0u22kw4ZrGjV8TLTo1AQmxOOyjYwhTGw16VjRy2A9+275Iqvk
         puV1s4bJ0kamh7FSByzZdlSrEp5t5aEMBw7ghVcs/HbFnUe0fOlaDMGTEpDn8W8EpEjS
         1d5pzTgf6kmS9zjWzXj6/13ACTjW1sAeN0zqnsfn9x8A+3kOkekGY6P47+poRMoWU2a9
         dkpit8B9OPqs9e//BLC+fApeW/hI2CwO1qWAEumaYzTGRxWL7Qog35YHSPEieHihcuex
         EXby0GLkZyuXtu+qB13Nn7lJ/RMiJ+dmRyFTjA1cCti1tSo23vcbvaA4d8LFie4vQD2G
         Zn7A==
X-Gm-Message-State: AOAM530TtTim5k65y2yAR7unNfkP+eFcyogTY9ijksMTjZund9voqrfc
	1VskStSDFmTtPEu5rtrGz/U=
X-Google-Smtp-Source: ABdhPJxrac6Czjs8U2D2QGSscJN4jhlYtGpRqd/e7TNYLEXAP/IVggs/yFEWoCFlClXMagpvBwvrwg==
X-Received: by 2002:a05:6512:3c82:: with SMTP id h2mr44786433lfv.128.1638136440658;
        Sun, 28 Nov 2021 13:54:00 -0800 (PST)
Subject: Re: [PATCH v4 08/25] kernel: Add combined power-off+restart handler
 call chain API
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer
 <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sebastian Reichel <sre@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
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
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, alankao@andestech.com,
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-9-digetx@gmail.com> <YaLQqks8cB0vWp6Q@qmqm.qmqm.pl>
 <9213569e-0f40-0df1-4710-8dab564e12d6@gmail.com>
 <YaPx0kY7poGpwCL9@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1fa2d9d5-f5f6-77f5-adf6-827921acce49@gmail.com>
Date: Mon, 29 Nov 2021 00:53:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaPx0kY7poGpwCL9@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

29.11.2021 00:17, Michał Mirosław пишет:
>> I'm having trouble with parsing this comment. Could you please try to
>> rephrase it? I don't see how you could check whether power-off handler
>> is available if you'll mix all handlers together.
> If notify_call_chain() would be fixed to return NOTIFY_OK if any call
> returned NOTIFY_OK, then this would be a clear way to gather the
> answer if any of the handlers will attempt the final action (reboot or
> power off).
> 

Could you please show a code snippet that implements your suggestion?

