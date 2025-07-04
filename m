Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 134E7AF9784
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 18:01:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033496.1406837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXiqS-0008DR-6b; Fri, 04 Jul 2025 16:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033496.1406837; Fri, 04 Jul 2025 16:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXiqS-0008Ay-3q; Fri, 04 Jul 2025 16:01:00 +0000
Received: by outflank-mailman (input) for mailman id 1033496;
 Fri, 04 Jul 2025 16:00:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7FCR=ZR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uXiqQ-00089f-0Y
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 16:00:58 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1243098f-58f0-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 18:00:57 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so721650f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 09:00:57 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b471b97698sm2839405f8f.54.2025.07.04.09.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jul 2025 09:00:55 -0700 (PDT)
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
X-Inumbo-ID: 1243098f-58f0-11f0-a315-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751644856; x=1752249656; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IIG0fH8wBBc8QMEczHgMgyHNXNG3q+U8hkXVsooxbEo=;
        b=M4sygg3D/lH7zESsbN6HHRcAbp4yha2Fw/j5DM21cv+ydaLWQK0uPt9rRhzD6B5wkH
         Iz/Vqc/dsipSSImckV5//KoF0wSYuKIP9Rgl/yzv6JrwZJHO5eQzxkxzziVu5+wLvSjv
         GzyMkO9u7ZWPiESXU7XsrKE6CTzJaAy5WRx9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751644856; x=1752249656;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIG0fH8wBBc8QMEczHgMgyHNXNG3q+U8hkXVsooxbEo=;
        b=T6RJ3xPymIqgW19aib/YYnUNkvCQBKjRitoZKI1ytbwu6S+ZyPuEWEu26nEim2kZCg
         NUCrxYdp9es2W5NuFHe/UjHQSSobmQ53cZrqKnCCBgTFWVebY9CQgCFQycimnMKe1ZL6
         bYOzaH22ZrsMr5cMnjo+/aqP/nxlCg0dvaty8t3TIHplRXFt5y3TokWMm6hsSsbG5jYW
         DQfF96wd3LioBT8oNFlmuOGV1Wg8U725ZQHTJ1zKTaAP1J/BXmGD3gdVjWoTw3ti042r
         4zOIkWCjQCaL91XEn4a7Se6cD8c4PT3C4dWiGvgK0UY8bIGAwt0z97ap6tCw8KdiyIET
         OP3w==
X-Gm-Message-State: AOJu0YxT/HKHToWlHStV9rXXkXxLejwSMxjBAkBBJb8mU/VDKnQJdVhe
	430rVWrK2xDXoYD7+NTkAHdOduM1F2DS8zbjlx8vCwEjYddPsfW6LJZSKuSxeHxWS+I=
X-Gm-Gg: ASbGncualoKOx0a7xDeaN0smE7SmsyJ54teET+dq8y6bUvE6EA55i0mVQCcoNibGMPl
	cPuWGXE0tAxbyLnyptwhXdJaYTzvV0HDSTX8WofC8YJw22OM6wg//lSGf3C1KkGQjkYLb/h0nUp
	vXy7BL3So97ly42TgL3P4vjqY7S5VvfoNdqiwc8wFO7QgYuDAoJiOAxVI6oU+gSD9aO/If3oVl1
	6gAGeBuX7hglLxS03CZDAoH++Gm/D8n1VNuH5gzv5mqDL4iwCBvBn13dlXFFqangAyG9XOZbN3A
	XKI/VBxEYxCGLqe98BjvWpFOQMFYKFK/Ic6ONbv1oW6Qioky9l13uuH7WQLkMGESbtjQ4kpsERB
	WaGSIov1XYj0l3pVa5wKgOS/XTf4DcNQ0YVQhbw==
X-Google-Smtp-Source: AGHT+IHBrIFoQa6Y5l8dsWBy+Rx5eYy3o+JbeZtQsfrG8/BWqp8a47D8ShCY18aDkxf0+oCwOOXttw==
X-Received: by 2002:a05:6000:430a:b0:3b3:59c3:483d with SMTP id ffacd0b85a97d-3b4964c097bmr2722065f8f.14.1751644856258;
        Fri, 04 Jul 2025 09:00:56 -0700 (PDT)
Message-ID: <7c6f88a1-7ec0-4279-839b-46add6cf9074@citrix.com>
Date: Fri, 4 Jul 2025 17:00:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] xen/softirq: Rework arch_skip_send_event_check() into
 arch_pend_softirq()
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
 <20250702144121.1096448-4-andrew.cooper3@citrix.com>
 <aGat-VxBF5jOErzy@macbook.local>
 <86dde581-40ad-405e-8d98-0b4485529581@suse.com>
 <aGeI_k1H3oju26hf@macbook.local>
 <27dcd1b8-e735-4ab1-a5a8-d71a46e59955@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <27dcd1b8-e735-4ab1-a5a8-d71a46e59955@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/07/2025 9:25 am, Jan Beulich wrote:
> On 04.07.2025 09:55, Roger Pau Monné wrote:
>> On Fri, Jul 04, 2025 at 09:23:29AM +0200, Jan Beulich wrote:
>>> On 03.07.2025 18:21, Roger Pau Monné wrote:
>>>> On Wed, Jul 02, 2025 at 03:41:18PM +0100, Andrew Cooper wrote:
>>>>> --- a/xen/include/xen/softirq.h
>>>>> +++ b/xen/include/xen/softirq.h
>>>>> @@ -23,6 +23,22 @@ enum {
>>>>>  
>>>>>  #define NR_SOFTIRQS (NR_COMMON_SOFTIRQS + NR_ARCH_SOFTIRQS)
>>>>>  
>>>>> +/*
>>>>> + * Ensure softirq @nr is pending on @cpu.  Return true if an IPI can be
>>>>> + * skipped, false if the IPI cannot be skipped.
>>>>> + */
>>>>> +#ifndef arch_pend_softirq
>>>>> +static always_inline bool arch_pend_softirq(unsigned int nr, unsigned int cpu)
>>>> Nit: I would maybe it arch_set_softirq(), I find `pend` not that clear
>>>> (I would rather fully spell `pending` instead).
>>> I, too, did wonder about the naming here. But using "pending" as you suggest
>>> has the effect of giving the function a name we would normally associate with
>>> a predicate ("Is it pending?"), whereas here the function is used to _mark_ a
>>> softirq as pending. Hence in the end I didn't comment at all; I'd be fine
>>> with "set", but I'm also okay with "pend".
>> It's a set and check kind of function, so I don't care much.  Just
>> found the pend a bit too short, I don't think we usually abbreviate
>> pending to pend.
> Aiui it's not an abbreviation, but kind of a verb (inverse-)derived from pending.
> I don't know whether that's "official"; my dictionary doesn't have it.

It's used frequently in some circles, meaning "to make pending".

But I've changed the name because I don't care enough to argue.

~Andrew

