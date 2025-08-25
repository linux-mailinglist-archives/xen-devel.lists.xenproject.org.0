Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 718BEB33DB6
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 13:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092999.1448590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqV43-0007c4-Jo; Mon, 25 Aug 2025 11:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092999.1448590; Mon, 25 Aug 2025 11:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqV43-0007Zf-GP; Mon, 25 Aug 2025 11:08:39 +0000
Received: by outflank-mailman (input) for mailman id 1092999;
 Mon, 25 Aug 2025 11:08:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqV41-0007Yq-Lu
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 11:08:37 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8a2d05f-81a3-11f0-a32c-13f23c93f187;
 Mon, 25 Aug 2025 13:08:36 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-afcb72d5409so700248566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 04:08:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe8b5fbc8dsm100593766b.1.2025.08.25.04.08.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 04:08:35 -0700 (PDT)
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
X-Inumbo-ID: d8a2d05f-81a3-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756120116; x=1756724916; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HE/JNop0V6II04o4kHwc4Fhg0v3FXXK1lCfxwieM7Fc=;
        b=C/yPMdtvVRFsvpDcqUueahAp7w9fgB6+iLC9vKObp/C8kG+ah6ew/R6ZduHRzBatRH
         IrgF3No6zZXMb0BOV+22IWIpA8fmBJh9x+FU5Q7OjsCr+ey9GRpPYdEl1G/fgDK1Y/Nk
         TMT7zCOIFRkdltHbiwWju2oW5TBE4pyw0T1e+WMlJkfhldEtPHqG/IV75NtN8/5YYdhz
         yEZUSJ/U4JECdTXTo7sChgNxCrsbOedMAeAK/bIa69olqGwxWjdi04ksBCz3KF9KYzpD
         Yn6T3oSFAZOE0wjxSO8v0j62vozSah361wwvWJieHxCU3GvcImwRLLoA0EfZgMA/Eq1F
         aB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756120116; x=1756724916;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HE/JNop0V6II04o4kHwc4Fhg0v3FXXK1lCfxwieM7Fc=;
        b=uStz0nTmdjAHEh/ruITMJIsnTOptVD2mA2OstiJC9k+7dPAq2gCGInGaKf/sPeBrtz
         nmjYmhbu7+VkqgRhsh6g6BVTNJHMpcc7KVcDXPS3LNAsYnW341tzARywz9EhM13pDaNm
         +HTHO1iI8l6MHb/CLwtAvqG3ShfQL8PKahl+HlVwrEHUFNohP3r3TD92x/HF4q4qi4zT
         jrbKtcCsozhxDJmTZREQEd21QbTsyVQ+U5xcC0vWQRJO6oTpItupjqpZAolXD6D3CUPB
         rmBbr8/VuI0shCfzSdERegA/xNKIaxpPtHuTIxzcMK7r2QUNaQeDXTmew2QTHjF5am3i
         mPSA==
X-Forwarded-Encrypted: i=1; AJvYcCWpO3X+R3eNujbiKNCDYfXjq0+IyuYqmxlEIor2vNhGpE5yO9H3pjSqtLYtNAgokfk5VXNqxv3o75Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyS7dNpgGMpoiaJyec48Dc7O7O7Q7SIICS8gWYJCVMiVmD6hOQn
	S7AY+69mWrjr2HKqlEfNxZi558NP7MBlugZFpK9MZSsqD8RM0KwhhkbONIME47ph4w==
X-Gm-Gg: ASbGncuatkh6Ro3FBVuB9MJTuttfoPSH8E4G4kAPjRmf5Ss/yh2zXoL3JEJbmcEe/66
	N+uMDZHTh3VmHqcCgyYhi5zcYA41SmOm6w84ytmnExPpRR4SLNlwKb3K0y42hHcT0P8MaOnhz24
	VjCVkSzJTDDWWUEsrfcNwr1E1+fqR2BSROZSvH+UO3E6Uqn12QyXYah0H28ivV/EVFemCj6BNfL
	KHw/64KJAOi9mJw1cwyPbK/4MNTT1WsextpHZ37334IWiS0Fv0IovmOUfF4ZxFm9bPbLPx2lvBf
	DH78nw2K/62rKLq/+FBMcDA2Db79JbIv7TpA2PN4Y9hgaXc0dsF8YC6QGxHZYEbw2EosBGGdvum
	CNvc64cjd4lsD8ifcHHxgPs+2I0aTWXiECm0YU0y782moaUuKOK+Gz0CNsaedKlQvUpD1+/uKG8
	PBTGOHBhK+O3UfpRg1Dg==
X-Google-Smtp-Source: AGHT+IGpRSp3j0YTOIi2SL3CvwgyQKO3UyNdIbmEaqJa0NLPvdY1E8H2D6HBuFg72vscijvLhudBnQ==
X-Received: by 2002:a17:907:2d8c:b0:af9:8688:42de with SMTP id a640c23a62f3a-afe2958acebmr907608266b.41.1756120115808;
        Mon, 25 Aug 2025 04:08:35 -0700 (PDT)
Message-ID: <ea354e99-34f7-4483-b300-4cb96a755419@suse.com>
Date: Mon, 25 Aug 2025 13:08:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] hvmloader: add new SMBIOS tables (7, 8, 9, 26, 27,
 28)
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, =?UTF-8?Q?Petr_Bene=C5=A1?=
 <w1benny@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1755987697.git.w1benny@gmail.com>
 <4ecd33acd8bdf629e9103e97ff271150541e7415.1755987697.git.w1benny@gmail.com>
 <5bc3f55c-ccfe-4dcb-9efa-a0d94d0fe92e@vates.tech>
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
In-Reply-To: <5bc3f55c-ccfe-4dcb-9efa-a0d94d0fe92e@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.08.2025 13:04, Teddy Astie wrote:
> Le 24/08/2025 à 00:29, Petr Beneš a écrit :
>> +/* Type 7 -- Cache Information */
>> +static void *
>> +smbios_type_7_init(void *start)
>> +{
>> +    /* Specification says Type 7 table has length of 13h for v2.1+. */
>> +    BUILD_BUG_ON(sizeof(struct smbios_type_7) != 19);
>> +
> 
> I would prefer having hex constants (so that it matches the number 
> format the specification gives).
> 
> e.g
> BUILD_BUG_ON(sizeof(struct smbios_type_7) != 0x13);
> 
> (same for other checks)

While reviewing I was first inclined to ask the same, but then though that
with the hex values stated in comments it would be fine either way.

Jan

