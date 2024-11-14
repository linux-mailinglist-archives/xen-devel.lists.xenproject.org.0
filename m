Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 437699C8BD2
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 14:29:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836484.1252390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBZtK-0002ub-BJ; Thu, 14 Nov 2024 13:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836484.1252390; Thu, 14 Nov 2024 13:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBZtK-0002sH-7s; Thu, 14 Nov 2024 13:28:10 +0000
Received: by outflank-mailman (input) for mailman id 836484;
 Thu, 14 Nov 2024 13:28:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3TDs=SJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tBZtI-0002sB-Tw
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 13:28:08 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46383166-a28c-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 14:28:03 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5ceca0ec4e7so815192a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 05:28:03 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf79b9f84dsm599144a12.31.2024.11.14.05.28.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 05:28:01 -0800 (PST)
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
X-Inumbo-ID: 46383166-a28c-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzYiLCJoZWxvIjoibWFpbC1lZDEteDUzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQ2MzgzMTY2LWEyOGMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTkwODgzLjA4MDM0LCJzZW5kZXIiOiJhbmRyZXcuY29vcGVyQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731590882; x=1732195682; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3KuiN+0RuE/LoltSeOB5wQw6VNCyO0/pFR8I/yeq4SA=;
        b=CELHLvMtfffhYD2dINejJffj2fRLEAgWxcXdBf9mhSYUXZsNWO1j41FGZxgPbEcQMs
         Pp/MiGqnBMEeeChmJ4QIsRODARmx7cwyG50Asay8MSB+2FGwQe1h5JbK0a0UutcO9RKB
         oqY7fRfEPDtEXge0yNPb8zrHXtjGSc1pajjbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731590882; x=1732195682;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KuiN+0RuE/LoltSeOB5wQw6VNCyO0/pFR8I/yeq4SA=;
        b=pM5ve5A5f297rUyqErugrUtLd54SbQUr8Ru3zlbROr3CPgUdABpzVqhYYy5dKxPg0y
         ANGg1FclYTJFdF4SRgh8QZMPnu00kf2XRLj7e50i5qFWlwg4o/c0MKcVkveMdYN7nOR8
         5HsmNmFk+pj7sEXZZwjaJS2OcbS/8VrraDyQSdqKPN8+M2aShCI9ozxVynf9ph1RZ7Gw
         3v9r5IoPaluA5ljMCUE/amD9HsIYdgMvEhocBaZ++WZ0qjoAh8SfaRSdWMj2WMklxgUP
         HOd805Wbqx48xAP/E/pVo/A3hbzOSADVNoUJhUtYCo6BPkJ/r1p9ZD7rD20n8/uhEGux
         +vPg==
X-Forwarded-Encrypted: i=1; AJvYcCXcmk5iRibCaSLN40anm69T/I2P5AQdFCFSS3txTVkglMFu3uQrJhfLUO5jxY9cU2JLGwrTOx4UHEU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwybRpWvf3CUbV2aI/Ccu4uOAQQgYB4aMZmDCVt3Lwc8K+YsIHj
	tFQ1GvsnsffnK4CDLE63HfFc/U45CEXx85Prehr3y0N1wNSITJSxcsJts8bg76s=
X-Google-Smtp-Source: AGHT+IHyGFp5FqBsC07J49RS93ns2lqSOD5YYJfOaB2/dmtu+sLeluU5pQxYizU9XDbMBnPmSByIzQ==
X-Received: by 2002:a05:6402:2712:b0:5cf:88f6:d91c with SMTP id 4fb4d7f45d1cf-5cf88f6db97mr57600a12.33.1731590882393;
        Thu, 14 Nov 2024 05:28:02 -0800 (PST)
Message-ID: <134de5b8-1070-4a85-badb-e44097a36e60@citrix.com>
Date: Thu, 14 Nov 2024 13:27:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: preparations for 4.19.1
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Kelly Choi <kelly.choi@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ddc41c9d-9754-4fde-bac0-6389511a7f7c@suse.com>
 <686facb6-0a6a-471c-a91c-b593cee7831a@citrix.com>
 <103dd682-cfb6-4f61-bced-f4e742813232@suse.com>
 <9d97a479-f5e4-4bd4-b47e-8503b3fdc806@suse.com>
 <639c17b4-0fe8-435d-9ea2-220ec9176e95@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <639c17b4-0fe8-435d-9ea2-220ec9176e95@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/11/2024 12:30 pm, Jürgen Groß wrote:
> On 14.11.24 13:26, Jan Beulich wrote:
>> On 13.11.2024 16:29, Jürgen Groß wrote:
>>> On 13.11.24 16:20, Andrew Cooper wrote:
>>>> Looking over the XenServer patchqueue:
>>>
>>> ...
>>>
>>>> These are a SIGPIPE bugfix which happen to also have a perf
>>>> improvement.  I cant remember if we discussed backporting them before.
>>>> (Juergen/Anthony?)
>>>>
>>>> 42db2deb5e76: tools/libxs: Fix length check in xs_talkv()
>>>> e2a93bed8b9e: tools/libxs: Rework xs_talkv() to take xsd_sockmsg
>>>> within
>>>> the iovec
>>>> f050c03ce2ad: tools/libxs: Rationalise the definition of struct
>>>> xs_handle
>>>> 046efe529e82: tools/libxs: Track whether we're using a socket or file
>>>> ebaeb0c64a6d: tools/libxs: Use writev()/sendmsg() instead of write()
>>>> a17b6db9b007: tools/libxs: Stop playing with SIGPIPE
>>>
>>> I'd take these, as playing with signals behind the back of a library
>>> user
>>> is something which should be fixed.
>>
>> No question about the first and last one. Are all the intermediate ones
>> necessary, though?
>
> I think those are needed for the last one to apply.

Yes they are needed.

To avoid playing with SIGPIPE, you need to use sendmsg(, MSG_NOSIGNAL)
to transmit the data, which needs to distinguish sockets and files
(can't sendmsg() to a file, and must not write() to a socket (no ability
to pass flags)), which in turn involves having xsd_sockmsg in iov[0].

The only one that isn't strictly necessary is "Rationalise the
definition of struct xs_handle" but you'd need to edit "Track whether
we're using a socket or file" to add the field to both struct
xs_handles, but I included it after breaking the build by not realising
there was a second definition.  I suggest keeping the patch.

~Andrew

