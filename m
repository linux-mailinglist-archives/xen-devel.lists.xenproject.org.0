Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF46389607
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 21:00:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130327.244200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljRQH-0000wh-7b; Wed, 19 May 2021 19:00:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130327.244200; Wed, 19 May 2021 19:00:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljRQH-0000uS-4O; Wed, 19 May 2021 19:00:01 +0000
Received: by outflank-mailman (input) for mailman id 130327;
 Wed, 19 May 2021 18:59:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=94wl=KO=gmail.com=f.fainelli@srs-us1.protection.inumbo.net>)
 id 1ljRQF-0000uM-6E
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 18:59:59 +0000
Received: from mail-pf1-x42e.google.com (unknown [2607:f8b0:4864:20::42e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efdee6e5-0491-4271-ad82-2ec470acd004;
 Wed, 19 May 2021 18:59:58 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id c17so10557313pfn.6
 for <xen-devel@lists.xenproject.org>; Wed, 19 May 2021 11:59:58 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id 63sm140020pfz.26.2021.05.19.11.59.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 11:59:57 -0700 (PDT)
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
X-Inumbo-ID: efdee6e5-0491-4271-ad82-2ec470acd004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=M073CmbM6OvFOLG+SWp0SNpXEbUxhFfHxxoda72NgXE=;
        b=Ekc2ScXY1SHvF4H29yTRhgjiTSWV6Cyne34MQrajkIT3p2pu6mu773Qlyr0kpC2NNU
         P+GJiyNV1K2vRtkjtAhIgI9VHVYmFkAxziAc3YITYD5dCFwhGNrQytvT7wWGVjrLLVt/
         Z+eGZOsPbQoTabmseviirRgNiL7jb93KoBbw+F8LkLIJVv78TKzBCCrYFTn6M7Wbv/bo
         0UQmBpP3G5FMrLaiP4lB4mvY0KeluMFddI6VD1W8D7dp8q/8Zp42g/wrvlGw3mxI6q03
         5p/katWWYvUn05FJWNltsTeqIMenps29TVH4Onz8E4y1A5fSnj1TT7Ka2b9bvOBYDjcG
         zYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=M073CmbM6OvFOLG+SWp0SNpXEbUxhFfHxxoda72NgXE=;
        b=GGGYWZkPipCdRAsa8T1ey0mfx3dRK8pzTRtRGbDmFrGSPfa4+o4YR1Vf31LsUVexO2
         CAWMLwbFbj4D6atO51T+oEhsIfa+U/2dg2slJfYdDEo3wl/5KXKc6UJIX+qRIXPXJL1z
         zKf+wNnny3/tzEZ84O7ueL5SdZi6Ari5B7+iEbZK6GkHCi9Zd6j91X1gdOJDGZYL7aiD
         MNC20uHuT5QnZL/ZIdtvpbp0E60IqhIFKobOkv4H5JwHta02eHJ0dHFkZccEm31idOuV
         3oPNgmGdZ/4vygcTD4KzCiER+CCeBjeU+VnvnYBcWFQOYwGJvC3WNvDIvDLHRAPNbK2k
         0FFQ==
X-Gm-Message-State: AOAM533MHL++7NRjGd4pGbuxF/BFUWho4or2HJWy2arH82acH7CEEl3G
	eREvdIB4CPn/DOvP4RK2yFs=
X-Google-Smtp-Source: ABdhPJyp0yRJO2tDNgGd4CfLo9HXihdjW7DvkJwzlUWA3fY93WK5PBHIJbH2WL1TmMBXCaStbeZwNQ==
X-Received: by 2002:a65:48c2:: with SMTP id o2mr575344pgs.376.1621450797716;
        Wed, 19 May 2021 11:59:57 -0700 (PDT)
Subject: Re: [PATCH v7 11/15] dma-direct: Add a new wrapper
 __dma_direct_free_pages()
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
 <20210518064215.2856977-12-tientzu@chromium.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <8c274da9-db90-cb42-c9b2-815ee0c6fca3@gmail.com>
Date: Wed, 19 May 2021 11:59:50 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210518064215.2856977-12-tientzu@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/17/2021 11:42 PM, Claire Chang wrote:
> Add a new wrapper __dma_direct_free_pages() that will be useful later
> for swiotlb_free().
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

