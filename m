Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33491C80210
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 12:11:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170319.1495381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNUTd-0003U4-7x; Mon, 24 Nov 2025 11:11:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170319.1495381; Mon, 24 Nov 2025 11:11:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNUTd-0003Rp-5M; Mon, 24 Nov 2025 11:11:25 +0000
Received: by outflank-mailman (input) for mailman id 1170319;
 Mon, 24 Nov 2025 11:11:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNUTb-0003Rj-7W
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 11:11:23 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ee6bdab-c926-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 12:11:22 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-42b3d7c1321so2544037f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 03:11:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f2e5b6sm27422083f8f.1.2025.11.24.03.11.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 03:11:21 -0800 (PST)
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
X-Inumbo-ID: 4ee6bdab-c926-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763982681; x=1764587481; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qa336gh3GWnSlKPcY46UbGYLOBS66KWjTdOJCgg48E0=;
        b=KifVS2gxWsp5EXHVT+AqBhHQiXIWNTv3ZV+k5vIUrqZzOHRcvrG3vbgsT3PigjV4zB
         JgX9goU2xhoEQ+3LcB//elBcPYfPO5qYkhgxiMcZ5L9Sj4gQmQk3/IWm1JK4WflnoUV8
         zbQ+f4ffpUApN0RtOLz+7g9SOCpgoBou6aOI2M2MipAGJo40N9e/rsg8l8MvaEbf3lFz
         Lm/gq9DC7zwkEKkF71lC6mf90T9kUUfWa+o+iiJ2UDj+9P84aeAGJKFxzWf6smV6TUzY
         epQTIZkjtz22ugnN92NTLDGBaoFG9qkwTxxC9Px/a6XmMArjECw30ku85yEYenX/mjeb
         bmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763982681; x=1764587481;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qa336gh3GWnSlKPcY46UbGYLOBS66KWjTdOJCgg48E0=;
        b=onlh3n6bmHTDagoxrF3ZBxnts9tazoxM7xUUsyiN25uM3HoF12KguevsHERU0sx2Yw
         HgLMGJpVaibBHBqqjkdc3o9zO8zhxsNlbxrZ6KDWayJKE+IcUj5AP1Ykuh0c21I4hCph
         UXb+9bECNkrf8GY7pinz4EId9jCDVUxAlTRQvLucprocWqHROF29NBPDzj9aMc10hFzQ
         ni1U3KUEGZ0PiPfbKsXYvnV+4M7X3u4zhDMpyPn8j7SSEJGX6CxzQA3nz+M0oaEyIPLa
         iLM2xsEHAr9XXhjd13GyLACGTDQwOU31B31VYCVauwMkZuzDCxDwmJQW9P9ciyfbN8mJ
         69GQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8XejKdE2xRi2+1O0qTIOPRdYuUmwGKhgcFOBSbRjwX6dhMc1qBEaFjcIwZQVHb+pGuzpcLlSq0O8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuXDq5CSJz8ZqFaTlMrW8UdgT3kE7IceOd6oqm8KwSzrRpFKuW
	62NVvqVDwmp1q312G+CDcIxUtO1HR2hIz3W40FQE/BkQwbPfvLhouvT7V8fYP0MjKg==
X-Gm-Gg: ASbGncs+s2xGC9rKzJU7GiZNrlM6+T4PQN4I2gPKfaPdmx4UyMqt2WyLw0eWe/CWesh
	0AD8a+itpOp+qS+V1h3YI9aZCoh7e44okKJPCukXDNLLNrbVkBfI4gllaRiMeQG229VGr6wP5nE
	QOZrY04JVVSvG/k2mdylFWXlyIQ5MI6j2w1b7+fW6mxx1cBwUUKRQ5ndc+FHzMZKN8N5BEBAM6U
	PUevvL62+rb6lmJSqL0kwEt5aONYfFKO/SvANRCbHXnoyNMyfwNhjAtHan9lOYG/HkqiV/cAopF
	uZHb7IRg37iIjoMxlFfI6eaO1iT1CUsE4hFDzuNoj0enXXL242T8Q0ylzMJbPFDquPIBOeFl8oo
	N0Ha61lENrC4mpBybJQS6s0Tz+CxH6CRJKvk996JAJwADJWK58y4tDTnmQYrjcJpGB2sYJeIdOG
	u/IzW5SpRbZo3wKOiHKHEoH3hI9znjWps3LpoxHmy96lCVy6hgv+yshIBMIaKs12ZjLE6HrYg+d
	7Q=
X-Google-Smtp-Source: AGHT+IG3lI4cbhOZxSAAYYfnkFZI9S1k5J190dTiQVrI4KFnIcABS56JC97lnhLehzT3w8mc0JyFBQ==
X-Received: by 2002:a5d:5889:0:b0:427:813:6a52 with SMTP id ffacd0b85a97d-42cc1d1993bmr11825888f8f.41.1763982681304;
        Mon, 24 Nov 2025 03:11:21 -0800 (PST)
Message-ID: <6e5bd8d5-3f5a-45c5-b7ec-17f70e0932f3@suse.com>
Date: Mon, 24 Nov 2025 12:11:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] XEN: enable MC/DC coverage for Clang
To: Saman Dehghan <samaan.dehghan@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <3bb418ae6a36a9ac89c697a417fa0745fa9ac702.1763949990.git.samaan.dehghan@gmail.com>
 <52b0762ac4b5535a842a530365a75bdc81a5fe61.1763981619.git.samaan.dehghan@gmail.com>
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
In-Reply-To: <52b0762ac4b5535a842a530365a75bdc81a5fe61.1763981619.git.samaan.dehghan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2025 12:04, Saman Dehghan wrote:
> Clang >= 18 supports Modified Condition/Decision Coverage (MC/DC).
> This patch enables the detection and usage of this feature when
> compiling Xen with Clang.
> 
> - Update detection logic in Kconfig to check for the required set of
>   Clang flags for MC/DC:
>   '-fprofile-instr-generate -fcoverage-mapping -fcoverage-mcdc'.
>   This bundle is necessary because '-fcoverage-mcdc' requires
>   '-fcoverage-mapping', which in turn requires '-fprofile-instr-generate'.
> - Update llvm.c to handle the profile format changes (bitmap section)
>   required for MC/DC.
> - Guard -Wno-error=coverage-too-many-conditions with CONFIG_CC_IS_GCC
>   to avoid passing a GCC-only warning option to Clang
> 
> Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
ideally with ...

> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -136,6 +136,7 @@ non-init-objects = $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(extra-y))
>  
>  ifeq ($(CONFIG_CC_IS_CLANG),y)
>      cov-cflags-$(CONFIG_COVERAGE) := -fprofile-instr-generate -fcoverage-mapping
> +    cov-cflags-$(CONFIG_CONDITION_COVERAGE) +=  -fcoverage-mcdc

... the excess (double) blank here dropped (can likely be done while committing,
if no other need for a v3 arises).

Jan

