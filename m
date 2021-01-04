Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BC42E9C19
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 18:36:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61443.108146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwTmA-0003mq-Mq; Mon, 04 Jan 2021 17:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61443.108146; Mon, 04 Jan 2021 17:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwTmA-0003mR-Ic; Mon, 04 Jan 2021 17:36:14 +0000
Received: by outflank-mailman (input) for mailman id 61443;
 Mon, 04 Jan 2021 17:36:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rg9=GH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kwTm8-0003mH-NV
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 17:36:12 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f621cc9d-9a52-4c64-9910-e052a1fb55d3;
 Mon, 04 Jan 2021 17:36:11 +0000 (UTC)
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
X-Inumbo-ID: f621cc9d-9a52-4c64-9910-e052a1fb55d3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609781771;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=liyATdDrONNYFsOpRiQIOmyeOIAoiY9j4VhCpmtZF8U=;
  b=cEnxZ9Ecmi3RRgFw1sj22Nq6DzBTAM5bokIXj9auui6hu2wsCkyHBvNw
   8UhuhdiL2WhIytrI6rS3RfIugHbc5Fjdk7a39RU4JTT1B0cgjVuC5g2hE
   MSHpP4Ep9WWM6R5iaB0UkJkc+ldpod9YnydN96DJBIUXAVP1b2VrBiEoY
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 9/uWPF3lPlMH4dHF68ooGLISu1/IfndTH8pE++mUSia52tylVBkzJjr7t5Yby6USCzCVBcLg5h
 Erbck0YwZoJjnALYSc5h9sbkCISW+Kivbh8hpH493hQq9zq1cFnXhbZpI5ExlxBgT6PChdCDHB
 TydhMfvmRg+/Inol1s+uqcE2iG3tW83HqMqC+86WzVz0hV1sL1PtpNas/HjF7svA06gKBMOZop
 JySJDqZyrxSKmbNuLHB7NaKNlUXSyZwactO7gKc3ME6zTbTUOCa3oRJW2l9cgaSXTUUc31RFIq
 BWs=
X-SBRS: 5.2
X-MesageID: 34362033
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,474,1599537600"; 
   d="scan'208";a="34362033"
Subject: Re: [PATCH 0/4] xen: domain-tracked allocations, and fault injection
To: Stefano Stabellini <sstabellini@kernel.org>, "Zheng, Fam"
	<famzheng@amazon.com>
CC: "roger.pau@citrix.com" <roger.pau@citrix.com>, "julien@xen.org"
	<julien@xen.org>, "cardoe@cardoe.com" <cardoe@cardoe.com>, "wl@xen.org"
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Bertrand.Marquis@arm.com"
	<Bertrand.Marquis@arm.com>
References: <160874604800.15699.17952392608790984041@600e7e483b3a>
 <alpine.DEB.2.21.2012231143430.4040@sstabellini-ThinkPad-T480s>
 <e7ad4670-7e7e-99f3-1800-b097b6a1695f@citrix.com>
 <alpine.DEB.2.21.2012231209170.4040@sstabellini-ThinkPad-T480s>
 <20210104093839.2tjtxyjhu4e6okra@Air-de-Roger>
 <42a74737f4f04d3f0ee21c299193a268b60f6fc8.camel@amazon.com>
 <alpine.DEB.2.21.2101040930090.3465@sstabellini-ThinkPad-T480s>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <429efe8c-7c41-b297-47a4-865b148886a3@citrix.com>
Date: Mon, 4 Jan 2021 17:36:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2101040930090.3465@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

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
>>>>>> [...]
>>>>>>
>>>>>>> === OUTPUT BEGIN ===
>>>>>>> [2020-12-23 16:38:43] Looking up pipeline...
>>>>>>> [2020-12-23 16:38:43] Found pipeline 233889763:
>>>>>>>
>>>>>>>
>> https://gitlab.com/xen-project/patchew/xen/-/pipelines/233889763
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
>>>>>>    25 |             .emulation_flags = XEN_X86_EMU_LAPIC,
>>>>>>       |              ^~~~~~~~~~~~~~~
>>>>>> xen-fault-ttl.c:25:32: error: 'XEN_X86_EMU_LAPIC' undeclared
>>>>>> (first use in this function)
>>>>>>    25 |             .emulation_flags = XEN_X86_EMU_LAPIC,
>>>>>>       |                                ^~~~~~~~~~~~~~~~~
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
>>>>> Yeah - that is a real failure, which can be fixed with a little
>>>>> bit of
>>>>> ifdef-ary.  I'm confused as to why I didn't get that email
>>>>> directly.
>>>> It looks like patchew doesn't yet CC the original author?
>>> Where do patchew emails go? I haven't seen any of them, and they
>>> don't
>>> seem to go to xen-devel.
>> It's to limit the noise level. We intend to stablize the workflow a
>> little more esp. wrt false positives before making every reply go to
>> xen-devel. There's a few things to tweak in patchew.
>>
>> The next logical step should be including the patch author in the loop
>> I think.
> Let's do it.

Are we sure?  The false positive rate is still very high.

There are two separate x86 randconfig failures, an ARM randconfig
failure, and an ARM smoke test failure.

None of these are fair to be raised as objections to a contributor, as
it leaves the results very noisy.

I think we need to get to 0 known outstanding false positives before
continuing.

~Andrew

