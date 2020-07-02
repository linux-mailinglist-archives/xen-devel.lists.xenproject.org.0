Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C23212655
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 16:32:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jr0FM-00028c-Vc; Thu, 02 Jul 2020 14:31:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gpFn=AN=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jr0FL-00028X-RI
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 14:31:27 +0000
X-Inumbo-ID: b57ccc1a-bc70-11ea-883d-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b57ccc1a-bc70-11ea-883d-12813bfff9fa;
 Thu, 02 Jul 2020 14:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YR4Xopsj3V/FSwV7yfqdS6ETcxQG7fnxAzc4VfHKV/M=; b=gHG9tkVCn5lGFm+cFWQ2fbq4et
 W9mS+2LYQ4broDtWtzvtLl1Uuxl6BVe3kV1MIj5bLrtF/oFQHyX0D80jE9sT8ybba1f7XfGYIIgWT
 SUUtkRigUFgy71S+fwsCpFErDZj8aN9q8oW6qHq6rW0D0SYW6KyJiQX2VINPufNxmLGY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jr0FF-0003GU-54; Thu, 02 Jul 2020 14:31:21 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jr0FE-0005Jt-Rl; Thu, 02 Jul 2020 14:31:20 +0000
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
 <7f915146-6566-e5a7-14d2-cb2319838562@xen.org>
 <7ac383c2-0264-cc75-a85b-13c1fdfb0bd6@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <dadeeedd-a9e1-d5f4-4754-8da3f065fd44@xen.org>
Date: Thu, 2 Jul 2020 15:31:18 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7ac383c2-0264-cc75-a85b-13c1fdfb0bd6@suse.com>
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



On 02/07/2020 15:17, Jan Beulich wrote:
> On 02.07.2020 16:14, Julien Grall wrote:
>> On 02/07/2020 14:30, Jan Beulich wrote:
>>> On 02.07.2020 11:57, Julien Grall wrote:
>>>> On 02/07/2020 10:18, Jan Beulich wrote:
>>>>> On 02.07.2020 10:54, Julien Grall wrote:
>>>>>> On 02/07/2020 09:50, Jan Beulich wrote:
>>>>>>> On 02.07.2020 10:42, Julien Grall wrote:
>>>>>>>> On 02/07/2020 09:29, Jan Beulich wrote:
>>>> Another way to do it, would be the toolstack to do the mapping. At which
>>>> point, you still need an hypercall to do the mapping (probably the
>>>> hypercall acquire).
>>>
>>> There may not be any mapping to do in such a contrived, fixed-range
>>> environment. This scenario was specifically to demonstrate that the
>>> way the mapping gets done may be arch-specific (here: a no-op)
>>> despite the allocation not being so.
>> You are arguing on extreme cases which I don't think is really helpful
>> here. Yes if you want to map at a fixed address in a guest you may not
>> need the acquire hypercall. But in most of the other cases (see has for
>> the tools) you will need it.
>>
>> So what's the problem with requesting to have the acquire hypercall
>> implemented in common code?
> 
> Didn't we start out by you asking that there be as little common code
> as possible for the time being?

Well as I said I am not in favor of having the allocation in common 
code, but if you want to keep it then you also want to implement 
map/unmap in the common code ([1], [2]).

> I have no issue with putting the
> acquire implementation there ...
This was definitely not clear given how you argued with extreme cases...

Cheers,

[1] <9a3f4d58-e5ad-c7a1-6c5f-42aa92101ca1@xen.org>
[2] <cf41855b-9e5e-13f2-9ab0-04b98f8b3cdd@xen.org>

-- 
Julien Grall

