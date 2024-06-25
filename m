Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3823916A34
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 16:25:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747848.1155358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM771-0006Hi-Hy; Tue, 25 Jun 2024 14:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747848.1155358; Tue, 25 Jun 2024 14:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM771-0006Ex-Ew; Tue, 25 Jun 2024 14:25:35 +0000
Received: by outflank-mailman (input) for mailman id 747848;
 Tue, 25 Jun 2024 14:25:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sC98=N3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sM770-0006Ep-36
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 14:25:34 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7f1b4c8-32fe-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 16:25:33 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3621ac606e1so3954517f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 07:25:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-706953b6b06sm1900144b3a.173.2024.06.25.07.25.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 07:25:32 -0700 (PDT)
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
X-Inumbo-ID: c7f1b4c8-32fe-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719325532; x=1719930332; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DDqm963lEKq4uY9yYk6vCYrTFvjTQwIhWVOjFVXWAJw=;
        b=Vq5XdDBlJkVU7BmWrRsikYKw9drCSbBahUP407SkFk2aU6OCU/2XWF/DdbW+okXFyq
         mQDallh14D6XQ4tLotkieX9BveLvXIvk0/aKpDz7CXDEh523xX5XQv9STOLtasF/wkKI
         PL/E4kAbbFlmP5FcoNVj7QU7kH+2mMgBoJpwdHUyEo/kWUXrITdTa5DotHKuRlQ6QhEI
         cIwR0/D+WW90SgmVLJrPnUjBiMgGfsImR2VvipZQwdBQOevFstZUpByi2EdEArVQ6auZ
         2uHYT0V1u6Rgi0fhTaIKxdbdbMh7zux9IjyviKiBJqJsQGC77nRjeJwSXWkF8CJRXxMN
         F6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719325532; x=1719930332;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDqm963lEKq4uY9yYk6vCYrTFvjTQwIhWVOjFVXWAJw=;
        b=Ql0zc6PjqpRacKnrDAnCkCGo0P7oDuPKzKqPRKX+/4sEwfDs7J+pC48QIae4Rt2LNT
         Vx/66zNiE8vspwZwCBVZ+EUWck9m/KTucsWJzlYdOV10VeVkAnaIE9+9eetCF441yEsw
         X9oxpMX+dhF8F32t9KU68RegkTFDoRTxPdWx/ovhCkwGnldqg4k2tFhwCljtXvDPR99S
         plSV+mr49EWVkVi3akYJoC7xEaWQqZO6Z/P5nAlo4eQLeoBw37ocIlhURqOPjz/V1X1J
         cM2M4oy3D8+0B/JWDrzPEo/CR974F3WCFTBcibiFtTLHYxQ7asGDuTW6awuyxik3v3rY
         Z79Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2EbPpSx4MOWtl2gDnhcZ0+YkKT56vvuaP0peI7IC6Ze0tuEYdfBeY1buiBFAgJeEGm4E0NM8+z+Kpah9r4DjdI/1KzdqnRjyUwVUQV4w=
X-Gm-Message-State: AOJu0Yxd8F6mj2RjMunbzUMOwHYfSxIsOKK8XsAzr2eiSfxFOpnqT5sX
	VAnwMYxyMhhMymoLTHcpb8X62xz3U65mDZhO2fddkQ2XM8CblQ4BDkNotYb7CA==
X-Google-Smtp-Source: AGHT+IGjEd/2a5pYVE0a6I4TmGqHJr81NWshZlkHv7j03ktAd9HVK2CehVoqx0AIjT2bR6vnha1yFA==
X-Received: by 2002:a05:6000:1549:b0:366:df35:b64f with SMTP id ffacd0b85a97d-366e325ba7emr9647974f8f.4.1719325532545;
        Tue, 25 Jun 2024 07:25:32 -0700 (PDT)
Message-ID: <4a4e37a9-eac7-4e72-8845-6b4bbd7bafe6@suse.com>
Date: Tue, 25 Jun 2024 16:25:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 07/10] xen/common: fix build issue for common/trace.c
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
 <f14f2c5629a75856f4bafdbff3cc165c373f8dc2.1719319093.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <f14f2c5629a75856f4bafdbff3cc165c373f8dc2.1719319093.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2024 15:51, Oleksii Kurochko wrote:
> During Gitlab CI randconfig job for RISC-V failed witn an error:
>  common/trace.c:57:22: error: expected '=', ',', ';', 'asm' or
>                               '__attribute__' before '__read_mostly'
>    57 | static u32 data_size __read_mostly;
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

If you give a release-ack, this can go in right away, I think.

Jan

