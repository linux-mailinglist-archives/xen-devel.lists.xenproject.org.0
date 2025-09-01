Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC391B3DEC4
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 11:41:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104308.1455392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut12h-00048W-5x; Mon, 01 Sep 2025 09:41:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104308.1455392; Mon, 01 Sep 2025 09:41:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut12h-00045c-2z; Mon, 01 Sep 2025 09:41:39 +0000
Received: by outflank-mailman (input) for mailman id 1104308;
 Mon, 01 Sep 2025 09:41:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut12g-00045W-B4
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 09:41:38 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dab64b64-8717-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 11:41:37 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-afcb7ae31caso793060966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 02:41:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b040a410817sm471886466b.101.2025.09.01.02.41.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 02:41:36 -0700 (PDT)
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
X-Inumbo-ID: dab64b64-8717-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756719697; x=1757324497; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4+BM3Xhn1MZ492LnnsElsyd9BhW7vSGWsjJA7PcFLak=;
        b=RvTm5Dn27oB4nk+P4UPJrua25ud2csw6ceSVLD9VSWwhBtNpT8Atd/RaW40wzhiWoe
         Cfv5zkKAK4nxRR2C3REIpHPvZRgYv71lGhwdmC6SCXcLIo9MYNaDcq/dIqpe0WnfPQ+z
         B42ClVLZeiGZdegE5pzhkh3+skGbCSKcQpOp21/u+HHdklw+ZvSWeAOvgNoyf3duYNN9
         g4TJ6iv6LFKNuoAWc+zxkVau7rtzUtu698CXU8sWukulPhB+9oqpw4uAu9MOeUCY1YOJ
         k7Thhy2ozbaKfyLT1DS56p5rH4EVw9HG23b9ikUewvTn5Up1HCE38bDTv0RLGLPmN3zD
         3ozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756719697; x=1757324497;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+BM3Xhn1MZ492LnnsElsyd9BhW7vSGWsjJA7PcFLak=;
        b=xF9OLs8eG6G84xO18zVg6qHQ6PEtDTdhjefp08oMYS0MmrUxzsTuq2Ztf3oZ7hxRKN
         vQ6v7tTLPuamcQ/6AmWfPV1ZAkwfNY3dvolpzsZHAUUOKP2DnyX3YebN2dvn8ej5CtwY
         VEDV26sWrw77QHUvfIOH4hp7jnxBM/38fJfbJsYKm0R6W8O3jrTcjjwS//f8TviSby4P
         GpBX8j2FfMjnvH33rJ1EK4+mA+rfcH4sWrJQ8vY6vdneVMTfIHETUxYNJgXblC9gSDwq
         31ZTZzp2KEVGRFJmYzZ2btVLk0SRSKtORD2cXb40ZGt+Txops/0Yuw0DBLja6n/UUvZZ
         Lo7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXytbaQVOADsueGZIsEXTeC+U6M2dX9wBENNnFRrnXPXgZB7C2hEAVW2/3QnTcFHnNbnk0ofT8TEOs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyemssz9fM99SZ7x0m/yD060epzbQXyHMo69XTSIST0KOFDH62s
	xVOS3z0gdRcUYrGhhA4O6U7D0Uj35kfVz57YBlgn2hH7GuUMMgV0M9sE0rVjN8hxRQ==
X-Gm-Gg: ASbGncupHSiJ7n8LWPhIfxTM/98O7aglmcMRZP80KFAvOIxoT4FM9Vu/fkY/HqhAEHk
	Y5253FYQS9JbF+x0TZIOom3bXu44TtcAlsN4El5XyyENX+YqfQx30iJoK04/b4BegE1L9Yfr8T7
	loxENvbUqOiySfTqsyh/7qOv2J4OL0GfqVj2vjPFm0p/ELguX1BUbzwDzUSHVgPYU/tTsDOHGJD
	OY+Fx84+DwQ85tcLEldmehobtmaigXfpKBBKXc1fsFOZzTP/Kt0I+28mJUEEcRyaOtA5qkKNLjV
	m0TolkUT6zVr/lprBFMF9/Adan841av+O/sxqHDLWauX5Ocr33//fTZnhyyWpTVQSV9Yz+1U7GH
	hX+2YyFTkfxfYTSPgmXIEry+iFlIiu/EJT6k3UpyLp2+YL6dwbEKUOJsOsx0a4/T8lXrAE6fC1X
	swS5btzR7MXbS81ZHPog==
X-Google-Smtp-Source: AGHT+IEEuXg2lLbJFkKz8+oBt/XPgCrpzq2VIfhpdTMd4tcNtC3jBqZim2TzIv98B+Q8+J0K86H3cw==
X-Received: by 2002:a17:907:3f8d:b0:afe:b827:ca0b with SMTP id a640c23a62f3a-b01d8a25c5emr757780366b.10.1756719696662;
        Mon, 01 Sep 2025 02:41:36 -0700 (PDT)
Message-ID: <e6f65ab3-2c5a-4fee-b477-db1d2dcb4f9a@suse.com>
Date: Mon, 1 Sep 2025 11:41:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/23] x86/traps: Make an IDT-specific #DB helper
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-11-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250828150409.901315-11-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 17:03, Andrew Cooper wrote:
> FRED provides PENDING_DBG in the the stack frame, avoiding the need to read
> %dr6 manually.
> 
> Rename do_debug() to handle_DB(), and update it to take a dbg field using
> positive polarity.
> 
> Introduce a new handle_DB_IDT() which reads %dr6.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


