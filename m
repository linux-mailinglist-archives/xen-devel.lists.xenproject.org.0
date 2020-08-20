Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AA524C0E2
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 16:48:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8lrM-0001yB-AS; Thu, 20 Aug 2020 14:48:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UrXB=B6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k8lrK-0001y6-Bs
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 14:48:06 +0000
X-Inumbo-ID: d35d5a39-e026-497c-8271-bc5e5c66770e
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d35d5a39-e026-497c-8271-bc5e5c66770e;
 Thu, 20 Aug 2020 14:48:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A0178AC6E;
 Thu, 20 Aug 2020 14:48:31 +0000 (UTC)
Subject: Re: [PATCH] x86/pci: fix xen.c build error when CONFIG_ACPI is not set
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <a020884b-fa44-e732-699f-2b79c9b7d15e@infradead.org>
 <88afdd4a-1b30-d836-05ce-8919b834579b@infradead.org>
 <20200820144020.GA31230@char.us.oracle.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d4bd7cc9-0194-3833-2098-12a2c3cb2c5d@suse.com>
Date: Thu, 20 Aug 2020 16:48:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200820144020.GA31230@char.us.oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

On 20.08.20 16:40, Konrad Rzeszutek Wilk wrote:
> On Wed, Aug 19, 2020 at 08:09:11PM -0700, Randy Dunlap wrote:
>> Hi Konrad,
> 
> Hey Randy,
> 
> I believe Juergen is picking this up.

Yes, have queued it for rc2.


Juergen

>>
>> ping.
>>
>> I am still seeing this build error. It looks like this is
>> in your territory to merge...
>>
>>
>> On 8/13/20 4:00 PM, Randy Dunlap wrote:
>>> From: Randy Dunlap <rdunlap@infradead.org>
>>>
>>> Fix build error when CONFIG_ACPI is not set/enabled:
>>>
>>> ../arch/x86/pci/xen.c: In function ‘pci_xen_init’:
>>> ../arch/x86/pci/xen.c:410:2: error: implicit declaration of function ‘acpi_noirq_set’; did you mean ‘acpi_irq_get’? [-Werror=implicit-function-declaration]
>>>    acpi_noirq_set();
>>>
>>> Fixes: 88e9ca161c13 ("xen/pci: Use acpi_noirq_set() helper to avoid #ifdef")
>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> Cc: Bjorn Helgaas <bhelgaas@google.com>
>>> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
>>> Cc: xen-devel@lists.xenproject.org
>>> Cc: linux-pci@vger.kernel.org
>>> ---
>>>   arch/x86/pci/xen.c |    1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> --- linux-next-20200813.orig/arch/x86/pci/xen.c
>>> +++ linux-next-20200813/arch/x86/pci/xen.c
>>> @@ -26,6 +26,7 @@
>>>   #include <asm/xen/pci.h>
>>>   #include <asm/xen/cpuid.h>
>>>   #include <asm/apic.h>
>>> +#include <asm/acpi.h>
>>>   #include <asm/i8259.h>
>>>   
>>>   static int xen_pcifront_enable_irq(struct pci_dev *dev)
>>>
>>
>>
>> thanks.
>> -- 
>> ~Randy
>>
> 


