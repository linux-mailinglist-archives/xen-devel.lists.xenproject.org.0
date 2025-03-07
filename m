Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD84A56871
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 14:05:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904997.1312767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqXNl-0000kS-10; Fri, 07 Mar 2025 13:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904997.1312767; Fri, 07 Mar 2025 13:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqXNk-0000jR-Sp; Fri, 07 Mar 2025 13:04:52 +0000
Received: by outflank-mailman (input) for mailman id 904997;
 Fri, 07 Mar 2025 13:04:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tqXNj-0000jL-7H
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 13:04:51 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfe6c9c2-fb54-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 14:04:48 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-54957f0c657so2097835e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Mar 2025 05:04:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfcdasm5207549f8f.23.2025.03.07.05.04.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 05:04:13 -0800 (PST)
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
X-Inumbo-ID: bfe6c9c2-fb54-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741352688; x=1741957488; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eaMyo+npIexXr831OCEP5A7iI6U6j5Gor1kwie0RLhE=;
        b=COaRs+UO9hRicTjNGBj06FVo38oupAofESpS/0lMuGCkUV5dZyFWWcCGUhtaA4+2Jd
         jq18kjAm5X1vUAap5Uk4/UuGYSR3W1xPZrED2GJiyYeGNiMNtvt6MvRQN/P0giK0T8oJ
         UarCnpYiK9SJFg7YJz5VLwGFUUsOapEq/bTseru3SQrecK9mmUinr7NrSCzC2zNg+ZMf
         cInkGy82hBBfw3wYzIzJh7fJsa+OwV41T6GHtd1BdKRRooawRwttrzrnBfCT0buA3ed/
         cSrCvOghivIW6JYWrcKNnXz6e5iEceluZVTPss3RG71MQnU1DnX77nfj8k2p/U+Cdyqj
         0agg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741352688; x=1741957488;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaMyo+npIexXr831OCEP5A7iI6U6j5Gor1kwie0RLhE=;
        b=C+/GxxsTb6tRiKaNHARyzZ0n+Pacsdd4n2rJtdoKv0VNwY/XLDwIr8rxNdnvjYzAoS
         YwthIyyApO6Ut3Cb2EAw+krvAu2ORIJqVj0eQdZNgcfk6NTH5GOx0obmcdNdTfo/7AeC
         VtaQHPW7q2UeM6VmbalC5z3+5/L7SuE0gAWrgId3VU41iHeRWTwFS+eW8ddD+oGGu1zj
         Qx2AkSEOpaB9mWtEAoEXM5q5a4IK0yzrjVmfnLCVS72c0cyQaJM6lU76sh2WFDTgPE9D
         7aKrJlTEl3EBhW1a/Yo7d06he4O6Q7vRz6xzVCbvba8bEWzNI/7EJtf5bIf01qV7Ug0Z
         945w==
X-Forwarded-Encrypted: i=1; AJvYcCX4SBUSJHDCDpp7JyCOotE4bcjytyro+wJaTbtbYgNcXSC1anuGE0HUGfL+IlisX8Y0amdPCqOQ+UE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzABFGwEWbeVYae5ac7PSOOvybjcJCbe+0HMNQn+l3LB0Pg/blW
	pG9j7zVS1E4lEexjQTTgh5GAImh72V0wqs/qkkD54M8cQ6ljUmTsbdQaMSK0iTevuLLbQDV/mYw
	=
X-Gm-Gg: ASbGncvO2LkxjYSh136ZW26CSbeneGTSms6Fqx6yVio050LutcLceA/Gi5Gvi9+GaEy
	y0yMpAuh+mBxPqBLnYZ7rOIRp5hCPckG0k5clGTyHOC+19G7nbDmJgk79hrDWEi5S9GI4BCB8V9
	1bjkQ7u/5YBrpc5HFzELnCCdpoRyqLYybgBg6D87HpszZc4bWOHlHWAdsV0e2cfEEwgHgVOsDKC
	trMtLrSUFfRjoId2FmNKmWg1kBPwTC5Rt9hq5XK54Z3Iivs6Tkjkrhgiue0km8j0rmRkl3uJbQP
	0Y78oaXDr9XF0heNGMPXJOxONEbkv0xlFfvcMBuJYE7plPwQj/FHJgybb+lX08JQYFIKVwVngnp
	MldfrbehGRUyGPtRWVye7jc+K34ohuA==
X-Google-Smtp-Source: AGHT+IEV8pqn/pQJcNfOhcqnnVLKfUYtltVrxOkRIRYmOYY8XWNo/7zjAeI67l5dDTul8kOEzr8Hww==
X-Received: by 2002:a05:600c:4e8d:b0:439:873a:1114 with SMTP id 5b1f17b1804b1-43c5a60efaamr21764345e9.6.1741352654173;
        Fri, 07 Mar 2025 05:04:14 -0800 (PST)
Message-ID: <91939942-0290-40d3-9164-68ab13821b09@suse.com>
Date: Fri, 7 Mar 2025 14:04:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/public: Fix documentation of VIRQs
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <0315252d-0378-4699-bff7-ce745d753438@suse.com>
 <20250307114930.3038480-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250307114930.3038480-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.03.2025 12:49, Andrew Cooper wrote:
> It has been discovered that VIRQ_ARGO is a 3rd type of VIRQ.  Also, recent
> work has prevented global VIRQs from being stolen from the owning domain.
> 
> Rewrite the description of VIRQ classifications.  Drop the (DOM0) comment from
> the global VIRQs; it's not been true for a long time.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



