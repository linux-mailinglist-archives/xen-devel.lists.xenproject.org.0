Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C14F99680B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 13:08:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814333.1227877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syUY8-00044o-27; Wed, 09 Oct 2024 11:08:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814333.1227877; Wed, 09 Oct 2024 11:08:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syUY7-00043C-VY; Wed, 09 Oct 2024 11:08:11 +0000
Received: by outflank-mailman (input) for mailman id 814333;
 Wed, 09 Oct 2024 11:08:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XgrK=RF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1syUY6-00042n-JK
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 11:08:10 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c42a8343-862e-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 13:08:09 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a9944c4d5d4so471376466b.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 04:08:09 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a994348e9ccsm539036466b.77.2024.10.09.04.08.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 04:08:07 -0700 (PDT)
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
X-Inumbo-ID: c42a8343-862e-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728472088; x=1729076888; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iSCvHREAjJZUrEj8MugF5gpbmiw+GIoYQWatQRF1Kjw=;
        b=Kq5n5RXQuzPnBuORs9jjBO0Do7y6SQjirnWpu+7REg3h4j2UXgJ8+afJpJWFDPYOmJ
         jC9GqdGpyrF0zHI5DKRLUsu3fIz8ZPLpnDakWLLnrUAyKjQBI5QFqym3Mh1WJ0FmzUcX
         4UA824qW3bRPY6wJkLxJVI8vYBj+vkDYkPlrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728472088; x=1729076888;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSCvHREAjJZUrEj8MugF5gpbmiw+GIoYQWatQRF1Kjw=;
        b=NtH1Klwpr/oNZvEgfiIkJjET9amZZaHzTZPxe0hD/QNVWMUGbK9uGxf5LE357O63QE
         ee3YOnmkVmY/leh6kHwL86A7z8O1J7Soq82uFlsO+Sg3kjMAHQh3XpsypRNThlmhcgn5
         pETFEAIOC7AAqXNJP474sA2SXA6ON0gzxhDagnuwJI9c+dUFlfKWItQfgBP0Hvb0tNu+
         /h/XZTQABy8S8xOlCERJnoYwb8cDe3qSPRbJVmTE7TTwTa7Mdb5CwlR9NTNEBxsV61a2
         Tf3NdzZkZf03hwRqEMmBzIAM6tTQN5MUwfS/ZNkYDiWJGGUI+AKe2IhxEUiTEWkE5gqZ
         0RYg==
X-Forwarded-Encrypted: i=1; AJvYcCVpIXSNog4r8M/+0SfZyxA6ewUEzwAJsJMQLW5xkmYxe5b1DyB7Bh1yOpWnCXiOstUPt6xvsTAvUCE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwP2nONmO7WKZI+QSmDmzqzE800ude37rxNAaCFP/7oNHzgaID6
	xe5ZmrBiUXkrBgbqibmQgnUuS9kInlzlSRuHhxThslNcpFaLWAIikZsiRF2iLq0=
X-Google-Smtp-Source: AGHT+IHYfO2smKhUbRvFq1fhb3qjLMUTCNFN1XKi5P6P8IGgFa6dOnsEnQ9pu3uuU2ubPCDTakCdDw==
X-Received: by 2002:a17:906:c10c:b0:a99:5d03:4687 with SMTP id a640c23a62f3a-a998d19959bmr172233666b.21.1728472088438;
        Wed, 09 Oct 2024 04:08:08 -0700 (PDT)
Message-ID: <dde4b510-5674-44d0-9493-a0717387b8d6@citrix.com>
Date: Wed, 9 Oct 2024 12:08:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xg: increase LZMA_BLOCK_SIZE for uncompressing the
 kernel
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20241008213225.728922-1-marmarek@invisiblethingslab.com>
 <226bc9b3-6741-4cb6-917b-1164e340a19d@suse.com> <ZwZScGr75xEolDnS@mail-itl>
 <00ac0665-e4ff-4a56-8537-e81573710c3c@suse.com>
 <e3917457-08d4-4f0c-9e0c-1519952ceed9@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e3917457-08d4-4f0c-9e0c-1519952ceed9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/10/2024 11:26 am, Juergen Gross wrote:
> On 09.10.24 12:19, Jan Beulich wrote:
>> On 09.10.2024 11:52, Marek Marczykowski-Górecki wrote:
>>> On Wed, Oct 09, 2024 at 09:19:57AM +0200, Jan Beulich wrote:
>>>> On 08.10.2024 23:32, Marek Marczykowski-Górecki wrote:
>>>>> --- a/tools/libs/guest/xg_dom_bzimageloader.c
>>>>> +++ b/tools/libs/guest/xg_dom_bzimageloader.c
>>>>> @@ -272,8 +272,7 @@ static int _xc_try_lzma_decode(
>>>>>       return retval;
>>>>>   }
>>>>>   -/* 128 Mb is the minimum size (half-way) documented to work for
>>>>> all inputs. */
>>>>> -#define LZMA_BLOCK_SIZE (128*1024*1024)
>>>>> +#define LZMA_BLOCK_SIZE (256*1024*1024)
>>>>
>>>> That's as arbitrary as before, now just not even with a comment at
>>>> least
>>>> hinting at it being arbitrary. Quoting from one of the LZMA API
>>>> headers:
>>>>
>>>>      * Decoder already supports dictionaries up to 4 GiB - 1 B (i.e.
>>>>      * UINT32_MAX), so increasing the maximum dictionary size of the
>>>>      * encoder won't cause problems for old decoders.
>>>>
>>>> IOW - what if the Linux folks decided to increase the dictionary size
>>>> further? I therefore wonder whether we don't need to make this more
>>>> dynamic, perhaps by peeking into the header to obtain the dictionary
>>>> size used. The one thing I'm not sure about is whether there can't be
>>>> multiple such headers throughout the file, and hence (in principle)
>>>> differing dictionary sizes.
>>>
>>> What is the purpose of this block size limit? From the error
>>> message, it
>>> seems to be avoiding excessive memory usage during decompression (which
>>> could be DoS via OOM). If that's the case, then taking the limit from
>>> the kernel binary itself will miss this point (especially in case of
>>> pygrub or similar, but there may be other cases of not-fully-trusted
>>> kernel binaries).
>>
>> Indeed. The question then simply is: Where do we want to draw the line
>> between what we permit and what we reject?
>
> IMHO the most natural solution would be to use guest memory for this
> purpose.
> OTOH this probably would require a significant rework of libxenguest.


That was XSA-25.  There are toolstack-provided limits on kernel&initrd
sizes.

~Andrew

