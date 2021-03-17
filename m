Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E01F133EF9D
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 12:32:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98658.187236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMUPO-0003V8-Km; Wed, 17 Mar 2021 11:32:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98658.187236; Wed, 17 Mar 2021 11:32:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMUPO-0003Uj-HK; Wed, 17 Mar 2021 11:32:14 +0000
Received: by outflank-mailman (input) for mailman id 98658;
 Wed, 17 Mar 2021 11:32:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lMUPN-0003Ue-Fz
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 11:32:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMUPM-0004rt-SH; Wed, 17 Mar 2021 11:32:12 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMUPM-00086c-IP; Wed, 17 Mar 2021 11:32:12 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=OOmcNHKjT72WKKW0QAtzb5FxL86wcFMAHxWNXS5v4Fg=; b=Tq53AUQsO9npujsXcYiw6gluzx
	/QZYsUIc8LT0sNPK4bVipDAdbcTf9IO4m+v4IWSqku8wh5jk6JKdezc2qv5ZdTou8OIs0DHbO/qV7
	w2QW7DjsFhiHOaegZGiiCVHObNwvKjXT64DT34+ZwFtnI5kr/Q20crWw+ldYT/BRp+GU=;
Subject: Re: [PATCH v3] xen: introduce XENFEAT_direct_mapped and
 XENFEAT_not_direct_mapped
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, Bertrand.Marquis@arm.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 xen-devel@lists.xenproject.org
References: <20210312231632.5666-1-sstabellini@kernel.org>
 <0e35a613-fd93-0805-10b9-5ecee73bb15d@suse.com>
 <alpine.DEB.2.21.2103151259550.5325@sstabellini-ThinkPad-T480s>
 <48a7ea93-06b4-21f1-5db2-0104058a2446@suse.com>
 <alpine.DEB.2.21.2103161704040.439@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <d7b921f6-f263-8dea-6bd2-920c5b58fa8f@xen.org>
Date: Wed, 17 Mar 2021 11:32:10 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2103161704040.439@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 17/03/2021 00:04, Stefano Stabellini wrote:
> On Tue, 16 Mar 2021, Jan Beulich wrote:
>> On 15.03.2021 21:01, Stefano Stabellini wrote:
>>> On Mon, 15 Mar 2021, Jan Beulich wrote:
>>>> On 13.03.2021 00:16, Stefano Stabellini wrote:
>>>>> Introduce two feature flags to tell the domain whether it is
>>>>> direct-mapped or not. It allows the guest kernel to make informed
>>>>> decisions on things such as swiotlb-xen enablement.
>>>>>
>>>>> The introduction of both flags (XENFEAT_direct_mapped and
>>>>> XENFEAT_not_direct_mapped) allows the guest kernel to avoid any
>>>>> guesswork if one of the two is present, or fallback to the current
>>>>> checks if neither of them is present.
>>>>>
>>>>> XENFEAT_direct_mapped is always set for not auto-translated guests.
>>>>>
>>>>> For auto-translated guests, only Dom0 on ARM is direct-mapped. Also,
>>>>> see is_domain_direct_mapped() which refers to auto-translated guests:
>>>>> xen/include/asm-arm/domain.h:is_domain_direct_mapped
>>>>> xen/include/asm-x86/domain.h:is_domain_direct_mapped
>>>>>
>>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>>>> CC: jbeulich@suse.com
>>>>> CC: andrew.cooper3@citrix.com
>>>>> CC: julien@xen.org
>>>>
>>>> Any particular reason my previously given R-b isn't here?
>>>
>>> I reworded part of the comment in the public header, and I decided to
>>> err on the side of caution and not add your R-b given this change
>>> compared to the previous version.
>>
>> I see. FAOD, despite me not being overly happy with the "older
>> Xen assumptions" part of the comment, feel free to add it back.
> 
> Thank you!
> 
> Julien, please go ahead and commit it to your for-next/4.16 branch when
> it is convenient.

I have committed it to my for-next/4.16 branch. I will merge the branch 
after the tree has re-opened.

Cheers,

-- 
Julien Grall

