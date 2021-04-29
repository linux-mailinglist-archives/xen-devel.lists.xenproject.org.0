Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D5F36E809
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 11:33:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119843.226579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc32T-0005Qp-Bz; Thu, 29 Apr 2021 09:32:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119843.226579; Thu, 29 Apr 2021 09:32:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc32T-0005QS-82; Thu, 29 Apr 2021 09:32:53 +0000
Received: by outflank-mailman (input) for mailman id 119843;
 Thu, 29 Apr 2021 09:32:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfjL=J2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lc32S-0005QM-63
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 09:32:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da431c97-9227-4130-8623-7ec2ca63f1e3;
 Thu, 29 Apr 2021 09:32:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 76672B139;
 Thu, 29 Apr 2021 09:32:50 +0000 (UTC)
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
X-Inumbo-ID: da431c97-9227-4130-8623-7ec2ca63f1e3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619688770; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EUYmNWnLJxTNmla9okYoJpep/XPGDEc2+rHLv9z/CaE=;
	b=S/40pMkosT/PEb4+xsCaamHz03k0TimzEu76JGCai7L4tLgcPXWfOSLblh37cefYz7ZPPa
	9dqRL3R4+1FLlI/FfFv5DcMkDDPwzPKnLBBnjPHUcfBVrfxiWt9cDNjzX1kqCg8tIxqGId
	LNyabRjVuplDs2zQXDoVVUr5zu8kSUQ=
Subject: Re: [PATCH v4 3/3] x86/time: avoid reading the platform timer in
 rendezvous functions
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <d929903c-0e7a-adb9-3317-b66782f13b36@suse.com>
 <bdf9640d-3c70-461f-6680-9ce883c19719@suse.com>
 <YH79ZxNRhW24jmUS@Air-de-Roger>
 <88819ae1-d021-9192-4be7-a70064f23feb@suse.com>
Message-ID: <0c00ed2c-0f8d-ad6e-863e-71c904270407@suse.com>
Date: Thu, 29 Apr 2021 11:32:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <88819ae1-d021-9192-4be7-a70064f23feb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.04.2021 12:06, Jan Beulich wrote:
> On 20.04.2021 18:12, Roger Pau Monné wrote:
>> On Thu, Apr 01, 2021 at 11:55:10AM +0200, Jan Beulich wrote:
>>> Reading the platform timer isn't cheap, so we'd better avoid it when the
>>> resulting value is of no interest to anyone.
>>>
>>> The consumer of master_stime, obtained by
>>> time_calibration_{std,tsc}_rendezvous() and propagated through
>>> this_cpu(cpu_calibration), is local_time_calibration(). With
>>> CONSTANT_TSC the latter function uses an early exit path, which doesn't
>>> explicitly use the field. While this_cpu(cpu_calibration) (including the
>>> master_stime field) gets propagated to this_cpu(cpu_time).stamp on that
>>> path, both structures' fields get consumed only by the !CONSTANT_TSC
>>> logic of the function.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> v4: New.
>>> ---
>>> I realize there's some risk associated with potential new uses of the
>>> field down the road. What would people think about compiling time.c a
>>> 2nd time into a dummy object file, with a conditional enabled to force
>>> assuming CONSTANT_TSC, and with that conditional used to suppress
>>> presence of the field as well as all audited used of it (i.e. in
>>> particular that large part of local_time_calibration())? Unexpected new
>>> users of the field would then cause build time errors.
>>
>> Wouldn't that add quite a lot of churn to the file itself in the form
>> of pre-processor conditionals?
> 
> Possibly - I didn't try yet, simply because of fearing this might
> not be liked even without presenting it in patch form.
> 
>> Could we instead set master_stime to an invalid value that would make
>> the consumers explode somehow?
> 
> No idea whether there is any such "reliable" value.
> 
>> I know there might be new consumers, but those should be able to
>> figure whether the value is sane by looking at the existing ones.
> 
> This could be the hope, yes. But the effort of auditing the code to
> confirm the potential of optimizing this (after vaguely getting the
> impression there might be room) was non-negligible (in fact I did
> three runs just to be really certain). This in particular means
> that I'm in no way certain that looking at existing consumers would
> point out the possible pitfall.
> 
>> Also, since this is only done on the BSP on the last iteration I
>> wonder if it really makes such a difference performance-wise to
>> warrant all this trouble.
> 
> By "all this trouble", do you mean the outlined further steps or
> the patch itself? In the latter case, while it's only the BSP to
> read the value, all other CPUs are waiting for the BSP to get its
> part done. So the extra time it takes to read the platform clock
> affects the overall duration of the rendezvous, and hence the time
> not "usefully" spent by _all_ of the CPUs.

Ping? Your answer here has a significant effect on the disposition
of this change.

Jan

