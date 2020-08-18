Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A21EF248B6C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 18:23:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k84OS-0007bt-Cc; Tue, 18 Aug 2020 16:23:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RgDL=B4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k84OQ-0007bo-Dj
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 16:23:22 +0000
X-Inumbo-ID: 07c3d702-aad1-4088-8a9a-54537b8237f2
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07c3d702-aad1-4088-8a9a-54537b8237f2;
 Tue, 18 Aug 2020 16:23:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 57846B789;
 Tue, 18 Aug 2020 16:23:45 +0000 (UTC)
Subject: Re: [RESEND][PATCH v2 5/7] xen: include xen/guest_access.h rather
 than asm/guest_access.h
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-6-julien@xen.org>
 <0874b4c7-13d4-61c1-c076-c9d7cf3720c7@suse.com>
 <b2c77386-69a7-b6ee-8311-b2dd25e5ddcd@xen.org>
 <70f7a5c0-3f41-e3a7-00ea-0e620a5506e9@suse.com>
 <8e4685b1-157b-a7ce-72aa-75352c4985b9@xen.org>
 <6474b805-dda6-56ac-cbed-65e4b399081c@suse.com>
 <d2a790ad-0e97-4f58-a38e-c3a23caf0dac@xen.org>
 <04b85927-3f76-3460-3009-078a2105616b@suse.com>
 <7e3dcc77-b817-29f1-df51-3bb9c45c1535@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bd328401-e825-900e-5945-a5fc7cc519cd@suse.com>
Date: Tue, 18 Aug 2020 18:23:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <7e3dcc77-b817-29f1-df51-3bb9c45c1535@xen.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.08.2020 18:20, Julien Grall wrote:
> 
> 
> On 18/08/2020 17:04, Jan Beulich wrote:
>> On 18.08.2020 15:14, Julien Grall wrote:
>>>
>>>
>>> On 18/08/2020 12:32, Jan Beulich wrote:
>>>> On 18.08.2020 10:58, Julien Grall wrote:
>>>>>> One option. Personally I'd prefer to avoid introduction of yet another
>>>>>> constant, by leveraging __XEN_GUEST_ACCESS_H__ instead.
>>>>>
>>>>> I thought about it but it doesn't prevent new inclusions of asm/guest_access.h. For instance, the following would still compile:
>>>>>
>>>>> #include <xen/guest_access.h>
>>>>>
>>>>> [...]
>>>>>
>>>>> #include <asm/guest_access.h>
>>>>
>>>> But where's the problem with this? The first #include will already
>>>> have resulted in the inclusion of asm/guest_access.h, so the second
>>>> #include is simply a no-op.
>>>
>>> A couple of reasons:
>>>     1) I don't consider this solving completely your original request [1]
>>>     2) I don't see how this is more important to prevent including <asm/guest_access.h> before and not after. Both will still compile fine, we just want to avoid it.
>>>
>>>
>>> [1] "Is there any chance you could take measures to avoid new inclusions of asm/guest_access.h to appear?"
>>
>> Is
>>
>> #include <xen/guest_access.h>
>> [...]
>> #include <asm/guest_access.h>
>>
>> actually a problem (as opposed to an asm/ include without any include
>> of the xen/ one at all)?
> 
> Neither of them are really a problem today. So it is not entirely clear why we would want to prevent one and not the other.

If neither is a problem, why the conversion?

Jan

