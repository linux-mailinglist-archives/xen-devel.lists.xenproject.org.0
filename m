Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D34D1CA551
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 09:38:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWxaA-0001bK-6Q; Fri, 08 May 2020 07:38:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3Kb=6W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jWxa9-0001bF-5J
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 07:38:05 +0000
X-Inumbo-ID: da0033bc-90fe-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da0033bc-90fe-11ea-9887-bc764e2007e4;
 Fri, 08 May 2020 07:38:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 44060AF68;
 Fri,  8 May 2020 07:38:06 +0000 (UTC)
Subject: Re: [PATCH v8 05/12] x86emul: support X{SUS,RES}LDTRK
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <6e7500d2-262c-29c7-b9be-3fc9be26d198@suse.com>
 <feb3a6ed-b6b9-959c-8eb1-fb6ecfff034c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b5f9438b-471d-bf32-3f4c-11287060938c@suse.com>
Date: Fri, 8 May 2020 09:38:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <feb3a6ed-b6b9-959c-8eb1-fb6ecfff034c@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.05.2020 22:13, Andrew Cooper wrote:
> On 05/05/2020 09:14, Jan Beulich wrote:
>> --- a/xen/tools/gen-cpuid.py
>> +++ b/xen/tools/gen-cpuid.py
>> @@ -284,6 +284,9 @@ def crunch_numbers(state):
>>          # as dependent features simplifies Xen's logic, and prevents the guest
>>          # from seeing implausible configurations.
>>          IBRSB: [STIBP, SSBD],
>> +
>> +        # In principle the TSXLDTRK insns could also be considered independent.
>> +        RTM: [TSXLDTRK],
> 
> Why the link?  There is no relevant interaction AFAICT.

Do the insns make any sense without TSX? Anyway - hence the
comment, and if you're convinced the connection does not
need making, I'd be okay dropping it. I would assume though
that we'd better hide TSXLDTRK whenever we hide RTM, which
is most easily achieved by having a connection here.

Jan

