Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9951538DD2
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 11:36:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339385.564235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvyHv-0006hO-FV; Tue, 31 May 2022 09:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339385.564235; Tue, 31 May 2022 09:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvyHv-0006f8-CL; Tue, 31 May 2022 09:35:43 +0000
Received: by outflank-mailman (input) for mailman id 339385;
 Tue, 31 May 2022 09:35:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nvyHt-0006f2-Q7
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 09:35:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nvyHq-0008UQ-DG; Tue, 31 May 2022 09:35:38 +0000
Received: from [54.239.6.187] (helo=[192.168.31.167])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nvyHq-0001KV-6j; Tue, 31 May 2022 09:35:38 +0000
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
	bh=APC904ThHUPVDWQUcZPfNr6hS6iJvtg+do/fLTiG6lI=; b=gb1see10w5X1eXt+lDj4ybDZFg
	2j3PNbuK0pRAlBjA0Qy+QW2EvSzhuvhpSYGpimtKbkyZFiCqDoZHSqwius9lb1MlVrAr3Ws8xeMey
	FrCfSASAYd2l9TWjA6tFBEYtAJlfqDuCHqx2+L3linM32dbeINLMdgJKaqto6oPIjbVU=;
Message-ID: <776a312f-29a8-6bd9-1f4b-55be5d0f12bd@xen.org>
Date: Tue, 31 May 2022 10:35:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v5 9/9] xen: retrieve reserved pages on populate_physmap
To: Jan Beulich <jbeulich@suse.com>, Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220531031241.90374-1-Penny.Zheng@arm.com>
 <20220531031241.90374-10-Penny.Zheng@arm.com>
 <104c921e-68ad-209b-5b3d-797a58e47fbf@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <104c921e-68ad-209b-5b3d-797a58e47fbf@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 31/05/2022 09:54, Jan Beulich wrote:
> On 31.05.2022 05:12, Penny Zheng wrote:
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -245,6 +245,29 @@ static void populate_physmap(struct memop_args *a)
>>   
>>                   mfn = _mfn(gpfn);
>>               }
>> +            else if ( is_domain_using_staticmem(d) )
>> +            {
>> +                /*
>> +                 * No easy way to guarantee the retrieved pages are contiguous,
>> +                 * so forbid non-zero-order requests here.
>> +                 */
>> +                if ( a->extent_order != 0 )
>> +                {
>> +                    gdprintk(XENLOG_WARNING,
>> +                             "Cannot allocate static order-%u pages for static %pd\n",
>> +                             a->extent_order, d);
>> +                    goto out;
>> +                }
>> +
>> +                mfn = acquire_reserved_page(d, a->memflags);
>> +                if ( mfn_eq(mfn, INVALID_MFN) )
>> +                {
>> +                    gdprintk(XENLOG_WARNING,
>> +                             "%pd: failed to retrieve a reserved page\n",
>> +                             d);
>> +                    goto out;
>> +                }
>> +            }
> 
> I'm not convinced of having these gdprintk()s here. 

There are a number of time where I wished some error paths would contain 
debug printk(). Instead, I often end up to add them myself when I 
struggle to find the reason of a failure.

They are debug printk() and therefore there is no impact on the 
production build. So I would leave them around.

> The adjacent
> is_domain_direct_mapped() code is somewhat different - iirc only Dom0
> can be direct-mapped, and Dom0 having a problem can certainly be worth
> a log message.

There are plan to use direct-mapped domU.

Cheers,

-- 
Julien Grall

