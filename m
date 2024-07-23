Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F414193A254
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 16:10:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763276.1173548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWGDH-0004w3-Tu; Tue, 23 Jul 2024 14:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763276.1173548; Tue, 23 Jul 2024 14:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWGDH-0004tD-Qy; Tue, 23 Jul 2024 14:09:59 +0000
Received: by outflank-mailman (input) for mailman id 763276;
 Tue, 23 Jul 2024 14:09:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=402b=OX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sWGDG-0004su-68
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 14:09:58 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d9f22e5-48fd-11ef-bbfe-fd08da9f4363;
 Tue, 23 Jul 2024 16:09:57 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2eefeab807dso65791991fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 07:09:57 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30aaa31e0sm7550612a12.27.2024.07.23.07.09.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 07:09:55 -0700 (PDT)
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
X-Inumbo-ID: 3d9f22e5-48fd-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721743796; x=1722348596; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6nW/rt9Qo5tfRDufRGYbEvIvuJIAr6r7zmSe5eBX0ms=;
        b=M//THgEzaa+aDVBEGOcF/Elvz2KEn948/1/etLE6Yds/vIBgJ7+2BJqL14R+CHVlNa
         TbCcPvU/m/IEu13urwUO1Nj8XR0HSy8XwkT9npw7bkDAgmHcA2N9ztdNyMlm6pKHHnpq
         m3fOXWO+Sn8ydH6ap50JtQjPd6gUrfQmmFETc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721743796; x=1722348596;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6nW/rt9Qo5tfRDufRGYbEvIvuJIAr6r7zmSe5eBX0ms=;
        b=H1DbFhTT6XQgVRMwW896bNS+lPLEjZ97Q20IqGM4iC890u1g0KwxRuLhkDN1EG6Lxo
         +hHOf+URvptRlurTVede/E6lVeXlv4ZeLPYxnCkDsNXFD/szs1DBKy9gBejiRS/GMhi0
         7Ym7kylO82TvFma1sVVJT3YdVJ6anaDNBA9ub5cangceWVHYmN71glkg7oGfyZkxqb6Z
         z4eOOX3q1TU6O6+0uyWd7hzqCfpQef/+C3k1qJ/yuN3SaqSv8EvM4NQmexXYAGnTMXmd
         //vJcLoUI6/rQ1V+aSYm0RXjG2to53NogBwRxfWCTiA8lA8rf8MnWQhIvC3+2/4ApvCX
         XbDw==
X-Forwarded-Encrypted: i=1; AJvYcCWK7ENdvp5HMf4lNbHlA1ykX7jsqIxZXezH3pNAt8sdvIJwK+FUfEuo6eF7+76WrGV+DVqNclgfjWPMcyzKwQUlmvcFJm/6sOwz0/XVrEg=
X-Gm-Message-State: AOJu0YyvG86OJKTmKXFbWsiGoQ/QKmfIRJh0V2RCvMg2JaOt/JNWJhH3
	NMz8qka3WSgssIPJrhFP8dVV9m/Tp6YLzjjSiLv4MglMqQJ3TuVnCnhMtlGwYsnfDTl0VSYpSN6
	/
X-Google-Smtp-Source: AGHT+IH9dbnid+umfgkDovOno7oGayRaeV+CbXCITXh68H5Z7ircdpdrKcDMbpIIJjdv3XX2uRlGtQ==
X-Received: by 2002:a2e:b054:0:b0:2ef:2f60:1950 with SMTP id 38308e7fff4ca-2f01eac68e1mr20567321fa.30.1721743796350;
        Tue, 23 Jul 2024 07:09:56 -0700 (PDT)
Message-ID: <69ad0dbc-7690-4da2-85be-9b44edb8d28e@citrix.com>
Date: Tue, 23 Jul 2024 15:09:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1.1 5/6] tools/libxs: Use writev()/sendmsg() instead of
 write()
To: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
References: <20240718164842.3650702-6-andrew.cooper3@citrix.com>
 <20240722162547.4060813-1-andrew.cooper3@citrix.com>
 <cabf929b-11bd-4401-88a2-7d4c8ae4b606@suse.com>
 <702ac4d8-2eba-4b4d-bf43-3cc8277c5778@citrix.com>
 <34350564-2faf-4af7-a66c-4ef3960a98ed@suse.com>
 <296cccab-118f-4b42-b48d-f4927d10162d@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <296cccab-118f-4b42-b48d-f4927d10162d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/07/2024 2:45 pm, Jason Andryuk wrote:
