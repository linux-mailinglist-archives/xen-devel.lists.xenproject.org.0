Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB5B539EB9
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 09:51:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340297.565303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwJ7t-0006Of-BJ; Wed, 01 Jun 2022 07:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340297.565303; Wed, 01 Jun 2022 07:50:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwJ7t-0006Lr-7r; Wed, 01 Jun 2022 07:50:45 +0000
Received: by outflank-mailman (input) for mailman id 340297;
 Wed, 01 Jun 2022 07:50:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nwJ7s-0006Ll-Li
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 07:50:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nwJ7r-0002zS-16; Wed, 01 Jun 2022 07:50:43 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nwJ7q-0007h4-RF; Wed, 01 Jun 2022 07:50:42 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=IfFrAyYPuJE6cW8okeWrsA1QDP8r9TxF5Sh+O6De3Wo=; b=dBhviJw79KoFepUMcC0ONCi/dh
	LjOSyNofHShPqns/+UaNV6tAgMZAVZra/G/cDfjRc5Li3Y4ZMrQfZMbhwvNFNqgE3ABAnMVyYOgi9
	pJZCBqxqWI+Cbyr/Z4Ui9nuwGDHZeaCAj9SNxBQopuSnE4Mduhk2CjQn0JvuwY+Qfih0=;
Message-ID: <5b7ccf0a-71d9-869c-aaac-2b10dd2b4d9f@xen.org>
Date: Wed, 1 Jun 2022 08:50:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [Xen-devel] SMMU permission fault on Dom0 when init vpu_decoder
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Peng Fan <peng.fan@nxp.com>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20220530152102.GA883104@EPUAKYIW015D>
 <da899c6a-a9ec-fa25-75ef-6f375dfd422a@xen.org>
 <alpine.DEB.2.22.394.2205311327330.1905099@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2205311327330.1905099@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 01/06/2022 00:13, Stefano Stabellini wrote:
>>> arm: Set p2m_type to p2m_mmio_direct_nc_x for reserved memory
>>> regions
>>>
>>> This is the enhancement of the 46b3dd3718144ca6ac2c12a3b106e57fb7156554.
>>> Those patch introduces p2m_mmio_direct_nc_x p2m type which sets the
>>> e->p2m.xn = 0 for the reserved-memory, such as vpu encoder/decoder.
>>>
>>> Set p2m_mmio_direct_nc_x in map_regions_p2mt for reserved-memory the
>>> same way it does in map_mmio_regions. This change is for the case
>>> when vpu encoder/decoder works in DomO and not passed-through to the
>>> Guest Domains.
>>>
>>> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>>> ---
>>>    xen/arch/arm/p2m.c | 7 +++++++
>>>    1 file changed, 7 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>>> index e9568dab88..bb1f681b71 100644
>>> --- a/xen/arch/arm/p2m.c
>>> +++ b/xen/arch/arm/p2m.c
>>> @@ -1333,6 +1333,13 @@ int map_regions_p2mt(struct domain *d,
>>>                         mfn_t mfn,
>>>                         p2m_type_t p2mt)
>>>    {
>>> +    if (((long)gfn_x(gfn) >= (GUEST_RAM0_BASE >> PAGE_SHIFT)) &&
>>> +        (((long)gfn_x(gfn) + nr) <=
>>> +        ((GUEST_RAM0_BASE + GUEST_RAM0_SIZE)>> PAGE_SHIFT)))
>>
>> I am afraid I don't understand what this check is for. In a normal setup, we
>> don't know where the reserved regions are mapped. Only the caller may know
>> that.
>>
>> For dom0, this decision could be taken in map_range_to_domain(). For the domU,
>> we would need to let the toolstack to chose the memory attribute.
> 
> I think the intent of the check is to recognize that map_regions_p2mt
> was called for a normal memory location and, if so, change the p2m type
> to p2m_mmio_direct_nc_x.

That would have made sense if it was for a domU. But AFAICT the intent 
is to address the problem for dom0.

Technically, GUEST_RAM0_BASE describes the RAM for the guest and not 
dom0. Maybe they are the same on his HW, but without more details I 
can't confirm that. And therefore...

> 
> As a downstream, the patch below is one of the easiest way to have a
> self-contained change to fix the problem described above.
... there are no way for me to tell whether this patch would still be 
fine for a downstream project.

Cheers,

[...]

-- 
Julien Grall

