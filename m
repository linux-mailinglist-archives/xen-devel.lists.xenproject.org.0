Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6085AA32A39
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 16:39:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886535.1296181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiEpJ-0002nL-EM; Wed, 12 Feb 2025 15:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886535.1296181; Wed, 12 Feb 2025 15:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiEpJ-0002ls-B6; Wed, 12 Feb 2025 15:39:01 +0000
Received: by outflank-mailman (input) for mailman id 886535;
 Wed, 12 Feb 2025 15:39:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tiEpI-0002YI-Ey
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 15:39:00 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79e5ddb9-e957-11ef-a075-877d107080fb;
 Wed, 12 Feb 2025 16:38:59 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aaf3c3c104fso1189431966b.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 07:38:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7ca66cc36sm547946966b.155.2025.02.12.07.38.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 07:38:58 -0800 (PST)
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
X-Inumbo-ID: 79e5ddb9-e957-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739374738; x=1739979538; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XL6+tYU62YjJvSZoE5PNyFtfn9iBTvtAs+5Z5WpKIaM=;
        b=SDReSVWZGRoXPmnRhEg6Fn++lobyH/dHHHAYCh0P2ymrquVmEu3QZgCOUR0x3aDvbA
         iy3CQVEYDp9yM3xqaAuH2BtBSQIXuWEkh7VT36UqirqnfH/d+IoNSUEH6ZVftVgCJBLI
         P1Db9scdPPORrCae0suIaXNygp9izuH7y1etUBxxK5iZql0xKkds9Mw24UZCmHRkbgfc
         1e6zoOB0WuhfPTSBplhJrx/RMUiOvuBTIy3llLLycg2GRD6+2G9FvD6bZ+116LHoFBIm
         f2kMNxakdcNVFsBescKB5rv5mytVC6IYP5MyJuwyAEQolY4iBUQGGmIUqtJvo7is28sI
         Uf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739374738; x=1739979538;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XL6+tYU62YjJvSZoE5PNyFtfn9iBTvtAs+5Z5WpKIaM=;
        b=aahBJKnxU6ajEB5VAS9BYsTuN1tO0CTZiL/37Rz1X8FQH9zveQpP7YPoHoa3K2RXmG
         Rz6xpFTkAFi2KJ6x75DzbJm59yVx9plO8JWD0L5pxCFM1rUOgZs3pVzuVOiN/2l1jkQm
         ygwLu3ujUv48cPZLZtIdkcsHSKMnJtIiptiQ6Rh/9OwuB+PVuza1HOX2YySVZgIXGd7x
         n8miBdyNKSK9Htxx6g+sEzXuukX7LbFRZfQZ+sQZYNWtbnOk+uu2WWGdScwYcecUZJvk
         MmGX8tK9YLfmacyINYmStuSS+NH6O9ExO/ynFSwC6x/TIYvFCF8V0w8L5N6sJ66hHKQP
         Q8NA==
X-Forwarded-Encrypted: i=1; AJvYcCV4vbBKUHBtQKoohSCb7PtdkleeNbtqxTs2FXdWqd8NxtyfBMeGh/y33dGEz9PDqIA737n3TqGJfpo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5XzHnl6YrkA25yE11oynFRdY88CI6IOH2f2DDuOdlLswkP/Iq
	sf1U1oZmUGXfzXQuNQy0H/wTXe0H8ehz8kT+MckrkcO690U/YySQNxx6PFgMQA==
X-Gm-Gg: ASbGncu9rX2m3Rm0hzJsFUIEaHQx7Ie6exF7qOO+9Kqu9b71SMsi9jTwbx+W+ApCkQe
	pCvjloZvrwRjGZNBDxmsdVQh/mqegT8gjZgckQ89Qcob3uDoms7uW5P5DMeFFcQm5kwEvgVaC8z
	jdTGTc3gkQmjz4YgyVYNjxk+awSxzo1QIGnoyIDyWp7aAsAnmY8LtLTq2Dd1aMszI1T9gma3T7s
	MSqwT/d6jZ4L4MErxg27/eCiIzUI+VEB64AFQuxqV3J7w6jYTvMSt86V7x4ttVYYmgt+HgmjCZv
	pA36P44X55eANx79eaBb0YeHO04DBVOU7f3ddKGHpIeNcFsHvuqWV54dEjYiJACEXPqMLErpXPM
	Z
X-Google-Smtp-Source: AGHT+IHuw57fQGdGl08ghHLMHSqMauecV23ZQ2UOpXJjagmL2tBTmSxGesqy5isFYM/6Ixr9j0+IEw==
X-Received: by 2002:a17:907:7f27:b0:ab7:da06:a372 with SMTP id a640c23a62f3a-ab7f334aca3mr346872266b.10.1739374738457;
        Wed, 12 Feb 2025 07:38:58 -0800 (PST)
Message-ID: <826429ed-06b3-4efb-9328-4e3de0484963@suse.com>
Date: Wed, 12 Feb 2025 16:38:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/11] xen/cpufreq: only set gov NULL when
 cpufreq_driver.setpolicy is NULL
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: Ray.Huang@amd.com, Jason.Andryuk@amd.com, xen-devel@lists.xenproject.org
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
 <20250206083255.1296363-7-Penny.Zheng@amd.com>
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
In-Reply-To: <20250206083255.1296363-7-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2025 09:32, Penny Zheng wrote:
> From: Penny Zheng <penny.zheng@amd.com>
> 
> amd-cppc on active mode bypasses the scaling governor layer, and
> provides its own P-state selection algorithms in hardware. Consequently,
> when it is used, the driver's -> setpolicy() callback is invoked
> to register per-CPU utilization update callbacks, not the ->target()
> callback.
> 
> So, only when cpufreq_driver.setpolicy is NULL, we need to deliberately
> set old gov as NULL to trigger the according gov starting.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



