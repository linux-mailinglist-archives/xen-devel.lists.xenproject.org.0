Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1F67BADAE
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 23:38:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613134.953456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoW37-00077T-2z; Thu, 05 Oct 2023 21:38:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613134.953456; Thu, 05 Oct 2023 21:38:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoW36-00074l-W0; Thu, 05 Oct 2023 21:38:24 +0000
Received: by outflank-mailman (input) for mailman id 613134;
 Thu, 05 Oct 2023 21:38:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mY76=FT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qoW35-00074M-4g
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 21:38:23 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80343dce-63c7-11ee-9b0d-b553b5be7939;
 Thu, 05 Oct 2023 23:38:20 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40566f89f6eso14082125e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Oct 2023 14:38:20 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l1-20020a5d4bc1000000b00323287186b2sm82559wrt.29.2023.10.05.14.38.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Oct 2023 14:38:18 -0700 (PDT)
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
X-Inumbo-ID: 80343dce-63c7-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1696541899; x=1697146699; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:references:cc:to:content-language:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OSoY8iBiCPhZcTbBTdsR4TuhV8wi81BnRf1PutRv5tE=;
        b=hCwl7jpsAMgc+AA8Gc3vfYN+Es35+q9wbVUS4tXKrbFvVRkhWytI9amRni9i7PMP4r
         jVP5u3DJ2vOqaKDxCgtSAVDqgLDShFD/lC9pFUpJBIcpSLaq64my2vNtdfudUYLq+DI0
         /WSI02rrX9glC+sw7N64Ayl4LZ3Vi42X6FdaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696541899; x=1697146699;
        h=in-reply-to:autocrypt:references:cc:to:content-language:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OSoY8iBiCPhZcTbBTdsR4TuhV8wi81BnRf1PutRv5tE=;
        b=FHTIlgwzTh7Rmtu7hb/JiSVsETlrbno7OdPlxGObeaQ8NbVZuSBDpPxzgWeqBv8UbN
         QhDwWZUXnjfuxFOHF6dDhk8xlkfZXvy5Wm1nAseii5N3JL4wmF9ojqrmjhiY027CGe8m
         Fio7YpqLqSEHxkr0pNXTBbUPhQsfj1uEAXBtU4sQ32ZzMvDXb8gpGWwQwh/E+1H2uMhE
         WG06DDaQxgUiT2P6Cf2VmsV+a5JqmAzzMYc2mQi0gCSHHEiZ7aRZ6c9RnHrUAEVWa5Nk
         MnmbeydApp8bZyZVTAgY7V8DMg6LPfCZWkuS/x+kgQ4/5F5BtKa+cY3pXfUSgBT/phQ/
         YbTQ==
X-Gm-Message-State: AOJu0Yxbb47sGPAHVarG7WSJpgkBH3Bh9eJZu4tQ5pzmmw9Gb6K95YUM
	3g1v4y55b7PveWwQZ0AcMOk5NA==
X-Google-Smtp-Source: AGHT+IFVgPQlxViRBXipmD8bnXvbsXLhOUgQJJCxUbWUQIUoYjK0cULab/KfPQydBb2H4C8YY31rkA==
X-Received: by 2002:a1c:7c17:0:b0:401:bcb4:f133 with SMTP id x23-20020a1c7c17000000b00401bcb4f133mr6000797wmc.22.1696541899006;
        Thu, 05 Oct 2023 14:38:19 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------ef3DVrdUzkii56b0riJoorEE"
Message-ID: <75d160be-4a8c-48c7-a972-201d78f0bdf0@citrix.com>
Date: Thu, 5 Oct 2023 22:38:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Subject: Re: SAF-x-safe rename
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "julien@xen.org" <julien@xen.org>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <alpine.DEB.2.22.394.2310041633080.2348112@ubuntu-linux-20-04-desktop>
 <9CF5DF50-B857-4B1D-A210-E6355492CC3B@arm.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9CF5DF50-B857-4B1D-A210-E6355492CC3B@arm.com>

