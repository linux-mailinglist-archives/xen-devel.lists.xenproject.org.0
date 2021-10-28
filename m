Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6603C43F1CF
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 23:33:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218298.378663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgD0t-0006fm-Ev; Thu, 28 Oct 2021 21:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218298.378663; Thu, 28 Oct 2021 21:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgD0t-0006d8-Bs; Thu, 28 Oct 2021 21:32:43 +0000
Received: by outflank-mailman (input) for mailman id 218298;
 Thu, 28 Oct 2021 21:32:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CzqG=PQ=gmail.com=digetx@srs-us1.protection.inumbo.net>)
 id 1mgD0s-0006d2-LE
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 21:32:42 +0000
Received: from mail-lj1-x234.google.com (unknown [2a00:1450:4864:20::234])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae7fa489-5528-4c65-a2fb-02d53d40de71;
 Thu, 28 Oct 2021 21:32:41 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id 1so7141681ljv.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Oct 2021 14:32:41 -0700 (PDT)
Received: from [192.168.2.145] (46-138-44-18.dynamic.spd-mgts.ru.
 [46.138.44.18])
 by smtp.googlemail.com with ESMTPSA id bi14sm474384lfb.290.2021.10.28.14.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 14:32:39 -0700 (PDT)
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
X-Inumbo-ID: ae7fa489-5528-4c65-a2fb-02d53d40de71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FNhb8m0Up8WrlODFU5XusWNjgw7FYM5tGcizMhHIPzY=;
        b=USVIOuLFNftY9TSlAv8GQB7acWI1sWWXinRBTyt58drm2RaLh5La11nG4ixMTMewfR
         mX32BgQ2N30EhppM8q0HGzyhqJFMUCJMnblCfs4t5KonQ44KE0wlYv2W8rFYqs4V2koj
         XX371v1ONZUx01vnBeB6kBqd5XtkGxjVTj1e6iP0L3n7qnRFNsZrpRBj/O9TAqf3J13f
         DVFT1FMABW5ltJOUpFKPkQHX+APbXjkM1X+NMw4LCmok7h64fUY8hoIatZpEbYmauo9R
         3tzIe6iUnZRzMnNPnMBZ+KjZo2BGgmZ8KUvvaXZMV9Llm3C259zfQ4YRn+8CQPkkCOFN
         RJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FNhb8m0Up8WrlODFU5XusWNjgw7FYM5tGcizMhHIPzY=;
        b=Oldo3Bdz2L/QQAAYffRTtq+Tv/lZqB0WTDaH+2xGR1XUVXOyMflqX37wPx11jLKGjW
         o+olBh/5Yl86GqcM02JAmN9TaOaDBQwVIgUxcXeCxEStBM6+s77jAAFU826oL0Mon17+
         FBnehB1Ui9zX5/qi0qVx/iD/dNuYWE6K5qv7KBifejac2MMX+UTW/3M6xXreEWvXYcxN
         EfmL9ijiUvSZSRK4gxvZebcBd38pr0laPLAyCxK/sSmqgF3SAhNr1VlsHkSlK4gwLQSy
         tlEv4SATBi5TUF4UcbkC18XMcups/0S8SuZfJXqawXZo2r3SmMgI6XfMkjKoqQVaEbHU
         7FJw==
X-Gm-Message-State: AOAM531HVdjQ3MfBgL/HEPAV8PWG4MGBojhkqcmLeyTuqGbKxoD9SZDZ
	/e4bfPEGuAUDlMbZZkGKP5w=
X-Google-Smtp-Source: ABdhPJwcWGds1J/UVngHunSwfN7ztb9W9OVxlAX827dktWLGe1JrS01AY9nWnDg96vqg3wWMmL+l6Q==
X-Received: by 2002:a2e:9b0e:: with SMTP id u14mr7220400lji.247.1635456760396;
        Thu, 28 Oct 2021 14:32:40 -0700 (PDT)
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
Message-ID: <c5fb7590-03a7-0eea-4040-07472a5c9710@gmail.com>
Date: Fri, 29 Oct 2021 00:32:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YXqCz/utp2DFJJ45@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

28.10.2021 14:00, Andy Shevchenko пишет:
> On Thu, Oct 28, 2021 at 12:16:33AM +0300, Dmitry Osipenko wrote:
>> Add atomic/blocking_notifier_has_unique_priority() helpers which return
>> true if given handler has unique priority.
> 
> ...
> 
>> +/**
>> + *	atomic_notifier_has_unique_priority - Checks whether notifier's priority is unique
>> + *	@nh: Pointer to head of the atomic notifier chain
>> + *	@n: Entry in notifier chain to check
>> + *
>> + *	Checks whether there is another notifier in the chain with the same priority.
>> + *	Must be called in process context.
>> + *
>> + *	Returns true if priority is unique, false otherwise.
> 
> Why this indentation?

This is the same doc-comment style used by this file in general. I
haven't tried to invent anything new.


> ...
> 
>> +	/*
>> +	 * This code gets used during boot-up, when task switching is
>> +	 * not yet working and interrupts must remain disabled.  At
> 
> One space is enough.

This comment is replicated multiple times over this source file. You can
find it before each down_write(). I borrowed the text as-is, for
consistency.

