Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4AD9CDE3D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 13:28:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837458.1253387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBvPu-00069T-HN; Fri, 15 Nov 2024 12:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837458.1253387; Fri, 15 Nov 2024 12:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBvPu-00067C-Eo; Fri, 15 Nov 2024 12:27:14 +0000
Received: by outflank-mailman (input) for mailman id 837458;
 Fri, 15 Nov 2024 12:27:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=olWw=SK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tBvPt-000676-P9
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 12:27:13 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eec089f4-a34c-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 13:27:09 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5cf6f367f97so997857a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 04:27:09 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf79b9e761sm1597441a12.22.2024.11.15.04.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2024 04:27:08 -0800 (PST)
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
X-Inumbo-ID: eec089f4-a34c-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MjkiLCJoZWxvIjoibWFpbC1lZDEteDUyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImVlYzA4OWY0LWEzNGMtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjczNjI5LjIwMDMxMSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731673628; x=1732278428; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=noWZy+/87oZS6fvnqPY9TgFiCWEVj6HW48osTpfF7O4=;
        b=SwCKYLvv8aouDZ9tmwgmstcd8YVxhZ3UZXpu0QmoR17Sovb83EAQlOyiLabhCarOjg
         HH6G8cf72S7HBX5MWK2U6pM13mZbHTwFgurQfULFmJfbce5pmbrsrarYbswe8hFz9A27
         HJABzd+/hPGRJ5++C8i8hX6AxnVk+CRYUdtxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731673628; x=1732278428;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=noWZy+/87oZS6fvnqPY9TgFiCWEVj6HW48osTpfF7O4=;
        b=kchPr+fwVY/vOYV8eQwx7n2Ib05YLA2nmysBJMUEGTllT7QkzGeTYArSfa1Eeg11yt
         cNPRH6yIt9Q4U7M5xs+jw/xMgQQ5WHJuwJ2FQhIoIgsH//b8uk8t9lBvVxpGR873f8eO
         9LODwq/C14zhlcoacnpoZZJzQZgXPZUT0UHCUoyRGmiYsEEzBcvgspGup1ETzYWraRy9
         rfyWaXvSxDyoGaJUBjkelpX5VRGtQMuuv+4mszEj9b9jV5drtwnZUmHKpAQa83mGYW8d
         k57ye2uotkMg7XmB96jkkausELBz18gM47OLH8SGvm8SVpUM/+/mN4ln6TqE7rTqebYQ
         Gr+Q==
X-Gm-Message-State: AOJu0YzsUWNDgOebzLTPLmjpnNZqTz09sF4fLtnJ7IZIzBEwwRCBPhUN
	+8fUojXSlRlCZNW+angq6j3uPxKyhk0lwi4w/ZnLLyyy+g5OVcHb94QX2NCfQsg=
X-Google-Smtp-Source: AGHT+IGnwW70Gbn83TjtwW9Wdaou8e8oLNuH0DbD9eYvlf4GMNoj0Hw1uymfPCgW53HEgbNdeSOzew==
X-Received: by 2002:a05:6402:2693:b0:5cf:67c1:69e5 with SMTP id 4fb4d7f45d1cf-5cf8fc13ee2mr1936260a12.4.1731673628557;
        Fri, 15 Nov 2024 04:27:08 -0800 (PST)
Message-ID: <f81d4195-a41f-4ec8-bc9e-3e836472469e@citrix.com>
Date: Fri, 15 Nov 2024 12:27:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] common/vmap: Fall back to simple allocator when
 !HAS_VMAP
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241115105036.218418-1-luca.fancellu@arm.com>
 <20241115105036.218418-2-luca.fancellu@arm.com>
 <2b13f12c-905d-478c-b525-a3a8c69d5ac7@citrix.com>
 <F693DC5E-C4E5-445C-AE3F-24EE76B34D90@arm.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <F693DC5E-C4E5-445C-AE3F-24EE76B34D90@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/11/2024 12:15 pm, Luca Fancellu wrote:
>
>> On 15 Nov 2024, at 12:00, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> On 15/11/2024 10:50 am, Luca Fancellu wrote:
>>> diff --git a/xen/include/xen/xvmalloc.h b/xen/include/xen/xvmalloc.h
>>> index 440d85a284bb..802be6687085 100644
>>> --- a/xen/include/xen/xvmalloc.h
>>> +++ b/xen/include/xen/xvmalloc.h
>>> @@ -40,20 +40,46 @@
>>>     ((typeof(ptr))_xvrealloc(ptr, offsetof(typeof(*(ptr)), field[nr]), \
>>>                              __alignof__(typeof(*(ptr)))))
>>>
>>> +#if defined(CONFIG_HAS_VMAP)
>>> +
>>> /* Free any of the above. */
>>> void xvfree(void *va);
>>>
>>> +/* Underlying functions */
>>> +void *_xvmalloc(size_t size, unsigned int align);
>>> +void *_xvzalloc(size_t size, unsigned int align);
>>> +void *_xvrealloc(void *va, size_t size, unsigned int align);
>>> +
>>> +#else
>>> +
>>> +static inline void xvfree(void *va)
>>> +{
>>> +    xfree(va);
>>> +}
>>> +
>>> +void *_xvmalloc(size_t size, unsigned int align)
>>> +{
>>> +    return _xmalloc(size, align);
>>> +}
>>> +
>>> +void *_xvzalloc(size_t size, unsigned int align)
>>> +{
>>> +    return _xzalloc(size, align);
>>> +}
>>> +
>>> +void *_xvrealloc(void *va, size_t size, unsigned int align)
>>> +{
>>> +    return _xrealloc(va, size, align);
>>> +}
>>> +
>>> +#endif
>> Does this really compile with the wrappers not being static inline ?
>>
>> That aside, could we not do this using conditional aliases, rather than
>> wrapping the functions?  It would certainly be shorter, code wise.
> Do you mean something like below?
>
> #define xvfree xfree
> #define _xvmalloc _xmalloc
> […]

I mean __attribute__((__alias__("")))

There are two examples in tree already.  See efi_compat_get_info() being
aliased to efi_get_info()

In this case, in the !HAS_VMAP case, we'd just declare _xmalloc() to
have an alias called _xvmalloc() too.

This avoids needing to wrap every function in the headers.

~Andrew

