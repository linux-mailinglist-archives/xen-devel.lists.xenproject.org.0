Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8E5248BC1
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 18:35:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k84Zn-00008W-Fr; Tue, 18 Aug 2020 16:35:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ffgU=B4=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k84Zm-00008R-Ns
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 16:35:06 +0000
X-Inumbo-ID: 42cf77a4-7f34-4c77-ac18-b5d509b6148b
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42cf77a4-7f34-4c77-ac18-b5d509b6148b;
 Tue, 18 Aug 2020 16:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=9KJCcDBsVVGxFdhYWZWwsibaEuzVfyuadn8GVrGMtoM=; b=1JHJRAQdoyNRzB6ME8DJ6Y/YcB
 v1FyvwA1aIGXnweacYa4Ps8RmtGqyT0+53UAO48/tASFdSJahpAbLy72xcm5iBx0cyX/DWg65v5bV
 vaCFBScUwh5haf0UOSIBKkj2r+LjyceQiIXyP5zzqsh16xdvjF99sTxDM2qZFZG+79sM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k84Zf-0000u8-FL; Tue, 18 Aug 2020 16:34:59 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k84Zf-0005om-4z; Tue, 18 Aug 2020 16:34:59 +0000
Subject: Re: [RESEND][PATCH v2 5/7] xen: include xen/guest_access.h rather
 than asm/guest_access.h
To: Jan Beulich <jbeulich@suse.com>
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
 <bd328401-e825-900e-5945-a5fc7cc519cd@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <24005b88-ac1d-926d-ba86-67641375f610@xen.org>
Date: Tue, 18 Aug 2020 17:34:56 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <bd328401-e825-900e-5945-a5fc7cc519cd@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 18/08/2020 17:23, Jan Beulich wrote:
> On 18.08.2020 18:20, Julien Grall wrote:
>>
>>
>> On 18/08/2020 17:04, Jan Beulich wrote:
>>> On 18.08.2020 15:14, Julien Grall wrote:
>>>>
>>>>
>>>> On 18/08/2020 12:32, Jan Beulich wrote:
>>>>> On 18.08.2020 10:58, Julien Grall wrote:
>>>>>>> One option. Personally I'd prefer to avoid introduction of yet another
>>>>>>> constant, by leveraging __XEN_GUEST_ACCESS_H__ instead.
>>>>>>
>>>>>> I thought about it but it doesn't prevent new inclusions of asm/guest_access.h. For instance, the following would still compile:
>>>>>>
>>>>>> #include <xen/guest_access.h>
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>> #include <asm/guest_access.h>
>>>>>
>>>>> But where's the problem with this? The first #include will already
>>>>> have resulted in the inclusion of asm/guest_access.h, so the second
>>>>> #include is simply a no-op.
>>>>
>>>> A couple of reasons:
>>>>      1) I don't consider this solving completely your original request [1]
>>>>      2) I don't see how this is more important to prevent including <asm/guest_access.h> before and not after. Both will still compile fine, we just want to avoid it.
>>>>
>>>>
>>>> [1] "Is there any chance you could take measures to avoid new inclusions of asm/guest_access.h to appear?"
>>>
>>> Is
>>>
>>> #include <xen/guest_access.h>
>>> [...]
>>> #include <asm/guest_access.h>
>>>
>>> actually a problem (as opposed to an asm/ include without any include
>>> of the xen/ one at all)?
>>
>> Neither of them are really a problem today. So it is not entirely clear why we would want to prevent one and not the other.
> 
> If neither is a problem, why the conversion?

As I wrote in the commit message, some of the helpers will be moved from 
asm/guest_access.h. So existing users of asm/guest_access.h may not 
compiled anymore.

If you are not using any helpers from xen/guest_access.h, then you could 
theoritically only include asm/guest_access.h. But they are quite 
limited or maybe don't even exist.

Actually xen/guest_access.h was included from asm/guest_access.h. But 
there are compilation issues if you try to include xen/guest_access.h 
from asm/guest_access.h.

Therefore it is better to request everyone to include 
<xen/guest_access.h>. With that you get all the guest access helpers 
rather than just the arch specific one.

Cheers,

-- 
Julien Grall

