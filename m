Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 203E784B64D
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 14:27:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676935.1053302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXLTW-0000vE-Ks; Tue, 06 Feb 2024 13:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676935.1053302; Tue, 06 Feb 2024 13:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXLTW-0000sq-I5; Tue, 06 Feb 2024 13:26:58 +0000
Received: by outflank-mailman (input) for mailman id 676935;
 Tue, 06 Feb 2024 13:26:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gccX=JP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXLTV-0000s7-2w
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 13:26:57 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65cb7542-c4f3-11ee-8a47-1f161083a0e0;
 Tue, 06 Feb 2024 14:26:56 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40fd2f7ef55so3422545e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 05:26:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n8-20020a5d4c48000000b0033afe816977sm2086647wrt.66.2024.02.06.05.26.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 05:26:55 -0800 (PST)
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
X-Inumbo-ID: 65cb7542-c4f3-11ee-8a47-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707226015; x=1707830815; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yIaW+g9kYbMb8fPMAantRbdmlPa6spMR0FsE3eqJ6GI=;
        b=CNKi3V6cGQa/o3/zrWA0ppwmYK+tjlQYGMBKF2Yt+uzofZ6i2g/TGQ9YRYqxYf4OJH
         tWnNr2GCKrMuHS+xbdvArxMjHzhCipGbnUP75WY1PXJZmZ1RoeV5jW7bdoa5uj/JYeRm
         oYPDw6MnLTmp3y5gny3Ge7L40wS/ANp/dOiS9DUTrk5KTuLBb4vh/Q+TBbm5fxU8xo8S
         Yclt9hOl2pE/ATv/0B2HVsf5z3HJ6azCVr2bzJfXPecrF2vEk65op3uPIfopu0jDJbY1
         OefwJ7Uogfiq+4PpfCDb/BOUwF9sO8IRBH2WTFKt4Y866RZlyEl1amHHC5JRJR9olOsF
         HkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707226015; x=1707830815;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yIaW+g9kYbMb8fPMAantRbdmlPa6spMR0FsE3eqJ6GI=;
        b=bEDE/jiGRk549z2egfhX/kwAjUGTmr3PYhRvXgRJ3XQOGC1vx8o7Ur0ryYchKfbjpR
         q3u+LCSZdys80bV9uXMGHfdKRj6//RqMBIopICEhAFBbJ0c9bnJYuvAxy3Uq7JFSnDMu
         943HZN1OWSaqdsE4MM54bhGu608Y74dSBSEdScVgixavlDFX7yOzR+CimRUbY4kTpfjK
         gqcGv3/UUSbkTN+rw7OxQg0GNzeEs6VPBdcWk0y2j7v06fZ+GNemsrM6V0ALzJZ8OgKi
         1DznIkQ7RrMZm588OJOTGP/oRc7loYNmb3x+ApWiiTeiNOL9KgEcU2fPobMiTXweAhRe
         F0XQ==
X-Gm-Message-State: AOJu0Yz2cEQQUtBV74+m65UOICUEvFrup8IpSZHLnnraUc/zdQ8WuL/F
	HzehWPApjfibQ4sRunZ8Iqaqgl32e+VMrVDp3HQRvfkjSrlJRV2G0MbMJNY860lGxoRR1OZTcBQ
	=
X-Google-Smtp-Source: AGHT+IGOJvrLASMT0nOEeLB913YWT8yr11YTe5KtmmlhVfrsVCE/NMIlkQqQDbZbzN3Jd5s5Qc5erg==
X-Received: by 2002:a5d:6887:0:b0:337:68df:5426 with SMTP id h7-20020a5d6887000000b0033768df5426mr1426575wru.34.1707226015512;
        Tue, 06 Feb 2024 05:26:55 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWL1xAFMWeaeanMcqlqs142ipj6CftNhUyvelzdtteLKAGCQ+Z1xOxz87htfqDC6FSXIz/8qUon3pFqakRsRwtpMaD4j0di9jQRSWAF/HwOGisHFuIepZ2MfRnAuNyhzOUGiIPuKREjyzpuE8L4AZM9wuDTTwxOu0aoIRgAg+VdU8MiZV1QpGlBwd1Z9oU5zxMGB16l1fND941kH7OHvf2Ss8uHSDBKI20c7f34xJ77oQoUucPX+qA=
Message-ID: <0e673e08-6fa8-4e1e-bfde-a2764b121d61@suse.com>
Date: Tue, 6 Feb 2024 14:26:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/3] xen: introduce STATIC_ASSERT_UNREACHABLE()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1706259490.git.federico.serafini@bugseng.com>
 <42fc6ae8d3eb802429d29c774502ff232340dc84.1706259490.git.federico.serafini@bugseng.com>
 <2c0d22be-0b31-4e62-a8f8-2dc82147e51a@suse.com>
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
In-Reply-To: <2c0d22be-0b31-4e62-a8f8-2dc82147e51a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2024 14:22, Jan Beulich wrote:
> On 26.01.2024 11:05, Federico Serafini wrote:> --- a/xen/include/xen/compiler.h
>> +++ b/xen/include/xen/compiler.h
>> @@ -64,6 +64,13 @@
>>  # define fallthrough        do {} while (0)  /* fallthrough */
>>  #endif
>>  
>> +/*
>> + * Add the following macro to check that a program point is considered
>> + * unreachable by the static analysis performed by the compiler.
>> + */
>> +#define STATIC_ASSERT_UNREACHABLE() \
>> +    asm ( ".error \"static assertion failed: unreachable\"" )
> 
> In the comment s/Add/Use/? The macro is there after all when this gets
> committed. Overall maybe
> 
> "Use this macro at program points considered unreachable, to be checked
>  by the compiler's static analysis."
> 
> ?
> 
> Also while asm()s without operands are implicitly volatile, I think it
> would be a good idea to make that explicit nevertheless.
> 
> I'd be happy to adjust while committing, so long as you agree. If you
> agree, and provided diagnostics resulting from this are useful (an
> example would have been nice in the description):
> Acked-by: Jan Beulich <jbeulich@suse.com>

Actually, having seen patch 2, I need to withdraw this right away.

Jan

