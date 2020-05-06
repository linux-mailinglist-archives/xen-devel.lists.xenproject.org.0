Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D65061C7813
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 19:36:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWNxf-0007dv-23; Wed, 06 May 2020 17:35:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U6FA=6U=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1jWNxd-0007di-Jt
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 17:35:57 +0000
X-Inumbo-ID: 0a97fb62-8fc0-11ea-ae69-bc764e2007e4
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a97fb62-8fc0-11ea-ae69-bc764e2007e4;
 Wed, 06 May 2020 17:35:56 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 046HXi8s081802;
 Wed, 6 May 2020 17:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=FIwZ3rzBCAfZY5z+8UcntK8KqaM2MzbinvvrYfNtQlo=;
 b=hBB0lWSd2/EeLg2syIL++TEafHWUJvuKc78kZDvjD+T/e+UTFB1lDXU58iJ8Yaz1c/cw
 xH3JQWYF7MZZSE5CqAl85PAePJou8L42NeTkRCPeG8NhcnVmfl5/7XEH8DpbHLFvyuy5
 IIw3j1m/7WSdxcTAIAO8EHV5XHMJyrqOGlk16XyB6zc85Ol8MI0PSmFW1szGxop8MupM
 uBtch6ZO9YoCXJx29v89IR1jWG/F8HfnfNih2lsieedvsXVZh6c3ucDx1KYpzeK2kS9W
 qYB3S8jq5blnjEw9KovxY7UihChZRyJHrn+rtJE/ANKb0qOZejD/QmlJnmwfdsaG8psh wQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 30s1gnbmfn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 May 2020 17:35:36 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 046HZYHM090814;
 Wed, 6 May 2020 17:35:35 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 30sjnk55v4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 May 2020 17:35:35 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 046HZLwX031315;
 Wed, 6 May 2020 17:35:22 GMT
Received: from [10.39.253.250] (/10.39.253.250)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 06 May 2020 10:35:21 -0700
Subject: Re: Troubles running Xen on Raspberry Pi 4 with 5.6.1 DomU
To: Nataliya Korovkina <malus.brandywine@gmail.com>
References: <CAMmSBy_A4xJmCo-PiWukv0+vkEhXXDpYwZAKAiJ=mmpuY1CbMA@mail.gmail.com>
 <20200501114201.GE9902@minyard.net>
 <CAMmSBy_h9=5cjMv3+-BKHYhBikgna731DoA+t-8FK-2tbPUH-A@mail.gmail.com>
 <20200502021647.GG9902@minyard.net>
 <4f6ef562-e213-8952-66d6-0f083bf8c593@xen.org>
 <20200502173529.GH9902@minyard.net>
 <ed02b555-dbaa-2ebf-d09f-0474e1a7a745@xen.org>
 <20200504124453.GI9902@minyard.net>
 <CAMmSBy-w1HOyGGCjB_nJcn2xw+4sNdDrtJ8PC3foaxJOtdRmnQ@mail.gmail.com>
 <alpine.DEB.2.21.2005042004500.14706@sstabellini-ThinkPad-T480s>
 <CAMmSBy-yymEGQcuUBHZi-tL9ra7x9nDv+ms8SLiZr1H=BpHUiQ@mail.gmail.com>
 <alpine.DEB.2.21.2005051508180.14706@sstabellini-ThinkPad-T480s>
 <9ee0fb6f-98df-d993-c42e-f47270bf2eaa@suse.com>
 <DB6PR0402MB2760AF88FE7E3DF47401BE5988A40@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <CADz_WD5Ln7Pe1WAFp73d2Mz9wxspzTE3WgAJusp5S8LX4=83Bw@mail.gmail.com>
 <2187cd7c-4d48-986b-77d6-4428e8178404@oracle.com>
 <CADz_WD68bYj-0CSm_zib+LRiMGd1+1eoNLgiJj=vHog685Khsw@mail.gmail.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Autocrypt: addr=boris.ostrovsky@oracle.com; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <a802a0d5-3ae3-97f5-af58-2e58123fec22@oracle.com>
Date: Wed, 6 May 2020 13:35:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CADz_WD68bYj-0CSm_zib+LRiMGd1+1eoNLgiJj=vHog685Khsw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9613
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=2
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005060142
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9613
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=2 mlxscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005060142
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, "minyard@acm.org" <minyard@acm.org>,
 Roman Shaposhnik <roman@zededa.com>,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 5/6/20 12:14 PM, Nataliya Korovkina wrote:
> On Wed, May 6, 2020 at 9:43 AM Boris Ostrovsky
> <boris.ostrovsky@oracle.com> wrote:
>>
>> On 5/6/20 9:08 AM, Nataliya Korovkina wrote:
>>> Hello,
>>>
>>> What I found out: rpi_firmware_property_list() allocates memory from
>>> dma_atomic_pool which was mapped to VMALLOC region, so virt_to_page()
>>> is not eligible in this case.
>>
>> So then it seems it didn't go through xen_swiotlb_alloc_coherent(). In
>> which case it has no business calling xen_swiotlb_free_coherent().
>>
>>
>> -boris
>>
>>
>>
>>
> It does go.
> dma_alloc_coherent() indirectly calls xen_swiotlb_alloc_coherent(),
> then  xen_alloc_coherent_pages() eventually calls arch_dma_alloc() in
> remap.c which successfully allocates pages from atomic pool.


Yes, I was looking at x86's implementation of xen_alloc_coherent_pages().


>
> The patch Julien offered for domian_build.c moved Dom0 banks in the
> first G of RAM.
> So it covered the previous symptom (a crash during allocation) because
> now we avoid pathway  when we mark a page "XenMapped".
>
> But the symptom still remains in xen_swiotlb_free_coherent() because
> "TestPage..." is called unconditionally. virt_to_page() is not
> applicable to such allocations.


Perhaps we just need to make sure we are using right virt-to-page
method. Something like


diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index b6d2776..f224e69 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -335,6 +335,7 @@ int __ref xen_swiotlb_init(int verbose, bool early)
        int order = get_order(size);
        phys_addr_t phys;
        u64 dma_mask = DMA_BIT_MASK(32);
+       struct page *pg;
 
        if (hwdev && hwdev->coherent_dma_mask)
                dma_mask = hwdev->coherent_dma_mask;
@@ -346,9 +347,12 @@ int __ref xen_swiotlb_init(int verbose, bool early)
        /* Convert the size to actually allocated. */
        size = 1UL << (order + XEN_PAGE_SHIFT);
 
+       pg = is_vmalloc_addr(vaddr) ? vmalloc_to_page(vaddr) :
virt_to_page(vaddr);
+       BUG_ON(!pg);
+
        if (!WARN_ON((dev_addr + size - 1 > dma_mask) ||
                     range_straddles_page_boundary(phys, size)) &&
-           TestClearPageXenRemapped(virt_to_page(vaddr)))
+           TestClearPageXenRemapped(pg))
                xen_destroy_contiguous_region(phys, order);
 
        xen_free_coherent_pages(hwdev, size, vaddr, (dma_addr_t)phys,
attrs);


(I have not tested this at all)


