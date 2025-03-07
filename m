Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB1AA56714
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 12:51:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904915.1312707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqWEH-00017H-7E; Fri, 07 Mar 2025 11:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904915.1312707; Fri, 07 Mar 2025 11:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqWEH-00014l-40; Fri, 07 Mar 2025 11:51:01 +0000
Received: by outflank-mailman (input) for mailman id 904915;
 Fri, 07 Mar 2025 11:50:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YHQw=V2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tqWEF-00014f-Jr
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 11:50:59 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e90754c-fb4a-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 12:50:57 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5e4f88ea298so3080823a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Mar 2025 03:50:57 -0800 (PST)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e5c74a6af7sm2430951a12.33.2025.03.07.03.50.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 03:50:55 -0800 (PST)
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
X-Inumbo-ID: 6e90754c-fb4a-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741348257; x=1741953057; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PsZwKpgBToRc6otnjdnjYspSc26Bg7dzFdExKxzScUw=;
        b=mPpCgrZTvWE8Mb0bMYBWGM6YxGKYHtT+doT2PIofTDW9fqTw6xk0TmmEUV8tRrmmGU
         5+YlaACyeqqckIqYEgUt0UA+SF/nXxvNs2IXHveRU5rslAWjzpWv0EfN8MjzsSpUq0mm
         JAC22o1ueLoSEQhvt1m7rxxRbtwqhl2JMfbGjoehIGKX9K362irFIVsUCiQaNjlmc2z5
         97Y5dLaAU4Ufmm8XL6STMlZxypUh9lQABoJVVKXfCvA56QPnknSVNdmFX77eymckGQbq
         0qIsQVyUcuok5W5gUSjwhmmpR2ir4b4P7nHy/ezBnY3Pb4EZDJYJFDMmJhc0Wo296ZBQ
         gxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741348257; x=1741953057;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PsZwKpgBToRc6otnjdnjYspSc26Bg7dzFdExKxzScUw=;
        b=TTqhNGc9gAFWjgnSAmSvLwTKm/8MhJxKJDegFqCiFkEItJAi0lSHLAOiy2cNTh4YRz
         yy6dPaD6dZkd3Vz/lvvaQMveE/UwZ7geakG8slcjGUIV6bp/bst8U9XWfagIgOahmjjL
         i3Lc2rnnPRvg/F3M0EbOsRdsbLoTIvMsXCZa0LcCTmOYeFpFwL51aiOEEx2BUmKyUlv1
         Xyhg0Wi3TQAmnTYBbFOMZUPo0zYSWfMdr6peL4OADbZBsHx8QTmJJZWvq7e8nzLum+yI
         UjnETYx7eXem8F4RilaeKGIOEah7+m9PKq0w9zwKIDGRsrsNyEz2YcX2h6gMvUOWnLZa
         BtoQ==
X-Gm-Message-State: AOJu0YxgYgtwU8b4ZbPG9TXnmvjisOADacNoSmuvqueH4glqPyqW4w/+
	GpBVtCKt42HrHdfYoz5m0EIDs9l8sQ3EwALqZASjLxhlUo05yPyk
X-Gm-Gg: ASbGncuX/0fKrqhJpy9a36219HVOy6vUxDfpOJKrLtQrfMA1UQ4/USy5PcWj/HJ6XIe
	wL4qKH5uoHJB/FN/BC3K0iSB2MKNxAoEU8cclEX8KUypCu9IxcclSiSC22gbK9c4qlfI5aJivUJ
	Lz7Fj6rgdH5ipmRlAgIYGogvSexmJRGyntjJDPbXdwKN/3DeXCHxlHh7sc5uLmcJFtdoFOPKxUT
	I+fPsGmcROHVrYsJy2wYdenxwdlz0v3mAy2eLjiy/fsXaNyTWhvKwuTYq6C0tNv9dAZlfyVuyaR
	aspRIMWEF2/QFb3WnkKfC2IE5CVMHBCB9cauN1UOkA49RD3628lS+TdiK/3q22+c+zNGCl60oe7
	PK/8qOhETIZ66MQGHgH0B
X-Google-Smtp-Source: AGHT+IHHEuArQRUOcoulK3E8ghqsdZVhd5a2GlcFE+ppmNRPyEroEYUij6ovR0P4ROftB97mOyCwzA==
X-Received: by 2002:a05:6402:4402:b0:5de:39fd:b2f5 with SMTP id 4fb4d7f45d1cf-5e5e22bf610mr2938299a12.1.1741348256446;
        Fri, 07 Mar 2025 03:50:56 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------59hCNb4BUGWcLGx4xB8k00kb"
