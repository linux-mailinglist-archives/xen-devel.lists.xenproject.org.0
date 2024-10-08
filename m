Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A35BF995073
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 15:42:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813126.1225930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syASo-0002pk-BH; Tue, 08 Oct 2024 13:41:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813126.1225930; Tue, 08 Oct 2024 13:41:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syASo-0002o3-8O; Tue, 08 Oct 2024 13:41:22 +0000
Received: by outflank-mailman (input) for mailman id 813126;
 Tue, 08 Oct 2024 13:41:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vy9o=RE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syASn-0002nx-FC
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 13:41:21 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 000d9a16-857b-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 15:41:20 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a993302fa02so400892866b.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 06:41:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a995a54ddf3sm221652866b.216.2024.10.08.06.41.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 06:41:19 -0700 (PDT)
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
X-Inumbo-ID: 000d9a16-857b-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728394879; x=1728999679; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L3sqw8HRXhg+hOWbbpSW0F4f+e9mw+hASKZAV9R8+Eo=;
        b=CkGs6Bx5r499nrzMVDCjVlLd3Fel0CaKNRdg01E7ea3XdyfI9AUJZffN0uGKKg08y1
         /JNC+mjQ8lvZsTrFjJMBc1QVnXUlIj+XktI/CAzpV2WRzyVnfXrWjHkdBt3Rfia6/42g
         YK8XMyH/4XmTJSf/b8kEb+vDUMnYC5GsAwO9yLATcT/ZnOvMmZPorZWaOLKGsBrIbHCf
         kpvEupj0vT2KmHNJ3gpHo+FjHZxRlP9JQpnKeQXjNMcjRAjO2yvYMyzcyWT5pr32fun9
         XyW5uAKMQl7BSZB9itIcQ+nGZSGNkHN+Ht+sN3VI5JMdmgGG/2AAuOn2bX7Gu8Np0eVx
         meVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728394879; x=1728999679;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3sqw8HRXhg+hOWbbpSW0F4f+e9mw+hASKZAV9R8+Eo=;
        b=vaqRXvG2BVaqm0zAMRqpy9O8cywMe39XjJvHqsYPEueUmFNhQikKJxQTxh4dpsbBKH
         F7BkHI3rBIzuO/Z6qupJqhG1TxBdNXCj9dZOJQV6JgngsiiKNkNHWnijwXcImo7sDmA3
         KAWI5tCMzABsqfB5O2xVgxD7dsuyq/IP5xOW7ea/bRthE8OPoqPuoesF9Q/KMcROC2qR
         CRxfuMPGyHrdWP8x4zUawLzKERG7eNXODQ1/NMQvf/gw1zKXkCZ3k/PNyhG22241vqf2
         wJex29ZNP1prap/tMiGBuVLTepyF+OTMTkwEk+S0XCXI/qxRAod1mb28DqwHb6JW1alH
         eqMg==
X-Forwarded-Encrypted: i=1; AJvYcCXCji2/b7a66TvzOsOEXbFdtFjtpmdlWX8uORqmblRsZKKy84eLwv0mOs/TjUY4uiT4DLUl3U5cqUs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybwCXnfVfdwE+/Sq/NPsILIFwctw1bjjtYvdbvTxWu/2tqd/J2
	7K38tDd1ubU91tLIjZR79UG0TzkHm00BN/lUYb41/x0GfKBgRPT6KTRjrSuH6g==
X-Google-Smtp-Source: AGHT+IGb9LYcchxmoAAyUYZg784v5w+9W2z2QYdp2aTp7Ldw99cmOzBiLk2raquEv3TJEbiUZ8Go+w==
X-Received: by 2002:a17:907:e9f:b0:a99:501c:b841 with SMTP id a640c23a62f3a-a99501cb8f4mr710252466b.28.1728394879364;
        Tue, 08 Oct 2024 06:41:19 -0700 (PDT)
