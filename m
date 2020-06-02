Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 358801EBC53
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 15:04:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg6ai-0003zA-Ok; Tue, 02 Jun 2020 13:04:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fJyN=7P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jg6ah-0003z2-2Z
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 13:04:27 +0000
X-Inumbo-ID: 957ae296-a4d1-11ea-abef-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 957ae296-a4d1-11ea-abef-12813bfff9fa;
 Tue, 02 Jun 2020 13:04:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B0831ABD1;
 Tue,  2 Jun 2020 13:04:26 +0000 (UTC)
Subject: Re: [PATCH v2 for-4.14 1/3] xen/monitor: Control register values
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <cover.1590028160.git.tamas@tklengyel.com>
 <b3c147cc226f3a30daec73b2ffd57bd285bc8659.1590028160.git.tamas@tklengyel.com>
 <20200602110223.GW1195@Air-de-Roger>
 <CABfawh=NST0Vq+O5UCqyCxt1z2O9pcES_DQon4-cs9w0TPOuJQ@mail.gmail.com>
 <20200602130114.GZ1195@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f6b6fbe0-b917-2e25-de32-999671101928@suse.com>
Date: Tue, 2 Jun 2020 15:04:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200602130114.GZ1195@Air-de-Roger>
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.06.2020 15:01, Roger Pau Monné wrote:
> On Tue, Jun 02, 2020 at 06:40:12AM -0600, Tamas K Lengyel wrote:
>> On Tue, Jun 2, 2020 at 5:08 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
>>> On Wed, May 20, 2020 at 08:31:52PM -0600, Tamas K Lengyel wrote:
>>>> --- a/xen/arch/x86/hvm/hvm.c
>>>> +++ b/xen/arch/x86/hvm/hvm.c
>>>> @@ -2263,7 +2263,8 @@ int hvm_set_cr0(unsigned long value, bool may_defer)
>>>>      {
>>>>          ASSERT(v->arch.vm_event);
>>>>
>>>> -        if ( hvm_monitor_crX(CR0, value, old_value) )
>>>> +        if ( hvm_monitor_crX(CR0, value, old_value) &&
>>>> +             v->domain->arch.monitor.control_register_values )
>>>>          {
>>>>              /* The actual write will occur in hvm_do_resume(), if permitted. */
>>>>              v->arch.vm_event->write_data.do_write.cr0 = 1;
>>>> @@ -2362,7 +2363,8 @@ int hvm_set_cr3(unsigned long value, bool may_defer)
>>>>      {
>>>>          ASSERT(v->arch.vm_event);
>>>>
>>>> -        if ( hvm_monitor_crX(CR3, value, old) )
>>>> +        if ( hvm_monitor_crX(CR3, value, old) &&
>>>> +             v->domain->arch.monitor.control_register_values )
>>>>          {
>>>>              /* The actual write will occur in hvm_do_resume(), if permitted. */
>>>>              v->arch.vm_event->write_data.do_write.cr3 = 1;
>>>> @@ -2443,7 +2445,8 @@ int hvm_set_cr4(unsigned long value, bool may_defer)
>>>>      {
>>>>          ASSERT(v->arch.vm_event);
>>>>
>>>> -        if ( hvm_monitor_crX(CR4, value, old_cr) )
>>>> +        if ( hvm_monitor_crX(CR4, value, old_cr) &&
>>>> +             v->domain->arch.monitor.control_register_values )
>>>
>>> I think you could return control_register_values in hvm_monitor_crX
>>> instead of having to add the check to each caller?
>>
>> We could, but this way the code is more consistent.
> 
> OK, I guess it's a matter of taste. I would rather prefer those checks
> to be confined to hvm_monitor_crX because then the generic code is not
> polluted with monitor checks, but that's likely just my taste.

+1

Jan

