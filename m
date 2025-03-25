Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9660A70703
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 17:36:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926692.1329529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx7Fp-0005tx-75; Tue, 25 Mar 2025 16:35:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926692.1329529; Tue, 25 Mar 2025 16:35:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx7Fp-0005s5-4N; Tue, 25 Mar 2025 16:35:53 +0000
Received: by outflank-mailman (input) for mailman id 926692;
 Tue, 25 Mar 2025 16:35:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ogJ6=WM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tx7Fn-0005rx-HC
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 16:35:51 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3626ec78-0997-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 17:35:50 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-abec8b750ebso1066280766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 09:35:50 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efbd3d25sm875226066b.125.2025.03.25.09.35.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 09:35:49 -0700 (PDT)
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
X-Inumbo-ID: 3626ec78-0997-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742920550; x=1743525350; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwmCkfioYO61w5s0JKfSQqcxqsT4neLWRjigXwzHRAk=;
        b=kr/I69/7E6LU131eRT6ewK9nHLXh+rFgxE/U8eme7MgQv4E2ehQ6kTqCshI7ZIV0sI
         Mhv1YHlvMVQliW1RBEcJBFo75AjzxbKnUvUEZizStdytquQdmXfLmwB/ATzKprLU/Ggp
         JQDgDSEAQUq3jXgjNmRXhGhPNxDIEtXBYzPFEFMHw5WzHlzvHCP3De5QBVyjbkwgamlx
         l2+Po9ntGVWMO/Vf2iuEB6GNxFvQTLXPqUkAHiHCDDQA+Nm2AlY7/8WREAzSuY6v8n8/
         Xva1JV5YFTObwD62Yp9CjOsF/Mx0Akk5wkLGMImglx7oN9mxAbpDPLI9fE9Hp4QhYOu5
         KtKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742920550; x=1743525350;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nwmCkfioYO61w5s0JKfSQqcxqsT4neLWRjigXwzHRAk=;
        b=OmELHmlqMi0IuEs/cCefcaMRdR3keDvkxaDDnclWGRxIow2BHLyaBFGY3p6gdWTZGk
         J4IQQlciM1QMpphXbooQNtxEPVe8ItZOOuxAApWTX3GhV2Qu+y3jsJsdTbYpVEteT7rr
         RcsDkO+5POvpDCraYPDe50VCmowqJ7G656moSrEjM083Oe5MSx5WdwJf7iUPstbiI8ti
         klG7GrQv8VzE+Fb6ZkmIBfanX8dplCF0/loePftWBMYUI79nHJvt9rjsibYyZJfj1Mbh
         L9EaVu8KEZAditKMK/OYvnhQpBBcEBFRiFZ/8KDNrdESggVY9G4WkA6RVw8poJ9wZvTp
         uDEg==
X-Gm-Message-State: AOJu0YzZ8pNjPnNxNo6gLmL8MxhBRpp4HT9rKkkH8WuBmuTp6GZ8b6Df
	fPRJ0EUQoEVp8GRLXSu3L1wnmg2ltmlYNVez7qWx7EvXqOCUoMa9
X-Gm-Gg: ASbGncscD/Ltr4vqa4wLvRFXkzqJ/8Em/IugUdhFlMk1T2iF50+P4zhhNG1XGkOgDia
	qDDw0hmEUtWh236n3UPp+4uPQdvqfLaCIE03FJ9OGbmjb9u+ujuFIXW8fRIRfA2ZIEmDNQOYFNn
	6HgkV2UbHVeVn2w0c7fHwTaVyBDIJm9n7P0w8yqo4stVD+MrZ9RKBjLVbRFoiuKx0aw3+PtYBxx
	3wpDwd3CcXyqwL21yvVYUEl92ZO2eJSjpo466l3hJBliSWk6/MKZuf/nIAZWB4pyVt18WdB3JXk
	BublnUnouwnQs8H6Bbnz7v50LRvuNhauy+KB16t0VPcpS3ILHGhUEZv1TcaGxqYRz03jrGbcLVl
	I3++ZOVnDYn2Zj4nMfzSm
X-Google-Smtp-Source: AGHT+IEnM5aOMnZmXYgKj777+1uY49F00+Q83G5ewHbtqQ3Eg7QlWn7ivKrshCtawW50p2BmJhABJA==
X-Received: by 2002:a17:907:2ce3:b0:ac3:17bb:34fc with SMTP id a640c23a62f3a-ac3f2530bb2mr1641258566b.52.1742920549329;
        Tue, 25 Mar 2025 09:35:49 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------E4gwTEZHR9vy0Dee7ApGWh04"
Message-ID: <7cfbd773-de4b-459f-8fa9-7c6ed19fe0ad@gmail.com>
Date: Tue, 25 Mar 2025 17:35:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISCV/bitops: Use Zbb to provide arch-optimised bitops
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <20250226172050.1300771-1-andrew.cooper3@citrix.com>
 <113b2464-c7b2-4068-a179-707cba4f3835@suse.com>
 <50cd2332-11b7-4b64-85ea-489c416098f9@citrix.com>
 <db2073b0-8585-4518-9467-b7da4cefbbae@suse.com>
 <8dff5fb9-b46f-47bf-a6ee-863282155706@citrix.com>
 <295f59af-ebb8-4ad5-bf27-ec0ea5a2c2fe@gmail.com>
 <927264c2-0b99-4d60-97f8-31bcd0d64aa6@suse.com>
 <a7f05789-cf1a-474f-b619-80a7e890a579@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a7f05789-cf1a-474f-b619-80a7e890a579@citrix.com>

