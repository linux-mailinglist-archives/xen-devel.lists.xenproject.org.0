Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E303CB0A5E3
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 16:10:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048822.1419008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uclnS-0002VY-N9; Fri, 18 Jul 2025 14:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048822.1419008; Fri, 18 Jul 2025 14:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uclnS-0002U7-KK; Fri, 18 Jul 2025 14:10:46 +0000
Received: by outflank-mailman (input) for mailman id 1048822;
 Fri, 18 Jul 2025 14:10:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00bL=Z7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uclnR-0002U1-QL
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 14:10:45 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fee45bf3-63e0-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 16:10:45 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso1270821f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 07:10:45 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca5c952sm1934586f8f.86.2025.07.18.07.10.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 07:10:43 -0700 (PDT)
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
X-Inumbo-ID: fee45bf3-63e0-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752847844; x=1753452644; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Amc+prRBuSWnpVeiezNXH28zfjyuFw5nteCQcly1Z5I=;
        b=XBWgE3m1QjOqM0v4a3qXRPHp4gd4f9hE/E35Uo+Pl2ec6dnh52Ly3ZUuJtT4UAQ905
         rQqONrcFwzMdhXoQNBCaa8gBFMeMnxXRoCszssldu07XkddRVxGbhhpnRau46w+QkXGy
         W9t3+tMveE0lkzCmvkyyl4xQNaPxjLOWAI5V4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752847844; x=1753452644;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Amc+prRBuSWnpVeiezNXH28zfjyuFw5nteCQcly1Z5I=;
        b=YOfGZP9GTh59Oyhycpcuc1Stzs5F/DTKBthVB/wclSCETIfzAu8AE63D8uppzWVMr+
         V6nDjpb6uocq/dZl9zxUG9U3N6f+i33GdXoWlaB6ATZuQVuLMW5NbpHgMGD1HPEHLNHy
         x4WVLR6P0l/+CRz6HaUzDZ5/OJ1gKzSj223B0uZUbVMEDouCwkRJt1iKGjhI50n1POhB
         TkXmnHuZ55LbPlkZg6RBU/CJpTq3B93mOQ/JOdaDAwhjfMlH1Bm09TJwaZQE6hV/t4rZ
         Fu5nyfptWRm3dawfNGdtlfo6TDmCzzkdAAFCkzhCceNUI1EwhJDBDcgAhRKZq//PN0SD
         gg7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNG0WCDsUJpavTdBrSFJRC3FjcuzcEmiMvMYNMh/WInSx7YSFIT2ox4M9TEgRUK2lCuWECHKOM8D0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yywe0Gzu9/xbbgh+dPQAFOv9aAXrzNF+AQvO8wGpsfEWMiDz6SN
	aQ4AY1g+vNKDsZHxp1a+uEiy4Q9H+HIeHU/H4DYuZhNCfyVAyCH0MhrTCLe3LBrQWjQ=
X-Gm-Gg: ASbGnctMi4bvzJ2KegujiuUatMxb8Ptcmb8+Q+dLdnECtOVBTJv+nPedDxTYHOjDBzb
	V7eFx2md8cvppp+xsiIfZyJqmmx8/fsOb0+1YDjmYmmzkkzWGQFmf3euM/l6mTChUX91es+NuxS
	NNiWARQTjdad1irsF7eCVgD4hffdr03z7Ekzw77b772k6VcZMD8bC/xKE3i5GEXxbv6nlhakVda
	DsMKVWyMflYcZJYB3SHLkAdJOTFOER4XuD/RR/7yD7T/vVt/WFG92s8k/hfIw0lN3MDIGkrOd8d
	wSVjiVvkzJ3J6xT6oGQ/JCIUTsl1kxt+fR0k7SmAo9v79bsMudAgq4/OqnPkSbfEahveW/k4pEs
	A1kc5eCWr4Vlz5gNmnfG5XJJTqTb8VUMqzFgn84t5bv4rGRhCc3TxUghPUgzu/HQx7FqA
X-Google-Smtp-Source: AGHT+IEbQmk1yiHXNmRzb1PgFb4lHx5I5SJdFBrTnH2tWBMHYEFA8p0lyzP3gGqQ/h+iDPKplOma1A==
X-Received: by 2002:a05:6000:4022:b0:3a4:d6ed:8df8 with SMTP id ffacd0b85a97d-3b613ea2606mr6272207f8f.39.1752847844403;
        Fri, 18 Jul 2025 07:10:44 -0700 (PDT)
Message-ID: <43003ffe-d765-4917-9826-f4ceaeb927e8@citrix.com>
Date: Fri, 18 Jul 2025 15:10:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1.1 6/6] x86/apic: Convert the TSC deadline errata table
 to X86_MATCH_*()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716173132.2213891-7-andrew.cooper3@citrix.com>
 <20250718100739.2369750-1-andrew.cooper3@citrix.com>
 <4de09b8d-d71d-439e-be1c-78044a3cad31@suse.com>
 <9c820057-3e36-45dc-b71a-95c9d2dc4398@citrix.com>
 <772fd747-199c-4635-9f35-91468b0d12e9@citrix.com>
 <44b890e3-56a4-48da-a5b0-2aae87dc2f77@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <44b890e3-56a4-48da-a5b0-2aae87dc2f77@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/07/2025 3:06 pm, Jan Beulich wrote:
> On 18.07.2025 12:55, Andrew Cooper wrote:
>> On 18/07/2025 11:23 am, Andrew Cooper wrote:
>>> On 18/07/2025 11:19 am, Jan Beulich wrote:
>>>> On 18.07.2025 12:07, Andrew Cooper wrote:
>>>>> With the ability to match on steppings, introduce a new X86_MATCH_VFMS()
>>>>> helper to match a specific stepping, and use it to rework deadline_match[].
>>>>>
>>>>> Notably this removes the overloading of driver_data possibly being a function
>>>>> pointer, and removes the latent bug where the target functions are missing
>>>>> ENDBR instructions owing to the lack of the cf_check attribute.
>>>>>
>>>>> No functional change.
>>>>>
>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>> Thanks.
>> Actually, this isn't as no-functional-change as I thought.
>>
>> X86_FEATURE_TSC_DEADLINE has been swapped for X86_FEATURE_ANY in the table.
>>
>> check_deadline_errata() is called unconditionally, without checking for
>> TSC_DEADLINE, yet the rows in the table are the CPUs for which an
>> erratum is known, so they all have the feature.
>>
>> It does make a difference if e.g. one were to boot with
>> cpuid=no-tsc-deadline.  Previously we'd have exited early, while now
>> we'll emit the warning.
>>
>> We could switch back to using TSC_DEADLINE (requiring a more complicated
>> X86_MATCH_*() wrapper), although a better option would be to predicate
>> the call to check_deadline_errata() with a feature check, because it's a
>> much more recent addition to AMD CPUs, and there's no point searching
>> the errata list on CPUs which lack the feature.
> To be honest in this case I'd be fine with either adjustment. Switching the
> feature back is more consistent with the overall purpose of X86_MATCH_*(),
> but as you say a table with every entry having the same feature named isn't
> very useful to go through when the feature isn't there.
>
> One option to keep things table based, yet still avoiding to run through
> the entire table, would be to allow for a "negative" entry (which here
> would simply be placed first in the table).

Except that would be an example of { ANY, ANY, ANY, ANY,
ALT_NOT(TSC_DEADLINE) } which we can't express currently, and we also
said we didn't want to get into the habit of.

I'm going with one extra boot_cpu_has() check, and an expanded commit
message.

~Andrew

