Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F9C85315A
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 14:08:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679893.1057671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZsVO-0008TB-GH; Tue, 13 Feb 2024 13:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679893.1057671; Tue, 13 Feb 2024 13:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZsVO-0008Ra-Dd; Tue, 13 Feb 2024 13:07:22 +0000
Received: by outflank-mailman (input) for mailman id 679893;
 Tue, 13 Feb 2024 13:07:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W/Jz=JW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZsVN-0008RU-8k
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 13:07:21 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0dabed7-ca70-11ee-98f5-efadbce2ee36;
 Tue, 13 Feb 2024 14:07:18 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40fb3b5893eso34095165e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 05:07:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 hi7-20020a05600c534700b00410be9b8b96sm7140957wmb.37.2024.02.13.05.07.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 05:07:18 -0800 (PST)
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
X-Inumbo-ID: d0dabed7-ca70-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707829638; x=1708434438; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sd18wvrol6QQ+0l525rSim8sbUKG0K0n74QLzBOifzc=;
        b=UacjFxd6eSQMp7NQLGX+3RqcyJIAt9OCSLKY8LGTDdGlzJOZ5s6AHL5Q+asNpRuNos
         S87zbpEOFxPMLNClnB+0nnPPXaqAuFvsHpvF7ACaWVdbYF/1dTqrcqAJut53EKMZ+LFq
         uLWvQ25o9oFGMu96FCbI/LMfuGRgELUFLxZAZkh8l0+bsWLCh3HvZuKdkPeswdKFMpOz
         moZ9gYTV378wQ3PFHD/+zv+G1kZMrHccBNqKA0ExkbtqMjsKLAMajpPysYEQPVRK5Vnp
         hs2dm2n1L5tir5h6W+P274dXEn7rwIJizZKxDYODfRGX0L7qua6Ek9zz/2LESw9DWizy
         YchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707829638; x=1708434438;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sd18wvrol6QQ+0l525rSim8sbUKG0K0n74QLzBOifzc=;
        b=lsG3jIOA5GSoWIeNO3aZ18iF4swBwvCHmZJBYg/11s+7zoklLIQSHNwGaY7T4ETXHK
         rNcBNzxvzgG/5v4bFjKstpLMU4x1xiVyyocoyGX5ue6ZLxnuXKYLi0h/iND6y+UG0e1E
         BUsSfckPkqHGLbfE21U6axD7SamAA6qqaJ3uj7oiS18pNMTstrCtdulRGOWeO40u+P0v
         NIq+FVSEZgr69yfDybntdeFgu2eTMSQ/kNaiY2Jp2AE2pjyUmtZwSaHLhR+7wJ9dHNcJ
         uRWKO1FwckxC8LgZMnRa7IXdjNL908rVvdoHQMH/mPBFu+slequxhO/rFVdnm9kdmt79
         zD4w==
X-Forwarded-Encrypted: i=1; AJvYcCU/JqPXl8zVgpztjZNtEYuouu/7hs0uhtDMW5YvFTpFKyK7GKHYcXcWJnknM/iBvj9QGId/D/rfMqVet7DCcDI/L1jE0OErQ4A+/+bnqHM=
X-Gm-Message-State: AOJu0YyGqWVQbgiKYcaVQofoRnb+ZYyP3DD3FnzbohJd60XVeStGkL+7
	LRlwBuD2OT2suMQcJZFbg2y9FdU3Ph3qHicmiecPs0sCUb/u7f5KsWcUlrqL9Q==
X-Google-Smtp-Source: AGHT+IHF2bz+1gU3NCdTxSAzlHFdMJgOvqByXMvg8DYY9nFLuGACwqXJbFazgy7jqd+8HcXOWHM1SA==
X-Received: by 2002:a05:600c:5190:b0:411:a596:a2ac with SMTP id fa16-20020a05600c519000b00411a596a2acmr2379849wmb.1.1707829638397;
        Tue, 13 Feb 2024 05:07:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVLx5DMliR3ShmZwHBYzspQgEwhYnk2RMLP4zqsT8Rp8yC2DPH03nA71rHaOFMsqiuzLnkYeGE8xBySOa0LbbW7q2poCW+Bg2b7bLWpw0u2rnPRXCuk1yWpM8T5g1oTQxL0BnuDgJFGmL3dVatAyUxjXDYUe1ahc+VWWm+NqZchr84SXn9zzHkJPlyHPDVDjWNMAjdgDsRe1gfTrQuu8coAD8oY0RQlFY5aKz5FH6CZ/hODjK5d0/17kBXX4/ymUxrVMxgcbBE0jUx5z5hnidExQCvSGieNYy+Xvq26qfVnRLL/yHYb9aA=
Message-ID: <d6078dea-6bb4-447a-9d4e-5f223e3472b8@suse.com>
Date: Tue, 13 Feb 2024 14:07:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/30] xen/riscv: define an address of frame table
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <796853f19b883c474998ba97c1ee66cf224b1bde.1707146506.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <796853f19b883c474998ba97c1ee66cf224b1bde.1707146506.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 16:32, Oleksii Kurochko wrote:
> Also, the patch adds some helpful macros that assist in avoiding
> the redefinition of memory layout for each MMU mode.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