This is a multi-part message in MIME format.
--------------E4gwTEZHR9vy0Dee7ApGWh04
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/7/25 1:12 PM, Andrew Cooper wrote:
> On 07/03/2025 12:01 pm, Jan Beulich wrote:
>> On 07.03.2025 12:50, Oleksii Kurochko wrote:
>>> On 3/6/25 9:19 PM, Andrew Cooper wrote:
>>>> On 05/03/2025 7:34 am, Jan Beulich wrote:
>>>>> I was actually hoping to eliminate BITS_PER_LONG at some point, in favor
>>>>> of using sizeof(long) * BITS_PER_BYTE. (Surely in common code we could
>>>>> retain a shorthand of that name, if so desired, but I see no reason why
>>>>> each arch would need to provide all three BITS_PER_{BYTE,INT,LONG}.)
>>>> The concern is legibility and clarity.
>>>>
>>>> This:
>>>>
>>>>       ((x) ? 32 - __builtin_clz(x) : 0)
>>>>
>>>> is a clear expression in a way that this:
>>>>
>>>>       ((x) ? (sizeof(int) * BITS_PER_BYTE) - __builtin_clz(x) : 0)
>>>>
>>>> is not.  The problem is the extra binary expression, and this:
>>>>
>>>>       ((x) ? BITS_PER_INT - __builtin_clz(x) : 0)
>>>>
>>>> is still clear, because the reader doesn't have to perform a multiply to
>>>> just to figure out what's going on.
>>>>
>>>>
>>>> It is definitely stupid to have each architecture provide their own
>>>> BITS_PER_*.  The compiler is in a superior position to provide those
>>>> details, and it should be in a common location.
>>>>
>>>> I don't particularly mind how those constants are derived, but one key
>>>> thing that BITS_PER_* can do which sizeof() can't is be used in #ifdef/etc.
>>> What about moving them to xen/config.h? (if it isn't the best one place, any suggestion which is better?)
>>>
>>> #define BYTES_PER_INT  (1 << INT_BYTEORDER)
>>> #define BITS_PER_INT  (BYTES_PER_INT << 3)
>>>
>>> #define BYTES_PER_LONG (1 << LONG_BYTEORDER)
>>> #define BITS_PER_LONG (BYTES_PER_LONG << 3)
>>> #define BITS_PER_BYTE 8
> The *_BYTEORDER's are useless indirection.  BITS_PER_* should be defined
> straight up, and this will simplify quite a lot of preprocessing.

Could we really drop *_BYTEORDER?

For example, LONG_BYTEORDER for Arm could be either 2 or 3 depends on Arm32 or Arm64 is used.

>
>>> Also, it seems like the follwoing could be moved there too:
>>>
>>> #define POINTER_ALIGN  BYTES_PER_LONG
>> This one is likely fine to move.
>>
>>> #define BITS_PER_LLONG 64
>> This one is only fine to move imo when converted to
>>
>> #define BITS_PER_LONG (BYTES_PER_LLONG << 3)
> Erm?  That's mixing long and long long types.  Presuming that's an
> errant L, then sure.
>
>>> #define BITS_PER_BYTE 8
>> Personally I'd rather leave this per-arch. The others can truly be derived;
>> this one can't be. If we centralize, imo we should also convert the " << 3"
>> to " * BITS_PER_BYTE".
> It is highly unlikely that Xen will ever run on a system where CHAR_BIT
> isn't 8.
>
> So I suggest it stays central to reduce complexity.  If an arch ever
> needs to change it, the complexity can be added then.

Does it make sense to ifdef that? Or, at least, before defintion of BITS_PER_BYTE something like:
#if CHAR_BIT != 8
#error "CHAR_BIT isn't 8"
#endif

~ Oleksii

--------------E4gwTEZHR9vy0Dee7ApGWh04
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
    <div class="moz-cite-prefix">On 3/7/25 1:12 PM, Andrew Cooper wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a7f05789-cf1a-474f-b619-80a7e890a579@citrix.com">
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
      <pre wrap="" class="moz-quote-pre">
The *_BYTEORDER's are useless indirection.  BITS_PER_* should be defined
straight up, and this will simplify quite a lot of preprocessing.</pre>
    </blockquote>
    <pre>Could we really drop *_BYTEORDER?

For example, LONG_BYTEORDER for Arm could be either 2 or 3 depends on Arm32 or Arm64 is used.

</pre>
    <blockquote type="cite"
      cite="mid:a7f05789-cf1a-474f-b619-80a7e890a579@citrix.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
Also, it seems like the follwoing could be moved there too:

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
      <pre wrap="" class="moz-quote-pre">
Erm?  That's mixing long and long long types.  Presuming that's an
errant L, then sure.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">#define BITS_PER_BYTE 8
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Personally I'd rather leave this per-arch. The others can truly be derived;
this one can't be. If we centralize, imo we should also convert the " &lt;&lt; 3"
to " * BITS_PER_BYTE".
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
It is highly unlikely that Xen will ever run on a system where CHAR_BIT
isn't 8.

So I suggest it stays central to reduce complexity.  If an arch ever
needs to change it, the complexity can be added then.</pre>
    </blockquote>
    <pre>Does it make sense to ifdef that? Or, at least, before defintion of BITS_PER_BYTE something like:
#if CHAR_BIT != 8
#error "CHAR_BIT isn't 8"
#endif

</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------E4gwTEZHR9vy0Dee7ApGWh04--

