Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1A88BE615
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 16:35:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718230.1120815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4LuP-00028p-D7; Tue, 07 May 2024 14:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718230.1120815; Tue, 07 May 2024 14:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4LuP-00026u-9o; Tue, 07 May 2024 14:35:09 +0000
Received: by outflank-mailman (input) for mailman id 718230;
 Tue, 07 May 2024 14:35:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s4LuO-00025M-0P
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 14:35:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s4LuL-0008MV-Fl; Tue, 07 May 2024 14:35:05 +0000
Received: from [15.248.2.31] (helo=[10.24.67.35])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s4LuL-0005cF-8R; Tue, 07 May 2024 14:35:05 +0000
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
	bh=EoKL+Z0kQgMFXQExJ9CRpDqJzIJUhs2/XE5rGxXj090=; b=GyYOJNT8QrlEuUqPnHygH4YZun
	Fn1MoLoDxVtkVjtcPjJJ3HDonRSpSiaOG1eW/Z0qxvu1uA/H+Zaa/r481RE9ObViASV3BxcRFN9PC
	sEFs5s9oSA/dqn1aCRIXjGqVIQtVY3heqVnxSgheL9mXJH42Dmp7FGPVcC1l2bXAw3Vg=;
Message-ID: <bca3098b-4f0b-48e1-8e21-51c66c63e4f3@xen.org>
Date: Tue, 7 May 2024 15:35:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/15] tools/libs/light: Increase nr_spi to 160
Content-Language: en-GB
To: Henry Wang <xin.wang2@amd.com>, Anthony PERARD
 <anthony.perard@cloud.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, Vikram Garhwal <fnu.vikram@xilinx.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-6-xin.wang2@amd.com>
 <334eb040-234f-4492-9006-9faadfe28c59@perard>
 <71fc7673-e968-487d-8478-1c7aabef708b@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <71fc7673-e968-487d-8478-1c7aabef708b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 06/05/2024 06:17, Henry Wang wrote:
> On 5/1/2024 9:58 PM, Anthony PERARD wrote:
>> On Wed, Apr 24, 2024 at 11:34:39AM +0800, Henry Wang wrote:
>>> Increase number of spi to 160 i.e. gic_number_lines() for Xilinx 
>>> ZynqMP - 32.
>>> This was done to allocate and assign IRQs to a running domain.
>>>
>>> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
>>> ---
>>>   tools/libs/light/libxl_arm.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>>> index dd5c9f4917..50dbd0f2a9 100644
>>> --- a/tools/libs/light/libxl_arm.c
>>> +++ b/tools/libs/light/libxl_arm.c
>>> @@ -181,7 +181,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>>>       LOG(DEBUG, "Configure the domain");
>>> -    config->arch.nr_spis = nr_spis;
>>> +    /* gic_number_lines() is 192 for Xilinx ZynqMP. min nr_spis = 
>>> 192 - 32. */
>>> +    config->arch.nr_spis = MAX(nr_spis, 160);
>> Is there a way that that Xen or libxl could find out what the minimum
>> number of SPI needs to be?
> 
> I am afraid currently there is none.
> 
>> Are we going to have to increase that minimum
>> number every time a new platform comes along?
>>
>> It doesn't appear that libxl is using that `nr_spis` value and it is
>> probably just given to Xen. So my guess is that Xen could simply take
>> care of the minimum value, gic_number_lines() seems to be a Xen
>> function.
> 
> Xen will take care of the value of nr_spis for dom0 in create_dom0()
> dom0_cfg.arch.nr_spis = min(gic_number_lines(), (unsigned int) 992) - 32;
> and also for dom0less domUs in create_domUs().
> 
> However, it looks like Xen will not take care of the mininum value for 
> libxl guests, the value from config->arch.nr_spis in guest config file 
> will be directly passed to the domain_vgic_init() function from 
> arch_domain_create().
> 
> I agree with you that we shouldn't just bump the number everytime when 
> we have a new platform. Therefore, would it be a good idea to move the 
> logic in this patch to arch_sanitise_domain_config()?

Xen domains are supposed to be platform agnostics and therefore the 
numbers of SPIs should not be based on the HW.

Furthermore, with your proposal we would end up to allocate data 
structure for N SPIs when a domain may never needs any SPIs (such as if 
passthrough is not in-use). This is more likely for domain created by 
the toolstack than from Xen directly.

Instead, we should introduce a new XL configuration to let the user 
decide the number of SPIs. I would suggest to name "nr_spis" to match 
the DT bindings.

Cheers,

-- 
Julien Grall

