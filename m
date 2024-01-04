Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B87824327
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 14:57:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661820.1031544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLODJ-0002RA-Nx; Thu, 04 Jan 2024 13:56:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661820.1031544; Thu, 04 Jan 2024 13:56:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLODJ-0002PD-Ku; Thu, 04 Jan 2024 13:56:49 +0000
Received: by outflank-mailman (input) for mailman id 661820;
 Thu, 04 Jan 2024 13:56:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0by4=IO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rLODI-0002P7-4k
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 13:56:48 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18fe7b23-ab09-11ee-9b0f-b553b5be7939;
 Thu, 04 Jan 2024 14:56:45 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2cd0f4f306fso6188961fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 05:56:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cb7-20020a0566381b0700b0046dfa285b6esm1729jab.88.2024.01.04.05.56.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 05:56:45 -0800 (PST)
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
X-Inumbo-ID: 18fe7b23-ab09-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704376605; x=1704981405; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NsK59aOcnwYik5dcJBcILgaEN9ETgllbPPj1XPFlj/4=;
        b=cg7e3DlDKveo4CDg0+dEPbGKW/zJUbH0VuZyyONca3W3tBiAs0tDHAEkxxj2/C+1of
         5BQV1j5f+s67mAoV+CeFbhofnrjua/nzJNjP5ftC+XS7RaxzVc3gVgHUWtE2lWSsFytN
         7mseua3hZgc/HnJsF1SYYbwi/YVyY+n7XK4SyuU1Xc0hOyrE6jWtVZg7zKCrcjQ4uBQI
         G2KRm41FalhSINpsh4+b9RTXnUlLjxb3OUBcUoQEAiIKqRg8VnkEfKWGSZW25T7FPhwj
         9cVImBOkoG2vZNhMlT2SyFmA3v2JMpbz0FFsKtT9Yf7wuE5MqNMzj56hTBqX76jgIE0p
         VWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704376605; x=1704981405;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NsK59aOcnwYik5dcJBcILgaEN9ETgllbPPj1XPFlj/4=;
        b=EvUBYdiy4IHGatHyFmOKHxUkaWsgWPqXs+MYjc3yp9AI0cdGbG7NNJPCCy/v/7PObg
         /4rukWyFnvWh0lcWrcJ/smUjdHoKooPcXy1S3WQb/LR/3pFJ2/NWWdQZ1vNaTdI0afzN
         1fH33bxRF43M+QX0eF1pE3xAeB9Mj+zvMAGocSkAofCDvjbKFl4/RMvKRwUK1aRcFh4H
         J0lUzIn5uAfb+dp7vmcn14Db+9x1c8tUYagZRO67IM7qMRLVrPEoedsMHK/qw19WDIf5
         RyopgXMcG7R+Yg1FonvEqyiJAFBFGOihmgWR4gLinOAzlCfVtRGzd0sSWL01mxKt4r+I
         n60A==
X-Gm-Message-State: AOJu0YzvMYUXwN4Ou1m0zzEphBr60uQsPUCPVvvFSjTRgLhO7dYXPGcj
	H/+FbxKyUm1U62hni4YwrSq0+/wG/sOR
X-Google-Smtp-Source: AGHT+IF0QlOxQTu5Mamq6M87IvXH53PkDyEv+1KhUMUJPYes7s2ozrRKKjhsKSVnfFh7uiYhBckXUg==
X-Received: by 2002:a05:651c:2213:b0:2cc:8bd4:b860 with SMTP id y19-20020a05651c221300b002cc8bd4b860mr430123ljq.85.1704376605433;
        Thu, 04 Jan 2024 05:56:45 -0800 (PST)
Message-ID: <c604e8a5-6287-4175-93a0-3509d0e2686a@suse.com>
Date: Thu, 4 Jan 2024 14:56:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 29/39] xen/riscv: add definition of __read_mostly
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <7fec1c9f906ee120ebae606de59f9f70efb79aff.1700761381.git.oleksii.kurochko@gmail.com>
 <95542550-5f95-4231-8210-79dc2419ce61@suse.com>
 <3df1dad8-3476-458f-9022-160e0af57d39@citrix.com>
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
In-Reply-To: <3df1dad8-3476-458f-9022-160e0af57d39@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.12.2023 16:23, Andrew Cooper wrote:
> On 12/12/2023 5:04 pm, Jan Beulich wrote:
>> On 24.11.2023 11:30, Oleksii Kurochko wrote:
>>> The definition of __read_mostly should be removed in:
>>> https://lore.kernel.org/xen-devel/f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com/
>> Andrew, can we settle on what to do with that patch? If you don't like me
>> putting __read_mostly in xen/cache.h (consistent with __ro_after_init),
>> would you please make an alternative suggestion?
> 
> xen/linkage.h?  xen/sections.h?

Well, that's the problem: There's no xen/sections.h (and I don't see why we'd
introduce one just for this), and while xen/linkage.h is about to appear for
the entry point annotations, I don't think it is a reasonable fit.

Otoh with __ro_after_init ...

> Sorry - I didn't mean to block it specifically, but I do think
> xen/cache.h is the wrong place for both to live and that it's a small
> enough change to warrant sorting out nicely once and for all.

... living in xen/cache.h already, __read_mostly is even more logical to put
there than __ro_after_init. For the latter I agree the purpose isn't really
cache related, while for the former it is. From your original reply to the
patch submission, I have to admit I don't really understand what
"micro-architectural" detail you mean: The goal of avoiding unnecessary cache
line ping-pong doesn't look to be what you mean, as imo that's a valid (and
generic) goal. And that's what I think is the reason the #define presently
lives in asm/cache.h, justifying my moving of it to xen/cache.h.

So if you can't get yourself to accept xen/cache.h as the new (even if only
temporary) location, I think you can be expected to make a better proposal.
With "better" there meaning you supplying a reason for why you think that
placement is better than xen/cache.h. For example, if I knew what you
expected xen/sections.h to further contain (in the long run), I might find
myself agreeing to that. Yet other section annotation #define-s live
elsewhere anyway, with - in particular - __init and friends imo not likely
to move out of their present header (xen/init.h).

Jan

