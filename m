Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7061A73AE
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 08:29:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOF3Y-0000EX-VT; Tue, 14 Apr 2020 06:28:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t7Uy=56=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOF3W-0000EO-V4
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 06:28:22 +0000
X-Inumbo-ID: 22a86de4-7e19-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22a86de4-7e19-11ea-9e09-bc764e2007e4;
 Tue, 14 Apr 2020 06:28:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4E3A5AD75;
 Tue, 14 Apr 2020 06:28:19 +0000 (UTC)
Subject: Re: [PATCH v9 1/3] x86/tlb: introduce a flush HVM ASIDs flag
To: Wei Liu <wl@xen.org>
References: <20200406105703.79201-1-roger.pau@citrix.com>
 <20200406105703.79201-2-roger.pau@citrix.com>
 <30062a0c-6587-a16e-2b31-de0dd6bf4c9a@suse.com>
 <20200410154843.ocpl4gpqt5hsifba@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2e5b9e8e-f768-005f-5310-0cd4b9312461@suse.com>
Date: Tue, 14 Apr 2020 08:28:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200410154843.ocpl4gpqt5hsifba@debian>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10.04.2020 17:48, Wei Liu wrote:
> On Thu, Apr 09, 2020 at 01:54:40PM +0200, Jan Beulich wrote:
>> On 06.04.2020 12:57, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/mm/hap/private.h
>>> +++ b/xen/arch/x86/mm/hap/private.h
>>> @@ -47,4 +47,9 @@ unsigned long hap_p2m_ga_to_gfn_4_levels(struct vcpu *v,
>>>      struct p2m_domain *p2m, unsigned long cr3,
>>>      paddr_t ga, uint32_t *pfec, unsigned int *page_order);
>>>  
>>> +static inline void hap_flush_tlb_mask(const cpumask_t *mask)
>>> +{
>>> +    flush_mask(mask, FLUSH_HVM_ASID_CORE);
>>> +}
>>
>> With the above introduction of this would then become unnecessary.
> 
> I had planned to make the required adjustment(s) and commit v9 today.

Actually I came to make these comments in the course of preparing
to commit the series, while making the small adjustments.

Jan

