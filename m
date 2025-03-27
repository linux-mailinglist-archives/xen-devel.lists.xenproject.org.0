Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82845A72CFD
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 10:57:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928867.1331513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txjz0-0001fH-Mv; Thu, 27 Mar 2025 09:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928867.1331513; Thu, 27 Mar 2025 09:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txjz0-0001dR-JO; Thu, 27 Mar 2025 09:57:06 +0000
Received: by outflank-mailman (input) for mailman id 928867;
 Thu, 27 Mar 2025 09:57:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txjyz-0001dL-Up
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 09:57:05 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d62ebf87-0af1-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 10:57:04 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43948021a45so7659405e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 02:57:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f995a05sm19218273f8f.8.2025.03.27.02.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 02:57:03 -0700 (PDT)
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
X-Inumbo-ID: d62ebf87-0af1-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743069424; x=1743674224; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nrkxHMyn88RQQI8KK12McJpSph0zYJhUV4mBjtCz7Jk=;
        b=EA+N+mVEnZlgPDYPSwsdWK/klNhOiH7AuTB1nyMEn2/ZGsy1LOIo+XzGeq6v6SYjZe
         kV04ZyPYbWOhFSmvMHfZeioaNFigg1GcJIUBWHO9OE1iVq0qDAy5n7nGA/5cgnYjY8jR
         KfrYFLysx6uKXIzSfheJm9BG2/k9Vlc+h4WG10JxAsaO85+ZS9xFfbKAdtLX1QqK1iYK
         VxXPAL6WenI0vcjlysRnkzVIUZ1Ll1tqymlTXxU0zfYnX5/Idqtnb/dXxSrGZUjnd9L5
         /mEjyXz4UQ0X28kGGaSmtn7lmHQgSlsI2IKkJdinrFgOUys5jXhVQPElWtXn13J4VdhQ
         o1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743069424; x=1743674224;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrkxHMyn88RQQI8KK12McJpSph0zYJhUV4mBjtCz7Jk=;
        b=ZuPVBnAsTUOj9iD/wb/B9iJmoF/H1FSsMlQ6uu02JAViBqmizbQjAC6KtyejATfKS3
         KmBYwAS+OmsWZnskDjeaVXINLnr3P1eQH/aJcTmxF2GnDY8NUAeZ8jIi6oDDKgTI4i+Z
         xcPJLvwNeuMF9zLzpAM2orwVKJQcNsCxqI1TqXCbZDFZve5PRUXpg5eR1LvdjdV0T3TB
         FEg+9fEGOFEQwqZfk9u7Zgmf+5aRvpfumW3k6Yig6VKYOXGLX5Ks90FcnMAfsqtHG1zK
         C3Klq/3QqDrC6dzsSOH1TcmNCEWZEIfRKcOPopjqe4Bv/Xb6upD9CgVnDaeOWmZ9fZdA
         eMng==
X-Forwarded-Encrypted: i=1; AJvYcCVjtGc7qOZ6lw0+X7rDFVDrNPwNJwrBcTI0n3vzjecLocjsNcwPzgxCfoJVcPo39UvWQBpZQYhQYs4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxqdcMWoANI35rt+auSrfGiE+yhEQUfA5L9wEOSVvJwZt0FBrFi
	JWK0qCZPpjBgMLk2E9t7D8Q1E1pI2mqGq+Mr7AArvtHqufpn1zwHSPq+QNR4tw==
X-Gm-Gg: ASbGncssM6beqyG/oCuyg9kJdaoXAinIluUlmUQdZahhQ/lVSXlP67/VoFEPZwW7kbU
	o5068nbgTlndC+q5k4LvmUfWwms6Oap1wUGgBfzWBAhVyKyn6zX3OAYfRgES3yFTvbT36pRz7sc
	EyrUHEthxLWWvESm2P5giRvr6HiESBQw9s7VAfBffThh06PFi+IO/SbDo56KfiRbf4b3wqlY0BA
	h2MdYZQNVCtB0rZAcU5Bfj8rQ0i+LZQgbWZ6ji1OXSpq0D7crg/yeB+88n8BkDq/0mtndNU4aX+
	UhdOhUlBa8dTMoQvAiALN8FyycVa8goPF8jXWb8JI7K4sL6xxOvBpQhujqVY8oRm5J37qGjga17
	7Hgxwu2BXOIXvdtNd0azqvgmVzFk6DA==
X-Google-Smtp-Source: AGHT+IHZPJb42bNCTHxgrdbUtrscmjgPZQ5Do18m2XZFeBh07he6hPAvlNvFiuSMJx1EuJOBfWbLCg==
X-Received: by 2002:a05:600c:1da5:b0:43c:ebc4:36a5 with SMTP id 5b1f17b1804b1-43d84f8b7fbmr30191015e9.7.1743069424022;
        Thu, 27 Mar 2025 02:57:04 -0700 (PDT)
Message-ID: <43a24bb6-defb-4155-8d13-aa768fe5181a@suse.com>
Date: Thu, 27 Mar 2025 10:57:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/19] xen: introduce CONFIG_SYSCTL
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Stefano Stabellini <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
 <20250326055053.3313146-3-Penny.Zheng@amd.com>
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
In-Reply-To: <20250326055053.3313146-3-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2025 06:50, Penny Zheng wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> We intend to introduces a new Kconfig CONFIG_SYSCTL, which shall only
> be disabled on some dom0less systems, to reduce Xen footprint.

Nit: "We intend to ..." takes about future work, yet the new control is ...

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -545,4 +545,15 @@ config BUDDY_ALLOCATOR_SIZE
>  	  Amount of memory reserved for the buddy allocator to serve Xen heap,
>  	  working alongside the colored one.
>  
> +menu "Supported hypercall interfaces"
> +	visible if EXPERT
> +
> +config SYSCTL
> +	bool "Enable sysctl hypercall"
> +	default y
> +	help
> +	  This option shall only be disabled on some dom0less systems,
> +	  to reduce Xen footprint.
> +endmenu
> +
>  endmenu

... introduced right here.

Jan

