Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E60B0796F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 17:20:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045349.1415465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc3vK-0007B1-0T; Wed, 16 Jul 2025 15:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045349.1415465; Wed, 16 Jul 2025 15:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc3vJ-00079H-TO; Wed, 16 Jul 2025 15:19:57 +0000
Received: by outflank-mailman (input) for mailman id 1045349;
 Wed, 16 Jul 2025 15:19:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uc3vI-000797-74
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 15:19:56 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5344f589-6258-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 17:19:54 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a6d77b43c9so5817485f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 08:19:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f64c73sm14644252b3a.141.2025.07.16.08.19.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 08:19:53 -0700 (PDT)
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
X-Inumbo-ID: 5344f589-6258-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752679194; x=1753283994; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3qAOXInLZy6o3IJnUk6Gv1BwrtjuCeFaBfJ6LPcD5nk=;
        b=G72/AJNTRPLA15unZlIs9sYVEJwPyzabUkZpOu0mhBEJbYFCG7P1/Wj6rkuzJbgOYi
         9Ttexk+IK+6CLr3GycIr/M22wMsOCF3ayrmiEMeiZ0uDh+aYfah6mfJYv1beI/9zl1Uy
         R+fW9q4ntd6751xTZ2UwfZvZp+AXx8Bj6VDnqtoheojOMuV8mpN2qwMlOlW4ZI1oMdgm
         OeaVU24AtK8PCA3ZVpwYVLCGeO25f8lhzcaMrVIOm4pFE3uHSplfDPEmun0ChIBvasNY
         CQS1sMgGi3IZu0N6PU+fiQihVBSMzHCpcmrtlK0eLs7b1fZOcqjRszbBoY39lwCQdPuR
         vIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752679194; x=1753283994;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qAOXInLZy6o3IJnUk6Gv1BwrtjuCeFaBfJ6LPcD5nk=;
        b=fXJknzHT9R0PhDjPumYIJhL7xryeEqfPSP8vt6xXJT6EdULnDsfcRgfrBLXs9fgZyR
         X938vJM5OXwFzYn1f2xremkwTngD+MWr1aY46yuC4t4/e9sXxJSjY92mX9ZZ/c3PCMnN
         qnzyPppXCoGkiag7uEujaz95j/bSCEEl1GwiDuexz/+gn6fo2qEyeo7Rmo3JPA5/plsQ
         WOn+FlvDLsP9/KdqcsEeFN3X83hCpQX+lGGhghuBKnJEtDku9ckWapNSOxwmyeW3mcoi
         FnMZskJrhWPfWWUU9HKvBBnSCjmzQKm2/wOAmRTYBxZEvl+11QcGbbg9MMC3YBjLlvdy
         M/VQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0V6uZw97szOYTNJSSc8Qi7wkaYcxCks2ZwSGIrq1GfwXQsiU9s/+RFlr3NxjgbN6oXxmmh+qbLoE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxbokDC0rTOopHT/5m1761G2DsctYLcTo8UU4gxa/GXaKF5CIV0
	lBSxIcQSwmM4Y2bNVjtkn6jRov7Oej+EBruw3V+llnKvEeP/dqei93sgAtQFMHWX6w==
X-Gm-Gg: ASbGncvWwb+g1a/6huxx+dpFkVby/VcfkfHsST2CynANbPGmNY96QCJZq0RJNqBw8pa
	iiU7Fx5emS3/yM8+sNxsw/cpIKKUA4E81HVz1VeM3W2BP7sFlVBsofRaEYSdv6xmKN01ZxYfxX4
	TiZZYK0WNbcxiiED4TW9AHJjC/xBaC/Cb12FNlrjyxzTnUA0zNAd5wG27BDMeXRSUJMw4ITzjgx
	S2r66wNR06f78F85djgVuEa/3v7xCZof67Phx1EznV8g1U0a3m3pBVIo7q/VO1i9EwjS24ijQm+
	q5YzIu9iYBu0q+N+2DfrsnZjCGoAmO9z7aeFyEzo/oEM4XIIDPlZQl0PaAvI/GmE+otZRzu1m3p
	Lvyt953y7Mtq8+6z4HtccOr3FNGGwyPBBMoGIO4o8yvenV4j36PQ0ShnR51SL788L9p0gqZNEpQ
	WbsZ+oFf0=
X-Google-Smtp-Source: AGHT+IGfjwxVr5oWfvUIa+/D2qfjMXsYPQHqR/XKrB1l+6sfJJ1ZYHvTcCxc1ONGH/7c2cOBBD4RBg==
X-Received: by 2002:a05:6000:22c1:b0:3a6:f30b:2dd6 with SMTP id ffacd0b85a97d-3b60e4d2b6fmr2658957f8f.26.1752679193810;
        Wed, 16 Jul 2025 08:19:53 -0700 (PDT)
Message-ID: <64875817-7016-4693-842b-4c736b6d7373@suse.com>
Date: Wed, 16 Jul 2025 17:19:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/19] xen/cpufreq: neglect unsupported-mode request
 from DOM0
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-10-Penny.Zheng@amd.com>
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
In-Reply-To: <20250711035106.2540522-10-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2025 05:50, Penny Zheng wrote:
> DOM0 could deliever whatever performance statistic (Px, _CPC) it parses, it is
> Xen's responsibility to decide which one it shall accept.
> Xen rely on XEN_PROCESSOR_PM_xxx flag to tell which mode ( Px or CPPC )
> current cpufreq driver supports, and accepts relative info. It will neglect
> unsupported-mode request and yields success.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


