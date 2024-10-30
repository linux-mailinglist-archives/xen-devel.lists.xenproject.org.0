Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAF49B61F5
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 12:36:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828123.1242960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t66zI-0007z5-2q; Wed, 30 Oct 2024 11:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828123.1242960; Wed, 30 Oct 2024 11:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t66zI-0007wS-03; Wed, 30 Oct 2024 11:35:44 +0000
Received: by outflank-mailman (input) for mailman id 828123;
 Wed, 30 Oct 2024 11:35:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LV2z=R2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t66zG-0007wK-Gi
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 11:35:42 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1514a2a6-96b3-11ef-99a3-01e77a169b0f;
 Wed, 30 Oct 2024 12:35:37 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c9634c9160so7440345a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 04:35:37 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b2fe2af5dsm570178566b.172.2024.10.30.04.35.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 04:35:35 -0700 (PDT)
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
X-Inumbo-ID: 1514a2a6-96b3-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmIiLCJoZWxvIjoibWFpbC1lZDEteDUyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjE1MTRhMmE2LTk2YjMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjg4MTM3LjA2NDI5LCJzZW5kZXIiOiJhbmRyZXcuY29vcGVyQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730288136; x=1730892936; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kkiMXBmwyQDKmvHfS1H+wZ4E1eR2+OZ2gEwbQceyg1Q=;
        b=Kxpn2IH/dmeJG4SGwM4KtIpRCWjozcTC5eosB8OaBihIYXtjofZYa2Xo/xaOdGYPDv
         pWTkFCcHvDviD4r2xLiNlM5vvUskOlY1b+PJOw44rSg1VprjDNd8fTsiBqo2/CUWIpw4
         gzfl6F6m6JIt1pulVmjcZCK8Pr67hkeGH+c90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730288136; x=1730892936;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkiMXBmwyQDKmvHfS1H+wZ4E1eR2+OZ2gEwbQceyg1Q=;
        b=MErsQKHRHbThlV3e/sI8rmgT/qyoefXXSlq0nsEtIOBs1a+OkaYIZav6YkDYQpwQYn
         FL1hU8MUJjoLmOaZx1HhxXx70xeDqXtxaDleZcSvpxehXji3zMcUAfUILCc106pXGVYH
         4yhsFjn3aa4S6NX+ixNKng0uDTqXMjYqjyg5Pc9SB8I/6b4VbmFr4J4F2vVViJEj9SNA
         lXu8KgRBbJVKcBLGGvnd66uMdbZwDN4jJ4izNz1KPmA3dVqXO1DHaP9VeV7Mywc7QNIq
         ddSeqRXHnJVFTGKWJYWfuV3IzAesZA2HSig8ldNvFTcFbNqms8WPyrGaNzQ99/xd/6bR
         v5+g==
X-Forwarded-Encrypted: i=1; AJvYcCWR9ZGOLKxCfYFbY5mPCHauvG/IDVdbwdiOevRI+7Lpqt1dO32ElpaO3+BRNBpbzSjHl8uoQUiagrs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyB+V5w7hNqqRRDtqG5ws4FDnEobduDS5hIaIa1s5LCi201RdjD
	c9mxxSjZgdCJB399Ql5KNvtHhEZsb4HHxw6ynlAoo6FjoD3yp3RDee3GtdklLiM=
X-Google-Smtp-Source: AGHT+IFPKET+H8JIv1p712RWXpYSeYKWdfMbNOVNd+b6NBcpUO65wnHwjIViaLdNDVJUo3Ue9CM/kg==
X-Received: by 2002:a17:906:6a28:b0:a9a:e9c:1d8d with SMTP id a640c23a62f3a-a9de5ed2633mr1407932866b.17.1730288136381;
        Wed, 30 Oct 2024 04:35:36 -0700 (PDT)
Message-ID: <89b2d609-f298-4dc8-b893-dc52468694ae@citrix.com>
Date: Wed, 30 Oct 2024 11:35:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/setup: Make setup.h header self contained
To: Jan Beulich <jbeulich@suse.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241030104406.2173357-1-frediano.ziglio@cloud.com>
 <1fa03cb0-ded1-4904-8830-f3feefecc404@suse.com>
 <CACHz=Zh04AhAwdhYY=i4DecvJbPMF770PE6SkLG+LzQLxueOMQ@mail.gmail.com>
 <8984f1da-d4bb-4ab7-b1dc-bcc23c180abc@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <8984f1da-d4bb-4ab7-b1dc-bcc23c180abc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/10/2024 11:17 am, Jan Beulich wrote:
> On 30.10.2024 12:15, Frediano Ziglio wrote:
>> On Wed, Oct 30, 2024 at 10:59 AM Jan Beulich <jbeulich@suse.com> wrote:
>>> On 30.10.2024 11:44, Frediano Ziglio wrote:
>>>> The header uses rangeset structure typedef which definition
>>>> is not included.
>>> And it doesn't need to be. For
>>>
>>> int remove_xen_ranges(struct rangeset *r);
>>>
>>> we don't need ...
>>>
>>>> --- a/xen/arch/x86/include/asm/setup.h
>>>> +++ b/xen/arch/x86/include/asm/setup.h
>>>> @@ -2,6 +2,7 @@
>>>>  #define __X86_SETUP_H_
>>>>
>>>>  #include <xen/multiboot.h>
>>>> +#include <xen/rangeset.h>
>>>>  #include <asm/numa.h>
>>>>
>>>>  extern const char __2M_text_start[], __2M_text_end[];
>>> ... this, a mere
>>>
>>> struct rangeset;
>>>
>>> forward decl will suffice.
>>>
>>> Jan
>>>
>> It's true, but for the same reason, we could avoid including
>> "xen/multiboot.h" and use "struct module" instead of "module_t".
> Indeed. I'd even question the need for that typedef.

Please don't got playing with includes of multiboot.h.  All you'll do is
interfere with Daniel's in-progress series.

Most includes are getting removed.

~Andrew

