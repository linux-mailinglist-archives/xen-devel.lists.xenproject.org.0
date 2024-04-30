Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3A68B6E16
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 11:20:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714659.1115927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1jf0-0007z6-2A; Tue, 30 Apr 2024 09:20:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714659.1115927; Tue, 30 Apr 2024 09:20:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1jez-0007wS-Tq; Tue, 30 Apr 2024 09:20:25 +0000
Received: by outflank-mailman (input) for mailman id 714659;
 Tue, 30 Apr 2024 09:20:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q3to=MD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1jey-0007wK-Cu
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 09:20:24 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df4a9b1f-06d2-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 11:20:23 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-34d7d04808bso287860f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 02:20:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k6-20020a5d6286000000b0034c124b80f7sm13156131wru.61.2024.04.30.02.20.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 02:20:22 -0700 (PDT)
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
X-Inumbo-ID: df4a9b1f-06d2-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714468822; x=1715073622; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z2i30mpupT8ZxqQiWGmJvRyxB0qxx7Sv+Wtac7RQQpQ=;
        b=Q8K5eB5YY89lqcO/MdQdWXhfiCIh6K4rKRstoXJrF5muCFtk1V2mhIVVKn/B4mfj8H
         ywd1RwRoBv1sJy0zfS9dNmfj5hRBKthra4Jr9yqVc5/8275CGoggmjRpEa3ZXEluvRGP
         OxZeZhIUl/RXNEQ3cCrJzQ7j6ZVua15E3gtia7t6Qj8WknGSQPB3vnR26NXyZwr+Z0Jg
         g9KwQXBN1Lpx64V3dV/VerTFNIx8i71jQ9na2Q1tW9xv2XHasuX/tJi/shp8h7HS8tA1
         PSLzcTi7sxbq7WAJ3L6BCFw0r5byrpRuJlluTsgO5esVNtTFZo6RtZRsFvLmwnCnG41z
         2hhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714468822; x=1715073622;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z2i30mpupT8ZxqQiWGmJvRyxB0qxx7Sv+Wtac7RQQpQ=;
        b=ocYUVboCu2PlQSl+Aou6w6vbfEpOs95r6hciaJArRzXaxlbVFk9D9LE8tnINMqJhc/
         7tue7i43keRNyX3VWQno0/EDj1Tnyh8yv4JBRdQeRYfT3Ws3O16LCESCeEeoxu+wQu3M
         X0uu3lUjIVtp79HRwzzuHtu9PAWKFFXd5Gk+1XyGAIHDHQ2YJ+XgtKx0KIbiFcx9rFhK
         u3TxxxutHiDcPHpd19SySxBXK9LSbt0+teRPCe8wvRpxs6ZlQ4TMSudYiFVCHTuPuDDG
         U8gyjncE1ORks+x7FbWhPRj4X0Yu3m3oE09cTylDWlP0uu+7lgPdaBN61WVrspNfeceW
         iw+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXgh7fkewk+i9ajOc6wWZTciziiukysBT46/560eC9WFxhZDdu+dHmHQCV7musFxS242EB0HjikVJLkJ/BKu3JyeyNjnwskd1V/KqrLFUw=
X-Gm-Message-State: AOJu0YxxGv27basvVjdVCRUI/LVmZ77HCeEPlHakGrLiLRi31Q+B4raV
	DyhBC8RbBFrk+oDQHvuc40Mrf3f29ryg3Ifv8oiFVrp3DYJX4QZbU0XUHrgkGg==
X-Google-Smtp-Source: AGHT+IHPVnQbze3Lzrvc9VDtyeYkxP4bH4eLhZn56edwt2+/eGOt2tkt6R/GlBpvgybgjKfWAVNO2w==
X-Received: by 2002:adf:f504:0:b0:34d:9fb2:5148 with SMTP id q4-20020adff504000000b0034d9fb25148mr521483wro.31.1714468822583;
        Tue, 30 Apr 2024 02:20:22 -0700 (PDT)
Message-ID: <1b64477c-f602-4a1d-9218-a115c8a4132c@suse.com>
Date: Tue, 30 Apr 2024 11:20:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] x86/spec-ctrl: Introduce and use DO_COND_BHB_SEQ
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240422181434.3463252-1-andrew.cooper3@citrix.com>
 <20240422181434.3463252-7-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240422181434.3463252-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.04.2024 20:14, Andrew Cooper wrote:
> @@ -322,12 +334,9 @@
>      ALTERNATIVE "", __stringify(DO_SPEC_CTRL_ENTRY maybexen=1),         \
>          X86_FEATURE_SC_MSR_PV
>  
> -    testb $SCF_entry_bhb, %bl
> -    jz .L\@_skip_bhb
> -    ALTERNATIVE_2 "",                                    \
> -        "call clear_bhb_loops", X86_SPEC_BHB_LOOPS,      \
> -        "call clear_bhb_tsx", X86_SPEC_BHB_TSX
> -.L\@_skip_bhb:
> +    ALTERNATIVE_2 "",                                          \
> +        "DO_COND_BHB_SEQ clear_bhb_loops", X86_SPEC_BHB_LOOPS, \
> +        "DO_COND_BHB_SEQ clear_bhb_tsx",   X86_SPEC_BHB_TSX

Only spotting this while doing the 456 backport to 4.9: While this
is all usual and fine, ...

> @@ -433,13 +442,9 @@
>       * Clear the BHB to mitigate BHI.  Used on eIBRS parts, and uses RETs
>       * itself so must be after we've perfomed all the RET-safety we can.
>       */
> -    testb $SCF_entry_bhb, %bl
> -    jz .L\@_skip_bhb
> -
> -    ALTERNATIVE_2 "",                                    \
> -        "call clear_bhb_loops", X86_SPEC_BHB_LOOPS,      \
> -        "call clear_bhb_tsx", X86_SPEC_BHB_TSX
> -.L\@_skip_bhb:
> +    ALTERNATIVE_2 "",                                          \
> +        "DO_COND_BHB_SEQ clear_bhb_loops", X86_SPEC_BHB_LOOPS, \
> +        "DO_COND_BHB_SEQ clear_bhb_tsx",   X86_SPEC_BHB_TSX
>  
>      lfence

... the original use of ALTERNATIVE_2 here is safe only because for
the idle domain SCF_entry_bhb will not be set, and hence any patching
done here will not affect NMI or #MC taken while doing the patching.
Therefore I think this hunk needs dropping.

Jan

