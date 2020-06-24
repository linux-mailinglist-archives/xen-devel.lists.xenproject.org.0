Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3C7207772
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 17:33:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo7OH-000190-PF; Wed, 24 Jun 2020 15:32:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hC7e=AF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jo7OG-00018o-DH
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 15:32:44 +0000
X-Inumbo-ID: f25ea410-b62f-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f25ea410-b62f-11ea-bca7-bc764e2007e4;
 Wed, 24 Jun 2020 15:32:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C0CDCAC12;
 Wed, 24 Jun 2020 15:32:42 +0000 (UTC)
Subject: Ping: [PATCH] x86/CPUID: fill all fields in
 x86_cpuid_policy_fill_native()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <41177396-9944-0bbd-66d2-8b4f2bd063f0@suse.com>
 <e4d644e6-7481-0a66-379d-509c57faf4c8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8ff998a1-3d3a-3ffb-8f65-4ef13fb50c52@suse.com>
Date: Wed, 24 Jun 2020 17:32:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <e4d644e6-7481-0a66-379d-509c57faf4c8@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.06.2020 14:39, Andrew Cooper wrote:
> On 22/06/2020 13:09, Jan Beulich wrote:
>> Coverity validly complains that the new call from
>> tools/tests/cpu-policy/test-cpu-policy.c:test_cpuid_current() leaves
>> two fields uninitialized, yet they get then consumed by
>> x86_cpuid_copy_to_buffer(). (All other present callers of the function
>> pass a pointer to a static - and hence initialized - buffer.)
>>
>> Coverity-ID: 1464809
>> Fixes: c22ced93e167 ("tests/cpu-policy: Confirm that CPUID serialisation is sorted")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/lib/x86/cpuid.c
>> +++ b/xen/lib/x86/cpuid.c
>> @@ -176,6 +176,10 @@ void x86_cpuid_policy_fill_native(struct
>>                            ARRAY_SIZE(p->extd.raw) - 1); ++i )
>>          cpuid_leaf(0x80000000 + i, &p->extd.raw[i]);
>>  
>> +    /* Don't report leaves from possible lower level hypervisor. */
> 
> ", for now."
> 
> This will change in the future.
> 
> With this, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Paul?

Thanks, Jan

