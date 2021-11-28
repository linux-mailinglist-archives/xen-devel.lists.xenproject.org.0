Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 552984609F7
	for <lists+xen-devel@lfdr.de>; Sun, 28 Nov 2021 22:05:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234222.406516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrRLz-0006KO-Fz; Sun, 28 Nov 2021 21:04:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234222.406516; Sun, 28 Nov 2021 21:04:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrRLz-0006HD-CS; Sun, 28 Nov 2021 21:04:55 +0000
Received: by outflank-mailman (input) for mailman id 234222;
 Sun, 28 Nov 2021 21:04:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YMG7=QP=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mrRLx-0006Dq-Ee
 for xen-devel@lists.xenproject.org; Sun, 28 Nov 2021 21:04:53 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4cd3caf-508e-11ec-b941-1df2895da90e;
 Sun, 28 Nov 2021 22:04:52 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id i63so30602081lji.3
 for <xen-devel@lists.xenproject.org>; Sun, 28 Nov 2021 13:04:52 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id d30sm1105908lfv.58.2021.11.28.13.04.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Nov 2021 13:04:52 -0800 (PST)
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
X-Inumbo-ID: d4cd3caf-508e-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=n+c+fNjlqpkODMNA/7ywsu2Xpxn181Yex3QT1BC7YkM=;
        b=Tdth5Mz95ILIP2wZ5DYmwGwqL/g2a8NQfIdIuxgXXVVg6RH3yDMvHbIjMPlUPQ+Kfi
         e7TNCwLl7gW+gWhWCzY5kWF31Q6d3MXbcfyHlK5mTJBCO9B0yoazspZoQ9QauZAg4VOZ
         GU1Du/NMRetIl1HCPpoZ/wmPwFcTZx09G+/z/T3SmJwaMw6FiTLYrkBEti6ebPBTNx4P
         ztESfCaJHpZ8ANbOeJv7E8GcPhKYp2JvSlX4AwC23x/kyRaPVi2WsI1lt1XYwZg48qKe
         Ljtqv2XVdBLjgOpaFjZQzH+Idsti2zOEBowM2JGqBDzv5KQCJSPSnTBTLx3XoGX8clP3
         1rSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n+c+fNjlqpkODMNA/7ywsu2Xpxn181Yex3QT1BC7YkM=;
        b=XZOlFk1HKDmyGM2V6bA+LgRQlp/LSBWMrkzWT65e40rlErrfLwxnWLQ3RCETp7mSFd
         QWXqOvNLTWsziAyCk31Y4uYpfN1j830IIne0lAl5fGsW2EA04l16rO3do1UsPauFGrYZ
         fkd9E+HmDnkK3xKZCkeuOKhym0Fz+j3P84xyGf/p9DDoQdVQwYJjQ8O5DnX4ySCjw/lc
         wFXm/iAsq5h1vZMnyyWo2Gg15vJHNng3HdxeeYI1jlqyXL0X8P/seftvtAHVyEDBACAJ
         nBH6SZbALpUmHKjVOcJTVywMCu7rfoszb+gV2xEctHP10ZzibEOioIZ5R97Ow1m3rMc6
         z7ZA==
X-Gm-Message-State: AOAM532DsZ+Lfe2n5rLomD6c/+hkh+Lpe0iqBY+6zCXyfybalDIhwUQZ
	S0lFSFOJxwj2QCm47RVgHso=
X-Google-Smtp-Source: ABdhPJyuVlGCEG84pwfg6BbsVNdI4G/2tvLYelnsvUn7CQTQlf25Ym3pMWyWhlfLoQNWZ9AePptWxg==
X-Received: by 2002:a2e:97cb:: with SMTP id m11mr45829799ljj.324.1638133492517;
        Sun, 28 Nov 2021 13:04:52 -0800 (PST)
Subject: Re: [PATCH v4 22/25] memory: emif: Use kernel_can_power_off()
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
 <20211126180101.27818-23-digetx@gmail.com> <YaLaH3Yt2M/Gko//@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <98c5c3d3-1635-3a06-b57f-8facd409796a@gmail.com>
Date: Mon, 29 Nov 2021 00:04:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaLaH3Yt2M/Gko//@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

28.11.2021 04:23, Michał Mirosław пишет:
> On Fri, Nov 26, 2021 at 09:00:58PM +0300, Dmitry Osipenko wrote:
>> Replace legacy pm_power_off with kernel_can_power_off() helper that
>> is aware about chained power-off handlers.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/memory/emif.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/memory/emif.c b/drivers/memory/emif.c
>> index 762d0c0f0716..cab10d5274a0 100644
>> --- a/drivers/memory/emif.c
>> +++ b/drivers/memory/emif.c
>> @@ -630,7 +630,7 @@ static irqreturn_t emif_threaded_isr(int irq, void *dev_id)
>>  		dev_emerg(emif->dev, "SDRAM temperature exceeds operating limit.. Needs shut down!!!\n");
>>  
>>  		/* If we have Power OFF ability, use it, else try restarting */
>> -		if (pm_power_off) {
>> +		if (kernel_can_power_off()) {
>>  			kernel_power_off();
>>  		} else {
>>  			WARN(1, "FIXME: NO pm_power_off!!! trying restart\n");
> 
> BTW, this part of the code seems to be better moved to generic code that
> could replace POWER_OFF request with REBOOT like it is done for reboot()
> syscall.

Not sure that it can be done. Somebody will have to verify that it won't
break all those platform power-off handlers. Better to keep this code
as-is in the context of this patchset.

