Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 388B5B0E107
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 17:57:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052899.1421687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueFM5-0000ab-Sm; Tue, 22 Jul 2025 15:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052899.1421687; Tue, 22 Jul 2025 15:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueFM5-0000XX-Pv; Tue, 22 Jul 2025 15:56:37 +0000
Received: by outflank-mailman (input) for mailman id 1052899;
 Tue, 22 Jul 2025 15:56:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueFM3-0000XJ-Vx
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 15:56:35 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71b3b704-6714-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 17:56:35 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a6d77b43c9so4348387f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 08:56:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6ef76bsm78927285ad.210.2025.07.22.08.56.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 08:56:34 -0700 (PDT)
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
X-Inumbo-ID: 71b3b704-6714-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753199795; x=1753804595; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WJBRrqkhzFbdR1jTJWQ1StBVsJTRdxpD5XxRwiIgRRI=;
        b=MyVfiDQWzZJcJNxBBFwIzjqEkxee2/1UnFHjZrE8ZNcfFTMMb36zs8YenW2mEnGu03
         52mSD5ROgbToXCpin8itySmcQxvm4x8p3NwzDRx6fjeQ3b0gu3lfQp9I3eqglE0yHQbV
         B4McxO9svPona+5D9Pd01JPc5mcgXLfYU+Gjv56IWk0Rgt88TQaeGAUXpoPSNIM4d0TS
         buaKG1NWNnsIUAkJwG80JiTpfBdCAkwf/uHoMhp/qTqISto7YICRQQ7guRVd87K6Nn6s
         2OOGWwTAXVPVakIny/iLnLA9EcVnzM4entZQsNEMZJ9gEHqnAqtFeIVUBNRz7YeZX+Cb
         rnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753199795; x=1753804595;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJBRrqkhzFbdR1jTJWQ1StBVsJTRdxpD5XxRwiIgRRI=;
        b=OGjBbkpD1zM7z9ZttrvtYPWXxuqio+umuARuSJM7LhZH3fRWCHiVWLkTVLi1XWApO2
         lHdzZ88avJncpq82FYFveVI8ub2KYzDvh4931gyVSTztnC5bJVdT5YFDU9n08e9S+d/m
         9ExUuauyXA6Ha9RfVR0wStuITWdftWV4XdVk6+aIgNYP+iHW7Nh9iXG5QCJ///JiebpT
         7WIvEWkiMmIrLLEtllVJrJ6trOdCCVuA670anEjxjAaDvF66AuMi2/T1A/+BcsBOU6gz
         YebbEMQ63mgN7CmKofeorr761QThtKES7grC8P/mEwPrJ7vm9TrJqp4XjIIZp/PRMo7W
         Q9ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxKocm7HHfoyH57WsRr6jNLfyzbOUcBh4P3h5qB/WBJbCEP8ElP1RxgvFoBmM2+ZABoF3BeWr8fIU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRLNwoXGN3JNo4mWO3l6I+2WvvpFmfsAglr8Nx14rI3s/pMy0F
	BhdKj5DyA7y8ohYMy5cjZhgtUTaprQBDgs9MC5t12sufxWGekPbjlVt3bYGrapehmg==
X-Gm-Gg: ASbGncsBiYeVBGqs6i9EQTFEi+3NFQUFi8QgVevT7eRrq131/PFc/vvRNyCeDT1SrR6
	CaHZWUHstYL52uC7YvEaW2mW/MLIPLtauJ1KZV2sjVVL60X0sFo+7cFTNpuAunX0T84YPboooC8
	LS4UZP2mmWn2jWmFW4ZxC1nctzaNNlh0TFfIZYywNqnOCjhNLBex7rEMRBRdWUMXzOFPrdeBrZx
	bvH7CTkitRQoRk6U/a2dhFwhtSjTEC93HtKyYyFsAz8P/87MOQnAUlsD/5b8gRA0CMHuY2Z6CA2
	B1ypPF2/HHRBRfRab+b8eGM2HAmYIq40Sps6EQ4EHDnLPuHCOX5TsmK8453Gj9AzbS5Oyd0J6zx
	H3Zu0+0SOx0dyO05BYbnPH+aIR7JKJApaXNS2dryFAVN9jd1Ts8rRp/QwWq/XU6xwAMYFkMTkAl
	WW7hkVryfwAzUhp0YwgQ==
X-Google-Smtp-Source: AGHT+IEy21kEqQG2VewPcrmhdArWnxRAX74B6LJ/hpF0kD/ClRdKNq/MqslCp6xhSR+2qj85lOt5vg==
X-Received: by 2002:a05:6000:4606:b0:3a5:1240:6802 with SMTP id ffacd0b85a97d-3b60e53f7f2mr19767181f8f.57.1753199794741;
        Tue, 22 Jul 2025 08:56:34 -0700 (PDT)
Message-ID: <33154e3b-75d6-4f82-9e10-ef3e304bfc92@suse.com>
Date: Tue, 22 Jul 2025 17:56:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/livepatch: fixup relocations to replaced symbols
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250716160007.92461-1-roger.pau@citrix.com>
 <4bffb6b1-ebe7-444f-905d-092e69a2d8ef@suse.com>
 <aH-oIqnKwEv3p6Hl@macbook.local>
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
In-Reply-To: <aH-oIqnKwEv3p6Hl@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.07.2025 17:02, Roger Pau Monné wrote:
> On Wed, Jul 16, 2025 at 06:31:03PM +0200, Jan Beulich wrote:
>> On 16.07.2025 18:00, Roger Pau Monne wrote:
>>> In a livepatch payload relocations will refer to included functions.  If
>>> that function happens to be a replacement for an existing Xen function, the
>>> relocations on the livepatch payload will use the newly introduced symbol,
>>> rather than the old one.  This is usually fine, but if the result of the
>>> relocation is stored for later use (for example in the domain struct),
>>> usages of this address will lead to a page-fault once the livepatch is
>>> reverted.
>>>
>>> Implement a second pass over relocations once the list of replaced
>>> functions has been loaded, and fixup any references to replaced functions
>>> to use the old symbol address instead of the new one.  There are some
>>> sections that must be special cased to continue using the new symbol
>>> address, as those instances must reference the newly added livepatch
>>> content (for example the alternative patch sites).
>>
>> This is what I was fearing, when you first mentioned the problem (and the
>> plan) to me. What I don't see is why you do your fixing up regardless of
>> relocation type. Relative relocations within the payload ought to be fine
>> to not override? At which point some of the special casing may already no
>> longer be necessary.
>>
>> (Later) Except that if code uses PC-relative addressing to determine a
>> pointer to store into some struct, that'll appear as a relative relocation
>> type, too. But then you may have a bigger problem: When referencing and
>> referenced code are in the same section and in the same translation unit,
>> the assembler could avoid emitting a relocation altogether. You would see
>> nothing to fix up ...
> 
> The only way for the referencing and referenced code to be in the same
> function would be for the function to reference itself, which should
> be quite rare?  I don't recall seeing any code in Xen where a function
> stores a pointer to itself.
> 
> Otherwise each function is in a separate section, and hence references
> to functions should always use a relocation.

Oh, right, I forgot about -ffunction-sections being in use.

Jan

