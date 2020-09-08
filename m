Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FE3261045
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 12:52:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFbDm-0000yj-G9; Tue, 08 Sep 2020 10:51:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yBuC=CR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFbDk-0000ye-Uy
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 10:51:28 +0000
X-Inumbo-ID: f007a638-c60c-487e-9daa-dfc2078e81c2
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f007a638-c60c-487e-9daa-dfc2078e81c2;
 Tue, 08 Sep 2020 10:51:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 34FA7ADC2;
 Tue,  8 Sep 2020 10:51:25 +0000 (UTC)
Subject: Re: [PATCH v3] hvmloader: indicate ACPI tables with "ACPI data" type
 in e820
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, wl@xen.org, iwj@xenproject.org
References: <1599522163-21992-1-git-send-email-igor.druzhinin@citrix.com>
 <376039c8-41d7-2216-36e8-1a226b0af499@suse.com>
 <01346ec8-ece4-200a-d108-bd65aab23d47@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c12e6429-9946-a0d5-4305-988992851510@suse.com>
Date: Tue, 8 Sep 2020 12:51:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <01346ec8-ece4-200a-d108-bd65aab23d47@citrix.com>
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

On 08.09.2020 12:44, Igor Druzhinin wrote:
> On 08/09/2020 10:15, Jan Beulich wrote:
>> On 08.09.2020 01:42, Igor Druzhinin wrote:
>>> @@ -210,8 +223,8 @@ int build_e820_table(struct e820entry *e820,
>>>      {
>>>          uint32_t igd_opregion_base = igd_opregion_pgbase << PAGE_SHIFT;
>>>  
>>> -        e820[nr].addr = RESERVED_MEMBASE;
>>> -        e820[nr].size = (uint32_t) igd_opregion_base - RESERVED_MEMBASE;
>>> +        e820[nr].addr = acpi_mem_end;
>>> +        e820[nr].size = igd_opregion_base - acpi_mem_end;
>>>          e820[nr].type = E820_RESERVED;
>>>          nr++;
>>>  
>>> @@ -227,7 +240,7 @@ int build_e820_table(struct e820entry *e820,
>>>      }
>>>      else
>>>      {
>>> -        e820[nr].addr = RESERVED_MEMBASE;
>>> +        e820[nr].addr = acpi_mem_end;
>>>          e820[nr].size = (uint32_t)-e820[nr].addr;
>>>          e820[nr].type = E820_RESERVED;
>>>          nr++;
>>
>> In both cases - why not RESERVED_MEMORY_DYNAMIC_START? I.e. why
>> mark reserved space that isn't in use for anything?
> 
> I think it's better to reserve space that a) isn't suppose to be in use for anything - 
> we don't really want some MMIO being accidentally mapped there and confusing whatever in
> our fragile model, b) that wasn't a hole before so it'd be dangerous to make it that
> way here. Overall, I think it's better to keep this space as reserved as possible as
> before.

Hmm, yes, fair point. Could you please briefly comment on this in
the code, perhaps by extending an existing comment by half a
sentence?

Jan

