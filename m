Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4653C8B02AD
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 08:58:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711157.1110907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzWZj-0003vB-0K; Wed, 24 Apr 2024 06:57:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711157.1110907; Wed, 24 Apr 2024 06:57:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzWZi-0003t8-Tu; Wed, 24 Apr 2024 06:57:50 +0000
Received: by outflank-mailman (input) for mailman id 711157;
 Wed, 24 Apr 2024 06:57:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzWZh-0003t2-KV
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 06:57:49 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5b62a43-0207-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 08:57:48 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-34a3e0b31e6so4743334f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 23:57:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z18-20020a5d6412000000b00347ec0469b2sm16278269wru.46.2024.04.23.23.57.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 23:57:47 -0700 (PDT)
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
X-Inumbo-ID: f5b62a43-0207-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713941868; x=1714546668; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JNqflPV76mTHbmM5E+y7Fn7JlqESK6RC1budnk0RZ9I=;
        b=EOqDdRR/3p/w//gkL23UrDJ6XBeNMcNgQEksyj7mAM5pBWvONCzO68IHhquXAEQgjd
         rLBaXdH6bbgqpZK0kruOCDivikEVESVIHW44zHT+GXJKv0GuQG2fGN+1nUZaNg21Ylrz
         xA12+O9KAVMG2L1yZgRnQfeH4QD+tPCgxWc7Ah4pWNTxzLQz8OlYxAXnVD4cVwiNE81N
         rvoEQhLyk1tGhIMO1aOXnDXB4rJLfiMzZARzRcApEYHJk5WYz5pxG7edzp6qkkUHa3ZZ
         YRrs76dLhaIxJs3hThZwYeG02tZsGxZ41G4o6G/S+wnuQ2EbvQ9LhtpYPWBy87ndm6z7
         RnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713941868; x=1714546668;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JNqflPV76mTHbmM5E+y7Fn7JlqESK6RC1budnk0RZ9I=;
        b=iCD742O2DNiBIv5iFuesFyoyY9aip6APhBrkZdLid74iifgTraarfJN19keV1+aIpq
         SMKk+Ht6uzCvOuTZKficQHh4U+toyREhAbsrD47HGDn9ElSb3gx2u7UuVQoEPJUn67Nl
         JOIO2eviDh+NH+LSGh/6Ls3h0dGwgzlucrH+6p+tEc1N1LxQSZC0tzhW7dV/LzgPF9pf
         2ZCKb3bBh+e1CTlL/VVBma5CrT2yrvNhe5iUx0K7rhJy/TzPvFR3+RbpFVBFPnxjbVrW
         zPFlqrW+HIpS1UegdT+3Ds4H+99JZmw2QRuca7kcn68SIGgeKYa3Uzwo/Emd/Gpaj654
         rQ4w==
X-Forwarded-Encrypted: i=1; AJvYcCVLMP2uMhNiRLt3zmVjtfoEvfJP+4UYnuyGiay2f4O6sTXG5VZPbKMhOPtHTDUPMfIHj8NyW0nHaKqaudpec9g8DkY6Bi+A1jbbCCdobDo=
X-Gm-Message-State: AOJu0YxCAeOfCh02euVcEcvOO87XQk36kr94izGYT2l0NWfZx0vhH7Xc
	7pwYLiFDaLxeB2lI1dNaypGgZS7U1lUbsbsewfPmnJWL0PIql3Z/Dt3blBwaFg==
X-Google-Smtp-Source: AGHT+IGkJud8e1aFZmfGY4/rmAPNuomo69imXBY6kRbhgCpOZnbKZqAcTsuJWHmvyrPnGgRITlDPsw==
X-Received: by 2002:a5d:4e09:0:b0:343:7cef:993d with SMTP id p9-20020a5d4e09000000b003437cef993dmr817281wrt.61.1713941867781;
        Tue, 23 Apr 2024 23:57:47 -0700 (PDT)
Message-ID: <081ff118-e7c3-4570-88e1-6c54e096a6a4@suse.com>
Date: Wed, 24 Apr 2024 08:57:46 +0200
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
> --- a/xen/arch/x86/hvm/vmx/entry.S
> +++ b/xen/arch/x86/hvm/vmx/entry.S
> @@ -62,12 +62,12 @@ ENTRY(vmx_asm_vmexit_handler)
>           * Clear the BHB to mitigate BHI.  Used on eIBRS parts, and uses RETs
>           * itself so must be after we've perfomed all the RET-safety we can.
>           */
> -        testb $SCF_entry_bhb, CPUINFO_scf(%rsp)
> -        jz .L_skip_bhb
> -        ALTERNATIVE_2 "",                                    \
> -            "call clear_bhb_loops", X86_SPEC_BHB_LOOPS,      \
> -            "call clear_bhb_tsx", X86_SPEC_BHB_TSX
> -.L_skip_bhb:
> +        .macro VMX_BHB_SEQ fn:req
> +            DO_COND_BHB_SEQ \fn scf=CPUINFO_scf(%rsp)
> +        .endm
> +        ALTERNATIVE_2 "",                                         \
> +            "VMX_BHB_SEQ fn=clear_bhb_loops", X86_SPEC_BHB_LOOPS, \
> +            "VMX_BHB_SEQ fn=clear_bhb_tsx",   X86_SPEC_BHB_TSX

Oh, and just to mention it since we were discussing this before: The variant
of this that I had been thinking of without decode-lite would have been to
transform this (readable)

        testb $SCF_entry_bhb, CPUINFO_scf(%rsp)
        ALTERNATIVE_2 "jmp .L_skip_bhb",                     \
            "jz .L_skip_bhb", X86_SPEC_BHB_LOOPS,            \
            "jz .L_skip_bhb", X86_SPEC_BHB_TSX
        ALTERNATIVE_2 "",                                    \
            "call clear_bhb_loops", X86_SPEC_BHB_LOOPS,      \
            "call clear_bhb_tsx", X86_SPEC_BHB_TSX
.L_skip_bhb:

into (untested, and hence perhaps slightly off) the (less readable)

        testb $SCF_entry_bhb, CPUINFO_scf(%rsp)
        ALTERNATIVE_2 ".byte 0xeb" /* jmp */,                \
            ".byte 0x74" /* jz */, X86_SPEC_BHB_LOOPS,       \
            ".byte 0x74" /* jz */, X86_SPEC_BHB_TSX
        .byte .L_skip_bhb - (. + 1)
        ALTERNATIVE_2 "",                                    \
            "call clear_bhb_loops", X86_SPEC_BHB_LOOPS,      \
            "call clear_bhb_tsx", X86_SPEC_BHB_TSX
.L_skip_bhb:

Of course yours (dropping the branch altogether) is better, but also comes
at a higher price.

Jan

