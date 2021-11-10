Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 827BB44C23B
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 14:38:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224307.387546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mknnp-0005fB-In; Wed, 10 Nov 2021 13:38:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224307.387546; Wed, 10 Nov 2021 13:38:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mknnp-0005dP-Er; Wed, 10 Nov 2021 13:38:13 +0000
Received: by outflank-mailman (input) for mailman id 224307;
 Wed, 10 Nov 2021 13:38:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZYPh=P5=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mknnn-0005dH-Fd
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 13:38:11 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71febd5c-422b-11ec-9787-a32c541c8605;
 Wed, 10 Nov 2021 14:38:10 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id z34so6045016lfu.8
 for <xen-devel@lists.xenproject.org>; Wed, 10 Nov 2021 05:38:10 -0800 (PST)
Received: from [192.168.2.145] (79-139-177-117.dynamic.spd-mgts.ru.
 [79.139.177.117])
 by smtp.googlemail.com with ESMTPSA id z25sm60391lja.99.2021.11.10.05.38.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 05:38:09 -0800 (PST)
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
X-Inumbo-ID: 71febd5c-422b-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WtBceGsuNkvJWXKObFPMz3/faWDyi74JI/F+pRXLbvs=;
        b=lD15/VjqUInHM3dZidzqbDMtU49DALHBS4Ay1C40nUi5lxcF7BMQ5EnHXXzG4e6Wu9
         KEtaN/+P0k1Njtg3ToWP1/KM8wIXtXfb2GMI1jVOw30JDescBKoGZyWGQkHaeFFMF1Cx
         557WfM+CudsCe0rfY4tn9Qu/fZ6FXK7hdk9Wu9dTaZ71QukQt6Mf26SjkHrJIeq+MupJ
         /vckqogxswS5UmhYqlk9vNHYa1S8ChRuc7OrOB+B+82hPJEZwrpCBIceX5S6KM+5NMWF
         FSm1MYMPHMKiWtHmf2u4gxwpqn+oAaxX8rT7fWDE5HDvTnS5+IytbAjE77fEnTdMp1QG
         4sBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WtBceGsuNkvJWXKObFPMz3/faWDyi74JI/F+pRXLbvs=;
        b=6FGBhCIbg00F3dK8BERAozLAs4EHZb9Vj3oWIIMy+3+g2KPYjxMkKZd3fLQbcJEe/b
         RC3/21fq+7zIKeqxUcIol87Qiel1ZKWcdRoXhs1WvrW8RCUSrVhP+81h2QDhRAAAQwvS
         l+5eyV6LJWqDcHe2nUzKvuhL3lMpeveaUksO2UetKzv8ysMUE2bUASdbSoSr4EA8IPLQ
         vBsZ7LcpmR+oPr8zNKIdqGCpY5KvvS1BMOOSJRyBVMwVpgON94935WvBOEm37oremxxi
         ia3suOuPtAqJJZrJ+sIJk5RUMRtySrmISLumW6X2Q9tbH50goVm1nR1yHEm2IHI4dygZ
         B8Wg==
X-Gm-Message-State: AOAM531f8OLL7FgSuoGbhNqPjFM8zl7GigrG+8ddriSYNaRIxyAIxmax
	Kn32Csid7QmabihUYRXCBfw=
X-Google-Smtp-Source: ABdhPJxBHb2JNLIS70NEJi27Oqj8IHGODoK0u1oyS1uV5awJ6mpkyMTiHwL65DF0nZiuWJMJYZ6aSw==
X-Received: by 2002:a05:6512:c02:: with SMTP id z2mr14599668lfu.445.1636551490068;
        Wed, 10 Nov 2021 05:38:10 -0800 (PST)
Subject: Re: [PATCH v2 27/45] mfd: ntxec: Use devm_register_power_handler()
To: =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
Cc: Guenter Roeck <linux@roeck-us.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
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
 <20211027211715.12671-28-digetx@gmail.com> <YYbqlmOM95q7Hbjo@latitude>
 <be0c74c6-05a9-cad5-c285-6626d05f8860@gmail.com>
 <9a22c22d-94b1-f519-27a2-ae0b8bbf6e99@roeck-us.net>
 <658cf796-e3b1-f816-1e15-9e9e08b8ade0@gmail.com>
 <5a17fee3-4214-c2b9-abc1-ab9d6071591b@roeck-us.net>
 <c0b52994-51f5-806b-b07e-3e70d8217ffc@gmail.com> <YYkIeBSCFka9yrqC@latitude>
 <04103df3-1ef4-b560-a5cb-fa51737d28ad@gmail.com> <YYuia9KFdi+ETT+I@latitude>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ceefc854-5d15-b73c-0135-c1cbbbb473b7@gmail.com>
Date: Wed, 10 Nov 2021 16:38:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YYuia9KFdi+ETT+I@latitude>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

10.11.2021 13:43, Jonathan Neuschäfer пишет:
> On Mon, Nov 08, 2021 at 02:36:42PM +0300, Dmitry Osipenko wrote:
>> 08.11.2021 14:22, Jonathan Neuschäfer пишет:
>>> On Sun, Nov 07, 2021 at 08:42:33PM +0300, Dmitry Osipenko wrote:
>>> [...]
>>>> EC drivers tend to use higher priority in general. Jonathan, could you
>>>> please confirm that NTXEC driver is a more preferable restart method
>>>> than the watchdog?
>>>
>>> Yes. The original firmware uses the NTXEC to restart, and it works well,
>>> so I do think it's preferable.
>>
>> Thank you, then I'll update the NTXEC patch like this:
>>
>> https://github.com/grate-driver/linux/commit/22da3d91f1734d9a0ed036220ad4ea28465af988
> 
> I tested again, but sys_off_handler_reboot called a bogus pointer
> (probably reboot_prepare_cb). I think it was left uninitialized in
> ntxec_probe, which uses devm_kmalloc. I guess we could switch it to
> devm_kzalloc:
> 
> diff --git a/drivers/mfd/ntxec.c b/drivers/mfd/ntxec.c
> index 1f55dfce14308..30364beb4b1d0 100644
> --- a/drivers/mfd/ntxec.c
> +++ b/drivers/mfd/ntxec.c
> @@ -144,7 +144,7 @@ static int ntxec_probe(struct i2c_client *client)
>  	const struct mfd_cell *subdevs;
>  	size_t n_subdevs;
>  
> -	ec = devm_kmalloc(&client->dev, sizeof(*ec), GFP_KERNEL);
> +	ec = devm_kzalloc(&client->dev, sizeof(*ec), GFP_KERNEL);
>  	if (!ec)
>  		return -ENOMEM;
>  
> 
> 
> With that done, it works flawlessly.

Good catch, thank you! I'll correct this patch and add yours t-b.


