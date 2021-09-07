Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B63F8402B32
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 16:56:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181143.328169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNcVm-00047Q-TR; Tue, 07 Sep 2021 14:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181143.328169; Tue, 07 Sep 2021 14:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNcVm-00044R-QJ; Tue, 07 Sep 2021 14:55:46 +0000
Received: by outflank-mailman (input) for mailman id 181143;
 Tue, 07 Sep 2021 14:55:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WTX3=N5=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mNcVl-00044L-JE
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 14:55:45 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad36f8f8-0feb-11ec-b104-12813bfff9fa;
 Tue, 07 Sep 2021 14:55:44 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1631026537886258.94692952877904;
 Tue, 7 Sep 2021 07:55:37 -0700 (PDT)
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
X-Inumbo-ID: ad36f8f8-0feb-11ec-b104-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1631026541; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dEuYpSadwO6BWXXzFGESW3zKszBfn9BDjg7PbivaKnzxLZl/ObSB9DcqOqVidWDdDCAcmHH2VERSm4nbSneNS4EhKWzNa+cSdRI72JggfBjIUGsl0jZ/QleeX2z678y89rgwpexpvkp3k1J21L7m/9RpPCEnAWPLl1UF+/YDgyQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1631026541; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=1S9g/DAWEke9fgbmngX/mer48f8cYnTvTwR4FI8XbP8=; 
	b=ZZYPoDEO2umi+nMxueIX3gVflBRtsPUhFJWtVtoNFqxDJEjQBfaySLrsD1O1RaMwW/TTFzVzSAdCW+5fR7Mj3yVPiU+sPUwYFOzyd/1sRK+Lzq78h3RrfUWaRQVGPS0ppFUR1fpw0UHf6C3SAIVBTdTnIUk9AbF7N9RLNfHuBCE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1631026541;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=1S9g/DAWEke9fgbmngX/mer48f8cYnTvTwR4FI8XbP8=;
	b=P1acJ6j4P1gKWNaDrgPeeqX4PLdqzbbu5JLUFK+E0QwcfdSrMP8vCRACvBwvzm1H
	Hhb3ypw/bFvSqw9d4DhrsAvqij4DYIqvSXDvEuz0qd4PI/tSOVfxA5ZxnrPJVVCYmtW
	BcCDVVnZjVRB0/dq/WEbk4Xc9DEpOecpM2hsDvwU=
Subject: Re: [PATCH v4 04/11] xsm: apply coding style
To: Jan Beulich <jbeulich@suse.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
 <20210903190629.11917-5-dpsmith@apertussolutions.com>
 <01c81885-9ea0-3ecf-66b0-009b9e7ba39b@citrix.com>
 <ef0d627e-cc1f-4b9a-7695-daa646968c42@apertussolutions.com>
 <a3a9207e-7ab9-5eb9-7488-74bc4203e7a3@suse.com>
 <3b3762a7-5034-9094-84f9-cd8ab24e24a0@apertussolutions.com>
 <e006dc60-7745-43b7-f725-2390e174bfa7@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <bf876f84-aa0f-faff-da63-0f0525087883@apertussolutions.com>
Date: Tue, 7 Sep 2021 10:55:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e006dc60-7745-43b7-f725-2390e174bfa7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 9/7/21 10:27 AM, Jan Beulich wrote:
> On 07.09.2021 16:09, Daniel P. Smith wrote:
>> On 9/7/21 9:50 AM, Jan Beulich wrote:
>>> On 07.09.2021 15:41, Daniel P. Smith wrote:
>>>> On 9/6/21 2:17 PM, Andrew Cooper wrote:
>>>>> On 03/09/2021 20:06, Daniel P. Smith wrote:
>>>>>> --- a/xen/include/xsm/dummy.h
>>>>>> +++ b/xen/include/xsm/dummy.h
>>>>>> @@ -69,8 +69,9 @@ void __xsm_action_mismatch_detected(void);
>>>>>>    
>>>>>>    #endif /* CONFIG_XSM */
>>>>>>    
>>>>>> -static always_inline int xsm_default_action(
>>>>>> -    xsm_default_t action, struct domain *src, struct domain *target)
>>>>>> +static always_inline int xsm_default_action(xsm_default_t action,
>>>>>> +                                            struct domain *src,
>>>>>> +                                            struct domain *target)
>>>>>
>>>>> The old code is correct.  We have plenty of examples of this in Xen, and
>>>>> I have been adding new ones when appropriate.
>>>>>
>>>>> It avoids squashing everything on the RHS and ballooning the line count
>>>>> to compensate.  (This isn't a particularly bad example, but we've had
>>>>> worse cases in the past).
>>>>
>>>> Based on the past discussions I understood either is acceptable and find
>>>> this version much easier to visually parse myself. With that said, if
>>>> the "next line single indent" really is the preferred style by the
>>>> maintainers/community, then I can convert all of these over.
>>>
>>> I guess neither is the "preferred" style; as Andrew says, both are
>>> acceptable and both are in active use. I guess the rule of thumb is:
>>> The longer what's left of the function name, the more you should
>>> consider the style that you change away from.
>>>
>>> Anyway, in the end I guess the request for style adjustments was
>>> mainly to purge bad style, not to convert one acceptable form to
>>> another. Converting the entire file to the same style is of course
>>> fine (for producing a consistent result), but then - as per above -
>>> here it would more likely be the one that in this case was already
>>> there.
>>
>> Understood, I will respin with all the function defs to align with the 
>> "next line single indent" style, though it would be helpful for 
>> clarification on this style exactly. Do you always wrap all args if one 
>> extends past 80 col or is there a rule for when some should remain on 
>> the first line (function def line)?
> 
> I don't think that aspect has been discussed. I would say
> 
> void sufficiently_long_attribute test(unsigned int x, unsigned int y,
>                                       unsigned int z, void *p);
> 
> is as acceptable as
> 
> void sufficiently_long_attribute test(unsigned int x,
>                                       unsigned int y,
>                                       unsigned int z,
>                                       void *p);
> 
> with a slight preference to the former.
> 
> Jan
> 

Apologies, I was referring to this style which I am understanding is a
little more preferred

void short_function_name(
    struct really_long__struct_name *x,
    struct really_long__struct_name *y, unsigned int z, void *p);

vs

void short_function_name(struct really_long__struct_name *x,
    struct really_long__struct_name *y, unsigned int z, void *p);


NB: I don't recall it off the top of my head, but there is one function
def in here that is similar to this situation

v/r,
dps

