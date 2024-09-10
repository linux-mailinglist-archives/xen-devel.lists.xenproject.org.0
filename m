Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F4A973A44
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 16:45:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795729.1205203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so26s-0006JP-Io; Tue, 10 Sep 2024 14:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795729.1205203; Tue, 10 Sep 2024 14:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so26s-0006GH-G4; Tue, 10 Sep 2024 14:44:50 +0000
Received: by outflank-mailman (input) for mailman id 795729;
 Tue, 10 Sep 2024 14:44:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1so26s-0006GB-0Z
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 14:44:50 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3afa74e6-6f83-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 16:44:49 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5365b6bd901so4758910e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 07:44:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25cea3eesm492957466b.145.2024.09.10.07.44.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 07:44:48 -0700 (PDT)
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
X-Inumbo-ID: 3afa74e6-6f83-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725979489; x=1726584289; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CnSkeptj05D9Sz4fhtAJdyYofegUAFpyI1beArrS6tM=;
        b=X3KCWT3zdi4hUGmtgBXS4YnBmCjlfZ9zzGGk9GaB8xoGXl3q2RuxOn4esV1G6UfGkr
         C6kf6ABxBIHtXHpAHDwVyv/WfkNKB6vrVlN0R0ddGbUptF7cA05AOpf2XNvlW/Dq6hly
         LWvTc1tYVvtlWWk9/aHdGfbYBH3isJp0It+Kl5LUS1Vtt8Uas7epVVQyZiyPQavBpR4p
         kNHrthersNp50M856FNg1MKtqvqkqHDAJWKpYvLDl3HODSJ/6k2+1tzQH4jjaPz/izns
         L517RsoQfwR7jxloqS1RKe8BpHS6bjbwlWCIXi/miakysAiZf/4MuHAFHiN9h/m1DlbW
         s3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725979489; x=1726584289;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnSkeptj05D9Sz4fhtAJdyYofegUAFpyI1beArrS6tM=;
        b=aEq2rhpFpI5aHotlXfRtHQ8b9scCb4lKWPElSu2IUlBGkuHOZclk9fJ4xmDiMIibHH
         jrhCPWkZgpv4d+viIok9gXh/eAgI3Wb8/8Cwpx6Wzb4CQjHwEW1FyKdEvW5t3OzTKJlF
         QBMi1Ps5W+8dJ6jPmYYmGGwlkjkijWwyfRxvuC2AApOU7wndiLpkPlFoiCq3sAlxWbwE
         oqTknDBJNBEr7jZnGs3knRS4Y9oiNUeQeNeGRQ6G2YWldA1ZQXNcMOFV+64fciPKN/lQ
         uo0wpDxHhUCdpX7NWw7ewzggNEfnjdPxx3gtZ1ZCMG8mS5zIpTAEo8qDzQzAO2nUWKap
         OcyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy/mjjmg6GGNnTOQRdH7U6OZXFw7PV73WQ3w5vZsnPHjp0P8Ygc3TfWD3oDDO88eXBisWPvIfRfLA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywym9FSbK+ezomCPGA2z4b575Efi17sPFG+TtdroS4C0yzXHckX
	W7ZXXELwrGG+xJ9cgEgWuV7CpTWmWGPFPm6yeiaJWyePN4T3mY9tQ3KUaN3kHA==
X-Google-Smtp-Source: AGHT+IFIpvqucvuabYwxaX7J+h3fY7Hz0hiUCYtrFPTMyMKCwvGjhh9FjysTjDaVv89MWKJ2Iyedog==
X-Received: by 2002:a05:6512:3d02:b0:52c:e4bf:d55d with SMTP id 2adb3069b0e04-536587aa701mr8492164e87.8.1725979488425;
        Tue, 10 Sep 2024 07:44:48 -0700 (PDT)
Message-ID: <b0f76ea2-3700-44e8-b990-bd0d7acbcb0b@suse.com>
Date: Tue, 10 Sep 2024 16:44:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 02/12] x86/time: address violations of MISRA C Rule
 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1725958416.git.federico.serafini@bugseng.com>
 <cf6d83d970a99f21b90073e3583c26418c8b3b9f.1725958416.git.federico.serafini@bugseng.com>
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
In-Reply-To: <cf6d83d970a99f21b90073e3583c26418c8b3b9f.1725958416.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2024 12:08, Federico Serafini wrote:
> Address violations of MISRA C:2012 Rule 16.3:
> "An unconditional `break' statement shall terminate every
> switch-clause".
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



