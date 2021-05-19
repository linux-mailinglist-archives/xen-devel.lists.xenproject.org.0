Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2653F389699
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 21:24:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130367.244269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljRno-00078r-Ng; Wed, 19 May 2021 19:24:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130367.244269; Wed, 19 May 2021 19:24:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljRno-00075w-KH; Wed, 19 May 2021 19:24:20 +0000
Received: by outflank-mailman (input) for mailman id 130367;
 Wed, 19 May 2021 19:24:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=94wl=KO=gmail.com=f.fainelli@srs-us1.protection.inumbo.net>)
 id 1ljRnn-00075q-MJ
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 19:24:19 +0000
Received: from mail-pf1-x42a.google.com (unknown [2607:f8b0:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aebbb963-545d-4c9c-bd6c-9cca701e0564;
 Wed, 19 May 2021 19:24:19 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id x18so6303601pfi.9
 for <xen-devel@lists.xenproject.org>; Wed, 19 May 2021 12:24:19 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id gj21sm4690007pjb.49.2021.05.19.12.24.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 12:24:17 -0700 (PDT)
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
X-Inumbo-ID: aebbb963-545d-4c9c-bd6c-9cca701e0564
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=47JQ73C0NJdLVL+El8Yu9LZib8r+sSTJ+nf9zBKe9o0=;
        b=CToMN5sVOeaSvxsFwh30mnX1cEfbujdvLOsJoVGXyNK5xIClhHeY9+5gjOfAEdXX3G
         eU6qVJByg68kQ/w6JlnavFgIe+nfjuKKhbAsZxJHLIoUmLJC+FNQXwfuXltAASilweQx
         t+08hp5u1PLu1TqToQLVPh129PwSHFiJcf7M+I2aRakLaRJ2reqCHrxjRIjxuLTiBnzU
         obYFCXVysXAW0hEOj/ZFRzKi1W/0ELgGhGTgBKGpo2iX5m/PP/BptzsrBt+DoXhRmi5/
         WDDfuoHSDbRwV59E2nqJbeAwXtBih5h7WjHhxwWGM7Qsk3IgYQx+mCus3GhZ5jZ2T7eK
         2tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=47JQ73C0NJdLVL+El8Yu9LZib8r+sSTJ+nf9zBKe9o0=;
        b=H/qjl1bxUdwi8E2LVSV6U6h/r0SGr/0fosgKHoC/FWwareX/7fs9bS3PTl/Wr5zW7q
         rCD5WjjGd9ygjdAfMWBdDW3H5XrLfz48Mak5hQ7AjYMPJ91IaqfLm6qgqOTrNILK6A4e
         +xP/d3cE8i7Qt5fn6zZxnLt0zTc7PIaVEcClMFe2T/sKrIu8TbKdW+UvhjSUVGWZRQwN
         muRxeNJyKCeLtPmxh/ErAvYoL+KaPRI5FVwbQ2Uhu1p7LlH2ET55b4dKXeMRTDEfy5ZJ
         bEqJgGnjboDCukvRst/kNyWCEH0uHipYpem0bdVaZFjCtvcD8vkv3n7fL/QcFGCAEayU
         flcA==
X-Gm-Message-State: AOAM531yRfm+4MkzTN+uHNsiRmzEaSW1/QwL+xIvLvGF0SItqrDgnied
	NhLcifMKsnBMO50suKk7NAI=
X-Google-Smtp-Source: ABdhPJzJyhu29XiaIUqubYuVceyIJwVsMCRuIXu8+2duk9EuCth6A3fkL6TVyZT/YsIkYQB5Otc01Q==
X-Received: by 2002:a62:1d52:0:b029:2dd:ee:1439 with SMTP id d79-20020a621d520000b02902dd00ee1439mr573310pfd.57.1621452258195;
        Wed, 19 May 2021 12:24:18 -0700 (PDT)
Subject: Re: [PATCH v7 02/15] swiotlb: Refactor swiotlb_create_debugfs
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
 <20210518064215.2856977-3-tientzu@chromium.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <d4a3ee6d-55be-1a60-9092-66b444dc9dda@gmail.com>
Date: Wed, 19 May 2021 12:24:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210518064215.2856977-3-tientzu@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/17/2021 11:42 PM, Claire Chang wrote:
> Split the debugfs creation to make the code reusable for supporting
> different bounce buffer pools, e.g. restricted DMA pool.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

