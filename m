Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F14B272584
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 15:28:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKLrA-0001kO-LO; Mon, 21 Sep 2020 13:27:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wcPU=C6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kKLr9-0001kJ-4t
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 13:27:47 +0000
X-Inumbo-ID: 7da79f1c-b26f-4db1-8770-2a6f5ded3512
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7da79f1c-b26f-4db1-8770-2a6f5ded3512;
 Mon, 21 Sep 2020 13:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=SvTahE68MciAn8EN2oX8uXehWSsCyoruylpQiR2oXXo=; b=zZqZsp3W7wQhhxBs2l1H/QuBWu
 yqHAzVtNcowIcAIKf7FjzBB0wVUZxNGw6s1S3RwyNr/pSE3lutQ30Or8V+cKU6zwB0XvjyCgnmVFQ
 2pqqX/Kn80ZuLpckpOk10Xz1HgAi5oH7OelJvwpYo6xPmnL+2z5lxXRmcGGq5FdkznTA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKLr5-0001fX-S6; Mon, 21 Sep 2020 13:27:43 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKLr5-0005nc-Ju; Mon, 21 Sep 2020 13:27:43 +0000
Subject: Re: Memory ordering question in the shutdown deferral code
To: "Durrant, Paul" <pdurrant@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Cc: "Xia, Hongyan" <hongyxia@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <468576ba-8d3f-98e9-e65e-1128b5220d40@xen.org>
 <a75efed4-d435-1746-85ab-a87b328c1101@xen.org>
 <92a6373003e142e9943a4057024a2616@EX13D32EUC003.ant.amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ad81f6ac-6127-bea8-a503-d16d3dc175df@xen.org>
Date: Mon, 21 Sep 2020 14:27:41 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <92a6373003e142e9943a4057024a2616@EX13D32EUC003.ant.amazon.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 21/09/2020 13:55, Durrant, Paul wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 21 September 2020 12:41
>> To: Jan Beulich <jbeulich@suse.com>; Stefano Stabellini <sstabellini@kernel.org>;
>> andrew.cooper3@citrix.com; George Dunlap <george.dunlap@citrix.com>; Durrant, Paul
>> <pdurrant@amazon.co.uk>
>> Cc: Xia, Hongyan <hongyxia@amazon.com>; xen-devel@lists.xenproject.org
>> Subject: RE: [EXTERNAL] Memory ordering question in the shutdown deferral code
>>
>> CAUTION: This email originated from outside of the organization. Do not click links or open
>> attachments unless you can confirm the sender and know the content is safe.
>>
>>
>>
>> (+ Xen-devel)
>>
>> Sorry I forgot to CC xen-devel.
>>
>> On 21/09/2020 12:38, Julien Grall wrote:
>>> Hi all,
>>>
>>> I have started to look at the deferral code (see
>>> vcpu_start_shutdown_deferral()) because we need it for LiveUpdate and
>>> Arm will soon use it.
>>>
>>> The current implementation is using an smp_mb() to ensure ordering
>>> between a write then a read. The code looks roughly (I have slightly
>>> adapted it to make my question more obvious):
>>>
>>> domain_shutdown()
>>>       d->is_shutting_down = 1;
>>>       smp_mb();
>>>       if ( !vcpu0->defer_shutdown )
>>>       {
>>>         vcpu_pause_nosync(v);
>>>         v->paused_for_shutdown = 1;
>>>       }
>>>
>>> vcpu_start_shutdown_deferral()
>>>       vcpu0->defer_shutdown = 1;
>>>       smp_mb();
>>>       if ( unlikely(d->is_shutting_down) )
>>>         vcpu_check_shutdown(v);
>>>
>>>       return vcpu0->defer_shutdown;
>>>
>>> smp_mb() should only guarantee ordering (this may be stronger on some
>>> arch), so I think there is a race between the two functions.
>>>
>>> It would be possible to pause the vCPU in domain_shutdown() because
>>> vcpu0->defer_shutdown wasn't yet seen.
>>>
>>> Equally, vcpu_start_shutdown_deferral() may not see d->is_shutting_down
>>> and therefore Xen may continue to send the I/O. Yet the vCPU will be
>>> paused so the I/O will never complete.
>>>
> 
> The barrier enforces global order, right?

It is not clear to me what you mean by "global ordering". This seems to 
suggest a very expensive synchronization barrier between all the processors.

 From an arch-agnostic PoV, smp_mb() will enforce an ordering between 
loads/stores but it doesn't guarantee *when* they will be observed.

> So, if domain_shutdown() pauses the vcpu then is_shutting_down must necessarily be visible all cpus.

That's not the guarantee provided by smp_mb() (see above).

> Thus vcpu_start_shutdown referral will execute vcpu_check_shutdown(), so I'm having a hard time seeing the race.
> 
>>> I am not fully familiar with the IOREQ code, but it sounds to me this is
>>> not the behavior that was intended. Can someone more familiar with the
>>> code confirm it?
>>>
> 
> No indeed. I think emulation should complete before the vcpu pauses.

I think this part is racy at least on non-x86 platform as x86 seems to 
implement smp_mb() with a strong memory barrier (mfence).

Cheers,

-- 
Julien Grall