This is a multi-part message in MIME format.
--------------ef3DVrdUzkii56b0riJoorEE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/10/2023 8:43 am, Luca Fancellu wrote:
>> On 5 Oct 2023, at 00:46, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>
>> Hi MISRA C working group (Jan, Roger, Andrew, Julien, Bertrand, George)
>>
>> in a recent thread Andrew pointed out that the SAF-2-safe tag is
>> confusing and requested a rename:
>> https://marc.info/?l=xen-devel&m=169634970821202
>>
>> As documented by docs/misra/documenting-violations.rst:
>>
>> - SAF-X-safe: This tag means that the next line of code contains a finding, but
>>   the non compliance to the checker is analysed and demonstrated to be safe.
>> - SAF-X-false-positive-<tool>: This tag means that the next line of code
>>   contains a finding, but the finding is a bug of the tool.
>>
>>
>> Today we have already 28 instances of SAF tags in the Xen codebase.
>>
>>
>> Andrew suggested "ANALYSIS" instead of SAF so I would imagine:
>> - ANALYSIS-X-safe
>> - ANALYSIS-X-false-positive-<tool>
>>
>> If we really want a rename I suggest to rename SAF to SAFE:
>> - SAFE-X-safe
>> - SAFE-X-false-positive-<tool>
>>
>> Or maybe MISRA:
>> - MISRA-X-safe
>> - MISRA-X-false-positive-<tool>
>>
>> But I actually prefer to keep the tag as it is today.
> We chose a generic name instead of MISRA because the tag can potentially suppress findings
> of any checker, including MISRA checker.
>
> If SAF-* is confusing, what about FUSA-* ?
>
> Anyway I’m thinking that every name we could come up will be confusing at first, improving the
> documentation would mitigate it (by improving I mean to improve the fruition of it, for example a
> Read the docs documentation has the search bar, a quick copy paste of SAF- would make the
> documenting-violations page visible.)

No - this is a problem *because* changing the documentation doesn't
help.   (To be clear, updating the documentation is fine, but irrelevant
here.)


These are annotations in code.  They need to be:

1) Short (obviously)
2) Clear to someone who isn't you (the collective us of this group)
reading the code.
3) Non-intrusive, so as not to get in the way of the code.

and they must be all three.  This was even a principle given at the
start of the MISRA work that we would not be deteriorating the quality
of the code just to comply.

Point 3 is other thread about end-of-line, or block regions.  Lets leave
that there because it's really a metadata transformation problem
constrained by where the comments can acceptably go.


Point 2 is the issue here, and "SAF-$N-safe" scores very highly on the
WTF-o-meter *even* for people who know that it's something related to MISRA.

Seriously it looks like someone couldn't spell, and everyone else went
with it (reflects poorly on everyone else).

And yes, I know it's an initialisation for something, but it's not even
an industry standard term - it's a contraction of an intentionally
generic phrase, with substantial irony on an early MISRA call where
there was uncertainly between people as to what it even stood for.

These are the thoughts running through the minds of people reading the
code when they don't understand what they're looking at.


Annotations for other static analysers intentionally use their own name
so they're googleable.

Guess what SAF googles for?  Sustainable Aviation Fuel, or Specialist
Automotive Finance.

Fine, lets be more specific.  How about "Xen SAF" ?  Nope...

"Did you mean to search for:
Xen SAVE Xen SAN Xen VIF Xenstaff"


Despite many of the search results referencing patches, or rendered
documents out of docs/, not a single one of them gets
documenting-violations.rst in any form, where the single definition of
this term is hiding in a paragraph which spends 90% of it's volume
describing a monotonically increasing number.

Seriously, ChatGPT would struggle to make shit this good up.


The thing we tag with *must* be trivially recognisable as an analysis
tag in order for others to be able to read the code.  Therefore, it
needs to be an actual full world (hence the ANALYSIS suggestion), or an
industry standard term (where MISRA does qualify).

I don't exactly what it is - something else might turn out to be even
better, but it is very important to be not this, for everyone else to
have an easy time reading the code.


And reasoning along that line...  What's wrong with just /* octal-ok */
or /* womble-permitted */ so it's also apparent in context what the
contentious issue might be and why it might be mitigated?

The mechanics behind the scenes is just a trivial text replacement, and
the tagging scheme does not have to uniform obfuscated identifier for
that to work.

~Andrew
--------------ef3DVrdUzkii56b0riJoorEE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 05/10/2023 8:43 am, Luca Fancellu
      wrote:<span style="white-space: pre-wrap">
</span></div>
    <blockquote type="cite"
      cite="mid:9CF5DF50-B857-4B1D-A210-E6355492CC3B@arm.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 5 Oct 2023, at 00:46, Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a> wrote:

Hi MISRA C working group (Jan, Roger, Andrew, Julien, Bertrand, George)

in a recent thread Andrew pointed out that the SAF-2-safe tag is
confusing and requested a rename:
<a class="moz-txt-link-freetext" href="https://marc.info/?l=xen-devel&amp;m=169634970821202">https://marc.info/?l=xen-devel&amp;m=169634970821202</a>

