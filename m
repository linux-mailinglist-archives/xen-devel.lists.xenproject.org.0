Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 257F32EC372
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 19:49:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62646.111043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxDrB-0008QH-BM; Wed, 06 Jan 2021 18:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62646.111043; Wed, 06 Jan 2021 18:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxDrB-0008Ps-82; Wed, 06 Jan 2021 18:48:29 +0000
Received: by outflank-mailman (input) for mailman id 62646;
 Wed, 06 Jan 2021 18:48:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rX25=GJ=gmail.com=f.fainelli@srs-us1.protection.inumbo.net>)
 id 1kxDr9-0008Pn-8R
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 18:48:27 +0000
Received: from mail-pl1-x632.google.com (unknown [2607:f8b0:4864:20::632])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39bfcd54-b251-4020-886b-ae98ac3f03b5;
 Wed, 06 Jan 2021 18:48:26 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id x18so1994516pln.6
 for <xen-devel@lists.xenproject.org>; Wed, 06 Jan 2021 10:48:26 -0800 (PST)
Received: from [10.67.48.230] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id j1sm3316730pfd.181.2021.01.06.10.48.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jan 2021 10:48:24 -0800 (PST)
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
X-Inumbo-ID: 39bfcd54-b251-4020-886b-ae98ac3f03b5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sfS6nTsuJEQ2KUXwVWPiX/YqzyBLIXbNHEW6uRUFTRg=;
        b=NXfPqMjHZ1m+VSU2wCfyZSczPeoOaBqBO0y2hL9GIKKxEphY6j8qF+HY02PdeGCcs1
         IQKTTvuyCu/yb41s9PMHCdzfylbfSIsoGRTujMAEYOAHEIoOUuC4F3HXSrsva9rZnarc
         wQzQwDRcTkXjoJI9B76T2Yb69woBzux1ysRUAdnV4dEvsgBNf2Vc8hINoNV24B/BYpLj
         tkvlN8emBhxmIEY4VFqVedjbpmZ27tQyVfmi1xQk8ZMM88xZwfefkjV0nHHWYUkFKAoA
         egZxDPYVUcE7sO7mQ8St8vYTWGlg5GEZk93ImN/z4CSdViI0lT4W4/opitma5jXSxW8H
         3nwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=sfS6nTsuJEQ2KUXwVWPiX/YqzyBLIXbNHEW6uRUFTRg=;
        b=fAdmAHM8M3weyYr85XvSAI6H6o0lFWDkwoIt1TIrvVNbtlsliauMlyIimrlyNFWWQD
         NaEp5vUUQuJrmFsufLEqDVD9yMjELpi9lExGeXkf2QREyNnLyU5hZ5E75fd20Z4+SQy2
         OoFeK1mqV4BQJFDyyfORwOxFPgoVxzIe3XLtKs3pu6J9cg3R2hsdNYXJwpyIe2fg/TEC
         Kk+0kR8DVf4eeD+UiigEqxKbdvaraStFClV+TdPq9jtGTSi/clvE7a9/u/3fhyDoR0xJ
         JUQ7Irt99N3F92l3fytVYbvPxbPil7AprdPg92RAwNJZCtCEUDyCP+soommulPAXs2vU
         u4HA==
X-Gm-Message-State: AOAM533fm1pdf/4WY/yvYK59CZVThU5cDNl+aQ2qieEYRhM0+LEKqR0J
	NXzWGEsXtf3yK5x+dWWa2Ds=
X-Google-Smtp-Source: ABdhPJxEguQ7A+MqU7jQUet1bSnBHupg1s5yXoia2QcjJObylZzSHE2hX4KCXbbiaouJ8Qtgy4wdEw==
X-Received: by 2002:a17:90a:7d08:: with SMTP id g8mr5557718pjl.180.1609958905361;
        Wed, 06 Jan 2021 10:48:25 -0800 (PST)
