Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B26189C26EE
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 22:11:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832964.1248273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9WG0-0008Rm-5B; Fri, 08 Nov 2024 21:11:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832964.1248273; Fri, 08 Nov 2024 21:11:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9WG0-0008PS-2J; Fri, 08 Nov 2024 21:11:04 +0000
Received: by outflank-mailman (input) for mailman id 832964;
 Fri, 08 Nov 2024 21:11:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALGw=SD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t9WFy-0008PM-G2
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 21:11:02 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2caa4b8-9e15-11ef-99a3-01e77a169b0f;
 Fri, 08 Nov 2024 22:10:57 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43162cf1eaaso30343865e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 13:10:57 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432bb8c3b15sm25145615e9.2.2024.11.08.13.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2024 13:10:56 -0800 (PST)
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
X-Inumbo-ID: f2caa4b8-9e15-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmUiLCJoZWxvIjoibWFpbC13bTEteDMyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImYyY2FhNGI4LTllMTUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMTAwMjU3Ljg4MzE3Niwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731100257; x=1731705057; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OxLZ5lReg8T7Q190Q0FkUEVXOrw7aGYZzDmv4DHdKB0=;
        b=rdOi4A6nsosmCgZP7old40RA7ROT6ROZ0Ulhsz+E2saIIcEK66jLR3N8wdqyZAE+gu
         x85hqNR4I6I99HQwAXiPeQnR3J2K+mXY37InC2gSUxC6IjXzIOH22WSq5HqzpIwhLoOH
         5ZpaJZbukjKhK+kg2Lpk9KlIUQt90oWq77LcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731100257; x=1731705057;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxLZ5lReg8T7Q190Q0FkUEVXOrw7aGYZzDmv4DHdKB0=;
        b=R0wbXiQT2fx5gft1BF9Qmf+VRW3k72a3duX9GEa66NngkY6l3g7/oQHH+lmaOVTfRk
         C7VLYtHkNfa6bGmAukoeGDFDFdnsHSezEmE8VwQxxLwAET9FslGFp5DQGFpVEfQVy27l
         xCViJrpe8bENB5goOOzZUUOOJNlCIRjXsjXzQZIN4uThhhv4uGbVmlcCGSGtbBWChZDC
         R1WXxzAbhzD+FwqGg9sHQ/6k51K9ZHYQTz/clv1H4krO8Crc2KQh442r2VPMFIcRvVBJ
         aQKRG4VCy23f9BBSb6RL/GhyqdACF7pC2ZkGsBeywtxcDZeO3/fum/JVoESdGquuti5/
         E71Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmsFzrjh/DSSGBmxOcKDOrJv2fWy2fapA/RuUoTCKtyvE5Puk/0hBTnFmpPppL+vXRikcEh/jqBh8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx72RzchfcfJQCBhWH6WsnqqMQJ5QV3s4CvQgLZ1o/y360PjSpl
	1MkwzOqYhp5jhFjKeoB7EfKxY3ySqdJGMiZgKbLjh4W3sdPnbDUpu03MfAHuK3Y=
X-Google-Smtp-Source: AGHT+IFjMFroz/j3YdTkrr80WJTP2e1L5dqwAtO8/uo2Z3qdXm+K841Uy2Kn9D6RpuSgCD8dse3GDQ==
X-Received: by 2002:a05:6000:2587:b0:37d:39d8:b54b with SMTP id ffacd0b85a97d-381f188af64mr4394172f8f.58.1731100257209;
        Fri, 08 Nov 2024 13:10:57 -0800 (PST)
Message-ID: <f1aa733c-b4eb-493e-88db-73e2192c8320@citrix.com>
Date: Fri, 8 Nov 2024 21:10:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] x86/boot: add start and size fields to struct
 boot_module
To: Jason Andryuk <jason.andryuk@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-10-dpsmith@apertussolutions.com>
 <bd4fa542-7e05-463d-99d7-b5c57781a56e@amd.com>
 <c8d690f9-a357-44de-a6e5-4bbab4256c51@apertussolutions.com>
 <54d9913f-55ff-46a8-b43c-2e20c5640985@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <54d9913f-55ff-46a8-b43c-2e20c5640985@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/11/2024 8:48 pm, Jason Andryuk wrote:
> On 2024-11-08 14:17, Daniel P. Smith wrote:
>> On 11/7/24 15:47, Jason Andryuk wrote:
>>> On 2024-11-02 13:25, Daniel P. Smith wrote:
>>>> @@ -1745,13 +1733,11 @@ void asmlinkage __init noreturn
>>>> __start_xen(void)
>>>>       for ( i = 0; i < bi->nr_modules; ++i )
>>>>       {
>>>> -        const struct boot_module *bm = &bi->mods[i];
>>>> +        unsigned long s = bi->mods[i].start, l = bi->mods[i].size;
>>>> -        set_pdx_range(bm->mod->mod_start,
>>>> -                      bm->mod->mod_start + PFN_UP(bm->mod->mod_end));
>>>> -        map_pages_to_xen((unsigned long)mfn_to_virt(bm->mod-
>>>> >mod_start),
>>>> -                         _mfn(bm->mod->mod_start),
>>>> -                         PFN_UP(bm->mod->mod_end), PAGE_HYPERVISOR);
>>>> +        set_pdx_range(paddr_to_pfn(s), paddr_to_pfn(s) + PFN_UP(l));
>>>
>>> This is fine today since s (.start) is checked for page alignment. 
>>> The other option would be `paddr_to_pfn(s + l) + 1`, but I'm not
>>> sure that is an improvement.
>>
>> Out of curiosity, why are you thinking that module start would never
>> be paged aligned?
>
> I think you have an extra negation - the module start is always page
> aligned as checked elsewhere.
>
> While reviewing, I was just noting that this code starts rounding
> addresses when it previously operated on pfns.  Non page-aligned s + l
> could then cross a page boundary.

It's worth saying that until this patch, Xen critically depends on
modules having 4k alignment.

This patch finally breaks that dependency, so we can e.g. load microcode
actually-early on boot.

While the modules are currently aligned, lets try and write code which
doesn't assume it.

So yes, probably best to have

    set_pdx_range(paddr_to_pfn(s), PFN_UP(s + l));

here.  (I think?)

~Andrew

