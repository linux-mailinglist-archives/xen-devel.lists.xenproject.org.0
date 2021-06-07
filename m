Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6424339DFE0
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 17:00:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138024.255611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqGjU-0003Kz-4Q; Mon, 07 Jun 2021 15:00:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138024.255611; Mon, 07 Jun 2021 15:00:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqGjU-0003HQ-0t; Mon, 07 Jun 2021 15:00:04 +0000
Received: by outflank-mailman (input) for mailman id 138024;
 Mon, 07 Jun 2021 15:00:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b+N/=LB=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1lqGjS-00033i-5I
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 15:00:02 +0000
Received: from mail-pg1-x531.google.com (unknown [2607:f8b0:4864:20::531])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99589562-ee7e-48d1-b6e6-a181daa0355b;
 Mon, 07 Jun 2021 15:00:01 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id l1so14023997pgm.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jun 2021 08:00:01 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:1a:efea::4b1])
 by smtp.gmail.com with ESMTPSA id
 x6sm8711203pfd.173.2021.06.07.07.59.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 08:00:00 -0700 (PDT)
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
X-Inumbo-ID: 99589562-ee7e-48d1-b6e6-a181daa0355b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LBQFfB81E+P58yjRe+k2+cx97sDCbuPy/V/8bIJeXkc=;
        b=d1nEfDWwq7FWKqIFyB7wcvXzmP+qszgIuZNrjkwP3x1/yDu+sQSJ4TgOka8JMFwdpz
         FbG95ETwwZelyW9y9nYy/fBdQQ5EpoXh41Gbn4eQmQTaoxF5map34fNshbDgQ+GKj1eQ
         M2HNtozQY8mDF7hXNffuvHHSZK/H+HS3mDWozeDZ1wrNV7N6DSSxBit7yoz2Djn0vKsu
         PTtFJD9Ofb3TtKRa65oNYY7gKKMzGB1TuT8lxEnUuKWvE9MiqzfZDCghwXldP+Yap8sq
         BhmGax5uZd/Z3aYrXJPVjrW6XKPjEpwSZcuA8L3oguKgjEhjLQ9bi63V9oWBmfiZKAst
         VQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LBQFfB81E+P58yjRe+k2+cx97sDCbuPy/V/8bIJeXkc=;
        b=lcU0AdlwlwKyjqXx91ragKAI6QETceAtlwolt1BXPooKOLK/27wgtqAv5rdn7h2AsT
         6PnjSq5+/7vbmi8wNBL4DL4s7+HDg8UbgmSG8F/qsECEfK1WIvBC/bphUlt3PSfOKKnv
         Ajp0NoKXUFpEjcr4++PaRnT6eOai32ycU3HO8u3VC4BoowgERmJpenFp0sFSdxNPVcrE
         O+6qCiUAIm+grJpMhajSB2NJvTmMjkKu2LmLD+GIA5KlFxlkJH8ajBb4T6OTq7CzpJfi
         seALLMOo5rndidFIb4YsTennoHsb3/0hWo3uhi8a1cauttvlU/gyDgv3Kp1RhzTPcD8E
         Lhfw==
X-Gm-Message-State: AOAM5325y6Xc0WzW2kqeXCYbPayDD7jpaVI4Qahw74u2TgRO8u6kG3Tt
	zq2HaMFXuMYFlpgAhmcm1JU=
X-Google-Smtp-Source: ABdhPJxA6AxF//BtD4CX3ss9LWnlUG4jgLj+0PRFw+NP8biHDKV1XDA0j2C9BbRScevume4H06cdTA==
X-Received: by 2002:a63:7d2:: with SMTP id 201mr18504206pgh.14.1623078000846;
        Mon, 07 Jun 2021 08:00:00 -0700 (PDT)
Subject: Re: [RFC PATCH V3 11/11] HV/Storvsc: Add Isolation VM support for
 storvsc driver
To: Christoph Hellwig <hch@lst.de>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 arnd@arndb.de, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, akpm@linux-foundation.org,
 kirill.shutemov@linux.intel.com, rppt@kernel.org, hannes@cmpxchg.org,
 cai@lca.pw, krish.sadhukhan@oracle.com, saravanand@fb.com,
 Tianyu.Lan@microsoft.com, konrad.wilk@oracle.com, m.szyprowski@samsung.com,
 robin.murphy@arm.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
 xen-devel@lists.xenproject.org, davem@davemloft.net, kuba@kernel.org,
 jejb@linux.ibm.com, martin.petersen@oracle.com,
 iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, vkuznets@redhat.com,
 thomas.lendacky@amd.com, brijesh.singh@amd.com, sunilmut@microsoft.com
References: <20210530150628.2063957-1-ltykernel@gmail.com>
 <20210530150628.2063957-12-ltykernel@gmail.com>
 <20210607064603.GD24478@lst.de>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <26c771e5-a64e-f2cc-e245-fa5f130f4b18@gmail.com>
Date: Mon, 7 Jun 2021 22:59:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210607064603.GD24478@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/7/2021 2:46 PM, Christoph Hellwig wrote:
> On Sun, May 30, 2021 at 11:06:28AM -0400, Tianyu Lan wrote:
>> +				for (i = 0; i < request->hvpg_count; i++)
>> +					dma_unmap_page(&device->device,
>> +							request->dma_range[i].dma,
>> +							request->dma_range[i].mapping_size,
>> +							request->vstor_packet.vm_srb.data_in
>> +							     == READ_TYPE ?
>> +							DMA_FROM_DEVICE : DMA_TO_DEVICE);
>> +				kfree(request->dma_range);
> 
> Unreadably long lines.  You probably want to factor the quoted code into
> a little readable helper and do the same for the map side.

Good suggestion. Will update.

Thanks.

