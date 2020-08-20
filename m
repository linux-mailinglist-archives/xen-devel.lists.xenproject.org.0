Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E47D24AD30
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 05:11:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8axI-0005nr-7F; Thu, 20 Aug 2020 03:09:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wVIa=B6=infradead.org=rdunlap@srs-us1.protection.inumbo.net>)
 id 1k8axF-0005nm-9h
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 03:09:30 +0000
X-Inumbo-ID: a0e5f857-9cd0-44bc-bdee-6efb0bb11fab
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0e5f857-9cd0-44bc-bdee-6efb0bb11fab;
 Thu, 20 Aug 2020 03:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=H+SyqcNb49+mDUM1prCpCzJfpwLQzblN5HpcsZjj2rI=; b=N2ufH3j0O9x7ZeuJWkXPfzRVAd
 F3ljpyVSfWVlUh+bQ1M1TDKhIncYmALW2YNyS6C4yUYb5IxMzYuwO5xUUMVauvZpxWizmgpGrZ/et
 vdxl6NARI0L8y6WNO/JEG9FCAREUtgbfQcrc8QZWJ4tLcdMHj//nV8e31vVgkskRGwCDyfrPjWWTH
 uSEVlS7aEaq0+6BOB8j5vOfM0Yf0vvw2AT1L2KKqUt+Q2KSLFOUePcj0JfCKSwgJ/zBaRtwNc+co8
 4EBNj04Uhey+Zld8GtuVkTfGG0nVxfOpY/6CQy4UW+HxaQ+yIonuiVXaHJNaqssvv/ojjQXnA+Ogv
 zceMaRIQ==;
Received: from [2601:1c0:6280:3f0::19c2]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8ax0-0003mZ-Lb; Thu, 20 Aug 2020 03:09:15 +0000
Subject: Re: [PATCH] x86/pci: fix xen.c build error when CONFIG_ACPI is not set
From: Randy Dunlap <rdunlap@infradead.org>
To: LKML <linux-kernel@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <a020884b-fa44-e732-699f-2b79c9b7d15e@infradead.org>
Message-ID: <88afdd4a-1b30-d836-05ce-8919b834579b@infradead.org>
Date: Wed, 19 Aug 2020 20:09:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a020884b-fa44-e732-699f-2b79c9b7d15e@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Konrad,

ping.

I am still seeing this build error. It looks like this is
in your territory to merge...


On 8/13/20 4:00 PM, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix build error when CONFIG_ACPI is not set/enabled:
> 
> ../arch/x86/pci/xen.c: In function ‘pci_xen_init’:
> ../arch/x86/pci/xen.c:410:2: error: implicit declaration of function ‘acpi_noirq_set’; did you mean ‘acpi_irq_get’? [-Werror=implicit-function-declaration]
>   acpi_noirq_set();
> 
> Fixes: 88e9ca161c13 ("xen/pci: Use acpi_noirq_set() helper to avoid #ifdef")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> Cc: xen-devel@lists.xenproject.org
> Cc: linux-pci@vger.kernel.org
> ---
>  arch/x86/pci/xen.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-next-20200813.orig/arch/x86/pci/xen.c
> +++ linux-next-20200813/arch/x86/pci/xen.c
> @@ -26,6 +26,7 @@
>  #include <asm/xen/pci.h>
>  #include <asm/xen/cpuid.h>
>  #include <asm/apic.h>
> +#include <asm/acpi.h>
>  #include <asm/i8259.h>
>  
>  static int xen_pcifront_enable_irq(struct pci_dev *dev)
> 


thanks.
-- 
~Randy


