Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C07B34463
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 16:45:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093311.1448838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqYRc-0004mr-M4; Mon, 25 Aug 2025 14:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093311.1448838; Mon, 25 Aug 2025 14:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqYRc-0004kR-Iv; Mon, 25 Aug 2025 14:45:12 +0000
Received: by outflank-mailman (input) for mailman id 1093311;
 Mon, 25 Aug 2025 14:45:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqYRa-0004kB-OW
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 14:45:10 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18ebd1dd-81c2-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 16:45:09 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-afcb78d5e74so860113966b.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 07:45:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe56dd5632sm513167066b.110.2025.08.25.07.45.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 07:45:08 -0700 (PDT)
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
X-Inumbo-ID: 18ebd1dd-81c2-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756133108; x=1756737908; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JBMX4l46kcArceBzMpuqAJYg/5EeCqPqtKM+Vgu8tGo=;
        b=e+VTBuFRF6wYOf4P9p67nYLHQyuPPcLgc4RRfob45gqDODxiJVe/OjpLqHOmKP+t4v
         EWMsDsL+6yq3IY+n4rFB7mZSubxSBS8f783n3zsFIo50Lz16toHlmLpTHeWlbLVxqq79
         jZgaLDocD4EX71qrivv9Kf0yqdHyuxOHVL2YsXp1bx5YFVOPx7nPsVPzGh2XbcOOIuaP
         KaR9jXVsbbuMnjZl9iN8w0laLBgOApai8Cki8aqeO+1WtCFgjufE8XeQz6bVBf09dfiF
         BLlCw4Zv7aOsYyiRaKBOVjI6tvo1gtbbCbnQuNNG5gs5BFljt0Gf5fdYS9z6+JMO5kZe
         of+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756133108; x=1756737908;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBMX4l46kcArceBzMpuqAJYg/5EeCqPqtKM+Vgu8tGo=;
        b=RTFrHLfjHTWj/HoaQzJftyikAxgyBqGK+4lqT2OgChdagXC+Aso/uJR7Fur1bs4EZy
         HlTrhcmrU28bUSiYTz3YItcwM6e8WmiPa32S5wi0rtdRPi1Z605KezgRjVyOQQEcBOK9
         qwSMxNAZW+xv2GSg2N59URnTgey2ZhPL1SynNmQUjidJoeWpmLva4FWgFLGiZ5C/W8ZA
         wdCMmrzRK319iEF4WAUPsCECutWdA44A97dDk9gdhNs/aoaFQaPONO9jJ1v7YN7qwMTw
         L4UN8PmuJIlyhHgVAFFTs7wizZmlZi6ibJxN638N2wvzhIEHcbxOrCgQt8tjbEhnbOIF
         27BQ==
X-Forwarded-Encrypted: i=1; AJvYcCVydi9LCHaxmXFLLB6ahTqmY1rBeyV3D28Io7yLl3mCYpaPVVYJzR9X0ZX44XtqIqZ03hO7edg1Ndg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRJ1zhv9bU7c8vmtedNAjDS5Ukn64CcW7GxRRd016uFO27mfSv
	yNo1ZyydRGlYWfO0wM5pJyG4+mJI/FEEtDr/3UdOsYbn3VCqCC1K3C2Et71MgITB8XBOEljGND2
	Zi7c=
X-Gm-Gg: ASbGncvD2HtPKGEp0SF16207pO/8G+H9vd2/+E5pQXE7XOnHqaHz+WokBPumPwpBngC
	60q6hI9vhkPmgwJT4Y0suDzlXHtwKAuj7+xMAb5HzaZdyDGVnIH3V8CDggkPhMg+z+kK0eWTGWZ
	7WTLsETNGL7AgekG9/qKbzOW8AGu+kiDsNYKTF4ak4DVRb3KU/Qi47HZd2QwBW2/LA5D+wscHam
	KaE8rRAsFiCGi/t+a/0FX13DYuyer8tfqgjBfZv4Idim35UoRkGVcXUM4kt4o6D1dYO1xxPamUi
	+2I1RVOobktPdxOfal5R+LjLNnhgyA7r+M3Sz/rga2p8mj5lGfRAVtNm1v0S+y8l77IKCs2SUYo
	HFkyhsku5DKrmRky7zsgtpyhBlCsNT6avqmf5o9ptdKvfv+xma5NgOZeag+Qq3RRQrMaK5o4IcQ
	TrnRmlbCA=
X-Google-Smtp-Source: AGHT+IFZ91P5L6s+5lzMZ9lzohc/BvYq6fIgQcofIqa9aqlHG20qpKXVJSlWtvUvZlWAGbgMNlwmlQ==
X-Received: by 2002:a17:906:4784:b0:af9:8c1f:c2b9 with SMTP id a640c23a62f3a-afe28f767bdmr1074737866b.8.1756133108554;
        Mon, 25 Aug 2025 07:45:08 -0700 (PDT)
Message-ID: <8e57cb4c-293d-44a7-8c81-ac49e91df315@suse.com>
Date: Mon, 25 Aug 2025 16:45:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/13] xen/cpufreq: refactor cmdline "cpufreq=xxx"
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, xen-devel@lists.xenproject.org
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
 <20250822105218.3601273-6-Penny.Zheng@amd.com>
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
In-Reply-To: <20250822105218.3601273-6-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.08.2025 12:52, Penny Zheng wrote:
> A helper function handle_cpufreq_cmdline() is introduced to tidy different
> handling pathes.
> We also add a new helper cpufreq_opts_contain() to ignore redundant setting,
> like "cpufreq=hwp;hwp;xen"
> As only slot 0 of cpufreq_xen_opts[] needs explicit initializing with
> non-zero CPUFREQ_xen, dropping full array initializer could avoid touching
> initializer every time it grows
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


