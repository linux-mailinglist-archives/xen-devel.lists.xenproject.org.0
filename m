Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B60B0778C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 16:02:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045249.1415354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc2hW-0000QO-CR; Wed, 16 Jul 2025 14:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045249.1415354; Wed, 16 Jul 2025 14:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc2hW-0000OH-9i; Wed, 16 Jul 2025 14:01:38 +0000
Received: by outflank-mailman (input) for mailman id 1045249;
 Wed, 16 Jul 2025 14:01:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uc2hU-0000O6-Mg
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 14:01:36 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6312b02f-624d-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 16:01:36 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-553b3316160so7090832e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 07:01:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c923bd7d0sm2325885a91.1.2025.07.16.07.01.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 07:01:33 -0700 (PDT)
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
X-Inumbo-ID: 6312b02f-624d-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752674496; x=1753279296; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KOJ6wqN28h5vBWJRf3yHXIR/6KI8Zgoi4/fS6aC509c=;
        b=XGOHNRuNJf8FGAqRsREe9Q4IzuRLk+wkilpa/uekAtHnC+IbXIC8hTk5/Zi2vHs0uw
         9RudwVmM0nXkV3s++bxY7UdL4MaWkQsN3CNEx0RT05b7ZDdkN05fgP03FZyA15BjD3zI
         8lZ2L5qLYlcwyvCIqfZUc92FSaIhmApJIqMtW+3oc5xM2J4MS05e538xBE2egjqJRiy3
         VxiIWCTRvKpF9NXnNRIZtu6dfyd9ZpPpE1XP+HEDtzsRBob9jQMhCm1mOe2C8xWQh5SH
         XHe+K0HDVuzcxlK8PnwG/IIIm8t19RmVB7xNShQGrUBqhlFUKNw6+FtajP2S3msDqimN
         CmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752674496; x=1753279296;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOJ6wqN28h5vBWJRf3yHXIR/6KI8Zgoi4/fS6aC509c=;
        b=thpP0iu90PEpj3/2mjQUvYdlFf8lepOrgKLsuKLyzY2g7StCTOMRiFO5u4er4JIpvy
         MlYt78cGjQfwyJTofhbUoa1Xvu2D+m5Cr7zIZhyzjyYZqKLA6fi3vpaBUvIJMQM2bSjd
         NKlvmneOz2ujkHHUngW4U4Ec+o5q2ozJEO3GIVqlKGi8+vZ5UXxGVND1doRkq5EG6pV9
         Q+QkEryY1lZ/yAlWFb+GqSX9MEF4dBXP382GTw4hjE+tMc/HUYGu5M9vq2mTpKJyTKFS
         IaiPzhhgSENswXYqkuoikn7xEG7nJRCmS23/ajOOMExFFGjSQ1LTG+Ouf4qPgUkWg8E1
         nOdw==
X-Forwarded-Encrypted: i=1; AJvYcCUd9grtrX1vONyHQt8Jsn4F00qlGUF9sK1iEPdTFfRZOHZHTj+WUieF7dUuCIbi4R/8Xl1G9kAnn0s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJzp2znzY2D66aIY9gZMYOpavKtKSxiwojwKAi+BPbFQRC2EFs
	yWOreRRgBFd8erCjq0XCNocfVXDQ5CMq6XpJvflZmi87ywWVupr6j3fyNy4wLxf6nA==
X-Gm-Gg: ASbGnctr5iavVXYOmE9enaBKDu15iABlv7pvQWFvflvmFYMKYywelAT259EaCW1c0X4
	TucqnHBKB4J/XG5njv6PIajdw3X6n21sFiSyXWPU/ZYF4Ikfyq9RE49umK+Dzg2K+ILpMxk4EAI
	EhKjsMJHDEu72ZYDBXSJGNrsKgrdoCtRjgUr1VQYCQf8n+hGT5jg/7dJ+Uq+eFQHDGqf6zlheUL
	Q8RWpa2oKbRMUIjtowyi/3hoCx9iWkvM77G2FVb+hrswe9Xm969YSEjiAKZE7v44LhVpAM7vcNL
	pWGb7AvEp6wFjR4Semimocrv5M/Ai9a2j+PuhEzPJIyW1hzmKC4z7gtbNdod6q+HPyYV6DIdCDD
	y2xsekI8/+Cn0XGE+4iX0JZHmJd5Cf7ZemmbScYe1RJDDlcV//AuJyclsuLi3Jmho5Cxegyyche
	pLIYjHgZs=
X-Google-Smtp-Source: AGHT+IEXYezPwSxMSjStxIoUjnoACRluh+75jPw/+sVatm5x/YkXPuru1jtlE5Dz/AFsBq22sUP1Tw==
X-Received: by 2002:a05:6512:618b:b0:553:3770:c907 with SMTP id 2adb3069b0e04-55a23ee7fedmr896423e87.10.1752674495010;
        Wed, 16 Jul 2025 07:01:35 -0700 (PDT)
Message-ID: <efdc04a6-b759-4112-aa0c-5085b7007ccc@suse.com>
Date: Wed, 16 Jul 2025 16:01:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/vtd: Switch model check to VFM
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716132843.2086965-1-andrew.cooper3@citrix.com>
 <20250716132843.2086965-4-andrew.cooper3@citrix.com>
 <5d99e194-22a6-45a6-a338-a80d3321ad6f@citrix.com>
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
In-Reply-To: <5d99e194-22a6-45a6-a338-a80d3321ad6f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.07.2025 15:32, Andrew Cooper wrote:
> On 16/07/2025 2:28 pm, Andrew Cooper wrote:
>> diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
>> index ba2c1c1c7416..f8b85c0f9520 100644
>> --- a/xen/arch/x86/include/asm/cpufeature.h
>> +++ b/xen/arch/x86/include/asm/cpufeature.h
>> @@ -28,7 +28,7 @@
>>  
>>  #define VFM_MAKE(v, f, m) (MASK_INSR(v, VFM_VENDOR_MASK) | \
>>                             MASK_INSR(f, VFM_FAMILY_MASK) | \
>> -                           MASK_INSR(f, VFM_MODEL_MASK))
>> +                           MASK_INSR(m, VFM_MODEL_MASK))
>>  
> 
> This hunk should be in the prior patch.  Fixed up locally.

Then:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

