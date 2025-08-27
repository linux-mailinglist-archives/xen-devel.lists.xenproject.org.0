Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A86B37EBE
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 11:24:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095800.1450678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urCO1-0008Ud-75; Wed, 27 Aug 2025 09:24:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095800.1450678; Wed, 27 Aug 2025 09:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urCO1-0008SR-3O; Wed, 27 Aug 2025 09:24:09 +0000
Received: by outflank-mailman (input) for mailman id 1095800;
 Wed, 27 Aug 2025 09:24:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gy2E=3H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urCNy-0008SL-Uu
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 09:24:06 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91a00d57-8327-11f0-b898-0df219b8e170;
 Wed, 27 Aug 2025 11:24:02 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-61c7942597fso1545950a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 02:24:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe8f8129f0sm483124366b.41.2025.08.27.02.24.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 02:24:01 -0700 (PDT)
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
X-Inumbo-ID: 91a00d57-8327-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756286641; x=1756891441; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aVCmVUikaMazOwdYeksdkpw3TajRpy/uqumJ5hr7M+g=;
        b=JaqSWrjdHoy8NPTVi8tlV37FcPUBc5TpvYOnishUwO5Za1G486WvR6n55kPCvvBqZZ
         yOmtlX8hgA3zGy+2/aQWLrnuZHMxfdyEQ6GCjvv5l2wybxZmI0wPe+Uuln9GQoq2fpKR
         LKzA5UFRxyyRMdcRRFLJFqlxiAhLXlE5V3futtwPj2gj8NOdP69ecihnDKzMtP2/9m+Y
         F0dCTJPMIRX/tFuLnt5+CvjOzwkl+mJsCP31PRkfj5/ZsXFa1zcwcDfiRIVdIyNthv8H
         gnfrKZa7chwrt7S2bCib4acq/nBIkds0ctfljDFQ9T6niuKl2TRwN1v7NG1/aI1hRU+c
         9E4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756286641; x=1756891441;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aVCmVUikaMazOwdYeksdkpw3TajRpy/uqumJ5hr7M+g=;
        b=Lmn1BPDbCEoq9mvCiw/AUSN30ohh4q4Q0rwQY5U9YN9UZLvuxva3HLQzT3sKbTV9Ym
         K7EIUxzSXMf0HedMe6NNablq4ZBH744O9Xbqphh5a3KfDkraGZPAgt+KNA+JYj7lXqZq
         hAPPl7KJYoBXnyD4XiZMuuU+LOImGwdeBrvo4P2RsH09hllQ7X1adZ9tY/VAbFzXyS1y
         ePZOAlK7/2xOeMent+M2axfrVtlaT9RT1hI3qZnoO1xGy7HFWP8Bx+Xw/bUU741Xejc4
         FHCeLPrgvJKprEZyRV8luImNk24nIHC0U6jsCrlv2Iez6rKf9XLa8/4PdPZjIyDROCZl
         mOKg==
X-Gm-Message-State: AOJu0YxXQ9ZZLcqmFPjOZf0S/xS5ZwogoKdoo1ytOD0gL9363NL5Kgaf
	jQkNzAUwYQHeug4v/9XfRQ87Vvkhgkdj9hiQ3Wp+41MVY8bGKISWQYTZFpjaekX4CA==
X-Gm-Gg: ASbGncupZY2RerrSgOzjkA/NX/bjWRMLpIN2Y6UWvbfoTRalOtCR+3kQG277H3nTL+L
	N9CKzuZ+Zae6BVK5hqUKPyO5cTtfrEiZlF10hAWB43un6mSZ/JS3PMzgh3W7tzv71NKLEpQWD/r
	eCkuuH+OgNzidz5xcfmuqaf5csNgMCb43nhQZGdXvgPhgyumgUp57qnObym6SQSZqTrpPGGyRf7
	4mJ8wbki9/AkkzIO5ZXTxUKfM+tL/fvbsxsYv/4xfM4vlRwmVQTSq7YTE2X8BnYb8/ml0JktC92
	qVZYadOsExCLDqHcaYbE4Stu6sYMCyfocD2LpfPZsLuSHtZfeS7GDlLJqwJOZ7hJuDWJJn7XpuJ
	gBYNfG+GIgpUX9yZ820FvYGMRH3KTmlpeU05D1lALdomuSg5hmmkrto440XrITsCgvGPrvo2kd3
	/3peOcu6fYQjCBdJmpFJHabpuYM/hb
X-Google-Smtp-Source: AGHT+IG2FdIq3U3+Yeh55TSFxVkR875gm6D/45ZUP/3fbbdL/Yt+OrsfTxizDW2TZ2x00dszOXxSZA==
X-Received: by 2002:a17:907:3f1d:b0:af9:21ed:6ebe with SMTP id a640c23a62f3a-afeafec8143mr394758466b.21.1756286641406;
        Wed, 27 Aug 2025 02:24:01 -0700 (PDT)
Message-ID: <615d5595-3023-4fc1-a5e0-cd69c0eafdbf@suse.com>
Date: Wed, 27 Aug 2025 11:24:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Reminder] Feature Freeze is Fri Aug 29, 2025
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <07fc7122-d0ac-4dbe-800d-89086a07005b@gmail.com>
Content-Language: en-US
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
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
In-Reply-To: <07fc7122-d0ac-4dbe-800d-89086a07005b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.08.2025 17:50, Oleksii Kurochko wrote:
> Hello community,
> 
> I’d like to remind everyone that the Feature Freeze deadline is approaching,
> and we still have some outstanding requests from the community for patch series
> to be merged into 4.21:
> 
> 1. Enable guest suspend/resume support on ARM via vPSCI [1]
> 2. Introduce SCI SCMI SMC multi-agent support [2]
> 3. Introduce eSPI support [3]
> 4. FRED work: [4], [5], possibly others (?)
> 5. Introduce CONFIG_DOMCTL [6]
> 6. xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE [7]
> 7. Some other patch series I missed.

"symbols: assorted adjustments" plus the later "symbols: discard stray file
symbols", provided someone would take the time to actually look at the patches?

Jan

