Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2495A5678B
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 13:13:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904980.1312757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqWZY-0007qY-5w; Fri, 07 Mar 2025 12:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904980.1312757; Fri, 07 Mar 2025 12:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqWZY-0007oy-2P; Fri, 07 Mar 2025 12:13:00 +0000
Received: by outflank-mailman (input) for mailman id 904980;
 Fri, 07 Mar 2025 12:12:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxnO=V2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tqWZW-0007op-Os
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 12:12:58 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 813398a2-fb4d-11ef-9ab6-95dc52dad729;
 Fri, 07 Mar 2025 13:12:57 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-390effd3e85so1610803f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Mar 2025 04:12:57 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfcdasm5083770f8f.23.2025.03.07.04.12.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 04:12:56 -0800 (PST)
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
X-Inumbo-ID: 813398a2-fb4d-11ef-9ab6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741349576; x=1741954376; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=racZ9WLIFatRaEJK5lSBxAGRS2J5Dg95ncOfXNtBjHY=;
        b=dWRmFyOn9da8vemIe7618T2ECAPLUIUIFGcIlVVy3G8EJnaigCEOVjJp9NulWlzeR1
         Zv9SSGXk6FdpWamsq/z2xL55MJqQpVNWQWIzLoNO6e9/sdbmFWqg31Bp+NTMde4+WLo8
         X0wW7E8is1G2SwPD/2wWA7Khy8RYY5TUHy9Dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741349576; x=1741954376;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=racZ9WLIFatRaEJK5lSBxAGRS2J5Dg95ncOfXNtBjHY=;
        b=bboqDIlq9MdSU6O1wfxO+mEiZQCN+Q+fwvIfBooJ/qjBFNXkYqkPwiduxah8pHapdP
         NNe7Oeubdn3IVtMMTPMKvJgcRsME4pG1O+42hXaOsFDOmZvj+EpyyrdKOB8tHG+iT1q0
         UssN/wWKwri4Ym1vaokRqt9LMPrsBjOVuISjOxKSbxtx7+aa15vTydBzKPljAGFnMvOQ
         6Inb+wy56ISdXIQDwZE0iXiKvRlXEKnhe96ySxLn+/7Ekfm/6JAPpEkNzfvBpmClQNaG
         SMAl2ZM4LWV2wbAmYJM5YZI7KpQaPZPMfrrIGLmyz/xchHbm+VExdU/R5lh0Sanqzse9
         r03Q==
X-Gm-Message-State: AOJu0YzK+mrZSdiZFeG3UrcSxJHA/weg22Nzb8QzSJYa96PMcd/Sd8fI
	G1859CyUhb0VkQDvW/gr/2kkTrhpCnvVY0hQBjulRcd9taRAQql5+880t/B35Yo=
X-Gm-Gg: ASbGncvQj86zCT+9lbPrBIaEcR2UxI1vVywlczP5HIV6u0UURg585MgH+qmcDpd8XYd
	o1uib+Zjvxm7UAfqksQKjDhA1hoJ2CA+mRuvHVWcnny8wr4yNEyc549+ka93ONr2qbPbW6AwNqH
	RPYpxb3KxpVrLuVTYz4jXRmVA72F0KMGXZvhgFXHIsMDhsfEmXdTWdFsGbBTRQJS0AWo4ITaMbX
	JIC1eFQ6HEar1RqfTObHFSgMZO0KyemVhu7odvywi0HNKBwto2b+ddvJ0F22hI3nGfUC20Irzqs
	LlOWv9LqxK6wU/q6Ra2rSPqpYdjJI1VdkZ6ktpaESb6qWlEJi5JFGFndgcbEedyCAMD8/VhGBLA
	jaV5fpcBx
X-Google-Smtp-Source: AGHT+IFUUwfXlO2hHx99v5v6MmO2zQAicCY3V5nHHcAx+NRYetMTkFo6Xh+olRcOtS76hNMeeTuvvg==
X-Received: by 2002:a5d:5f4e:0:b0:391:fcc:9ee8 with SMTP id ffacd0b85a97d-39132d6bc06mr1798241f8f.23.1741349576548;
        Fri, 07 Mar 2025 04:12:56 -0800 (PST)
