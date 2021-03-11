Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D01E336B51
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 06:06:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96340.182157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKDVD-0004lK-Sz; Thu, 11 Mar 2021 05:04:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96340.182157; Thu, 11 Mar 2021 05:04:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKDVD-0004kv-Ps; Thu, 11 Mar 2021 05:04:51 +0000
Received: by outflank-mailman (input) for mailman id 96340;
 Thu, 11 Mar 2021 05:04:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6g93=IJ=gmail.com=f.fainelli@srs-us1.protection.inumbo.net>)
 id 1lKDVB-0004kq-LE
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 05:04:49 +0000
Received: from mail-pj1-x102f.google.com (unknown [2607:f8b0:4864:20::102f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac8a017a-c856-4598-b349-fcfbcd7c63a3;
 Thu, 11 Mar 2021 05:04:48 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id bt4so2861173pjb.5
 for <xen-devel@lists.xenproject.org>; Wed, 10 Mar 2021 21:04:48 -0800 (PST)
Received: from [10.230.29.30] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id y2sm979638pgf.7.2021.03.10.21.04.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 21:04:47 -0800 (PST)
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
X-Inumbo-ID: ac8a017a-c856-4598-b349-fcfbcd7c63a3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eayOjb0KZ31qj1N8PdToC+xRVUBfCHUPI3Znks8WR0k=;
        b=IL1N7vM7p9PzFcfpvhgRRMuOzhmjBlfibWkIcOQbYlGbPOJMnLhIzjCy8LxBaJ8EGU
         KJjjEgkbLtjbaD4sqhZ1ochG6cVFghEOlubEd7dsbfPijX8lC9eVqiLaeiTO3VXqhE5j
         YprOjLc8isTrNz1yxLNXa7sz1Bhn0z1t0w+HJ0pPJUXLLao5DKoPWk0aWURYin4FB6OE
         oTFCyRJLtkVFf3JLLGhSJTXk7wLVT433snzVLTFp5sM2sqXb87myqAsWS9pqaTfVDExL
         f+ojkMFllNvYboAo4xsrXYacF/clYDZcJc779Ph0MFvl0b3brsNawqyYAhHoxSZKsU/v
         mTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eayOjb0KZ31qj1N8PdToC+xRVUBfCHUPI3Znks8WR0k=;
        b=HoxkdiJH2vwc59gmSIJlkgCxjN0jVPXcKAbmJyCR/AAh1mFSURLy5PReFpAl+hBxSa
         JkIRlTp/DPpAK5+ygjP6iFtfklxIAZ3uRUEt/0nfC7vTzBSNbYP5ntf4eZa+816x/rE2
         9Cz5oDNsFtPNUeiwfEoXmJ1kpGY/I6b9wtbi4MOjSTa5E8gETLn/6F5HLOn9GsP++n27
         5RwDm6mjiJ3UDaEjW1D2CShGgpDKzZljsuDDj1japIRRxjUky99skLDu2yvig0APHNOC
         qKxePRgL5isv6f1hM3dvrs4Q+HS23WkrubnAkZN3YlWfgp0+6+bBmorKxRnYFL+FSK9E
         OAYQ==
X-Gm-Message-State: AOAM531AzCDY7uNObxNalECda//3HpOr2x+zdqOYD49f/JToEw67HOt7
	Hocr0ZQpZVrZ7Syv52NBwpQ=
X-Google-Smtp-Source: ABdhPJzomvd6XDgwv/fL+vlX+FLEQgGyCWkzPbL90UL/BQndPGhzKH0Q4L/hjqK/fMjpcf3zxKU3vg==
X-Received: by 2002:a17:90a:a403:: with SMTP id y3mr7078020pjp.227.1615439087609;
        Wed, 10 Mar 2021 21:04:47 -0800 (PST)
Subject: Re: [PATCH v4 13/14] dt-bindings: of: Add restricted DMA pool
To: Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>
Cc: Claire Chang <tientzu@chromium.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Joerg Roedel <joro@8bytes.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Grant Likely <grant.likely@arm.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Thierry Reding
 <treding@nvidia.com>, Ingo Molnar <mingo@kernel.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Greg KH <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, Dan Williams
 <dan.j.williams@intel.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Jim Quinlan <james.quinlan@broadcom.com>
References: <20210209062131.2300005-1-tientzu@chromium.org>
 <20210209062131.2300005-14-tientzu@chromium.org>
 <20210310160747.GA29834@willie-the-truck>
 <CAL_JsqJE6A4awYCvqzw3qk2uAJEKgkSOKbk9tPaMKup8zes8cA@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <a5a684fe-5ed0-a12f-22ca-a8ba46124341@gmail.com>
Date: Wed, 10 Mar 2021 21:04:42 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJE6A4awYCvqzw3qk2uAJEKgkSOKbk9tPaMKup8zes8cA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/10/2021 1:40 PM, Rob Herring wrote:
> On Wed, Mar 10, 2021 at 9:08 AM Will Deacon <will@kernel.org> wrote:
>>
>> Hi Claire,
>>
>> On Tue, Feb 09, 2021 at 02:21:30PM +0800, Claire Chang wrote:
>>> Introduce the new compatible string, restricted-dma-pool, for restricted
>>> DMA. One can specify the address and length of the restricted DMA memory
>>> region by restricted-dma-pool in the reserved-memory node.
>>>
>>> Signed-off-by: Claire Chang <tientzu@chromium.org>
>>> ---
>>>  .../reserved-memory/reserved-memory.txt       | 24 +++++++++++++++++++
>>>  1 file changed, 24 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>>> index e8d3096d922c..fc9a12c2f679 100644
>>> --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>>> +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>>> @@ -51,6 +51,20 @@ compatible (optional) - standard definition
>>>            used as a shared pool of DMA buffers for a set of devices. It can
>>>            be used by an operating system to instantiate the necessary pool
>>>            management subsystem if necessary.
>>> +        - restricted-dma-pool: This indicates a region of memory meant to be
>>> +          used as a pool of restricted DMA buffers for a set of devices. The
>>> +          memory region would be the only region accessible to those devices.
>>> +          When using this, the no-map and reusable properties must not be set,
>>> +          so the operating system can create a virtual mapping that will be used
>>> +          for synchronization. The main purpose for restricted DMA is to
>>> +          mitigate the lack of DMA access control on systems without an IOMMU,
>>> +          which could result in the DMA accessing the system memory at
>>> +          unexpected times and/or unexpected addresses, possibly leading to data
>>> +          leakage or corruption. The feature on its own provides a basic level
>>> +          of protection against the DMA overwriting buffer contents at
>>> +          unexpected times. However, to protect against general data leakage and
>>> +          system memory corruption, the system needs to provide way to lock down
>>> +          the memory access, e.g., MPU.
>>
>> As far as I can tell, these pools work with both static allocations (which
>> seem to match your use-case where firmware has preconfigured the DMA ranges)
>> but also with dynamic allocations where a 'size' property is present instead
>> of the 'reg' property and the kernel is responsible for allocating the
>> reservation during boot. Am I right and, if so, is that deliberate?
> 
> I believe so. I'm not keen on having size only reservations in DT.
> Yes, we allowed that already, but that's back from the days of needing
> large CMA carveouts to be reserved early in boot. I've read that the
> kernel is much better now at contiguous allocations, so do we really
> need this in DT anymore?

I would say yes, there can be a number of times where you want to semi
statically partition your physical memory and their reserved regions. Be
it to pack everything together under the same protection rules or
because you need to allocate memory from a particular address range in
say a non-uniform memory controller architecture where address windows
have different scheduling algorithms.
-- 
Florian

