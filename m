Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A17BF1FCC31
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 13:24:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlWB0-0001RA-Da; Wed, 17 Jun 2020 11:24:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RQSQ=76=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jlWAy-0001R4-H9
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 11:24:16 +0000
X-Inumbo-ID: 1384f980-b08d-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1384f980-b08d-11ea-bca7-bc764e2007e4;
 Wed, 17 Jun 2020 11:24:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C0DD2AD2A;
 Wed, 17 Jun 2020 11:24:18 +0000 (UTC)
Subject: Re: [PATCH 7/9] x86/hvm: Disable MPX by default
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
 <20200615141532.1927-8-andrew.cooper3@citrix.com>
 <58d7254d-8953-93c4-9eb2-9be45f39bc4e@suse.com>
 <ee0819ab-71fe-dcc3-69c0-798ca9a2972c@citrix.com>
 <6898eb94-868c-b706-7cdd-7d54db09c1b0@suse.com>
 <76fabe81-3f2c-5c48-c2c0-879bc29f4fb7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <356b06c9-b176-8e72-a3bf-2be62f5cbdb5@suse.com>
Date: Wed, 17 Jun 2020 13:24:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <76fabe81-3f2c-5c48-c2c0-879bc29f4fb7@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.06.2020 13:16, Andrew Cooper wrote:
> On 17/06/2020 11:32, Jan Beulich wrote:
>> On 16.06.2020 18:15, Andrew Cooper wrote:
>>> On 16/06/2020 10:33, Jan Beulich wrote:
>>>> On 15.06.2020 16:15, Andrew Cooper wrote:
>>>>> @@ -479,6 +497,18 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>>>>>          goto out;
>>>>>      }
>>>>>  
>>>>> +    /*
>>>>> +     * Account for feature which have been disabled by default since Xen 4.13,
>>>>> +     * so migrated-in VM's don't risk seeing features disappearing.
>>>>> +     */
>>>>> +    if ( restore )
>>>>> +    {
>>>>> +        if ( di.hvm )
>>>>> +        {
>>>>> +            p->feat.mpx = test_bit(X86_FEATURE_MPX, host_featureset);
>>>> Why do you derive this from the host featureset instead of the max
>>>> one for the guest type?
>>> Because that is how the logic worked for 4.13.
>>>
>>> Also, because we don't have easy access to the actual guest max
>>> featureset at this point.  I could add two new sysctl subops to
>>> get_featureset, but the reason for not doing so before are still
>>> applicable now.
>>>
>>> There is a theoretical case where host MPX is visible but guest max is
>>> hidden, and that is down to the vmentry controls.  As this doesn't exist
>>> in real hardware, I'm not terribly concerned about it.
>> I'd also see us allow features to be kept for the host, but masked
>> off of the/some guest feature sets, by way of a to-be-introduced
>> command line option.
> 
> What kind of usecase do you have in mind for this?  We've got a load of
> features which are blanket disabled for guests.  I suppose `ler` et al
> ought to have an impact, except for the fact that LBR at that level
> isn't architectural and always expected.

What I was thinking of was the kind of "none of my guests should use
AVX512 - let me disable it globally, rather than individually in
each guest's config" approach. Of course AVX512 is something we use
in Xen only to emulate guest insns, but I think the example still
serves the purpose.

Jan

