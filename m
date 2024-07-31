Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 973C494271D
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 08:45:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768249.1179018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ34t-0004TU-NS; Wed, 31 Jul 2024 06:44:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768249.1179018; Wed, 31 Jul 2024 06:44:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ34t-0004Ru-Kh; Wed, 31 Jul 2024 06:44:51 +0000
Received: by outflank-mailman (input) for mailman id 768249;
 Wed, 31 Jul 2024 06:44:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZ34s-0004Rd-CW
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 06:44:50 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61844ffd-4f08-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 08:44:48 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5a3b866ebc9so7441542a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 23:44:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad92ffbsm739347166b.171.2024.07.30.23.44.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 23:44:47 -0700 (PDT)
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
X-Inumbo-ID: 61844ffd-4f08-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722408288; x=1723013088; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LhroYgtrHmoaNenjWMxK/tFHgoPEfidNBY64i/Togs4=;
        b=LZmEpP7sb3VTlDU9WFUEvVtdETbQUsBiDsEpgCNqCRt6DzL2rrs5v+NdCd+V1oa99f
         rcHP+5B9ZDyVOQrgysqfmDaKTA5/mbUPnDR5JeN0aGN4S1t1dnrt2JSsS4QApTRc1eZa
         4PBpueovH80359yHLsarI52CHQO5EcPJlI017ALgwEY09Am9taMehGmE9erzUat161Y3
         lur+W76do50YfxZpgXh/j1jhSPT2skUn0mAYuxOecN8AhoE3Sqy66wMU6Xzjvaz1+Te0
         6TkA301CXyBQSva5XKGGk3gf6XjK2IfxrjXpaGiDYkD4AUNq+R4X/Ibhgh5T55fdGsoJ
         Az+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722408288; x=1723013088;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LhroYgtrHmoaNenjWMxK/tFHgoPEfidNBY64i/Togs4=;
        b=UM8KddOuj8hfG/vVqE6fGzyaIERDcQFoq4pHYEMcQSddGeoy9IK8TYQsIy3Th+Zz0/
         rBdnG0eHD65cFdtVndwXQnWoXf1IEET+FDQ4WLzxQsVNTn2IIgctB52OEpIzScjslEOv
         P+wbrWP/+nAUH0kayB2EOmkhCh8oDuiVlVkHz5St8elgZeC/ZGIgielt/9Rqwsmkfs5p
         +KJHB16OVrswEkxKOc41V4sjWJeflwPqTylVSoCjOZmnVYz4LtKtpAojehmgUz73VSyi
         sezglLP1/yooPlXjQ8fdjiB2FeWRaPZSKaE5HCkFSWscJPhL9g3/WXiq5RoCl8pz76lA
         frVw==
X-Forwarded-Encrypted: i=1; AJvYcCWWANsWGhTatadO9Z+Req4yXcejRb44YMCfpmfTJ6JIIs1Dett0YgNSEQWYC4No+f6UCHhFFg9ydMisEkDarG8dtC6RapZJsknJQsT+dEk=
X-Gm-Message-State: AOJu0YzjAZFRrjRnyiMrdSJIn16kqHyJkDzbJ408Z4tyO1k9vih8GlqX
	buMMmMAf7u+x26oVtXyzrPMnCrh4FRe0owiaUG1xiIffKjOqi5knFFFWydpebvFLaTn6sEWN/gw
	=
X-Google-Smtp-Source: AGHT+IGMhpKo/iAjO4bUmjREmYWg0UXJa9Yy3ff6iD25x6fjI81wdnPhfFaj3scLmrqK7E33GFRmdw==
X-Received: by 2002:a17:906:f59f:b0:a7d:3617:b5f5 with SMTP id a640c23a62f3a-a7d401290d9mr881599966b.42.1722408288013;
        Tue, 30 Jul 2024 23:44:48 -0700 (PDT)
Message-ID: <3918b171-b908-4962-8fdf-5236056902f8@suse.com>
Date: Wed, 31 Jul 2024 08:44:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/dom0: only disable SMAP for the PV dom0 build
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240730152855.48745-1-roger.pau@citrix.com>
 <20240730152855.48745-3-roger.pau@citrix.com>
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
In-Reply-To: <20240730152855.48745-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.07.2024 17:28, Roger Pau Monne wrote:
> The PVH dom0 builder doesn't switch page tables and has no need to run with
> SMAP disabled.
> 
> Use stac() and clac(), as that's safe to use even if events would hit in the
> middle of the region with SMAP disabled.  Nesting stac() and clac() calls is
> not safe, so the stac() call is done strictly after elf_load_binary() because
> that uses raw_{copy_to,clear}_guest() accessors which toggle SMAP.

And that was the main concern causing the CR4.SMAP override to be used instead,
iirc. While I'm sure you've properly audited all code paths, how can we be sure
there's not going to be another stac() or clac() added somewhere? Or setting of
EFLAGS as a whole, clearing EFLAGS.AC without that being explicit? I think we'd
be better off sticking to the fiddling with CR4.

> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Considering the bug Andrew pointed out on the code you remove from setup.c,
don't we want a Fixes: tag as well?

> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -830,6 +830,15 @@ int __init dom0_construct_pv(struct domain *d,
>          printk("Failed to load the kernel binary\n");
>          goto out;
>      }
> +
> +    /*
> +     * Disable SMAP to allow user-accesses when running on dom0 page-tables.
> +     * Note this must be done after elf_load_binary(), as such helper uses
> +     * raw_{copy_to,clear}_guest() helpers which internally call stac()/clac()
> +     * and those calls would otherwise nest with the ones here.

Just in case you and Andrew would outvote me on which approach to take:
I'm okay with "helpers" here, but the earlier "such helper" reads a little
odd to me. Imo using "that" or "it" instead would be better. Not the least
because personally a function like elf_load_binary() goes beyond what I'd
call a mere "helper" (in that case dom0_construct_pv() toos could be deemed
a helper, etc).

Jan

