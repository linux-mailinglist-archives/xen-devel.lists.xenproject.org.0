Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A056C7AAF
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 10:02:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514227.796282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfdJX-0004ES-Av; Fri, 24 Mar 2023 09:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514227.796282; Fri, 24 Mar 2023 09:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfdJX-0004B5-7v; Fri, 24 Mar 2023 09:02:23 +0000
Received: by outflank-mailman (input) for mailman id 514227;
 Fri, 24 Mar 2023 09:02:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Fvgu=7Q=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pfdJW-0004Az-Jk
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 09:02:22 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 957cf233-ca22-11ed-b464-930f4c7d94ae;
 Fri, 24 Mar 2023 10:02:20 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id h17so980947wrt.8
 for <xen-devel@lists.xenproject.org>; Fri, 24 Mar 2023 02:02:20 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.149])
 by smtp.gmail.com with ESMTPSA id
 t6-20020adff606000000b002d828a9f9ddsm9869841wrp.115.2023.03.24.02.02.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 02:02:19 -0700 (PDT)
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
X-Inumbo-ID: 957cf233-ca22-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679648540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n243IrPXTdbsIKu5fMm4CD6r1EOzF5PeneoBpB/y4a4=;
        b=WdoFuibSoYq7PItUra7h1o7dNN+dLoO5akaOdiXzNB0GAE6fZrgXjLHEQ59DSfNlbF
         cgR9upm2UnMKp/K2iMTwYQO21eNLlcZA3VTjTQNcOKl6oB0YptTJSukTiMpZuSldqpht
         hT88zEf4E+gJCKG8bgBmZ3XtNmerD2XLEjORhA0Q/BXrUscdTef1dpRx9JDa6Bv504ko
         b2kwoYvEBcdXwhSFs2mCJx6XhNHoIVhKWvY4ugN0Krhnhx9JD7Gr1ZRwtzNsp6GxXu5W
         oQsFCmuvbtw0zcJ+Dg4t9K3RUmnMmVMxySl96IxGJYoNSUSPaDNY3cwVaR2TYMM/uF88
         /2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679648540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n243IrPXTdbsIKu5fMm4CD6r1EOzF5PeneoBpB/y4a4=;
        b=WoqJLIpyFUkcnnuhbk8h6z7dQBl8ush/i4pOg4f9zX837K2/Evz7+073j5t4TRHEiJ
         g7MqO0zjQxAazYmTWj0kbxmMq8YbvuaDMqsvWU4/VhjaC1rvfIv+jZJDsa5hT1/tUmOL
         cIRyR3hM/R4V82Xwq+nKD9/h/YXYgaLZhJ+ITMJjpc2bd7kPrYUav+7ndaScQpaaRssi
         AhJMGfViS7tzEyn+3EFrdKkZrl+tm60WNPLCdRyQYa7baPPJcP6l/+fzLlDp59arma7h
         eOsj4KRSifS98j1EHUFIKKHxCNHz5aQK/twiZmlSoXC1+DQ8d5OCn1995aB99bJ86MFX
         Yt8A==
X-Gm-Message-State: AAQBX9euAbFlUfj4tqq6anlGelLPEx39KOC3e625FT4e0YVvKXGWIzpC
	q+AzRY3ohQlhtFtxVAV6NaGChQ==
X-Google-Smtp-Source: AKy350aF129LEbgPcrIERVDHzRV5kt9ClGRmiJzKHj2gDZXa1XzF6XQWfa0OQK6y0J9EwCOi2YJQVA==
X-Received: by 2002:a05:6000:1192:b0:2c7:17a4:4ece with SMTP id g18-20020a056000119200b002c717a44ecemr1496737wrx.26.1679648540094;
        Fri, 24 Mar 2023 02:02:20 -0700 (PDT)
Message-ID: <43e7ef6d-6248-4ee5-7144-70809e5c93e0@linaro.org>
Date: Fri, 24 Mar 2023 10:02:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v7 4/6] EISA: Convert to use less arguments in
 pci_bus_for_each_resource()
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>,
 Bjorn Helgaas <helgaas@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Anatolij Gustschin <agust@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "David S. Miller" <davem@davemloft.net>, Bjorn Helgaas
 <bhelgaas@google.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20230323173610.60442-1-andriy.shevchenko@linux.intel.com>
 <20230323173610.60442-5-andriy.shevchenko@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230323173610.60442-5-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/3/23 18:36, Andy Shevchenko wrote:
> The pci_bus_for_each_resource() can hide the iterator loop since
> it may be not used otherwise. With this, we may drop that iterator
> variable definition.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Krzysztof Wilczyński <kw@linux.com>
> ---
>   drivers/eisa/pci_eisa.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/eisa/pci_eisa.c b/drivers/eisa/pci_eisa.c

Since this is *PCI* EISA, could be squashed into previous patch.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


