Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FE7A707A1
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 18:04:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926767.1329598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx7hJ-0008CP-Sg; Tue, 25 Mar 2025 17:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926767.1329598; Tue, 25 Mar 2025 17:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx7hJ-0008AX-Po; Tue, 25 Mar 2025 17:04:17 +0000
Received: by outflank-mailman (input) for mailman id 926767;
 Tue, 25 Mar 2025 17:04:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ogJ6=WM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tx7hH-0008AR-Lb
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 17:04:15 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d68a7fc-099b-11f0-9ffa-bf95429c2676;
 Tue, 25 Mar 2025 18:04:13 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5e5e0caa151so10516437a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 10:04:13 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ebccf89240sm7942193a12.31.2025.03.25.10.04.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 10:04:12 -0700 (PDT)
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
X-Inumbo-ID: 2d68a7fc-099b-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742922253; x=1743527053; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DsTq9LYeqZRm0Y/urEFIhygv9dSmRUM5rmlSWejk8yA=;
        b=LROKq10Nu0B6K2zhNcBhJ0SdkjkEdMWbf5DeNoibsnqsMz7YufDJ4ikLuAL3posXYk
         Us1JkW99ilCecz53i0uwDMnHJur4c+IuyENEiVcZwTxCNnMYQIBERpiRcH+8LZpZWhta
         9JLZoJbYUPh7yiIPQaMgUQuK8JBPkJdQOABqLp2qjGFkcIYCtlk7nKZdAoTZy95LgskD
         ihAs7qR2pzMOBpDdfkrIxRFuuveq97ZdOvRHdQE2tc3Uw420SUUN1hrqfKVxcHrCDg9w
         fh2PXrEMJa7hGtHX2sLZtb0ipHo3R9IQ/guBvDFyjUjrqXVqqk8IO0FIbhQewPsbJNIm
         eBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742922253; x=1743527053;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DsTq9LYeqZRm0Y/urEFIhygv9dSmRUM5rmlSWejk8yA=;
        b=ks4djsr2+pcitLlur0VnI/mMEM8B59pr/sV6LQlCrP1UmS3hsTbywycDDRL2HD8gzK
         spMvvMzO57EnMg/UxcrJbcntuds5YYB6dUIUhSUygR3zXWcat+lze//26/NQGDSRIkTn
         +L23I+S5PUsmkegLY9Q1GE/ERDwWNze9G8rpcwWknWmVD490yENtEi+vz9DB4y1qLITS
         1xVhu74XVtUSa/ASP1PlG4xmzAan6btKRJF7j88Sa7AqiByxSGSFiXC4t7eDe4u5vqoT
         tLh4Z/KkND/EIixo5IJGOHZ8udF6712Bzr+Y0oofzDnE152orPDTytjoPRzw742XIWcY
         v15w==
X-Gm-Message-State: AOJu0Yyp27olhzpzjn/WY3qejbDQ1Y0iayTqyVp+hrLfknuOXGaR9h9N
	mnDU2FX+MPEBo16/N4qkdyhBqfhBq0GZ9fIBNALaYPVrj+mDyrdx
X-Gm-Gg: ASbGncvO11HkYAhF9PTwYd2+/2c/WN2jh1NpfcDkKJU+tML7n4xJsX87PeQGgngMhNl
	eArZ2k4/vB0g/fwye2O4CfjGnbobSy+5jgqUFi+RT8U210jgbTLBWRYqkgcm+CWVD3aoWERZNdi
	N/yRNA7qqwgw6+7NrSlcWsGwxQFr73yPkpyW0Nzxc1utN/fWj9m04QkQBZr5GWQ5wEYblgs12tn
	h8DEcf0HmoUvpACAb/psTD55u5GZTkU2da+6Mne1xRM1k5oahrHSXUpJ0alcQ+QOohtC45yhGPz
	v5r5GjA2QeBhk8r3EY+DwJHpdfW8JQUboZj0Ghypi1sCWKF+yzddExoLNHJFfchBfy3F+cg+ssy
	iLDEtQpUFko+6rE8Hvveg
