Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C06051D9375
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 11:37:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jayg2-0002bE-6d; Tue, 19 May 2020 09:36:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wtzB=7B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jayfz-0002b9-TH
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 09:36:43 +0000
X-Inumbo-ID: 3f940236-99b4-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f940236-99b4-11ea-b07b-bc764e2007e4;
 Tue, 19 May 2020 09:36:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DFC8EAC5F;
 Tue, 19 May 2020 09:36:44 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] x86: relax GDT check in arch_set_info_guest()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b7a1a7fe-0bc5-1654-ff1c-e5eb787c579e@suse.com>
 <3f78d1dc-720d-6bf3-0911-c19da1a2ddbb@suse.com>
 <20200519084242.GZ54375@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3347c044-b4d2-cfeb-2bc7-1eccb956b47f@suse.com>
Date: Tue, 19 May 2020 11:36:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200519084242.GZ54375@Air-de-Roger>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19.05.2020 10:42, Roger Pau Monné wrote:
> On Fri, Dec 20, 2019 at 02:49:48PM +0100, Jan Beulich wrote:
>> It is wrong for us to check frames beyond the guest specified limit
>> (in the native case, other than in the compat one).
> 
> Wouldn't this result in arch_set_info_guest failing if gdt_ents was
> smaller than the maximum? Or all callers always pass gdt_ents set to
> the maximum?

Since the array is embedded in the struct, I suppose callers simply
start out from a zero-initialized array, in which case the actual
count given doesn't matter. Additionally I think it is uncommon for
the function to get called on a vCPU with v->is_initialised already
set.

>> @@ -982,9 +985,9 @@ int arch_set_info_guest(
>>              fail = compat_pfn_to_cr3(pfn) != c.cmp->ctrlreg[3];
>>          }
>>  
>> -        for ( i = 0; i < ARRAY_SIZE(v->arch.pv.gdt_frames); ++i )
>> -            fail |= v->arch.pv.gdt_frames[i] != c(gdt_frames[i]);
>>          fail |= v->arch.pv.gdt_ents != c(gdt_ents);
>> +        for ( i = 0; !fail && i < nr_gdt_frames; ++i )
>> +            fail |= v->arch.pv.gdt_frames[i] != c(gdt_frames[i]);
> 
> fail doesn't need to be OR'ed anymore here, since you check for it in
> the loop condition.

Ah yes, changed.

>> @@ -1089,12 +1092,11 @@ int arch_set_info_guest(
>>      else
>>      {
>>          unsigned long gdt_frames[ARRAY_SIZE(v->arch.pv.gdt_frames)];
>> -        unsigned int nr_frames = DIV_ROUND_UP(c.cmp->gdt_ents, 512);
>>  
>> -        if ( nr_frames > ARRAY_SIZE(v->arch.pv.gdt_frames) )
>> +        if ( nr_gdt_frames > ARRAY_SIZE(v->arch.pv.gdt_frames) )
>>              return -EINVAL;
> 
> Shouldn't this check be performed when nr_gdt_frames is initialized
> instead of here? (as nr_gdt_frames is already used as a limit to
> iterate over gdt_frames).

Oh, yes, of course. Thanks for spotting.

Jan

