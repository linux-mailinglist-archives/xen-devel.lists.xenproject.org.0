Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9592125E5
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 16:15:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqzzB-0000Eu-Jm; Thu, 02 Jul 2020 14:14:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gpFn=AN=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jqzzA-0000En-8K
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 14:14:44 +0000
X-Inumbo-ID: 5f50f91c-bc6e-11ea-8834-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f50f91c-bc6e-11ea-8834-12813bfff9fa;
 Thu, 02 Jul 2020 14:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y97D6coPVxi0PX9tBidIhqe+3o0C8naVU4+vdJ3TuTk=; b=GfH2bsKKBG46/Cmq2blhMBWcF1
 lg4cqT8zMUvr+JYdW8uIzZDoZQMcqvi2KM7U9eSg0uWAwe/pCvFgKfVvhJnZgXSPAtlNHhekwBFoe
 0iPXwvC7nBn8r/emE/1pMMYFwjFjZ80Sx14LoxPXbowQPoGxG1xvmwwkPRLrZUV5nlOc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jqzz4-0002wc-Eg; Thu, 02 Jul 2020 14:14:38 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jqzz4-0004hi-6H; Thu, 02 Jul 2020 14:14:38 +0000
Subject: Re: [PATCH v4 02/10] x86/vmx: add IPT cpu feature
To: Jan Beulich <jbeulich@suse.com>
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
 <d0165fc3-fb05-2e49-eff3-e45a674b00e1@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7f915146-6566-e5a7-14d2-cb2319838562@xen.org>
Date: Thu, 2 Jul 2020 15:14:35 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d0165fc3-fb05-2e49-eff3-e45a674b00e1@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

Hi,

On 02/07/2020 14:30, Jan Beulich wrote:
> On 02.07.2020 11:57, Julien Grall wrote:
>> Hi,
>>
>> On 02/07/2020 10:18, Jan Beulich wrote:
>>> On 02.07.2020 10:54, Julien Grall wrote:
>>>>
>>>>
>>>> On 02/07/2020 09:50, Jan Beulich wrote:
>>>>> On 02.07.2020 10:42, Julien Grall wrote:
>>>>>> On 02/07/2020 09:29, Jan Beulich wrote:
>>>>>>> I'm with Andrew here, fwiw, as long as the little bit of code that
>>>>>>> is actually put in common/ or include/xen/ doesn't imply arbitrary
>>>>>>> restrictions on acceptable values.
>>>>>> Well yes the code is simple. However, the code as it is wouldn't be
>>>>>> usuable on other architecture without additional work (aside arch
>>>>>> specific code). For instance, there is no way to map the buffer outside
>>>>>> of Xen as it is all x86 specific.
>>>>>>
>>>>>> If you want the allocation to be in the common code, then the
>>>>>> infrastructure to map/unmap the buffer should also be in common code.
>>>>>> Otherwise, there is no point to allocate it in common.
>>>>>
>>>>> I don't think I agree here - I see nothing wrong with exposing of
>>>>> the memory being arch specific, when allocation is generic. This
>>>>> is no different from, in just x86, allocation logic being common
>>>>> to PV and HVM, but exposing being different for both.
>>>>
>>>> Are you suggesting that the way it would be exposed may be different for
>>>> other architecture?
>>>
>>> Why not? To take a possibly extreme example - consider an arch
>>> where (for bare metal) the buffer is specified to appear at a
>>> fixed range of addresses.
>>
>> I am probably missing something here... The current goal is the buffer
>> will be mapped in the dom0. Most likely the way to map it will be using
>> the acquire hypercall (unless you invent a brand new one...).
>>
>> For a guest, you could possibly reserve a fixed range and then map it
>> when creating the vCPU in Xen. But then, you will likely want a fixed
>> size... So why would you bother to ask the user to define the size?
> 
> Because there may be the option to only populate part of the fixed
> range?

It was yet another extreme case ;).

> 
>> Another way to do it, would be the toolstack to do the mapping. At which
>> point, you still need an hypercall to do the mapping (probably the
>> hypercall acquire).
> 
> There may not be any mapping to do in such a contrived, fixed-range
> environment. This scenario was specifically to demonstrate that the
> way the mapping gets done may be arch-specific (here: a no-op)
> despite the allocation not being so.
You are arguing on extreme cases which I don't think is really helpful 
here. Yes if you want to map at a fixed address in a guest you may not 
need the acquire hypercall. But in most of the other cases (see has for 
the tools) you will need it.

So what's the problem with requesting to have the acquire hypercall 
implemented in common code?

Cheers,

-- 
Julien Grall

