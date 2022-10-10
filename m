Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1485F9D0A
	for <lists+xen-devel@lfdr.de>; Mon, 10 Oct 2022 12:49:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419204.663967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohqKl-0004Lc-HG; Mon, 10 Oct 2022 10:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419204.663967; Mon, 10 Oct 2022 10:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohqKl-0004JO-EO; Mon, 10 Oct 2022 10:48:31 +0000
Received: by outflank-mailman (input) for mailman id 419204;
 Mon, 10 Oct 2022 10:48:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bLGv=2L=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1ohqKj-0004JH-Oy
 for xen-devel@lists.xenproject.org; Mon, 10 Oct 2022 10:48:29 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1265cd82-4889-11ed-9377-c1cf23e5d27e;
 Mon, 10 Oct 2022 12:48:27 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id k2so24028006ejr.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Oct 2022 03:48:27 -0700 (PDT)
Received: from [192.168.1.93] (adsl-75.176.58.241.tellas.gr. [176.58.241.75])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a50cd49000000b0043bbb3535d6sm6943881edj.66.2022.10.10.03.48.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Oct 2022 03:48:26 -0700 (PDT)
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
X-Inumbo-ID: 1265cd82-4889-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/m8cPN/80S1OIhTrMIUFxGtQ8bvuTGNRYFePTvQwocw=;
        b=IRK5TZwwAvQ+Vlbw24wW/SxGXRajfXcbnllTa8pIf4veYXbIjURZx6mjTOqUm16DY4
         f7uXGaF+77IxG5lXHYdkAMlgusP8Xxg6ziFNKqOw2IJggkXK8MfFUZHxMwEjfUGlWWCa
         BGmy7+qFYz2rSFleRkxecpOKKpCu1mbutTTgGJK44eepljEq6cgxlkgdWydemnJiuszf
         vdRHJST78XzXo8A3GzKviWS8J7mV8VlLgEXYPLfv2SZfnGXes4aiv8NLpbXBsCM0bjUB
         TIl2KHQnGKo0RFFiYG7grIeeB5zK4Vu2noGHZHEboJYINzTiO720EPnRyPp7aUtwCpF/
         WYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/m8cPN/80S1OIhTrMIUFxGtQ8bvuTGNRYFePTvQwocw=;
        b=rjheu9TQgu9JxfyQo2WpkvsqJ0PenrMkwatft+ZqP11lGFP7pktB+L9RdqeBwHh4cy
         l37J0+hC66JbJeiPYOm8k22TkUIblfTVj+jE32vtxP/bVEFEriAQ1Wp3+yGtRV7eYkdJ
         BiyD2u2RwxKIQCtVkdpFMi4wiXEz/YcPB4gfXkW5P/lHPWS58BlA+HKR7TXWqfc5u2YS
         rvKiy/tAV3AcptIuSsjhkyPiGnyUyhcrFnZEkVVyTOwcv2VPHDcR69djmx/m+LkgVpjK
         ooCNKmjtuD08NpKtEIUBq6BH7uGUF4SMwFhlC+2O8zbdHMuZM9oylP9yWYSeeJ+ap2Py
         7O1A==
X-Gm-Message-State: ACrzQf1PHOYY4HdSX6K3fdrstbofyJ9IoKMx0ZlqzuZAiRJ3RUbl81cY
	XxkMBGj/5kry7fFuA/6beQ46xcaYJI02hg==
X-Google-Smtp-Source: AMsMyM63vDgQpimP5OFrEy6pXvR08tkb87zbwtyLlCJ0yd4gWH6UDuIWZ7bDe5MvAU5nyQJp4oIzJQ==
X-Received: by 2002:a17:906:d550:b0:78d:a6d4:c18f with SMTP id cr16-20020a170906d55000b0078da6d4c18fmr5593488ejc.113.1665398907086;
        Mon, 10 Oct 2022 03:48:27 -0700 (PDT)
Message-ID: <81ac614e-ca88-5f14-bd76-eaa20c9270bc@gmail.com>
Date: Mon, 10 Oct 2022 13:48:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [ImageBuilder v2] Add support for 64-bit addresses/sizes
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org
References: <20221010072947.8300-1-michal.orzel@amd.com>
 <4fc23936-4bfd-635c-b3a2-554e280ce884@gmail.com>
 <f052cf3f-529c-2156-f058-2a320a4f1b02@amd.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <f052cf3f-529c-2156-f058-2a320a4f1b02@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/10/22 12:48, Michal Orzel wrote:
> Hi Xenia,
> 
> On 10/10/2022 10:52, Xenia Ragiadakou wrote:
>>
>>
>> On 10/10/22 10:29, Michal Orzel wrote:
>>
>> Hi Michal
>>
>>> At the moment, ImageBuilder assumes that all addresses/sizes are
>>> 32-bit max. It sets #{address,size}-cells to 0x2 and puts 0x0 as the
>>> value for the first cell. Because of that, we cannot specify
>>> MEMORY_START and MEMORY_END to be above 32-bits (e.g. to place the images
>>> in the upper memory bank).
>>>
>>> Add support to properly handle 64-bit addresses/sizes:
>>>    - add function split_into_halves to split the value passed as a first
>>>      argument into upper and lower halves. These are then set as values for
>>>      variables passed respetively as the second and third argument,
>>
>> s/respetively/respectively/
> Ok.
> 
>>
>>>    - add function split_addr_size to split address and size and form a
>>>      string to be passed to dt_set as data argument for reg property.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>> Changes in v2:
>>> - redesign a patch based on master-next instead of NXP dynamic assignment patch
>>> ---
>>>    scripts/uboot-script-gen | 33 ++++++++++++++++++++++++++++-----
>>>    1 file changed, 28 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>>> index b24dca2b7f7e..09d237d192c1 100755
>>> --- a/scripts/uboot-script-gen
>>> +++ b/scripts/uboot-script-gen
>>> @@ -22,6 +22,29 @@ function dt_mknode()
>>>        fi
>>>    }
>>>
>>> +# Usage:
>>> +# split_into_halves <value> <variable_to_store_upper> <variable_to_store_lower>
>>> +function split_into_halves()
>>> +{
>>> +    local value=$1
>>> +    local upper=$2
>>> +    local lower=$3
>>> +
>>> +    eval "$upper=$(printf "0x%X\n" $(($value >> 32)))"
>>> +    eval "$lower=$(printf "0x%X\n" $(($value & 0xFFFFFFFF)))"
>>> +}
>>> +
>>> +function split_addr_size()
>>> +{
>>> +    local addr=$1
>>> +    local size=$2
>>> +
>>> +    split_into_halves $addr addr_upper addr_lower
>>> +    split_into_halves $size size_upper size_lower
>>> +
>>
>> Just a minor observation, the variables addr_upper, addr_lower,
>> size_upper and size_lower can be declared local.
>>
> This function is to be called to perform substitution and as such
> is always executed within a subshell so no need for local.

So split_addr_size() is supposed to be executed only in a subshell ... 
Ok I did not think of that. So neither addr or size need to be declared 
local.

-- 
Xenia

