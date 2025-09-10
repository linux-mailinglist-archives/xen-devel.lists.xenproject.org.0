Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0F8B5184A
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 15:51:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118316.1464149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwLED-00023k-LX; Wed, 10 Sep 2025 13:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118316.1464149; Wed, 10 Sep 2025 13:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwLED-000217-IN; Wed, 10 Sep 2025 13:51:17 +0000
Received: by outflank-mailman (input) for mailman id 1118316;
 Wed, 10 Sep 2025 13:51:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8l2o=3V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwLEC-000211-5p
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 13:51:16 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37d07831-8e4d-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 15:51:15 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b04679375f6so1200542466b.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Sep 2025 06:51:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b078346526fsm163544466b.109.2025.09.10.06.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 06:51:14 -0700 (PDT)
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
X-Inumbo-ID: 37d07831-8e4d-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757512274; x=1758117074; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TVHXhZ0yAX2N1bdYBedEiIPo5sSgmt1L2Z+FQJWZj7g=;
        b=ZPgJwL6w/xhNmqAbmD3xyUeKfSXJir23Zu1zdJHCy9gZiyNeiHYtAyw58dJpVpRV8s
         uNR8TQVb4KPpLFs0c6t1aFs13R1qmGmbSJz9Q2xw8/U6ABvx8PIBKiaAKVnZ6mMaaWPD
         fI1c8YBG6k+5ajL/u0enrtG88dOzCuEcpG6rUzhi1SMQWhrw8HaIVZFHR1L7VJ5hS0mw
         SpR8uWFcgbwY8uaKINJ2RS88QQRVqovA/EtECAOwsJm3UFZ7d5e3F3AeFBEql8Q9HtN2
         FhyJbLx82WX++2pVUQEVvOipFUxdcjuZgX6/VKgvbt93QqigwDkxN+WEMcBk1uPH8bap
         Fabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757512274; x=1758117074;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVHXhZ0yAX2N1bdYBedEiIPo5sSgmt1L2Z+FQJWZj7g=;
        b=aRpUlOme1hW+aPIF0yIaJ7Pqj/hCdfp1DZGvcurguW7BD5K5e3dqgFEzvC7nPf4uiJ
         AFRmnoYfMsyR91UBzY5rU5SLuB2CakXHCNKOiVSeqiI5ta1HLSMmhnAz6vHuHuldjDED
         gdTJvl3/Ez4cUVakd4igsL88jKtRRhnW7afVH8qQVOzwwgyG+3LupqAPzfOTCuV+C8+q
         SLEmH2TGw65iboSQ6PMqykuBW3qV3BfKzbwv/TgkEP33CcGxH/KHi8gB9mTW1mJ38Upj
         B6T8djI5gpiofDLrwWYlQ/VQ5hsU0HiFlh81bqVICqCb4IC6+PxIlVV946Wmlg5UN3J0
         9j9w==
X-Forwarded-Encrypted: i=1; AJvYcCVbRYAlOS9JCaOauwh3d8jI3kP+2iIvmWLKp8iAcAmuyo++AiK3KutrjDtYaRQNWOTm4vBHvr13u0Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGVbm6+D4xrhiG8kwIYa38zi0acOaPVzQXamqHyEDvR6OPBrCX
	sXI+Fkje4YyS11V6ybQY2v3FB/FBxzineinrGbdzDWVGiFicG0M5GnXtVpOdCfW0Sw==
X-Gm-Gg: ASbGncsTUIR0Yin0dtUOAH3zX4eLzqfc2vpPRHmNwmogQQukkYus+CwGkm629Wy3M/b
	kB29jmaMipLHjPn0ROwR4BqMi8GXWpslw4HKSS7ahcqg8BNx0/lVPflqbCtstyjmFATHbNvQIjz
	bpMicffL3QFz/AhGCrJbnAAPd94lihOBbsTCCayQRi9rH0XIZ1hISvI2UY+7II0LzGLlG29EXDI
	gVftOns0EwxrYrtslsals4tw27d1kZXo1c+u0vdcpI16TfwD4iwJH4rdpW4q4gpw5szUA9uMj/C
	j5s8L1HHcapak72ypcyWSCm03n84ijf2esdpYJUog92Im4ZsOEeBUpPAWw0hYo5i/5dsKou1rIL
	5DZl4hYj2sSpzwRKyKm/gBTIqMCqNo9jdIvWuLkd/3dfZ1KqTSPwAsuidPwmmY90p3rqB+h9Azu
	pSfuYOrn4=
X-Google-Smtp-Source: AGHT+IGWhMkWVShvo7xYCEvZwdzfhjFWU8q6T4f9FgH7chl4nJrGCzxqofwWOvGMi9cfS1i7NCePhA==
X-Received: by 2002:a17:907:970e:b0:afe:ea46:e80b with SMTP id a640c23a62f3a-b04b13c1c4cmr1687302366b.10.1757512274405;
        Wed, 10 Sep 2025 06:51:14 -0700 (PDT)
Message-ID: <7ddbde88-a0d8-4c9f-a3d3-c7331bbecd3a@suse.com>
Date: Wed, 10 Sep 2025 15:51:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/26] xen/xsm: wrap xsm_vm_event_control() with
 CONFIG_VM_EVENT
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-7-Penny.Zheng@amd.com>
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
In-Reply-To: <20250910073827.3622177-7-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2025 09:38, Penny Zheng wrote:
> Function xsm_vm_event_control() is only invoked under CONFIG_VM_EVENT, so
> it shall be wrapped with it

Isn't this addressing a Misra violation then? Whether it's "unreachable code"
or "dead code" I can't really tell; I don't think I have properly understood
when it is which of the two. (Change looks okay to me, apart from this aspect
of describing it.)

Jan

