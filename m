Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BD3B15E13
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 12:25:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063709.1429436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh3zN-0005yj-R1; Wed, 30 Jul 2025 10:24:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063709.1429436; Wed, 30 Jul 2025 10:24:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh3zN-0005w3-Nv; Wed, 30 Jul 2025 10:24:49 +0000
Received: by outflank-mailman (input) for mailman id 1063709;
 Wed, 30 Jul 2025 10:24:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSpT=2L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uh3zL-0005vq-NT
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 10:24:47 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a51d0c2-6d2f-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 12:24:46 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b77b8750acso527069f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 03:24:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63ee49ebsm1585736a91.19.2025.07.30.03.24.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 03:24:45 -0700 (PDT)
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
X-Inumbo-ID: 6a51d0c2-6d2f-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753871086; x=1754475886; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Yejpz90uPAqYfR0OkoAMgJfZ7q03e0qXIgp91RS/pjI=;
        b=QmcDFyKI6ynSI7sMFYDEqq5y060R1u86QYLHgIzD/ZV87oBkBgVtPhslomuxxCWKMb
         H0bMB0UJfT3RKjj+LVhZ+fmF6d469kX8qBU8Q6eIDKFZVp2osPi+3rqPErPjTftukPmH
         06JflEHCYe42gd3uuZ/VVM0lfGID7KRADP9alqlbE+NUeIYPKoRDz6XGq8m91f78Pg5R
         jJZcYPAl/YMR+qzBYQBe5weD3Qsn2PHKrBeBjOSUKq1tUp8A6esOFvfNr08GZA9cU1q1
         yblLCx3KpYHdBKriroj1mXCJ08ZAQjAJ5VkobeEH1mQ4kottA/tYT6b/Nn84MeFG/1bH
         BcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753871086; x=1754475886;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yejpz90uPAqYfR0OkoAMgJfZ7q03e0qXIgp91RS/pjI=;
        b=j1jSa3K/dSbviqLddpN3nufZWG/+5Pw0oRj467pxqPtbT4Hv+Do7SxDhg8hV/0UoWy
         vTBeiK9SNghtwSjsr4S+XJYbkQ1dNjDbqiqSHmwaeY3+wcA6XCHmBqwjqx3m1SS30ltm
         lp/vwX9Oi1YMgYReN0T9WuTVbEnhUHqZjOV622jVfOM0H6HiqO2yPBRInNtiLF2mPwee
         o5TtsNPiu5lWTEYn+rt0Q+L002izayL0LEFOcsBSs3WFf/uWNcNua0Vs54MNaYS22Esz
         w8JA6AvRzZFvOqjUIxOj0svH7lpnyyovl/5T4t7xxlFV2HbWEg2nq+h4esdQmrq4kaT+
         RXmw==
X-Forwarded-Encrypted: i=1; AJvYcCWDOYgcJ2s0zj0sPo6KIzC3oJgYh30SlUtsaWsOk71J1m32WfhskEXCuNgwO169hHfuV0sddgjuhag=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxhq911etctriq6udz6Ef/sGQv4Lo5WQPIv4nJYV1BDmrBxuQ2S
	jarG1R3Zy5GAbVEKGXHVTn/oeFazYN1Bi1yqk1mJVGTBQCyzfx9k5P4Ww0m36OBHmw==
X-Gm-Gg: ASbGnctBbxzg1ZNOPrhTJI3pFnwhAZCihREYvB5PsDcwmum7mk3Tfa93wH+U2GYHYxM
	VsJWqKLUXv0pGl60ujlIfAYHWT+bsReWTjHKvkXoKdlMueOVoSb6M3PgblZ9MVFqSEVkkSWk8Gu
	3A7YAcwXnIZmrs69n2i9KFtlRnIt1NAWjkZuk0grHkgKN8Pec/kERvBGwdnkuw6hk2RqXZcNCxL
	0GFrYPyn6yymkq1g2Pt1xr7DPHLzy0YT/dnwqQcfWXv1mrGes6nAVz482IeezGD4Yy9RdxdTWt5
	2iZjJOpMYnc2bp4JeNb46s6u9DZ9yYakiBHR+j4RJg+2nQRTNI/4BOoJq7wkyxVwTvWg0Xzf945
	kLBFqZwykWnrWB2aCLJ/Ov/4OlsGnctCv7dTMvMhCHUGjOaQUkhcd+S/nxBx5sGNQMN/EczbOlq
	z5QZ/hBTkc6GcN1OwrnA==
