Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1872347086D
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 19:19:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244195.422360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvkUY-0005Yw-BI; Fri, 10 Dec 2021 18:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244195.422360; Fri, 10 Dec 2021 18:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvkUY-0005WI-7y; Fri, 10 Dec 2021 18:19:34 +0000
Received: by outflank-mailman (input) for mailman id 244195;
 Fri, 10 Dec 2021 18:19:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lr8x=Q3=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mvkUX-0005WC-GS
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 18:19:33 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8c12e3f-59e5-11ec-a74f-db008197e53d;
 Fri, 10 Dec 2021 19:19:32 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id d10so19561203lfg.6
 for <xen-devel@lists.xenproject.org>; Fri, 10 Dec 2021 10:19:32 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id u16sm379604lfu.42.2021.12.10.10.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 10:19:31 -0800 (PST)
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
X-Inumbo-ID: b8c12e3f-59e5-11ec-a74f-db008197e53d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EXOlhuwO6PwxX2A+xhcTtBM4hDyUpnAJiexjEXDAvCY=;
        b=AqjAg4O7giyzVdt+tBG9uHdplJtifqxLx/yVu+cgoY6plA3iYDA6wXW+lamp4aSGK0
         JtAw3aPoKL/gydUbbFYOf1pi7KNgtnB7CRHE+MknWMiFR30YU057EAppHMp3RQPfHd8d
         06yVvqsThCCunZ4BRns7COFfMth1pjRjda7taFbydUf0oWJrqvgB05orw4q9ScnuxSKa
         RGrhlOCs187IEnib8HCpTe8JzWEZV9cVroOWHPffKJtOeT7C/Fogm7PG4qgUyWMygMmF
         ds56Fkt5Zck/MXhrzJhxcRgHcy1bwpmNWqyftpmBQa7CL/iiV+9v5OptrusSns2ZXc73
         k16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EXOlhuwO6PwxX2A+xhcTtBM4hDyUpnAJiexjEXDAvCY=;
        b=bdnRuRqVi4nq2essqgd7kyakI+CWY9OfZXU23kC2oIUMXU+LAcVbuZYjLCDQyvq0Se
         nHE5UvxDFhalwthjg8/rcY5CkAh9jeGceABCnhh9AlShAZdSC/OLExi97ZTAP453AtH8
         rEfDSkv1NAI19zIIS0yvKBUypj8meN4hE5Y7CzKQg207iGH4R9Sro65YihLwbaiPDRz/
         g9LwphU4bDKsiUEf8O4dg1aq/CJ/hdYnpW/vPxIAT6ijMwmSy1i1iPHlLuBf9nXxw0pw
         P8Qa3HBUqtO4lDhtm9CSDdRlv8otgJWXItkvfFAxTJKnDfX9mPhycmQWW61UJcms7+e1
         nZ3w==
X-Gm-Message-State: AOAM532kGYrwljapUIAkbdT5QPFWEDXBpBgxWYTHgvbe7KTb3lCBtR4a
	MdpoaUTnn838bmr+Qf5+q8U=
X-Google-Smtp-Source: ABdhPJzMrOyS+fXdy9iuUu0OwY3ayky869D80K4hHhkf8whZoWRjpK8Gq06BVfaBtvKTtjzQFmSyrg==
X-Received: by 2002:a05:6512:2603:: with SMTP id bt3mr13366040lfb.202.1639160372149;
        Fri, 10 Dec 2021 10:19:32 -0800 (PST)
Subject: Re: [PATCH v4 02/25] notifier: Add
 blocking_notifier_call_chain_is_empty()
To: "Rafael J. Wysocki" <rafael@kernel.org>
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
 the arch/x86 maintainers <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Len Brown <lenb@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, alankao@andestech.com,
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-riscv@lists.infradead.org, Linux-sh list <linux-sh@vger.kernel.org>,
 xen-devel@lists.xenproject.org,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-3-digetx@gmail.com>
 <CAJZ5v0gy5M5yYT7k5CY0JtW4MvsgKq4psBEw81UKz=pjGo0xPw@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9307a684-0b0b-0488-75be-7845d9b973a1@gmail.com>
Date: Fri, 10 Dec 2021 21:19:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0gy5M5yYT7k5CY0JtW4MvsgKq4psBEw81UKz=pjGo0xPw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

10.12.2021 21:14, Rafael J. Wysocki пишет:
> On Fri, Nov 26, 2021 at 7:01 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> Add blocking_notifier_call_chain_is_empty() that returns true if call
>> chain is empty.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  include/linux/notifier.h |  2 ++
>>  kernel/notifier.c        | 14 ++++++++++++++
>>  2 files changed, 16 insertions(+)
>>
>> diff --git a/include/linux/notifier.h b/include/linux/notifier.h
>> index 4b80a815b666..924c9d7c8e73 100644
>> --- a/include/linux/notifier.h
>> +++ b/include/linux/notifier.h
>> @@ -173,6 +173,8 @@ int blocking_notifier_call_chain_robust(struct blocking_notifier_head *nh,
>>  int raw_notifier_call_chain_robust(struct raw_notifier_head *nh,
>>                 unsigned long val_up, unsigned long val_down, void *v);
>>
>> +bool blocking_notifier_call_chain_is_empty(struct blocking_notifier_head *nh);
>> +
>>  #define NOTIFY_DONE            0x0000          /* Don't care */
>>  #define NOTIFY_OK              0x0001          /* Suits me */
>>  #define NOTIFY_STOP_MASK       0x8000          /* Don't call further */
>> diff --git a/kernel/notifier.c b/kernel/notifier.c
>> index b8251dc0bc0f..b20cb7b9b1f0 100644
>> --- a/kernel/notifier.c
>> +++ b/kernel/notifier.c
>> @@ -322,6 +322,20 @@ int blocking_notifier_call_chain(struct blocking_notifier_head *nh,
>>  }
>>  EXPORT_SYMBOL_GPL(blocking_notifier_call_chain);
>>
>> +/**
>> + *     blocking_notifier_call_chain_is_empty - Check whether notifier chain is empty
>> + *     @nh: Pointer to head of the blocking notifier chain
>> + *
>> + *     Checks whether notifier chain is empty.
>> + *
>> + *     Returns true is notifier chain is empty, false otherwise.
>> + */
>> +bool blocking_notifier_call_chain_is_empty(struct blocking_notifier_head *nh)
>> +{
>> +       return !rcu_access_pointer(nh->head);
>> +}
>> +EXPORT_SYMBOL_GPL(blocking_notifier_call_chain_is_empty);
> 
> The check is not reliable (racy) without locking, so I wouldn't export
> anything like this to modules.
> 
> At least IMO it should be added along with a user.
> 

I'll remove the export since it's indeed not obvious how other users may
want to use this function.

