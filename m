Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E129CE070
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 14:45:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837656.1253573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBwd3-0001zN-Di; Fri, 15 Nov 2024 13:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837656.1253573; Fri, 15 Nov 2024 13:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBwd3-0001we-9p; Fri, 15 Nov 2024 13:44:53 +0000
Received: by outflank-mailman (input) for mailman id 837656;
 Fri, 15 Nov 2024 13:44:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBwd2-0001wY-8U
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 13:44:52 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c86239b6-a357-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 14:44:49 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-37d6a2aa748so1063212f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 05:44:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ae311fbsm4352944f8f.95.2024.11.15.05.44.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2024 05:44:48 -0800 (PST)
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
X-Inumbo-ID: c86239b6-a357-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmYiLCJoZWxvIjoibWFpbC13cjEteDQyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImM4NjIzOWI2LWEzNTctMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjc4Mjg5LjI5NjM5OCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731678288; x=1732283088; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ogQpv6Sqg9/DXWY5+H2+Vc20UW13rxTODknZXHvUoo0=;
        b=HSTMhWUxFaa7C55fWOUbeC7/ZWm/NbgQVfhNMTIKBBwLyCDP64zMfB2XLYcyw04dTr
         wXxdEubcSxtF9+7SSbVyNcdOtxLUR7Pw5natLxe3uy2ULV5lTTX48+IqVvkrRdSmQKCt
         7HpSJIQ5vpi3TU5an83iyo72aa0JJP68tqEAfhOwvi+nN16LSDB/jDg11QutwsuLLBL4
         HbM04wyoLKVXoNxN+1iQq3nBP/WpKxRsNlFgqnt+DHRoCkTV21z4ar3MNYUot1dpVeIU
         3Kd5QyKV4gS6Bl79i9e90AI9sTyDADuLgr3UKJ38k6qVpUawGWkpT5qXx5303mbz/GmM
         poNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731678288; x=1732283088;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogQpv6Sqg9/DXWY5+H2+Vc20UW13rxTODknZXHvUoo0=;
        b=R6PAUmrxA69glkkQjc6PGcFWWkmIxgz2XZohDSxZFpe7cwFFMINMuH/vQdLkxuKScw
         3CkN+Eh1PtHyX4JvEaBSexPAxZN2yOCXTt3Ok0Dt6YOJvqaH+emK5ka3sv0ecwNbzqwg
         hrnZQgaGWNYffS5g66u4LgSPbq7pZhtI5yXVrhijxqZP5I7vU/A5bUtdCOcpaNjaC7YU
         CslMU/A/6WXcGpkYDc1Qmm5niItMU1Kt+BAYGINq9GrPesLmaGOp094rvfx9VnwMD8Wd
         aWH9n3Vcd4JYYvUJwDBpWL6Af/Vh/PtTCwRMwVffOh5hxIXr7j/W8HXPR/G2hgLJFACc
         kJng==
X-Forwarded-Encrypted: i=1; AJvYcCUJYeQTbQ5pow04xeeCiFYhpWfwUasMv1lugPrmzAczP8VWve94bDNjHBoMOhtMiZ/ImxOE5Uuxvm0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxyLFkzAyk6j+engNhS4EY6U9EHASg4DfSCxEiYoNpub/I+s2lE
	jLBKEV0ckwy+4VfW9jxXaBnnbLW4c04ChgvLDLVrFdcKotXTbDvdMVLDDWXuhA==
X-Google-Smtp-Source: AGHT+IHdaMqocuw3nrcUYm7eRJdeQSYjkvDkkmSSplX8piEsW2nlD5S4jJt1H/NqgTa4+rMkFJ1H3g==
X-Received: by 2002:a5d:47a9:0:b0:382:2f62:bd3e with SMTP id ffacd0b85a97d-3822f62c139mr523085f8f.27.1731678288599;
        Fri, 15 Nov 2024 05:44:48 -0800 (PST)
Message-ID: <264e3d8f-4926-4af7-8fa4-bd6c723af401@suse.com>
Date: Fri, 15 Nov 2024 14:44:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/emul: Adjust get_stub() to avoid shadowing an outer
 variable
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241115132742.2155370-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241115132742.2155370-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.11.2024 14:27, Andrew Cooper wrote:
> Eclair reports a violation of MISRA Rule 5.3.
> 
> get_stub() has a local ptr variable which genuinely shadows x86_emul_rmw()'s
> parameter of the same name.  The logic is correct, so the easiest fix is to
> rename one of variables.
> 
> With this addressed, Rule 5.3 is clean, so mark it as such.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com> # x86

Albeit you certainly know ...

> --- a/xen/arch/x86/x86_emulate/private.h
> +++ b/xen/arch/x86/x86_emulate/private.h
> @@ -672,19 +672,19 @@ amd_like(const struct x86_emulate_ctxt *ctxt)
>  # include <asm/uaccess.h>
>  
>  # define get_stub(stb) ({                                    \
> -    void *ptr;                                               \
> +    void *_ptr;                                              \

... what I think of non-file-scope variable names starting with an underscore.

Jan

