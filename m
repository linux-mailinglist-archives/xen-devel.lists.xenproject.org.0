Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41791A2742B
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 15:13:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881596.1291746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJfW-0000tR-DF; Tue, 04 Feb 2025 14:12:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881596.1291746; Tue, 04 Feb 2025 14:12:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJfW-0000r7-Ab; Tue, 04 Feb 2025 14:12:50 +0000
Received: by outflank-mailman (input) for mailman id 881596;
 Tue, 04 Feb 2025 14:12:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfJfV-0000pi-15
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 14:12:49 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c4f9bc6-e302-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 15:12:47 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aaec111762bso624078666b.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 06:12:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e4a553c6sm918849366b.165.2025.02.04.06.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 06:12:46 -0800 (PST)
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
X-Inumbo-ID: 1c4f9bc6-e302-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738678367; x=1739283167; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K6fBN7NNgloLQuziIR0be6dGEPLuk5eUmpqSkTjbQ1M=;
        b=ZsaNPN5YFboUhyPvhnY/H/Fa3dANjB8DhclQKypE8tb+Ms9r+7evw8UM4cQ2cEWXe/
         Z84kG3FjKRHgQlpfhhpS8d+DFtJI6Qp/5/H/QauEdVLp6XYaqqoLMKnrjCoywxmSW+lY
         3N4wndUIpPyD+0CG/dQjnWHR6s4EH5Qv7bJ4V+Xq/DZUk4CF2Jt0x1WIXZfoGMyTAmEa
         RdiNNsyxqrOgveIiqrjmENZk5UkvVQJocS17ihgKNVSSgVknucsTV2VJ3sZRx+Al5C30
         j7OVDKRcsWGptjmVhC8/xNr4//2daF/T/Kk5ms1OwS7d1BMUKk1YMlWMnTohB6h8cAEh
         jOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738678367; x=1739283167;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6fBN7NNgloLQuziIR0be6dGEPLuk5eUmpqSkTjbQ1M=;
        b=FPRzRJUf+6OYvsolvNQxzwNs4hLIuAVvYDvJOgVex6ObPNciqh/5qcJ9xQg/ZqWXd5
         t+Se+Uno1kffclmFDWmOH08BIcaiIdYPBFAfcO2CywGAdq3w4rIP3yujy/1yicrYZhT7
         f6bbZSX6vcLLD+yZ4ef7Oapz3VU9ya5QjgFB89XyI8SkGijhy411b+ZjBA9+ILLNG0aN
         TL3Ar9LfJ2FDpzLX/zRsBENMlXerHxzSLDCxtYie0o9yQtJVjnOO0+9R6agQvSnv18qG
         iBPgq0iEBzCL1t0Ti3ct/UEg+2vodgwCyGx3uyog5iLLMShJnm5pRr6AzePKOEo/o4xE
         6hmg==
X-Forwarded-Encrypted: i=1; AJvYcCVD9QLdK0gQ0OCrrtJ1tgRFhLz/uRC/8lZtqQCmd52nMLRvA6F5VS7re/gl67YYlpUVNQxk6OQ2WEA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMlA/yNG7hhmg4b7aOVwsjxnDc0WZv/ARwCc7VVN9G5KguEXyh
	Bm8DiAnMb3J/He2Hxk0equ4XfxhF7FQLDVVFkFEHtAWUooArQzC2vyJSQgKEDQ==
X-Gm-Gg: ASbGnctp2FdwhrEog3KD/6V5aLa6EjukRjC2CuxLoMw5Bmg7nNysrCF/P3UGQ31YpIX
	yW0/JOX3EOQWjceMVSg3GiavTG62GOc+8mVNFWlY7duIh2vqDCuiLrbS9SGvcYHPXgBHgaclHxr
	V6+HIx3DvpMZPChCX0WoVnm0lJAZBN5WlLj1TRSMO9ZSgwXMv3kMQlWrcoJ5VLz0plsHf1PDW1/
	GsNZs8N0o+UTQIZmi/tNhlZ0ajmpiGLc4vGyy792C/vILuO4bZkYUSh8wiqN3NgfceOXMTnWwkk
	cocaVYCT08zN0nXurt52tXf1BYKjcI9WNOoo0+iXA4FqlIDaFXiPMVhni0YY5tNnS3p7e/kViiU
	3
X-Google-Smtp-Source: AGHT+IGqR7jI2XTBarMrOj2EouykJQ7WYfYhlDItfjZRm2sOfQWxFCo1D8YeXkutSWL5uPUyx69jTw==
X-Received: by 2002:a17:907:60d6:b0:ab6:ed8a:601f with SMTP id a640c23a62f3a-ab6ed8a63d7mr2192920866b.12.1738678367213;
        Tue, 04 Feb 2025 06:12:47 -0800 (PST)
Message-ID: <f8ebbe0b-b208-43b3-83a4-c9bedf8769c6@suse.com>
Date: Tue, 4 Feb 2025 15:12:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/8] iommu/arm: Add iommu_dt_xlate()
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <jgrall@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1738665272.git.mykyta_poturai@epam.com>
 <224570237ae19d10c554a14c6d8e34f171a3ce11.1738665272.git.mykyta_poturai@epam.com>
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
In-Reply-To: <224570237ae19d10c554a14c6d8e34f171a3ce11.1738665272.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.02.2025 14:54, Mykyta Poturai wrote:
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -238,6 +238,9 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>   */
>  int iommu_remove_dt_device(struct dt_device_node *np);
>  
> +/* Error code for reporting no IOMMU is present */
> +#define NO_IOMMU    1

Hmm. The identifier is overly generic, and even the comment leaves open
whose error code this is.

Jan


