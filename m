Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B2190EA55
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 14:04:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743734.1150693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJu3J-0001M9-FQ; Wed, 19 Jun 2024 12:04:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743734.1150693; Wed, 19 Jun 2024 12:04:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJu3J-0001Kd-Bq; Wed, 19 Jun 2024 12:04:37 +0000
Received: by outflank-mailman (input) for mailman id 743734;
 Wed, 19 Jun 2024 12:04:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhGR=NV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJu3I-0001KX-1U
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 12:04:36 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1784952d-2e34-11ef-b4bb-af5377834399;
 Wed, 19 Jun 2024 14:04:34 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2eaae2a6dc1so115193861fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2024 05:04:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855e5be4bsm115284975ad.19.2024.06.19.05.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 05:04:32 -0700 (PDT)
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
X-Inumbo-ID: 1784952d-2e34-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718798673; x=1719403473; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A4ae1nad0OEe4iAybnrKh8rkxZpqVuSSq7udvGtoVcA=;
        b=A5cWhMA4+x/WnEPB7WN9MyVND+szmzdlb4o9+6WqW6rv8gJ/UP1ctE70Wo8PWLGfbH
         cpcwxs7z4E3I+ahRGUvmaa04ir0cI/hFUoSlGBindGTNInsU+nmPrwh+3xK9f8jzFOSd
         BD7buSVnY7AxDnJE3sf9V9NODhackjzMtGETUywzaJoV89v/E+niYW/Y3YHoG6fN6smP
         jKOnFMpSaRFgfnfCMpbxlXFXri1zR5qKoGClu0dLU7qxqstsk8hw4O5+u431isYB7cI0
         itnw2d2SGqDz1aBIpbaqARVjYq4jWVhoqSUNbex2NIXM9KrM27zorFqFmPO+M+JYU/Lj
         h8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718798673; x=1719403473;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4ae1nad0OEe4iAybnrKh8rkxZpqVuSSq7udvGtoVcA=;
        b=H6kX9iP5ml/zOdhBMEUS1M0XbKW7f2/Fhiod2z8YL3FV6jLoAlDmI7v6+pRIiLW3YB
         6ys10j+zcGfYwo6/6nDsMtoBIoSfv4yxoghvTOV1X6dG2ipa9BRlI5y5Ec3CXE/acFqY
         0dKnwFDujIAz7tKDccPH4/vd33ugWFtmPFJZ5eQEHKl0thIsXuEVwzWiV0nCqumLGigf
         +SCFbvR5yw5p74R6GbtHHId4ylsduqsFk/9p1gJoL9h8v+HGjjmgryMoI2/FxvmFuOTd
         WsguYt4r3EdnS+YvmD8B4Lrfc7AF2AhDPmdhJGiJ9ZK5CXsq0Id1YRp4JMGgxHdf4ASO
         0wiw==
X-Forwarded-Encrypted: i=1; AJvYcCW477F/wQhFFzKUrt0V5ra2droGaWXvbEadMIaLYq4PdjhXXY8VF0t6IY4gY/RIzPTY0JaicAVKXbgLRHV163ZfHCaRf70f8O9KY9hZVWs=
X-Gm-Message-State: AOJu0YzpV7eSNE1CDWCIg3vUPft2U1tH2cXEfdVxsNcHBAYyyhgmnWnm
	hteh2nlbrux9uZ0cJbDWNw+3YooyLhIWD2d3+yFK63urJwt2m+AhKG7UCrRmiQ==
X-Google-Smtp-Source: AGHT+IH/qitZD0GhN2iiMju5DZO40IQT2LZpqLrw94Zh0xhUiP1MRBfJM0jFTzyRN2zFusHNjpIggQ==
X-Received: by 2002:a2e:87c7:0:b0:2ec:4267:191e with SMTP id 38308e7fff4ca-2ec426722e2mr4311631fa.18.1718798673468;
        Wed, 19 Jun 2024 05:04:33 -0700 (PDT)
Message-ID: <14188e5a-a641-4351-80b3-f69969c4ddba@suse.com>
Date: Wed, 19 Jun 2024 14:04:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] loadpolicy: Verifies memory allocation during policy
 loading
To: yskelg@gmail.com, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Austin Kim <austindh.kim@gmail.com>, shjy180909@gmail.com,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony@xenproject.org>
References: <20240527125438.66349-1-yskelg@gmail.com>
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
In-Reply-To: <20240527125438.66349-1-yskelg@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2024 14:54, yskelg@gmail.com wrote:
> --- a/tools/flask/utils/loadpolicy.c
> +++ b/tools/flask/utils/loadpolicy.c
> @@ -58,6 +58,11 @@ int main (int argCnt, const char *args[])
>      }
>  
>      polMemCp = malloc(info.st_size);
> +    if (!polMemCp) {
> +        fprintf(stderr, "Error occurred allocating %ld bytes\n", info.st_size);
> +        ret = -ENOMEM;

I don't think -ENOMEM is valid to use here. See neighboring code. Nevertheless
it is correct that a check should be here.

As to %ld - is that portably usable with an off_t value?

In any event, Daniel, really your turn to review / ack. I'm looking at this
merely because I found this and another bugfix still sit in waiting-for-ack
state.

Jan

