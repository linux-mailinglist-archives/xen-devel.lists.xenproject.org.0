Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D023621206F
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 11:58:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqvxz-0002zq-HK; Thu, 02 Jul 2020 09:57:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gpFn=AN=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jqvxx-0002zi-Qy
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 09:57:13 +0000
X-Inumbo-ID: 6723a104-bc4a-11ea-bca7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6723a104-bc4a-11ea-bca7-bc764e2007e4;
 Thu, 02 Jul 2020 09:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1cUWloNbnqqp/ee/lmLi98KIuvnU6uDG752B/uPOq+8=; b=feyerl8EXeOAC/zSBT3+FNhU7x
 QWAA9kCYUXBj1K85EXss9jksRtJgma1HRm52DB97jMiNwt31mhfJDlxPpqNMgbwRmP5yJ5Xyjdyhk
 ucroEcZcT+DX7OfCFEuUatRSKgi6WE7S8UiNmSyedBFYg3b6fcV9yoInjm4IYKyrsr1k=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jqvxr-0006WA-Ny; Thu, 02 Jul 2020 09:57:07 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jqvxr-0007ZV-Ej; Thu, 02 Jul 2020 09:57:07 +0000
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
From: Julien Grall <julien@xen.org>
Message-ID: <9a3f4d58-e5ad-c7a1-6c5f-42aa92101ca1@xen.org>
Date: Thu, 2 Jul 2020 10:57:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0e02a9b5-ba7a-43a2-3369-a4410f216ddb@suse.com>
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

On 02/07/2020 10:18, Jan Beulich wrote:
> On 02.07.2020 10:54, Julien Grall wrote:
>>
>>
>> On 02/07/2020 09:50, Jan Beulich wrote:
>>> On 02.07.2020 10:42, Julien Grall wrote:
>>>> On 02/07/2020 09:29, Jan Beulich wrote:
>>>>> I'm with Andrew here, fwiw, as long as the little bit of code that
>>>>> is actually put in common/ or include/xen/ doesn't imply arbitrary
>>>>> restrictions on acceptable values.
>>>> Well yes the code is simple. However, the code as it is wouldn't be
>>>> usuable on other architecture without additional work (aside arch
>>>> specific code). For instance, there is no way to map the buffer outside
>>>> of Xen as it is all x86 specific.
>>>>
>>>> If you want the allocation to be in the common code, then the
>>>> infrastructure to map/unmap the buffer should also be in common code.
>>>> Otherwise, there is no point to allocate it in common.
>>>
>>> I don't think I agree here - I see nothing wrong with exposing of
>>> the memory being arch specific, when allocation is generic. This
>>> is no different from, in just x86, allocation logic being common
>>> to PV and HVM, but exposing being different for both.
>>
>> Are you suggesting that the way it would be exposed may be different for
>> other architecture?
> 
> Why not? To take a possibly extreme example - consider an arch
> where (for bare metal) the buffer is specified to appear at a
> fixed range of addresses.

I am probably missing something here... The current goal is the buffer 
will be mapped in the dom0. Most likely the way to map it will be using 
the acquire hypercall (unless you invent a brand new one...).

For a guest, you could possibly reserve a fixed range and then map it 
when creating the vCPU in Xen. But then, you will likely want a fixed 
size... So why would you bother to ask the user to define the size?

Another way to do it, would be the toolstack to do the mapping. At which 
point, you still need an hypercall to do the mapping (probably the 
hypercall acquire).

> 
>> If so, this is one more reason to not impose a way for allocating the
>> buffer in the common code until another arch add support for vmtrace.
> 
> I'm still not seeing why allocation and exposure need to be done
> at the same place.

If I were going to add support for CoreSight on Arm, then the acquire 
hypercall is likely going to be the way to go for mapping the resource 
in the tools. At which point this will need to be common.

I am still not entirely happy to define the interface yet, but this 
would still be better than trying to make the allocation in common code 
and the leaving the mapping aside. After all, this is a "little bit" 
more code.

Cheers,

-- 
Julien Grall

