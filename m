Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57796AFAD64
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 09:42:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035265.1407482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYgU9-00036K-3Y; Mon, 07 Jul 2025 07:41:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035265.1407482; Mon, 07 Jul 2025 07:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYgU9-00033l-0X; Mon, 07 Jul 2025 07:41:57 +0000
Received: by outflank-mailman (input) for mailman id 1035265;
 Mon, 07 Jul 2025 07:41:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uYgU7-00033d-7F
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 07:41:55 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6d8af1f-5b05-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 09:41:48 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a51481a598so1475302f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jul 2025 00:41:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce4299d03sm8649514b3a.113.2025.07.07.00.41.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 00:41:47 -0700 (PDT)
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
X-Inumbo-ID: d6d8af1f-5b05-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751874108; x=1752478908; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NpWBS7CrO+84kI5zxAnJjIrlLNJurBMrV3jJ6T4AIVA=;
        b=IeusMYEq+jAD8CHrfLzrD18PtLIEqV5XiwgPiZg8XLtQGQxuzPyTkAT+n74pjZdvW/
         YeZukX2xwF41TB7h5R1AGZi2rIBI8c1F8tDU/jd9qZ3WmfIDAXmjC0Cea9DsuKL1ovWs
         VBiQOCgjiqnCKC+Nz1NriBkoGFUjJyiGhfBlzYzzaFcpVO/G9D3kr3OVecu8HCSYDS3E
         SubNzw12uj2590liDLVwBbPym4J/cUj3uWu3cH2KzwEb6eMExTfq1RZ6YL5S6Xgc56BS
         K3JBPnLGjaY+WU+QJ5afS3l4QxDI3OFy2/jt7frlR4Fk4k6NgESu9WMe7Fixf0tA4uax
         mHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874108; x=1752478908;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NpWBS7CrO+84kI5zxAnJjIrlLNJurBMrV3jJ6T4AIVA=;
        b=Kd5u4QIJS1Ux2Hr1/2uxR6bfaXf2665PdGhEOLfDFr6hapYeaE9k9md6RBYFkt0+Zr
         vGNbo9BdNKfU3a67MmWLdOX565fq3ly+p9Fz1Kt8eQk1urcR3Zg5s61S7JTn0czMsomp
         bvoIYxk8ijarstKc0qjcAzEmZeEJ+B9jfraRMCh/8P7FItiqJtEAjzyuWO1WJ5onnwPS
         kZFYrVAHiDdT1gL3JhoVj7SH1krmtL+6rk8AhuMwgmWTkXFxJ5i5TnyMX/doSnegeG9O
         ws9jUbZhpVR6VChiGpiHkhIBctpWq9nY9AHENFqUgMG4NsW2xtZZcr+ItNp/0SBF8CUg
         zJZg==
X-Forwarded-Encrypted: i=1; AJvYcCUU9Od4C9tIBM0enDsU6hWti3WKiu4pT5pfHpAU/pEUkc9O6MQ8D2e2o8jPdHo8ZbnJACl2aWmz1fo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyj7litEPBw55v+xxs/ANiU7pizF4gmHhOIu7qf5VecsL8y2leo
	uYHc3zrbYbcNr3csMn92gKydqfspSy1z7A5kr/iKd41MY+zFFvb1zINrW866PmjfXA==
X-Gm-Gg: ASbGnctNXYot5dHOF6mdePnf/ZilvEVC4DnUXibXkswikJAmA9fW2b36JSRZm+qlcVH
	nH/BHMgvHUfYbA77F2XbQwsUrdKj62rUnA2CpEODAI/UXfIGwKd5BvAZk/KEwn7ij+7WQqS79o4
	nzH6jHGxcsHDOAHeaNuZOWNfRowwPm7BrllaW8E6b0oXuKqQCKUmBnLvp4elI/IplNnBWoZxEVQ
	5VRw8uAnieB7WIIv4VLQHKrGP+nGEtCxFYbim96iRQC81EXUsq63bW83/xU89KokAu8F6z9g2jC
	ILte271znbVPUoBuvUUdE7JUOOOo1YnSL7//D5cI7orTD1nVLGV9Dq+PUoV/kg8B6Jrh0cAZ9pz
	zDZ/M7JwKe4MCl54Ms5RkiQd9Ys/8PcVrTAkL2/trvCeb++YRJ4EdQWBqQw==
X-Google-Smtp-Source: AGHT+IGAf2NjJ6J5XgZuemT04wGzL3As7N7wQWfMQEnhj7H1amxFTdmVWj6rCbEZr4wFymIS66+2hw==
X-Received: by 2002:a5d:5f92:0:b0:3a4:d0ed:257b with SMTP id ffacd0b85a97d-3b497020597mr7440550f8f.22.1751874108008;
        Mon, 07 Jul 2025 00:41:48 -0700 (PDT)
Message-ID: <f063760f-1045-4594-952e-754148802b82@suse.com>
Date: Mon, 7 Jul 2025 09:41:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] xen/arm: Implement standard PV time interface as
 per ARM DEN 0057A
To: Koichiro Den <den@valinux.co.jp>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250705142703.2769819-1-den@valinux.co.jp>
 <20250705142703.2769819-5-den@valinux.co.jp>
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
In-Reply-To: <20250705142703.2769819-5-den@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.07.2025 16:27, Koichiro Den wrote:
> --- a/xen/include/xen/macros.h
> +++ b/xen/include/xen/macros.h
> @@ -5,6 +5,7 @@
>  #define ROUNDDOWN(x, a) ((x) & ~((a) - 1))
>  
>  #define IS_ALIGNED(val, align) (!((val) & ((align) - 1)))
> +#define IS_POWER_OF_TWO(val)   ((val) && !((val) & ((val) - 1)))
>  
>  #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>  #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))

I understand surrounding code has similar issues, but I wonder if we wouldn't
be better off requiring additions to this file to be clean towards arbitrary
use of the macros. That is in particular to make sure macro arguments are
evaluated exactly once. REST maintainers in particular - thoughts?

Jan

