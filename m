Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C1A193924
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 08:05:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHMX5-00021V-27; Thu, 26 Mar 2020 07:02:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ColY=5L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jHMX3-00021P-5S
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 07:02:25 +0000
X-Inumbo-ID: beb6cd78-6f2f-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id beb6cd78-6f2f-11ea-bec1-bc764e2007e4;
 Thu, 26 Mar 2020 07:02:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 671CAAD06;
 Thu, 26 Mar 2020 07:02:23 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1584981438.git.tamas.lengyel@intel.com>
 <a8cf8742054d04760f2f5060cfeef5bef1edbd6f.1584981438.git.tamas.lengyel@intel.com>
 <20200325154702.GD28601@Air-de-Roger>
 <CABfawhnQ_LTG8oses9EWatJ63bEZFctp7uARBjN==twV7c4xqw@mail.gmail.com>
 <ce6b0e2b-b135-8ee6-fc0c-fe190685b237@xen.org>
 <20200325165444.GF28601@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a3ff04a8-a3ec-9726-373a-56dcdc9927ac@suse.com>
Date: Thu, 26 Mar 2020 08:02:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200325165444.GF28601@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH v12 1/3] xen/mem_sharing: VM forking
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.03.2020 17:54, Roger Pau Monné wrote:
> On Wed, Mar 25, 2020 at 04:42:07PM +0000, Julien Grall wrote:
>> On 25/03/2020 16:34, Tamas K Lengyel wrote:
>>>>> --- a/xen/common/domain.c
>>>>> +++ b/xen/common/domain.c
>>>>> @@ -1270,6 +1270,9 @@ int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned offset)
>>>>>
>>>>>       v->vcpu_info = new_info;
>>>>>       v->vcpu_info_mfn = page_to_mfn(page);
>>>>> +#ifdef CONFIG_MEM_SHARING
>>>>> +    v->vcpu_info_offset = offset;
>>>>
>>>> There's no need to introduce this field, you can just use v->vcpu_info
>>>> & ~PAGE_MASK AFAICT.
>>>
>>> Just doing what you suggest above results in:
>>>
>>> mem_sharing.c:1603:55: error: invalid operands to binary & (have
>>> ‘vcpu_info_t * const’ {aka ‘union <anonymous> * const’} and ‘long
>>> int’)
>>>                                       d_vcpu->vcpu_info & ~PAGE_MASK);
>>>
>>> I can of course cast the vcpu_info pointer to (long int), it's just a
>>> bit ugly. Thoughts?
>>
>> FWIW, I will also need the offset for liveupdate. I have used (unsigned
>> long)v->vcpu_info & ~PAGE_MASK so far but this is not really pretty.
> 
> I think using:
> 
> (vaddr_t)v->vcpu_info & ~PAGE_MASK
> 
> is acceptable, but that would require adding a vaddr_t typedef to x86.

I don't think vaddr_t is necessary given that all over the place we
assume conversions between pointers and unsigned long to be fine.

Jan

