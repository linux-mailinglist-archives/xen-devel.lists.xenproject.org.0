Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D64E752306E
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 12:12:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326673.549257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nojKN-0002hO-Oi; Wed, 11 May 2022 10:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326673.549257; Wed, 11 May 2022 10:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nojKN-0002fa-Lq; Wed, 11 May 2022 10:12:19 +0000
Received: by outflank-mailman (input) for mailman id 326673;
 Wed, 11 May 2022 10:12:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9LF4=VT=collabora.com=dmitry.osipenko@srs-se1.protection.inumbo.net>)
 id 1nojKM-0002fU-1R
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 10:12:18 +0000
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d536396f-d112-11ec-a406-831a346695d4;
 Wed, 11 May 2022 12:12:16 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 6482B1F44D36
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
X-Inumbo-ID: d536396f-d112-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1652263934;
	bh=qcj+acMxU0ciOKBaVy6pJbQiEuRN08dsxaJseG6RfwE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ALAQu/eEe04LAruPgoaxZO/rAmAmbVl+HcocVYpgGrXIRB8C3EP1FAmUZXjQFjUKn
	 wfogK/QUTiSxNChIDNBZqO/aeRmGclTu4TrSdSdMO/cmWfEIqdry6AZOEiAP2fouZ6
	 Ze5K+g3wOPlOW2v6pMuegjSC6cihNNChKdrphdfE2ltP+RE0LEmom809Y8+fvE6J4/
	 Ahs2yVkxSRw3aK+Wy1uhxbsXzAskjDUGhwcgP9S4/r1ElfK42qDIjASJs4PEUZO9GN
	 V4ie/nhjCksrQsC7KjRypS3JpnKPKwmWfZcBd1V4WsAwj2K9BvhnPx92oDSMYGMk4e
	 Jp2S214QNnEnQ==
Message-ID: <5894c310-fe50-8037-fc9c-cbedb0d8e71f@collabora.com>
Date: Wed, 11 May 2022 13:12:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v8 01/27] notifier: Add
 atomic_notifier_call_chain_is_empty()
Content-Language: en-US
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
 Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>, Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 Linux-sh list <linux-sh@vger.kernel.org>, xen-devel@lists.xenproject.org,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
 <20220509233235.995021-2-dmitry.osipenko@collabora.com>
 <CAJZ5v0gApRhc9+jZLxgNXC2B2tmz450=8+mFZUjTFF1iU7C-gw@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAJZ5v0gApRhc9+jZLxgNXC2B2tmz450=8+mFZUjTFF1iU7C-gw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/10/22 21:14, Rafael J. Wysocki wrote:
> On Tue, May 10, 2022 at 1:33 AM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
>> Add atomic_notifier_call_chain_is_empty() that returns true if given
>> atomic call chain is empty.
> It would be good to mention a use case for it.
> 

I'll update this patch for v9.

-- 
Best regards,
Dmitry

