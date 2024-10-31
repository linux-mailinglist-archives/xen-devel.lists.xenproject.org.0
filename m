Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE21B9B7A6A
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 13:21:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828664.1243648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6UA1-0007ST-Q1; Thu, 31 Oct 2024 12:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828664.1243648; Thu, 31 Oct 2024 12:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6UA1-0007QL-MM; Thu, 31 Oct 2024 12:20:21 +0000
Received: by outflank-mailman (input) for mailman id 828664;
 Thu, 31 Oct 2024 12:20:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7hTS=R3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t6U9z-0007Pn-RJ
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 12:20:19 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a4c96d9-9782-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 13:20:12 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a99ebb390a5so353282266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 05:20:12 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e56643823sm63106466b.167.2024.10.31.05.20.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 05:20:11 -0700 (PDT)
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
X-Inumbo-ID: 7a4c96d9-9782-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzMiLCJoZWxvIjoibWFpbC1lajEteDYzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjdhNGM5NmQ5LTk3ODItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzc3MjEyLjY4MjMzNCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730377212; x=1730982012; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bVB9tHkGO39zqh9mVC6LawxLpz+l3TbDyTfpeZ5bylU=;
        b=p0GIWVzfcSHgMX+i0IUIhZNhP0TaqMd2rrSkret4Zryb1sSetU2ojxw7Au7yJJ6nbK
         m9Qm/fTQqX+ZyTbn7fzATCmD8YfVVDaBSymm+YKGjfGstq1FUILIl8KYjCzUrqppNSOd
         EE03jZSzzmPoKTMYnLkGoSr0Q4gLweuXL7WAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730377212; x=1730982012;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVB9tHkGO39zqh9mVC6LawxLpz+l3TbDyTfpeZ5bylU=;
        b=pqAq6Y7c1J2nKW3jGbmIt4GLndE3U4GI+6OOcmbSSRVOWjqt8lYoMMRm/t6OZ4s9sm
         I5K0weJ3dcx+IMGsklfKtTfZMLc0ho6QOI/jvbrFjV1E4Z8+QQseh5yZRW0Q1WwvfFr6
         u8uW3hfV4uYU/dSUo4o64OKx/IEC2HWaS2BP5hkaueMZpL48OKv15AOSdWd8MbxjMsBZ
         UKk2OoRKEdRQGVu494Ao8XY3B3DtY/DCmiy7H0fPEBdrHZyXg3IVyb8RgOBUuoY0+GlU
         WznDLy8xUF8Vmrtyu9qngWmidlJ1Bz5zhnj/AQtdgPh3lfUV3yopVki1ahg/3Ymk+snY
         qTwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEQZ0PnDmyvF6UgVDTT2Lo5n7LFXQtMhD7ii2KM6pzrb1mPxOXSCYj1XtEVT2bGP7YTzR8V9amDrM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzA8dPFuYy/g88E/1z+hI2GZnt+rlTmwHN14A14YRd7z2075YZb
	0Ajr8MjS02OnW6R+yiz0cJWs/fBUiAP9O4A78NQEHL1anIxGltQPjgoAZM9C2S8=
X-Google-Smtp-Source: AGHT+IEw5uFC02NQaozJAwONi4yVgOvYxi3XluBI9PAQ5g1vVd5vvkT/1LYObi0isfYq7JaxYypNCQ==
X-Received: by 2002:a17:907:cca3:b0:a9a:eeb:b26a with SMTP id a640c23a62f3a-a9e559e0da2mr170253366b.1.1730377212049;
        Thu, 31 Oct 2024 05:20:12 -0700 (PDT)
Message-ID: <f105fe2f-1b76-4f0d-889b-ec12e95a0ac8@citrix.com>
Date: Thu, 31 Oct 2024 12:20:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] byteorder: replace __u16
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <17b6b894-9b41-4e8c-a3a9-ce837797eac3@suse.com>
 <dee82fce-ffc8-493e-8d99-f5c3b321e5b3@suse.com>
 <a7b6fc68-a568-4b61-895d-c295ba3d3095@citrix.com>
 <b5b20a0c-7584-4885-b7b0-c4b1cba8c0bd@suse.com>
 <f5572afc-7c9e-4c2e-ba3f-6ce4f3b71d59@suse.com>
 <56b2b751-74bc-4b47-a966-2c8a6ef2b35d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <56b2b751-74bc-4b47-a966-2c8a6ef2b35d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/10/2024 11:23 am, Jan Beulich wrote:
> On 16.10.2024 11:37, Jan Beulich wrote:
>> On 09.10.2024 15:34, Jan Beulich wrote:
>>> On 09.10.2024 15:20, Andrew Cooper wrote:
>>>> On 09/10/2024 10:21 am, Jan Beulich wrote:
>>>>> In {big,little}_endian.h the changes are entirely mechanical, except for
>>>>> dealing with casting away of const from pointers-to-const on lines
>>>>> touched anyway.
>>>>>
>>>>> In swab.h the casting of constants is done away with as well - I simply
>>>>> don't see what the respective comment is concerned about in our
>>>>> environment (sizeof(int) >= 4, sizeof(long) >= {4,8} depending on
>>>>> architecture, sizeof(long long) >= 8). The comment is certainly relevant
>>>>> in more general cases. Excess parentheses are dropped as well,
>>>>> ___swab16()'s local variable is renamed, and __arch__swab16()'s is
>>>>> dropped as being redundant with ___swab16()'s.
>>>>>
>>>>> With that no uses of the type remain, so it moves to linux-compat.h.
>>>>>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>> ---
>>>>> I'm unconvinced of the need of the separate ___constant_swab16(). I'm
>>>>> also unconvinced of the need for said constants (that even had casts on
>>>>> them).
>>>> There is a still-good series deleting the whole of byteorder/ and
>>>> replacing it with a few-hundred line single header.
>>>>
>>>> It is the second thing stalled on a governance change (prohibited
>>>> reasons to object to a change) which clearly no-one gives a damn about
>>>> fixing.  In fact double spite because it denied a good engineer his
>>>> first changes in Xen.
>>>>
>>>>
>>>> I don't particularly feel like trying to polish byteorder.  I'm inclined
>>>> to rebase+repost Lin's patches, at which point the majority of this
>>>> series simply disappears.
>>> I wouldn't mind you doing so, as long as that other series then progresses.
>>> What I don't want to get into is the other series being stuck rendering this
>>> one stuck, too. Then it would imo be better to take this one first, rebase
>>> the other on top, and work towards it becoming unstuck (whatever that takes;
>>> I have no recollection of what the issue was back at the time, all I recall
>>> is that, yes, there was such work at some point).
>> Just to have a clear picture: Was your reply an objection, with you indeed
>> meaning me to hold back this tidying work? If so, can you please indicate
>> when, at least roughly, you mean to re-post what you think wants re-posting?
>> If not, can you please indicate so, for me to commit stuff that's otherwise
>> ready to go in (and which that other work should be easy to re-base over)?
> Just to mention here - short of an answer I'm going to commit this with the
> R-b from Frediano that I've got.

nack.

The reason there's even anything to do here is, in part, because you
were obstructive to Lin's series.

It wasn't only you, but the maintainers (plural) behaviour on that
series was so outrageous that it started the effort to governance to
prohibit certain classes of feedback, to make Xen a less toxic place to
contribute to.

I will get to it when I get to it.   You can use the time to reflect on
how you could have been more helpful in the past, and avoided this whole
issue.

~Andrew

