Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9989245525B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 02:48:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227058.392595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnWWy-0003St-8q; Thu, 18 Nov 2021 01:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227058.392595; Thu, 18 Nov 2021 01:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnWWy-0003Pr-55; Thu, 18 Nov 2021 01:48:04 +0000
Received: by outflank-mailman (input) for mailman id 227058;
 Thu, 18 Nov 2021 01:48:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9nqF=QF=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mnWWw-0003Pl-Gt
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 01:48:02 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f6bd50c-4811-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 02:48:00 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:37188)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mnWWk-0009gR-pK (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 18 Nov 2021 01:47:50 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 7F13F1FBF1;
 Thu, 18 Nov 2021 01:47:50 +0000 (GMT)
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
X-Inumbo-ID: 8f6bd50c-4811-11ec-9787-a32c541c8605
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <23b5c4ae-d4da-3d01-42f3-17f1504a0a6a@srcf.net>
Date: Thu, 18 Nov 2021 01:47:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
 <20211111175740.23480-2-andrew.cooper3@citrix.com>
 <dc639bdb-a025-4ddf-f328-8aca91bf9ea9@xen.org>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 1/5] xen/domain: Remove function pointers from domain
 pause helpers
In-Reply-To: <dc639bdb-a025-4ddf-f328-8aca91bf9ea9@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/11/2021 09:36, Julien Grall wrote:
> On 11/11/2021 17:57, Andrew Cooper wrote:
>> Retpolines are expensive, and all these do are select between the 
>> sync and
>> nosync helpers.  Pass a boolean instead, and use direct calls 
>> everywhere.
>
> To be honest, I much prefer to read the old code. I am totally not 
> against the change but I can see how I would be ready to introduce new 
> function pointers use in the future.

Really?  The only reason there are function points to begin with was 
because of a far more naive (and far pre-spectre) me fixing a reference 
counting mess in 2014 by consolidating the logic.  My mistake was not 
spotting that the function pointers weren't actually necessary in the 
first place.

> So I think we need some guidelines on when to use function pointers in 
> Xen.

It's easy.  If you are in any way unsure, they're probably the wrong 
answer.  (Ok - I'm being a little facetious)

There are concrete security improvements from not using function 
pointers, demonstrated by fact that JOP/COP attacks are so pervasive 
that all major hardware and software vendors are working on techniques 
(both hardware and software) to prevent forward-edge control flow 
integrity violations.  (The mandate from the NSA to make this happen 
certainly helped spur things on, too.)

There are also concrete performance improvements too.  All competitive 
processors in the market today can cope with direct branches more 
efficiently than indirect branches, and a key principle behind 
profile-guided-optimsiation is to rearrange your `ptr()` function 
pointer call into `if ( ptr == a ) a(); else if ( ptr == b ) b(); else 
ptr()` based on the frequency of destinations, because this really does 
make orders of magnitude improvements in some cases.

We have some shockingly inappropriate uses of function pointers in Xen 
right now (patches 4 and 5 in particular, and "x86/hvm: Remove callback 
from paging->flush_tlb() hook" posted today).  While this specific 
example doesn't fall into shockingly inappropriate in my books, it is 
firmly in the "not appropriate" category.

> The more...
>
>>
>> Pause/unpause operations on behalf of dom0 are not fastpaths, so avoid
>> exposing the __domain_pause_by_systemcontroller() internal.
>>
>> This actually compiles smaller than before:
>
> ... the code doesn't really compile smaller on Arm:
>
> 42sh>  ../scripts/bloat-o-meter xen-syms-old xen-syms
>
> add/remove: 4/2 grow/shrink: 0/6 up/down: 272/-252 (20)
> Function old     new   delta
> _domain_pause                                  -     136    +136
> _domain_pause_by_systemcontroller              -     120    +120
> domain_pause_by_systemcontroller_nosync        -       8      +8
> domain_pause_by_systemcontroller               -       8      +8
> domain_resume                                136     132      -4
> domain_pause_nosync                           12       8      -4
> domain_pause                                  12       8      -4
> domain_pause_except_self                     188     180      -8
> do_domctl                                   5480    5472      -8
> domain_kill                                  372     356     -16
> do_domain_pause                               88       -     -88
> __domain_pause_by_systemcontroller           120       -    -120
> Total: Before=966919, After=966939, chg +0.00%


ARM, like x86, compiles for speed, not size.  "it got a bit larger" is 
generally not as interesting as "it got smaller, despite everything the 
compiler would normally do in the opposite direction".  Obviously, if 
the build of Xen got 10x larger then we'd have a problem, but it hasn't.

Conversely, if we were compiling for size not speed, then "it got 
smaller" is the uninteresting direction.

The truth is that Xen (both x86 and ARM) is a couple of megabytes in RAM 
and this literally doesn't matter these days where RAM is measured in GB 
and TB.  We care to an extent for efficient use of the cache/etc, but 
noone would bat an eyelid at several MB more for a want-to-have feature.


Here, you're saying that for an added 5 instructions, totalling 0.00% 
delta in the size of the hypervisor, you've got some reasonably frequent 
codepaths which will execute faster, and cannot be hijacked with a 
JOP/COP attack.

That's a clear all-around improvement on ARM, just like it is on x86.

~Andrew

