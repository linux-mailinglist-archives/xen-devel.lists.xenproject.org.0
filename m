Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9126D4613FA
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 12:36:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234480.406889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrevv-0004DW-8d; Mon, 29 Nov 2021 11:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234480.406889; Mon, 29 Nov 2021 11:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrevv-0004BK-5Y; Mon, 29 Nov 2021 11:34:55 +0000
Received: by outflank-mailman (input) for mailman id 234480;
 Mon, 29 Nov 2021 11:34:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zy8G=QQ=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mrevt-0004BE-Pp
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 11:34:53 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5db4c988-5108-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 12:34:51 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id k23so33881988lje.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Nov 2021 03:34:51 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id n2sm131579ljq.30.2021.11.29.03.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 03:34:50 -0800 (PST)
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
X-Inumbo-ID: 5db4c988-5108-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=euaa0MK3qpl38vu/xm/JZntaVOCHcXyS5pdHcr9Cv9Y=;
        b=j7IepB0c7QsF+gZGn8sLWlXDCQr83Yhq9Uwq9fJmgvQdhWWCer0J3Db/gwAG0Blu3V
         KLIiDLWANtPW2sX+O/m2jQqBDLC+4NfkDAxYnlnBfxi7qlePYrZZysw0Kj4NFPMagEe7
         5Z58UnljUl1PUrtNNqQtNaR8rjEOAOjAptz9aZ81TzHnOGVzQL+Ka518l0o45nrM05c1
         wTSb3kazkFWdVLhzdtamDwO56fb5XsgOF41m+pkkrOCbpYLS/NmBUtznRV2wcvObV+eX
         /QUCocD7Th3AP/6bIoc90HuBDrH/5Le5nNAAFps88ziv0187Td+CIqcDZxoQmDkSEFJt
         ILjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=euaa0MK3qpl38vu/xm/JZntaVOCHcXyS5pdHcr9Cv9Y=;
        b=cmMFXfKuwsyrQjfe43hHougcmfsoD4SOE8lbsDQcZjz0UWxSVZTGlh3oT+EJ1scquI
         EsD261EPVu/jtk/76NhNxtzGYgc8Bd136l/b3XZD/zn8rNwv28/O6FJmLFYwMNz8lHGh
         hqdsC7VH3MqW22HKMkiLwRPRKlbUuQlkaB7elpmH//4R5hOQhvrw+XrfQHrtUTHdDuNy
         B+SJKx622/q3U/24gTHzXslaOdlkNhY9X1DJZkhLvFlS/sXFtletrqAEiKOeNVIyiPPm
         o9qUgxG6brh/5zMgCNGO51HGNFEKVToFd2vFhnxtmVx9MwQUzRMemLjvptSoTEOnsueu
         aDOA==
X-Gm-Message-State: AOAM530251nwqZBXSGToxQNYqcmiyWCJXvZVSkie1MOKwLZxMIdie5Rh
	BfEeRRdfPnoVed5VSiPoSmU=
X-Google-Smtp-Source: ABdhPJzVpycz41Q2saZagDnrHTPX3H5Cn8S9UMBEs5Q4UAjlx4ArmiP2PAHXWXd2FxMxn0TZfV9KEQ==
X-Received: by 2002:a2e:814b:: with SMTP id t11mr47973901ljg.171.1638185691187;
        Mon, 29 Nov 2021 03:34:51 -0800 (PST)
Subject: Re: [PATCH v4 05/25] reboot: Warn if restart handler has duplicated
 priority
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
 <20211126180101.27818-6-digetx@gmail.com> <YaLNOJTM+lVq+YNS@qmqm.qmqm.pl>
 <033ddf2a-6223-1a82-ec64-30f17c891f67@gmail.com>
 <YaQeQgbW+CjEdsqG@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <091321ea-4919-0579-88a8-23d05871575d@gmail.com>
Date: Mon, 29 Nov 2021 14:34:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaQeQgbW+CjEdsqG@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

29.11.2021 03:26, Michał Mirosław пишет:
> On Mon, Nov 29, 2021 at 12:06:19AM +0300, Dmitry Osipenko wrote:
>> 28.11.2021 03:28, Michał Mirosław пишет:
>>> On Fri, Nov 26, 2021 at 09:00:41PM +0300, Dmitry Osipenko wrote:
>>>> Add sanity check which ensures that there are no two restart handlers
>>>> registered with the same priority. Normally it's a direct sign of a
>>>> problem if two handlers use the same priority.
>>>
>>> The patch doesn't ensure the property that there are no duplicated-priority
>>> entries on the chain.
>>
>> It's not the exact point of this patch.
>>
>>> I'd rather see a atomic_notifier_chain_register_unique() that returns
>>> -EBUSY or something istead of adding an entry with duplicate priority.
>>> That way it would need only one list traversal unless you want to
>>> register the duplicate anyway (then you would call the older
>>> atomic_notifier_chain_register() after reporting the error).
>>
>> The point of this patch is to warn developers about the problem that
>> needs to be fixed. We already have such troubling drivers in mainline.
>>
>> It's not critical to register different handlers with a duplicated
>> priorities, but such cases really need to be corrected. We shouldn't
>> break users' machines during transition to the new API, meanwhile
>> developers should take action of fixing theirs drivers.
>>
>>> (Or you could return > 0 when a duplicate is registered in
>>> atomic_notifier_chain_register() if the callers are prepared
>>> for that. I don't really like this way, though.)
>>
>> I had a similar thought at some point before and decided that I'm not in
>> favor of this approach. It's nicer to have a dedicated function that
>> verifies the uniqueness, IMO.
> 
> I don't like the part that it traverses the list second time to check
> the uniqueness. But actually you could avoid that if
> notifier_chain_register() would always add equal-priority entries in
> reverse order:
> 
>  static int notifier_chain_register(struct notifier_block **nl,
>  		struct notifier_block *n)
>  {
>  	while ((*nl) != NULL) {
>  		if (unlikely((*nl) == n)) {
>  			WARN(1, "double register detected");
>  			return 0;
>  		}
> -		if (n->priority > (*nl)->priority)
> +		if (n->priority >= (*nl)->priority)
>  			break;
>  		nl = &((*nl)->next);
>  	}
>  	n->next = *nl;
>  	rcu_assign_pointer(*nl, n);
>  	return 0;
>  }
> 
> Then the check for uniqueness after adding would be:
> 
>  WARN(nb->next && nb->priority == nb->next->priority);

We can't just change the registration order because invocation order of
the call chain depends on the registration order and some of current
users may rely on that order. I'm pretty sure that changing the order
will have unfortunate consequences.

