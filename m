Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8E7A46076
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 14:13:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896576.1305319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnHE6-0001iR-Cv; Wed, 26 Feb 2025 13:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896576.1305319; Wed, 26 Feb 2025 13:13:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnHE6-0001gM-96; Wed, 26 Feb 2025 13:13:26 +0000
Received: by outflank-mailman (input) for mailman id 896576;
 Wed, 26 Feb 2025 13:13:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnHE5-0001gE-0t
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 13:13:25 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74c111dc-f443-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 14:13:23 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-390dd35c78dso279437f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 05:13:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd86ca0asm5683091f8f.32.2025.02.26.05.13.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 05:13:22 -0800 (PST)
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
X-Inumbo-ID: 74c111dc-f443-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740575603; x=1741180403; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rAd4XtJOPn/Hd+EU9uV7CVDLzX9mkE3EqvOUWDkft90=;
        b=HAEbXBhzrYRx318j3rYnT1ZXqyKmgt9VrIUxGUvaW+PryzkLzVCiT27XZPfwjiRnsb
         E2ymE/TzIere9zuacxxyomJW16C4UE67+TvKY52Z9cxJzTQBU++ElVveVrzG6Jts5I0t
         SIvtBZ+daXFXh3u2kbu5rKgANF4jAgec+k8hcPxMBLmLzhxR8/iyqx9dbzpDY8nPqcQP
         UT/MxvL2xe4fqRWS4N91r5EXJnceeiuewQC49r+1Kkrbdbu8TYZNVrbcrdKDxxkUW4b6
         05shUFM+966FmJV1p1WFmCneh39QHKveRQ0Xza0gBHhFRi+l2IyjSgpcTf851pyfXZFF
         CfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740575603; x=1741180403;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAd4XtJOPn/Hd+EU9uV7CVDLzX9mkE3EqvOUWDkft90=;
        b=AW/zeSLgm9Iqp31/BjJDLd64VjdtttWC7z9HVZz2LXVBY+ZOgawNFx1W3oWaMrXmjv
         VjCK+cPud0YDLI+iXhYLP6/i3AXwUVIJVIzSmeg3BEGmJVFcNXjW0AxxjwEnvr+joMzb
         Ua8NUh9LCxbJ3QRuRVO/NY0SdufGWWydzIIVXMBpGHLGI5dIIRG8wHZEzj2Z0hfBOMrH
         KR2Ehi4QxH9/oBl0UKdgKI5aOQOROPdLdWrnzUTvQSL6hRdO8MLYXN+7FrJFzuRyq2dc
         jusZNv4Vnj8r8n4xJG5qXRysK+Sv/TyzNMrJUlLEETlPSZB7v6t1zwiJtzmftpODFpvH
         ab2g==
X-Forwarded-Encrypted: i=1; AJvYcCVyJtbCNEY/FWUCZs71anxqYBzlfv3RZ3vxlWPfO8tDY1D5UYGjqkx+sOIxn9i1tZ2gCNt2DlxY+vw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyndLi5+rRMUq8CypLV8M+tV9/ugzrdAPFc4nuIQzUUttbpwZmw
	wlcuKW/cM5Srg96YZxq0JImrmkflI5TSiPol1Kr2LYJzY6CxirAERTqAWzA2AZ0s+9FN2Td8Tj4
	=
X-Gm-Gg: ASbGncsmgN0SSw13vq8+Mc3d4lZArAmGHrXTQ4tn1B++RuIofPqxr2mi/JFMheZgKBw
	nlerdVr5p8hQ+XdIfT/1Q/OIUrNLC1TnQ3j255aW5lU5VxhLznww2b6zO51/wqkC3YxXoWflMq0
	MRzwjpm5rraduATQ9GjG6D0JtDK5TIadnG2msJhFhd95cGmuYhyJh7mdVsiad2jIKmLv+RoslbL
	AKUpC7S3idkEKX2csaWDmdcyePogg61rSZRLqrVjVrNwxSknidO3VhSlwHfY6M1Ftxr0/r8vweO
	JqQhgPdPh9ELWu8333pFQPKznspc49B16gcKmRiZl8r27SO9vU1acG81nVPhuBjb1VKZlknNvft
	H5UahAQgCjRM=
X-Google-Smtp-Source: AGHT+IFEiD9v2q9ZjVHvqVm77kIK/uMiTMBcFZFCMZubA9wPDj6+3wKWworrUYRbIbgtcJhBjP8utg==
X-Received: by 2002:a05:6000:4027:b0:38d:cc9c:630c with SMTP id ffacd0b85a97d-38f6f3cd1b7mr15987019f8f.10.1740575602621;
        Wed, 26 Feb 2025 05:13:22 -0800 (PST)
Message-ID: <b45c2acb-9d72-4de9-907f-ad2d0c7ac6bd@suse.com>
Date: Wed, 26 Feb 2025 14:13:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.20 v2] CHANGELOG.md: Finalize changes in 4.20
 release cycle
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers @ xenproject . org" <committers@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20250226104556.36324-1-oleksii.kurochko@gmail.com>
 <8ec1b722-3af1-4778-9902-0f3278e4309a@suse.com>
 <0f07557a-f340-4056-b8a0-5efe680bddc7@gmail.com>
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
In-Reply-To: <0f07557a-f340-4056-b8a0-5efe680bddc7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2025 14:03, Oleksii Kurochko wrote:
> 
> On 2/26/25 11:50 AM, Jan Beulich wrote:
>> On 26.02.2025 11:45, Oleksii Kurochko wrote:
>>> @@ -34,6 +40,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>    - On x86:
>>>      - xl suspend/resume subcommands.
>>>      - `wallclock` command line option to select time source.
>>> +   - Add Support for Paging-Write Feature.
>> That EPT (i.e. Intel) only, which may want making explicit?
> 
> Agree, it would be better to write: "Add support forEPT paging-write feature".

"Intel EPT" perhaps, for the same reason as using "AMD" below.

>>> +   - Zen5 support (including new hardware support to mitigate the SRSO
>>> +     speculative vulnerability).
>> I'd also suggest to qualify Zen5 with AMD.
> 
> I thought that it is clear just from the name for a CPU microachitecture: Zen5 which
> I expect to be develop by AMD. Anyway, if it is really better I will add AMD before Zen5.
> 
>>   Whether to mention this here
>> when I think I backported all the pieces isn't entirely clear to me either.
> 
> What is the better place then?

The question isn't where to put it, but whether to in the first place.

Jan

