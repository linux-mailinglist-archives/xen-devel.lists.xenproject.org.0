Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 104272124B8
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 15:31:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqzJU-0005J7-6e; Thu, 02 Jul 2020 13:31:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jqzJS-0005J1-PQ
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 13:31:38 +0000
X-Inumbo-ID: 5aef1706-bc68-11ea-bb8b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5aef1706-bc68-11ea-bb8b-bc764e2007e4;
 Thu, 02 Jul 2020 13:31:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 65476BC67;
 Thu,  2 Jul 2020 13:31:37 +0000 (UTC)
Subject: Re: [PATCH v4 02/10] x86/vmx: add IPT cpu feature
To: Julien Grall <julien@xen.org>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <7302dbfcd07dfaad9e50bb772673e588fcc4de67.1593519420.git.michal.leszczynski@cert.pl>
 <85416128-a334-4640-7504-0865f715b3a2@xen.org>
 <48c59780-bedb-ff08-723c-be14a9b73e6b@citrix.com>
 <f2aa4cf9-0689-82c0-cb6c-55d55ecbd5c1@xen.org>
 <a9a33ba1-b121-5e6f-b74c-7d2a60c84b13@xen.org>
 <a7187837-495f-56a5-a8d0-635a53ac9234@citrix.com>
 <95154add-164a-5450-28e1-f24611e1642f@xen.org>
 <df0aa9b4-d7f7-f909-e833-3f2f3040a2dc@citrix.com>
 <de298379-43c3-648f-aade-9efc7f761970@xen.org>
 <8df16863-2207-6747-cf17-f88124927ddb@suse.com>
 <cf41855b-9e5e-13f2-9ab0-04b98f8b3cdd@xen.org>
 <75066926-9fe4-1e51-707c-c77c4e6d63ae@suse.com>
 <3fa0c3e7-9243-b1bb-d6ad-a3bd21437782@xen.org>
 <0e02a9b5-ba7a-43a2-3369-a4410f216ddb@suse.com>
 <9a3f4d58-e5ad-c7a1-6c5f-42aa92101ca1@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d0165fc3-fb05-2e49-eff3-e45a674b00e1@suse.com>
Date: Thu, 2 Jul 2020 15:30:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <9a3f4d58-e5ad-c7a1-6c5f-42aa92101ca1@xen.org>
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, tamas.lengyel@intel.com,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 luwei.kang@intel.com, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.07.2020 11:57, Julien Grall wrote:
> Hi,
> 
> On 02/07/2020 10:18, Jan Beulich wrote:
>> On 02.07.2020 10:54, Julien Grall wrote:
>>>
>>>
>>> On 02/07/2020 09:50, Jan Beulich wrote:
>>>> On 02.07.2020 10:42, Julien Grall wrote:
>>>>> On 02/07/2020 09:29, Jan Beulich wrote:
>>>>>> I'm with Andrew here, fwiw, as long as the little bit of code that
>>>>>> is actually put in common/ or include/xen/ doesn't imply arbitrary
>>>>>> restrictions on acceptable values.
>>>>> Well yes the code is simple. However, the code as it is wouldn't be
>>>>> usuable on other architecture without additional work (aside arch
>>>>> specific code). For instance, there is no way to map the buffer outside
>>>>> of Xen as it is all x86 specific.
>>>>>
>>>>> If you want the allocation to be in the common code, then the
>>>>> infrastructure to map/unmap the buffer should also be in common code.
>>>>> Otherwise, there is no point to allocate it in common.
>>>>
>>>> I don't think I agree here - I see nothing wrong with exposing of
>>>> the memory being arch specific, when allocation is generic. This
>>>> is no different from, in just x86, allocation logic being common
>>>> to PV and HVM, but exposing being different for both.
>>>
>>> Are you suggesting that the way it would be exposed may be different for
>>> other architecture?
>>
>> Why not? To take a possibly extreme example - consider an arch
>> where (for bare metal) the buffer is specified to appear at a
>> fixed range of addresses.
> 
> I am probably missing something here... The current goal is the buffer 
> will be mapped in the dom0. Most likely the way to map it will be using 
> the acquire hypercall (unless you invent a brand new one...).
> 
> For a guest, you could possibly reserve a fixed range and then map it 
> when creating the vCPU in Xen. But then, you will likely want a fixed 
> size... So why would you bother to ask the user to define the size?

Because there may be the option to only populate part of the fixed
range?

> Another way to do it, would be the toolstack to do the mapping. At which 
> point, you still need an hypercall to do the mapping (probably the 
> hypercall acquire).

There may not be any mapping to do in such a contrived, fixed-range
environment. This scenario was specifically to demonstrate that the
way the mapping gets done may be arch-specific (here: a no-op)
despite the allocation not being so.

Jan

