Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A212E9C18
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 18:36:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61440.108133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwTli-0003ha-Cc; Mon, 04 Jan 2021 17:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61440.108133; Mon, 04 Jan 2021 17:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwTli-0003hB-9T; Mon, 04 Jan 2021 17:35:46 +0000
Received: by outflank-mailman (input) for mailman id 61440;
 Mon, 04 Jan 2021 17:35:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kwTlg-0003h6-UH
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 17:35:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kwTlf-0006hZ-UW; Mon, 04 Jan 2021 17:35:43 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kwTlf-0006ul-KB; Mon, 04 Jan 2021 17:35:43 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=B1EBLGi/rsOKad71TOBbvTqiOv05+PSxJSJHpZI59zQ=; b=41stwcj4NQlz1qQVKA4YOqNNCx
	qzSQXuNUktmCJ4gNrKDnX7ulbb2rBdTiTjNJ847Jr7dT/uxeMXoEG3tJyDIkkjND5NqigCqfMoWz7
	Z/K5lzQkqzLOaUVhfoUQFzjxdfmpdBWMa9QPV1ful5C+SFrYoWyPSHpotaHy00tXVfr4=;
Subject: Re: [PATCH 0/4] xen: domain-tracked allocations, and fault injection
To: Stefano Stabellini <sstabellini@kernel.org>,
 "Zheng, Fam" <famzheng@amazon.com>
Cc: "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "cardoe@cardoe.com" <cardoe@cardoe.com>, "wl@xen.org" <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>
References: <160874604800.15699.17952392608790984041@600e7e483b3a>
 <alpine.DEB.2.21.2012231143430.4040@sstabellini-ThinkPad-T480s>
 <e7ad4670-7e7e-99f3-1800-b097b6a1695f@citrix.com>
 <alpine.DEB.2.21.2012231209170.4040@sstabellini-ThinkPad-T480s>
 <20210104093839.2tjtxyjhu4e6okra@Air-de-Roger>
 <42a74737f4f04d3f0ee21c299193a268b60f6fc8.camel@amazon.com>
 <alpine.DEB.2.21.2101040930090.3465@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <1309fce9-edc8-194e-f530-d77d31972410@xen.org>
