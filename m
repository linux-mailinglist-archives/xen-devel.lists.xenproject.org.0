Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF1F207795
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 17:36:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo7RN-0001KJ-82; Wed, 24 Jun 2020 15:35:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hC7e=AF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jo7RL-0001KD-Gd
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 15:35:55 +0000
X-Inumbo-ID: 63dd8783-b630-11ea-80f1-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63dd8783-b630-11ea-80f1-12813bfff9fa;
 Wed, 24 Jun 2020 15:35:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3003FAC40;
 Wed, 24 Jun 2020 15:35:53 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: Ping: [PATCH] x86/CPUID: fill all fields in
 x86_cpuid_policy_fill_native()
To: Paul Durrant <paul@xen.org>
References: <41177396-9944-0bbd-66d2-8b4f2bd063f0@suse.com>
 <e4d644e6-7481-0a66-379d-509c57faf4c8@citrix.com>
Message-ID: <db4c744a-a7f5-7499-a1f2-3276486d89c1@suse.com>
Date: Wed, 24 Jun 2020 17:35:53 +0200
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

(sorry, re-sending with To and Cc corrected)

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

