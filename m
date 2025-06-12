Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CEDAD7201
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 15:31:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013106.1391650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPi1r-0001mS-0u; Thu, 12 Jun 2025 13:31:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013106.1391650; Thu, 12 Jun 2025 13:31:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPi1q-0001kc-UJ; Thu, 12 Jun 2025 13:31:38 +0000
Received: by outflank-mailman (input) for mailman id 1013106;
 Thu, 12 Jun 2025 13:31:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPi1o-0001kU-UE
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 13:31:36 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f4e618b-4791-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 15:31:35 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a536ecbf6fso617501f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 06:31:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748809eb13asm1391814b3a.112.2025.06.12.06.31.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 06:31:33 -0700 (PDT)
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
X-Inumbo-ID: 8f4e618b-4791-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749735094; x=1750339894; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qq6S9h5T01twzjul/UWz2fdAc+3LMZDieCEV+WCtWhw=;
        b=KWkJnZQBN14DBMW9rwQlX27zrvvjNc2pO9inLKd6y2puddJm2G5ZT3ZMXMMweqTqyr
         PjXbnqgRC4oS1A84WD+m+aCwvshLd4lBgfv2jSLq4bNim8nMskomY+eRjm/sb8DB/gNm
         rHXH2MNP00fFzyuVicLKR+VpLvrAClaHaNc6LgD+nQWJpxCKMUClchEbAQ4YVrAVvV9A
         0eCBZiRiVpouDv4NNcuZKp+YsVbGqSJp3czhbOeA7pl7uBSYPljBVHGRajeyX6EdGopH
         Ebj3PnR27q2xHL7RDWdUnJGSukFCLjy8CAXdhPsv28N3I1MJrwp2DVT4es9d3qe/OYMt
         YRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749735094; x=1750339894;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qq6S9h5T01twzjul/UWz2fdAc+3LMZDieCEV+WCtWhw=;
        b=o0ItM4ujzhbVkO2M2pilo5U6kK0YpWygeuBCBtnrvWXD/hGoGNo7Qz6mLThbdrRVkZ
         GyDA/5AzLzOICTUWiOhgtteUa/98qc6CoHBX7tkT/IORRPi9r5Ut99X925uZuVEf2DJE
         oU0xvfWzd27KK/Z6OWE9FCb2GqTjKo95MsHejGT+UmTfkXrCmr6rMDP5fTi0L3yn1OaB
         yK+wIz7oJW3Y8wG4EGqBiK9c60/F70wG1DHzrCCuxn+FiCRrzoWWpGTQxfoRZvI+ZR9z
         kyV974UbdGEN4EWIi+P8l4JoJGPIZJF3FVGMmKbZCjyhGqDkmgroVVF8HIt0tr7RaR/6
         0bRw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ0X4NMLhgl7wc8rnuDgxFsAWnVcdE6ZqYEEI3yROIOis4I5Lpb/tglZKX2k5bd+Gy8srFBcP6K2I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmJGhipD1flvMTwCZNIN165olvLFuoERkKSToDS8v4A8soECrG
	wZpBHNedbVjtPJMpYrCdh0qmCBSlk3YEJ8tQ5fuXntjpxeE/EOQrcuNkyxJrrZOkctIu1iBQgXK
	pJJE=
X-Gm-Gg: ASbGnctlEtXWHbuyjQNhNNh44WNIruYFrYPeBEWvBikzkp4G6gOQK0mgnpaABKgVDM9
	/n+xQLGO73DIdxu1FqLY+3NA5iNMOZLGKp293sQ1Xjtb5MGFByMN294vBa1EkAbEe1jFUCqDfeH
	90TjkfYxiU0BvwBfym9fQlh9Y9mkGuEDPXxj6puyVDIlJP8OKwvWy8FJpzp5RN1Rh5fh6IcHG5F
	X3VvC0G2TF4fcB3vk0uO0PbzQ7+8/CC1C2ZisYQxMznsN5/OKOCVf3IXZWjywcFfbu5o1hV4ZPr
	BEZE7tD7WElDtaB9I+vCuMJ7FoWNKIXogMVA+SXfLfRw22hMSJ6sKv02DQZxEmfWj6F4GuGIXxq
	JsD6ltfs08SpmlH1NQTvKyTYZgIKQMfW0JxhUDF3I0uiUzEo=
X-Google-Smtp-Source: AGHT+IFSMS3Cq6un6OZsp1HxW61vpEVJPvOld8jyRaiXrcd+//TfB36ljkxJudN+8GEkNA/p/KPXsw==
X-Received: by 2002:a05:6000:250a:b0:3a3:621a:d3c5 with SMTP id ffacd0b85a97d-3a558695c54mr5658629f8f.19.1749735094426;
        Thu, 12 Jun 2025 06:31:34 -0700 (PDT)
Message-ID: <8100bb94-2461-4a03-ae06-3e395036d4e7@suse.com>
Date: Thu, 12 Jun 2025 15:31:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/18] tools: optimize cpufreq average freq print
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-18-Penny.Zheng@amd.com>
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
In-Reply-To: <20250527084833.338427-18-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2025 10:48, Penny Zheng wrote:
> Unlike Cx/Px states, for which we need an extra loop to summerize residency (
> sum_cx[]/sum_px[]), we could call get_avgfreq_by_cpuid() right before printing.
> Also, with introduction of CPPC mode, average frequency print shall
> not depend on the existence of legacy P-states, so we remove "px_cap"
> dependancy check.
> 
> Fixes: add6160d7 (Add cpufreq actual average freq information to xenpm tools)

Unlike in earlier instances, here you have a fixes tag when the title merely
says "optimize". I also can't spot any bug that would be fixed here; what you
address is indeed an inefficiency.

As and aside: The Fixes: tag wants 12 digits of the hash quoted, and the
canonical form also has the title in quotes. You'll find numerous good
examples in patches being submitted.

Jan

