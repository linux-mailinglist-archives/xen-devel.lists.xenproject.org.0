Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E06442724D3
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 15:11:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKLb3-0000Ut-L1; Mon, 21 Sep 2020 13:11:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kKLb2-0000Ui-MF
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 13:11:08 +0000
X-Inumbo-ID: 3bd496de-1944-4fd7-807f-98ddd256752e
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3bd496de-1944-4fd7-807f-98ddd256752e;
 Mon, 21 Sep 2020 13:11:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600693862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1XUEThF/RfPsjZ1SymZMVQllMVIPdzZnDRN0qnxanl8=;
 b=OK8EnLzC89I7ZA0btwTgABf/uq1UhLH1bf41FdGLtnAAAix7TMno1nAH7rs6CuG5z9NHNo
 FrjwFJTgoV/WXI0Sns668XSdEpIpfY7lBZAXIvzBiidvcEWZX/dewH/qp2YIZYdT7g2XI0
 KCmGodXojdHrc3dAZGmhqJ/fgS4W6R8=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B2F0CB541;
 Mon, 21 Sep 2020 13:11:38 +0000 (UTC)
Subject: Re: Memory ordering question in the shutdown deferral code
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Paul Durrant
 <pdurrant@amazon.com>, "Xia, Hongyan" <hongyxia@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <468576ba-8d3f-98e9-e65e-1128b5220d40@xen.org>
 <a75efed4-d435-1746-85ab-a87b328c1101@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2d81cd52-b5a0-325a-9d0c-1ef92d68daf1@suse.com>
Date: Mon, 21 Sep 2020 15:11:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a75efed4-d435-1746-85ab-a87b328c1101@xen.org>
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

On 21.09.2020 13:40, Julien Grall wrote:
> (+ Xen-devel)
> 
> Sorry I forgot to CC xen-devel.
> 
> On 21/09/2020 12:38, Julien Grall wrote:
>> Hi all,
>>
>> I have started to look at the deferral code (see 
>> vcpu_start_shutdown_deferral()) because we need it for LiveUpdate and 
>> Arm will soon use it.
>>
>> The current implementation is using an smp_mb() to ensure ordering 
>> between a write then a read. The code looks roughly (I have slightly 
>> adapted it to make my question more obvious):
>>
>> domain_shutdown()
>>      d->is_shutting_down = 1;
>>      smp_mb();
>>      if ( !vcpu0->defer_shutdown )
>>      {
>>        vcpu_pause_nosync(v);
>>        v->paused_for_shutdown = 1;
>>      }
>>
>> vcpu_start_shutdown_deferral()
>>      vcpu0->defer_shutdown = 1;
>>      smp_mb();
>>      if ( unlikely(d->is_shutting_down) )
>>        vcpu_check_shutdown(v);
>>
>>      return vcpu0->defer_shutdown;
>>
>> smp_mb() should only guarantee ordering (this may be stronger on some 
>> arch), so I think there is a race between the two functions.
>>
>> It would be possible to pause the vCPU in domain_shutdown() because 
>> vcpu0->defer_shutdown wasn't yet seen.
>>
>> Equally, vcpu_start_shutdown_deferral() may not see d->is_shutting_down 
>> and therefore Xen may continue to send the I/O. Yet the vCPU will be 
>> paused so the I/O will never complete.

Individually for each of these I agree. But isn't the goal merely
to prevent both to enter their if()-s' bodies at the same time?
And isn't the combined effect of the two barriers preventing just
this?

>> I am not fully familiar with the IOREQ code, but it sounds to me this is 
>> not the behavior that was intended. Can someone more familiar with the 
>> code confirm it?

As to original intentions, I'm afraid among the people still
listed as maintainers for any part of Xen it may only be Tim to
possibly have been involved in the original installation of
this model, and hence who may know of the precise intentions
and considerations back at the time.

As far as I'm concerned, to be honest I don't think I've ever
managed to fully convince myself of the correctness of the
model in the general case. But since it did look good enough
for x86 ...

Jan

