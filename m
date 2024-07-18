Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FC6934D1A
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 14:23:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760445.1170294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUQAC-0008QV-4l; Thu, 18 Jul 2024 12:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760445.1170294; Thu, 18 Jul 2024 12:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUQAC-0008PC-1V; Thu, 18 Jul 2024 12:23:12 +0000
Received: by outflank-mailman (input) for mailman id 760445;
 Thu, 18 Jul 2024 12:23:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sUQAB-0008P5-K3
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 12:23:11 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7eee7647-4500-11ef-bbfd-fd08da9f4363;
 Thu, 18 Jul 2024 14:23:10 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2eeb1ba040aso11445821fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 05:23:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7ec7da24sm9865394b3a.113.2024.07.18.05.23.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 05:23:09 -0700 (PDT)
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
X-Inumbo-ID: 7eee7647-4500-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721305390; x=1721910190; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eHv1sVimKmANnT8zhJH5+QM7YleOgRHZWZusPjpSvWM=;
        b=VMx4cBH7gPRuuMyWQ9MJFC2VGCPM4nSbzc1pEwE/6mRSQSbjuJ9MWjff0Y2994aOyd
         BslAv7oOtRI+fWzljo5qxnYTQpo9N8dM5F5/AO/rOUwmmFwI113bd8iSY/xIDo4Gs3fy
         CsM8J8UcZqIgHL0Ztn6xC0ZXtyACgQhzfDCSVg+eVrt4Ft7FM4LetzrjJJAViB6RgkrU
         RQjMZtMyJpPE9dkafGW0Rdo1Jpwjrf7HTp5LxduHVTTF2VrIEfscXT0DvDPrjxXTtlLW
         hOhN8DgmO6i/doyfUKddbhPoEDz3hy7qekf03LUBJnXn7M+Ja6w3bOh6WtQlhcKXSL42
         5nQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721305390; x=1721910190;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHv1sVimKmANnT8zhJH5+QM7YleOgRHZWZusPjpSvWM=;
        b=Edwk301gCDuM0caVBgtaGKJ9ErVrMX9JfgI2N4X4AmVAF2nfan47/D3xMoRIsAiIEe
         /AQjT+xoKDo4ogw6hMtXBdw7QqLVUcVHFCQTyh2hBnfrnJHSIOmjmLtdxfd2I9iRHZeq
         4MVvXVkWQNf1QFAghEV+Jclq8eHKr7pm0KKwJnrXI6OkO/Ull2L8GH5jpq8T/HqdRG+I
         EZnR912qyXw9ZtzQcSA7GLr/kZjp5qBjuLagWsUHV3guIahZdY+72w5pCBIXsJabZ79x
         MpzUhwl0n/0ZxK5xx1cT9WaVr8uePq117GJD79JUPQG4QSlsCVNGYK2AOj/8474nu++x
         H0bQ==
X-Forwarded-Encrypted: i=1; AJvYcCWarlj9CGvUiZiQecd2TfcGz16OXo6UUDgaW0kz22pQEThj/JvokAMC2pdJ6SqhrBsy5RwFwbyS2lAyy9M8d2iwCwygP+Y27HXRFhhWF4Q=
X-Gm-Message-State: AOJu0YwuLEp2A4tsys0l89/ml678zvLMwMEIyceVakCrrI4h6usf7+j+
	hdOY9xzF79hqYeA4O81irFTlGUlvaeAhFH79/xNgALQS0GUj6FEA2eb9T9ua+A==
X-Google-Smtp-Source: AGHT+IE5u/yrHXbOMtDqbQ/OfShqeRnuo7KJg1UYJhQQBv0jhwtELiQFZntfVOGmWcWFntBeJSdOVA==
X-Received: by 2002:a2e:91cb:0:b0:2ec:5964:9c0d with SMTP id 38308e7fff4ca-2ef0599a549mr17653431fa.0.1721305390164;
        Thu, 18 Jul 2024 05:23:10 -0700 (PDT)
Message-ID: <ab44d1d6-de18-48a4-b105-bd91b38d6b0d@suse.com>
Date: Thu, 18 Jul 2024 14:23:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 2/2] x86/cpufreq: separate powernow/hwp/acpi
 cpufreq code
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1720596402.git.Sergiy_Kibrik@epam.com>
 <56f61a1e22ba77fb352d7a18203935c26c815646.1720596402.git.Sergiy_Kibrik@epam.com>
 <c2bc48f1-cdab-4cf5-bd41-f7b4a05a433d@amd.com>
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
In-Reply-To: <c2bc48f1-cdab-4cf5-bd41-f7b4a05a433d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.07.2024 20:32, Jason Andryuk wrote:
> On 2024-07-10 04:30, Sergiy Kibrik wrote:
>> Build AMD Architectural P-state driver when CONFIG_AMD is on, and
>> Intel Hardware P-States driver together with ACPI Processor P-States driver
>> when CONFIG_INTEL is on respectively, allowing for a platform-specific build.
>>
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>> CC: Jason Andryuk <jason.andryuk@amd.com>
>> CC: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Might be a little neater though to have the hwp_active() stub be just a single
line. I may take the liberty to change that while committing.

Jan