Message-ID: <295f59af-ebb8-4ad5-bf27-ec0ea5a2c2fe@gmail.com>
Date: Fri, 7 Mar 2025 12:50:55 +0100
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8dff5fb9-b46f-47bf-a6ee-863282155706@citrix.com>

This is a multi-part message in MIME format.
--------------59hCNb4BUGWcLGx4xB8k00kb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/6/25 9:19 PM, Andrew Cooper wrote:
> On 05/03/2025 7:34 am, Jan Beulich wrote:
>> On 28.02.2025 17:24, Andrew Cooper wrote:
>>> On 27/02/2025 8:11 am, Jan Beulich wrote:
>>>> On 26.02.2025 18:20, Andrew Cooper wrote:
>>>>> --- a/xen/arch/riscv/include/asm/bitops.h
>>>>> +++ b/xen/arch/riscv/include/asm/bitops.h
>>>>> @@ -125,6 +125,13 @@ static inline void clear_bit(int nr, volatile void *p)
>>>>>   #undef NOT
>>>>>   #undef __AMO
>>>>>   
>>>>> +#define arch_ffs(x)     ((x) ? 1 + __builtin_ctz(x) : 0)
>>>>> +#define arch_ffsl(x)    ((x) ? 1 + __builtin_ctzl(x) : 0)
>>>>> +#define arch_fls(x)     ((x) ? 32 - __builtin_clz(x) : 0)
>>>> I fear you won't like me to say this, but can't we avoid baking in yet
>>>> another assumption on sizeof(int) == 4, by using at least sizeof(int) * 8
>>>> here (yet better might be sizeof(int) * BITS_PER_BYTE)?
>>> Yes and no.
>>>
>>> No, because 32 here is consistent with ARM and PPC when it comes to
>>> arch_fls().  Given the effort it took to get these consistent, I'm not
>>> interested in letting them diverge.
>>>
>>> But, if someone wants to introduce BITS_PER_INT to mirror BITS_PER_LONG
>>> and use it consistently, then that would be ok too.
> Oleksii: I see your patch is committed, but when I said "use it
> consistently", I meant "patch ARM and PPC too".

I planned to do that in a separate patch next week.

>> I was actually hoping to eliminate BITS_PER_LONG at some point, in favor
>> of using sizeof(long) * BITS_PER_BYTE. (Surely in common code we could
>> retain a shorthand of that name, if so desired, but I see no reason why
>> each arch would need to provide all three BITS_PER_{BYTE,INT,LONG}.)
> The concern is legibility and clarity.
>
> This:
>
>      ((x) ? 32 - __builtin_clz(x) : 0)
>
> is a clear expression in a way that this:
>
>      ((x) ? (sizeof(int) * BITS_PER_BYTE) - __builtin_clz(x) : 0)
>
> is not.  The problem is the extra binary expression, and this:
>
>      ((x) ? BITS_PER_INT - __builtin_clz(x) : 0)
>
> is still clear, because the reader doesn't have to perform a multiply to
> just to figure out what's going on.
>
>
> It is definitely stupid to have each architecture provide their own
> BITS_PER_*.  The compiler is in a superior position to provide those
> details, and it should be in a common location.
>
> I don't particularly mind how those constants are derived, but one key
> thing that BITS_PER_* can do which sizeof() can't is be used in #ifdef/etc.

