Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD6C43F253
	for <lists+xen-devel@lfdr.de>; Fri, 29 Oct 2021 00:06:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218328.378708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgDX4-0003dC-Vy; Thu, 28 Oct 2021 22:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218328.378708; Thu, 28 Oct 2021 22:05:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgDX4-0003Zz-SF; Thu, 28 Oct 2021 22:05:58 +0000
Received: by outflank-mailman (input) for mailman id 218328;
 Thu, 28 Oct 2021 22:05:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CzqG=PQ=gmail.com=digetx@srs-us1.protection.inumbo.net>)
 id 1mgDX3-0003Zt-Sw
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 22:05:57 +0000
Received: from mail-lj1-x235.google.com (unknown [2a00:1450:4864:20::235])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c74c9afd-2bbe-4ca7-96c6-409320eac8ab;
 Thu, 28 Oct 2021 22:05:57 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id h11so13245528ljk.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Oct 2021 15:05:57 -0700 (PDT)
Received: from [192.168.2.145] (46-138-44-18.dynamic.spd-mgts.ru.
 [46.138.44.18])
 by smtp.googlemail.com with ESMTPSA id v13sm444651ljk.72.2021.10.28.15.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 15:05:55 -0700 (PDT)
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
X-Inumbo-ID: c74c9afd-2bbe-4ca7-96c6-409320eac8ab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QdlXzZMWoVtcTasTaLsmBsOCqsQBbCgeCfcj0o9XtUc=;
        b=OJvAD8QIK23NiAd5gHFgNc2jMlnwbUhscd64oItZCjDzpbaa9HqfW53eGYcjGvS+Hd
         8DJvk+brxf2GEvT4zQ6W/ef2iXaKU3cVUF0C3X+R0CYtCLZK9UxcbzlXYXArEArHwTk8
         vcyalmRFTF2jyokLO2ef7zgVnqs7E2ea+6mOp4eaXLCsLH7zqMUa5b9lGYh++3iI3c5l
         5SNXuX8KUFV580Mc9ixmfzVIv8iajcv/gjbcoXvjaxxhRQdJfHyZ96a4PDZESCiQ0JsQ
         ezipbNgT7rnH4g7QwqVqZwJlBhjMy6NJ72j6JC2Ohga6KFFIy4TxdzbmMsSK+f4qNFMJ
         K+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QdlXzZMWoVtcTasTaLsmBsOCqsQBbCgeCfcj0o9XtUc=;
        b=6IhPVI5mcw025rUGjPnf+M99ItBtac6gbdTi9bH9jyzldiX5/PyVlPN9WWnKmiZKxT
         y+DZycpaKOb5ViQP5EFlItoVJ1PoH41QL6Rd5HPE4xuGlyOVXEH9IH+njDZmAyBg7Q+7
         DrfCXxUwp9g90IJk71XetIDrCtId6AV8T5E7kBm5RmwGoTQKOfAArFJvx6uQIHevRu26
         CRTVTEkLFydlVImbNwTFUEUgWyHYcMo5GiTGzpnbewMDBv4r8KdHeJj4bHw6J6l8NELW
         6eTAGWBjZBnyoUz1lTyHXdTKakYG/Iao5yzSQ8U4swdLfzLLXLyidOZtksD7h3MlALVX
         rDLA==
X-Gm-Message-State: AOAM533zm2QcfnzhvgiUiTWlRmG/Ao6n+VZJTrG2pWPURNbbw1gfqW7u
	qkBUfwq6ye7wgzb98aeX/pA=
X-Google-Smtp-Source: ABdhPJzozZj+Szoqatj9JJ7zamkbp5Jf8v8z0Y7vkU95q/rca882+TrclSa79lyDyuur0f9DZkdGEw==
X-Received: by 2002:a2e:99da:: with SMTP id l26mr5923422ljj.508.1635458756009;
        Thu, 28 Oct 2021 15:05:56 -0700 (PDT)
Subject: Re: [PATCH v2 00/45] Introduce power-off+restart call chain API
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
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
Message-ID: <92067c5e-a256-ff45-eae2-21033c6a83d2@gmail.com>
Date: Fri, 29 Oct 2021 01:05:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

28.10.2021 00:16, Dmitry Osipenko пишет:
>   mfd: ab8500: Use devm_register_trivial_power_off_handler()
>   reset: ath79: Use devm_register_simple_restart_handler()
>   reset: intel-gw: Use devm_register_simple_restart_handler()
>   reset: lpc18xx: Use devm_register_prioritized_restart_handler()
>   reset: npcm: Use devm_register_prioritized_restart_handler()

These patches got lost because Gmail gave me ban after 40's email. I
think it doesn't worth to re-send them now since you should get an idea
about how API usage looks like without the lost patches.

