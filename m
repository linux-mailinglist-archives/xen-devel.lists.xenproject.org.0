Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC383A683C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 15:42:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141511.261371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsmr3-0002Z3-1G; Mon, 14 Jun 2021 13:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141511.261371; Mon, 14 Jun 2021 13:42:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsmr2-0002Vw-UK; Mon, 14 Jun 2021 13:42:16 +0000
Received: by outflank-mailman (input) for mailman id 141511;
 Mon, 14 Jun 2021 13:42:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Ibu=LI=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1lsmr1-0002Vq-9W
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 13:42:15 +0000
Received: from mail-pg1-x52c.google.com (unknown [2607:f8b0:4864:20::52c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id deadc58d-8e76-4385-90e2-726bcddf4c1a;
 Mon, 14 Jun 2021 13:42:14 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id t17so8669625pga.5
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jun 2021 06:42:14 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:1a:efea::4b1])
 by smtp.gmail.com with ESMTPSA id
 s13sm13014226pgi.36.2021.06.14.06.42.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 06:42:13 -0700 (PDT)
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
X-Inumbo-ID: deadc58d-8e76-4385-90e2-726bcddf4c1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BOH7Vu+778+ln6ekCo+GQvvDaGAsmqLU6p5AWEG4zZQ=;
        b=UL15DRdkb+5FCOorYR2hP1xNvGKF+hhVpp6Zgl0ZEc/kynMSrJYTv2B24Mo4Twd4OC
         vrOGM4BGqqMhwnmUjnn22As3rfqICUuSLDNUfN4x055EQkDEP6U8uykZ1ageGPFza6dy
         jotUZIYfU7sXGQAZHr4kuOdz1HN1DauLgWNH57sKiZSzR0dkndXAb/EFiLKvDgTKoc5n
         CF/y9pIWqcDDuK8B74SpZxdcaDkimajNnHxGveNvr7r1vPb4MaK8pI1+WDcP5irZNQIO
         K/ubQwcXeNSCfSAQihAGciweSNRMmdfdrpjGhRR3Ol9hGp7Cim/3jPpHV8NR+c4DzoMz
         2CfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BOH7Vu+778+ln6ekCo+GQvvDaGAsmqLU6p5AWEG4zZQ=;
        b=p9lhIZWdIFc6DT1u/BQJolvEwlezJU8vyMcJWWVuDO9/Lj9Gp6lDcw4I2AVu2iDsX8
         8micOLf1hLuCJAgxhDJdgJclMLmMI8SePF9g0trWtU3OSMsAVzaKrU92rWiTvtcfkfnB
         JsbD7ufJVIfDKXNIt6NKqKdMkFBc4mmBz25m7FhRP7l1SVnxEKPd8EEayrGyY1sMJpJs
         Zl8AuYqzCWNsKWHbm24h6lqd/M42vCyZLfAXo140shU8SBsU/AQsrT7a1eUWcKChbc/u
         HQeqKUZ93PlehyrLrALamd8afc4MYDF91yIMKQB6M3lPGAQwKf0MEv36IZVV0e0nASCU
         MsjA==
X-Gm-Message-State: AOAM532hBrnrpeprYCs0pKjz0/xk4G2pkKFPVGtECaNgLZOuxXzF8qCY
	n7DV2EAyKw7ZGjjtf+b2qNs=
X-Google-Smtp-Source: ABdhPJzSD5SSODv3ZNJBk7/EJwQiektVm8x7/VFzAUKIi7xqvpG8L/erou4acHYRKMj3nTXmR0zAfQ==
X-Received: by 2002:a63:f13:: with SMTP id e19mr16837169pgl.112.1623678133793;
        Mon, 14 Jun 2021 06:42:13 -0700 (PDT)
Subject: Re: [RFC PATCH V3 08/11] swiotlb: Add bounce buffer remap address
 setting function
From: Tianyu Lan <ltykernel@gmail.com>
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
 <20210530150628.2063957-9-ltykernel@gmail.com>
 <20210607064312.GB24478@lst.de>
 <48516ce3-564c-419e-b355-0ce53794dcb1@gmail.com>
 <20210614071223.GA30171@lst.de>
 <3e64e59b-7440-69a5-75c5-43225f3d6c0a@gmail.com>
Message-ID: <ee3d79ea-f4f9-b886-e1ee-e26b42a88530@gmail.com>
Date: Mon, 14 Jun 2021 21:42:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3e64e59b-7440-69a5-75c5-43225f3d6c0a@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/14/2021 9:37 PM, Tianyu Lan wrote:
> 
> 
> On 6/14/2021 3:12 PM, Christoph Hellwig wrote:
>> On Mon, Jun 07, 2021 at 10:56:47PM +0800, Tianyu Lan wrote:
>>> These addresses in extra address space works as system memory mirror. 
>>> The
>>> shared memory with host in Isolation VM needs to be accessed via extra
>>> address space which is above shared gpa boundary.
>>
>> Why?
>>
> 
> The shared_gpa_boundary in the AMD SEV SNP spec is called virtual top of
> memory(vTOM). Memory addresses below vTOM are automatically treated as
> private while memory above vTOM is treated as shared. Using vTOM to
> separate memory in this way avoids the need to augment the standard x86
> page tables with C-bit markings, simplifying guest OS software.

Here is the spec link and vTOM description is in the page 14.
https://www.amd.com/system/files/TechDocs/SEV-SNP-strengthening-vm-isolation-with-integrity-protection-and-more.pdf

Thanks.


