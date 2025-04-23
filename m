Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEADA98A32
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 14:59:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964597.1355348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7ZgO-0003cH-Hz; Wed, 23 Apr 2025 12:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964597.1355348; Wed, 23 Apr 2025 12:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7ZgO-0003a2-E7; Wed, 23 Apr 2025 12:58:32 +0000
Received: by outflank-mailman (input) for mailman id 964597;
 Wed, 23 Apr 2025 12:58:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7ZgN-0003Zw-Db
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 12:58:31 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7bc362d-2042-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 14:58:30 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-440685d6afcso60152935e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 05:58:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d2195asm25304055e9.10.2025.04.23.05.58.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 05:58:29 -0700 (PDT)
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
X-Inumbo-ID: a7bc362d-2042-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745413110; x=1746017910; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=95yQZhhT/5ritVYq7jkttDpCHdHpSO82S5yIcbg8340=;
        b=Hj3VCfI5k8QQxM6Uy0Bh9UawSYDIPeofQnlvaTU/SRDaVAd5Q4ECIoxsHWpt03Dl08
         4WCZ/dfJQ+U+uQbrD7bBiUQ/KZgTDFXjpjY7zEabwPk5q0XXeqtP3Zns+2NpyXvhrzy3
         lzmGjQbB4iu7jX/20S2LXn02hlUIgkxQYmSW/4yK8qY8OMDBP4xjM6LlzkFANKCy/DWn
         RNCGpTK0Lndq8oc+xs+UPFE466rRCtdpypBzTrOlStm98Oc/YORMoEIIX5wkY/CGvTwM
         Lo29I3W+75awmZh/vwwp/QMMhbRSY4+iCJwE17ZWydmdghiz9ggO5R7RnmKGGEOayGby
         bVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745413110; x=1746017910;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95yQZhhT/5ritVYq7jkttDpCHdHpSO82S5yIcbg8340=;
        b=HsFCpVyKY+47a3lzzd9nmGbKjUc7Nm7HfgGHU6kYLZ9qPOeFAuUlHpTj5zCpu1ektr
         RkKQOznVy8JKg+PjuD+Om1Rre06D70hnKqO1eVM9M/8yCtFlZJSS84tGT9SWmPotOVnW
         QkypZ/6pZMmv1qu+mNpCz6UUPcNZAOdc3v8NFTKTDOwJ2xgTohahMSgsGdIXpAwLgNlF
         LcBF1H+bJlkjmCj2Ij8CPcXEQmDEttnT/DgMlePFk1fxJT4/Gko9f7pc9FvqEnCbxgnM
         iDrrJcJo8sT8dDxQv4/fLI6eamq3Mc7T8ALYmNl3Vcr7vsmg0jDXkfjU+3SxTWjGlSep
         lA6A==
X-Gm-Message-State: AOJu0YzwvMqB+GCQzLJVL4M1qghY9ec9Sh549bIvUsMMiUZACjioCDZb
	aLphDkMsdLcjSu1yhi0d6vVQP14LnDkgQgXpONijtS0Diriz2faf1O0dCfZdCQ==
X-Gm-Gg: ASbGncvLxIR+LgOKXnzDA3Pg8kDigwC+aPbf25a65QmyPl+tdxP6T5vYGMummaGCz1o
	IL4G2kS9RUlgC7/Zuacm8Kzm33kLp0pxxYgkeGgu/AbO8Kp9/Gqtc6SS4njO3cynX4c71ZpKLdS
	YH4NAx3cj82Ysctz1S/Hz/QMNNa9sTJ1M1FRN8SnSEWYV2wzZKTEB+CO5U2iBstbz+nLQIofCbR
	CWQ0//Pretf1xUSj51YShC2GIuGpFeI+eyX/l2tpttEQ4YoL0lHmcK6/j72JetpCIrop1+s2umZ
	ZXGwRvMp0f4hmpQ/ns1/rURSCVoYEQJVJiCoD6tfo0zGGfVTntWfZKRVokv6JuMaTZSaM4tipTY
	mj2eFbcknZpN8TG8Ph3Oaq1cMa4FQw/wclNO2
X-Google-Smtp-Source: AGHT+IH6IPHp0kCgGHwgvHED+xa53WOQWbq7SQMa6VODNXcA7WZ3cvG3wd2sD0DxHq7qyQjizEY/GA==
X-Received: by 2002:a05:600c:4fc4:b0:43c:fb95:c752 with SMTP id 5b1f17b1804b1-44071595942mr162577315e9.3.1745413109679;
        Wed, 23 Apr 2025 05:58:29 -0700 (PDT)
Message-ID: <7d0afeda-d2c0-4360-bbf6-99a466e8f013@suse.com>
Date: Wed, 23 Apr 2025 14:58:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: constrain sub-page access length in
 mmio_ro_emulated_write()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <570ad3f2-7f3b-4579-a000-c85d27e8bf77@suse.com>
 <aAit4IPZju60KEUz@macbook.lan>
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
In-Reply-To: <aAit4IPZju60KEUz@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.04.2025 11:07, Roger Pau Monné wrote:
> On Wed, Apr 23, 2025 at 10:43:56AM +0200, Jan Beulich wrote:
>> Without doing so we could trigger the ASSERT_UNREACHABLE() in
>> subpage_mmio_write_emulate(). A comment there actually says this
>> validation would already have been done ...
>>
>> Fixes: 8847d6e23f97 ("x86/mm: add API for marking only part of a MMIO page read only")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Alternatively we could drop comment and assertion from
>> subpage_mmio_write_emulate().
> 
> I think I prefer this as it fits better with my patch to unify the
> open-coded MMIO accessors, which does have an ASSERT_UNREACHABLE() for
> unhandled sizes.  The return there is anyway too late IMO, as we have
> possibly already mapped the page when there's no need for it.

FTAOD with "this" you mean the patch as is, not the alternative?

>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -5195,8 +5195,9 @@ int cf_check mmio_ro_emulated_write(
>>          return X86EMUL_UNHANDLEABLE;
>>      }
>>  
>> -    subpage_mmio_write_emulate(mmio_ro_ctxt->mfn, PAGE_OFFSET(offset),
>> -                               p_data, bytes);
>> +    if ( bytes <= 8 )
>> +        subpage_mmio_write_emulate(mmio_ro_ctxt->mfn, PAGE_OFFSET(offset),
>> +                                   p_data, bytes);
> 
> Should we print a debug message here saying the write is possibly
> unhandled due to the access size if subpage r/o is enabled?
> 
> You might want to re-use the subpage_ro_active() I introduce to limit
> the printing of the message.

That would be too broad for my taste. I've used subpage_mmio_find_page()
instead.

Jan

