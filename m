Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4C226BFD4
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 10:51:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIT9g-0003AL-Gb; Wed, 16 Sep 2020 08:51:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nCdG=CZ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kIT9e-0003A8-SV
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 08:51:06 +0000
X-Inumbo-ID: 3350f9f6-14e5-408a-a635-a9be7de7e715
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3350f9f6-14e5-408a-a635-a9be7de7e715;
 Wed, 16 Sep 2020 08:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=kRKY8trnsPGhMWlZSDCLZjii/2IGM183feJJaU8dObE=; b=HPhYovomdFpKZd3d/7EIeYZ6Ny
 +h9vBxudr1WcE1caiQ+2+SOAzOudaPQba4qiXMuylBMo1kLqSHitdA8QJlQTxJqTQo378A5v4OZ1w
 dAxpqblvFtSaj999MI/VqNAvR2oP1DXMtoi1QTjfXj3DUU2qKxMT0XdB3uK0rvkdH2UU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kIT9b-00014i-5G; Wed, 16 Sep 2020 08:51:03 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kIT9a-0001i2-TA; Wed, 16 Sep 2020 08:51:03 +0000
Subject: Re: [PATCH V1 10/16] xen/mm: Handle properly reference in
 set_foreign_p2m_entry() on Arm
To: Jan Beulich <jbeulich@suse.com>, Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-11-git-send-email-olekstysh@gmail.com>
 <110c648d-581c-fd42-5180-7d32653227af@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2560b3ad-bd22-af01-29a9-64a2733e568b@xen.org>
Date: Wed, 16 Sep 2020 09:50:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <110c648d-581c-fd42-5180-7d32653227af@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 16/09/2020 08:17, Jan Beulich wrote:
> On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -1155,6 +1155,7 @@ static int acquire_resource(
>>           xen_pfn_t gfn_list[ARRAY_SIZE(mfn_list)];
>>           unsigned int i;
>>   
>> +#ifndef CONFIG_ARM
>>           /*
>>            * FIXME: Until foreign pages inserted into the P2M are properly
>>            *        reference counted, it is unsafe to allow mapping of
>> @@ -1162,13 +1163,14 @@ static int acquire_resource(
>>            */
>>           if ( !is_hardware_domain(currd) )
>>               return -EACCES;
>> +#endif
> 
> Instead of #ifdef, may I ask that a predicate like arch_refcounts_p2m()
> be used?

+1

> 
>>           if ( copy_from_guest(gfn_list, xmar.frame_list, xmar.nr_frames) )
>>               rc = -EFAULT;
>>   
>>           for ( i = 0; !rc && i < xmar.nr_frames; i++ )
>>           {
>> -            rc = set_foreign_p2m_entry(currd, gfn_list[i],
>> +            rc = set_foreign_p2m_entry(currd, d, gfn_list[i],
>>                                          _mfn(mfn_list[i]));
> 
> Is it going to lead to proper behavior when d == currd, specifically
> for Arm but also in the abstract model? If you expose this to other
> than Dom0, this case needs at least considering (and hence mentioning
> in the description of why it's safe to permit if you don't reject
> such attempts).

This is already rejected by rcu_lock_remote_domain_by_id().

> Personally I'd view it as wrong to use
> p2m_map_foreign_rw in this case, even in the event that it can be
> shown that nothing breaks in such a case. But I'm open to be
> convinced of the opposite.

I would agree that p2m_map_foreign_rw would be wrong to use when currd 
== d. But this cannot happen, so I think p2m_map_foreign_rw is the 
proper type.

Cheers,

-- 
Julien Grall