X-Google-Smtp-Source: AGHT+IHlxpUP4bP4UiR+h/4GZGtq/W0LaatklngHqb8k6O3g0elrBxmSW8mkO7Et+vFi0u4SRNv+ZQ==
X-Received: by 2002:a05:6402:2399:b0:5ec:c982:7efe with SMTP id 4fb4d7f45d1cf-5ecc9827f70mr4980201a12.14.1742922252583;
        Tue, 25 Mar 2025 10:04:12 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------VCEwCpqhbsUxNQCoGCDzsb03"
Message-ID: <a852cb38-79fc-4b9d-b0a0-b69e277c2b82@gmail.com>
Date: Tue, 25 Mar 2025 18:04:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISCV/bitops: Use Zbb to provide arch-optimised bitops
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250226172050.1300771-1-andrew.cooper3@citrix.com>
 <113b2464-c7b2-4068-a179-707cba4f3835@suse.com>
 <50cd2332-11b7-4b64-85ea-489c416098f9@citrix.com>
 <db2073b0-8585-4518-9467-b7da4cefbbae@suse.com>
 <8dff5fb9-b46f-47bf-a6ee-863282155706@citrix.com>
 <295f59af-ebb8-4ad5-bf27-ec0ea5a2c2fe@gmail.com>
 <927264c2-0b99-4d60-97f8-31bcd0d64aa6@suse.com>
 <a7f05789-cf1a-474f-b619-80a7e890a579@citrix.com>
 <7cfbd773-de4b-459f-8fa9-7c6ed19fe0ad@gmail.com>
 <52bd483a-c5bf-4eba-867f-3476b1b86550@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <52bd483a-c5bf-4eba-867f-3476b1b86550@suse.com>

