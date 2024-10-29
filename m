Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6AF9B4EAE
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 16:57:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827629.1242344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5oaM-00073Y-F0; Tue, 29 Oct 2024 15:56:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827629.1242344; Tue, 29 Oct 2024 15:56:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5oaM-00070H-AV; Tue, 29 Oct 2024 15:56:46 +0000
Received: by outflank-mailman (input) for mailman id 827629;
 Tue, 29 Oct 2024 15:56:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E68c=RZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5oaK-0006zt-HT
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 15:56:44 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63626f84-960e-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 16:56:41 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43161c0068bso53437605e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 08:56:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b4ad08sm12887725f8f.64.2024.10.29.08.56.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 08:56:40 -0700 (PDT)
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
X-Inumbo-ID: 63626f84-960e-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzMiLCJoZWxvIjoibWFpbC13bTEteDMzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjYzNjI2Zjg0LTk2MGUtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjE3NDAxLjY2MTA3Niwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730217401; x=1730822201; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Er3BLSpPjURbdC6I+O5agJz2jKQiXWRSRgyZXgYP4Cs=;
        b=WM5h18LN60Tt5k5/5J8dKFQOhCJ/iCHD5hfVgR14bU+7pFsdd42xv59ZEpQCU/oR6F
         c1/dltaRK/jPU7n0/K86jQcTH9wC4VPz46iraPZlAckaQbeh+tRwOU67ePzrwDEv3OkQ
         1dDY/PJySw7GXDqY/ESvEhV3gE3fN5gvPKXzlM8yYyW+d+xZgG2Y6GxkSY6ZUICI9fZ8
         aHF7nFdbg06ieaeefQdSupS+pRrAoxWfXscG5XAF+86aInIrg4NfC5v9CGE1lAQ3su4E
         fW/VmYS6ri7d2R/wxYWFSeHCcM9nBctihKslGdGQTAYgOmjq15SXQ1u1n+jOsHyFahH3
         Mr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730217401; x=1730822201;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Er3BLSpPjURbdC6I+O5agJz2jKQiXWRSRgyZXgYP4Cs=;
        b=UeqKRCAgfjaROzoxAB/nxAD8LDotaWx7Vpi6CEieVpdhIkrvpW59p9MV75kJfYqmk9
         7kqUFrItTuXh/puOqzTlbLQK0P+tr4JCG+hMSJSjaN25r+6onKwfXNLtTuVvnnfdTc5L
         7TkJOFwA6tNBVAfggys9hYC2knul+NWN25AIjOwN3snj0qB4rdegyJuulSzkwGrwD+hO
         jTA4DYJBaw2sNDhPPuNBgnCCsGo9+poDHCZaQx4N+POihPb3dnQHkscApSMKSe2Hc9an
         FYE6WdwJ454TLe1TsGEkc4D6ykK1zrjPAKQ3jRKVz66lmRQbDVfHA1dY+Hqkxy5hXgYK
         2rbw==
X-Forwarded-Encrypted: i=1; AJvYcCUqn1bUNOBGuK53VyQv+mf1Xpg4RBfoAoKatfCXONfsoTcIe9eRO1+9xZBTF3o7sH5ITtGcyfJroIA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyr4JSwiDvrFAQ54lFEEHSHVX/1ZBPTSbj4Bcm2x+pwoIRYchJ1
	ZVSnmgpfFxSKvYKglG1plt1E2OiqIm36L+moFBq2pd0Qpt0fRjUps9+AUg+1CQ==
X-Google-Smtp-Source: AGHT+IGKxtGDGeuPYFNRSfhr5LVsjJMx8C6D6V+ew5whb1ubBZlLk16b9oXvcFoLfbavHKRboLfQpg==
X-Received: by 2002:a05:600c:3550:b0:431:4a5a:f09a with SMTP id 5b1f17b1804b1-4319ad16150mr104625845e9.24.1730217400806;
        Tue, 29 Oct 2024 08:56:40 -0700 (PDT)
Message-ID: <e61d982b-293b-4957-a997-327d5ed721ff@suse.com>
Date: Tue, 29 Oct 2024 16:56:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/io-apic: fix directed EOI when using AMd-Vi interrupt
 remapping
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Willi Junga <xenproject@ymy.be>, David Woodhouse <dwmw@amazon.co.uk>,
 xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
References: <20241018080813.45759-1-roger.pau@citrix.com>
 <9270ef0c-9dfa-4fbf-8060-3c507c0c6684@citrix.com>
 <8f3dfb01-504d-4652-837b-f0a045d28ef9@suse.com>
Content-Language: en-US
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
In-Reply-To: <8f3dfb01-504d-4652-837b-f0a045d28ef9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.10.2024 12:05, Jan Beulich wrote:
> On 21.10.2024 13:10, Andrew Cooper wrote:
>> On 18/10/2024 9:08 am, Roger Pau Monne wrote:
>>> When using AMD-VI interrupt remapping the vector field in the IO-APIC RTE is
>>> repurposed to contain part of the offset into the remapping table.  Previous to
>>> 2ca9fbd739b8 Xen had logic so that the offset into the interrupt remapping
>>> table would match the vector.  Such logic was mandatory for end of interrupt to
>>> work, since the vector field (even when not containing a vector) is used by the
>>> IO-APIC to find for which pin the EOI must be performed.
>>>
>>> Introduce a table to store the EOI handlers when using interrupt remapping, so
>>> that the IO-APIC driver can translate pins into EOI handlers without having to
>>> read the IO-APIC RTE entry.  Note that to simplify the logic such table is used
>>> unconditionally when interrupt remapping is enabled, even if strictly it would
>>> only be required for AMD-Vi.
>>>
>>> Reported-by: Willi Junga <xenproject@ymy.be>
>>> Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
>>> Fixes: 2ca9fbd739b8 ('AMD IOMMU: allocate IRTE entries instead of using a static mapping')
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Yet more fallout from the multi-MSI work.  That really has been a giant
>> source of bugs.
> 
> If there's a connection to the multi-MSI work (which I don't see), the Fixes:
> tag would likely need adjusting.

Apologies - despite the seemingly unrelated title that change indeed was part
of the multi-MSI work. I'm sorry for the breakage.

Jan

