Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EA21BC8FA
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 20:39:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTV71-0007la-SI; Tue, 28 Apr 2020 18:37:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nCd5=6M=oracle.com=joe.jin@srs-us1.protection.inumbo.net>)
 id 1jTV70-0007lV-Te
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 18:37:42 +0000
X-Inumbo-ID: 57f964fa-897f-11ea-9887-bc764e2007e4
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57f964fa-897f-11ea-9887-bc764e2007e4;
 Tue, 28 Apr 2020 18:37:42 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03SIZxks071067;
 Tue, 28 Apr 2020 18:37:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=74BgaBiqTi1MFfdeF1NQG8LUiYgFzHAykVzSoYx6QBg=;
 b=yCx7580ve6ar3ZE9++qy042uW6rV/MJ7ZA6jH372uOrQnI/ynkqq5kpzKX9q1nMQjGA4
 1/J0DvI0bTa87AxpD4bFmQXx9l1ny95pcnxYwE+MqQ/af+URHBHXVif0EyPgypBXrqJN
 HCrs325cPsfx0lzMQZHwZO7ZbtnBQJOhp+BPgthX7abDl5jbWxINARX8OXW66hAf/sWi
 zjww8/j3mcP14IY0op6WGYB17RPfaHZ7IRrT5ZsIpR7hn2jJiXXW4yQWiTz21fDLs4Bd
 /apyl5GHq8msghEv+Hycd9JlPE2tTwL/P8EYKyNLJUY5Ve0XPtCBSDjIgm+vZ/tzZECJ 1g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 30p01nr8kb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Apr 2020 18:37:39 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03SIWCwQ019256;
 Tue, 28 Apr 2020 18:37:39 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 30mxx0fanf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Apr 2020 18:37:39 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03SIbbGw026927;
 Tue, 28 Apr 2020 18:37:37 GMT
Received: from [10.159.229.42] (/10.159.229.42)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 28 Apr 2020 11:37:37 -0700
Subject: Re: [PATCH] xen/swiotlb: correct the check for
 xen_destroy_contiguous_region
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <1588059225-11245-1-git-send-email-peng.fan@nxp.com>
 <1c01e97a-adcd-a703-55b5-8975b4ce4d2c@suse.com>
 <DB6PR0402MB2760A05135338B0CBB28123488AC0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <dba804ea-4268-24ff-7447-ddef00e9e20c@suse.com>
 <20200428172514.GA24178@char.us.oracle.com>
