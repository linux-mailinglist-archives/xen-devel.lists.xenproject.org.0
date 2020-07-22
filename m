Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F05322939A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 10:34:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyACh-0000PC-Vr; Wed, 22 Jul 2020 08:34:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mY6V=BB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jyACh-0000P7-4D
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 08:34:19 +0000
X-Inumbo-ID: 21c44422-cbf6-11ea-8620-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21c44422-cbf6-11ea-8620-bc764e2007e4;
 Wed, 22 Jul 2020 08:34:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A6FB2AD4A;
 Wed, 22 Jul 2020 08:34:24 +0000 (UTC)
Subject: Re: [xen-unstable test] 152067: regressions - trouble:
 fail/pass/starved
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-152067-mainreport@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <62b87ab7-1f1e-0ef8-0ff7-3b6fb55837dd@suse.com>
Date: Wed, 22 Jul 2020 10:34:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <osstest-152067-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

On 22.07.2020 02:37, osstest service owner wrote:
> flight 152067 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/152067/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-dom0pvh-xl-intel 18 guest-localmigrate/x10 fail REGR. vs. 152045

Jul 21 16:20:58.985209 [  530.412043] libxl-save-help: page allocation failure: order:4, mode:0x60c0c0(GFP_KERNEL|__GFP_COMP|__GFP_ZERO), nodemask=(null)

My first reaction to this would be to ask if Dom0 was given too little
memory here. Or of course there could be a memory leak somewhere. But
the system isn't entirely out of memory (about 7Mb left), so perhaps
the "order:4" aspect here also plays a meaningful role. Hence ...

Jul 21 16:21:00.390810 [  530.412448] Call Trace:
Jul 21 16:21:00.402721 [  530.412499]  dump_stack+0x72/0x8c
Jul 21 16:21:00.402801 [  530.412541]  warn_alloc.cold.140+0x68/0xe8
Jul 21 16:21:00.402841 [  530.412585]  __alloc_pages_slowpath+0xc73/0xcb0
Jul 21 16:21:00.414737 [  530.412640]  ? __do_page_fault+0x249/0x4d0
Jul 21 16:21:00.414786 [  530.412681]  __alloc_pages_nodemask+0x235/0x250
Jul 21 16:21:00.426555 [  530.412734]  kmalloc_order+0x13/0x60
Jul 21 16:21:00.426619 [  530.412774]  kmalloc_order_trace+0x18/0xa0
Jul 21 16:21:00.426671 [  530.412816]  alloc_empty_pages.isra.15+0x24/0x60
Jul 21 16:21:00.438447 [  530.412867]  privcmd_ioctl_mmap_batch.isra.18+0x303/0x320
Jul 21 16:21:00.438507 [  530.412918]  ? vmacache_find+0xb0/0xb0
Jul 21 16:21:00.450475 [  530.412957]  privcmd_ioctl+0x253/0xa9b

... perhaps we ought to consider re-working this code path to avoid
order > 0 allocations (may be as simple as switching to vmalloc(),
but I say this without having looked at the code).

Jan

