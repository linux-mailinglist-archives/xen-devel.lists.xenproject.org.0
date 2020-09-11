Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD145265963
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 08:32:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGcbE-00050k-KP; Fri, 11 Sep 2020 06:31:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eh3a=CU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGcbC-00050f-Pn
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 06:31:54 +0000
X-Inumbo-ID: 15bf3640-3cee-4719-8815-03cd1692d5c8
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15bf3640-3cee-4719-8815-03cd1692d5c8;
 Fri, 11 Sep 2020 06:31:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 967A9B42E;
 Fri, 11 Sep 2020 06:32:07 +0000 (UTC)
Subject: Re: [PATCH 3/5] x86/pv: Optimise prefetching in svm_load_segs()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20200909095920.25495-1-andrew.cooper3@citrix.com>
 <20200909095920.25495-4-andrew.cooper3@citrix.com>
 <b014b917-f6ca-bbc0-22f6-14993aa84c8d@suse.com>
 <d1a9c80a-df6e-ebe4-1720-3f6f2eeffee0@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8fea55b9-b479-36f3-f9ab-1390407b61e1@suse.com>
Date: Fri, 11 Sep 2020 08:31:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d1a9c80a-df6e-ebe4-1720-3f6f2eeffee0@citrix.com>
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

On 10.09.2020 22:30, Andrew Cooper wrote:
> On 10/09/2020 15:57, Jan Beulich wrote:
>> On 09.09.2020 11:59, Andrew Cooper wrote:
>>> Split into two functions.  Passing a load of zeros in results in somewhat poor
>>> register scheduling in __context_switch().
>> I'm afraid I don't understand why this would be, no matter that
>> I trust you having observed this being the case: The registers
>> used for passing parameters are all call-clobbered anyway, so
>> the compiler can't use them for anything across the call. And
>> it would look pretty poor code generation wise if the XORs to
>> clear them (which effectively have no latency at all) would be
>> scheduled far ahead of the call, especially when there's better
>> use for the registers. The observation wasn't possibly from
>> before your recent dropping of two of the parameters, when they
>> couldn't all be passed in registers (albeit even then it would
>> be odd, as the change then should merely have lead to a slightly
>> smaller stack frame of the function)?
> 
> Hmm yes.  I wrote this patch before I did the assertion fix, and it the
> comment didn't rebase very well.
> 
> Back then, one of the zeros was on the stack, which was definitely an
> unwanted property.  Even though the XORs are mostly free, they're not
> totally free, as they cost decode bandwidth and instruction cache space
> (Trivial amounts, but still...).
> 
> In general, LTO's inter-procedural-analysis can figure out that
> svm_load_segs_prefetch() doesn't use many registers, and the caller can
> be optimised based on the fact that some registers aren't actually
> clobbered.  (Then again, in this case with a sole caller, LTO really
> ought to be able to inline and delete the function.)
> 
> How about "results in unnecessary caller setup code" ?

Yeah, that's probably better as a description.

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

