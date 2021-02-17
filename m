Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E9831D719
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 10:48:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86183.161541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCJR0-0002iK-T5; Wed, 17 Feb 2021 09:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86183.161541; Wed, 17 Feb 2021 09:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCJR0-0002hv-Pa; Wed, 17 Feb 2021 09:47:50 +0000
Received: by outflank-mailman (input) for mailman id 86183;
 Wed, 17 Feb 2021 09:47:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFXw=HT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lCJQz-0002hn-O0
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 09:47:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8da034df-f1cb-4c01-9c1a-fd9a2ddc11ea;
 Wed, 17 Feb 2021 09:47:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A859BB7A5;
 Wed, 17 Feb 2021 09:47:47 +0000 (UTC)
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
X-Inumbo-ID: 8da034df-f1cb-4c01-9c1a-fd9a2ddc11ea
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613555267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MmsjZvs0OUslKZz6am/QNr2+fo8zfsU45uUVmMv+tMA=;
	b=SAA3nDknxyvtr6jr7KS7gqck7Mo7QdsjpzSqBUb+G2iY4L2OirgRsHGxNKtsQtkOCWEMjn
	zK3tTweNCfeGIqvuVHcRI4TubLAbxIIMgtSjgT7HOhIClgDYMvYgzup9QKNd4tIg1Zgu9w
	ndGBqhbkSAfx53TEJz3hXm6B1pqntFs=
Subject: Re: [PATCH] firmware: don't build hvmloader if it is not needed
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 cardoe@cardoe.com, andrew.cooper3@citrix.com, wl@xen.org,
 iwj@xenproject.org, anthony.perard@citrix.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20210213020540.27894-1-sstabellini@kernel.org>
 <20210213135056.GA6191@mail-itl>
 <4d9200cd-bd4b-e429-5c96-7a4399bb00b4@suse.com>
 <alpine.DEB.2.21.2102161016000.3234@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5a574326-9560-e771-b84f-9d4f348b7f5f@suse.com>
Date: Wed, 17 Feb 2021 10:47:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2102161016000.3234@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 16.02.2021 19:31, Stefano Stabellini wrote:
> On Mon, 15 Feb 2021, Jan Beulich wrote:
>> On 13.02.2021 14:50, Marek Marczykowski-Górecki wrote:
>>> On Fri, Feb 12, 2021 at 06:05:40PM -0800, Stefano Stabellini wrote:
>>>> If rombios, seabios and ovmf are all disabled, don't attempt to build
>>>> hvmloader.
>>>
>>> What if you choose to not build any of rombios, seabios, ovmf, but use
>>> system one instead? Wouldn't that exclude hvmloader too?
>>
>> Even further - one can disable all firmware and have every guest
>> config explicitly specify the firmware to use, afaict.
> 
> I didn't realize there was a valid reason for wanting to build hvmloader
> without rombios, seabios, and ovfm.
> 
> 
>>> This heuristic seems like a bit too much, maybe instead add an explicit
>>> option to skip hvmloader?
>>
>> +1 (If making this configurable is needed at all - is having
>> hvmloader without needing it really a problem?)
> 
> The hvmloader build fails on Alpine Linux x86:
> 
> https://gitlab.com/xen-project/xen/-/jobs/1033722465
> 
> 
> 
> I admit I was just trying to find the fastest way to make those Alpine
> Linux builds succeed to unblock patchew: although the Alpine Linux
> builds are marked as "allow_failure: true" in gitlab-ci, patchew will
> still report the whole battery of tests as "failure". As a consequence
> the notification emails from patchew after a build of a contributed
> patch series always says "job failed" today, making it kind of useless.
> See attached.
> 
> I would love if somebody else took over this fix as I am doing this
> after hours, but if you have a simple suggestion on how to fix the
> Alpine Linux hvmloader builds, or skip the build when appropriate, I can
> try to follow up.

There is an issue with the definition of uint64_t there. Initial
errors like

hvmloader.c: In function 'init_vm86_tss':
hvmloader.c:202:39: error: left shift count >= width of type [-Werror=shift-count-overflow]
  202 |                   ((uint64_t)TSS_SIZE << 32) | virt_to_phys(tss));

already hint at this, but then

util.c: In function 'get_cpu_mhz':
util.c:824:15: error: conversion from 'long long unsigned int' to 'uint64_t' {aka 'long unsigned int'} changes value from '4294967296000000' to '0' [-Werror=overflow]
  824 |     cpu_khz = 1000000ull << 32;

is quite explicit: "aka 'long unsigned int'"? This is a 32-bit
environment, after all. I suspect the build picks up headers
(stdint.h here in particular) intended for 64-bit builds only.
Can you check whether "gcc -m32" properly sets include paths
_different_ from those plain "gcc" sets, if the headers found in
the latter case aren't suitable for the former? Or alternatively
is the Alpine build environment set up incorrectly, in that it
lacks 32-bit devel packages?

As an aside I don't think it's really a good idea to have
hvmloader depend on any external headers. Just like the
hypervisor it's a free-standing binary, and hence ought to be
free of any dependencies on the build/host environment.

Jan

