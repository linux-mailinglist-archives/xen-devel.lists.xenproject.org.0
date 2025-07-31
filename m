Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEC5B16CBD
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 09:28:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064924.1430230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhNho-0005Hc-RT; Thu, 31 Jul 2025 07:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064924.1430230; Thu, 31 Jul 2025 07:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhNho-0005FJ-Ot; Thu, 31 Jul 2025 07:28:00 +0000
Received: by outflank-mailman (input) for mailman id 1064924;
 Thu, 31 Jul 2025 07:27:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhNhm-0005FD-Uh
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 07:27:58 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e17ce827-6ddf-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 09:27:57 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b7892609a5so335909f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 00:27:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aab53dsm9914745ad.170.2025.07.31.00.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 00:27:56 -0700 (PDT)
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
X-Inumbo-ID: e17ce827-6ddf-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753946877; x=1754551677; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YAAJiC4XMpLQ7cLjtxCB9tnxZzTfqg0eRyw8mHtqRlI=;
        b=XtTvD8v5+Da7xj5zB4ymGsTzEEUwi4SPG8gG1Fe9nZBsLPER/FGQaUkwbmOAiHU2w1
         lr9umvRLQTrhhWXr55TaAD7V5w7gkxJHqWC54wXg8Ci399z9MEQdA6ddEO4AyDwJS2vP
         tDi/ZqGjaIA7LeXplhcWcuIyxTb++1a2IMkqnVU3lmNBBwAD/ykBZNti4qMQpF41KQkb
         HVr4uZpe059jLLA0UtsEieXsA/2It/5HOVZN5O2L9Rwmw1VyGEQroTPkJQ5Qm1Y0U6Qy
         d7UY3RkLQrrH19uM7XlxMP529qjJN9qVjGdhwCQ7Pi3ZvE+/8nUFckYXhJpFAyXYbDOi
         6vQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753946877; x=1754551677;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAAJiC4XMpLQ7cLjtxCB9tnxZzTfqg0eRyw8mHtqRlI=;
        b=gO4wtAQHVd8gtsfc7dhiCkFvheCRiCorEMnX3XqAsHm6JGXiAB1gosQpPipHPLsUQd
         GUHN5CDtYJHhK1pdrDMigZxfT+ncso1eoA+vuy3ICrRmiCh0XlNGPdGI+E1CtlT8GpS6
         DNBvgDcm77m7BaQCoCMfz11f9qtRUoCkq779GiWHc+cqXrVzoiWPRSjkorQKaea0K1Wc
         aCDoxOMxwbdI2jNvQkj7EVIZuCqfBRSJTkzaChIp0meO9FVzkfClt5s1nDAH0v64uByq
         /Qa6+TqAJ0C+ahLUFDXuL7TB7/OFWDawyHaQlFtxIszzGDbyNhwaiY8iYwLI+eN8yk4R
         Y98g==
X-Forwarded-Encrypted: i=1; AJvYcCXv6mp4wFUceo0+8U30qHeAvIMS5JkxzaRRA2/zvakanQMlqiVIDD8Z8i18rwNMimfj7l8ZDB8+ZX4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyeJkvHKhkxfmnMcjA+mJuBkVqhZB7s8hzOwyTMR1jbN2Ysdp4u
	KyGG+LWst/vGkterIbc4hXkUs5TEDSPqsm24qCg+l+dkAGGYV27jQ9mabI+fftM4PA==
X-Gm-Gg: ASbGnctCj/R/91PGCMpwGiVlA+JWB7L0PaJKs5s1/axgAw9nBL8kCL9lUAXyI1XqHZm
	4uxmLYy5qvjdz9uBWtj27pkUIWxZkXSGleh7B7PmEi6gxs1piq/6Z6dxevbOlQeufTTin2X+KJJ
	DNDnepBixGOpZeET6TPF7rxZIY51Cmj1HhzNzVKomdf3cjdWVqHxzArS4pJxEcsmox55t6IinTq
	cPVAljdrcFCoN0TdAZeZZXBGvaDuXMEOCevVKAg90iIeIH/+y5J1CYqWFYX03ZvqW0kM1myyjSm
	TB0uSkvRkR5f4tX5puE4Bw5EbiOpduywZjmyWIlzH+Ic/6LGSXeGgAdz08nNMEgeZqVNcZEUhlb
	CuBI8XeeKn+ifSBETtBUO2Uken4bXDNCggC9FYdiIxe3Y3YHmjDoN7frzSq3xpxVVW/jlqhlA2t
	0fsT7mlOw=
X-Google-Smtp-Source: AGHT+IEF9npKppu+iKxLOn9a5dRwknxLJ5jfS8QEbpdwaYyM4SquBotY7bsicvqEjFpmIzeO86BNNA==
X-Received: by 2002:a05:6000:26ca:b0:3a4:d9fa:f1ed with SMTP id ffacd0b85a97d-3b794fecd1bmr4872151f8f.13.1753946877160;
        Thu, 31 Jul 2025 00:27:57 -0700 (PDT)
Message-ID: <db6886fb-7ab8-4c17-9ed7-b53357b21175@suse.com>
Date: Thu, 31 Jul 2025 09:27:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vmx: Avoid pausing on HVM_PARAM_IDENT_PT in
 additional cases
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <698e46b8f986e649c661f4382c929abcc2827ec3.1753893493.git.teddy.astie@vates.tech>
 <4db51672-4abd-45bc-b6fa-20495e4c0314@citrix.com>
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
In-Reply-To: <4db51672-4abd-45bc-b6fa-20495e4c0314@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.07.2025 18:48, Andrew Cooper wrote:
> On 30/07/2025 5:40 pm, Teddy Astie wrote:
>> When settings HVM_PARAM_IDENT_PT, skip domain pausing when :
>> - there is no vcpu
>> - unrestricted guest capability is used
>>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>> ---
>>  xen/arch/x86/hvm/hvm.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
>> index e2720daf1e..39ff1bdbe1 100644
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -4286,11 +4286,13 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
>>              rc = -EINVAL;
>>          break;
>>      case HVM_PARAM_IDENT_PT:
>> +        v = domain_vcpu(d, 0);
>> +
>>          /*
>>           * Only actually required for VT-x lacking unrestricted_guest
>>           * capabilities.  Short circuit the pause if possible.
>>           */
>> -        if ( !paging_mode_hap(d) || !cpu_has_vmx )
>> +        if ( !paging_mode_hap(d) || !cpu_has_vmx || !v || vmx_unrestricted_guest(v) )
>>          {
>>              d->arch.hvm.params[index] = value;
>>              break;
> 
> You cannot safely skip these.  Otherwise you break a sequence of
> migrates which passes through a machine that needs the IDENT_PT.
> 
> Although that said, it looks like it will break when passing through a
> machine running Shadow too, even though that in principle ought to work.

Where's this concern coming from? We don't lose the param in that case.
The next time the VM is moved, the param will still be there, and the
same code will be gone through on that new host. Depending on that host's
capabilities we then may take the full (pausing) path there.

Jan

