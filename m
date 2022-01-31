Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9664A3F43
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 10:30:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262835.455233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nET0w-0002Ag-Ng; Mon, 31 Jan 2022 09:30:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262835.455233; Mon, 31 Jan 2022 09:30:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nET0w-00027e-Jd; Mon, 31 Jan 2022 09:30:22 +0000
Received: by outflank-mailman (input) for mailman id 262835;
 Mon, 31 Jan 2022 09:29:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8bCO=SP=canonical.com=krzysztof.kozlowski@srs-se1.protection.inumbo.net>)
 id 1nESzg-0001MY-T0
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 09:29:05 +0000
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39e85613-8278-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 10:29:03 +0100 (CET)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3136E3F4B6
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jan 2022 09:28:58 +0000 (UTC)
Received: by mail-ej1-f71.google.com with SMTP id
 fx12-20020a170906b74c00b006bbeab42f06so1139092ejb.3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jan 2022 01:28:58 -0800 (PST)
Received: from [192.168.0.71] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id z2sm2645158ejn.117.2022.01.31.01.28.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 01:28:56 -0800 (PST)
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
X-Inumbo-ID: 39e85613-8278-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1643621338;
	bh=dkzBuNd+uNU6CfCWtlWJDYP24x7ho0sbzpUOr5OCq8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=iSqz/uLapSay7G/3A6PkXfNFarhEKpKi77MjwJT3TWh4Sv9zi8xxJc6Rkgnk/UQ3X
	 Yvr9zkdtcF2g6oFH10U/HqNYl2JgU6TIPCzY3Hp6miKzhib0mSoE8e1j5EE450Bes6
	 qC6Nk/QQtF9ZjHzny9/qSH3PJuaiAnJbMud9Sb5Y1vvXeTeXotimNFdFGDuIj+WzCx
	 +sQiPy0qGoT6niPfGMYqQPdW9mH+t2WQCNw63g8++6lWWWNXk4xKf1kdKExTBoWdtp
	 Fr8xP9lb7ptdwU+meL0LaKA08Pt3Gn+XokqmPxFvGnoCCSNkBA7DNg376izAfxT+dt
	 B9Ji0NE/qyypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dkzBuNd+uNU6CfCWtlWJDYP24x7ho0sbzpUOr5OCq8A=;
        b=GgF9JHnBZL7+A91F4628lBBomUHiGm5vxfz32T9OcQWBZbUntkRz8Ukj4Bo0X+CC+c
         eZGZ/fc66H/p6OgjpADcZtaQBduXo3kee2d4h4G4M/lMfaVhhfzecQ1rj3np0UMj96JJ
         FZbh9/zOfiy1+HSweKTD0+u3j6T2pnVeN2uOI1LPostZ+nsza/fzv4aVvbDE+x9UEU7s
         IaiegLjeJ0BQg+VUy/YtOHnEBL02PUp83vrx0bqnxjlpLJnFLYnE90jvhjB0lsb5OUJ2
         PLMivOma7y9Nju8jhf2xLqmMIP907FnuhnGZnngUZWA7HOFokywIYblTmygdGO6GMbyi
         UFSA==
X-Gm-Message-State: AOAM530hkI/r0VadhHiy23lyvBws/6D5GZI5IU1e+zJeX91op+8Nm2uk
	i88bG4jCg+ElDgUJ0I5Hsg/CLPBBilVpsD8gNINwMssIUlHJfhApx5HOHawAdBbuHw1zRXl/3Uc
	2TJF19x7677LVmRbpDWpND7WNVhOCOZPrKIeTNEolVHmg
X-Received: by 2002:a17:907:d88:: with SMTP id go8mr16082679ejc.343.1643621337692;
        Mon, 31 Jan 2022 01:28:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwUgdzk1HBzC4qCevIT6t5qYbRcRcbKgCipd7W6AaFHRRw14fKuy7dvOGc19/jX8mpPV7Ajw==
X-Received: by 2002:a17:907:d88:: with SMTP id go8mr16082640ejc.343.1643621337451;
        Mon, 31 Jan 2022 01:28:57 -0800 (PST)
Message-ID: <1e22e171-9d13-5763-a9e2-a24e7d98e130@canonical.com>
Date: Mon, 31 Jan 2022 10:28:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 18/21] memory: emif: Use kernel_can_power_off()
Content-Language: en-US
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer
 <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sebastian Reichel <sre@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
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
 Santosh Shilimkar <ssantosh@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, alankao@andestech.com,
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20220130233718.21544-1-digetx@gmail.com>
 <20220130233718.21544-19-digetx@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220130233718.21544-19-digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/01/2022 00:37, Dmitry Osipenko wrote:
> Replace legacy pm_power_off with kernel_can_power_off() helper that
> is aware about chained power-off handlers.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/emif.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

