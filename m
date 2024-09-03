Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D0096989A
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 11:21:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788890.1198381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slPiO-00061C-5O; Tue, 03 Sep 2024 09:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788890.1198381; Tue, 03 Sep 2024 09:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slPiO-0005z8-2m; Tue, 03 Sep 2024 09:20:44 +0000
Received: by outflank-mailman (input) for mailman id 788890;
 Tue, 03 Sep 2024 09:20:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8q7v=QB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slPiN-0005z2-GU
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 09:20:43 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c91302cf-69d5-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 11:20:39 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a867a564911so598792166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 02:20:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89892226fesm657977266b.211.2024.09.03.02.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 02:20:38 -0700 (PDT)
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
X-Inumbo-ID: c91302cf-69d5-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725355239; x=1725960039; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lre0hddVZ3ZmPAkqLhvedopAL99Pm17HL76vC4p0awk=;
        b=NvZDYF0W+W/oXITGsgJQksoTUjspadGH1SAgVzs1zAE120CgrClwnrGGbzgLjhx1tL
         uOwwNeomrEMIyjPHlUTc81DFTVRaGjdVV5vHsvZb1OJNpwlzb4HPX8n1jFEAGpfj6NSY
         6ZOAxWHjg2G2Sk/GPwas31OZry0n4JsmeAYC9dV9xvrSfpzlulYXhco5qD8hiOCD9Xve
         KFFXm1wHIxrhpelXFhSlfNlaD26gkyQJ7nNXkT+T2HpEBffNKNVmZ9TBtg+2mjyAjTnn
         yiO1HACnvGr8qIVBcgo+5El0i43YbjfWreKMh65D/+w/iUBq5g52UzYBDJ44KyS3Lfk0
         epDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725355239; x=1725960039;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lre0hddVZ3ZmPAkqLhvedopAL99Pm17HL76vC4p0awk=;
        b=sigBWh5ylhaZnGWCJrqDq7iYJncMhjkLKd3QO4m3y8BB4HA+xvtzmBGp09OTNqvJHg
         RtN/h1gEGLnXgdVeyLkn6eUYDx2u9d/mYVk8ZvE1CHb6b69EsADHwIeN3ipv4CxG/bp0
         DvtFJosHEC2l+JFGH/WW1QI7gu4V/gR/5FRe92b2ELoY0ze8EXIHLM44muZteJOpQeux
         uVgiG2ymBJF5Kc1E9g4ZaXqoq3t6s0bGj0SmnEgY+lQBRS+WaTzLArTna6+Vx0KX1r5f
         2oS4xRT2Yn9ltHXXgm0tpY2+fQWqXc7+4KJYHSCv5qb36uzYMmvs2R+tM7Smi9jGaLN1
         RtbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFFPob5JOVs6hnqmUS8dqm7PxsFZXVgc9igPB7kbHhokLOCrpby2Oa8uyZT1OnB4YbrUIe147jd2I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yztt6Ti5uem9B62cU+dO0X8++/KnzAHqZFfnkwnTAypRtHSYmDY
	SUs74RdGNagpkBPo+qghsq5DMSYEa5DB7SMgrqoVuqkPtNsOz3DWVY8wEvyCQQ==
X-Google-Smtp-Source: AGHT+IHoFv4ZUTTt/y0BIWH0veyVIIKoaGkmwDwM7U9WmMZLYKC1nwIAGK9mfk+QYfGn9vDvVsi78A==
X-Received: by 2002:a17:906:fe44:b0:a86:96d1:d1b with SMTP id a640c23a62f3a-a89b94b40fcmr787250266b.16.1725355238790;
        Tue, 03 Sep 2024 02:20:38 -0700 (PDT)
Message-ID: <d4ed5e07-c938-4d38-a49c-5c451c0c3a89@suse.com>
Date: Tue, 3 Sep 2024 11:20:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] CHANGELOG: Update after fixing dm_restrict
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20240903085311.49818-1-anthony.perard@vates.tech>
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
In-Reply-To: <20240903085311.49818-1-anthony.perard@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.09.2024 10:54, Anthony PERARD wrote:
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -16,6 +16,10 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - On x86:
>     - Support for running on Xeon Phi processors.
>  
> +### Fixed
> + - Fixed xl/libxl dm\_restrict feature with QEMU 9.0.
> +
> +
>  ## [4.19.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.19.0) - 2024-07-29
>  
>  ### Changed

We had no "### Fixed" so far, and I think we also shouldn't gain any. Imo
this wants expressing in term of "### Changed", also wording the text
accordingly (needing to adapt to qemu changes isn't a bug fix, strictly
speaking, but more an enhancement in my view).

Jan

