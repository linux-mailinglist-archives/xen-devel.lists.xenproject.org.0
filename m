Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D7F992F0B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 16:25:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812052.1224763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxofV-0004u1-0W; Mon, 07 Oct 2024 14:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812052.1224763; Mon, 07 Oct 2024 14:25:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxofU-0004rt-Tw; Mon, 07 Oct 2024 14:25:00 +0000
Received: by outflank-mailman (input) for mailman id 812052;
 Mon, 07 Oct 2024 14:25:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mBo3=RD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sxofU-0004rn-6L
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 14:25:00 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee2c1515-84b7-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 16:24:58 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9941a48ac8so260804566b.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 07:24:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a993fdd2202sm309529566b.55.2024.10.07.07.24.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 07:24:57 -0700 (PDT)
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
X-Inumbo-ID: ee2c1515-84b7-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728311098; x=1728915898; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6UzigQuNzrZ1FoMMvpeImqwe6ltTBix1eG3I2N7VJcg=;
        b=VUBaKoujXweY9t/Xlu8O61Eh/Pq6cKuRhjKZblqmfXrvrAQN+2Man3YxZM5YYfy1bb
         Uy0f3pFTnQ0/TTJC5FDOY6QspWn8ndC4mAf1hFXDDtVYyUsXrcjiFpNol7ax6MbJTlF4
         8of/b9gwf2IItrfWGE9N4vhZ1DLqOodLRlx/pfsde9u2VdfCRfdGr99gALP++cw1nlOF
         qk3d1eXq+uPDNKqfM/0lym0Hv3YdLd8XheJ0lB8W/VFhXKmwNF80VI2S9FhAynSXn7PP
         J6RUcnM73nGKq78tdMmbJ0zA3fuj2L3gofIJDwrhBBp14Hx8u2wDH9FdenLZIbcNGb6t
         QVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728311098; x=1728915898;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UzigQuNzrZ1FoMMvpeImqwe6ltTBix1eG3I2N7VJcg=;
        b=Hy6v+kq8BMZunrlCRQdzhySqdMDm6BWktox/bEd9RbBZhJbA0b/XUVvG0YB+4eG0gM
         XxYF+E6XolfwkCUcNMGbXAGEAbpyguQvIS/rYHtQtkKNunArrdWGiZgVY638hUJkvyfU
         ilFNUswHCLezJvpEgCY6fJuxQmwC5Gts3SvhTZwPl6ChmvLoqWEUDHcjSuRi1AtBtUtJ
         INZhPxwl3spkatCSmsRvflxZYOcjblyGrBbxhmDWStCQaU/xGqdY64p0h1cS0ruWqjxS
         RthiNBOoUsa6kHI/vrF9tuf5fTD2Ym/5YwjMSPCTwYi/V+4BC9JSp1jGkr9+fZZxDDmy
         hysA==
X-Forwarded-Encrypted: i=1; AJvYcCV9c4gM5JwgharYBmcktf6bEYxpgPRxo1vxw6OmbeYGz1YSIdx7zTTSs66C6c4sOCDiAVdzyjxg338=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwhJF76/DEv9sDt7rqoYi2fIsnCFdt4V9aKMXJh9V+E1qrkcFfT
	fErt3w1e4idvllyr2/MKDFo3smQec+Ox4lrEr6WjGsQypKk6JAUXMtzv2fbKmQ==
X-Google-Smtp-Source: AGHT+IERRVvLSXhtAYFKXucaccBsI8R5m13Nc+37x3xEhCpGU0P9EZ7klNCQYmW9S2K/VWscyQZp2Q==
X-Received: by 2002:a17:907:2cc2:b0:a99:6476:ce78 with SMTP id a640c23a62f3a-a99647705c3mr31432366b.17.1728311097692;
        Mon, 07 Oct 2024 07:24:57 -0700 (PDT)
Message-ID: <f334ebae-eeda-4582-92e6-1cfcfa765b67@suse.com>
Date: Mon, 7 Oct 2024 16:24:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/4] x86/emul: add defensive code
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1728308312.git.federico.serafini@bugseng.com>
 <063bd71b535825715bd54ee9238bec2fc87f0bba.1728308312.git.federico.serafini@bugseng.com>
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
In-Reply-To: <063bd71b535825715bd54ee9238bec2fc87f0bba.1728308312.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.10.2024 16:16, Federico Serafini wrote:
> Add defensive code after unreachable program points.
> This also meets the requirements to deviate violations of MISRA C:2012
> Rule 16.3: "An unconditional `break' statement shall terminate every
> switch-clause".
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



