Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDCCAB3A64
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 16:24:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981552.1367950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEU4J-0006Ih-LP; Mon, 12 May 2025 14:23:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981552.1367950; Mon, 12 May 2025 14:23:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEU4J-0006Fv-IC; Mon, 12 May 2025 14:23:47 +0000
Received: by outflank-mailman (input) for mailman id 981552;
 Mon, 12 May 2025 14:23:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEU4H-0006Fp-NG
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 14:23:45 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b368620e-2f3c-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 16:23:40 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ac3eb3fdd2eso836781166b.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 07:23:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad21988cb0asm625224766b.179.2025.05.12.07.23.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 07:23:39 -0700 (PDT)
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
X-Inumbo-ID: b368620e-2f3c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747059820; x=1747664620; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NQDyP2kSWo2UfqSGbt/i0FEyz8oaEXjDkLUyz/q94dA=;
        b=MSg9bDhr4XA8aLWCqbasQSkCOx7dVB8phvEwso1ZORoCGBYC5Cc63A7l7cKRvYNgXA
         s9Y7HHUzZ/hD2U0EyCYbHceeObc2VGv5mpywwMYeWQPWEi4eCXUNOQLorcrctt1tBWI5
         +W18ar3C1o9Proc0VZz0xXslh1Wy7tZ02Htax21kBYx6sv5pskbRIYRdQ0qWsibQnbma
         50fMa+fqZWX3bITUSFBTaaMVLxdN0hgbznZuvpNFuvu14SaQ5W9ZTLCEhVQK1HvG5QXy
         dzaB7vh5n9VGHvXDVuNvX8kg+IffZNRK5orr+D27L07R/QGB4rPlCz2tM2kpi3zlNiVq
         BI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747059820; x=1747664620;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQDyP2kSWo2UfqSGbt/i0FEyz8oaEXjDkLUyz/q94dA=;
        b=Z+FbmRPY8deEO2yB2LlpV2aV6QPG4c/pukhw/Gb87JF/4xlbz3vhkDxZROEQ0iKZqc
         4GupRVBXI9b7aTTLhoSeuIiWJXKRYq7NsMSQvfknI9/UqLNztw7geaUk4Vrn3cuwSqsM
         souBonhCshy5HrzCBfHlEdhKiTBs3EZcAzofUbEVjZS4pStmfsSBrJCwWwQIZ0Pl0kJD
         8qKlHabkumFuHjtsdQlSw0vSMX3F9EV+EaB+BjAGp3SO53dQvL24MZuj7fIyRJNq1SwR
         D6AQoEi+f2RCiLLYrzyFMbMm9Vif5SaCqIeFVSEfM0xP4/Uf4CsTFJpoBsR/qqiqa1Je
         YpGw==
X-Gm-Message-State: AOJu0YwR/XdHhQX3kxslUK0vQOFqolLjrLJUEEllKrMnB+FTD3cNxXYL
	OQsbhHf55MMDCTLmMRi4lOqxAwkLSz9fCOuEiPCUBNWUe7LX5zIcFt7GRXabww==
X-Gm-Gg: ASbGncu7tY0C7eFYph/7lmGkchrRS3CwGwNV/IJEenA55AySBvYRYxSPAI+F8jz+Kw9
	3GsOag4gu2iySrdQpfpDnRAPjuUOAtHTHcAGzqPE0R0OkO6QrsXKD1g4pnyomn9jTIjD9wXX/1X
	2j65Jav1jgg6JiPMje0qbjwFU9627DjWfbY9LGCqbWRM8ZY0r7e+jhaMxQD78KhzD7L1+1hzrTp
	RiyBUWeCMuigDlyAz51b9bTCRQLgEXitSw3XM3YXYadLv9QZzlp/Ef9uZgpcFV4QZc+ORdEmUfU
	vZiRU7yoDgRl376ljOxqJJ2/yrvG1oTNjCEHpSE9PKdVC53T43hDZXvaZcHNGEG2ZQq9iWp81t1
	aTljJjiPhX44aVLCWsHNKj2/eKd4NQCriweqRfMBfhHCiLmE=
X-Google-Smtp-Source: AGHT+IFzeh0QATr23pIa0raDM0tut3oc74y3QPVklKZocxuFpw6AwhZxT6TLwwOFJ+K67Th8LF1Wdw==
X-Received: by 2002:a17:907:c089:b0:ad2:44cd:d1a8 with SMTP id a640c23a62f3a-ad244cdd412mr624864466b.56.1747059819947;
        Mon, 12 May 2025 07:23:39 -0700 (PDT)
Message-ID: <90a2e51f-326c-4126-bfc6-e2cf40969b17@suse.com>
Date: Mon, 12 May 2025 16:23:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] xen/gnttab: limit cache flush operation to guests
 allowed cache control
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-4-roger.pau@citrix.com>
 <daf9d45e-bcbf-4554-83d8-e51e3fc0ed38@xen.org> <aBnnIm-Zg1bEJmJF@macbook.lan>
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
In-Reply-To: <aBnnIm-Zg1bEJmJF@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.05.2025 12:40, Roger Pau Monné wrote:
> On Tue, May 06, 2025 at 11:15:09AM +0100, Julien Grall wrote:
>> On 06/05/2025 09:31, Roger Pau Monne wrote:
>>> Whether a domain is allowed to issue cache-control operations is reported
>>> by the cache_flush_permitted() check.  Introduce such check to limit the
>>> availability of GNTTABOP_cache_flush to only guests that are granted cache
>>> control.
>>
>> Can you outline what's the problem you are trying to solve? Asking, because
>> I don't see the problem of allowing any guest calling GNTTABOP_cache_flush
>> on Arm from any domains.
> 
> At least on x86 cache flush operations are restricted to guests for
> which cache_flush_permitted() returns true.  I've assumed the same
> would apply to Arm, since cache_flush_permitted() is also defined
> there.  If it's fine to issue cache flush operations from any guests
> on ARM, I suggest cache_flush_permitted() should unconditionally
> return true then.
> 
> The problem on x86 is that it's an expensive operation when done
> correctly, as it involves flushing the caches of all pCPUs where the
> vCPU has been scheduled.  Note however the implementation of
> GNTTABOP_cache_flush is incorrect on x86, and won't work as
> expected.

So instead of altering Arm behavior, how about rejecting GNTTABOP_cache_flush
on x86 then? It was introduced specifically for Arm, and it shouldn't have
gained any users (albeit of course we can't be sure of that).

Jan