Date: Mon, 4 Jan 2021 17:35:41 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2101040930090.3465@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 04/01/2021 17:30, Stefano Stabellini wrote:
> On Mon, 4 Jan 2021, Zheng, Fam wrote:
>> On Mon, 2021-01-04 at 10:38 +0100, Roger Pau Monné wrote:
>>> On Wed, Dec 23, 2020 at 12:10:43PM -0800, Stefano Stabellini wrote:
>>>> On Wed, 23 Dec 2020, Andrew Cooper wrote:
>>>>> On 23/12/2020 19:45, Stefano Stabellini wrote:
>>>>>> On Wed, 23 Dec 2020, no-reply@patchew.org wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> Patchew automatically ran gitlab-ci pipeline with this patch
>>>>>>> (series) applied, but the job failed. Maybe there's a bug in
>>>>>>> the patches?
>>>>>>>
>>>>>>> You can find the link to the pipeline near the end of the
>>>>>>> report below:
>>>>>>>
>>>>>>> Type: series
>>>>>>> Message-id: 20201223163442.8840-1-andrew.cooper3@citrix.com
>>>>>>> Subject: [PATCH 0/4] xen: domain-tracked allocations, and
>>>>>>> fault injection
>>>>>>>
>>>>>>> === TEST SCRIPT BEGIN ===
>>>>>>> #!/bin/bash
>>>>>>> sleep 10
>>>>>>> patchew gitlab-pipeline-check -p xen-project/patchew/xen
>>>>>>> === TEST SCRIPT END ===
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>> === OUTPUT BEGIN ===
>>>>>>> [2020-12-23 16:38:43] Looking up pipeline...
>>>>>>> [2020-12-23 16:38:43] Found pipeline 233889763:
>>>>>>>
>>>>>>>
>> https://gitlab.com/xen-project/patchew/xen/-/pipelines/233889763
>>>>>>
>>>>>> This seems to be a genuine failure. Looking at the alpine-3.12-
>>>>>> gcc-arm64
>>>>>> build test, the build error is appended below. This is a link
>>>>>> to the
>>>>>> failed job:
>>>>>> https://gitlab.com/xen-project/patchew/xen/-/jobs/929842628
>>>>>>
>>>>>>
>>>>>>
>>>>>> gcc  -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-
>>>>>> prototypes -Wdeclaration-after-statement -Wno-unused-but-set-
>>>>>> variable -Wno-unused-local-typedefs   -O2 -fomit-frame-pointer
>>>>>> -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__
>>>>>> -MMD -MP -MF .xen-diag.o.d -D_LARGEFILE_SOURCE
>>>>>> -D_LARGEFILE64_SOURCE   -Werror -include /builds/xen-
>>>>>> project/patchew/xen/tools/misc/../../tools/config.h
>>>>>> -I/builds/xen-
>>>>>> project/patchew/xen/tools/misc/../../tools/include
>>>>>> -I/builds/xen-
>>>>>> project/patchew/xen/tools/misc/../../tools/include
>>>>>> -D__XEN_TOOLS__ -I/builds/xen-
>>>>>> project/patchew/xen/tools/misc/../../tools/include
>>>>>> -I/builds/xen-
>>>>>> project/patchew/xen/tools/misc/../../tools/include
>>>>>> -I/builds/xen-
>>>>>> project/patchew/xen/tools/misc/../../tools/include -Wno-
>>>>>> declaration-after-statement  -c -o xen-diag.o xen-diag.c
>>>>>> xen-fault-ttl.c: In function 'main':
>>>>>> xen-fault-ttl.c:25:14: error: 'struct xen_arch_domainconfig'
>>>>>> has no member named 'emulation_flags'
>>>>>>     25 |             .emulation_flags = XEN_X86_EMU_LAPIC,
>>>>>>        |              ^~~~~~~~~~~~~~~
>>>>>> xen-fault-ttl.c:25:32: error: 'XEN_X86_EMU_LAPIC' undeclared
>>>>>> (first use in this function)
>>>>>>     25 |             .emulation_flags = XEN_X86_EMU_LAPIC,
>>>>>>        |                                ^~~~~~~~~~~~~~~~~
>>>>>> xen-fault-ttl.c:25:32: note: each undeclared identifier is
>>>>>> reported only once for each function it appears in
>>>>>> make[4]: *** [/builds/xen-
>>>>>> project/patchew/xen/tools/misc/../../tools/Rules.mk:144: xen-
>>>>>> fault-ttl.o] Error 1
>>>>>> make[4]: *** Waiting for unfinished jobs....
>>>>>> make[4]: Leaving directory '/builds/xen-
>>>>>> project/patchew/xen/tools/misc'
>>>>>> make[3]: *** [/builds/xen-
>>>>>> project/patchew/xen/tools/../tools/Rules.mk:160: subdir-
>>>>>> install-misc] Error 2
>>>>>> make[3]: Leaving directory '/builds/xen-
>>>>>> project/patchew/xen/tools'
>>>>>> make[2]: *** [/builds/xen-
>>>>>> project/patchew/xen/tools/../tools/Rules.mk:155: subdirs-
>>>>>> install] Error 2
>>>>>> make[2]: Leaving directory '/builds/xen-
>>>>>> project/patchew/xen/tools'
>>>>>> make[1]: *** [Makefile:67: install] Error 2
>>>>>> make[1]: Leaving directory '/builds/xen-
>>>>>> project/patchew/xen/tools'
>>>>>> make: *** [Makefile:134: install-tools] Error 2
>>>>>
>>>>> Yeah - that is a real failure, which can be fixed with a little
>>>>> bit of
>>>>> ifdef-ary.  I'm confused as to why I didn't get that email
>>>>> directly.
>>>>
>>>> It looks like patchew doesn't yet CC the original author?
>>>
>>> Where do patchew emails go? I haven't seen any of them, and they
>>> don't
>>> seem to go to xen-devel.
>>
>> It's to limit the noise level. We intend to stablize the workflow a
>> little more esp. wrt false positives before making every reply go to
>> xen-devel. There's a few things to tweak in patchew.
>>
>> The next logical step should be including the patch author in the loop
>> I think.
> 
> Let's do it.

Fam's e-mail suggested that the workflow is not fully stabilized. So I 
would suggest to add a warning at the top of the e-mail avoiding more 
noise on the thread.

Cheers,

-- 
Julien Grall

