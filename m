Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C39272AB4
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 17:50:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKO4b-0006qn-LO; Mon, 21 Sep 2020 15:49:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kKO4a-0006qi-CS
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 15:49:48 +0000
X-Inumbo-ID: 544bfa93-f42d-4971-8d36-4316b35bee96
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 544bfa93-f42d-4971-8d36-4316b35bee96;
 Mon, 21 Sep 2020 15:49:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600703386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZhVt2wCWaiJdIDXfoGBKwqDf95UzpjPVySZGa81vZXE=;
 b=aJwZnr2FBG0cT98v1YefPY5uHOvtjftvA29L5GZ4AibieWmrHVlsYW7lIzFL1sGODwAzRq
 t+jFWIK6X4UDDc27dsHSThv7PMuWoG/DrzVOUdoWZAN5ng3n/J5ncyct+iuVTtXC5ZeOUZ
 PnqsF3fj4s9oFH4ffafD15vKhV+2iYA=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E2444AF21;
 Mon, 21 Sep 2020 15:50:22 +0000 (UTC)
Subject: Re: [PATCH] x86/mm: do not mark IO regions as Xen heap
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20200910133514.82155-1-roger.pau@citrix.com>
 <3b61c04e-b2ef-a9c6-c3c4-e1d8624e7115@suse.com>
 <20200921153545.GG19254@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d25d6fe1-da67-2378-3b25-8046a9bd655f@suse.com>
Date: Mon, 21 Sep 2020 17:49:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200921153545.GG19254@Air-de-Roger>
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

On 21.09.2020 17:35, Roger Pau Monné wrote:
> On Mon, Sep 21, 2020 at 04:22:26PM +0200, Jan Beulich wrote:
>> On 10.09.2020 15:35, Roger Pau Monne wrote:
>>> arch_init_memory will treat all the gaps on the physical memory map
>>> between RAM regions as MMIO and use share_xen_page_with_guest in order
>>> to assign them to dom_io. This has the side effect of setting the Xen
>>> heap flag on such pages, and thus is_special_page would then return
>>> true which is an issue in epte_get_entry_emt because such pages will
>>> be forced to use write-back cache attributes.
>>>
>>> Fix this by introducing a new helper to assign the MMIO regions to
>>> dom_io without setting the Xen heap flag on the pages, so that
>>> is_special_page will return false and the pages won't be forced to use
>>> write-back cache attributes.
>>>
>>> Fixes: 81fd0d3ca4b2cd ('x86/hvm: simplify 'mmio_direct' check in epte_get_entry_emt()')
>>
>> Is this really the correct commit? I had this queued for backport,
>> and ended up discarding it from the queue based on this tag, just
>> to then noticing that I remembered correctly that I did backport
>> ca24b2ffdbd9 ("x86/hvm: set 'ipat' in EPT for special pages") to
>> the stable trees already. Isn't it _this_ commit which the change
>> here fixes?
> 
> My bisection pointed to that exact commit as the one that broke my PVH
> dom0 setup, so yes, I'm quite sure that's the commit at least on the
> box that I've bisected it.
> 
> ca24b2ffdbd9 was still fine because previous to the is_special_page
> check loop there was still the `if ( direct_mmio ) ...` handling,
> which made all MMIO regions except for the APIC access page forcefully
> have it's cache attributes set to UC.

Ah yes, I see - thanks. Makes me less sure whether the patch
here really wants backporting. It's certainly an improvement in
its own right to remove the difference between mfn_valid() and
!mfn_valid() MMIO pages, leading e.g. to different treatment by
_sh_propagate(). Will need to give this some more thought, and
of course your and others thoughts would also be appreciated.

Jan

