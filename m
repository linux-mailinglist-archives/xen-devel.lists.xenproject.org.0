Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB9F215408
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 10:32:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsMXW-0002Ux-23; Mon, 06 Jul 2020 08:31:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dTkW=AR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jsMXU-0002Ug-P2
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 08:31:48 +0000
X-Inumbo-ID: 1f94e71e-bf63-11ea-8c4b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f94e71e-bf63-11ea-8c4b-12813bfff9fa;
 Mon, 06 Jul 2020 08:31:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F3322AD5D;
 Mon,  6 Jul 2020 08:31:43 +0000 (UTC)
Subject: Re: [PATCH v5 06/11] x86/hvm: processor trace interface in HVM
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <cover.1593974333.git.michal.leszczynski@cert.pl>
 <cover.1593974333.git.michal.leszczynski@cert.pl>
 <a4833c8168e287f0caf1dc6f16ec5c054bd88b0a.1593974333.git.michal.leszczynski@cert.pl>
 <762195600.19745364.1593976285067.JavaMail.zimbra@cert.pl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8685426c-0b79-e967-dfce-e9d2e7d21401@suse.com>
Date: Mon, 6 Jul 2020 10:31:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <762195600.19745364.1593976285067.JavaMail.zimbra@cert.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 tamas lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei kang <luwei.kang@intel.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05.07.2020 21:11, Michał Leszczyński wrote:
> ----- 5 lip 2020 o 20:54, Michał Leszczyński michal.leszczynski@cert.pl napisał(a):
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -2199,6 +2199,25 @@ int domain_relinquish_resources(struct domain *d)
>>                 altp2m_vcpu_disable_ve(v);
>>         }
>>
>> +        for_each_vcpu ( d, v )
>> +        {
>> +            unsigned int i;
>> +
>> +            if ( !v->vmtrace.pt_buf )
>> +                continue;
>> +
>> +            for ( i = 0; i < (v->domain->vmtrace_pt_size >> PAGE_SHIFT); i++ )
>> +            {
>> +                struct page_info *pg = mfn_to_page(
>> +                    mfn_add(page_to_mfn(v->vmtrace.pt_buf), i));
>> +                if ( (pg->count_info & PGC_count_mask) != 1 )
>> +                    return -EBUSY;
>> +            }
>> +
>> +            free_domheap_pages(v->vmtrace.pt_buf,
>> +                get_order_from_bytes(v->domain->vmtrace_pt_size));
> 
> 
> While this works, I don't feel that this is a good solution with this loop
> returning -EBUSY here. I would like to kindly ask for suggestions regarding
> this topic.

I'm sorry to ask, but with the previously give suggestions to mirror
existing code, why do you still need to play with this function? You
really shouldn't have a need to, just like e.g. the ioreq server page
handling code didn't.

Jan

