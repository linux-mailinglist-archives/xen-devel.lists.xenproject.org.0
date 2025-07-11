Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C7AB013C7
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 08:39:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040529.1411934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua7PA-000529-Ue; Fri, 11 Jul 2025 06:38:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040529.1411934; Fri, 11 Jul 2025 06:38:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua7PA-0004zL-RN; Fri, 11 Jul 2025 06:38:44 +0000
Received: by outflank-mailman (input) for mailman id 1040529;
 Fri, 11 Jul 2025 06:38:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yw5d=ZY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ua7P9-0004zF-Hz
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 06:38:43 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa47f9e4-5e21-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 08:38:33 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so1511520f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jul 2025 23:38:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de435b76dsm37952625ad.221.2025.07.10.23.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 23:38:32 -0700 (PDT)
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
X-Inumbo-ID: aa47f9e4-5e21-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752215913; x=1752820713; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=63XRLRG6CX3egHBeRwbGol+4SSiE8Yqa9OuSh4sjMw4=;
        b=IPt/Nhsaa5K91VO/017vDlhnrhtmSpsqfDu4qyAN1yO5wVE0i9V7cgD7pUGgmEQZQN
         ndmmcZp1WWqJbS56+GTlfrgtXv//x1MhJG3m9YLXqukzeWQJfQgp7pctK9mDfCM5Po1U
         4ggODYzXO5PpbooK7lrEtwBILhnzYjx+cjMZ3AyRRtV98JQQ20WYcwWkXtpLMS1bMmM6
         YSf9kV85X+U0bz8wzxgZuSvSFLG0yevEhmi41vW9SdlQpIuGxSej0GsXT7GZOfG0zpIi
         p8ghi1TQf3ueq/t6hx6JjaOs1r1FX1Rlk079Sy9ACZcuNddLzPxj3ayZC6yT9/q+tO8X
         j7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752215913; x=1752820713;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63XRLRG6CX3egHBeRwbGol+4SSiE8Yqa9OuSh4sjMw4=;
        b=cfbmF3qn33PDht9LlbO9y9SdWkjx0HXzw47X+/3zt/dc2RXaZFN8DnFL3z2YnbyCg0
         qjVpdVT0KDotUpz152/nzj7GEb7e+9UGj5myOFrX2K1S61f38mrNkQAo9wdnEr6OC21o
         PeU2PMdclemiEqiurHIlwjgxvroec0o/x0WA0O9XEmE/KpxSdYlsVSD8IAPzlHAzEjCF
         T8gIYTqRL544I0S/39EHiQpH1rcNphw/AVKReCwnWwqrZ/H+rI1QFQATzzJdbW2wNhZX
         nn8Cp1I1hqpKmSLvH8M/RffSP3Ys1i+UBVA7X2B7Go/fMAe+lAAp5EFy2J/pPYj6sQ3x
         yZOg==
X-Forwarded-Encrypted: i=1; AJvYcCUCCBPeSWjNZXra4nsh+LFnVkWamel6mM8HvzUwZPWRhYpVAtonCYimPlPX/j3z5jW3DhfvWEUKwB0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzpJ8ex/sfkFXztDtgl9dDgRPFm3E0kSRLbNmpTehe4JYdCgZEp
	JjG1jYV+4FnucFN828dvjAsyuDjBen5qLOlCkGZ6PfjCo2NYzvj7O5wZm4meQvFW5g==
X-Gm-Gg: ASbGncs6mVXERdGtD0Vgh7HLWDhYTNQ47KjXLJYC5lGedkIZ2JypcdkrWDD75QoaaHw
	194w9PbP0/EhE1ISKP0kUSNhDbJs/GNRYD+iZUMvGvp9JWIUTsZGYqwFDWan0pniRE1Vfa2Hi2I
	+gEHAEN4Omj79/C3Q9kD9eCTACAkodBiz6fIvrnwV6YrrZfuNGXHPz8SZIYDPrpTcreHVvXAyyb
	je3YrMs1PhV2WZpyRk21lYLY8K8yGJDILwXO438t1WmuJdYCft/aucDE7mrFvvyDVzx/lQ163E8
	3rc5A/Bjv5R6hmiooNdd9QT98AVFmAHZmDO1hPghml1GeP2yzWtQFaFezvWkGSaDBOnh3OXbADC
	Ho1NBEpJqWepM1mzto+HQtJQ3tzQXmKEvBeuPQb3xwoDgEnzGhRWn1YxqORtyDK+KmZLOy1cCqH
	0wmhhxNL8=
X-Google-Smtp-Source: AGHT+IHLfgA+cN/uC/9BElKYQVVmQhB1l3FiyLe1pGx1bUNhcHLRJJlIn6QNYaQ/Im3BfVqqYdBclg==
X-Received: by 2002:a05:6000:2004:b0:3b4:9dbd:eee9 with SMTP id ffacd0b85a97d-3b5f18d999emr1956620f8f.36.1752215912675;
        Thu, 10 Jul 2025 23:38:32 -0700 (PDT)
Message-ID: <acb24826-77ae-426b-bcdc-41c822f692e6@suse.com>
Date: Fri, 11 Jul 2025 08:38:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/7] xen/sysctl: wrap around sysctl hypercall
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
References: <20250711043158.2566880-1-Penny.Zheng@amd.com>
 <20250711043158.2566880-8-Penny.Zheng@amd.com>
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
In-Reply-To: <20250711043158.2566880-8-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2025 06:31, Penny Zheng wrote:
> From: Stefano Stabellini <sstabellini@kernel.org>
> 
> Wrap sysctl hypercall def and sysctl.o with CONFIG_SYSCTL, and since
> PV_SHIM_EXCLUSIVE needs sorting in the future, we move them out of
> PV_SHIM_EXCLUSIVE condition at the same time.
> 
> We need to make SYSCTL with prompt back, add help info and set default
> value as y. We shall at least provide "# CONFIG_SYSCTL is not set" in preset
> configs for PV shim on x86. With that, all dependent option get covered and
> could be deleted.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


