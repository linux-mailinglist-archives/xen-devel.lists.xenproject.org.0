Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF87743F37E
	for <lists+xen-devel@lfdr.de>; Fri, 29 Oct 2021 01:28:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218349.378741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgEok-0004ds-Mj; Thu, 28 Oct 2021 23:28:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218349.378741; Thu, 28 Oct 2021 23:28:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgEok-0004bO-J7; Thu, 28 Oct 2021 23:28:18 +0000
Received: by outflank-mailman (input) for mailman id 218349;
 Thu, 28 Oct 2021 23:28:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CzqG=PQ=gmail.com=digetx@srs-us1.protection.inumbo.net>)
 id 1mgEoj-0004bI-Lx
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 23:28:17 +0000
Received: from mail-lf1-x131.google.com (unknown [2a00:1450:4864:20::131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6df20459-6f77-423a-9aa4-8b3d30c832eb;
 Thu, 28 Oct 2021 23:28:16 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id u11so17016454lfs.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Oct 2021 16:28:16 -0700 (PDT)
Received: from [192.168.2.145] (46-138-44-18.dynamic.spd-mgts.ru.
 [46.138.44.18])
 by smtp.googlemail.com with ESMTPSA id bn3sm414682ljb.7.2021.10.28.16.28.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 16:28:15 -0700 (PDT)
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
X-Inumbo-ID: 6df20459-6f77-423a-9aa4-8b3d30c832eb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=g1ASowQL1SYh3xyvjjnrsnFWzhxhuZ1FkP7TdHa31mE=;
        b=or9I8eXmdc6hOUu3ilMz+ymgHlGQQmwFfcjANI787MFy3461r29Qlx4Drko3A82jiZ
         /Dxbh+rXJkVd+vSmZQz7ByF21FNMWE7Msuh2tmQH7FzEaAaJykw/79BGIIrJtKwboRDm
         04V8OvO+c+XCXlI7f4QRPE7cqx6GZulezk5I+0MnmugoyzWrW9wGp3T/sQ+0YL50opsM
         PEj+17btedXyPtu3l7DUltlj+rCIDD63O2gZoZwfDEKUeboD39P9kLuxM5uqsYcKe9n/
         MuNWRD7sUlbhLEou6B/xsQNLsenMP/929SI9uvSZZXHuqFx/YvhRAZPMrz7X4+YxCerI
         /TgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=g1ASowQL1SYh3xyvjjnrsnFWzhxhuZ1FkP7TdHa31mE=;
        b=fBRc4oZ2Nio7KHHgxHo3LKrvpCBuMdmAKPtmCIuLWIhnahmVpvihwNkphTUm9TMmYT
         NKqzU5A1jOCnZb5YjlSkvBvCdQRvp7akn5OTD/FwdqYIfTz9p2b94j1sE5kiBxglx5ao
         svEH9a128MZA15T8++IU0CeiOHee+2RzKucLHAlDbCMDYveAPMv0cZSscRGjCW7tWJnj
         1k3gGBTfRTGhvbRk2q3xnMndLUnadBFz6ijeIYUqZi6n1bEWSsVu/Djv2jx8EEKtgqAe
         owYlPmUzHha426z203SzE2fPKAUx7ZQVfRQtPxJ7NRC/r9JpALndbsIjAyc8KFOq6rgi
         NJKA==
X-Gm-Message-State: AOAM530Y0dekWiG1j8sRVMQUZJ13+7DY9Z79kaIhQglv7bdW/HsCVRFX
	8qnyndIX9ZHRxocxL1bS6m0=
X-Google-Smtp-Source: ABdhPJwV2hV4le461ll7P/MiVtzPzva4GF7PaVejAVvhmYPc9uewsxLl7FIVcxk+rSnnrtvlDg/jfg==
X-Received: by 2002:a19:760a:: with SMTP id c10mr6627861lff.302.1635463695803;
        Thu, 28 Oct 2021 16:28:15 -0700 (PDT)
Subject: Re: [PATCH v2 03/45] notifier: Add
 atomic/blocking_notifier_has_unique_priority()
From: Dmitry Osipenko <digetx@gmail.com>
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
 <c5fb7590-03a7-0eea-4040-07472a5c9710@gmail.com>
Message-ID: <8a9c4a9a-ea0d-4bc9-cf57-9bd99b211d47@gmail.com>
Date: Fri, 29 Oct 2021 02:28:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <c5fb7590-03a7-0eea-4040-07472a5c9710@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

29.10.2021 00:32, Dmitry Osipenko пишет:
>>> +	/*
>>> +	 * This code gets used during boot-up, when task switching is
>>> +	 * not yet working and interrupts must remain disabled.  At
>> One space is enough.
> This comment is replicated multiple times over this source file. You can
> find it before each down_write(). I borrowed the text as-is, for
> consistency.

Actually, it should be down_read() here since there are no writes. I'll
correct it in v3.

