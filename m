Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E492E896EA4
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 14:05:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700513.1093778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrzMt-00078h-KU; Wed, 03 Apr 2024 12:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700513.1093778; Wed, 03 Apr 2024 12:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrzMt-000765-HS; Wed, 03 Apr 2024 12:05:27 +0000
Received: by outflank-mailman (input) for mailman id 700513;
 Wed, 03 Apr 2024 12:05:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rrzMs-00075z-Ay
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 12:05:26 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 738734d1-f1b2-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 14:05:24 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-34373f95c27so1065855f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 05:05:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 dw14-20020a0560000dce00b0034174875850sm17043347wrb.70.2024.04.03.05.05.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Apr 2024 05:05:23 -0700 (PDT)
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
X-Inumbo-ID: 738734d1-f1b2-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712145923; x=1712750723; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sUz8kAPEFVaYXoITMPkzCto75xeKikk0+rXAqqfLx2M=;
        b=DYpJNNYZeqGdpXE9X0UnH/Y5fZF1cMXydXeP8xA0rA7bwTzVv/dXBlIcdEHfL6LHgX
         PGGhLpTNE0x/QqN3iMye9igfnsuzyzmSZcrgkViiBi0qiGaCYIGu/x/juTtnFQRc2W0x
         hqWnnx1dxkLbsY2InYSLPODOJFUuhpZZkU32Ay8hkRc26fy2dkkjtCzst6eDvXbQ6wbt
         1sy6aer1/xJRcwHcnYiexaBGqXbcDsEQYZY0dwoQaKgw8JCNm+pS88vY7PE/ft8/2FSD
         U9boSOxV4zZKe5w2jG2ZR8CZRegfa7e/Xv2zirxzz9UuBRrRUmkbg97eEQHB6VTmGSdM
         aUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712145923; x=1712750723;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sUz8kAPEFVaYXoITMPkzCto75xeKikk0+rXAqqfLx2M=;
        b=Oe2J3mKkS7uKG/4hUZOUrFyJXOMbt/rmVM9Sz54QCPQHZaJKOAB42jI8yiaoP6XuA8
         eE02mcyYwNPsE45gVCaWOEGmDdob4H25aJ0v4lEE6fGWhPnKBL7FOxY2Iv9kgFhW7Uh8
         8xyI28NHLUtvmClhaG+1g0C/OE61lQ3dHAUT5WnI5HmQOv+9vunb1A/SBV5O4KDUg0Rm
         5P/nRoXEJMTH3jwdcreG2ICarbur8GL+HgWJ4gb+UGtPffqZQzaSEb2AlAYIAZhkdCmQ
         dEeYw/K5qp/JS/NEdcAO++X4wNULorWm72BzptIeDrePzzcXIlPsEqZKTKDaMpLuyTQZ
         yVWw==
X-Forwarded-Encrypted: i=1; AJvYcCUl04HmwLOBio8HP76HOBrTEvBXTQq/2voRQfg4tXWMTpfp31BX8pnohcXBSQqkACUOZX+myH4i2y9UzttWSS4pldcAnf6gR89B0hrXvJE=
X-Gm-Message-State: AOJu0Yy+AzZ9YxxWooyEEHCKupmnQzpNiYFzOaZu2OpkSjpiiSgN6efA
	GmzKu7eXtwy8zf1l5NEet9ZgPd6MoCXE6O0s2G77CTtyWfjwxvyzumK/1puvTA==
X-Google-Smtp-Source: AGHT+IEOXAxEy8VyEQA4JkF3uAz0CmNBvL1ovJPNHQAGonH1J7Rqjwl3P3V3v5KbeSdxWbfAyBy0ZQ==
X-Received: by 2002:a5d:5888:0:b0:341:c766:fbc9 with SMTP id n8-20020a5d5888000000b00341c766fbc9mr11446456wrf.1.1712145923510;
        Wed, 03 Apr 2024 05:05:23 -0700 (PDT)
Message-ID: <d86e7a86-cd2a-4b0c-b269-6b4e9b2edff3@suse.com>
Date: Wed, 3 Apr 2024 14:05:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "evtchn: refuse EVTCHNOP_status for Xen-bound
 event channels"
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240402170612.2477791-1-andrew.cooper3@citrix.com>
 <11957460-0b2b-432d-ad92-38350306c9ff@suse.com>
 <2df1e3ef-32c5-45c3-af1b-e9473a4e9120@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <2df1e3ef-32c5-45c3-af1b-e9473a4e9120@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2024 13:10, Daniel P. Smith wrote:
> On 4/3/24 02:16, Jan Beulich wrote:
>> On 02.04.2024 19:06, Andrew Cooper wrote:
>>> The commit makes a claim without any kind of justification.
>>
>> Well, what does "have no business" leave open?
> 
> Why does it not have any business? Why should a domain that creates an 
> event channel not be able to inquire about its status?

Event channels we talk about here are created via
alloc_unbound_xen_event_channel(). IOW it's not any domain creating them.
Once connected, the respective domain is of course fine to query its end
of the channel.

>>> The claim is false, and the commit broke lsevtchn in dom0.
>>
>> Or alternatively lsevtchn was doing something that was never meant to work
>> (from Xen's perspective).
> 
> Again, you have not said why this is a problem. What concern does it 
> create? Does it open the door for access elevation, resource 
> deprivation, or some other malicious behaviors?

It exposes information that perhaps better wouldn't be exposed. Imo if
Xen owned resource state is of interest, it would want exposing via
hypfs.

>>>   It is also quite
>>> obvious from XSM_TARGET that it has broken device model stubdoms too.
>>
>> Why would that be "obvious"? What business would a stubdom have to look at
>> Xen's side of an evtchn?
> 
> Again, you have not expressed why it shouldn't be able to do so.

See above - not its resource, nor its guest's.

>>> Whether to return information about a xen-owned evtchn is a matter of policy,
>>> and it's not acceptable to short circuit the XSM on the matter.
>>
>> I can certainly accept this as one possible view point. As in so many cases
>> I'm afraid I dislike you putting it as if it was the only possible one.
> 
> In fact, this commit is in violation of the XSM. It hard-codes a 
> resource access check outside XSM, thus breaking the fine-grained access 
> control of FLASK.

Perhaps; see below and see the question raised in the subsequent reply
to the patch.

>> In summary: The supposed justification you claim is missing in the original
>> change is imo also missing here then: What business would any entity in the
>> system have to look at Xen's side of an event channel? Back at the time, 3
>> people agreed that it's "none".
> 
> As stated, you provided no reason or justification for "has no business" 
> and by face value is an opinion that a few people agreed with. As for 
> why, there could be a myriad number of reasons a domain may want to 
> check the status of an interface it has with the hypervisor. From just 
> logging its state for debug to throttling attempts at sending an event. 
> So why, from a security/access control decision, does this access have 
> to absolutely blocked, even from FLASK?

I didn't say it absolutely needs to be blocked. I'm okay to become
convinced otherwise. But in the description complaining about lack of
reasons in the 3-4 year old change, just to then again not provide any
reasons looks "interesting" to me. (And no, just to take that example,
lsevtchn not working anymore on such channels is not on its own a
reason. As indicated, it may well be that conceptually it was never
supposed to be able to have access to this information. The latest not
anymore when hypfs was introduced.)

Jan

