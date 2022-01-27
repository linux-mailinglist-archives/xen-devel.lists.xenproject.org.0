Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 487BA49E4D3
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 15:39:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261492.452842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD5vu-00028T-74; Thu, 27 Jan 2022 14:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261492.452842; Thu, 27 Jan 2022 14:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD5vu-000265-47; Thu, 27 Jan 2022 14:39:30 +0000
Received: by outflank-mailman (input) for mailman id 261492;
 Thu, 27 Jan 2022 14:39:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r5SY=SL=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1nD5vt-00025z-Ch
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 14:39:29 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee589d03-7f7e-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 15:39:28 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id u14so5718269lfo.11
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jan 2022 06:39:28 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.googlemail.com with ESMTPSA id r13sm476323lfr.65.2022.01.27.06.39.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 06:39:22 -0800 (PST)
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
X-Inumbo-ID: ee589d03-7f7e-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=XkYKE/mqIw+ZogEPzGoXmtOQI8nkKTmA4V70TLbVWS4=;
        b=BHb2Xn1jq66/9MHahrzGm/gWUKtVbh/58wKW18vGWzni3fO5qyqP4VG1OOnOie8Jsh
         gDERoDSbSutwAXYx2C5vNn4TrrwM4BpgdHcNKbywEL+R5MYLhL5n2nGGvdHyYC3+WdiR
         AH7kOLTk/zgQKoF333ryAx/KFlOhDG6pX/tZk4LwhLgv5peCfB01DtWBVE+9RHO5Zn9/
         GlTTQk4e9TGZCrINPfliTtlCZdTAH9LmWOb+qXQAmfLULPmn+Omh2L6j2NgulGAPM/A+
         p0mPzTS/Ny1WZgGK/AicqnPTN5Ub7NU4t23e3Ka67Gnz7TG7Nyg0lXeqh7s3FoDGgrJx
         11/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XkYKE/mqIw+ZogEPzGoXmtOQI8nkKTmA4V70TLbVWS4=;
        b=CfnJ6S2nHqx/3Pa4MP5vZpgR0qpzMIFaiv9IQKWuxSgPCwbt7/O0bwq0tU8Kt4bMOP
         moYl/r2j+2Kwmq4j/ZRrbr9JEwIe+DknYUoFiYq70F0UA20pXdcWwpHMckQPqZr7HIg/
         dzgsKFwTUsaLuRlc1kRAjyU5aO6Tw6ozaytWpLx33fLl5JNW7coHx30k/+U0lvdhC7y/
         CUcTwM/TRr+/hz8WlrEEAW0YB2+USuNVmWAk4HzVG0vI3dHp4TKgNkLTqvrB1jKJwBkE
         JuFHWFw9Y75IIpSy0B15VsHck1/zUYFhf4V3ijcJMfX8M7xGJZ/LUn3INaRQPgfndR4v
         8Hbg==
X-Gm-Message-State: AOAM532ERmVjvMgfBrnX05ZUAyp0uN9WKjk7JajEphE8V/qYdjq+0+eT
	vVE+PWCI1xwhIPKmweT1yuE=
X-Google-Smtp-Source: ABdhPJy1MhVvMOXi8UxQ8s4idXCyJ+ifGIsp8CpwyHRf9+W1A9LbFInI9I0x2geweWfK/i1YhzfC+Q==
X-Received: by 2002:a05:6512:3d1c:: with SMTP id d28mr2997039lfv.135.1643294367899;
        Thu, 27 Jan 2022 06:39:27 -0800 (PST)
Message-ID: <e8d3ca39-ddeb-2c21-6000-1cc65da57915@gmail.com>
Date: Thu, 27 Jan 2022 17:39:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 04/21] kernel: Add combined power-off+restart handler
 call chain API
Content-Language: en-US
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
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20211212210309.9851-1-digetx@gmail.com>
 <20211212210309.9851-5-digetx@gmail.com> <Ydofs2CIfA+r5KAz@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <Ydofs2CIfA+r5KAz@qmqm.qmqm.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Michał,

09.01.2022 02:35, Michał Mirosław пишет:
> BTW, I couldn't find a right description of my idea of unifying the
> chains before, so let me sketch it now.
> 
> The idea is to have a single system-off chain in which the callback
> gets a mode ({QUERY_*, PREP_*, DO_*} for each of {*_REBOOT, *_POWEROFF, ...?).
> The QUERY_* calls would be made in can_kernel_reboot/poweroff(): all
> would be called, and if at least one returned true, then the shutdown
> mode would continue. All of PREP_* would be called then. After that
> all DO_* would be tried until one doesn't return (succeeded or broke
> the system hard). Classic for(;;); could be a final fallback for the
> case where arch/machine (lowest priority) call would return instead
> of halting the system in machine-dependent way. The QUERY and PREP
> stages could be combined, but I haven't thought about it enough to
> see what conditions would need to be imposed on the callbacks in
> that case (maybe it's not worth the trouble, since it isn't a fast
> path anyway?). The goal here is to have less (duplicated) code in
> kernel, but otherwise it seems equivalent to your API proposal.

Thank you again for yours proposal! IMO, it's much more important to
keep the core code simple and maintainable, rather than try to optimize
it without a very good reason, given that this isn't a hot code path at
all and saving a couple of bytes won't be noticeable. The poweroff,
restart and reboot were separated before this series and I'm finding
that it's easier to follow the code when it's structured that way. I'm
not convinced that we need to change it.