X-Google-Smtp-Source: AGHT+IGWYeZzyFPhOHBadrq/as+GeRQ+Zvd2sHYwoebG47worCNIH+5AaQ48bfJgGCdJrTE0Wi3Ntg==
X-Received: by 2002:a05:6000:1acd:b0:3b7:533f:cb60 with SMTP id ffacd0b85a97d-3b78e623e0fmr5301379f8f.22.1753871085954;
        Wed, 30 Jul 2025 03:24:45 -0700 (PDT)
Message-ID: <ecf1e964-c31d-46f0-9c3f-84ce7132138a@suse.com>
Date: Wed, 30 Jul 2025 12:24:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/8] vpci: Hide extended capability when it fails to
 initialize
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Jiqian Chen <Jiqian.Chen@amd.com>
References: <20250728050401.329510-1-Jiqian.Chen@amd.com>
 <20250728050401.329510-5-Jiqian.Chen@amd.com>
 <8051d388-48f9-4878-8924-8e645f313238@suse.com>
 <535c83e3-0626-4447-a20c-20e4c8e2a213@citrix.com>
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
In-Reply-To: <535c83e3-0626-4447-a20c-20e4c8e2a213@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.07.2025 12:19, Andrew Cooper wrote:
> On 30/07/2025 10:50 am, Jan Beulich wrote:
>> On 28.07.2025 07:03, Jiqian Chen wrote:
>>> +static int vpci_ext_capability_hide(
>>> +    const struct pci_dev *pdev, unsigned int cap)
>>> +{
>>> +    const unsigned int offset = pci_find_ext_capability(pdev->sbdf, cap);
>>> +    struct vpci_register *r, *prev_r;
>>> +    struct vpci *vpci = pdev->vpci;
>>> +    uint32_t header, pre_header;
>>> +
>>> +    if ( offset < PCI_CFG_SPACE_SIZE )
>>> +    {
>>> +        ASSERT_UNREACHABLE();
>>> +        return 0;
>>> +    }
>>> +
>>> +    spin_lock(&vpci->lock);
>>> +    r = vpci_get_register(vpci, offset, 4);
>>> +    if ( !r )
>>> +    {
>>> +        spin_unlock(&vpci->lock);
>>> +        return -ENODEV;
>>> +    }
>>> +
>>> +    header = (uint32_t)(uintptr_t)r->private;
>>> +    if ( offset == PCI_CFG_SPACE_SIZE )
>>> +    {
>>> +        if ( PCI_EXT_CAP_NEXT(header) <= PCI_CFG_SPACE_SIZE )
>>> +            r->private = (void *)(uintptr_t)0;
>> Eclair regards this a Misra rule 11.9 violation. Elsewhere we use (void *)0,
>> which I then would conclude is "fine". But I can't say why that is. Cc-ing
>> Bugseng for a possible explanation.
> 
> Eclair is complaining that this isn't written r->private = NULL.
> 
> Given that private is a pointer, I don't understand why NULL isn't used
> either.

As with the various uses in calls to vpci_add_register(), the goal is to
indicate we want a value of 0 (could in principle be non-0 values as well,
but happens to be 0 in a number of cases), disguised as a pointer. Which
NULL doesn't quite express. And NULL there would also be inconsistent with
some (void *)0x25 that may need using elsewhere.

Jan

