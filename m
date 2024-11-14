Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3030B9C8A83
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 13:46:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836405.1252296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBZEq-0000ni-76; Thu, 14 Nov 2024 12:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836405.1252296; Thu, 14 Nov 2024 12:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBZEq-0000mC-4H; Thu, 14 Nov 2024 12:46:20 +0000
Received: by outflank-mailman (input) for mailman id 836405;
 Thu, 14 Nov 2024 12:46:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBZEp-0000lC-3S
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 12:46:19 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f631ca3-a286-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 13:46:15 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4315e62afe0so5622995e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 04:46:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da29989asm22290475e9.42.2024.11.14.04.46.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 04:46:14 -0800 (PST)
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
X-Inumbo-ID: 6f631ca3-a286-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzYiLCJoZWxvIjoibWFpbC13bTEteDMzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjZmNjMxY2EzLWEyODYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTg4Mzc1LjE4NzUxMSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731588374; x=1732193174; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Cb13/s7jsd3nTX890pFjBRBjg8rCCDRlSlqAPYqgeW8=;
        b=SESqtHYyWZ4kldinsUEmqD2INspgBO6w1CV1wNStPZLgLePLLuljGSTLldilVxnE6f
         0av1D0M6BSP/urvvAtFfO5o9WQ9E7M6KbsEQDhjVTVTlBp1fusSX0H2DuuDTEgEpctud
         8YikH+I8W0omGHk7qYQEGpLLBo6vbR4bOgKyzwVhv14NeWUB3tboVmCEwQrUsNBaN9x8
         D02JdrmBYUWY3guG5f4u/o2qFZTHJFKPvOomheyOqvDMZ5TeP0FkRG+9xCecfhKfj/ga
         rtvq9/X+bRZ+kY4S0uhWRcXpI4cva6xSjQQwKHQSUUUhcUFvpicPIIHw7CZz6amr0rJn
         7KTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731588374; x=1732193174;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cb13/s7jsd3nTX890pFjBRBjg8rCCDRlSlqAPYqgeW8=;
        b=SKXfsxr9pvef56WgQBzQwHZt00Eoq87rLk0D2WanNVHR6jbTRd060aQ0u0C8osxq8K
         tcxnAbg3Xt0SyQAqWsEl6nn4ZOi1cZVwxFy1z4LoIk6llgD06m633BLH6wT3pqNUvAmJ
         fFB2n5735Nh/pzPt5yIibej7kKfOi7u/UOgH+NreQhO2aPo8bMvU4kwWXE3jbI0mOrVP
         L7jgwG7ziJHtQ9Jr+budbqFDhFYXZDLbrIcJWSGdPOCni12oiIsrWpgBUHGv2V5rx8OK
         yeVhQM1gHNDaJOZt6A8o0ge25YTF9LcWfKEfg1JdRHrr4lISu1+638DRzBQtP9uoDCEj
         kouw==
X-Forwarded-Encrypted: i=1; AJvYcCUdrYcnqVvMIsG32mD6Dzuze0wUvm6BS/meG0k81trTsDol3kxILLDftpeYzllA2U3m4hoxh/1V1yE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNFau5JGTe7zRL+3nti+CFEXJ/jsKQmPu3ZubOT4yQQe9c0bRV
	5XBlbwBiNO732ku27fjsmnkEBdRoRMWuAxzgmCXM9xaOj3bXhP53hInbw3hG8g==
X-Google-Smtp-Source: AGHT+IEal/M61rKdS/hnQOyF1gq+r7U8ifnpDJ45I7F2DR6ZLt/ZCkhgNhRmC7WB9yapZEhGETlWbQ==
X-Received: by 2002:a05:600c:3d14:b0:431:12a8:7f1a with SMTP id 5b1f17b1804b1-432b7507c50mr225311765e9.16.1731588374403;
        Thu, 14 Nov 2024 04:46:14 -0800 (PST)
Message-ID: <9482f40c-4913-4114-a951-6f92d95d4995@suse.com>
Date: Thu, 14 Nov 2024 13:46:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: preparations for 4.19.1
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Kelly Choi <kelly.choi@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ddc41c9d-9754-4fde-bac0-6389511a7f7c@suse.com>
 <686facb6-0a6a-471c-a91c-b593cee7831a@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <686facb6-0a6a-471c-a91c-b593cee7831a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.11.2024 16:20, Andrew Cooper wrote:
> On 12/11/2024 1:00 pm, Jan Beulich wrote:
>> the release is due by the end of the month. Please point out backports you find
>> missing from the respective staging branch, but which you consider relevant.
> 
> Looking over the XenServer patchqueue:

First, overall - that's quite a few. Most not even having a Fixes: tag. Or
in one case having even two of them alongside saying "no functional change".
Plus it would be really nice if someone else could take care of tool stack
backports again.

In more detail:

> These are all bugfixes, some that came from customer bugs:
> 
> e42e4d8c3e2c: tools/misc: xen-hvmcrash: Inject #DF instead of
> overwriting RIP

I'm on the edge here, but since you're asking for it, I'll include it.

> ba709d514aac: x86/viridian: Clarify some viridian logging strings

Not really a backporting candidate imo.

> d81dd3130351: x86/shutdown: change default reboot method preference

I'll include that, despite the different perspective I'm taking.

> 0d69635d27cb: tools/ocaml: Remove '-cc $(CC)' from OCAMLOPTFLAGS
> 8ffcf184affb: tools/ocaml: Fix OCaml libs rules
> 126293eae648: tools/ocaml: Drop the OCAMLOPTFLAG_G invocation
> 1965e9a93074: tools/ocaml: Fix the version embedded in META files

Provided these apply as-is, I'll blindly take these.

> e58a2858d588: x86/boot: Preserve the value clobbered by the load-base
> calculation

Based on its Fixes: tags I probably should have included this one already.

> This is a diagnostic improvement, also from a customer bug:
> 
> 2f413e22fa5e: x86/msr: add log messages to MSR state load error paths

Again - not really a backporting candidate imo.

> These are a SIGPIPE bugfix which happen to also have a perf
> improvement.  I cant remember if we discussed backporting them before. 
> (Juergen/Anthony?)
> 
> 42db2deb5e76: tools/libxs: Fix length check in xs_talkv()
> e2a93bed8b9e: tools/libxs: Rework xs_talkv() to take xsd_sockmsg within
> the iovec
> f050c03ce2ad: tools/libxs: Rationalise the definition of struct xs_handle
> 046efe529e82: tools/libxs: Track whether we're using a socket or file
> ebaeb0c64a6d: tools/libxs: Use writev()/sendmsg() instead of write()
> a17b6db9b007: tools/libxs: Stop playing with SIGPIPE

See the earlier reply to both Jürgen and you.

> These are from a livepatching snafu:
> 
> 3a28da8f4daf: xen/livepatch: remove useless check for duplicated sections
> 8c81423038f1: xen/livepatch: drop load_addr Elf section field
> 86d09d16dd74: xen/livepatch: simplify and unify logic in prepare_payload()
> fa49f4be413c: xen/livepatch: do Xen build-id check earlier
> aa5a06d5d6ed: x86/alternatives: do not BUG during apply
> 
> where the buildid check is much too late.

I certainly agree with taking the last two. The first three though are all
"no functional change", which generally I'd prefer to omit unless they're
strictly prereqs, or diverging from master is deemed to be a severe issue.

> And from looking at staging:
> 
> fa2d8318033e: x86/cpu-policy: Extend the guest max policy max leaf/subleaves
> 
> This fixes a real issue on older AMD systems.

Will include it.

Jan

