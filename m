Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D281FCAF1
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 12:33:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlVMo-0005Ug-5P; Wed, 17 Jun 2020 10:32:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RQSQ=76=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jlVMn-0005Ub-6A
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 10:32:25 +0000
X-Inumbo-ID: d4ced56e-b085-11ea-b9c5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d4ced56e-b085-11ea-b9c5-12813bfff9fa;
 Wed, 17 Jun 2020 10:32:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 02B2CAC79;
 Wed, 17 Jun 2020 10:32:26 +0000 (UTC)
Subject: Re: [PATCH 7/9] x86/hvm: Disable MPX by default
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
 <20200615141532.1927-8-andrew.cooper3@citrix.com>
 <58d7254d-8953-93c4-9eb2-9be45f39bc4e@suse.com>
 <ee0819ab-71fe-dcc3-69c0-798ca9a2972c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6898eb94-868c-b706-7cdd-7d54db09c1b0@suse.com>
Date: Wed, 17 Jun 2020 12:32:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <ee0819ab-71fe-dcc3-69c0-798ca9a2972c@citrix.com>
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

On 16.06.2020 18:15, Andrew Cooper wrote:
> On 16/06/2020 10:33, Jan Beulich wrote:
>> On 15.06.2020 16:15, Andrew Cooper wrote:
>>> @@ -479,6 +497,18 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>>>          goto out;
>>>      }
>>>  
>>> +    /*
>>> +     * Account for feature which have been disabled by default since Xen 4.13,
>>> +     * so migrated-in VM's don't risk seeing features disappearing.
>>> +     */
>>> +    if ( restore )
>>> +    {
>>> +        if ( di.hvm )
>>> +        {
>>> +            p->feat.mpx = test_bit(X86_FEATURE_MPX, host_featureset);
>> Why do you derive this from the host featureset instead of the max
>> one for the guest type?
> 
> Because that is how the logic worked for 4.13.
> 
> Also, because we don't have easy access to the actual guest max
> featureset at this point.  I could add two new sysctl subops to
> get_featureset, but the reason for not doing so before are still
> applicable now.
> 
> There is a theoretical case where host MPX is visible but guest max is
> hidden, and that is down to the vmentry controls.  As this doesn't exist
> in real hardware, I'm not terribly concerned about it.

I'd also see us allow features to be kept for the host, but masked
off of the/some guest feature sets, by way of a to-be-introduced
command line option.

I take your reply to mean that you agree that conceptually it
ought to be max which gets used here, but there's no practical
difference at this point.

>>  Also, while you modify p here, ...
>>
>>> +        }
>>> +    }
>>> +
>>>      if ( featureset )
>>>      {
>>>          uint32_t disabled_features[FEATURESET_NR_ENTRIES],
>> ... the code in this if()'s body ignores p altogether.
> 
> That is correct.
> 
>> I realize the
>> only caller of the function passes NULL for "featureset", but I'd
>> like to understand the rationale here anyway before giving an R-b.
> 
> The meaning of 'featureset' is "here are the exact bits I want you to use".

With validation to happen only in the hypervisor then, I suppose?

If for both parts my understanding is correct:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

