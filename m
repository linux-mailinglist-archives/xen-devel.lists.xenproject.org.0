Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCD362B208
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 05:03:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444144.699029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ov9dp-0006FK-F5; Wed, 16 Nov 2022 04:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444144.699029; Wed, 16 Nov 2022 04:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ov9dp-0006CQ-AR; Wed, 16 Nov 2022 04:03:13 +0000
Received: by outflank-mailman (input) for mailman id 444144;
 Wed, 16 Nov 2022 04:03:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Of9=3Q=gmail.com=kswilczynski@srs-se1.protection.inumbo.net>)
 id 1ov9dn-0006CK-EA
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 04:03:11 +0000
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94fc1fad-6563-11ed-8fd2-01056ac49cbb;
 Wed, 16 Nov 2022 05:03:10 +0100 (CET)
Received: by mail-pj1-f48.google.com with SMTP id
 r61-20020a17090a43c300b00212f4e9cccdso1078993pjg.5
 for <xen-devel@lists.xenproject.org>; Tue, 15 Nov 2022 20:03:10 -0800 (PST)
Received: from rocinante (fpd11144dd.ap.nuro.jp. [209.17.68.221])
 by smtp.gmail.com with ESMTPSA id
 nl8-20020a17090b384800b0020d48bc6661sm390550pjb.31.2022.11.15.20.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 20:03:08 -0800 (PST)
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
X-Inumbo-ID: 94fc1fad-6563-11ed-8fd2-01056ac49cbb
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1zIzDKHHVNaVurdU/es7VrrKvHMyE/kDIQtf0pEpjIw=;
        b=m06WN6cB7tRh9lZXBZz3lPallw7ZqYqu1EKs46S5gxo6Hf4D7ZwHmZlRuGsQzNd56o
         JHQs6JGHRU0ypTPWH+tkIAa/NYZ5d7EVq0mZXZHmWjuZ9sKUPnjGyYTjZhm+NSwUXs9A
         hmvhou/DG7PGO9m8cGh7ekMZ4U8l7+UPQaawYXQZ4QjXw5M2vOTTiYxN286VpF1efG5M
         Y8elOZvZfa3vg2PGxRIv6/bzNCb4agZJaPMAyUuewNDezpbKt797NdzpG7bswvlt89bj
         W1ueWNp8PjvHP29f5FFKGgejn1Uballf0dyCzph/H51dSPQ1N+7G/oN/G74ofvalueNh
         FjoA==
X-Gm-Message-State: ANoB5pnZOZziBBhB4MXFmKJZiPzpEzokxiCZkVh+xa9Uxtrlt8vXlbHd
	mlTI4iQu4xOri2yI4BsWB1w=
X-Google-Smtp-Source: AA0mqf6hyhoq112sIKQo2v/k51nNvfWIgxwNBEvlAx1Pthk/+MTebE7MSfBKsrWrQE5FLsqcaK8YIQ==
X-Received: by 2002:a17:90a:3f89:b0:217:90e0:3f8c with SMTP id m9-20020a17090a3f8900b0021790e03f8cmr1687555pjc.192.1668571388739;
        Tue, 15 Nov 2022 20:03:08 -0800 (PST)
Date: Wed, 16 Nov 2022 13:03:01 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <helgaas@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
	linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH v3 0/4] PCI: Add pci_dev_for_each_resource() helper and
Message-ID: <Y3Rg9dGmzZl4GJU5@rocinante>
References: <20221114185822.65038-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221114185822.65038-1-andriy.shevchenko@linux.intel.com>

Hello,

> Provide two new helper macros to iterate over PCI device resources and
> convert users.
> 
> Looking at it, refactor existing pci_bus_for_each_resource() and convert
> users accordingly.
> 
> This applies on top of this patch Mika sent out earlier:
> https://lore.kernel.org/r/20221114115953.40236-1-mika.westerberg@linux.intel.com
> 
> Changelog v3:
> - rebased on top of v2 by Mika, see above
> - added tag to pcmcia patch (Dominik)
[...]

Thank you Andy for all the improvements and Mika for the idea!

For the whole series:
  Reviewed-by: Krzysztof Wilczyński <kw@linux.com>

Looks very nice!

	Krzysztof

