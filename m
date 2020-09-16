Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BEC26BFEA
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 10:55:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kITDt-0003To-AJ; Wed, 16 Sep 2020 08:55:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nCdG=CZ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kITDr-0003Tj-LJ
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 08:55:27 +0000
X-Inumbo-ID: 1078c431-ce49-4c1a-b590-37659e64e150
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1078c431-ce49-4c1a-b590-37659e64e150;
 Wed, 16 Sep 2020 08:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=kkwftA8uDOYml0bRkU+FbitaWCfshAwlDUHQAXRT6b0=; b=xuz3finRbmkeCsQtELl6SGZHSw
 6Fz1ptNc7Ou3Liz5mQbHYoaOjnEXR4gWGtwfOIs/n/HlcJydXVrPpoDbloyujYC0R4LtWEw1OM6WI
 DsPzPtktw1RxpfiRU0x75r3Ttc6gdTHJnF07i16ibyVt7Z9HKfwR1T/2L4YGtNU2VSFM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kITDm-0001Au-Vd; Wed, 16 Sep 2020 08:55:22 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kITDm-00022c-OE; Wed, 16 Sep 2020 08:55:22 +0000
Subject: Re: [PATCH V1 10/16] xen/mm: Handle properly reference in
 set_foreign_p2m_entry() on Arm
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org,
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
 <2560b3ad-bd22-af01-29a9-64a2733e568b@xen.org>
 <9d68bae6-455c-3def-b4f8-12bc25882929@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <62e56b1e-3a44-8563-84bc-31d39b9cf09f@xen.org>
Date: Wed, 16 Sep 2020 09:55:20 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <9d68bae6-455c-3def-b4f8-12bc25882929@suse.com>
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



On 16/09/2020 09:52, Jan Beulich wrote:
> On 16.09.2020 10:50, Julien Grall wrote:
>> On 16/09/2020 08:17, Jan Beulich wrote:
>>> On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
>>>>            for ( i = 0; !rc && i < xmar.nr_frames; i++ )
>>>>            {
>>>> -            rc = set_foreign_p2m_entry(currd, gfn_list[i],
>>>> +            rc = set_foreign_p2m_entry(currd, d, gfn_list[i],
>>>>                                           _mfn(mfn_list[i]));
>>>
>>> Is it going to lead to proper behavior when d == currd, specifically
>>> for Arm but also in the abstract model? If you expose this to other
>>> than Dom0, this case needs at least considering (and hence mentioning
>>> in the description of why it's safe to permit if you don't reject
>>> such attempts).
>>
>> This is already rejected by rcu_lock_remote_domain_by_id().
> 
> Oh, yes, I'm sorry for overlooking this.

That's fine, I also overlooked it when I originally wrote the code.

@oleksandr, it might be worth mentioning in the commit message and maybe 
in the code this subtlety.

Cheers,

-- 
Julien Grall

