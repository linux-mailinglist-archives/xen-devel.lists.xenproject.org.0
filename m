Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCF3ADA87B
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 08:46:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016560.1393486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3ba-0004Vo-Rr; Mon, 16 Jun 2025 06:46:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016560.1393486; Mon, 16 Jun 2025 06:46:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3ba-0004TY-P2; Mon, 16 Jun 2025 06:46:06 +0000
Received: by outflank-mailman (input) for mailman id 1016560;
 Mon, 16 Jun 2025 06:46:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uR3bY-0004TB-UJ
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 06:46:04 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92b31696-4a7d-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 08:46:04 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ade5a0442dfso779151166b.1
 for <xen-devel@lists.xenproject.org>; Sun, 15 Jun 2025 23:46:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec81bb9e4sm593157266b.45.2025.06.15.23.46.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jun 2025 23:46:03 -0700 (PDT)
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
X-Inumbo-ID: 92b31696-4a7d-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750056363; x=1750661163; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z4li5pnrfw+bj5h1kspRnPPFQ3tdxGne1EH5hCbEDn0=;
        b=QljBywIEyaItxF0QDvdJ/Klz/vvBvHHjHEJz589/sKxCqCvFrjgBVUlA3J4jPVayqh
         rVK7NV/WMOqz4KTF3sh0msmLPczpRuGqIKe5c0adefHLC/CvzZrE4+UrO1rW0gHaB1em
         /YobSViKBrqQDAj2cHNIcEwQr57Vg5JPALJJeQi2TFeWw+glE0gXENg1X8I2kYdgtrRD
         5BNJgdq5MmZNd3i5b0+1HDKL6l01SzX2wj9jw5vNrk0bjJTbax6zrn2TBhLVy9CFiTBf
         fpuPFrf5pC4SiJXBLQBBMnFgF9dGk/ReMJ3sxCC5awhWwnl9Oqy4s9ev7WPvNuA4LqkV
         nNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750056363; x=1750661163;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4li5pnrfw+bj5h1kspRnPPFQ3tdxGne1EH5hCbEDn0=;
        b=QSKpo/EiHZVibiLF+5EAI3ylfuRazp+UF4eS0qfdvql9wIk8uLnrsRLSo2fQ8ao+q2
         2EgMa/yy/0S3f8k8u+mWzHqeMk2TBXpud74SKtPg+4L8pszWQP5oNIGdOIuW4WB+puYg
         MDdSXPB29lJ2XqOFWcoo2HAaJHoKp1Zt55tabIvi/0rXVg1jiOdU6/HHZFb76cSWSrdB
         IKFfVmt30zRyX8jLMKJRqDa9lDFQjtlKoJxHK2Zrj7cr7eSIsGIiZKFHosnxj2Igx/Rk
         ySzBs7IiLaOUzXXCWWNXwKwNMI7E7NdpJmOT2YnbgP0HMh2llYQXfllmZQZWxsetBwLx
         2uzA==
X-Forwarded-Encrypted: i=1; AJvYcCUdVawIDZG1htzVvLcCRndwYDxn7ITz5kKBDTWRtFs+otZE06PV5v0ff5E4ih4+EvGeR35VGc6bVUA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJHXdLPBiYDjjt/gHG+QRTFnQCB5Tn9m4S1NXTOs1SwdFLvQo8
	M63CzpZeoY4tGYeC4JrLfqW7qs3A8KnUBXAy6cXxzagBBR2LoKuI5euAf5r0oYSjrg==
X-Gm-Gg: ASbGncurgAhQPaYMOjED51xX2K/wh/4WGOgw2DWo21f6ssthZSpdcMMSIZEz/pBp/K+
	rMWB5qiwEFAtyVQJAxNNL1KcgmiCIlmIgfDmvxN5Fw92nclO0oAC3dgrFAWX5Mau1DBIP0H07YY
	GpQROgPH/NRZXOZokU9l/j+haMtjs7L+8kbT+F9QwsqkYyLb8JXMBwnLeRZY4rN+4p9ZExHmCD5
	rPxnzCm0VH5BroD6fSQ1wQEALP45UnEiUeC6uhjIfk7fm7Z7PQUfLj5/5voYjWO0ywdmMl8z4lf
	x3QUvGZoQspsO0+cakPKliz14oW68hfVCCM5kunIP6wi8jshTmtMCx2vUfnK5LFlF+KLBR3WBNU
	ezF0Dz1yvnjKj9GM4dYEm3HrT0IOE3l+3zB9vtl4D4y7yRsc=
X-Google-Smtp-Source: AGHT+IGR5CjJEjIfiHWPTsDjdlyKeR9urcILrqUUW7YVtm5qG/pUoBwD1JhS+hiWXrDteqbtnykuyw==
X-Received: by 2002:a17:907:1b18:b0:ad2:2fe3:7074 with SMTP id a640c23a62f3a-adfad39c00amr702113966b.14.1750056363482;
        Sun, 15 Jun 2025 23:46:03 -0700 (PDT)
Message-ID: <938c0c34-5d98-4454-8e60-719b8eecc027@suse.com>
Date: Mon, 16 Jun 2025 08:46:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/14] x86: Preinitialise all modules to be of kind
 BOOTMOD_UNKNOWN
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250613151612.754222-1-agarciav@amd.com>
 <20250613151612.754222-3-agarciav@amd.com>
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
In-Reply-To: <20250613151612.754222-3-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.06.2025 17:13, Alejandro Vallejo wrote:
> A later patch removes boot_module and replaces its uses with bootmodule.
> The equivalent field for "type" doesn't have BOOTMOD_UNKNOWN as a zero
> value, so it must be explicitly set in the static xen_boot_info.
> 
> Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>


