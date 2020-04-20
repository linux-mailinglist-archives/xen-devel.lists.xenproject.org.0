Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFE11B0611
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 11:57:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQTAr-0005iw-Pr; Mon, 20 Apr 2020 09:57:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JPG3=6E=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jQTAp-0005ip-Qo
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 09:57:07 +0000
X-Inumbo-ID: 4b5e4294-82ed-11ea-9042-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b5e4294-82ed-11ea-9042-12813bfff9fa;
 Mon, 20 Apr 2020 09:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nObpbmf80etLb5MlD1R+jvWn83wNDWDnU20N1scz+Yk=; b=TUTgAfpBdEzA+qDSIux6qTjYhX
 ehtHRvJeygTWUNhnOIov7amNYfW5pcL57q5B3TEC/E3cD7Tr9xlC68FnaKMWYhnoYryu+Gr5jUaQx
 ijv+ct908IzQF7SDsGmHuvQ+P5OWDd1RlA3cg9jmwGzWUHFBvAQ4y+nOBXpL+iQ0UG/Q=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQTAn-0000tX-Tq; Mon, 20 Apr 2020 09:57:05 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQTAn-0001IL-LV; Mon, 20 Apr 2020 09:57:05 +0000
Subject: Re: [PATCH 6/6] x86/mem-paging: consistently use gfn_t
To: Jan Beulich <jbeulich@suse.com>
References: <3b7cc69d-709c-570a-716a-c45f6fda181f@suse.com>
 <224337b8-98b4-b0f6-a57a-6f508ffa6838@suse.com>
 <66d56fc4-11a3-6c43-5fbd-ef7039fd06f8@xen.org>
 <cc56ee19-4bec-80f9-e200-39c716122ed8@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8a58a2d1-e72b-1f88-e5a5-cf168f42c783@xen.org>
Date: Mon, 20 Apr 2020 10:57:03 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <cc56ee19-4bec-80f9-e200-39c716122ed8@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 20/04/2020 07:03, Jan Beulich wrote:
> On 18.04.2020 13:14, Julien Grall wrote:
>> On 16/04/2020 16:48, Jan Beulich wrote:
>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -2151,16 +2151,17 @@ static int mod_l1_entry(l1_pgentry_t *pl
>>>                 paging_mode_translate(pg_dom) )
>>>            {
>>>                p2m_type_t p2mt;
>>> +            unsigned long gfn = l1e_get_pfn(nl1e);
>>
>> How about making gfn a gfn_t directly? This would avoid code churn when...
>>
>>>                p2m_query_t q = l1e_get_flags(nl1e) & _PAGE_RW ?
>>>                                P2M_ALLOC | P2M_UNSHARE : P2M_ALLOC;
>>>    -            page = get_page_from_gfn(pg_dom, l1e_get_pfn(nl1e), &p2mt, q);
>>> +            page = get_page_from_gfn(pg_dom, gfn, &p2mt, q);
>>
>> ... I am going to convert get_page_from_gfn() to use typesafe gfn. See [1].
> 
> Ah, yes, I can certainly do so.
> 
>>> @@ -89,16 +88,15 @@ void p2m_mem_paging_drop_page(struct dom
>>>     * already sent to the pager. In this case the caller has to try again until the
>>>     * gfn is fully paged in again.
>>>     */
>>> -void p2m_mem_paging_populate(struct domain *d, unsigned long gfn_l)
>>> +void p2m_mem_paging_populate(struct domain *d, gfn_t gfn)
>>>    {
>>>        struct vcpu *v = current;
>>>        vm_event_request_t req = {
>>>            .reason = VM_EVENT_REASON_MEM_PAGING,
>>> -        .u.mem_paging.gfn = gfn_l
>>> +        .u.mem_paging.gfn = gfn_x(gfn)
>>>        };
>>>        p2m_type_t p2mt;
>>>        p2m_access_t a;
>>> -    gfn_t gfn = _gfn(gfn_l);
>>>        mfn_t mfn;
>>>        struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>>        int rc = vm_event_claim_slot(d, d->vm_event_paging);
>>> @@ -107,7 +105,7 @@ void p2m_mem_paging_populate(struct doma
>>>        if ( rc == -EOPNOTSUPP )
>>>        {
>>>            gdprintk(XENLOG_ERR, "Dom%d paging gfn %lx yet no ring in place\n",
>>> -                 d->domain_id, gfn_l);
>>> +                 d->domain_id, gfn_x(gfn));
>>
>> Please use PRI_gfn in the format string to match the argument change.
> 
> I can do this, but iirc in one of my replies to one of your changes
> I've indicated I'm not fully convinced of such changes.

I guess you are referring to [2]. The discussion was quite different, we 
were arguing whether PRI_mfn could be used for other value than 
mfn_x(mfn). But then you said you were happy with PRI_xen_pfn.

Aside the return type of gfn_x(gfn) argument, if we use %PRI_gfn then we 
can finally have a consistent way to print a GFN and easily change it.

> 
>> [1] https://lore.kernel.org/xen-devel/20200322161418.31606-18-julien@xen.org/
> 
> Looking over this I notice (only now) that this patch is not
> consistent with its dropping of # in PRI_[gm]fn uses: You
> don't drop them in e.g. Viridian's enable_hypercall_page(),
> but you do in e.g. guest_wrmsr_xen(). Dropping is The Right
> Thing To Do (tm), so please do so uniformly.

Ok.

Cheers,

[2] <2be87441-05a6-6b58-23e3-da467230ffe7@xen.org>

> 
> Jan
> 

-- 
Julien Grall

