Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AE12E2115
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 21:02:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58579.103167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksAKm-0003rm-As; Wed, 23 Dec 2020 20:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58579.103167; Wed, 23 Dec 2020 20:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksAKm-0003rN-7a; Wed, 23 Dec 2020 20:02:08 +0000
Received: by outflank-mailman (input) for mailman id 58579;
 Wed, 23 Dec 2020 20:02:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ifz=F3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ksAKk-0003rI-83
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 20:02:06 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b16e155c-e878-4542-a07b-ae1084403632;
 Wed, 23 Dec 2020 20:02:04 +0000 (UTC)
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
X-Inumbo-ID: b16e155c-e878-4542-a07b-ae1084403632
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608753724;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=1NQJP2yjkA5OBuqO488FhSLIbi0QX49BKjdBy4ZvsWE=;
  b=FMdk084+CdnPKpNex/N7iaOe6XUbxqraHhfcW4HyfIo8KcFIOP6iNy5h
   BofcmS3l2ruIlIoPn0Tz/nLmbbgYfjx0CCld0oZNKmn9UMEmBNn6VUyzs
   dDoSoYiZrDzOpCB1tFLqqsPKvXHNi6qCNwbClCZzBfTI/eQhBgo8glBae
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Z5DF5B1BQ2hQBF1AODj1EFeiTiO6Mx216fUWfCRAITHppEx24Nff34L0xQbdn4iAH1u+OS4hk9
 b1ULZU+ALcK7NIcQISOInJ91nhzIkzL/TSBak32ecACzARL9ZCUPh7b9CFcM1glOlMflXbvDg2
 FG456FoaeCwF09L8dOknqaYURNsLGXMrhK7x+ZI6ob5MV7Vd4ARB8J1Gr5GSTA8mZ6nNaUfuq8
 zzJ9NgIOyp0QEranQlglcuMqN1VnaEAlPlxZTZgNFOy/CHY1JQg0zabAss/kQDPO6MG7TeyfkM
 O/s=
X-SBRS: 5.2
X-MesageID: 33865262
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,442,1599537600"; 
   d="scan'208";a="33865262"
Subject: Re: [PATCH 0/4] xen: domain-tracked allocations, and fault injection
To: Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: <famzheng@amazon.com>, <cardoe@cardoe.com>, <wl@xen.org>,
	<Bertrand.Marquis@arm.com>, <julien@xen.org>
References: <160874604800.15699.17952392608790984041@600e7e483b3a>
 <alpine.DEB.2.21.2012231143430.4040@sstabellini-ThinkPad-T480s>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e7ad4670-7e7e-99f3-1800-b097b6a1695f@citrix.com>
Date: Wed, 23 Dec 2020 20:01:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2012231143430.4040@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 23/12/2020 19:45, Stefano Stabellini wrote:
> On Wed, 23 Dec 2020, no-reply@patchew.org wrote:
>> Hi,
>>
>> Patchew automatically ran gitlab-ci pipeline with this patch (series) applied, but the job failed. Maybe there's a bug in the patches?
>>
>> You can find the link to the pipeline near the end of the report below:
>>
>> Type: series
>> Message-id: 20201223163442.8840-1-andrew.cooper3@citrix.com
>> Subject: [PATCH 0/4] xen: domain-tracked allocations, and fault injection
>>
>> === TEST SCRIPT BEGIN ===
>> #!/bin/bash
>> sleep 10
>> patchew gitlab-pipeline-check -p xen-project/patchew/xen
>> === TEST SCRIPT END ===
> [...]
>
>> === OUTPUT BEGIN ===
>> [2020-12-23 16:38:43] Looking up pipeline...
>> [2020-12-23 16:38:43] Found pipeline 233889763:
>>
>> https://gitlab.com/xen-project/patchew/xen/-/pipelines/233889763
> This seems to be a genuine failure. Looking at the alpine-3.12-gcc-arm64
> build test, the build error is appended below. This is a link to the
> failed job: https://gitlab.com/xen-project/patchew/xen/-/jobs/929842628
>
>
>
> gcc  -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O2 -fomit-frame-pointer -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__ -MMD -MP -MF .xen-diag.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE   -Werror -include /builds/xen-project/patchew/xen/tools/misc/../../tools/config.h -I/builds/xen-project/patchew/xen/tools/misc/../../tools/include -I/builds/xen-project/patchew/xen/tools/misc/../../tools/include -D__XEN_TOOLS__ -I/builds/xen-project/patchew/xen/tools/misc/../../tools/include -I/builds/xen-project/patchew/xen/tools/misc/../../tools/include -I/builds/xen-project/patchew/xen/tools/misc/../../tools/include -Wno-declaration-after-statement  -c -o xen-diag.o xen-diag.c 
> xen-fault-ttl.c: In function 'main':
> xen-fault-ttl.c:25:14: error: 'struct xen_arch_domainconfig' has no member named 'emulation_flags'
>    25 |             .emulation_flags = XEN_X86_EMU_LAPIC,
>       |              ^~~~~~~~~~~~~~~
> xen-fault-ttl.c:25:32: error: 'XEN_X86_EMU_LAPIC' undeclared (first use in this function)
>    25 |             .emulation_flags = XEN_X86_EMU_LAPIC,
>       |                                ^~~~~~~~~~~~~~~~~
> xen-fault-ttl.c:25:32: note: each undeclared identifier is reported only once for each function it appears in
> make[4]: *** [/builds/xen-project/patchew/xen/tools/misc/../../tools/Rules.mk:144: xen-fault-ttl.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
> make[4]: Leaving directory '/builds/xen-project/patchew/xen/tools/misc'
> make[3]: *** [/builds/xen-project/patchew/xen/tools/../tools/Rules.mk:160: subdir-install-misc] Error 2
> make[3]: Leaving directory '/builds/xen-project/patchew/xen/tools'
> make[2]: *** [/builds/xen-project/patchew/xen/tools/../tools/Rules.mk:155: subdirs-install] Error 2
> make[2]: Leaving directory '/builds/xen-project/patchew/xen/tools'
> make[1]: *** [Makefile:67: install] Error 2
> make[1]: Leaving directory '/builds/xen-project/patchew/xen/tools'
> make: *** [Makefile:134: install-tools] Error 2

Yeah - that is a real failure, which can be fixed with a little bit of
ifdef-ary.  I'm confused as to why I didn't get that email directly.

~Andrew

