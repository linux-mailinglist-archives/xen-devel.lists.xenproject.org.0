Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D193282861E
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 13:38:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664576.1034657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNBNB-0005Dh-DT; Tue, 09 Jan 2024 12:38:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664576.1034657; Tue, 09 Jan 2024 12:38:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNBNB-0005A9-AC; Tue, 09 Jan 2024 12:38:25 +0000
Received: by outflank-mailman (input) for mailman id 664576;
 Tue, 09 Jan 2024 12:38:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RTBC=IT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNBNA-00057e-BB
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 12:38:24 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa220a25-aeeb-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 13:38:23 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a28f66dc7ffso685558666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 04:38:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q7-20020a056e02106700b0035d0da89a0asm582752ilj.6.2024.01.09.04.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 04:38:22 -0800 (PST)
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
X-Inumbo-ID: fa220a25-aeeb-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704803903; x=1705408703; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HGCF0KB/9BBvNLJaYOaWbi8YpJp+62G+p4RUQLo4Ljg=;
        b=I8HehAovm/5HXJOhAJE1zCZCLgGEB0mR0WJUIQbtDzblWJ/mCLSzM6hqQQMQi+JmS6
         RsfYXg8tLjCVCeJbC1ZeoJtjbP/UGIacbU96VloDehipl0HVtaxTdjHFyBTX0ZHTndTt
         d0M+j0QeH7onD3N2rVZyHEdD6DANSFpwVXcoDKMJZytQB+bp+lxdcKeT+CpeKIw+TRL3
         zaUxZQURMGMYbJKvXf3B3q/G9H3535yE1TVooOTkTryikv0rSXvoFazWAQtAFE6c3SzD
         Wi7oREpn/KKnFMASUoGm0DJVhGMBV6aX8iv6OtuSzY9t9iShk4YvROFvLSXoC+KaaTdl
         QWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704803903; x=1705408703;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HGCF0KB/9BBvNLJaYOaWbi8YpJp+62G+p4RUQLo4Ljg=;
        b=O21pUf3jt70M+atd4eElhReV/ZR0Ql9+E4l+kROdkX+5Tbwioh7huQcmYCiVU3iT9r
         i5/OfhSobypqUuFNAu0H9L5Ih/fbBdMGr3Xo+dCibhuml2fckn8zGql9jzufIRWibN4N
         cdwvrvFFeYoUxvrWUn43vPnkMKie4BWYbWM/T/rt5CFjZxJPdKu7oON8Z8RpTnvtouxG
         SToCwhrU8TrVsiEpPBliH7xyiVUgBek4M/ucCxDSzCczhU6iqaErchNxs8sxe19xZNtg
         QNXKeS8DXtRhLVKvxBXvdV4J7y8W0FD9Jq9g4zHi/EIt597Gm4DTpf2C6ThqJUcnWQo2
         P+8w==
X-Gm-Message-State: AOJu0Yy5Qx0aEx7mQvoDBguxov4vcRAvCV4LyeIjl744E1qZQZSSFUH2
	PM2O6NXXwUfs+wdtUIagfB1Y22dFiq+e
X-Google-Smtp-Source: AGHT+IGUXKqkFpS8KM/yY5mcKqR/sMZZC1gJm+JoIc6cMQvI7LIC167Q0NjVhi4tZALqLLRB4Jzj5g==
X-Received: by 2002:a17:906:d92:b0:a29:b898:93cc with SMTP id m18-20020a1709060d9200b00a29b89893ccmr583494eji.28.1704803902880;
        Tue, 09 Jan 2024 04:38:22 -0800 (PST)
Message-ID: <affdd812-5bdb-46f2-a684-f8d554790fe1@suse.com>
Date: Tue, 9 Jan 2024 13:38:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] x86/HVM: split restore state checking from state
 loading
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <1e855575-8c0f-4222-80ba-e64305ea714b@suse.com>
 <05e69eea-79cc-4b3c-861b-855fa67c878a@suse.com> <ZYGqbboWvjVOGZkb@macbook>
 <48b5a33e-19c8-49fd-9682-17056e0acb00@suse.com> <ZZ0fVDLQb__IvgT3@macbook>
 <77a1fdf8-f02d-4125-832c-f022d8750c87@suse.com> <ZZ09HcsL2irocO4T@macbook>
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
In-Reply-To: <ZZ09HcsL2irocO4T@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.01.2024 13:33, Roger Pau Monné wrote:
> On Tue, Jan 09, 2024 at 11:58:48AM +0100, Jan Beulich wrote:
>> Plus the call isn't pointless even in
>> release builds, because of the log messages issued: Them appearing
>> twice in close succession might be a good hint of something fishy
>> going on.
> 
> Why do you mention the messages appearing twice?  Won't the first
> check call return error and thus should prevent the caller from
> attempting to load the state?

Well, what exactly is going to be the reason for a failure on the
"real" invocation when the "dry-run" one supposedly failed is
unknown. But you're right, messages occurring twice indeed may not
be very likely. It's more like these messages appearing and then
loading still continuing which might make obvious that something
went wrong.

Jan

