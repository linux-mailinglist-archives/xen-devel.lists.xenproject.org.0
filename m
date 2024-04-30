Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE038B7735
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 15:34:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714901.1116278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1nbz-0004Bq-Qu; Tue, 30 Apr 2024 13:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714901.1116278; Tue, 30 Apr 2024 13:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1nbz-00049Y-Ny; Tue, 30 Apr 2024 13:33:35 +0000
Received: by outflank-mailman (input) for mailman id 714901;
 Tue, 30 Apr 2024 13:33:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q3to=MD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1nby-00049S-Ki
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 13:33:34 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cc79983-06f6-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 15:33:32 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-41a72f3a20dso40421895e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 06:33:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r30-20020adfb1de000000b00343e392829dsm32398573wra.97.2024.04.30.06.33.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 06:33:31 -0700 (PDT)
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
X-Inumbo-ID: 3cc79983-06f6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714484012; x=1715088812; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OQrnnXQB967fj199FxOw7AlYAM/qAVNkCAWCU06m+8I=;
        b=OLqM6Ba4toqUxNO9cVzoV7ttORgeT0nNioW798o0INir3kEqvVSgQ4rpCZPXt0AKom
         R3U+IXGioiSyZ969mn+58Pr+8iPauFToeT8ThsYaZnAHqhK4/glBHv6rt1HyR2ZP8wpE
         o7NvPyqR/d7ZWDaqoo4Oq7nunPQKaTcgV/bQczksuIULVQX8JUo06GQy6UVbkRyKluWJ
         lx3DMc97A2vyI7KobI3KY4YXUf4B+MRSrvU6Gb+lTcZbv8kxyQwKREdIi0nO5I5grKqq
         giaSED05xjMO6S/MXrdUtayivCxIUAUkaXiRYmHhD4I9XiWfBCibIjcETHrLsbUz5rP9
         U8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714484012; x=1715088812;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OQrnnXQB967fj199FxOw7AlYAM/qAVNkCAWCU06m+8I=;
        b=Msyq9EtkhmTVifrB8BjHA6g8U0a81e4oFjpPEmxpqt8qbPpsN81Otf928AjzghyD1F
         oDVTLtcIU10mK8pykcEW74/dEAur4WsDENHj9AEDgK7/ldPdzYJcu0XofcbsRSZbPH3/
         eGzSDh39HYHrl9+GoG9WKsZTRZQh2W2KUwsTE2iZj0voWGRXzJNJp6+EJ8eM0IQr7Uuv
         2fyoP80gv+OHSPbtixrQsyBvnbl8Zb3UmgSOFp1Wu3e2a+I2GJCoj7Ic0TbgjhqTet0C
         3/GSPqp91WNFK1nRuZ4xZurAm1U/FS7q/I6E+7zLJYe1KLXVoIiSYQYt44iNxbfkJcjM
         gqQg==
X-Forwarded-Encrypted: i=1; AJvYcCUf1znmD8pK0OgdThCwRodiAMEsOXUocnKVLhJ82ODB2opyIKhRasL2uxO7u9NARaAMSb6st8RIPkofLJmDqL3P6irLcszJxN+CYjQIyX4=
X-Gm-Message-State: AOJu0YwKf3+/vmBn116QcHxBgPdbTW6dc8ZooztAFxHUuRoOfsFtynCx
	a0+buUZWlCyjK6jmiX1z023Dv/pq91SjaJUYdbhbkwuTFYnvvluXNCK0Vo3hKg==
X-Google-Smtp-Source: AGHT+IFDLWhUVyXPVIfaYbHYFpOrVMyQL/TnGgYXcpcJlVJWkYan3cXNHCDPBuob7z9uBF/nkWjk1Q==
X-Received: by 2002:a05:600c:45ca:b0:418:e6fc:3708 with SMTP id s10-20020a05600c45ca00b00418e6fc3708mr10357368wmo.24.1714484011880;
        Tue, 30 Apr 2024 06:33:31 -0700 (PDT)
Message-ID: <c410b8de-284a-4a17-94fe-38e03670af6a@suse.com>
Date: Tue, 30 Apr 2024 15:33:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] x86/cpu-policy: Infrastructure for the AMD SVM and
 SEV leaves
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Andrei Semenov <andrei.semenov@vates.fr>,
 Vaishali Thakkar <vaishali.thakkar@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240429151625.977884-1-andrew.cooper3@citrix.com>
 <20240429151625.977884-2-andrew.cooper3@citrix.com>
 <766b178a-5e32-437f-ac02-4cb9ad8cb248@suse.com>
 <1749cd23-ba17-450d-b5e0-29fc9ce9489e@citrix.com>
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
In-Reply-To: <1749cd23-ba17-450d-b5e0-29fc9ce9489e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.04.2024 15:25, Andrew Cooper wrote:
> On 30/04/2024 1:45 pm, Jan Beulich wrote:
>> On 29.04.2024 17:16, Andrew Cooper wrote:
>>> Allocate two new feature leaves, and extend cpu_policy with the non-feature
>>> fields too.
>>>
>>> The CPUID dependency between the SVM bit on the whole SVM leaf is
>>> intentionally deferred, to avoid transiently breaking nested virt.
>> In reply to this I meant to ask that you at least add those dependencies in
>> commented-out form, such that from looking at gen-cpuid.py it becomes clear
>> they're intentionally omitted. But you don't add feature identifiers either,
>> making dependencies impossible to express. Maybe this sentence was really
>> meant for another of the patches? (Then my request would actually apply
>> there.)
> 
> This is necessary because c/s 4f8b0e94d7ca is buggy.  Notice how it puts
> an edit to the policy object in the middle of a block of logic editing
> the featureset, which ends with writing the featureset back over the
> policy object.

When seeing the description of that next patch replacing that code, I first
thought you're right about that being buggy (i.e. not achieving the intended
effect). But imo it isn't really buggy, as x86_cpu_featureset_to_policy()
doesn't overwrite that leaf in the policy prior to the adjustment made there
by this very patch. Nevertheless it also wasn't intended to be that way, I
agree (and I should have noticed while reviewing the earlier change).

This means, however, that there _is_ breakage now between this and the next
patch, as now said leaf is indeed overwritten after its custom setting in
calculate_hvm_max_policy(). So maybe you want to defer the
x86_cpu_featureset_to_policy() adjustment until patch 2.

Jan

