Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B5687185E
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 09:40:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688637.1073053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhQLT-00015D-77; Tue, 05 Mar 2024 08:40:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688637.1073053; Tue, 05 Mar 2024 08:40:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhQLT-00012f-4U; Tue, 05 Mar 2024 08:40:19 +0000
Received: by outflank-mailman (input) for mailman id 688637;
 Tue, 05 Mar 2024 08:40:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mek3=KL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhQLR-00012Y-HK
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 08:40:17 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd8b3322-dacb-11ee-afda-a90da7624cb6;
 Tue, 05 Mar 2024 09:40:16 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-563d56ee65cso8108742a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 00:40:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v26-20020a50d59a000000b005643b41d128sm5822889edi.5.2024.03.05.00.40.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 00:40:15 -0800 (PST)
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
X-Inumbo-ID: fd8b3322-dacb-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709628016; x=1710232816; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0ejqUOUk/3JLkFeTD5DwuFEiDWuc0toJwJKikq6OjC4=;
        b=LjywWm4V358VgGcRI/NF4wyt0Yoq9kZbUgmeMSOM4ifrRgs/1CaZoprHdULpO5f7c4
         siWYcAvdhcQUbjev06Rcl7clf1eRWKT8Ruh7ZlaRqepu1j4cxzNeEc0VSMaOHX0Hx747
         +/jUTtXWnAFQCWYnVn9VD2/6M4XkKSn4HEAL+lmhxAus/DoVmpp274Mlpu9d3Rthqgiy
         S4UtLkvy4784WYa/fJCC+v+h2ybo36BM/KpQQUi4uv2bvXf1BDLMYR2U9vbgb4TnIWAE
         L6lozOZzzybShAa4HO0f9CdCUAKARaxgCOzV2PUaRJNxeXI6JNWbTuhthuQ55cWXYZbp
         kdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709628016; x=1710232816;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ejqUOUk/3JLkFeTD5DwuFEiDWuc0toJwJKikq6OjC4=;
        b=m3DsQuNtfK/qeHu5411d51Selxx4SCOCycmeBp1fbeRDO/eklF/y7uCFT7nAO6nSKm
         AELvepo7li5E5dYFv9n8vDRPAKroXKNYle+arKyr3tQQPI7FiI1rOe/TMfo6mDCMtkMS
         5zQQZLFuuS9lySPz/29sSxL92LByhwsH5Q88dJjphKMyP2TdSmZ5PlqEcdHtjue5GvnJ
         uXO570rrehrzyrTUtmftL7sHKF5T39XzoknaZtLJGLik9HV9UKx2GlUwdf89JXmY+RFd
         UwuKrwMy57qkfMpPiC343f6rW1y8FjKqCd4pC8eejMYlD6SWSGCNq59e4NWut/325jW9
         w/hw==
X-Forwarded-Encrypted: i=1; AJvYcCUr8Gzw8svopU2YslFCc4/cBbgYQFbmoGmiMe62ZWSm6UvLcfZ+bLZCy/Jr0mJMRi2Fo8sCuG9Su3DxFqJvz9VaNTEpvBxGgCzZkAw8zu4=
X-Gm-Message-State: AOJu0YwpbRBwPc/UCpZMY4fkKndN/wnr0vtvNYFtugi4xvUya0bkPhn6
	GDRAwgCEJdaO+e0Ak3jx1JqkI38xKGRRAjfNBPuPoaZOPaI1ErvPydXxU758kQ==
X-Google-Smtp-Source: AGHT+IFe3hNnqjs4jzNlQeyzczaXw+nkSDqdR7ECeEYFMbEBvkl2E/fSxpdjCd9+Ajmin0+WAJo4Vw==
X-Received: by 2002:a05:6402:3584:b0:566:f66d:f3c6 with SMTP id y4-20020a056402358400b00566f66df3c6mr8592834edc.21.1709628015842;
        Tue, 05 Mar 2024 00:40:15 -0800 (PST)
Message-ID: <9d950095-5400-4e1a-aea6-f450fa700ca3@suse.com>
Date: Tue, 5 Mar 2024 09:40:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 21/23] xen/rirscv: add minimal amount of stubs to build
 full Xen
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <fd3dce5ff76e88e2389df9c0e3a910f735ddfb84.1708962629.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <fd3dce5ff76e88e2389df9c0e3a910f735ddfb84.1708962629.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2024 18:39, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with one remark:

> +/*
> + * The following functions are defined in common/irq.c, which will be built in
> + * the next commit, so these changes will be removed there.
> + */
> +
> +void cf_check irq_actor_none(struct irq_desc *desc)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +unsigned int cf_check irq_startup_none(struct irq_desc *desc)
> +{
> +    BUG_ON("unimplemented");
> +
> +    return 0;
> +}

Neither patch descriptions nor comments should mention "the next commit" or
anything alike. You want to describe things without making assumptions that
two successively submitted patches are also committed in direct succession.

Jan

