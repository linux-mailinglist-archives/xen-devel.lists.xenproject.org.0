Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FE2879866
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 16:56:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691935.1078563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk4U8-0005ue-Q9; Tue, 12 Mar 2024 15:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691935.1078563; Tue, 12 Mar 2024 15:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk4U8-0005sN-NI; Tue, 12 Mar 2024 15:56:12 +0000
Received: by outflank-mailman (input) for mailman id 691935;
 Tue, 12 Mar 2024 15:56:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=88Ay=KS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rk4U7-0005sE-8V
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 15:56:11 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a8d6a0d-e089-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 16:56:08 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a28a6cef709so640735966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 08:56:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ld1-20020a170906f94100b00a461c74bbbfsm2699283ejb.91.2024.03.12.08.56.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 08:56:08 -0700 (PDT)
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
X-Inumbo-ID: 0a8d6a0d-e089-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710258968; x=1710863768; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0OsmxsGsmYAus/RH/y9PaIuXpWenHxAlXzle9HumqCw=;
        b=LbV502eKwnPTa13mPebpqoIVoJk+CxsV30NLxdyctnCN15OnAHHeoPB968mfiLjCy5
         XYqKy/dUgLEfh/bfcO7frWm/9s9AsEJnpYkSBfmcHeXmqAnrjSlQ8feFFZ1/SXzZqrnJ
         jpNQkFlAKr5zVA45PvFYgrHM5tvDcY62ZUYoGCMiHAiidoOO+PMwwKL8iHZ9n52Ib7dz
         Eyj+Cy0G8Pa7aO3VX9DnEMliHsvXaItbuLGGOneWrbHNTUAnNL9HdgKtaI0gMTV3HsB6
         qyFy4zoj1QdCMp8VQILYfH8QVvavtGOhSF/2kaoDOJE5M2lmxak8Yno3tQ9wL24IEsGS
         Rg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710258968; x=1710863768;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0OsmxsGsmYAus/RH/y9PaIuXpWenHxAlXzle9HumqCw=;
        b=ndklUMxTIiE7OWIiCAcAKuep3hAEbwORbNNPwLC3x3SvoPXfTkQHMEPu13l8/RvIsz
         0IDj6JuY5jNCoooTGzQLx1SMoHgCr+HPTn3kceLBoBbyDNtoWDWcUvVNM9w2yc9/7VBD
         0e1RlYjK2DV4+/3IAmRpXfJBKxtomPuBReijTaMIVmRcLv2ywE8R0JBzK2ztdnB4bD2Z
         xGrSKyD/zrk5SC6JFXEJW5wNEy78C8w5aZPtUAo/0NBZbX+R9sKLy/+SWNusDMcd+LQ0
         hgGnfCDFxHE5TuMTAuCWk816Svoa3yNeiW9rwUOEW0C10slYboVwmYLNVbn9tix5wCwu
         GrtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXr62yFFEnrsm+IhzbeWNBUiQ+kX+65dYVwe3JtP5D7fNvbXLSkU/DwI2aa8TJPxsDZ3hsoSX6OaZlSzJ2sasZAJ7K6JL40roPQXsKaGxQ=
X-Gm-Message-State: AOJu0YzOkFLyd4aFfYjQuyX1FpJ+JDCdZn+Ng+x3nrMY/J6VH3Oz1QHC
	i34X0ZPc1LiJFN3GumgN9IWNVyVKdqtmzLL7wZ5H608r80edAI/zxuDt2bEQ9A==
X-Google-Smtp-Source: AGHT+IFypSkTQJZ6eqLQ+AQNbzT8R8CJkS7az4UBwYNcTt0zg0N4WC+AP9zTJjHNath/SJy1FKjHJg==
X-Received: by 2002:a17:906:c793:b0:a46:3f18:957 with SMTP id cw19-20020a170906c79300b00a463f180957mr1658308ejb.36.1710258968475;
        Tue, 12 Mar 2024 08:56:08 -0700 (PDT)
Message-ID: <d264d7e6-2aec-4ffb-94ad-dcaa3ae1688f@suse.com>
Date: Tue, 12 Mar 2024 16:56:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 16/16] xen/lz4: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
 <1d02e429534b9b1c53fd3c5b82588e3803434c92.1710145041.git.simone.ballarin@bugseng.com>
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
In-Reply-To: <1d02e429534b9b1c53fd3c5b82588e3803434c92.1710145041.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2024 09:59, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> Add inclusion guard to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order to
> prevent the contents of a header file being included more than once").
> Mechanical change.
> ---
> Commit introduced in v3
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>

Once again somewhat reluctantly
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