What about moving them to xen/config.h? (if it isn't the best one place, any suggestion which is better?)

#define BYTES_PER_INT  (1 << INT_BYTEORDER)
#define BITS_PER_INT  (BYTES_PER_INT << 3)

#define BYTES_PER_LONG (1 << LONG_BYTEORDER)
#define BITS_PER_LONG (BYTES_PER_LONG << 3)
#define BITS_PER_BYTE 8

Also, it seems like the follwoing could be moved there too:

#define POINTER_ALIGN  BYTES_PER_LONG

#define BITS_PER_LLONG 64

#define BITS_PER_BYTE 8

Only, BITS_PER_XEN_ULONG is looking different for x86, so should be still in arch specific config.h.

~ Oleksii

>
> The following files use BITS_PER_LONG preprocessing:
>
> arch/arm/include/asm/div64.h
> arch/x86/cpu/mcheck/mce.c
> arch/x86/smpboot.c
> common/bitops.c
> common/coverage/gcov.h
> common/coverage/llvm.c
> common/cpu.c
> common/event_channel.c
> common/time.c
> common/ubsan/ubsan.c
> include/asm-generic/div64.h
> include/xen/cpumask.h
> include/xen/inttypes.h
> include/xen/nodemask.h
> include/xen/sched.h
> include/xen/xxhash.h
> lib/find-next-bit.c
> lib/generic-ffsl.c
> lib/generic-flsl.c
> lib/generic-hweightl.c
>
> And I really don't think they can be replaced with a sizeof().
>
> ~Andrew
--------------59hCNb4BUGWcLGx4xB8k00kb
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
    <div class="moz-cite-prefix">On 3/6/25 9:19 PM, Andrew Cooper wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:8dff5fb9-b46f-47bf-a6ee-863282155706@citrix.com">
      <pre wrap="" class="moz-quote-pre">On 05/03/2025 7:34 am, Jan Beulich wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 28.02.2025 17:24, Andrew Cooper wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 27/02/2025 8:11 am, Jan Beulich wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 26.02.2025 18:20, Andrew Cooper wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/bitops.h
+++ b/xen/arch/riscv/include/asm/bitops.h
@@ -125,6 +125,13 @@ static inline void clear_bit(int nr, volatile void *p)
 #undef NOT
 #undef __AMO
 
+#define arch_ffs(x)     ((x) ? 1 + __builtin_ctz(x) : 0)
+#define arch_ffsl(x)    ((x) ? 1 + __builtin_ctzl(x) : 0)
+#define arch_fls(x)     ((x) ? 32 - __builtin_clz(x) : 0)
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">I fear you won't like me to say this, but can't we avoid baking in yet
another assumption on sizeof(int) == 4, by using at least sizeof(int) * 8
here (yet better might be sizeof(int) * BITS_PER_BYTE)?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Yes and no.

No, because 32 here is consistent with ARM and PPC when it comes to
arch_fls().  Given the effort it took to get these consistent, I'm not
interested in letting them diverge.

But, if someone wants to introduce BITS_PER_INT to mirror BITS_PER_LONG
and use it consistently, then that would be ok too.
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Oleksii: I see your patch is committed, but when I said "use it
consistently", I meant "patch ARM and PPC too".</pre>
    </blockquote>
    <pre>I planned to do that in a separate patch next week.

</pre>
    <blockquote type="cite"
      cite="mid:8dff5fb9-b46f-47bf-a6ee-863282155706@citrix.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">I was actually hoping to eliminate BITS_PER_LONG at some point, in favor
of using sizeof(long) * BITS_PER_BYTE. (Surely in common code we could
retain a shorthand of that name, if so desired, but I see no reason why
each arch would need to provide all three BITS_PER_{BYTE,INT,LONG}.)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The concern is legibility and clarity.

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
thing that BITS_PER_* can do which sizeof() can't is be used in #ifdef/etc.</pre>
    </blockquote>
    <pre>What about moving them to xen/config.h? (if it isn't the best one place, any suggestion which is better?)</pre>
    <pre>#define BYTES_PER_INT  (1 &lt;&lt; INT_BYTEORDER)
#define BITS_PER_INT  (BYTES_PER_INT &lt;&lt; 3)</pre>
    <pre>#define BYTES_PER_LONG (1 &lt;&lt; LONG_BYTEORDER)
#define BITS_PER_LONG (BYTES_PER_LONG &lt;&lt; 3)
#define BITS_PER_BYTE 8
</pre>
    <pre>Also, it seems like the follwoing could be moved there too:

#define POINTER_ALIGN  BYTES_PER_LONG
</pre>
    <pre>#define BITS_PER_LLONG 64

#define BITS_PER_BYTE 8

Only, BITS_PER_XEN_ULONG is looking different for x86, so should be still in arch specific config.h.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:8dff5fb9-b46f-47bf-a6ee-863282155706@citrix.com">
      <pre wrap="" class="moz-quote-pre">

The following files use BITS_PER_LONG preprocessing:

arch/arm/include/asm/div64.h
arch/x86/cpu/mcheck/mce.c
arch/x86/smpboot.c
common/bitops.c
common/coverage/gcov.h
common/coverage/llvm.c
common/cpu.c
common/event_channel.c
common/time.c
common/ubsan/ubsan.c
include/asm-generic/div64.h
include/xen/cpumask.h
include/xen/inttypes.h
include/xen/nodemask.h
include/xen/sched.h
include/xen/xxhash.h
lib/find-next-bit.c
lib/generic-ffsl.c
lib/generic-flsl.c
lib/generic-hweightl.c

And I really don't think they can be replaced with a sizeof().

~Andrew
</pre>
    </blockquote>
  </body>
</html>

--------------59hCNb4BUGWcLGx4xB8k00kb--

