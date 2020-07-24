Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C1C22BE15
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 08:29:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyrBc-00063f-BF; Fri, 24 Jul 2020 06:28:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKVY=BD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jyrBa-00063X-Qk
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 06:28:02 +0000
X-Inumbo-ID: d2a6be1a-cd76-11ea-a374-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2a6be1a-cd76-11ea-a374-12813bfff9fa;
 Fri, 24 Jul 2020 06:28:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 556F4AC20;
 Fri, 24 Jul 2020 06:28:09 +0000 (UTC)
Subject: Re: [PATCH v3 0/8] x86: compat header generation and checking
 adjustments
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <adb0fe93-c251-b84a-a357-936029af0e9c@suse.com>
 <125c9611-dcae-f119-b44b-e3333b5dc0fd@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1397fc0c-b325-a330-8fab-ad55b009ffe6@suse.com>
Date: Fri, 24 Jul 2020 08:27:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <125c9611-dcae-f119-b44b-e3333b5dc0fd@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.07.2020 06:33, Jürgen Groß wrote:
> On 23.07.20 17:45, Jan Beulich wrote:
>> As was pointed out by 0e2e54966af5 ("mm: fix public declaration of
>> struct xen_mem_acquire_resource"), we're not currently handling structs
>> correctly that have uint64_aligned_t fields. Patch 2 demonstrates that
>> there was also an issue with XEN_GUEST_HANDLE_64().
>>
>> 1: x86: fix compat header generation
>> 2: x86/mce: add compat struct checking for XEN_MC_inject_v2
>> 3: x86/mce: bring hypercall subop compat checking in sync again
>> 4: x86/dmop: add compat struct checking for XEN_DMOP_map_mem_type_to_ioreq_server
>> 5: evtchn: add compat struct checking for newer sub-ops
>> 6: x86: generalize padding field handling
>> 7: flask: drop dead compat translation code
>> 8: x86: only generate compat headers actually needed
>>
>> v3: Build fix for old gcc in patch 1. New patch 5.
> 
> Just an idea:
> 
> Instead of parsing an existing header and trying to create a compat
> header from it, assuming some special constructs and names, wouldn't it
> make more sense to have a common input file and create non-compat and
> compat headers (and the functions/macros to convert them into each
> other) from it?

Sounds like quite a bit of work, but if you or anyone else would
want to invest into trying this approach - why not? (Ideally
interfaces like our public ABI would imo best be described in IDL
or some such anyway, and per-language headers [or whatever the
language requires] then derived from it.)

The current approach was chosen back at the time to make it
sufficiently obvious that the introduction of the compat layer
had no negative impact on the native interface definitions.

> This would at once drop the need for compat checking
> and new interfaces could be tested automatically to not require a compat
> variant.

Not sure about this one: If a code path uses the native struct
even for handling the compat case, how would both layouts matching
be enforced without any explicit check somewhere?

Jan