Message-ID: <a7f05789-cf1a-474f-b619-80a7e890a579@citrix.com>
Date: Fri, 7 Mar 2025 12:12:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISCV/bitops: Use Zbb to provide arch-optimised bitops
To: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <20250226172050.1300771-1-andrew.cooper3@citrix.com>
 <113b2464-c7b2-4068-a179-707cba4f3835@suse.com>
 <50cd2332-11b7-4b64-85ea-489c416098f9@citrix.com>
 <db2073b0-8585-4518-9467-b7da4cefbbae@suse.com>
 <8dff5fb9-b46f-47bf-a6ee-863282155706@citrix.com>
 <295f59af-ebb8-4ad5-bf27-ec0ea5a2c2fe@gmail.com>
 <927264c2-0b99-4d60-97f8-31bcd0d64aa6@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <927264c2-0b99-4d60-97f8-31bcd0d64aa6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/03/2025 12:01 pm, Jan Beulich wrote:
> On 07.03.2025 12:50, Oleksii Kurochko wrote:
>> On 3/6/25 9:19 PM, Andrew Cooper wrote:
>>> On 05/03/2025 7:34 am, Jan Beulich wrote:
>>>> I was actually hoping to eliminate BITS_PER_LONG at some point, in favor
>>>> of using sizeof(long) * BITS_PER_BYTE. (Surely in common code we could
>>>> retain a shorthand of that name, if so desired, but I see no reason why
>>>> each arch would need to provide all three BITS_PER_{BYTE,INT,LONG}.)
>>> The concern is legibility and clarity.
>>>
>>> This:
>>>
>>>      ((x) ? 32 - __builtin_clz(x) : 0)
>>>
>>> is a clear expression in a way that this:
>>>
>>>      ((x) ? (sizeof(int) * BITS_PER_BYTE) - __builtin_clz(x) : 0)
>>>
>>> is not.  The problem is the extra binary expression, and this:
>>>
>>>      ((x) ? BITS_PER_INT - __builtin_clz(x) : 0)
>>>
>>> is still clear, because the reader doesn't have to perform a multiply to
>>> just to figure out what's going on.
>>>
>>>
>>> It is definitely stupid to have each architecture provide their own
>>> BITS_PER_*.  The compiler is in a superior position to provide those
>>> details, and it should be in a common location.
>>>
>>> I don't particularly mind how those constants are derived, but one key
>>> thing that BITS_PER_* can do which sizeof() can't is be used in #ifdef/etc.
>> What about moving them to xen/config.h? (if it isn't the best one place, any suggestion which is better?)
>>
>> #define BYTES_PER_INT  (1 << INT_BYTEORDER)
>> #define BITS_PER_INT  (BYTES_PER_INT << 3)
>>
>> #define BYTES_PER_LONG (1 << LONG_BYTEORDER)
>> #define BITS_PER_LONG (BYTES_PER_LONG << 3)
>> #define BITS_PER_BYTE 8

The *_BYTEORDER's are useless indirection.  BITS_PER_* should be defined
straight up, and this will simplify quite a lot of preprocessing.

>>
>> Also, it seems like the follwoing could be moved there too:
>>
>> #define POINTER_ALIGN  BYTES_PER_LONG
> This one is likely fine to move.
>
>> #define BITS_PER_LLONG 64
> This one is only fine to move imo when converted to
>
> #define BITS_PER_LONG (BYTES_PER_LLONG << 3)

Erm?  That's mixing long and long long types.  Presuming that's an
errant L, then sure.

>
>> #define BITS_PER_BYTE 8
> Personally I'd rather leave this per-arch. The others can truly be derived;
> this one can't be. If we centralize, imo we should also convert the " << 3"
> to " * BITS_PER_BYTE".

It is highly unlikely that Xen will ever run on a system where CHAR_BIT
isn't 8.

So I suggest it stays central to reduce complexity.  If an arch ever
needs to change it, the complexity can be added then.

~Andrew

