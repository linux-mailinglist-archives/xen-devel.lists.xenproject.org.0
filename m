Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2B4945DCD
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 14:31:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771098.1181679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZrQS-0000xe-4U; Fri, 02 Aug 2024 12:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771098.1181679; Fri, 02 Aug 2024 12:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZrQS-0000vV-0r; Fri, 02 Aug 2024 12:30:28 +0000
Received: by outflank-mailman (input) for mailman id 771098;
 Fri, 02 Aug 2024 12:30:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZrQQ-0000vO-DW
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 12:30:26 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd89849b-50ca-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 14:30:24 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52f04c29588so13595587e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 05:30:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b839b2b556sm1059248a12.25.2024.08.02.05.30.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Aug 2024 05:30:22 -0700 (PDT)
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
X-Inumbo-ID: fd89849b-50ca-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722601823; x=1723206623; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6WpW9GrMS3uuRlZd8yvdWhxdviVpX6JNG09/uACtHQc=;
        b=N75tfemnPmMVSiqYzRmgOUILwfNebU5OZM2ljvsIrqUSU7hukCXArDdTu9jcTCrDin
         5VMdEv6x+i8TD6wNenHKCzMsz2Kf3d7Ui2pzvOPo10ELDTRJuEVU2jIHemb3SxKRDI2j
         0DZxOn5IK4R4JhdQ9mQjG3o3uVriEwSRRcVKP90JPBulNl5ayjD+IIDC8/S9nlaO1cym
         wwnOHyy0T9Jiw3P0+W4CfBSw/3UYUuRZ/Ix7umFuVlOdo6Dh2slQx3dOYbqlK8RShaso
         ATFWfOa7I7o8P9otoROaT7cPVqTPchp+biz7cwVR+rt3vPR9j8gK2IOIKP/+2iR0dINl
         aCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722601823; x=1723206623;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WpW9GrMS3uuRlZd8yvdWhxdviVpX6JNG09/uACtHQc=;
        b=KMpDu+mlZu4WTdzD69gkldaQANUWF+nekBZB8sMwD/q5VSakTN9LR8bSpHdxt7e6u6
         IaAkZ8Y3x9Al3mTDYu2A8lg3cyQz2liOUR9wHB5pI5YRkC8sHSJX+YnDu60BZve/b7UU
         7OcGyFIGusQX5yf5+mrX4roJAWytWdioQcFw0K0WntlxF+I+OWWyz549Kql/RON56vdX
         gYbkVeWq20048qsb40XEVzBE1ZEVNTKaM1HafRj0hFgA4ouqtuzHXSL6dd51oc3gFxc+
         G6pSeSwk5aD6UV/4rZL3/g312YngNIel5LI2IU3pwOp2jDkeEgXYsHZqkU2DG9ofmm57
         X5XQ==
X-Gm-Message-State: AOJu0YydLjKVHSR1UNTp5gFC7OEPPyDLUe7pzSMkZhTak5Q2A+efBFI6
	v3zTi5pT7Q26KanfgYQsSDMCUV33XGCa5SSzKAWn/milJdNP7XPz074dKs6reQ==
X-Google-Smtp-Source: AGHT+IEohhA032ltsmxmgWdFbGc5cYUuuanRw9uJn+YnJk6qZIZM/C6OoTuyXynoE467cwFlGvJifg==
X-Received: by 2002:a05:6512:1110:b0:52e:f99e:5dd1 with SMTP id 2adb3069b0e04-530bb4d7879mr2003779e87.47.1722601823269;
        Fri, 02 Aug 2024 05:30:23 -0700 (PDT)
Message-ID: <4f9eb1b0-16bd-4456-89f5-c53513a4efe5@suse.com>
Date: Fri, 2 Aug 2024 14:30:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] xen: arm: make VMAP only support in MMU system
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, Penny Zheng <penny.zheng@arm.com>,
 Wei Chen <wei.chen@arm.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 julien@xen.org
References: <20240802121443.1531693-1-ayan.kumar.halder@amd.com>
 <20240802121443.1531693-3-ayan.kumar.halder@amd.com>
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
In-Reply-To: <20240802121443.1531693-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.08.2024 14:14, Ayan Kumar Halder wrote:> --- a/xen/include/xen/vmap.h
> +++ b/xen/include/xen/vmap.h
> @@ -138,10 +138,16 @@ static inline void iounmap(void __iomem *va)
>  /* Pointer to 1 octet past the end of the VMAP_DEFAULT virtual area */
>  void *arch_vmap_virt_end(void);
>  
> +#ifdef CONFIG_MMU
>  /* Initialises the VMAP_DEFAULT virtual range */
>  static inline void vm_init(void)
>  {
>      vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, arch_vmap_virt_end());
>  }
> +#else
> +static inline void vm_init(void)
> +{
> +}
> +#endif

Imo in such a case the #ifdef wants to be put inside the existing function,
avoiding the need for a 2nd instance.

Jan

