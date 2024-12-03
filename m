Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 992209E1930
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 11:25:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847848.1262900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIQ5z-0000Qj-SA; Tue, 03 Dec 2024 10:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847848.1262900; Tue, 03 Dec 2024 10:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIQ5z-0000Oe-O8; Tue, 03 Dec 2024 10:25:31 +0000
Received: by outflank-mailman (input) for mailman id 847848;
 Tue, 03 Dec 2024 10:25:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D5Za=S4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tIQ5x-0000OY-Nt
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 10:25:29 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ead32d23-b160-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 11:25:28 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-385f4a4093eso1311336f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 02:25:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385eeb999f4sm6692160f8f.109.2024.12.03.02.25.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 02:25:27 -0800 (PST)
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
X-Inumbo-ID: ead32d23-b160-11ef-a0d3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733221528; x=1733826328; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VPh2ldz1/G2jFFaI8XyezhAGeaXAdERd0SaJwon5RNs=;
        b=VtIdy2sGpaUlRIKsy2iUrSIW46rd4R2d8h7nq5GIqGPsLjn6JRiqindwJFQf00lFdH
         X1Lu6m57juf2Qcz3tas79r/yDuokKT29OxIR6aO9jsTiZGKNTCWUheZYk0SLRH4WSyHH
         dlrAPB4WW087HMfR1NidkycjQUgPMGLfl9z9VN7/ZO7UgU75FSAtS6Qs3fh9y7Wa6RH+
         QYArTdf5LepVbPaWhN53vGct9EijMDD7jBlwHFxPVR9R1/LZTpaIwB5H/FSBkqkgq31J
         d3Mn9Zfn23iOBIrStRbS4L58TyW3z8uP/iPFGyyEdJ9s2A4mJywyjm6zXfCzKe6CJ4jf
         /QcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733221528; x=1733826328;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPh2ldz1/G2jFFaI8XyezhAGeaXAdERd0SaJwon5RNs=;
        b=VZ5NS62Xtqzh1Uvv1/ofjlL0p5Z2e9mI3w17yeLlaSA2GpeLyiXkSqlRcQdmwDwyko
         lWKD6hDZLttadBKqMfgrA9kbWgi2odRu+Oh2yHOtNoxtm+jrrcH0U6X2qwnAYSbsQK3E
         8mUlVhpHZdTz3j7u7TYJ823OTOqVUkLB0J0+jqrb6JZJUYsTJQNN8z1i+fTUgXN5zCiD
         I0lMXCO3+K6BDCLa9YkV0mNStmPJe9/2+nO2bVjmNjZ0S9BdbsoHg0MImom90AmmgvdN
         CFGAvpZN+XfwO0/FYpB22+/0O+XBCCvJO1y6WvpP2q5SfXcFHsm46rH/DnmaJehOsSkS
         IEDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp8b7ZSCUJfS9ww0d7kpgaF5Ro53sg2GrYtT1ZrWn1/YSVX7PV6kg+OjRpKEhmVHzHdB+LCXjU32I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5YqPPGG1+Kfz9JSuXzNLoTlDImI5fGySTtkQa95xhoeKVZ6Wc
	4+dqhZWUow4pLUbg7ODCPwTeiJQTMQL7ibZKuz2Hvb6rbZ7sRIi2IRc+yK5+Fw==
X-Gm-Gg: ASbGncuOObVfraDtHTgeRZGeHhJaX7MaElgxHvU5gwtPloTM0zq5YF4UdDhtM2bmq9x
	yKoL0DslNnWkhKyGhmdNLvjPnsz6tWJj4fPAHs3BqLM/p0yw21vLK/Ro1z/L6sHCXBQ8VtG3Adw
	57I/1JLlruB1wq3N7picQbWem7B0a0/G7OmuIvA1itWVBuIfsSeHK/kRCDKpDPEO1F9vJ53qiDP
	7ML84VILAUKN/vzn8As8Gbg54ftZBpkTJEwiuUGPDSsXKMXKa+bdxGr3JyevFBxx8+nZGpEYsKb
	eLrEjK90qQszx5baQUXtRJsMkMnKlXc1ZAI=
X-Google-Smtp-Source: AGHT+IFHNtlggfT7nu9s/M230KeN+MlGNk+ZRjf9NsqYgO5w8V/NK1qoxAJKJonFr+ZM9yvzilK+Mw==
X-Received: by 2002:a5d:64cb:0:b0:385:e43a:4ded with SMTP id ffacd0b85a97d-385fd42d1b4mr1739176f8f.57.1733221528217;
        Tue, 03 Dec 2024 02:25:28 -0800 (PST)
Message-ID: <617be60d-1807-4bae-98cc-2a438598e07f@suse.com>
Date: Tue, 3 Dec 2024 11:25:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] xen/arm: Check for Static Heap feature when
 freeing resources
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Chen <wei.chen@arm.com>,
 xen-devel@lists.xenproject.org
References: <20241203094811.427076-1-luca.fancellu@arm.com>
 <20241203094811.427076-5-luca.fancellu@arm.com>
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
In-Reply-To: <20241203094811.427076-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.12.2024 10:48, Luca Fancellu wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> If the Xen heap is statically configured in Device Tree, its size is
> definite, so only the defined memory shall be given to the boot
> allocator. Have a check where init_domheap_pages() is called
> which takes into account if static heap feature is used.
> 
> Extract static_heap flag from init data bootinfo, as it will be needed
> after destroying the init data section, rename it to using_static_heap
> and use it to tell whether the Xen static heap feature is enabled.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com> # common



