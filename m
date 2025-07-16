Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65201B06E74
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 09:04:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044862.1414892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubwBF-0002Pc-Ht; Wed, 16 Jul 2025 07:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044862.1414892; Wed, 16 Jul 2025 07:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubwBF-0002Mx-EW; Wed, 16 Jul 2025 07:03:53 +0000
Received: by outflank-mailman (input) for mailman id 1044862;
 Wed, 16 Jul 2025 07:03:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubwBD-0002Mj-Hr
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 07:03:51 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 061bf955-6213-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 09:03:49 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so3510906f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 00:03:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f25269sm13542217b3a.107.2025.07.16.00.03.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 00:03:48 -0700 (PDT)
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
X-Inumbo-ID: 061bf955-6213-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752649429; x=1753254229; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lQjFPrLZSC7DoLS8LlUShpk04opc4O1qT+Wrm5x9GZ4=;
        b=b7+rPltV2Tl0jZzgEvmvwISfVibBCKeBCpnY4yBXDjx52I6IvxBsVhjNdXN8tmexgX
         5ACjk4bzKMelj8H1SGsnJG+UH3/dfSSeLlkxPxoKsay3NNhwfWa4tcQ7Z+7LRMk4fUr/
         Ph2HpSFqQVB/sie7Uyh2AKDN3DHbFue0Ue1A8rGoiXG3u/Q2V9JJAEdxv2IU4hekGYmY
         +8FHeMpWV4Mg0xcGaE8N8hfC7vhI14KJ6Yqe1b4mRVhMo0iak1xAdxUZnWG4LtmSyCKE
         AGmRmBGclg1jx7JprrJFV8i+nk6U1upL4mF0dkAIDqvM0LwX8HIAbivjbDqUbL9YYGV4
         eO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752649429; x=1753254229;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQjFPrLZSC7DoLS8LlUShpk04opc4O1qT+Wrm5x9GZ4=;
        b=E2bP2KCfhwPSDmzRn3Mr4JFGuIb9ZHMi4x+NAtHeh2bdjuQ7EDaf+EDSDVqV4X68AQ
         EgDzeJ17APFVIwpR2UZAtWnJn8KLVDwashbZsm74HBQQEWiIwGGZsZbl9LdOgKhITaNX
         zVDYc0JeqWsuEG1XjLBr6osEEZR7mecRyn1mUExHyk1SUMW0DpV4beYgk7aOst1AdTdF
         AjTlwvI+xAKAes+4Rh5ZBmIulqJwB7EPNiWBX5Cd5ke4bVaeOXuwI2o3b0xjM64lOw/H
         w/heDFH/E34ehMg250N0XAxCUzi4h/zwcpYFgIgpYu9PE9rOk46+LvS+m1ewwd3QIymZ
         M7jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfxWPFR+U7kBec4zglyWEfV9fZIBZopwTz+Y/NC0r+8RJGOlrLUkjiEFzcoG4EYBS67PTDCbSQ1qU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YytNl9C/JOp1wjal28Ib6IpGXZkg3XUeWg5CfThKCpFmf5ezxEA
	t+cX+kVwgdDUFPKgBRuJqKVuYhUdYukYOC4fTBP123xDDNiyVuEShEPDq5nGJJAsEQ==
X-Gm-Gg: ASbGncvbeAmaEKnybv3zipuGElXSvsGq7Ye0fw5U0E9fIsDUByloptH1rZXb9Z7YzNF
	BPu+rWl9sKR6b89cDdE6amP9gXjO6GaeWOxzWrb2Bjsyqr+nUUmMFvQeX9I0g6LhONu9WESflVh
	0X/71TKBenfM/aLeM45U3CtWkpttFHQQ0s0Rw5EwFOU+qQQDkyXrqKC54Xk2/WNpnFSJseoN81u
	crO9mpBFKtdrpzDK0IFKkQAu/sFDCKUNJqkpM5c3bA3vdkKJ59B6CmMp+R5XRUi0y2tl5BfmH4M
	vEkAg0OicCCRUfY0fUTv4ERrJz17t2ikKRqhRW5z+LlI+9mrHmI/tf0N2m9Uc5WOwSX/op/TkAs
	/hkxQ1BlX3X598fcPtx6RN0tXYsVdyoNc6e7MPO47AhsHb/PPWTCqievLfJCTvRrQ8kHuxLXvL1
	5z69tavuc=
X-Google-Smtp-Source: AGHT+IF607oIKCIckooomqE38jafmGnUrXJxg9Xw9bnVulXbmxHQRNKIhz9JbgNzkugTUR71fRTiPw==
X-Received: by 2002:a05:6000:288e:b0:3a4:c9d4:2fb2 with SMTP id ffacd0b85a97d-3b60e51bbdamr846050f8f.46.1752649429015;
        Wed, 16 Jul 2025 00:03:49 -0700 (PDT)
Message-ID: <328f56ac-1d5f-421d-9afb-bcd5690a0c2a@suse.com>
Date: Wed, 16 Jul 2025 09:03:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Drop rep_nop() and use the PAUSE mnemonic directly
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250715204628.1848686-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250715204628.1848686-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.07.2025 22:46, Andrew Cooper wrote:
> In udelay(), use cpu_relax() directly which, for better or worse, is the
> common way to refer to the PAUSE instruction.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


