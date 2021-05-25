Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66883390529
	for <lists+xen-devel@lfdr.de>; Tue, 25 May 2021 17:22:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132253.246754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llYsS-0003rW-1B; Tue, 25 May 2021 15:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132253.246754; Tue, 25 May 2021 15:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llYsR-0003pK-T8; Tue, 25 May 2021 15:21:51 +0000
Received: by outflank-mailman (input) for mailman id 132253;
 Tue, 25 May 2021 15:21:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1llYsQ-0003pD-J4
 for xen-devel@lists.xenproject.org; Tue, 25 May 2021 15:21:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d1098a8-eeae-4015-a265-304030f3b4f9;
 Tue, 25 May 2021 15:21:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 53302AB71;
 Tue, 25 May 2021 15:21:48 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 1d1098a8-eeae-4015-a265-304030f3b4f9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621956108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OTo01Y6FZrlX65+6h/BXe1jMCyZ7OtMZf5FvKE92ORQ=;
	b=JW6ecItZpWcZWhvboF0cMGUrEBkhnp++Z3BQXrBihfkeXnfA24Hw7eSfXDab/T3D3ZKpoT
	+2yjydvAHPRDfMnbc8XNiBRmU9ESiL9QwnaYYF+RT3dPwb6yIvF0/vbcy6jMaUXpZ59QbM
	S/4pveBu3Ed5f0UOIPwNI03bX38blCA=
Subject: Re: [PATCH 3/3] firmware/shim: UNSUPPORTED=n
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <george.dunlap@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <19695ffc-34d8-b682-b092-668f872d4e57@suse.com>
 <dbfa9126-6809-64cf-5bd5-01b402616f11@suse.com>
 <YK0MBTWXYJmihvUn@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6b74b1de-5ec4-09dc-ba1e-821025402d36@suse.com>
Date: Tue, 25 May 2021 17:21:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YK0MBTWXYJmihvUn@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 25.05.2021 16:39, Roger Pau Monné wrote:
> On Fri, Apr 30, 2021 at 04:45:03PM +0200, Jan Beulich wrote:
>> We shouldn't default to include any unsupported code in the shim. Mark
>> the setting as off, replacing the ARGO specification. This points out
>> anomalies with the scheduler configuration: Unsupported schedulers
>> better don't default to Y in release builds (like is already the case
>> for ARINC653). Without these adjustments, the shim would suddenly build
>> with RTDS as its default scheduler.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> ----
>> I'm certainly open to consider alterations on the sched/Kconfig
>> adjustments, but _something_ needs to be done there. In particular I'm
>> puzzled to find the NULL scheduler marked unsupported. Clearly with
>> the shim defaulting to it, it must be supported at least there.
> 
> Indeed, I think we should mark NULL as supported for the shim usage
> (which is very specific anyway, because it manages a single domain).

George, Dario, what is your position towards null's support status?

>> --- a/xen/common/sched/Kconfig
>> +++ b/xen/common/sched/Kconfig
>> @@ -16,7 +16,7 @@ config SCHED_CREDIT2
>>  
>>  config SCHED_RTDS
>>  	bool "RTDS scheduler support (UNSUPPORTED)" if UNSUPPORTED
>> -	default y
>> +	default DEBUG
> 
> I would also be fine with leaving the default as 'n' for unsupported
> features.

So would I be; I merely didn't want to make too big of step by
going straight from y to n. George, Dario - you're the maintainers
of this code (and I'd need your ack anyway), do you have any
preference?

>> @@ -31,7 +31,7 @@ config SCHED_ARINC653
>>  
>>  config SCHED_NULL
>>  	bool "Null scheduler support (UNSUPPORTED)" if UNSUPPORTED
>> -	default y
>> +	default PV_SHIM || DEBUG
> 
> Do we need the pvshim_defconfig to set CONFIG_SCHED_NULL=y after this?

I don't think so, the default will be y for it. Explicit settings
are needed only when we want a non-default value.

Jan

