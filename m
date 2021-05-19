Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 595C638966D
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 21:18:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130351.244235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljRi3-0004Vr-I3; Wed, 19 May 2021 19:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130351.244235; Wed, 19 May 2021 19:18:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljRi3-0004TC-F5; Wed, 19 May 2021 19:18:23 +0000
Received: by outflank-mailman (input) for mailman id 130351;
 Wed, 19 May 2021 19:18:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=94wl=KO=gmail.com=f.fainelli@srs-us1.protection.inumbo.net>)
 id 1ljRi1-0004T6-J8
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 19:18:21 +0000
Received: from mail-pf1-x42c.google.com (unknown [2607:f8b0:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f521c52-7293-4dfb-8161-2c5561bae6c0;
 Wed, 19 May 2021 19:18:20 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id f22so2221733pfn.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 May 2021 12:18:20 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id d131sm147671pfd.176.2021.05.19.12.18.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 12:18:19 -0700 (PDT)
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
X-Inumbo-ID: 1f521c52-7293-4dfb-8161-2c5561bae6c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qkzCD1nWkBURpBrpJXY23W3vLoZSck6AY/wcT/olSRk=;
        b=Jr32Uvht2cSrNILgfPTD5ViC6pT8b+8Rv+juxOSQTQwrJ1CAD0MBJHubcHjyOKsUbI
         JfDjb6IlvhZ8t3+ym7sOQ4a9U6dHEsOXxzesVMPv6UDrlo59kYq82tWRbs9w2uqU+yYo
         8oA/biTXJEGtIK7ZUbiBmZQYbJzsutIezjLCjW+be0py6uPVuz9vfS/rc828YcCt+zVs
         WRnXVlWSjrk7BMwlJdqMQwTvyoJQltUeu2a7CMQB207kX6rGqLkbNNdIKCNuEPYfxlj8
         c8CbGpi6xXQEr0VSmTVe/i1v9YaB96qj2/4NW8B/lTGCTjbb7h0/a34Yz4Z5jXjVRuz+
         oRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qkzCD1nWkBURpBrpJXY23W3vLoZSck6AY/wcT/olSRk=;
        b=uQzavruJFqy504LXT8xUipP0ipIEPU0YBtZJZQYFAQgRADuL3+s14cmtWRL5y4VN9D
         VrFw2DkvjIuQqWgLu14nBoiAdTAus17g/WgJhPbb+L/eR9pbrryLd9vGanW0dd8zLEng
         sNcrhGfywME3AxCVeDlLwefOP77LPq0np/wQy5xbV4mVI9LzhFvjPp63OAqsa3n/uBvq
         SbRseGONikZ8U4q2D0LAgPfDN/zxbA4Cjhw5BkIKLAtBaPQCwlZHD2IyuF7VrVMoBYMB
         pnoAIub3jNO3quMtS2SFu1c2zZK+a67qjJZDgUu/GMuh6yNQA1ABib5DZjWIhV0b6pHc
         Fbnw==
X-Gm-Message-State: AOAM530eKRGin8RXwQHu+hTLVlqHHArEOG7/iW38uYdcykTe0QPxQspz
	7xcSh6rOT2vD1uiXfblKJgM=
X-Google-Smtp-Source: ABdhPJyun5zEd3qUDcE/GtFSWzJiED1dVWEJkkT2Lvnwoihmboc879WuDVAjjHLr8vtaHKK8YVFCpg==
X-Received: by 2002:a65:4286:: with SMTP id j6mr636207pgp.261.1621451900054;
        Wed, 19 May 2021 12:18:20 -0700 (PDT)
Subject: Re: [PATCH v7 05/15] swiotlb: Add a new get_io_tlb_mem getter
To: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: benh@kernel.crashing.org, paulus@samba.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 sstabellini@kernel.org, Robin Murphy <robin.murphy@arm.com>,
 grant.likely@arm.com, xypron.glpk@gmx.de, Thierry Reding
 <treding@nvidia.com>, mingo@kernel.org, bauerman@linux.ibm.com,
 peterz@infradead.org, Greg KH <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 heikki.krogerus@linux.intel.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, Dan Williams
 <dan.j.williams@intel.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 xen-devel@lists.xenproject.org, Nicolas Boichat <drinkcat@chromium.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, tfiga@chromium.org,
 bskeggs@redhat.com, bhelgaas@google.com, chris@chris-wilson.co.uk,
 daniel@ffwll.ch, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 jxgao@google.com, joonas.lahtinen@linux.intel.com,
 linux-pci@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 matthew.auld@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-6-tientzu@chromium.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <52714d95-3562-97fc-0dee-761adfc364cb@gmail.com>
Date: Wed, 19 May 2021 12:18:13 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210518064215.2856977-6-tientzu@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/17/2021 11:42 PM, Claire Chang wrote:
> Add a new getter, get_io_tlb_mem, to help select the io_tlb_mem struct.
> The restricted DMA pool is preferred if available.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

