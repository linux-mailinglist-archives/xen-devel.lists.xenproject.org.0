Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66981389677
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 21:19:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130355.244246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljRjS-00057q-TR; Wed, 19 May 2021 19:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130355.244246; Wed, 19 May 2021 19:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljRjS-00055q-Pq; Wed, 19 May 2021 19:19:50 +0000
Received: by outflank-mailman (input) for mailman id 130355;
 Wed, 19 May 2021 19:19:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=94wl=KO=gmail.com=f.fainelli@srs-us1.protection.inumbo.net>)
 id 1ljRjR-00055i-6l
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 19:19:49 +0000
Received: from mail-pf1-x434.google.com (unknown [2607:f8b0:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb305a74-8fc9-4194-b0b6-8a9666d7c7e4;
 Wed, 19 May 2021 19:19:48 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id g18so8927326pfr.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 May 2021 12:19:48 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id y66sm128104pgb.14.2021.05.19.12.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 12:19:47 -0700 (PDT)
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
X-Inumbo-ID: fb305a74-8fc9-4194-b0b6-8a9666d7c7e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ghVDOoMvorTJdaMzHQG/RIv5BmHhyL6sw4dTSHsJEnU=;
        b=rcLYOAKu9u/Pk2N2pIINoWg7Qql5CHIaTXPW1rmbbrFNRBJ17e6P88xZ/Yr3+K40Vg
         KFK9I+oMG/IgtitN6mi8iqL0UX94lczwdh7i0nBMb8jue1bBvD+G4ynJruy5PLRKgM8v
         188V9tFxrPE9B0B1aPKzXgftN+LtzT071WIlfZD+1U+hRwMChhgRPMvMzKYVh5Q7yJyY
         X233KhJbv3QXKhh18IR7fU0ZBHQkRzKr/brYbrWfvUGYpz9WfdE1CfhVQ0XA+pTrnR5x
         VWSQyHCExyqYP4xFwbo2E8+nGlIJeknoGezPntMeUW6YyiidoBVXS6cxaKILk/O3+EJK
         3+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ghVDOoMvorTJdaMzHQG/RIv5BmHhyL6sw4dTSHsJEnU=;
        b=MuwPnJjtfDqLBb/SL8hCYOxA+pS3OYY9pFjDGOwSD80IAyrlN1xW1+1H673hUCDMtU
         Bz4Gxq4EH05ERPRLIQQKy7BVQ7J4FMx6qKlywFennT2fkRXaij9Zrf5ge4b6ltkoqIx/
         NuIprLNjgpb8Lkw/7NReLqntoEEopAZ/4+neiEIu+UFDNnzc1kb/HO938ef3dM88JZHP
         fKUuCXzeNSGs2EhSLDPAvHEOnAEoQchoiBJbW98yWKvMpeHU/l4h3+J2Jwpyyc4t3MBk
         o/ZdNjj7KVxpag5njaZHVgqkIJQ4BgVXC/3hIGiyfnkIejPWrJZ/qfOmKIbmwsY5KNPT
         f6Nw==
X-Gm-Message-State: AOAM53112IG4pZzzu3gVSo2kZCsdoQxRbByd4786ImASa1vL4W3616Ev
	WdsmBzsoRXcsQaVyesIVwvo=
X-Google-Smtp-Source: ABdhPJwjgDsBVD45dTtfq/CuwPFV8Nn9xvyX5u2jGlIQAuONAFWU5ZnSLNw+gRQXo9RnVxq5dGzq7g==
X-Received: by 2002:a63:4e01:: with SMTP id c1mr645397pgb.265.1621451987803;
        Wed, 19 May 2021 12:19:47 -0700 (PDT)
Subject: Re: [PATCH v7 06/15] swiotlb: Update is_swiotlb_buffer to add a
 struct device argument
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
 <20210518064215.2856977-7-tientzu@chromium.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <e825f332-eabe-4a82-1528-8bc9d1e60625@gmail.com>
Date: Wed, 19 May 2021 12:19:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210518064215.2856977-7-tientzu@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/17/2021 11:42 PM, Claire Chang wrote:
> Update is_swiotlb_buffer to add a struct device argument. This will be
> useful later to allow for restricted DMA pool.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

