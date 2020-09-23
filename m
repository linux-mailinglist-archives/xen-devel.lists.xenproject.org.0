Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E209E275F83
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 20:12:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL9G2-0003WU-FP; Wed, 23 Sep 2020 18:12:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+VqP=DA=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kL9G0-0003WP-ME
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 18:12:44 +0000
X-Inumbo-ID: ec63a538-54b8-4b49-97c4-34d6def7a490
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec63a538-54b8-4b49-97c4-34d6def7a490;
 Wed, 23 Sep 2020 18:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=KE9ofldSqy67BE6N7abBuZX4oUMKTzOCvUUv8ZEDeJE=; b=qQqTs4hVd80mDuwPEihUfANCCT
 f1lrhU/otDTYaAg+9sjQxnrHFLGJr1lq4m5GfthUgg0j+HhrtpMQtj6Sq20XgWdBgdpzRtj+teUdo
 O+89Wd6jLDVSZ2T/gyi0Wrk4Hs5CoukaafqfLoA7emgwmWq9pcirGtSpFi+clejg/Zoo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kL9Fx-0000ru-8I; Wed, 23 Sep 2020 18:12:41 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kL9Fw-0007PE-Su; Wed, 23 Sep 2020 18:12:41 +0000
Subject: Re: [PATCH V1 14/16] xen/ioreq: Use guest_cmpxchg64() instead of
 cmpxchg()
To: Oleksandr <olekstysh@gmail.com>, paul@xen.org,
 'Jan Beulich' <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <jgrall@amazon.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-15-git-send-email-olekstysh@gmail.com>
 <44b19ee1-dc34-3a46-0b4b-7196faadcb5c@suse.com>
 <c87089d5-39d2-55e6-5539-97af32c3d6cd@xen.org>
 <002b01d68c09$12df32a0$389d97e0$@xen.org>
 <b43a814a-3788-010e-768b-75211748b05c@xen.org>
 <3e58dc8a-4ecb-1ed5-3179-82f96cc40ca7@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e2ac245b-ca3c-77e1-160a-9f664b4a3339@xen.org>
Date: Wed, 23 Sep 2020 19:12:38 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3e58dc8a-4ecb-1ed5-3179-82f96cc40ca7@gmail.com>
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



On 22/09/2020 21:05, Oleksandr wrote:
> 
> On 16.09.20 12:12, Julien Grall wrote:
> 
> Hi all.
> 
>>
>>
>> On 16/09/2020 10:09, Paul Durrant wrote:
>>>> -----Original Message-----
>>>> From: Julien Grall <julien@xen.org>
>>>> Sent: 16 September 2020 10:07
>>>> To: Jan Beulich <jbeulich@suse.com>; Oleksandr Tyshchenko 
>>>> <olekstysh@gmail.com>
>>>> Cc: xen-devel@lists.xenproject.org; Oleksandr Tyshchenko 
>>>> <oleksandr_tyshchenko@epam.com>; Paul Durrant
>>>> <paul@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Julien 
>>>> Grall <jgrall@amazon.com>
>>>> Subject: Re: [PATCH V1 14/16] xen/ioreq: Use guest_cmpxchg64() 
>>>> instead of cmpxchg()
>>>>
>>>>
>>>>
>>>> On 16/09/2020 10:04, Jan Beulich wrote:
>>>>> On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
>>>>>> @@ -1325,7 +1327,7 @@ static int hvm_send_buffered_ioreq(struct 
>>>>>> hvm_ioreq_server *s, ioreq_t *p)
>>>>>>
>>>>>>            new.read_pointer = old.read_pointer - n * 
>>>>>> IOREQ_BUFFER_SLOT_NUM;
>>>>>>            new.write_pointer = old.write_pointer - n * 
>>>>>> IOREQ_BUFFER_SLOT_NUM;
>>>>>> -        cmpxchg(&pg->ptrs.full, old.full, new.full);
>>>>>> +        guest_cmpxchg64(d, &pg->ptrs.full, old.full, new.full);
>>>>>
>>>>> But the memory we're updating is shared with s->emulator, not with d,
>>>>> if I'm not mistaken.
>>>>
>>>> It is unfortunately shared with both s->emulator and d when using the
>>>> legacy interface.
>>>
>>> When using magic pages they should be punched out of the P2M by the 
>>> time the code gets here, so the memory should not be guest-visible.
>>
>> Can you point me to the code that doing this?
>>
>> Cheers,
>>
> If we are not going to use legacy interface on Arm we will have a page 
> to be mapped in a single domain at the time.
Right, but this is common code... You have to think what would be the 
implication if we are using the legacy interface.

Thankfully the only user of the legacy interface is x86 so far and there 
is not concern regarding the atomics operations.

If we are happy to consider that the legacy interface will never be used 
(I am starting to be worry that one will ask it on Arm...) then we 
should be fine.

I think would be worth documenting in the commit message and the code 
(hvm_allow_set_param()) that the legacy interface *must* not be used 
without revisiting the code.

Cheers,

-- 
Julien Grall

