Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD8319A6C2
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 10:01:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJYGn-0004NL-TT; Wed, 01 Apr 2020 07:58:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1qDs=5R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJYGm-0004NE-Ad
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 07:58:40 +0000
X-Inumbo-ID: 986740bc-73ee-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 986740bc-73ee-11ea-b4f4-bc764e2007e4;
 Wed, 01 Apr 2020 07:58:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D4037AFBE;
 Wed,  1 Apr 2020 07:58:37 +0000 (UTC)
Subject: Re: [PATCH v8 1/3] x86/tlb: introduce a flush HVM ASIDs flag
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200320184240.41769-1-roger.pau@citrix.com>
 <20200320184240.41769-2-roger.pau@citrix.com>
 <ee1587a0-7a6c-a1f9-860e-ea93a05d8462@suse.com>
 <20200331164500.GT28601@Air-de-Roger>
 <3a8ee855-7659-2a97-bab0-d0e43b171adf@suse.com>
 <20200401071526.GU28601@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6e07af26-b5fb-3a24-4eb7-bc6e409694cc@suse.com>
Date: Wed, 1 Apr 2020 09:58:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200401071526.GU28601@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: xen-devel@lists.xenproject.org, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 01.04.2020 09:15, Roger Pau Monné wrote:
> On Wed, Apr 01, 2020 at 08:34:23AM +0200, Jan Beulich wrote:
>> On 31.03.2020 18:45, Roger Pau Monné wrote:
>>> On Tue, Mar 31, 2020 at 05:40:59PM +0200, Jan Beulich wrote:
>>>> On 20.03.2020 19:42, Roger Pau Monne wrote:
>>>>> @@ -993,7 +993,7 @@ static void shadow_blow_tables(struct domain *d)
>>>>>                                 pagetable_get_mfn(v->arch.shadow_table[i]), 0);
>>>>>  
>>>>>      /* Make sure everyone sees the unshadowings */
>>>>> -    flush_tlb_mask(d->dirty_cpumask);
>>>>> +    flush_mask(d->dirty_cpumask, FLUSH_TLB | FLUSH_HVM_ASID_CORE);
>>>>
>>>> Taking this as example, wouldn't it be more consistent overall if
>>>> paths not being HVM-only would specify FLUSH_HVM_ASID_CORE only
>>>> for HVM domains?
> 
> I could introduce something specific for shadow:
> 
> sh_flush_tlb_mask(d, m) \
>     flush_mask(m, FLUSH_TLB | (is_hvm_domain(d) ? FLUSH_HVM_ASID_CORE : 0))

This looks good.

> And likely a similar macro for hap, that uses hap_enabled.

And then there's no point to use it anywhere in hap.c, as that code
runs only when hap_enabled is true. Hence my suggestion to simply
drop FLUSH_TLB there (assuming by "similar" you meant making
FLUSH_TLB conditional there).

Jan

