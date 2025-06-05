Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8312AACED5B
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 12:14:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006509.1385689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN7bc-00085e-Dj; Thu, 05 Jun 2025 10:13:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006509.1385689; Thu, 05 Jun 2025 10:13:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN7bc-00083e-BB; Thu, 05 Jun 2025 10:13:52 +0000
Received: by outflank-mailman (input) for mailman id 1006509;
 Thu, 05 Jun 2025 10:13:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uN7bb-00083W-1k
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 10:13:51 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5daf720-41f5-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 12:13:49 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a4f71831abso749628f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 03:13:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506cd8cf0sm116968805ad.155.2025.06.05.03.13.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 03:13:48 -0700 (PDT)
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
X-Inumbo-ID: c5daf720-41f5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749118428; x=1749723228; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r6FItqV2VLLQg98mbOvhkJS/qFja9peEVQmD1TDjje0=;
        b=MVqonyKpp5mFOVupRYfI+lqttmig/yBAv5P4PcTS4bwsk3ztM/sm6e2OczAqh5sYGe
         ZjNy8xjt76CHXx8c8kOfBrgSCKu6/gjwyImMqqnnm3kzrqaaDayOMNlqaIG9QTLMrxmt
         oUXv9ZKLdS6gImbbyMPswWEujM2XoTX1E6o4P7xy7mEq00p3Pw6DOsBoliOFMGJWtWtM
         4R67Q2Vi+TXgGcT3J5aaPMf+WrmsV84JwMB+Xeswj4gGRvYZQZAgdP4RIUDjPx8RXkr/
         8cbUY5d46k8lFfLCSaobTn1BLWMOmsvweW+86T4vA6N/sixNVNUYDRY+bTFAZafiYdNN
         ifRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749118428; x=1749723228;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r6FItqV2VLLQg98mbOvhkJS/qFja9peEVQmD1TDjje0=;
        b=YoG1QguVbzPpVY7l0cazW94lbsc3TT52PmUBDjROOkM0PAcLB3TGfMyqPM7UcBUAQ6
         ELfDEcTkBCqec6EDEojK6UY8vauXxP5H/KIpAy7kWqGjt1qpUW37sQ7w5Vm71hhFK10h
         vPjVIZ6ZwYadRr+kLUPpP3E9QuKkS+l05gT9iV6POdwvv2Wo5UeQ4cLkC1x7S9kG/RJ+
         L7zJqjKf1WqDsrYgCFbnbqid5VUzl70/wGioPe8Jy7wNnJyQBLcC1yMQgbJYc8bMeG48
         R9T0qHjh0PgwtysTTAf0aLooaMfZJnbkdeChEOLU6t9Th3mJYMWYzThi/hCWkp79U+U3
         YYFQ==
X-Gm-Message-State: AOJu0YwRisOkFNtFFpsq57tQUE4UckhZXx+uTXeg+zQW7OeSSYpolJkF
	U1fA2hheXkKy0MxTW/kucW+q2WvFHQV6iuccPO9hyFPpR6o/QCmvKv7vtoyNh4kO2Z/WnIJE9zh
	TivM=
X-Gm-Gg: ASbGncsy9Ybbky14Q1Yos94gs03sLHIa6RJ19zmVx+b9oD2NaY3AobkBbdp2Y5GzcKS
	yCT7rC/jc+zHZjCyM03Kb9BuMM5oXCzbDDSo9tNYXTBURgHTWxBIMTGOG8VTF33b+kuA3eSd7Wn
	Vtt4JE34NOMzbfUZxQ3AJzRNLVfTXzpLbock1T3u/inFmz0YJ5n19a361gcJ30GYz2gYfiNK9PR
	L2/Tsm2bH9odFBjezbXcTyfuSiNFsu6r0uLOZmZH431DNs0fn2UwtBosOAymIEsamvyeeweYb6s
	BimNGuufSRwmCQ7TwiP+hqgyi/JFrw0Ge5gD4x4Ad3wDsdQ1K15j9iu7gLH9zRUFMIQ6GKMo/RN
	UaVC0cSkLunXJeAo2u6fh0WKJDcqWyl2N8U7B
X-Google-Smtp-Source: AGHT+IF+ulNfOCkuPckiIpgQpyc1AXn0B1teqBc7PGk+77nw0y6bAY9ViXdk58mfa0sGVRBwBa+n6g==
X-Received: by 2002:a05:6000:381:b0:3a4:f912:862b with SMTP id ffacd0b85a97d-3a51d95e1a1mr5807981f8f.33.1749118428561;
        Thu, 05 Jun 2025 03:13:48 -0700 (PDT)
Message-ID: <88478f8a-dae0-4371-929a-67e7db95e99b@suse.com>
Date: Thu, 5 Jun 2025 12:13:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] cpufreq: Avoid potential buffer overrun and leak
To: Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20250527152635.2451449-1-ross.lagerwall@citrix.com>
 <20250527152635.2451449-4-ross.lagerwall@citrix.com>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <20250527152635.2451449-4-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2025 17:26, Ross Lagerwall wrote:
> If set_px_pminfo is called a second time with a larger state_count than
> the first call, calls to PMSTAT_get_pxstat will read beyond the end of
> the pt and trans_pt buffers allocated in cpufreq_statistic_init() since
> they would have been allocated with the original state_count.
> 
> Secondly, the states array leaks on each subsequent call of
> set_px_pminfo.
> 
> Fix both these issues by ignoring subsequent calls to set_px_pminfo if
> it completed successfully previously. Return success rather than an
> error to avoid errors in the dom0 kernel log when reloading the
> xen_acpi_processor module.
> 
> At the same time, fix a leak of the states array on error.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


