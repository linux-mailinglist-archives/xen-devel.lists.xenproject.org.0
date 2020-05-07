Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D271C853A
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 10:59:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWcMI-0005G8-VK; Thu, 07 May 2020 08:58:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jWcMH-0005G3-Ez
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 08:58:21 +0000
X-Inumbo-ID: e612c5f2-9040-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e612c5f2-9040-11ea-9887-bc764e2007e4;
 Thu, 07 May 2020 08:58:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 86FD0ACB1;
 Thu,  7 May 2020 08:58:21 +0000 (UTC)
Subject: Re: [PATCH v2 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
To: Julien Grall <julien@xen.org>
References: <20200407173847.1595-1-paul@xen.org>
 <20200407173847.1595-2-paul@xen.org>
 <d5013c9d-b1a9-6139-a120-741332d6e086@suse.com>
 <009601d623c5$9547abc0$bfd70340$@xen.org>
 <63772836-3b3c-753a-18e5-d9fe3a6666a2@suse.com>
 <2a911fec-82dd-9d97-791a-02dd4b328eb6@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <21494488-9dd9-c196-73fa-a82c99c8bc52@suse.com>
Date: Thu, 7 May 2020 10:58:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <2a911fec-82dd-9d97-791a-02dd4b328eb6@xen.org>
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 paul@xen.org, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.05.2020 10:35, Julien Grall wrote:
> 
> 
> On 07/05/2020 08:21, Jan Beulich wrote:
>> On 06.05.2020 18:44, Paul Durrant wrote:
>>>>> +#define DOMAIN_SAVE_BEGIN(_x, _c, _v, _len) \
>>>>> +        domain_save_begin((_c), DOMAIN_SAVE_CODE(_x), #_x, (_v), (_len))
>>>>
>>>> In new code I'd like to ask for no leading underscores on macro
>>>> parameters as well as no unnecessary parenthesization of macro
>>>> parameters (e.g. when they simply get passed on to another macro
>>>> or function without being part of a larger expression).
>>>
>>> Personally I think it is generally good practice to parenthesize
>>> but I can drop if you prefer.
>>
>> To be honest - it's more than just "prefer": Excess parentheses
>> hamper readability. There shouldn't be too few, and since macros
>> already require quite a lot of them, imo we should strive to
>> have exactly as many as are needed.
> 
> While I understand that too many parentheses may make the code
> worse, in the case of the macros, adding them for each argument
> is a good practice. This pretty simple to follow and avoid the
> mistake to forget to protect an argument correctly.
> 
> So I would let the contributor decides whether he wants to
> protect all the macro arguments or just as a need basis.

This is a possible alternative position to take, accepting the
worse readability. But then this would please need applying in
full (as far as it's possible - operands to # or ## of course
can't be parenthesized):

#define DOMAIN_SAVE_BEGIN(x, c, v, len) \
        domain_save_begin((c), DOMAIN_SAVE_CODE((x)), #x, (v), (len))

which might look a little odd even to you?

As to readability - I'm sure you realize that from time to time
one needs to look at preprocessor output, where parentheses used
like this plus parentheses then also applied inside the invoked
macro add to one another. All in all I don't really buy the
"avoid the mistake to forget to protect an argument correctly"
argument to outweigh the downsides. We're doing this work not on
an occasional basis, but as a job. There should be a minimum
level of care everyone applies.

Jan

