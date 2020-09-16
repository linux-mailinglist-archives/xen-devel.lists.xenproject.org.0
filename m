Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C55426BFDF
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 10:53:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kITBN-0003Ld-TG; Wed, 16 Sep 2020 08:52:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kITBM-0003LY-Do
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 08:52:52 +0000
X-Inumbo-ID: 823e3f17-0fca-4571-9803-83dc39f69f6d
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 823e3f17-0fca-4571-9803-83dc39f69f6d;
 Wed, 16 Sep 2020 08:52:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 35D16B4FD;
 Wed, 16 Sep 2020 08:53:06 +0000 (UTC)
Subject: Re: [PATCH V1 10/16] xen/mm: Handle properly reference in
 set_foreign_p2m_entry() on Arm
To: Julien Grall <julien@xen.org>
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9d68bae6-455c-3def-b4f8-12bc25882929@suse.com>
Date: Wed, 16 Sep 2020 10:52:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2560b3ad-bd22-af01-29a9-64a2733e568b@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

On 16.09.2020 10:50, Julien Grall wrote:
> On 16/09/2020 08:17, Jan Beulich wrote:
>> On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
>>>           for ( i = 0; !rc && i < xmar.nr_frames; i++ )
>>>           {
>>> -            rc = set_foreign_p2m_entry(currd, gfn_list[i],
>>> +            rc = set_foreign_p2m_entry(currd, d, gfn_list[i],
>>>                                          _mfn(mfn_list[i]));
>>
>> Is it going to lead to proper behavior when d == currd, specifically
>> for Arm but also in the abstract model? If you expose this to other
>> than Dom0, this case needs at least considering (and hence mentioning
>> in the description of why it's safe to permit if you don't reject
>> such attempts).
> 
> This is already rejected by rcu_lock_remote_domain_by_id().

Oh, yes, I'm sorry for overlooking this.

Jan

