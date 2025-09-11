Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655FCB531F2
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 14:20:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120193.1465228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwgHK-0000PH-FG; Thu, 11 Sep 2025 12:19:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120193.1465228; Thu, 11 Sep 2025 12:19:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwgHK-0000NW-CC; Thu, 11 Sep 2025 12:19:54 +0000
Received: by outflank-mailman (input) for mailman id 1120193;
 Thu, 11 Sep 2025 12:19:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUpj=3W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwgHJ-0000NP-Ev
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 12:19:53 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d7ccba1-8f09-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 14:19:51 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b079c13240eso105124666b.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 05:19:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32dd3efsm120831966b.55.2025.09.11.05.19.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 05:19:49 -0700 (PDT)
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
X-Inumbo-ID: 9d7ccba1-8f09-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757593190; x=1758197990; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=07cCRKFEKR73KcOdWtmwOLBVT2/9Zq2igD34GYfPbwI=;
        b=WVss+EDtO2nSlnwKB3ifA/VGAuw8tCeiFC7mzhx+Shc3+gqW7Tk+2I/r1pB4zbEWEX
         APg13QTwPbSduZknJZ9ulFVeoWP22hXTxOsYklE6hGh2etf0fxTWr/yqmMNOf+oT8w7U
         rvGoKesomleXQph5S+USQ5rR5vdAtyzRMA0T9Uu++G0lReMLmS0vVZN2WEMk8oj0fwSW
         uI34KJShJ0IN5U2C/7AphaCW6QjqQMB4MV649ZzicwmFUV3+6H5D/QSPAICpdptSijcJ
         KOuAM9u3uw8xg6B2C49dZykR0zUPP75uCbtXZqFUTnQnsCBrM9+QQku6OFMyxez3M4D4
         qwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757593190; x=1758197990;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07cCRKFEKR73KcOdWtmwOLBVT2/9Zq2igD34GYfPbwI=;
        b=agF3HEL0+B0XwMGSJWp+LHxUGfdg8IoWo1OZgd0IlBoycvY1EZ/4wtjrAJeWajaD0P
         IVLWFDf8MxC2Ct0FrPX4+njqPnXpYXO9ytnkHtLBXZrh7lKReEmrMTbOOV1KauH6uwmS
         O3tGVC3ayp9V/6bZe3TtEAwcIOAeTN35y3Ru05XwIBkSa3dXNm3c/XHB7rRa6zcm69/A
         Yg2rJ75xLEHq+QUUfRWu70AB3PsyknjE6/7PE2qHAQaTt5ZxzFKZ8DbAKln6tE+OTDa/
         zAnJ1rL5l+v8JqP5EYa0y+I7RAFFfM2OwQUHSKy9NKtXMPB7OCZVCqYcg6JXeGkkhnQD
         HSbg==
X-Gm-Message-State: AOJu0Yw8L+Bb5uKeh8XTdcZzLdmsrVbS5wEFAgg7mbn7fxcEkFUsGiVo
	oQ1Ep1/YqvyFzU3kgygOdvsgtlJ+HL286wJnMREoL8QK/P9uuiO/qPclLRu1ls2GNw==
X-Gm-Gg: ASbGncs6Do6uXr5USrGZNOMWqMaCxCEgAliLLbRIwsIjbBARcTi/HI01KBqV3pMDdio
	B5aTNZcqPN2w2MObIMfmwHr0Cbfzfk6znlZn8RNw2D3pnECMouyR993V4xsTb/BmDXpCiQNH8fn
	qpCLB0/NKSYXMUQHiGkKJXjMJOaVxpgU+8LNVwZ2P+D6yX1S2A7MAcXzQ1FvzMTCgnbd39Vl67e
	e7hjwjCjX5ZPyqTWZr1Qvsghdhu3tjTiF6QqrUM7Ez7uOr91s0sX/mD2BCuEjrwbVgYF632xOat
	ej7YUJ46Sq4jyclZFL7E0qylbuE1RYVRDEaakSoWEWW6pn78bnt87kJCL7lySnMj+ow96b02X6h
	zbiQ64CBLyJlW7H2jnckc9Gs8a/g4yafyA7wwymGgkplw6kaUKLb+MZYIYfzgRJxAG4+e6YOesI
	RqoXpZYHc=
X-Google-Smtp-Source: AGHT+IGS+R8sUY7Cmx8cqEPn9NCyABx3ZIvVKD+39LfDEEmyjXzcbDBHdgosaFLE6xltRODWVO0obA==
X-Received: by 2002:a17:907:6d16:b0:b04:48b5:6e8a with SMTP id a640c23a62f3a-b04b13c1734mr1957582266b.7.1757593190176;
        Thu, 11 Sep 2025 05:19:50 -0700 (PDT)
Message-ID: <6c53c773-019e-4650-93a7-4a3127e33410@suse.com>
Date: Thu, 11 Sep 2025 14:19:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/26] xen/x86: make CONFIG_X86_PSR depend on
 CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: xen-devel@lists.xenproject.org, ray.huang@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-24-Penny.Zheng@amd.com>
 <alpine.DEB.2.22.394.2509102020240.52703@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2509102020240.52703@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.09.2025 05:22, Stefano Stabellini wrote:
> On Wed, 10 Sep 2025, Penny Zheng wrote:
>> Users control/monitor Intel Platform Shared Resource (PSR) through
>> related domctl-op or sysctl-op, so CONFIG_X86_PSR can be put under
>> MGMT_HYPERCALLS. With this change, we could remove MGMT_HYPERCALLS-wrapping
>> in psr.c
>>
>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>


