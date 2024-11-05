Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B85739BD6E1
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 21:20:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830494.1245498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Q1r-0005OY-UA; Tue, 05 Nov 2024 20:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830494.1245498; Tue, 05 Nov 2024 20:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Q1r-0005Mf-Pw; Tue, 05 Nov 2024 20:19:55 +0000
Received: by outflank-mailman (input) for mailman id 830494;
 Tue, 05 Nov 2024 20:19:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lM+p=SA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t8Q1q-0005MZ-8p
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 20:19:54 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d400f1e-9bb3-11ef-a0c5-8be0dac302b0;
 Tue, 05 Nov 2024 21:19:47 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5ceccffadfdso3980794a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 12:19:47 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb16a05c0sm178482066b.39.2024.11.05.12.19.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 12:19:46 -0800 (PST)
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
X-Inumbo-ID: 4d400f1e-9bb3-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzYiLCJoZWxvIjoibWFpbC1lZDEteDUzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjRkNDAwZjFlLTliYjMtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODM3OTg3LjE3ODY1OCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730837986; x=1731442786; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ivy6bbNy3nASRHK4MddEiT+M78nTiIEyXRAR+yxmMdA=;
        b=lrYJ696X2AhWaZB6JCZL05Qvh2sQ8r+kluqjckninL9tEWqhgJn1oNNewlbLcDC1BG
         OoP5UXthjmNxnnRFB2izRMct4hFylR29G0gYQrS0aBj2ljEFX/Z4yXfRQEfnzsuNBp82
         2J7w+dASbz/NfKF4YIJcL2cy4mDLjf6tXFlfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730837986; x=1731442786;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivy6bbNy3nASRHK4MddEiT+M78nTiIEyXRAR+yxmMdA=;
        b=U565YpOnQGfk7w9G+9ZPCEYwhXniOz2VE74MSwW5V7tOPtznYS7oJ77rSz8A06zkxc
         f4jHpdzJChm/A508FJzEPvZ5Z5ja11y/JWNDRYInudhU8hmRT+0rZFmpMMPs2DxjADQC
         +d/iDM4qMmvN2/HqyF15R0MtAOShCHdQSd+ogmntL84nzy/LiD6Y/4QZdnFWf0eFTgUB
         DOYMS8YDOkL6e9Nsb0ulZCZyHV0OkeDPZT4TMSMgCExI+M8qWbFhsmDe5QLWSeY0U32J
         vJ53qoglNK43ADg0EpI8H1dSeH3EKwCuRHrC6OkLhYXI+U/QtG5mgMXc8MUcg6/VQsSQ
         q9Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVMMs7TMHfqcc86/HpXDBHxZ9WFJW4lGexa76xr4DRftC+Ub8xWaXclLwlXZbbJmJLFFRI9yywRMQg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxiC8S1W2muWjud1owHWTCqSNha3GkQ0O2zDuUY6r59hsOoWjq2
	DenbG7N8Dm859SHUq1HTSAGVtwSyM0Jpa3lYz6OXrvM4qxKSAVHxq3XRv9ApJfU=
X-Google-Smtp-Source: AGHT+IFG3UvbWgz670F73znkGpgc8yn5v7W6dLEImDXC+vjvee8owWPRAp5QBcV/4wsPqbhprAcj2Q==
X-Received: by 2002:a17:906:561a:b0:a9e:8522:ba01 with SMTP id a640c23a62f3a-a9e8522ba90mr963577866b.39.1730837986465;
        Tue, 05 Nov 2024 12:19:46 -0800 (PST)
Message-ID: <79c4a42d-9edf-4237-986c-de73b279f134@citrix.com>
Date: Tue, 5 Nov 2024 20:19:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/libxl: remove usage of VLA arrays
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>
References: <20241028114831.27487-1-roger.pau@citrix.com>
 <3828ba9f-9bc8-4b65-a42f-b67ef061be52@citrix.com> <Zyo0M08gb5yhBiJF@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Zyo0M08gb5yhBiJF@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/11/2024 3:05 pm, Anthony PERARD wrote:
> On Mon, Oct 28, 2024 at 12:03:59PM +0000, Andrew Cooper wrote:
>> On 28/10/2024 11:48 am, Roger Pau Monne wrote:
>>> Clang 19 complains with the following error when building libxl:
>>>
>>> libxl_utils.c:48:15: error: variable length array folded to constant array as an extension [-Werror,-Wgnu-folding-constant]
>>>    48 |     char path[strlen("/local/domain") + 12];
>>>       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>
>>> Replace the usage of strlen() with ARRAY_SIZE(), which allows the literal
>>> string length to be known at build time.  Note ARRAY_SIZE() accounts for the
>>> NUL terminator while strlen() didn't, hence subtract 1 from the total size
>>> calculation.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>>  tools/libs/light/libxl_utils.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tools/libs/light/libxl_utils.c b/tools/libs/light/libxl_utils.c
>>> index 10398a6c8611..b3f5e751cc3f 100644
>>> --- a/tools/libs/light/libxl_utils.c
>>> +++ b/tools/libs/light/libxl_utils.c
>>> @@ -45,7 +45,7 @@ unsigned long libxl_get_required_shadow_memory(unsigned long maxmem_kb, unsigned
>>>  char *libxl_domid_to_name(libxl_ctx *ctx, uint32_t domid)
>>>  {
>>>      unsigned int len;
>>> -    char path[strlen("/local/domain") + 12];
>>> +    char path[ARRAY_SIZE("/local/domain") + 11];
>>>      char *s;
>>>  
>>>      snprintf(path, sizeof(path), "/local/domain/%d/name", domid);
>>> @@ -141,7 +141,7 @@ int libxl_cpupool_qualifier_to_cpupoolid(libxl_ctx *ctx, const char *p,
>>>  char *libxl_cpupoolid_to_name(libxl_ctx *ctx, uint32_t poolid)
>>>  {
>>>      unsigned int len;
>>> -    char path[strlen("/local/pool") + 12];
>>> +    char path[ARRAY_SIZE("/local/pool") + 11];
>>>      char *s;
>>>  
>>>      snprintf(path, sizeof(path), "/local/pool/%d/name", poolid);
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> Although I have a minor preference for sizeof() as suggested by Frediano.
> I have a preference for sizeof() too, we even used it this way (more or
> less) in libxl before, for `eom` here:
>     https://elixir.bootlin.com/xen/v4.19.0/source/tools/libs/light/libxl_qmp.c#L1608
>
> I was a bit supprised by the use of ARRAY_SIZE on a string literal but
> it's just an array of char :-).
>
> For the patch, with sizeof() or ARRAY_SIZE():
> Acked-by: Anthony PERARD <anthony.perard@vates.tech>

That's 3 for sizeof(), one ambivalent, and one for ARRAY_SIZE(), with
the maintainer (who gets the majority say) already in the largest group
already.

I've adjusted and committed.

~Andrew

