Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB6BB2CC53
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 20:45:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086988.1445149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoRKm-0004Bp-Bh; Tue, 19 Aug 2025 18:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086988.1445149; Tue, 19 Aug 2025 18:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoRKm-0004AM-8x; Tue, 19 Aug 2025 18:45:24 +0000
Received: by outflank-mailman (input) for mailman id 1086988;
 Tue, 19 Aug 2025 18:45:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h/XH=27=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uoRKk-0004AG-Qy
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 18:45:22 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a922fc5b-7d2c-11f0-a32a-13f23c93f187;
 Tue, 19 Aug 2025 20:45:22 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45a1b0becf5so31224805e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Aug 2025 11:45:21 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b42a771ecsm50744915e9.9.2025.08.19.11.45.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 11:45:20 -0700 (PDT)
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
X-Inumbo-ID: a922fc5b-7d2c-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755629121; x=1756233921; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E8SXjZnYZHjmNEYZBfQ8lISq+o+9vMNdKBki0NM7h2M=;
        b=qgHySCxD7rt8sRnhtg9MNLUVBaTdBEo/tgzwNs4LoYdJoDhbdYe3CNkjTaUIEjvq12
         i5NCQ46WNKS5YJIxfwTMlNtsPwLFPl9YPrp8qadM2VfzjCH9t0Dny/flLThSqkU9tnit
         aLi+INikrFHlFydHQ1RSbZMwVcaKzjN8VVrZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755629121; x=1756233921;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8SXjZnYZHjmNEYZBfQ8lISq+o+9vMNdKBki0NM7h2M=;
        b=Ko2Ye5lR8cqdrKHknMca4BQN4+1c+4KMoY9bHZvntQgtPE7fJz5yHj3urS9cIBTjtE
         kWUj/xff5Bq2IP/hiF5LOfrSKklO3eJfHmHShlutQmDOZJ/h4eJFAEgCiNIRWYb4DRn6
         8A0mLNwrKnLnCStXnORezCjsRKc/vi1inZCn2MRS+9GiLAauOxfZBjQLkv0CS/vH1WF8
         LV047RrnUrMRFPsOJ/VVJQ4rlwdiNtqtwGrhxYXutTd2bOcIgraHRwAP8KQsvOq6rWRt
         pkuczQ4NQXk98XK9T3CzhJ2Ga1YdyP9KlxJJK/2ccfIGkqZSYPoSvwiXUrKudhvoNYL7
         glFA==
X-Forwarded-Encrypted: i=1; AJvYcCWu/ol034m/Xjz6yOy29mvx+hH1NuUVTc/OOXBHv0kMA916Ii+0PkXg/vikjzj/E2yZ9f61YpDKTUI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwUg3UTAX1z6Oi5VE5HhNH1Lj5/f+G7tdFWqGBYygTrsqAet4i
	IIQxyV0xmB8/GIkFSOeebHPThJwUEAFQnvhyxLWGEDuOSg9A3V+FjsWozRIM5a8Plco=
X-Gm-Gg: ASbGnctNF/y8dOUZ3l79avuJru8yxDNBHzZLHZqbO+Kg3cN23MtdNRef1eo068zQ4Hr
	/JI9dWawkd2XyEp+o1+EFvp5/hCTPcUgFf8HEXijPCRKXJ2DhD4WHoES5bdkgfWvnVlOaRG2e/Y
	ErMkL1skQ9Z7GuwLF2kRwdtxaJV46V+SPu55V6btX9n2unXSGbRP3k+8TbRdOtRwgYbZ/6PrpBT
	Xqa4L34s42lPOPaK4PGeBkUzG/L45XtSoqZNUUIkIIZzwd/aqR6mpoU1+P1+DeK7D8heMVK/wLB
	x+/GLzRM9d6U4J98g8wiwZAGh5y5W3Rjd3xwV0lY4WhmRVJ/69ksVxplUtDG5SrVZUaKUp9i4SZ
	fboW3bEeM02stqu6MXtR+ik1ORtwcQZRSA1VCROCzz+aDgqLM/apsj/quqU3rMgsS568I
X-Google-Smtp-Source: AGHT+IF+0seg0KGdmguGVbTZeUDCcQdzSXS8ESCL9+2ynqnS7ZeVByoIw8kqDa6iACyLJyYElhdHXA==
X-Received: by 2002:a05:600c:46c6:b0:456:24aa:9586 with SMTP id 5b1f17b1804b1-45b43dfff1amr28232785e9.21.1755629121261;
        Tue, 19 Aug 2025 11:45:21 -0700 (PDT)
Message-ID: <8b852798-83ec-4f10-99c2-ae5f0bca7038@citrix.com>
Date: Tue, 19 Aug 2025 19:45:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] common: make page_{is,get}_ram_type() x86-only
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <a2dc40a8-908a-44a7-b443-90f492a775cc@suse.com>
 <4a568ff4-2cfd-40ec-b249-217fab34f4ec@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4a568ff4-2cfd-40ec-b249-217fab34f4ec@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/08/2025 8:57 am, Jan Beulich wrote:
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -464,6 +464,16 @@ extern bool opt_pv_linear_pt;
>      ASSERT(((_p)->count_info & PGC_count_mask) != 0);          \
>      ASSERT(page_get_owner(_p) == (_d))
>  
> +#define RAM_TYPE_CONVENTIONAL 0x00000001
> +#define RAM_TYPE_RESERVED     0x00000002
> +#define RAM_TYPE_UNUSABLE     0x00000004
> +#define RAM_TYPE_ACPI         0x00000008
> +#define RAM_TYPE_UNKNOWN      0x00000010
> +/* TRUE if the whole page at @mfn is of the requested RAM type(s) above. */
> +bool page_is_ram_type(unsigned long mfn, unsigned long mem_type);

Making it x86-only is fine, but if you're changing the return type,
mem_type can become shorter too.


Also, I'm struggling to convince myself that page_is_ram_type() is
correct.  Even if it is correct, it is horribly inefficient, and we run
this algorithm lots on boot.

Checking the type before the range is the backwards way of doing this,
and it can be a binary search because we go out of our way to fix
unsorted e820 maps.

Finally, acpi_memory_banned() shows that this really isn't the greatest
API in the first place.  It's explicitly designed to take multiple
inputs, but does the wrong thing for its' single caller wanting that
behaviour.  I can't help but feel we'd be in a better position by
removing this entirely and using plain E820 queries.

~Andrew

