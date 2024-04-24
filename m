Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2E38B018B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 08:08:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711125.1110838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzVnz-0000T6-1J; Wed, 24 Apr 2024 06:08:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711125.1110838; Wed, 24 Apr 2024 06:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzVny-0000R0-Uv; Wed, 24 Apr 2024 06:08:30 +0000
Received: by outflank-mailman (input) for mailman id 711125;
 Wed, 24 Apr 2024 06:08:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzVnx-0000Qu-6s
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 06:08:29 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11262ce2-0201-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 08:08:27 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-343c7fae6e4so5687227f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 23:08:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a12-20020a056000100c00b00349ceadededsm16273590wrx.16.2024.04.23.23.08.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 23:08:27 -0700 (PDT)
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
X-Inumbo-ID: 11262ce2-0201-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713938907; x=1714543707; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T2oToJ2H4PxWr/ua2+1zve3oE0/3orbPzPC4G1VeCEw=;
        b=etEb/cZ5hl/CLiJYD74pf2y04XkNDdE6oWPo9Ns10tUGHymDOH832oLOhNrpYEjmdn
         GdrhHQ22wEI9Jue2xJSTjJIT3j0H1g+UI9Cc2gVxuW6JjoWQqVQwMdjBsXvI+9YIr+v/
         3CgXqTuCNUpesVqiSybghR7zr2IS/cygWYi9FB/coD8DavH3aF4gcb6WYC6XiueCGHRF
         pFITn/AHHijg1GEihMmYYtc6ycJyBr4XFVf1wyQ5yWhuICeosmDEXVV1XsArfIiv1vrO
         RZ7Ac4D7Ko8ljrO6M55XNvetWsEt6ekpJ0PZj0siTY/eB/WgRw35D/yZy17WEog06Ze2
         vsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713938907; x=1714543707;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T2oToJ2H4PxWr/ua2+1zve3oE0/3orbPzPC4G1VeCEw=;
        b=I+D7TH63m6PD/KvfF/hBIP7trl/0FWwCrG2lqe8SUZcdS7yqOGAYVmafwUcS+jaOXp
         kpQtNKw2YEOpGWqiDPO/GFe86yPn89x0n8YM0AQCILneMl1d4qRipxnasq2qz/nVUcv5
         H1K1Jb29ZA9tB1pFGBnp0ipl4BBAT+aunfxoLab5ko3uudvoTGRQVWLNgubhUI5QCADq
         tI4dCRbE8VLojwen7xZmDUrAvkRvpz2jEOHqrZQ8ypYBzZyrBKmnbX0GHYivGR+668x7
         LMc8TLLOCwioFJKfAKuyFrM4iDqkmldWqXAmeBerNytP5vEazQJpbQqZbCmIrmcF2j1D
         42HA==
X-Forwarded-Encrypted: i=1; AJvYcCUTbPi+tPur4yl/rtA0Zh4CoE/vbfFX8/Dvg2VmokhziNvFofvDFIky+funDQY5bT53TaffwNXPlHaizx0Le3ga+3DtPF9oScAIabUrL3o=
X-Gm-Message-State: AOJu0YwdVrh6p9sXnLYobn6nV0gtkuyTD6xGB9d/G+Hu1d6BHw0C/1Qu
	7viOOuIOQoHv+giWK7bbvO8ZzfwIv1+NTq24nLuHO4KsOqLGazoko0oEi9Aijw==
X-Google-Smtp-Source: AGHT+IH5Dn3RNxHfXGUe1DpQxGQ9ZZ9kF7ZXJ3QRoTlPqu4gfKsGr5HxhpnX6qq7WewZ+4iyDQiGUg==
X-Received: by 2002:a05:6000:54d:b0:34a:2bc0:c9c4 with SMTP id b13-20020a056000054d00b0034a2bc0c9c4mr895652wrf.5.1713938907383;
        Tue, 23 Apr 2024 23:08:27 -0700 (PDT)
Message-ID: <c8228db9-6bb6-4115-9cc4-bcd8f49319e5@suse.com>
Date: Wed, 24 Apr 2024 08:08:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] tools/helpers: Add get_overlay
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>, Vikram Garhwal <fnu.vikram@xilinx.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 xen-devel@lists.xenproject.org
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-12-xin.wang2@amd.com>
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
In-Reply-To: <20240424033449.168398-12-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.04.2024 05:34, Henry Wang wrote:
> From: Vikram Garhwal <fnu.vikram@xilinx.com>
> 
> This user level application copies the overlay dtbo shared by dom0 while doing
> overlay node assignment operation. It uses xenstore to communicate with dom0.
> More information on the protocol is writtien in docs/misc/overlay.txt file.
> 
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> ---
>  tools/helpers/Makefile      |   8 +
>  tools/helpers/get_overlay.c | 393 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 401 insertions(+)
>  create mode 100644 tools/helpers/get_overlay.c

As mentioned before on various occasions - new files preferably use dashes as
separators in preference to underscores. You not doing so is particularly
puzzling seeing ...

> --- a/tools/helpers/Makefile
> +++ b/tools/helpers/Makefile
> @@ -12,6 +12,7 @@ TARGETS += init-xenstore-domain
>  endif
>  ifeq ($(CONFIG_ARM),y)
>  TARGETS += init-dom0less
> +TARGETS += get_overlay

... patch context here (demonstrating a whopping 3 dashes used in similar
cases).

Jan

