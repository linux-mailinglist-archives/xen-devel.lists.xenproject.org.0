Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A046A92105
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 17:12:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958018.1350994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Qup-0003wC-JQ; Thu, 17 Apr 2025 15:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958018.1350994; Thu, 17 Apr 2025 15:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Qup-0003tl-Ff; Thu, 17 Apr 2025 15:12:35 +0000
Received: by outflank-mailman (input) for mailman id 958018;
 Thu, 17 Apr 2025 15:12:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5Qun-0003tf-S5
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 15:12:33 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62b2d533-1b9e-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 17:12:32 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3995ff6b066so571822f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 08:12:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c50bf3fffsm1022995ad.91.2025.04.17.08.12.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 08:12:31 -0700 (PDT)
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
X-Inumbo-ID: 62b2d533-1b9e-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744902752; x=1745507552; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+DjIJswXbzQRN1nmeRNSiSYfBHkFEVYJTL/dUGIK80M=;
        b=gtadMHIoono8HCdqvKxDncSZl2UqcHwDsaWPPrBoouZuI0gN+ZjoLrDQOoO90Sqdkt
         es7meIHNZgSU5M0rc8+GxsRyI22VafAu0f0NbmxDcVIMhaC+SEJa1F/3wphr3FqCWp6O
         u7cEEPQDhmUHoABwM+hqXAfDLQZxQ8NyGzWhPYM4TFdjTegP0p36XUP8dFOBcy4vo1JG
         kzhRQCX4soPZN9lnG2ZMTLCtNnwkbrk5ZAWUKupRlLR0cSIK7VNd+KMRHDBjQeSM39MG
         VyRBHOKbLNaFPSMjOloh5N/tRikxoYf00X/SA3UEBFg6G2AKb71O3uApnb93xMP4zem6
         8nwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744902752; x=1745507552;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+DjIJswXbzQRN1nmeRNSiSYfBHkFEVYJTL/dUGIK80M=;
        b=vocNRt9YX/r+6FBvDo5J6rGU9TUFfCqfW1URKBloTT5qa1WtQLGGwn/7STO9Kp2FHs
         6aUqxOUHqyIPE1TJuZzhjzvxog3+d5Z6YYKauWFwsIWLcAjhB7kkKSB5oV4HeUukE0qm
         PpDTCvx7CdZ3t3EOUMEhkLMT8bjRGRXYRXdpoEY9sWIcIgTpmznAmvI7hOaO9vWZTTMd
         jK2F3qm46xuCZJmg9WCm/fXlbFbboQCfR6O56UYRG3H2JhjpFFeVf7IapcI8DFn3KQsf
         dPZhIsTlG3V8mxm+r3gdXqvPItUJcBNQ16h+VDqEkUQjrQ7E7gskRSGGB3t2YRI0yR1Y
         DpnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHMMFDLLMgYuwVpe9yo6STF9GurEbAIOm6a1YDBfHlcSJMFO4hyAJv1myI2jYqCXbnrMHM3Qp1cMQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx40OBuFhdkGnAM2JacvRJEdUhdKOxa1T+jl6MPPvR1cmakBB+k
	udcqwJ1Ax1CpKXFaYsTijpjiNZPMMJViDJqIpO8XkbQ6xmAehYRPq+gM5KzThw==
X-Gm-Gg: ASbGnctW7um44SWGHEhRJc2EVQMXXbtKrD9QnIdbj2Wsj2yGXDI+GjywzGoamfCIxBW
	pjFQdOo/h4zFrTSVjxhP9FbYnGdqcZpjmKSY3sCA3k6wCIP0VuVCmdY5UPsdepjnydACQeMKWL9
	uMqI15Uto2GTcg9R3DfvXyqf4uh3MkNFHnYPHHa7uUZu88/XQjlvaUtSkbQzvCF5UPWf3qVWC2U
	kT1HuZ+hwukKY7waKEaJqbiCf7ZdecNSedUSPIJv4AyOUF0V/bFrGsWbYeDy5kZJJj7nAQt/hxx
	AMdRxgGTES4zc1aZ1Kuf0RM38/4WGUKQGBzYIoV5ZGuAAC8n7BPJjvGpiWDVtKRb7EVk09cHJnh
	Gq8pcId3ugHJ/D1afJrokK3ntBw==
X-Google-Smtp-Source: AGHT+IE0cqhSB/lgCbATCCRCUQslJOye3kK9gvt/ujpGk0lIp0YXiUphoFySRXFnDnKSwGhjAWAAMg==
X-Received: by 2002:a5d:5889:0:b0:390:fb37:1ca with SMTP id ffacd0b85a97d-39ee5bad718mr5780394f8f.53.1744902751803;
        Thu, 17 Apr 2025 08:12:31 -0700 (PDT)
Message-ID: <26067708-2854-4493-8801-d0fb709242d0@suse.com>
Date: Thu, 17 Apr 2025 17:12:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/15] xen/cpufreq: move "init" flag into common
 structure
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, xen-devel@lists.xenproject.org
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-2-Penny.Zheng@amd.com>
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
In-Reply-To: <20250414074056.3696888-2-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 09:40, Penny Zheng wrote:
> AMD cpufreq cores will be intialized in two modes, legacy P-state mode,
> and CPPC mode. So "init" flag shall be extracted from specific
> "struct xen_processor_perf", and placed in the common
> "struct processor_pminfo".

The code change is certainly acceptable, as being largely mechanical.
However, the above doesn't explain _why_ we need that change. There's
probably a little more connection that needs making between that's
there and what you mean to add.

Jan

