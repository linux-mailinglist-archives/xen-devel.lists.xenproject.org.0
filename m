Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A583BA7B858
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 09:42:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937887.1338751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0bgo-0001Ei-5r; Fri, 04 Apr 2025 07:42:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937887.1338751; Fri, 04 Apr 2025 07:42:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0bgo-0001Cd-14; Fri, 04 Apr 2025 07:42:10 +0000
Received: by outflank-mailman (input) for mailman id 937887;
 Fri, 04 Apr 2025 07:42:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u0bgm-0001AG-Is
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 07:42:08 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f45f5ba-1128-11f0-9eaa-5ba50f476ded;
 Fri, 04 Apr 2025 09:42:07 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso8201255e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Apr 2025 00:42:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301b7dedsm3729452f8f.52.2025.04.04.00.42.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 00:42:06 -0700 (PDT)
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
X-Inumbo-ID: 4f45f5ba-1128-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743752527; x=1744357327; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uXzEHtB2UpGFKAxNm9Hp74QNk7Xi7yRPzLG9TvgOWFc=;
        b=OeT2D/LXETUVv5Mnc6WFmrKeJZTsMFEk9/wfFNpC3gGIPIPNngpnvS8ZbsgH4iwOtm
         EnmzgqWRzcxkfIFSfnx4GkKdoj53/KDrLsHGWQO/rBX1lI8gWHQ3LEo86HK1e/PQuZSg
         ioQkRzP7eF1B7eOQeyI1Wm8S/Z2y86rNadbUtFEW5IEolopMvB07AmVkgUftke/3mHCv
         ODHfpRuVjjYjO+qL5X8+teHyXBzR1oKsxMf6xTbowp7ApTKeqmSOTevw/orbehqBrLGq
         x6m0mxB17l1mRt7arPrrS0IqLPKNuEULvYEIh9J2Au+G93kFq5HKFfiNRpp1DIoknZPr
         gRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743752527; x=1744357327;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXzEHtB2UpGFKAxNm9Hp74QNk7Xi7yRPzLG9TvgOWFc=;
        b=xI6OjlJ6g2Am2Q9DLdFdmV+aDQiRdjiwo62tgvPQ3Ke6gJQ4PTeA5HiqC8ldlf8oLh
         uzOnd5AlVSti1omc+rkDixjxgbnmnp3tlKBLLzw/uo7KitVrIbJjGUbZvytyJ9K3FnwG
         P0P3ylMMgYsbEzSc4vkWAZ0O6QjwwaIFjjVnxmPheuXOBQcRPCwrnXSygazE7/f3jZVU
         6qa7NE/0OATdinSOkeRzRTfWn1mCQK9VFXVCoDq/Op9Bir1gpgWUA/K8VK7vTc4MQ5x8
         bM/uAZwdbORjX6TbE3oC5H/DVidxMvsa5Fn798JXlC73ywoan/kWCCwoSJxm5h9DUjC4
         1KcA==
X-Forwarded-Encrypted: i=1; AJvYcCWx4A4u+NQJipNn5Nest48de1gn7VaJ4aQimGLIJgOC0OfoAp2iBqapJfC3zdCasNJCTFqylqoak+w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yya36wSgC+4XPvNoQ7d1+mDHopywO5A+CNOBaBlq+z/JABCwt8Z
	o6vKFxQC9S1LUSgVWJkFYXmp/juCUcETPNQ3xP6GrpDb93m05S1pIUM1AhuyXw==
X-Gm-Gg: ASbGncsTHJLBAIiHayc0W8nNko+Hgnvv2pXv96t+X8HzwHPJpqRmuOfe2mwnrqvkizG
	XFelQBnOj6wLUsjRcRTrW012OdowEU7yxAcZku6LowJkggWf7cUnW2fYB1SuEx1TXZ7R5BDc9Ln
	C0XmG7SvwwYLxdFLNsnEkvKD+S39CQ+b8z1j4b19DSpIwyf10mqzWJvX5q/dvlD7lRi7TwWNGYH
	v0K74Y+4ZA5AuLIezUylyQxHr0kUYkR/UFkKI3qg9NiEayg6PNshdx7OVs9o/z43LN9OGAgLaxZ
	KSpnuta3j3CmPYE7MD/UmV0BeLHC9zQLpE2beGeQYI3RHnDIlp0Ht66O8Sb4t5CneT9kG3TWIkb
	bz9ot7B5mlXWooo3DRBrwYxMzqBH0zA==
X-Google-Smtp-Source: AGHT+IHqwZ0/QiejxWovtti4wqsm5Zghvvk/jdzMbRgew9Pnu4wd0INoti+9boESqZeZgXuqgnUFZg==
X-Received: by 2002:a05:600c:511f:b0:43d:10c:2f60 with SMTP id 5b1f17b1804b1-43ecf9c4571mr13569425e9.24.1743752527071;
        Fri, 04 Apr 2025 00:42:07 -0700 (PDT)
Message-ID: <72cd6820-feb8-437c-afd3-4aeadef3e7d7@suse.com>
Date: Fri, 4 Apr 2025 09:42:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: Consistently use 'static' first
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>, consulting@bugseng.com,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250403204301.1658436-1-andrew.cooper3@citrix.com>
 <20250403214139.1671954-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250403214139.1671954-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2025 23:41, Andrew Cooper wrote:
> MISRA C:2012 Amendment 3 (which is under consideration, but not used by Xen
> yet) is more particular about having the storage class specifier first.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



