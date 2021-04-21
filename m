Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6037C3668D2
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 12:06:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114272.217733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9kk-0005GT-0i; Wed, 21 Apr 2021 10:06:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114272.217733; Wed, 21 Apr 2021 10:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9kj-0005G4-TS; Wed, 21 Apr 2021 10:06:37 +0000
Received: by outflank-mailman (input) for mailman id 114272;
 Wed, 21 Apr 2021 10:06:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZ9ki-0005Fy-PL
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 10:06:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73a17307-1590-47e1-92d6-755c5f67f484;
 Wed, 21 Apr 2021 10:06:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C594FAEE6;
 Wed, 21 Apr 2021 10:06:34 +0000 (UTC)
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
X-Inumbo-ID: 73a17307-1590-47e1-92d6-755c5f67f484
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618999594; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6XxM6xFOMDLu9LYguFtAcK7QLYq9erSVmErekZV9gcM=;
	b=GXwydkoYSd/ESnX0yvVarZNg2RJWdOliEwmidhSnuUqbJg8IWXJn4dh2nJ74Rgo8x72yJm
	GTDmPXaWa8H+hvWD5VYsTaT7g6TRW1lOC8IERW59mvmrMUSsJDARtlKi+Bw6NIYTXykQcy
	JjwVx1jW5tV3LJSHivgD8eVVUhEIVmI=
Subject: Re: [PATCH v4 3/3] x86/time: avoid reading the platform timer in
 rendezvous functions
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <d929903c-0e7a-adb9-3317-b66782f13b36@suse.com>
 <bdf9640d-3c70-461f-6680-9ce883c19719@suse.com>
 <YH79ZxNRhW24jmUS@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <88819ae1-d021-9192-4be7-a70064f23feb@suse.com>
Date: Wed, 21 Apr 2021 12:06:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YH79ZxNRhW24jmUS@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 20.04.2021 18:12, Roger Pau Monné wrote:
> On Thu, Apr 01, 2021 at 11:55:10AM +0200, Jan Beulich wrote:
>> Reading the platform timer isn't cheap, so we'd better avoid it when the
>> resulting value is of no interest to anyone.
>>
>> The consumer of master_stime, obtained by
>> time_calibration_{std,tsc}_rendezvous() and propagated through
>> this_cpu(cpu_calibration), is local_time_calibration(). With
>> CONSTANT_TSC the latter function uses an early exit path, which doesn't
>> explicitly use the field. While this_cpu(cpu_calibration) (including the
>> master_stime field) gets propagated to this_cpu(cpu_time).stamp on that
>> path, both structures' fields get consumed only by the !CONSTANT_TSC
>> logic of the function.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v4: New.
>> ---
>> I realize there's some risk associated with potential new uses of the
>> field down the road. What would people think about compiling time.c a
>> 2nd time into a dummy object file, with a conditional enabled to force
>> assuming CONSTANT_TSC, and with that conditional used to suppress
>> presence of the field as well as all audited used of it (i.e. in
>> particular that large part of local_time_calibration())? Unexpected new
>> users of the field would then cause build time errors.
> 
> Wouldn't that add quite a lot of churn to the file itself in the form
> of pre-processor conditionals?

Possibly - I didn't try yet, simply because of fearing this might
not be liked even without presenting it in patch form.

> Could we instead set master_stime to an invalid value that would make
> the consumers explode somehow?

No idea whether there is any such "reliable" value.

> I know there might be new consumers, but those should be able to
> figure whether the value is sane by looking at the existing ones.

This could be the hope, yes. But the effort of auditing the code to
confirm the potential of optimizing this (after vaguely getting the
impression there might be room) was non-negligible (in fact I did
three runs just to be really certain). This in particular means
that I'm in no way certain that looking at existing consumers would
point out the possible pitfall.

> Also, since this is only done on the BSP on the last iteration I
> wonder if it really makes such a difference performance-wise to
> warrant all this trouble.

By "all this trouble", do you mean the outlined further steps or
the patch itself? In the latter case, while it's only the BSP to
read the value, all other CPUs are waiting for the BSP to get its
part done. So the extra time it takes to read the platform clock
affects the overall duration of the rendezvous, and hence the time
not "usefully" spent by _all_ of the CPUs.

Jan