Message-ID: <1a090bce-69a7-4a72-b1f4-86608fefc789@suse.com>
Date: Tue, 8 Oct 2024 15:41:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/3] EFI: address a violation of MISRA C Rule 13.6
To: Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1727690180.git.federico.serafini@bugseng.com>
 <c447f9faf0283bc6b83bbfbf05acd7acca00762d.1727690180.git.federico.serafini@bugseng.com>
 <b4fafd2c-d71a-4336-b009-07f3474f5a04@suse.com>
 <a8dfe133-6f9b-4a26-918b-d0531d6af918@bugseng.com>
 <8d5e4761-9fc2-4e18-a6c2-9df1822dbbea@suse.com>
 <alpine.DEB.2.22.394.2410011431360.451631@ubuntu-linux-20-04-desktop>
 <02833aad-d6f1-4ffa-8d4a-d8c31e9b0524@suse.com>
 <2f51a8e7-4044-4a84-a541-100799a28012@bugseng.com>
 <1f8f6a0c-980f-43cb-9967-801641f8dbc0@suse.com>
 <9adf139f-cfa4-4e71-a02b-5b7cff898d01@bugseng.com>
Content-Language: en-US
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
In-Reply-To: <9adf139f-cfa4-4e71-a02b-5b7cff898d01@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.10.2024 14:49, Roberto Bagnara wrote:
> On 2024-10-08 07:59, Jan Beulich wrote:
>> On 02.10.2024 08:54, Roberto Bagnara wrote:
>>> On 2024-10-02 08:09, Jan Beulich wrote:
>>>> On 01.10.2024 23:36, Stefano Stabellini wrote:
>>>>> On Tue, 1 Oct 2024, Jan Beulich wrote:
>>>>>> On 01.10.2024 07:25, Roberto Bagnara wrote:
>>>>>>> On 2024-09-30 15:07, Jan Beulich wrote:
>>>>>>>> On 30.09.2024 14:49, Federico Serafini wrote:
>>>>>>>>> guest_handle_ok()'s expansion contains a sizeof() involving its
>>>>>>>>> first argument which is guest_handle_cast().
>>>>>>>>> The expansion of the latter, in turn, contains a variable
>>>>>>>>> initialization.
>>>>>>>>>
>>>>>>>>> Since MISRA considers the initialization (even of a local variable)
>>>>>>>>> a side effect, the chain of expansions mentioned above violates
>>>>>>>>> MISRA C:2012 Rule 13.6 (The operand of the `sizeof' operator shall not
>>>>>>>>> contain any expression which has potential side effect).
>>>>>>>>
>>>>>>>> I'm afraid I need to ask for clarification of terminology and alike here.
>>>>>>>> While the Misra doc has a section on Persistent Side Effects in its
>>>>>>>> Glossary appendix, what constitutes a side effect from its pov isn't
>>>>>>>> really spelled out anywhere. Which in turn raises the question whether it
>>>>>>>> is indeed Misra (and not just Eclair) which deems initialization a side
>>>>>>>> effect. This is even more so relevant as 13.6 talks of only expressions,
>>>>>>>> yet initializers fall under declarations (in turn involving an expression
>>>>>>>> on the rhs of the equal sign).
>>>>>>>>
>>>>>>>> All the same of course affects patch 2 then, too.
>>>>>>>
>>>>>>> MISRA C leaves the definition of "side effect" to the C Standard.
>>>>>>> E.g., C18 5.1.2.3p2:
>>>>>>>
>>>>>>>      Accessing a volatile object, modifying an object, modifying a file,
>>>>>>>      or calling a function that does any of those operations are all
>>>>>>>      side effects,[omitted irrelevant footnote reference] which are
>>>>>>>      changes in the state of the execution environment.
>>>>>>>
>>>>>>> The MISRA C:2012/2023 Glossary entry for "Persistent side effect"
>>>>>>> indirectly confirms that initialization is always a side effect.
>>>>>>
>>>>>> Hmm, that's interesting: There's indeed an example with an initializer
>>>>>> there. Yet to me the text you quote from the C standard does not say
>>>>>> that initialization is a side effect - it would be "modifying an
>>>>>> object" aiui, yet ahead of initialization being complete the object
>>>>>> doesn't "exist" imo, and hence can be "modified" only afterwards.
>>>>>
>>>>> I feel it's becoming a bit too philosophical. Since there's some room
>>>>> for interpretation and only two violations left to address, I believe
>>>>> it's best to stick with the stricter interpretation of the definition.
>>>>> Therefore, I'd proceed with this series in its current form.
>>>>
>>>> Proceeding with the series in its current form may be okay (as you say,
>>>> you view the changes as readability improvements anyway), but imo the
>>>> interpretation needs settling on no matter what. In fact even for these
>>>> two patches it may affect what their descriptions ought to say (would
>>>> be nice imo to avoid permanently recording potentially misleading
>>>> information by committing as is). And of course clarity would help
>>>> dealing with future instances that might appear. I take it you realize
>>>> that if someone had submitted a patch adding code similar to the
>>>> original forms of what's being altered here, it would be relatively
>>>> unlikely for a reviewer to spot the issue. IOW here we're making
>>>> ourselves heavily dependent upon Eclair spotting (supposed) issues,
>>>> adding extra work and delays for such changes to go in.
>>>
>>> You can do two things to obtain a second opinion:
>>>
>>> 1) Use the MISRA forum (here is the link to the forum
>>>      section devoted to the side-effect rules of MISRA C:2012
>>>      and MISRA C:2023 (https://forum.misra.org.uk/forumdisplay.php?fid=168).
>>>      The MISRA C Working Group will, in due course, provide
>>>      you with an official answer to your questions about what,
>>>      for the interpretation of Rule 13.6, has to be considered
>>>      a side effect.
>>>
>>> 2) Reach out to your ISO National Body and try to obtain
>>>      an official answer from ISO/IEC JTC1/SC22/WG14 (the
>>>      international standardization working group for the
>>>      programming language C) to your questions about what the
>>>      C Standard considers to be side effects.
>>
>> I took the latter route, and to my (positive) surprise I got back an answer
>> the same day. There was a request for someone to confirm, but so far I didn't
>> see further replies. Since this is a German institution I raised the question
>> in German and got back an answer in German (attached); I've tried my best to
>> translate this without falsifying anything, but I've omitted non-technical
>> parts:
>>
>> "Initialization of an object is never a side effect of the initialization
>> by itself. Of course expressions used for initialization can themselves have
>> side effects on other objects.
>>
>> @Andreas: Do you agree? C after all has a far simpler object model than C++.
>> The (potential) change in object representation (i.e. the bytes underlying
>> the object) is not a side effect of object initialization, but its primary
>> purpose."
>>
>> Further for Misra she added a reference to a Swiss person, but I think with
>> Bugseng we have sufficient expertise there.
> 
> Unfortunately, the (translation of the) answer you received adds
> confusion to previous confusion: who answered has highlighted the
> "side" part of the term, which is indeed relevant in computer science,
> but not for the C standard.

I can't see any highlighting in the original reply I received.

>  To the point that the same argument could
> be used to deny that ++i has a side effect because the increment is
> the "primary" effect...

Well, if it's just "++i;" there's no side effect, just a primary one. In
"n = ++i + j--;" there are side effects (the increment and decrement).

> Part of the confusion is maybe in the the following paragraph Jan
> wrote earlier:
> 
>  > Hmm, that's interesting: There's indeed an example with an initializer
>  > there. Yet to me the text you quote from the C standard does not say
>  > that initialization is a side effect - it would be "modifying an
>  > object" aiui, yet ahead of initialization being complete the object
>  > doesn't "exist" imo, and hence can be "modified" only afterwards.
> 
> In C, it is not true that the object does not exist ahead of
> initialization.

I quoted "exist" for that reason. Of course the object's lifetime starts
with its declaration. It just has indeterminate value at that point.

>  Try the following:
> 
> extern int f(int* p);
> 
> int main() {
>    int i = f(&i);
> }

Which to me falls under "Of course expressions used for initialization
can themselves have side effects on other objects." Just that "other"
isn't quite right here.

Jan

