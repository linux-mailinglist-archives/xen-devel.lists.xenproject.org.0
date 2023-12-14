Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BEC813651
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 17:33:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654692.1021896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDodr-0000yX-PF; Thu, 14 Dec 2023 16:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654692.1021896; Thu, 14 Dec 2023 16:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDodr-0000w2-L1; Thu, 14 Dec 2023 16:32:55 +0000
Received: by outflank-mailman (input) for mailman id 654692;
 Thu, 14 Dec 2023 16:32:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDodq-0000vw-On
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 16:32:54 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e01454a-9a9e-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 17:32:53 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a1f5cb80a91so970476966b.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 08:32:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ga16-20020a1709070c1000b00a1c7f8fe581sm9614463ejc.221.2023.12.14.08.32.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 08:32:53 -0800 (PST)
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
X-Inumbo-ID: 6e01454a-9a9e-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702571573; x=1703176373; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=naPya93xPXkZqa34DPYRN5ELQVzAHemEOqpxaSOlbOU=;
        b=FbcYA4gL1SKWsCvzs1CG6L8RZsvNgzluCHgn7rmZMtpFx61M6ZVX4XEdnQZeMNf38D
         C1GetJaKTaMbeWKwm6EEfpsPTOXq1Pmy+egr7ZVHkx9LN8klHYO80kTqduEFcoKHeGh+
         WHKCEvvOAUS+fpFNc8DskGVqL1Tk9eOzumE/DhQAnYV24wIUBouri6QQ/672yyXoBIpI
         BA4nhFJHgf/+wK9cr4MDwNoqc4VYuTz+/+eOPTn7NgBAQe5w/C/HhZCy1oRiVOw/ai+G
         AwwQUlXtv+EWn6CmZiIfgmw5t93ML2bKDFoNUnFnsbi7jddrTlX9NXZLbdQhBqXj6OET
         j2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702571573; x=1703176373;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=naPya93xPXkZqa34DPYRN5ELQVzAHemEOqpxaSOlbOU=;
        b=TjaL6CaXRvp4WHO48YNQhVxxK+3/RGYP/y5Cp2NA9gY1ICg3XyD4Ckokzri81h9dJ3
         2J0t4iYDIiTasf76mQry9Ze9qpvm+b0jesY5RxUh79mofjWamDDaW35zerQoGN/vXNII
         2119ccKMh/JVbXyrOhSFPghdpr9d8heRgd3/GcDycj1vPK5Abd6mAK6JmVf/L9U2yE2p
         WQV7HH19w9Ce08LK+/uVK+NqiaLZNlawNPv0BDuMkEAKiFdxiC13bzy7MHnuQu1+eKU6
         ubjwkyGReav9KNgOPDgteOedG+zbhTfF4Wjy8iOo/qg71Xy3xTVLALiLPQnIG/QxbtLp
         WmLA==
X-Gm-Message-State: AOJu0YwZFhT11ASCM95ypv+C+RL/6W3zZ8TCfSY0J0WG+vPc1zbODCNI
	sCy51/A06qarnuLCZesxSAVD
X-Google-Smtp-Source: AGHT+IHqGFNJWQL2pEkgWze448sNP2IPSFVrEEwKiT0gA2MCkN/9EY4S3C3JORafKujLqx6q6PnTTQ==
X-Received: by 2002:a17:906:59:b0:a19:a19b:4264 with SMTP id 25-20020a170906005900b00a19a19b4264mr3961671ejg.207.1702571573313;
        Thu, 14 Dec 2023 08:32:53 -0800 (PST)
Message-ID: <61867b53-648f-4bb0-b430-aa5d343cb29a@suse.com>
Date: Thu, 14 Dec 2023 17:32:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] xen/efi: address violations of MISRA C:2012 Rule 11.8
To: Simone Ballarin <simone.ballarin@bugseng.com>,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1702555386.git.maria.celeste.cesario@bugseng.com>
 <4540a3850dae951dd6bc4f9b001c9816bde2e49e.1702555387.git.maria.celeste.cesario@bugseng.com>
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
In-Reply-To: <4540a3850dae951dd6bc4f9b001c9816bde2e49e.1702555387.git.maria.celeste.cesario@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.12.2023 13:07, Simone Ballarin wrote:
> --- a/xen/common/version.c
> +++ b/xen/common/version.c
> @@ -178,7 +178,7 @@ void __init xen_build_init(void)
>      if ( &n[1] >= __note_gnu_build_id_end )
>          return;
>  
> -    sz = (void *)__note_gnu_build_id_end - (void *)n;
> +    sz = (const void *)__note_gnu_build_id_end - (const void *)n;
>  
>      rc = xen_build_id_check(n, sz, &build_id_p, &build_id_len);
>  

How does this change fit the subject? I'm also inclined to ask that these
casts be changed to unsigned long or uintptr_t.

For the actual EFI change:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

