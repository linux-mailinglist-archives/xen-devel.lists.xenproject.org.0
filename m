Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7063447454
	for <lists+xen-devel@lfdr.de>; Sun,  7 Nov 2021 18:08:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222834.385220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjlea-0003Ft-3c; Sun, 07 Nov 2021 17:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222834.385220; Sun, 07 Nov 2021 17:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjleZ-0003Cy-Vb; Sun, 07 Nov 2021 17:08:23 +0000
Received: by outflank-mailman (input) for mailman id 222834;
 Sun, 07 Nov 2021 17:08:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WXOO=P2=gmail.com=groeck7@srs-se1.protection.inumbo.net>)
 id 1mjleY-0003Cs-BZ
 for xen-devel@lists.xenproject.org; Sun, 07 Nov 2021 17:08:22 +0000
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [2607:f8b0:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e4b61b3-3fed-11ec-a9d2-d9f7a1cc8784;
 Sun, 07 Nov 2021 18:08:20 +0100 (CET)
Received: by mail-oi1-x22a.google.com with SMTP id u2so23850756oiu.12
 for <xen-devel@lists.xenproject.org>; Sun, 07 Nov 2021 09:08:20 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 i18sm3076850oik.6.2021.11.07.09.08.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Nov 2021 09:08:18 -0800 (PST)
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
X-Inumbo-ID: 4e4b61b3-3fed-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tdjg7OFm02RxoZkWdNYUJLWTVIAPxTK8o9TtiXrumos=;
        b=TxOMGGlgYCG6dkxhcHrWleMH5bQzzwXZ9FgwNICO938yYvOADrHCJxaIH+GmktBmdj
         VF/g/5abCbj1SCo77l//+Q8ZaEKZ59DzYbLYNazQAh1d/LI9QSnOgttApF1NrD9BSZdp
         gXEIPq4X5WBftSdrWeIB1XoHAUTyRVaiGJM3hjDVKwLTIaIl/5BV9x60u06nn/MoayP2
         XKdxX9rsONJssDlEkPGWyc5+2eLAU/A93X+4aNShdnC/nVsO9kvbYnMJEh3NiFo/gq2s
         n/ryBqjSn/iug4O0nxdm910/aVIInOrXjz5uU8hb+PebuTd+WVfeeVeSdkkUcfpq82Ph
         3xyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tdjg7OFm02RxoZkWdNYUJLWTVIAPxTK8o9TtiXrumos=;
        b=loeUjSdhahkA2Oav57QEVZ2vvARIcce/npACZWEndFPu8nYExAZqFtrGnLkbiazxSy
         Xj2+JY4vqMY3BCl3Wjds0s9GX/mxjfWqaR3RAQFfpDBk8d7N5dYJFKXmqmJEkqqNFmJS
         yFe3BM00q2bnJu4LXn682sfWjEYoX5nVBOrI94bzHp9+RFTaity8nDsCttEHKWIF4egh
         DVOQfy6ic2E835xI/hvhIQplmU5aJ8rNrtNfNKusUCloBobbhQKZWSdb/KUl0HDU+REF
         GAaWTOCGmoHqIePTMX0XgWWOpgLJjcoEpxGfq4p2hDdxJx+gKhsqVUV3NCNt/UAfRAal
         FOeA==
X-Gm-Message-State: AOAM531atwfa3O+oiXyziOuAp+/v7XGNGx8JUA5phDZsAFCZH0nZGHkG
	BFAV1p4VHxMYimXqNN0SSy0=
X-Google-Smtp-Source: ABdhPJwtuSZgtmAkEs0Dks9+MnuUhljSkzaFgRaxP+iMBCUUKLEs54Fh1SgZ30w0yfdl8sLFhcnMyg==
X-Received: by 2002:a05:6808:158a:: with SMTP id t10mr3003509oiw.24.1636304899015;
        Sun, 07 Nov 2021 09:08:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2 27/45] mfd: ntxec: Use devm_register_power_handler()
To: Dmitry Osipenko <digetx@gmail.com>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
Cc: Thierry Reding <thierry.reding@gmail.com>,
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
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <9a22c22d-94b1-f519-27a2-ae0b8bbf6e99@roeck-us.net>
Date: Sun, 7 Nov 2021 09:08:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <be0c74c6-05a9-cad5-c285-6626d05f8860@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/7/21 8:53 AM, Dmitry Osipenko wrote:
> 06.11.2021 23:54, Jonathan Neuschäfer пишет:
>> Hi,
>>
>> On Thu, Oct 28, 2021 at 12:16:57AM +0300, Dmitry Osipenko wrote:
>>> Use devm_register_power_handler() that replaces global pm_power_off
>>> variable and allows to register multiple power-off handlers. It also
>>> provides restart-handler support, i.e. all in one API.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>
>> When I boot with (most of) this patchset applied, I get the warning at
>> kernel/reboot.c:187:
>>
>> 	/*
>> 	 * Handler must have unique priority. Otherwise call order is
>> 	 * determined by registration order, which is unreliable.
>> 	 */
>> 	WARN_ON(!atomic_notifier_has_unique_priority(&restart_handler_list, nb));
>>
>> As the NTXEC driver doesn't specify a priority, I think this is an issue
>> to be fixed elsewhere.
>>
>> Other than that, it works and looks good, as far as I can tell.
>>
>>
>> For this patch:
>>
>> Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
>> Tested-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> 
> Thank you. You have conflicting restart handlers, apparently NTXEC
> driver should have higher priority than the watchdog driver. It should
> be a common problem for the watchdog drivers, I will lower watchdog's
> default priority to fix it.
> 

The watchdog subsystem already uses "0" as default priority, which was
intended as priority of last resort for restart handlers. I do not see
a reason to change that.

Guenter

