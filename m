Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F011EA60A0A
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 08:27:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913814.1319683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tszQw-0000Wc-Ca; Fri, 14 Mar 2025 07:26:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913814.1319683; Fri, 14 Mar 2025 07:26:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tszQw-0000Sh-9S; Fri, 14 Mar 2025 07:26:18 +0000
Received: by outflank-mailman (input) for mailman id 913814;
 Fri, 14 Mar 2025 07:26:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tszQv-0000Sb-L5
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 07:26:17 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d56db8a-00a5-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 08:26:16 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so15790405e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 00:26:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe152ffsm8205315e9.13.2025.03.14.00.26.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 00:26:15 -0700 (PDT)
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
X-Inumbo-ID: 9d56db8a-00a5-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741937175; x=1742541975; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rFcwUdZjV4aCb4JuiNGr+0B/Qwx+h2+9pw2jfQTMTVw=;
        b=BeUEdPqzO33vlSc4Al6RS+XqSUm8DWfLrGUeFHozMNbBdkk6+0FAtGwOHUY7H5+H48
         VMPYh6eKBsP5JtK+1qPUc4BcstUvo3Y1xPS0t/Xovk92HHU8vrsCHEgFf0z0cg8zaBGY
         D0Ju+vq9s9YR06a1q7VgSxl7DBIZx0PnXA/bOKAlXoYm2YryPyPLlZIMxUeVwVDfwTnS
         nS124Chh0efEwYda1GKpCU2iDCZXoqlyP1kiX5c8+AvJfxAi2GRjoU5ECCksudHFXtU2
         CppNk0bfCPfewdbsj+0cBO9j/N5C6Y0UbcFBe0EdTUE/+ue2710HrgFaqKGpFbkqtpeK
         RrbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741937175; x=1742541975;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFcwUdZjV4aCb4JuiNGr+0B/Qwx+h2+9pw2jfQTMTVw=;
        b=FLwACeoJW0gHSIYTV+enlK3NrxvgR3AATMRj+V3jAQJnjy6nzLCugUz1OmEeHuPC/d
         njJlKNUn1jU0cZqdpKAJyQWFBign5M+I6rG+3gB8oq1CcSzzQZRCsv/SDS8GNmQvfy5h
         ++RuxX0EbsFZHzp1ZwlYQ7pEyqCJcIw+y9z5yEFejPPc5Ly1ZQUyhfpbyo8Af4EC1adk
         vCHMeSWjLpb+jDg711nVpamCy1WCk1+j6T6SgwsiGkxxUBrl7xjt17mIMMw45rg91mYp
         nk8jwKzOzxvwpqdq9hsZMaT1vTald/FjQQn2kWj7aBX/GHskszyIjuuSd1FbvXUF/AzE
         0jYg==
X-Forwarded-Encrypted: i=1; AJvYcCXMSSpSUg7ud3KjUOoNQkjEgdfvf8G4S9dJZGAtUF6hUw+8gGCnjXHUW/uCBAPp2oJcxx8/8jfoBcE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxoTw+0SWTD3KCsVR1li2D89xML3Eu163rNxg8OnbjEMbS+PDwS
	UEEF1nyrwlindeUARXQ5bHzfP9sVXd83HVllmQHyHCeXlihhGgfEdPx7iH9GfQ==
X-Gm-Gg: ASbGncsjSqpZtw25IOF1tuPmVQ9UOHnbkvP4+mH4Cpx2WYqsiUggHKeRfvPbMia4zKp
	09Yg+OB/BS5Tqdb4IBbKPKOyYscL45h4kFTIjKEEPSGsOz0YKoN778YcMJT/ir6smsHaDuxMixr
	rc/ld9rt4vCsrA7a/aFe0Fir/frNQ3LsGFlB2gbd/BUKOYFMhThgxHesKvtauzIv5dkmSUD+4+1
	mqfeg/YtEbjc2WyV52e3whnVtyplhqWMFB5y7OeZ3wdq68iyTHEQG1bUmyGX1q2LJl5V8HG8Mmm
	Iw7AhSVKgFRohHX9FhTBDUSfM/uKMmefaRopbnE0zz2mkf56DKlMkIwyWq8KRMDKtkT6dDkyvHA
	5sgik2S4af/ahBbr3aitToLFmpGPN9w==
X-Google-Smtp-Source: AGHT+IGBd/4I63LudYWNctqE6+C1FwHqPmogyOr+gqOWZMR3InUvUUZST+zz1dwoOl2S4MeBU5sqkA==
X-Received: by 2002:a05:600c:3505:b0:43c:efae:a73 with SMTP id 5b1f17b1804b1-43d1ec72abemr18062755e9.10.1741937175339;
        Fri, 14 Mar 2025 00:26:15 -0700 (PDT)
Message-ID: <385a98d5-0b08-45e0-90b7-bcc3a18f921a@suse.com>
Date: Fri, 14 Mar 2025 08:26:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] symbols: centralize and re-arrange $(all_symbols)
 calculation
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <58b3d7dc-5966-432c-8def-e841feaee1c8@suse.com>
 <d0521cf8-dc85-4b31-9850-2bb94c560fc5@suse.com>
 <17c27c8a-7314-4e89-9c21-f1a807867428@citrix.com>
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
In-Reply-To: <17c27c8a-7314-4e89-9c21-f1a807867428@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.03.2025 18:02, Andrew Cooper wrote:
> On 13/03/2025 1:55 pm, Jan Beulich wrote:
>> For one there's no need for each architecture to have the same logic.
>> Move to the root Makefile, also to calculate just once.
>>
>> And then re-arrange to permit FAST_SYMBOL_LOOKUP to be independent of
>> LIVEPATCH, which may be useful in (at least) debugging.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Likely syms-warn-dup-y wants to follow suit; it doesn't even have an Arm
>> counterpart right now.
> 
> Recently, I thought the same about --orphan-handling={warn,error} too. 
> We need to up it to error, and enforce it consistently.
> 
> There's actually a lot of $(TARGET)-syms which ought to be less
> copy&paste.

Indeed. Iirc like me I think you indicated you'd like to also break up
those multi-step rules, to properly work through dependencies instead.

>  I'll submit my cleanup so far, which doesn't interact here
> I don't think, but is also incomplete.
> 
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -460,6 +460,10 @@ ALL_OBJS-$(CONFIG_CRYPTO) += crypto/buil
>>  
>>  ALL_LIBS-y                := lib/lib.a
>>  
>> +all-symbols-y :=
>> +all-symbols-$(CONFIG_LIVEPATCH) += --all-symbols
>> +all-symbols-$(CONFIG_FAST_SYMBOL_LOOKUP) += --sort-by-name
>> +
> 
> I presume this works, so it's after we've processed Kconfig, but is
> there really nowhere better for it to live?

What do you mean by "better"? If we're to (slowly) centralize the
linking, this is where all of that would move. xen/Makefile is processed
just once (twice if .config changed), and ...

> If we're moving others, this is going to turn into a lot, and it's
> specific to one final stage.

... applicable in exactly that one case. Or are you suggesting to
introduce a new helper makefile where just the linking settings and
(eventually) logic live? That would be a bigger piece of work, which I'm
afraid I'm not up to right now.

For now it seemed quite natural to place all-symbols next to ALL_OBJS
and ALL_LIBS.

Jan