As documented by docs/misra/documenting-violations.rst:

- SAF-X-safe: This tag means that the next line of code contains a finding, but
  the non compliance to the checker is analysed and demonstrated to be safe.
- SAF-X-false-positive-&lt;tool&gt;: This tag means that the next line of code
  contains a finding, but the finding is a bug of the tool.


Today we have already 28 instances of SAF tags in the Xen codebase.


Andrew suggested "ANALYSIS" instead of SAF so I would imagine:
- ANALYSIS-X-safe
- ANALYSIS-X-false-positive-&lt;tool&gt;

If we really want a rename I suggest to rename SAF to SAFE:
- SAFE-X-safe
- SAFE-X-false-positive-&lt;tool&gt;

Or maybe MISRA:
- MISRA-X-safe
- MISRA-X-false-positive-&lt;tool&gt;

But I actually prefer to keep the tag as it is today.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
We chose a generic name instead of MISRA because the tag can potentially suppress findings
of any checker, including MISRA checker.

If SAF-* is confusing, what about FUSA-* ?

Anyway I’m thinking that every name we could come up will be confusing at first, improving the
documentation would mitigate it (by improving I mean to improve the fruition of it, for example a
Read the docs documentation has the search bar, a quick copy paste of SAF- would make the
documenting-violations page visible.)</pre>
    </blockquote>
    <br>
    No - this is a problem *because* changing the documentation doesn't
    help.   (To be clear, updating the documentation is fine, but
    irrelevant here.)<br>
    <br>
    <br>
    These are annotations in code.  They need to be:<br>
    <br>
    1) Short (obviously)<br>
    2) Clear to someone who isn't you (the collective us of this group)
    reading the code.<br>
    3) Non-intrusive, so as not to get in the way of the code.<br>
    <br>
    and they must be all three.  This was even a principle given at the
    start of the MISRA work that we would not be deteriorating the
    quality of the code just to comply.<br>
    <br>
    Point 3 is other thread about end-of-line, or block regions.  Lets
    leave that there because it's really a metadata transformation
    problem constrained by where the comments can acceptably go.<br>
    <br>
    <br>
    Point 2 is the issue here, and "SAF-$N-safe" scores very highly on
    the WTF-o-meter *even* for people who know that it's something
    related to MISRA.<br>
    <br>
    Seriously it looks like someone couldn't spell, and everyone else
    went with it (reflects poorly on everyone else).<br>
    <br>
    And yes, I know it's an initialisation for something, but it's not
    even an industry standard term - it's a contraction of an
    intentionally generic phrase, with substantial irony on an early
    MISRA call where there was uncertainly between people as to what it
    even stood for.<br>
    <br>
    These are the thoughts running through the minds of people reading
    the code when they don't understand what they're looking at.<br>
    <br>
    <br>
    Annotations for other static analysers intentionally use their own
    name so they're googleable.<br>
    <br>
    Guess what SAF googles for?  Sustainable Aviation Fuel, or
    Specialist Automotive Finance.<br>
    <br>
    Fine, lets be more specific.  How about "Xen SAF" ?  Nope...<br>
    <br>
    "Did you mean to search for:<br>
    Xen SAVE Xen SAN Xen VIF Xenstaff"<br>
    <br>
    <br>
    Despite many of the search results referencing patches, or rendered
    documents out of docs/, not a single one of them gets
    documenting-violations.rst in any form, where the single definition
    of this term is hiding in a paragraph which spends 90% of it's
    volume describing a monotonically increasing number.<br>
    <br>
    Seriously, ChatGPT would struggle to make shit this good up.<br>
    <br>
    <br>
    The thing we tag with *must* be trivially recognisable as an
    analysis tag in order for others to be able to read the code. 
    Therefore, it needs to be an actual full world (hence the ANALYSIS
    suggestion), or an industry standard term (where MISRA does
    qualify).<br>
    <br>
    I don't exactly what it is - something else might turn out to be
    even better, but it is very important to be not this, for everyone
    else to have an easy time reading the code.<br>
    <br>
    <br>
    And reasoning along that line...  What's wrong with just /* octal-ok
    */ or /* womble-permitted */ so it's also apparent in context what
    the contentious issue might be and why it might be mitigated?<br>
    <br>
    The mechanics behind the scenes is just a trivial text replacement,
    and the tagging scheme does not have to uniform obfuscated
    identifier for that to work.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------ef3DVrdUzkii56b0riJoorEE--

