Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0795B38967D
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 21:20:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130359.244258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljRjl-0006JS-6B; Wed, 19 May 2021 19:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130359.244258; Wed, 19 May 2021 19:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljRjl-0006Go-2N; Wed, 19 May 2021 19:20:09 +0000
Received: by outflank-mailman (input) for mailman id 130359;
 Wed, 19 May 2021 19:20:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=94wl=KO=gmail.com=f.fainelli@srs-us1.protection.inumbo.net>)
 id 1ljRjk-0006GT-Ff
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 19:20:08 +0000
Received: from mail-pg1-x536.google.com (unknown [2607:f8b0:4864:20::536])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47675ec2-7ff0-43bf-a5ea-bf3f7540bb42;
 Wed, 19 May 2021 19:20:07 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id i5so10189339pgm.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 May 2021 12:20:07 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id m5sm109361pgl.75.2021.05.19.12.20.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 12:20:06 -0700 (PDT)
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
X-Inumbo-ID: 47675ec2-7ff0-43bf-a5ea-bf3f7540bb42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uMIDYXiQCge+lCPg7jWJZVlhfPYt5aTIXixKF3xFdtw=;
        b=Yg91ASxZAaNzg/r8+0Ydre6wM45Ae3A1iPokHrBnYytUGLfpFnHdf3IFz8HESX0/2+
         g821YtdozGCEBqe5IWPqRoORjgSuvSUsnUJvkFHQmi1Z8EyDysdL0ajJwNlL5xiTuXsv
         wFEKThjSNrz9xGLrgbp/gM/UJUw8aKgxniG4Yn3LJ2CAh4MiM/s09DXVGVwgC1M7Lc1O
         mqFqDRB1Z5q6tLXZhXMkex5oVmrXUvI0/xcrkwhwr72xMCAoZJcgyVejktim5H+sPgp9
         TLPqhl56m5cKFfFNduokObt8ZVxO6KXBoFBtUzi8i8SumVh20RnjYnxygdSMJ5gi3qzx
         uvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uMIDYXiQCge+lCPg7jWJZVlhfPYt5aTIXixKF3xFdtw=;
        b=pbMc26j1DkYxpnoZ5SrjJ30I+8JAj5UtHE6fVpwUhysETIeBR1KHqhj7lqcZZfTZVd
         KVGXSGOpF+CurbHwLmr0uWhXWPgHZAYg4vjGprOjuMD/IDZD0R5m2ep0RfVyw/wBw5kn
         9vWV4OVF2Ukn4RiVA5kXEDBwHnhYXUO0drxYxvLrYS1s2GVvsc9pUrKr5dINKj79q/Y7
         nFfUMDZbA4od0baqQh1+eJWSoifs+XE3hb8IyPyJPBiErU96Nd9f6+JpUFzWGzSeZJlv
         RPY9rSidFDhhg254JVRoGlvIhQynNn1w+TTjnpBePfzaxOAGK6loO7EJwtOpJJQuJ+L4
         jKBw==
X-Gm-Message-State: AOAM532PxrBx10jXjLk7tfcJN5ZuDSJay08O3z2uE7esmlj49QBODYWM
	Hl0EXgFL6VD7C+pNcaOvt6o=
X-Google-Smtp-Source: ABdhPJylNyq7yX8wc3qiI92uMNP4dk54r6bNs8/LZR+DzeCwuyO2pJ1p5Agdk04xE/qvY5oPdEYXRQ==
X-Received: by 2002:aa7:90d4:0:b029:28e:b912:acf with SMTP id k20-20020aa790d40000b029028eb9120acfmr661343pfk.43.1621452007052;
        Wed, 19 May 2021 12:20:07 -0700 (PDT)
Subject: Re: [PATCH v7 07/15] swiotlb: Update is_swiotlb_active to add a
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
 <20210518064215.2856977-8-tientzu@chromium.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <6cae5ffa-f31b-ba08-c2cf-4a3dd76afb3b@gmail.com>
Date: Wed, 19 May 2021 12:20:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210518064215.2856977-8-tientzu@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/17/2021 11:42 PM, Claire Chang wrote:
> Update is_swiotlb_active to add a struct device argument. This will be
> useful later to allow for restricted DMA pool.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

