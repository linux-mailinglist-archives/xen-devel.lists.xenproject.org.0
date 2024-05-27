Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4378D066B
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 17:42:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730854.1136104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBcTt-0007sn-ND; Mon, 27 May 2024 15:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730854.1136104; Mon, 27 May 2024 15:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBcTt-0007qI-J5; Mon, 27 May 2024 15:41:49 +0000
Received: by outflank-mailman (input) for mailman id 730854;
 Mon, 27 May 2024 15:41:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O60l=M6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sBcTs-0007qC-2O
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 15:41:48 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f61ece2-1c3f-11ef-b4bb-af5377834399;
 Mon, 27 May 2024 17:41:45 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5786988ae9bso2821516a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 08:41:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cda1a97sm504051866b.188.2024.05.27.08.41.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 08:41:43 -0700 (PDT)
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
X-Inumbo-ID: 9f61ece2-1c3f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716824505; x=1717429305; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7DJhBKEUSk4v7qdZPx9Ged9Zc+8cyZuGmrSSTuulOfQ=;
        b=AnhDEnZpC+vyZ6iOcHzUrmKyAhdReZMMnISF1t7Pp1GwpDxt+W5nh9w5XWje1DtXmg
         xovk6I8Uf5nUpmWGNZqPUlK++vpv05DzR62+AxLqzh0yX9wDK0lnzxSKKRbSviKyTyHJ
         K6I+MCyBdn7iMQ8QgmpmqdiYZc6H7M/Jslrj0E7kbxVjOn05+kAXR4hWnLWoYFjyH3z1
         m4KEMQ9bzJMTCcAgR6fB+3WFPEeSIE5+OCQseKvpiQkCN5ayp9mEVKh+Rsk4engXPf94
         AW2BgKWfDBtQge2N1G3w0yAAqLA521cZJ9RhYCNUsoTbvFVzaw1j5vXVLBQNDfjaoESq
         ukfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716824505; x=1717429305;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7DJhBKEUSk4v7qdZPx9Ged9Zc+8cyZuGmrSSTuulOfQ=;
        b=cTLYQgW8haImOThxzQep8jurmr/arn3OOQC1sibWaIbIQEXuOMmajrgs9P8acIZmqW
         PjM719lqf5u8VPz7jRoeLLdCzJ/XNdIFfYih7e6pisg+curM4zjGxGU47jOmzv3YdThZ
         RRLdnPCOp7CsIIZEsGqJCs7XKDR6bW3R0F7mQ8Gn/PGSqjlcgfMvUqSNFf29oww2H5m2
         NMCrxeISVw/JGo5adIzR+IbXat3fydBKBBWoS8DYdCuITgWzIYiVe67BtQOt4K/+j+T3
         CdoXSjE62DgLnki4wAB3QU0+dvXDIbO02ZEJP16a/HDrPe8D66Spv8ntPDpx9pAFnY1k
         VsWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpothdlCri2LQ+i2PBLRpbDlcxiV6twww9JxVcl/nUXwcWMQPLK2wkzIZS+P1ejfm2tkT+VShT7vA34WELGhuiDMwn4BMTx+kH/KmaaIk=
X-Gm-Message-State: AOJu0YyKko1Py5o9R92HC3234Dm9V5HY710RQlcUFCBrbp3H9O2mYAvB
	SviEwEGZsoWZ5zg/UgBcWkSHRY1wMEuySNIEF9+lueHf1wSNIvo/2UEsrz60GA==
X-Google-Smtp-Source: AGHT+IExvN7gqoCunX6bfygeh3BZNTKhOuZOHrs5O/re1wjYAwv6DFKqXekcGMauBQUw7BNG18wZhg==
X-Received: by 2002:a17:907:350f:b0:a5d:107b:60be with SMTP id a640c23a62f3a-a62650116c9mr532775866b.69.1716824504051;
        Mon, 27 May 2024 08:41:44 -0700 (PDT)
Message-ID: <2724a1fe-d0d4-4d27-a39e-4286f95c6236@suse.com>
Date: Mon, 27 May 2024 17:41:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 1/3] x86/intel: move vmce_has_lmce() routine to
 header
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1716366581.git.Sergiy_Kibrik@epam.com>
 <db547833fa3887e2e36c8418d3f8a142bebb847d.1716366581.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <db547833fa3887e2e36c8418d3f8a142bebb847d.1716366581.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.05.2024 10:40, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -24,6 +24,8 @@
>  
>  #include <public/hvm/params.h>
>  
> +#include "cpu/mcheck/mce.h"

Considering that I asked about this before, I'm a little irritated
that this is is entirely unadorned. Such an unusual #include wants
explaining some, you'll find similar comments elsewhere:

#include "cpu/mcheck/mce.h" /* for vmce_has_lmce() */

With that, which could also be adjusted while committing,
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