> On 2024-07-23 08:30, Juergen Gross wrote:
>> On 23.07.24 14:25, Andrew Cooper wrote:
>>> On 23/07/2024 10:37 am, Jürgen Groß wrote:
>>>> On 22.07.24 18:25, Andrew Cooper wrote:
>>>>> With the input data now conveniently arranged, use writev()/sendmsg()
>>>>> instead
>>>>> of decomposing it into write() calls.
>>>>>
>>>>> This causes all requests to be submitted with a single system call,
>>>>> rather
>>>>> than at least two.  While in principle short writes can occur, the
>>>>> chances of
>>>>> it happening are slim given that most xenbus comms are only a
>>>>> handful of
>>>>> bytes.
>>>>>
>>>>> Nevertheless, provide {writev,sendmsg}_exact() wrappers which take
>>>>> care of
>>>>> resubmitting on EINTR or short write.
>>>>>
>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>> ---
>>>>> CC: Anthony PERARD <anthony.perard@vates.tech>
>>>>> CC: Juergen Gross <jgross@suse.com>
>>>>> CC: Frediano Ziglio <frediano.ziglio@cloud.com>
>>>>>
>>>>> v1.1:
>>>>>    * Fix iov overread, spotted by Frediano.  Factor the common
>>>>> updating logic
>>>>>      out into update_iov().
>>>>> ---
>>>>>    tools/libs/store/xs.c | 94
>>>>> +++++++++++++++++++++++++++++++++++++++++--
>>>>>    1 file changed, 91 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
>>>>> index e820cccc2314..f80ac7558cbe 100644
>>>>> --- a/tools/libs/store/xs.c
>>>>> +++ b/tools/libs/store/xs.c
>>>>> @@ -563,6 +563,95 @@ static void *read_reply(
>>>>>        return body;
>>>>>    }
>>>>>    +/*
>>>>> + * Update an iov/nr pair after an incomplete writev()/sendmsg().
>>>>> + *
>>>>> + * Awkwardly, nr has different widths and signs between writev() and
>>>>> + * sendmsg(), so we take it and return it by value, rather than by
>>>>> pointer.
>>>>> + */
>>>>> +static size_t update_iov(struct iovec **p_iov, size_t nr, size_t
>>>>> res)
>>>>> +{
>>>>> +    struct iovec *iov = *p_iov;
>>>>> +
>>>>> +        /* Skip fully complete elements, including empty
>>>>> elements. */
>>>>> +        while (nr && res >= iov->iov_len) {
>>>>> +                res -= iov->iov_len;
>>>>> +                nr--;
>>>>> +                iov++;
>>>>> +        }
>>>>> +
>>>>> +        /* Partial element, adjust base/len. */
>>>>> +        if (res) {
>>>>> +                iov->iov_len  -= res;
>>>>> +                iov->iov_base += res;
>>>>> +        }
>>>>> +
>>>>> +        *p_iov = iov;
>>>>> +
>>>>> +    return nr;
>>>>> +}
>>>>> +
>>>>> +/*
>>>>> + * Wrapper around sendmsg() to resubmit on EINTR or short write.
>>>>> Returns
>>>>> + * @true if all data was transmitted, or @false with errno for an
>>>>> error.
>>>>> + * Note: May alter @iov in place on resubmit.
>>>>> + */
>>>>> +static bool sendmsg_exact(int fd, struct iovec *iov, unsigned int
>>>>> nr)
>>>>> +{
>>>>> +    struct msghdr hdr = {
>>>>> +        .msg_iov = iov,
>>>>> +        .msg_iovlen = nr,
>>>>> +    };
>>>>> +
>>>>> +    /* Sanity check first element isn't empty */
>>>>> +    assert(iov->iov_len == sizeof(struct xsd_sockmsg));
>>>>
>>>> Can you please move this assert() into write_request(), avoiding to
>>>> have
>>>> 2 copies of it?
>>>
>>> It was more relevant before update_iov() was split out.
>>>
>>> But, there's exactly the same assertion in the write_request()'s
>>> caller,
>>> so I'd prefer to simply drop it if that's ok?
>>>
>>> The writev()/sendmsg() won't malfunction if the first element is 0, and
>>> update_iov() will now cope too, so I don't think it's necessary.
>>
>> Fine with me.
>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks.

>
> Looks like xs_write_all() is now unused internally, but it's an
> exposed library function.  I guess it can just be kept instead of
> bumping the library version.

I have a /dev/null shaped hole I'm itching to file it in, but that is
going to need a soname bump.  It's just one of many dubious functions
exposed...

One mess at a time.

~Andrew