From: Joe Jin <joe.jin@oracle.com>
Message-ID: <bbd41468-9d58-0ff9-3c31-ff53dbe375af@oracle.com>
Date: Tue, 28 Apr 2020 11:37:35 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428172514.GA24178@char.us.oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9605
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 bulkscore=0
 suspectscore=2 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004280146
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9605
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 clxscore=1011
 phishscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501 mlxscore=0
 suspectscore=2 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004280146
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
Cc: Peng Fan <peng.fan@nxp.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 4/28/20 10:25 AM, Konrad Rzeszutek Wilk wrote:
> On Tue, Apr 28, 2020 at 12:19:41PM +0200, Jürgen Groß wrote:
>> On 28.04.20 10:25, Peng Fan wrote:
> 
> Adding Joe Jin.
> 
> Joe, didn't you have some ideas on how this could be implemented?
> 
>>>> Subject: Re: [PATCH] xen/swiotlb: correct the check for
>>>> xen_destroy_contiguous_region
>>>>
>>>> On 28.04.20 09:33, peng.fan@nxp.com wrote:
>>>>> From: Peng Fan <peng.fan@nxp.com>
>>>>>
>>>>> When booting xen on i.MX8QM, met:
>>>>> "
>>>>> [    3.602128] Unable to handle kernel paging request at virtual address
>>>> 0000000000272d40
>>>>> [    3.610804] Mem abort info:
>>>>> [    3.613905]   ESR = 0x96000004
>>>>> [    3.617332]   EC = 0x25: DABT (current EL), IL = 32 bits
>>>>> [    3.623211]   SET = 0, FnV = 0
>>>>> [    3.626628]   EA = 0, S1PTW = 0
>>>>> [    3.630128] Data abort info:
>>>>> [    3.633362]   ISV = 0, ISS = 0x00000004
>>>>> [    3.637630]   CM = 0, WnR = 0
>>>>> [    3.640955] [0000000000272d40] user address but active_mm is
>>>> swapper
>>>>> [    3.647983] Internal error: Oops: 96000004 [#1] PREEMPT SMP
>>>>> [    3.654137] Modules linked in:
>>>>> [    3.677285] Hardware name: Freescale i.MX8QM MEK (DT)
>>>>> [    3.677302] Workqueue: events deferred_probe_work_func
>>>>> [    3.684253] imx6q-pcie 5f000000.pcie: PCI host bridge to bus 0000:00
>>>>> [    3.688297] pstate: 60000005 (nZCv daif -PAN -UAO)
>>>>> [    3.688310] pc : xen_swiotlb_free_coherent+0x180/0x1c0
>>>>> [    3.693993] pci_bus 0000:00: root bus resource [bus 00-ff]
>>>>> [    3.701002] lr : xen_swiotlb_free_coherent+0x44/0x1c0
>>>>> "
>>>>>
>>>>> In xen_swiotlb_alloc_coherent, if !(dev_addr + size - 1 <= dma_mask)
>>>>> or range_straddles_page_boundary(phys, size) are true, it will create
>>>>> contiguous region. So when free, we need to free contiguous region use
>>>>> upper check condition.
>>>>
>>>> No, this will break PV guests on x86.
>>>
>>> Could you share more details why alloc and free not matching for the check?
>>
>> xen_create_contiguous_region() is needed only in case:
>>
>> - the bus address is not within dma_mask, or
>> - the memory region is not physically contiguous (can happen only for
>>   PV guests)
>>
>> In any case it should arrange for the memory to be suitable for the
>> DMA operation, so to be contiguous and within dma_mask afterwards. So
>> xen_destroy_contiguous_region() should only ever called for areas
>> which match above criteria, as otherwise we can be sure
>> xen_create_contiguous_region() was not used for making the area DMA-able
>> in the beginning.

I agreed with Juergen's explanation, That is my understanding.

Peng, if panic caused by (dev_addr + size - 1 > dma_mask), you should check
how you get the addr, if memory created by xen_create_contiguous_region(),
memory must be with in [0 - dma_mask].

Thanks,
Joe

>>
>> And this is very important in the PV case, as in those guests the page
>> tables are containing the host-PFNs, not the guest-PFNS, and
>> xen_create_contiguous_region() will fiddle with host- vs. guest-PFN
>> arrangements, and xen_destroy_contiguous_region() is reverting this
>> fiddling. Any call of xen_destroy_contiguous_region() for an area it
>> was not intended to be called for might swap physical pages beneath
>> random virtual addresses, which was the reason for this test to be
>> added by me.
>>
>>
>> Juergen
>>
>>>
>>> Thanks,
>>> Peng.
>>>
>>>>
>>>> I think there is something wrong with your setup in combination with the ARM
>>>> xen_create_contiguous_region() implementation.
>>>>
>>>> Stefano?
>>>>
>>>>
>>>> Juergen
>>>>
>>>>>
>>>>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>>>>> ---
>>>>>    drivers/xen/swiotlb-xen.c | 4 ++--
>>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
>>>>> index b6d27762c6f8..ab96e468584f 100644
>>>>> --- a/drivers/xen/swiotlb-xen.c
>>>>> +++ b/drivers/xen/swiotlb-xen.c
>>>>> @@ -346,8 +346,8 @@ xen_swiotlb_free_coherent(struct device *hwdev,
>>>> size_t size, void *vaddr,
>>>>>    	/* Convert the size to actually allocated. */
>>>>>    	size = 1UL << (order + XEN_PAGE_SHIFT);
>>>>>
>>>>> -	if (!WARN_ON((dev_addr + size - 1 > dma_mask) ||
>>>>> -		     range_straddles_page_boundary(phys, size)) &&
>>>>> +	if (((dev_addr + size - 1 > dma_mask) ||
>>>>> +	    range_straddles_page_boundary(phys, size)) &&
>>>>>    	    TestClearPageXenRemapped(virt_to_page(vaddr)))
>>>>>    		xen_destroy_contiguous_region(phys, order);
>>>>>
>>>>>
>>>
>>


