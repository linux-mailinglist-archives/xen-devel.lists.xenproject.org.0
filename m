Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DE18B0161
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 07:55:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711106.1110798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzVaz-00058j-52; Wed, 24 Apr 2024 05:55:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711106.1110798; Wed, 24 Apr 2024 05:55:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzVaz-00056K-23; Wed, 24 Apr 2024 05:55:05 +0000
Received: by outflank-mailman (input) for mailman id 711106;
 Wed, 24 Apr 2024 05:55:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzVax-00056E-Nz
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 05:55:03 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 303cb9fe-01ff-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 07:55:01 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41a0979b9aeso27078425e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 22:55:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p8-20020a05600c358800b00418f72d9027sm20413795wmq.18.2024.04.23.22.54.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 22:55:00 -0700 (PDT)
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
X-Inumbo-ID: 303cb9fe-01ff-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713938100; x=1714542900; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cTLbwZuCxKtSASq0vDmtOK5YvsKspFfdjSwAeNU2aE4=;
        b=C9RhYt+382XTe+Ytct3lgGePMy/TzFOiXH+HeHtQtTYtJxm0wJowp8ZGM5nS19sRI6
         MPunJI+7W/jHod2szET0xAIZWhfJBalVdS5FVvD8713suf1BKX78btOIcPvqU7eWFMYG
         x5VbBz0M0XouMJg8SIx5cWvyd8jcYbx2nRP6bJLd+fNVn350UCXYocIYGa1KtI3RYI5u
         L4MicZU5sTrOmYAo8d/VccXH454MOBU9m/MXHctuGRFHkLTKznrSvsAOKTW5VeHdwNKu
         SnSNUFY22tu2aQArUU0LZnYxJ0j1TUzbZyMMW9VO2rr9K985qpbK9zzonjpSBKJ8ReO9
         VGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713938100; x=1714542900;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cTLbwZuCxKtSASq0vDmtOK5YvsKspFfdjSwAeNU2aE4=;
        b=U90Ab+UfDsoIEKWpWOa8D0ap4DQJ4Ajwu/K0SClJnzBdjX0y0ZgEXj9NfI0CxS/zQi
         4W6z/xeo9Yoq1VN5eqrHgeL1st1bItz6oKs4cJ37IuALu+zo9zP6eYQPJ9pLSQrK+uE5
         aZR36uI3V+W6/8I7Ue9RHUXa2TPU7aFe/gICqdkt3qLJunLY8aHIq7LbdCh5O4UJJ5FD
         m1HbxuNeOTWoBtjOPav4Yhkm26vs/Yzx1kvdDSLUgnl/l+HWEBmWDQxIhdWcYK6lmrDu
         h/kTR6/F+0z2cvl42abgBOSH6tEal3HqfjQZuDdn2O7cr5ypuTZgecq2R6FI7TIEjUKt
         EQYg==
X-Forwarded-Encrypted: i=1; AJvYcCX9XyGv78Kcb3ntJkYDrktAtvhiRYSqv1ODvNp7gRkV8i7IH+yBR6IsdtXKWjiwmwwCbEiZi/ztnN9WBVe5OtZVil1CUX8QAihpxkWbOyA=
X-Gm-Message-State: AOJu0Ywomx/6WxSF9l4aXd9UoShOuutOWHN7W/Eyojf+38Y1J0KlJTlV
	kIpnGCOF1yNulGfR+2mDXeR5+li/dhn9a5gELclcmMxGmlI4cFEtZ/3hlwOD0w==
X-Google-Smtp-Source: AGHT+IH6O1x6Bge+rLIn04XZB2nMh7onUOJeu1YDi3ZMaFSky4Dtm5+vEtLSIXDtAw4T+0O+UEfNrQ==
X-Received: by 2002:a05:600c:1d11:b0:41a:a81e:441 with SMTP id l17-20020a05600c1d1100b0041aa81e0441mr1290567wms.25.1713938100448;
        Tue, 23 Apr 2024 22:55:00 -0700 (PDT)
Message-ID: <2b84b989-ec54-4e43-8c55-ed60cb5838a4@suse.com>
Date: Wed, 24 Apr 2024 07:54:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] x86/alternative: Relocate all insn-relative fields
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240422181434.3463252-1-andrew.cooper3@citrix.com>
 <20240422181434.3463252-6-andrew.cooper3@citrix.com>
 <b0412697-d258-447a-9470-09590744c2c9@suse.com>
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
In-Reply-To: <b0412697-d258-447a-9470-09590744c2c9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2024 16:59, Jan Beulich wrote:
> On 22.04.2024 20:14, Andrew Cooper wrote:
>> --- a/xen/arch/x86/alternative.c
>> +++ b/xen/arch/x86/alternative.c
>> @@ -244,10 +244,31 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
>>  
>>          memcpy(buf, repl, a->repl_len);
>>  
>> +        /* Walk buf[] and adjust any insn-relative operands. */
>> +        if ( a->repl_len )
>>          {
>> -            /* 0xe8/0xe9 are relative branches; fix the offset. */
>> -            if ( a->repl_len >= 5 && (*buf & 0xfe) == 0xe8 )
>> +            uint8_t *ip = buf, *end = ip + a->repl_len;
>> +
>> +            for ( x86_decode_lite_t res; ip < end; ip += res.len )
>>              {
>> +                int32_t *d32;
>> +                uint8_t *target;
>> +
>> +                res = x86_decode_lite(ip, end);
>> +
>> +                if ( res.len <= 0 )
>> +                {
>> +                    printk("Alternative for %ps [%*ph]\n",
>> +                           ALT_ORIG_PTR(a), a->repl_len, repl);
>> +                    printk("Unable to decode instruction in alternative - ignoring.\n");
>> +                    goto skip_this_alternative;
> 
> Can this really be just a log message? There are cases where patching has
> to happen for things to operate correctly. Hence if not panic()ing, I'd
> say we at least want to taint the hypervisor.

Actually, after some further thought, I don't even think we should skip
such alternatives. Think of e.g. cases where in principle we could get
away with just patching the prefix of an insn. Yet even without such
trickery - there's a fair chance that the alternative doesn't need
fiddling with, and hence putting it in unaltered is likely the best we
can do here.

Jan

