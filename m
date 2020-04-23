Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6311B560C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 09:41:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRWTl-000296-IW; Thu, 23 Apr 2020 07:41:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0dw1=6H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jRWTj-000291-Sq
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 07:40:59 +0000
X-Inumbo-ID: c5ed097e-8535-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5ed097e-8535-11ea-b58d-bc764e2007e4;
 Thu, 23 Apr 2020 07:40:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AAE9CAF17;
 Thu, 23 Apr 2020 07:40:57 +0000 (UTC)
Subject: Re: [PATCH v10 1/3] x86/tlb: introduce a flush HVM ASIDs flag
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200416135909.16155-1-roger.pau@citrix.com>
 <20200416135909.16155-2-roger.pau@citrix.com>
 <20200422163338.GF28601@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <31d31516-cffc-8cba-deb6-1e6b49ab9680@suse.com>
Date: Thu, 23 Apr 2020 09:40:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422163338.GF28601@Air-de-Roger>
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
Cc: xen-devel@lists.xenproject.org, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.04.2020 18:33, Roger Pau Monné wrote:
> On Thu, Apr 16, 2020 at 03:59:07PM +0200, Roger Pau Monne wrote:
>> @@ -254,3 +257,14 @@ unsigned int flush_area_local(const void *va, unsigned int flags)
>>  
>>      return flags;
>>  }
>> +
>> +void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask)
>> +{
>> +    unsigned int flags = (is_pv_domain(d) || paging_mode_shadow(d) ? FLUSH_TLB
>> +                                                                   : 0) |
>> +                         (is_hvm_domain(d) && cpu_has_svm ? FLUSH_HVM_ASID_CORE
>> +                                                          : 0);
> 
> Maybe I'm getting confused, but I think the above is wrong and ASID
> should _always_ be flushed when running a HVM domain in shadow mode
> regardless of whether the underlying hw is Intel or AMD, ie:
> 
> bool shadow = paging_mode_shadow(d);
> unsigned int flags = (shadow ? FLUSH_TLB : 0) |
>                      (is_hvm_domain(d) &&
>                       (cpu_has_svm || shadow) ? FLUSH_HVM_ASID_CORE : 0);
> 
> Is the correct version.

Oh, indeed.

Jan

