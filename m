Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CB39B7E3C
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 16:22:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828804.1243831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6WzB-000441-Lr; Thu, 31 Oct 2024 15:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828804.1243831; Thu, 31 Oct 2024 15:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6WzB-00041a-IM; Thu, 31 Oct 2024 15:21:21 +0000
Received: by outflank-mailman (input) for mailman id 828804;
 Thu, 31 Oct 2024 15:21:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7hTS=R3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t6WzA-00041S-BR
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 15:21:20 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c38d3564-979b-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 16:21:14 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a9a6b4ca29bso115865866b.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 08:21:12 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e56681a76sm78639166b.199.2024.10.31.08.21.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 08:21:11 -0700 (PDT)
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
X-Inumbo-ID: c38d3564-979b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MjkiLCJoZWxvIjoibWFpbC1lajEteDYyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImMzOGQzNTY0LTk3OWItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzg4MDc0LjM3Mjg1Miwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730388072; x=1730992872; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RJyJO+PLd+miWz+ijNCQm/KfKDxzP2ktblu2wMgxkxU=;
        b=VTFBnaVekGuMRx9qtVG6eoFE4w0egY8kkCth0eXGf7EQCVoSXkprsTL2WGwlLZSqNi
         UOVHyGKq5rtS+TX+0/Oua0AgZ+Z6S4cPjarAiOYYTL3azllZ4MZwsaJVFw9P6rREPD/2
         8HWmK1HjxlvebtOPVEJ4gdjv/aROHnBuvPRRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730388072; x=1730992872;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJyJO+PLd+miWz+ijNCQm/KfKDxzP2ktblu2wMgxkxU=;
        b=pqNg6y26deP72FfU3oq9h+ecF2wodrEXmnXejF8CmBa6ckwKozyiTknNDef5p5c3/9
         tY2tO5F5MQL+ZYsKuueMLsZWURFWrLAPUf8Cwez0XKbepylru2ZiinyO5UlyHDlXNhqS
         yc6RUoCr4QztcNaJO8zI8RN09wVfmQA/dvmltpKCjLVjVgFhJQIpLkWJrB4f1JQY5NDL
         nN0x0yIkT6Inm+4gublEr2qxhfuUKNxbCBkPwgJvIieLG5ihWqs53BDTuCVxW+6z/zBo
         khB3bSKpbRXZumBlaqrgQmQnpNd8OWpHe+20vnwUtnNbwCAI1tgmIETXtqcwVni7qmHS
         GFUw==
X-Forwarded-Encrypted: i=1; AJvYcCXPk57NfQVaio3cULU2fmgaGQItU+AO2nAy+zkQuFHygjMioHJ4jIrEZS3j3eVXKhkQTtOFKvkMmhM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx2ObpedyAF0YL905NykdzqwTuUJDJRpAT9fLxG8Y93Znl1hUKN
	tRutW7ZXu6eruLMR60No7PXVUC2C8CdlUPOi58ZgE+593QJ+odLyKQuYEukRXOg=
X-Google-Smtp-Source: AGHT+IFrJdGx8j9gM+spW064VzqnyKXcezTxa2dx58yD31LGsHzhsZQrhpU5QijUmI0xesq84EkLCQ==
X-Received: by 2002:a17:907:72c4:b0:a9a:f82:7712 with SMTP id a640c23a62f3a-a9e50b672abmr317935466b.52.1730388072389;
        Thu, 31 Oct 2024 08:21:12 -0700 (PDT)
Message-ID: <a95f47b4-27e7-4d03-8be7-f2b7a1991092@citrix.com>
Date: Thu, 31 Oct 2024 15:21:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] Config: Update MiniOS revision
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20241030180332.2726909-1-andrew.cooper3@citrix.com>
 <a76d84a3-d150-4836-8ad2-ee0eeabe557b@suse.com>
 <c84ef564-98de-451d-af4e-04e824231ea6@citrix.com>
 <701da657-a709-4c2b-908f-2bfe193948ca@suse.com>
 <9ad2c3b7-ef2a-4888-a24f-77aebfedb6fe@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9ad2c3b7-ef2a-4888-a24f-77aebfedb6fe@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/10/2024 10:24 am, Andrew Cooper wrote:
> On 31/10/2024 10:02 am, Jan Beulich wrote:
>> On 31.10.2024 10:46, Andrew Cooper wrote:
>>> On 31/10/2024 9:25 am, Jan Beulich wrote:
>>>> On 30.10.2024 19:03, Andrew Cooper wrote:
>>>>> A new branch from xen-RELEASE-4.19.0, for now containing commit
>>>>> a400dd517068 ("Add missing symbol exports for grub-pv").
>>>>>
>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>> ---
>>>>> CC: Juergen Gross <jgross@suse.com>
>>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>>>> CC: Julien Grall <julien@xen.org>
>>>>> ---
>>>>>  Config.mk | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/Config.mk b/Config.mk
>>>>> index 03a89624c77f..aa3d5843f1ed 100644
>>>>> --- a/Config.mk
>>>>> +++ b/Config.mk
>>>>> @@ -224,7 +224,7 @@ QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/qemu-xen.git
>>>>>  QEMU_UPSTREAM_REVISION ?= qemu-xen-4.19.0
>>>>>  
>>>>>  MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
>>>>> -MINIOS_UPSTREAM_REVISION ?= xen-RELEASE-4.19.0
>>>>> +MINIOS_UPSTREAM_REVISION ?= xen-stable-4.19
>>>> Wouldn't we better use a hash here, like we do on staging? There had been
>>>> cases where it wasn't safe for the used commit to move "automatically", and
>>>> the same could occur on a stable branch. The hash would then be replaced by
>>>> a release tag when a release is being prepared (again like on staging).
>>> It will only be getting build fixes, not new content.  So it will be
>>> stable-enough in that regard.
>> Hmm, can we really expect it to only ever be build fixes, not fixes of any
>> other kind (which then may have dependencies)? Jürgen, Samuel, what's your
>> take?
> The reason I needed to make a branch (and I've got 4.18 (shared with
> 4.17) and 4.16 also queued up) is to avoid taking intermediate changes
> while backporting a build fix.
>
> The last time this happened was Xen 4.6.
>
> The reasoning would be different if we backported new features, but we
> don't as a matter of course.

The failure to make git-checkout.sh work with branches forces an answer
here.  I'm going to need to use full SHA.

~Andrew

