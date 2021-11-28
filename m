Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DC7460A12
	for <lists+xen-devel@lfdr.de>; Sun, 28 Nov 2021 22:07:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234236.406538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrRO9-0007XL-4S; Sun, 28 Nov 2021 21:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234236.406538; Sun, 28 Nov 2021 21:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrRO9-0007Ul-0z; Sun, 28 Nov 2021 21:07:09 +0000
Received: by outflank-mailman (input) for mailman id 234236;
 Sun, 28 Nov 2021 21:07:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YMG7=QP=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mrRO7-0007TI-OW
 for xen-devel@lists.xenproject.org; Sun, 28 Nov 2021 21:07:07 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24d29da2-508f-11ec-976b-d102b41d0961;
 Sun, 28 Nov 2021 22:07:07 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id r26so39233723lfn.8
 for <xen-devel@lists.xenproject.org>; Sun, 28 Nov 2021 13:07:07 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id s13sm1104272lfg.126.2021.11.28.13.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Nov 2021 13:07:06 -0800 (PST)
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
X-Inumbo-ID: 24d29da2-508f-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Kep6H8+bfVZ1xeLjsaS2A7zU/qUFFdJhuzBNEKDyf18=;
        b=MXJpk4bHJWHUsXnttmXJmMehCMhy9keZTcA7B/bYgzynu+fs9AEzA0zWS1didKGcXM
         ufZY1nIVOAfP0n1FcIj/YQO+JHOspxllH7lEwqxum4orCJ0HB2fsnMEDGJmWeH/qyrsf
         tBfKAbmns7/1QIwfCwYfnwageJ9+iaZP7wrA89IK5FuGsmtz3WgnEbf4CfOtVYKh+y1P
         P/ivsGXGLfJ8qk+PLiIxuT1vyrHF2S+SyEG3Jc+cuHLep64IrIJ92EMzFal/KsyKC+gQ
         ETMGdua/dzs6IwN9uDl7VCnKUva5ihWYK7VOkSKYM4fVdcc0cO/WridgO5+laEgsd2tU
         tz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Kep6H8+bfVZ1xeLjsaS2A7zU/qUFFdJhuzBNEKDyf18=;
        b=qS359CYMXCGEgC7f2GA4oYoEcspTu7TapDbiGB55rioVMoSBVnIXc+qFMwcLc9R5D+
         nFIhDnOS78hXv3g0tTNTY2R+mH0YdIQA8lhPAQOE7FKbn9f94VXYfPZ6MwlFh9PxeMXv
         guPTbDf9JQi2Ia9dZhGkBnmhgoAFxhmDlNXiF0YNTWPUOOdoFMcxR5HW+5O3Oy8cNQk9
         CQmZQixtnqYSD8oeVQxN1jSgOOzxI8RvmXOD2XvZG6N9Mm3vndUtzPdfrAI+djAG5KgO
         ln8r+kLdHMtyXddbWA6EoMJkESotI0tebnsROHQWsmA/KHHNT7fMYvraujrSmdxyjCQC
         NUcw==
X-Gm-Message-State: AOAM530jDXOfEqB/QfEZz6h+E37oLr3Q+5xr4uiwvf5Lc+d9IrHdFWv9
	rzAGJ0KeH3I5piox0DwV0RE=
X-Google-Smtp-Source: ABdhPJy4zl/AZzFPwJNVkHu3GSDT6aqXWQbZeWCJLgVwlcbzfRDN23rTDTUYoWjDb/oPahZVEVnA9Q==
X-Received: by 2002:a19:5e59:: with SMTP id z25mr43385851lfi.686.1638133626682;
        Sun, 28 Nov 2021 13:07:06 -0800 (PST)
Subject: Re: [PATCH v4 18/25] x86: Use do_kernel_power_off()
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
 <20211126180101.27818-19-digetx@gmail.com> <YaLYR24XRijSmBq3@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3082ba7a-f8f6-b2d9-5ae3-ec639b1a6bee@gmail.com>
Date: Mon, 29 Nov 2021 00:06:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaLYR24XRijSmBq3@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

28.11.2021 04:15, Michał Mirosław пишет:
> On Fri, Nov 26, 2021 at 09:00:54PM +0300, Dmitry Osipenko wrote:
>> Kernel now supports chained power-off handlers. Use do_kernel_power_off()
>> that invokes chained power-off handlers. It also invokes legacy
>> pm_power_off() for now, which will be removed once all drivers will
>> be converted to the new power-off API.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  arch/x86/kernel/reboot.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
>> index 0a40df66a40d..cd7d9416d81a 100644
>> --- a/arch/x86/kernel/reboot.c
>> +++ b/arch/x86/kernel/reboot.c
>> @@ -747,10 +747,10 @@ static void native_machine_halt(void)
>>  
>>  static void native_machine_power_off(void)
>>  {
>> -	if (pm_power_off) {
>> +	if (kernel_can_power_off()) {
>>  		if (!reboot_force)
>>  			machine_shutdown();
>> -		pm_power_off();
>> +		do_kernel_power_off();
>>  	}
> 
> Judging from an old commit from 2006 [1], this can be rewritten as:
> 
> if (!reboot_force && kernel_can_power_off())
> 	machine_shutdown();
> do_kernel_power_off();
> 
> And maybe later reworked so it doesn't need kernel_can_power_off().
> 
> [1] http://lkml.iu.edu/hypermail//linux/kernel/0511.3/0681.html

It could be rewritten like you're suggesting, but I'd prefer to keep the
old variant, for clarity.