Subject: Re: [RFC PATCH v3 0/6] Restricted DMA
To: Claire Chang <tientzu@chromium.org>, robh+dt@kernel.org,
 mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 joro@8bytes.org, will@kernel.org, frowand.list@gmail.com,
 konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, hch@lst.de, m.szyprowski@samsung.com,
 robin.murphy@arm.com
Cc: grant.likely@arm.com, xypron.glpk@gmx.de, treding@nvidia.com,
 mingo@kernel.org, bauerman@linux.ibm.com, peterz@infradead.org,
 gregkh@linuxfoundation.org, saravanak@google.com,
 rafael.j.wysocki@intel.com, heikki.krogerus@linux.intel.com,
 andriy.shevchenko@linux.intel.com, rdunlap@infradead.org,
 dan.j.williams@intel.com, bgolaszewski@baylibre.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, tfiga@chromium.org, drinkcat@chromium.org,
 Jim Quinlan <james.quinlan@broadcom.com>
References: <20210106034124.30560-1-tientzu@chromium.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 M5kY0ACeNhCZJvZ5g4C2Lc9fcTHu8jxmEkI=
Message-ID: <d7043239-12cf-3636-4726-2e3b90917dc6@gmail.com>
Date: Wed, 6 Jan 2021 10:48:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210106034124.30560-1-tientzu@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

First of all let me say that I am glad that someone is working on a
upstream solution for this issue, would appreciate if you could CC and
Jim Quinlan on subsequent submissions.

On 1/5/21 7:41 PM, Claire Chang wrote:
> This series implements mitigations for lack of DMA access control on
> systems without an IOMMU, which could result in the DMA accessing the
> system memory at unexpected times and/or unexpected addresses, possibly
> leading to data leakage or corruption.
> 
> For example, we plan to use the PCI-e bus for Wi-Fi and that PCI-e bus is
> not behind an IOMMU. As PCI-e, by design, gives the device full access to
> system memory, a vulnerability in the Wi-Fi firmware could easily escalate
> to a full system exploit (remote wifi exploits: [1a], [1b] that shows a
> full chain of exploits; [2], [3]).
> 
> To mitigate the security concerns, we introduce restricted DMA. Restricted
> DMA utilizes the existing swiotlb to bounce streaming DMA in and out of a
> specially allocated region and does memory allocation from the same region.
> The feature on its own provides a basic level of protection against the DMA
> overwriting buffer contents at unexpected times. However, to protect
> against general data leakage and system memory corruption, the system needs
> to provide a way to restrict the DMA to a predefined memory region (this is
> usually done at firmware level, e.g. in ATF on some ARM platforms).

Can you explain how ATF gets involved and to what extent it does help,
besides enforcing a secure region from the ARM CPU's perpsective? Does
the PCIe root complex not have an IOMMU but can somehow be denied access
to a region that is marked NS=0 in the ARM CPU's MMU? If so, that is
still some sort of basic protection that the HW enforces, right?

On Broadcom STB SoCs we have had something similar for a while however
and while we don't have an IOMMU for the PCIe bridge, we do have a a
basic protection mechanism whereby we can configure a region in DRAM to
be PCIe read/write and CPU read/write which then gets used as the PCIe
inbound region for the PCIe EP. By default the PCIe bridge is not
allowed access to DRAM so we must call into a security agent to allow
the PCIe bridge to access the designated DRAM region.

We have done this using a private CMA area region assigned via Device
Tree, assigned with a and requiring the PCIe EP driver to use
dma_alloc_from_contiguous() in order to allocate from this device
private CMA area. The only drawback with that approach is that it
requires knowing how much memory you need up front for buffers and DMA
descriptors that the PCIe EP will need to process. The problem is that
it requires driver modifications and that does not scale over the number
of PCIe EP drivers, some we absolutely do not control, but there is no
need to bounce buffer. Your approach scales better across PCIe EP
drivers however it does require bounce buffering which could be a
performance hit.

Thanks!
-- 
Florian

