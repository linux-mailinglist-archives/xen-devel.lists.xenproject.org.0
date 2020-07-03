Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC49213597
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 09:59:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrGaJ-0007Wv-UT; Fri, 03 Jul 2020 07:58:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kpvw=AO=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jrGaI-0007Wq-Ke
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 07:58:10 +0000
X-Inumbo-ID: efdd61e8-bd02-11ea-bca7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efdd61e8-bd02-11ea-bca7-bc764e2007e4;
 Fri, 03 Jul 2020 07:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y831c3SyaYAviC2e5WYtZjpRaHUueP+RBPpzoR37b8I=; b=WDzZ2nhG96liyYN8lPXOKggYBH
 LGwv7KLXO8TN7b3HAHwMm7rzCqFHs9UUFlDR7g1BA1yrzHMcbPEZ3+8are/MLK5gNx4mDD2pmMTrC
 Txk4e/fSTlK1PeZzUgbMweCxrBGl64FFob0VJYwZSZ5ifb53utXixLggvElw3uHlCcbU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jrGaC-00012e-RV; Fri, 03 Jul 2020 07:58:04 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jrGaC-0005im-Ij; Fri, 03 Jul 2020 07:58:04 +0000
Subject: Re: [PATCH v4 02/10] x86/vmx: add IPT cpu feature
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <3fa0c3e7-9243-b1bb-d6ad-a3bd21437782@xen.org>
 <0e02a9b5-ba7a-43a2-3369-a4410f216ddb@suse.com>
 <9a3f4d58-e5ad-c7a1-6c5f-42aa92101ca1@xen.org>
 <d0165fc3-fb05-2e49-eff3-e45a674b00e1@suse.com>
 <7f915146-6566-e5a7-14d2-cb2319838562@xen.org>
 <7ac383c2-0264-cc75-a85b-13c1fdfb0bd6@suse.com>
 <dadeeedd-a9e1-d5f4-4754-8da3f065fd44@xen.org>
 <187614050.18497785.1593721708078.JavaMail.zimbra@cert.pl>
From: Julien Grall <julien@xen.org>
Message-ID: <2e01fca9-efcd-7d09-355f-29245bbc8721@xen.org>
Date: Fri, 3 Jul 2020 08:58:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <187614050.18497785.1593721708078.JavaMail.zimbra@cert.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 tamas lengyel <tamas.lengyel@intel.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 luwei kang <luwei.kang@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 02/07/2020 21:28, Michał Leszczyński wrote:
> ----- 2 lip 2020 o 16:31, Julien Grall julien@xen.org napisał(a):
> 
>> On 02/07/2020 15:17, Jan Beulich wrote:
>>> On 02.07.2020 16:14, Julien Grall wrote:
>>>> On 02/07/2020 14:30, Jan Beulich wrote:
>>>>> On 02.07.2020 11:57, Julien Grall wrote:
>>>>>> On 02/07/2020 10:18, Jan Beulich wrote:
>>>>>>> On 02.07.2020 10:54, Julien Grall wrote:
>>>>>>>> On 02/07/2020 09:50, Jan Beulich wrote:
>>>>>>>>> On 02.07.2020 10:42, Julien Grall wrote:
>>>>>>>>>> On 02/07/2020 09:29, Jan Beulich wrote:
>>>>>> Another way to do it, would be the toolstack to do the mapping. At which
>>>>>> point, you still need an hypercall to do the mapping (probably the
>>>>>> hypercall acquire).
>>>>>
>>>>> There may not be any mapping to do in such a contrived, fixed-range
>>>>> environment. This scenario was specifically to demonstrate that the
>>>>> way the mapping gets done may be arch-specific (here: a no-op)
>>>>> despite the allocation not being so.
>>>> You are arguing on extreme cases which I don't think is really helpful
>>>> here. Yes if you want to map at a fixed address in a guest you may not
>>>> need the acquire hypercall. But in most of the other cases (see has for
>>>> the tools) you will need it.
>>>>
>>>> So what's the problem with requesting to have the acquire hypercall
>>>> implemented in common code?
>>>
>>> Didn't we start out by you asking that there be as little common code
>>> as possible for the time being?
>>
>> Well as I said I am not in favor of having the allocation in common
>> code, but if you want to keep it then you also want to implement
>> map/unmap in the common code ([1], [2]).
>>
>>> I have no issue with putting the
>>> acquire implementation there ...
>> This was definitely not clear given how you argued with extreme cases...
>>
>> Cheers,
>>
>> [1] <9a3f4d58-e5ad-c7a1-6c5f-42aa92101ca1@xen.org>
>> [2] <cf41855b-9e5e-13f2-9ab0-04b98f8b3cdd@xen.org>
>>
>> --
>> Julien Grall
> 
> 
> Guys,
> 
> could you express your final decision on this topic?

Can you move the acquire implementation from x86 to common code?

Cheers,

-- 
Julien Grall

