Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2D4203891
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 15:59:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnMz0-00027B-Da; Mon, 22 Jun 2020 13:59:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MNSJ=AD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jnMyz-000271-KQ
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 13:59:33 +0000
X-Inumbo-ID: 99080bd6-b490-11ea-be90-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99080bd6-b490-11ea-be90-12813bfff9fa;
 Mon, 22 Jun 2020 13:59:32 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 7X9gmyIAKOlQL8nvF1udnwKS4JBWh3MorgVme+hYznieiE5DEWK3pAhQlytfVS3c+dgZ96e4N8
 eSfj/FsfUlFahmGdFJlPquz7PeEyimAOetHx2xjTsFbb45IlRYa7qMuA5w6DnE5Hz0IQvEXNJp
 Kx0RttgZ5u3yqAKGrA9X6Lh3jRg0iLtkTAHk7Fa5PusrhQZjWEgLambRYX3zl8LuEhhdkWF6sd
 nd4Ld+4Lzw5RPQ98Zoy/YU3CYfsvB0LC47QOQp6/q2liT+jcMfpaWYtXhWc/TVi1pBCxgremps
 8KM=
X-SBRS: 2.7
X-MesageID: 20842150
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,267,1589256000"; d="scan'208";a="20842150"
Subject: Re: [PATCH] x86/CPUID: fill all fields in
 x86_cpuid_policy_fill_native()
To: Jan Beulich <jbeulich@suse.com>
References: <41177396-9944-0bbd-66d2-8b4f2bd063f0@suse.com>
 <e4d644e6-7481-0a66-379d-509c57faf4c8@citrix.com>
 <ff39ac65-70e6-c81e-dbcd-bc38a78b4e4d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9675d3dc-d554-0231-25bc-bb24f0d9157c@citrix.com>
Date: Mon, 22 Jun 2020 14:59:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <ff39ac65-70e6-c81e-dbcd-bc38a78b4e4d@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22/06/2020 14:37, Jan Beulich wrote:
> On 22.06.2020 14:39, Andrew Cooper wrote:
>> On 22/06/2020 13:09, Jan Beulich wrote:
>>> Coverity validly complains that the new call from
>>> tools/tests/cpu-policy/test-cpu-policy.c:test_cpuid_current() leaves
>>> two fields uninitialized, yet they get then consumed by
>>> x86_cpuid_copy_to_buffer(). (All other present callers of the function
>>> pass a pointer to a static - and hence initialized - buffer.)
>>>
>>> Coverity-ID: 1464809
>>> Fixes: c22ced93e167 ("tests/cpu-policy: Confirm that CPUID serialisation is sorted")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/xen/lib/x86/cpuid.c
>>> +++ b/xen/lib/x86/cpuid.c
>>> @@ -176,6 +176,10 @@ void x86_cpuid_policy_fill_native(struct
>>>                            ARRAY_SIZE(p->extd.raw) - 1); ++i )
>>>          cpuid_leaf(0x80000000 + i, &p->extd.raw[i]);
>>>  
>>> +    /* Don't report leaves from possible lower level hypervisor. */
>> ", for now."
>>
>> This will change in the future.
> I was pondering at that moment whether to add it, but then I didn't
> think we'd want to let shine through lower level hypervisor info.
> But yes, I've added it, because it won't be wrong to say "for now",
> even if it end up being for much longer.

It won't be very much longer.

I don't intend to let it "shine though", but the outer hypervisors data
should be in the raw/host policy, just as the Xen Xen/Viridian leaves
need to be in the guest policies.

This is the longterm plan to handle Viridian features, because the
existing HVMPARAM simply isn't expressive enough.

~Andrew