This is a multi-part message in MIME format.
--------------VCEwCpqhbsUxNQCoGCDzsb03
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/25/25 5:46 PM, Jan Beulich wrote:
> On 25.03.2025 17:35, Oleksii Kurochko wrote:
>> On 3/7/25 1:12 PM, Andrew Cooper wrote:
>>> On 07/03/2025 12:01 pm, Jan Beulich wrote:
>>>> On 07.03.2025 12:50, Oleksii Kurochko wrote:
>>>>> On 3/6/25 9:19 PM, Andrew Cooper wrote:
>>>>>> On 05/03/2025 7:34 am, Jan Beulich wrote:
>>>>>>> I was actually hoping to eliminate BITS_PER_LONG at some point, in favor
>>>>>>> of using sizeof(long) * BITS_PER_BYTE. (Surely in common code we could
>>>>>>> retain a shorthand of that name, if so desired, but I see no reason why
>>>>>>> each arch would need to provide all three BITS_PER_{BYTE,INT,LONG}.)
>>>>>> The concern is legibility and clarity.
>>>>>>
>>>>>> This:
>>>>>>
>>>>>>        ((x) ? 32 - __builtin_clz(x) : 0)
>>>>>>
>>>>>> is a clear expression in a way that this:
>>>>>>
>>>>>>        ((x) ? (sizeof(int) * BITS_PER_BYTE) - __builtin_clz(x) : 0)
>>>>>>
>>>>>> is not.  The problem is the extra binary expression, and this:
>>>>>>
>>>>>>        ((x) ? BITS_PER_INT - __builtin_clz(x) : 0)
>>>>>>
>>>>>> is still clear, because the reader doesn't have to perform a multiply to
>>>>>> just to figure out what's going on.
>>>>>>
>>>>>>
>>>>>> It is definitely stupid to have each architecture provide their own
>>>>>> BITS_PER_*.  The compiler is in a superior position to provide those
>>>>>> details, and it should be in a common location.
>>>>>>
>>>>>> I don't particularly mind how those constants are derived, but one key
>>>>>> thing that BITS_PER_* can do which sizeof() can't is be used in #ifdef/etc.
>>>>> What about moving them to xen/config.h? (if it isn't the best one place, any suggestion which is better?)
>>>>>
>>>>> #define BYTES_PER_INT  (1 << INT_BYTEORDER)
>>>>> #define BITS_PER_INT  (BYTES_PER_INT << 3)
>>>>>
>>>>> #define BYTES_PER_LONG (1 << LONG_BYTEORDER)
>>>>> #define BITS_PER_LONG (BYTES_PER_LONG << 3)
>>>>> #define BITS_PER_BYTE 8
>>> The *_BYTEORDER's are useless indirection.  BITS_PER_* should be defined
>>> straight up, and this will simplify quite a lot of preprocessing.
>> Could we really drop *_BYTEORDER?
>>
>> For example, LONG_BYTEORDER for Arm could be either 2 or 3 depends on Arm32 or Arm64 is used.
> The can still #define BITS_PER_LONG to 32 or 64 respectively, can't they?

Yes, but then if we want to move it to xen/config.h then it will be needed to:
in Arm's asm/config.h to have something like:
   #ifdef CONFIG_ARM_32
       #define BITS_PER_LONG 32
   #endif

and then in xen/config.h
   #ifndef BITS_PER_LONG
       #define BITS_PER_LONG 64
   #endif

But I wanted to not have #ifndef BITS_PER_LONG in xen/config.h. (or using CONFIG_ARM_32 in xen/config.h)

If it is okay to have this #ifndef in xen/config.h then we can do in that way.

>
>>>>> Also, it seems like the follwoing could be moved there too:
>>>>>
>>>>> #define POINTER_ALIGN  BYTES_PER_LONG
>>>> This one is likely fine to move.
>>>>
>>>>> #define BITS_PER_LLONG 64
>>>> This one is only fine to move imo when converted to
>>>>
>>>> #define BITS_PER_LONG (BYTES_PER_LLONG << 3)
>>> Erm?  That's mixing long and long long types.  Presuming that's an
>>> errant L, then sure.
>>>
>>>>> #define BITS_PER_BYTE 8
>>>> Personally I'd rather leave this per-arch. The others can truly be derived;
>>>> this one can't be. If we centralize, imo we should also convert the " << 3"
>>>> to " * BITS_PER_BYTE".
>>> It is highly unlikely that Xen will ever run on a system where CHAR_BIT
>>> isn't 8.
>>>
>>> So I suggest it stays central to reduce complexity.  If an arch ever
>>> needs to change it, the complexity can be added then.
>> Does it make sense to ifdef that? Or, at least, before defintion of BITS_PER_BYTE something like:
>> #if CHAR_BIT != 8
>> #error "CHAR_BIT isn't 8"
>> #endif
> Where would CHAR_BIT come from? Oh, perhaps you mean __CHAR_BIT__? If all
> compilers we can build with supply that value, we could indeed centrally
> use either
>
> #define BITS_PER_BYTE __CHAR_BIT__
>
> or
>
> #define BITS_PER_BYTE 8
> #if BITS_PER_BYTE != __CHAR_BIT__
> # error "..."
> #endif

Sorry, I meant __CHAR_BIT__.

Thanks.

~ Oleksii

--------------VCEwCpqhbsUxNQCoGCDzsb03
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/25/25 5:46 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:52bd483a-c5bf-4eba-867f-3476b1b86550@suse.com">
      <pre wrap="" class="moz-quote-pre">On 25.03.2025 17:35, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 3/7/25 1:12 PM, Andrew Cooper wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 07/03/2025 12:01 pm, Jan Beulich wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 07.03.2025 12:50, Oleksii Kurochko wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On 3/6/25 9:19 PM, Andrew Cooper wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">On 05/03/2025 7:34 am, Jan Beulich wrote:
</pre>
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">I was actually hoping to eliminate BITS_PER_LONG at some point, in favor
of using sizeof(long) * BITS_PER_BYTE. (Surely in common code we could
retain a shorthand of that name, if so desired, but I see no reason why
each arch would need to provide all three BITS_PER_{BYTE,INT,LONG}.)
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">The concern is legibility and clarity.

This:

      ((x) ? 32 - __builtin_clz(x) : 0)

is a clear expression in a way that this:

      ((x) ? (sizeof(int) * BITS_PER_BYTE) - __builtin_clz(x) : 0)

is not.  The problem is the extra binary expression, and this:

      ((x) ? BITS_PER_INT - __builtin_clz(x) : 0)

is still clear, because the reader doesn't have to perform a multiply to
just to figure out what's going on.


It is definitely stupid to have each architecture provide their own
BITS_PER_*.  The compiler is in a superior position to provide those
details, and it should be in a common location.

I don't particularly mind how those constants are derived, but one key
thing that BITS_PER_* can do which sizeof() can't is be used in #ifdef/etc.
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">What about moving them to xen/config.h? (if it isn't the best one place, any suggestion which is better?)

#define BYTES_PER_INT  (1 &lt;&lt; INT_BYTEORDER)
#define BITS_PER_INT  (BYTES_PER_INT &lt;&lt; 3)

#define BYTES_PER_LONG (1 &lt;&lt; LONG_BYTEORDER)
#define BITS_PER_LONG (BYTES_PER_LONG &lt;&lt; 3)
#define BITS_PER_BYTE 8
</pre>
            </blockquote>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">The *_BYTEORDER's are useless indirection.  BITS_PER_* should be defined
straight up, and this will simplify quite a lot of preprocessing.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Could we really drop *_BYTEORDER?

For example, LONG_BYTEORDER for Arm could be either 2 or 3 depends on Arm32 or Arm64 is used.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The can still #define BITS_PER_LONG to 32 or 64 respectively, can't they?</pre>
    </blockquote>
    <pre>Yes, but then if we want to move it to xen/config.h then it will be needed to:
in Arm's asm/config.h to have something like:
  #ifdef CONFIG_ARM_32
      #define BITS_PER_LONG 32
  #endif

and then in xen/config.h
  #ifndef BITS_PER_LONG
      #define BITS_PER_LONG 64
  #endif

But I wanted to not have #ifndef BITS_PER_LONG in xen/config.h. (or using CONFIG_ARM_32 in xen/config.h)

If it is okay to have this #ifndef in xen/config.h then we can do in that way.

</pre>
    <blockquote type="cite"
      cite="mid:52bd483a-c5bf-4eba-867f-3476b1b86550@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">Also, it seems like the follwoing could be moved there too:

#define POINTER_ALIGN  BYTES_PER_LONG
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">This one is likely fine to move.

</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">#define BITS_PER_LLONG 64
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">This one is only fine to move imo when converted to

#define BITS_PER_LONG (BYTES_PER_LLONG &lt;&lt; 3)
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Erm?  That's mixing long and long long types.  Presuming that's an
errant L, then sure.

</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">#define BITS_PER_BYTE 8
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Personally I'd rather leave this per-arch. The others can truly be derived;
this one can't be. If we centralize, imo we should also convert the " &lt;&lt; 3"
to " * BITS_PER_BYTE".
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">It is highly unlikely that Xen will ever run on a system where CHAR_BIT
isn't 8.

So I suggest it stays central to reduce complexity.  If an arch ever
needs to change it, the complexity can be added then.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Does it make sense to ifdef that? Or, at least, before defintion of BITS_PER_BYTE something like:
#if CHAR_BIT != 8
#error "CHAR_BIT isn't 8"
#endif
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Where would CHAR_BIT come from? Oh, perhaps you mean __CHAR_BIT__? If all
compilers we can build with supply that value, we could indeed centrally
use either

#define BITS_PER_BYTE __CHAR_BIT__

or

#define BITS_PER_BYTE 8
#if BITS_PER_BYTE != __CHAR_BIT__
# error "..."
#endif</pre>
    </blockquote>
    <pre>Sorry, I meant __CHAR_BIT__.

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------VCEwCpqhbsUxNQCoGCDzsb03--

