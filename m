Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AEBA8414E
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 12:58:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945276.1343494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2pc6-00062D-Bf; Thu, 10 Apr 2025 10:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945276.1343494; Thu, 10 Apr 2025 10:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2pc6-00060j-8j; Thu, 10 Apr 2025 10:58:30 +0000
Received: by outflank-mailman (input) for mailman id 945276;
 Thu, 10 Apr 2025 10:58:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2pc4-0005mJ-Kv
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 10:58:28 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id baebf1fb-15fa-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 12:58:27 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-39c266c1389so360477f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 03:58:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f23572b5bsm47306825e9.28.2025.04.10.03.58.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 03:58:26 -0700 (PDT)
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
X-Inumbo-ID: baebf1fb-15fa-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744282706; x=1744887506; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kizBJwGRSWxGr7CSkJR0uyoJZddqHlNIs7jEQZPc2dw=;
        b=b174XhHOspq4ZQGmniYeUaWbiwFh03mrIZOW+WmDfy3KGQ96TRfl4Q11ieFGe29/kn
         99DEa8e3L36ZuU0b4FhuOmkvQZ74NIDxpWeBIMEMDecebPx7yvzOCOnSQcz3zPIkNpkQ
         0DwAwNBNYYZkbCie0CoPEMzKTbTAVFavpXpcydGwRMCyqEzvSRxZ0mXR0twYq2jR6XYw
         ncbCWmrD/IDfk/sHpEsgQlKrEHkUWILlVhA8Wd6O/dhxK5th3DWHgsyllP3nF/PgAfdT
         YhVP0IqxBQwNb1w4kL/eXS/Kv1wufoVHY3IqUlOCt2fzqdEzXde8aLP7A6JRro3whtRW
         k9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744282706; x=1744887506;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kizBJwGRSWxGr7CSkJR0uyoJZddqHlNIs7jEQZPc2dw=;
        b=YP6lPeQ928str/n2Vu4M6yzng2MpIRZZj1SPP3SHZpxKrr5OUwiG8AU8hAoqXqjXDO
         PpOl9lKcirtSQMArMm7aEesW/VN7roSqhpVuQWHDXaXbddQp9XGjIwGz/qt00Ag4QJi7
         c5CFiskRrSoWTB+xNFpDmpG9n7aQaIpvrJIL5x3nsDe1iz9yWvLRvAb12x8mOCgR/Ezr
         9TCbAIeqJEs0LBqjBCKFEEJ555YQWexfgok7t+CS+PZ3Gb5CItz4b2C1PVHjuivLtUts
         AT5VJVWMrp7tMruc3iRbTsT/c5QGfd2JvQLTR9PyEgSF+JWgCnMmDGCnrOK8G4CTLjYy
         E/Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUUmWuTA4HaSnsltkzSs8HkiRgPUoPCy5m9LP4IuYZX5tStRaOgV2Sw5n5xZTKURTI0ASNHw6xrGY0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyz6feRJmpyp0ckcjnw9HlOW5Sp8pzODOqN7eCCy5y4miDlRwIG
	MtgLwTYMIXrkc08TsazdfXpmNMGtnqXVDQpNzMLfjPizhpKiy2sdd+jKFu82Xg==
X-Gm-Gg: ASbGncuztzBmCfD88eWaoqapbQAsR5R2tHSQn1gkjMQ5J/BdjSUSQvA7aNtPpkugDYB
	rrrpek88k/l+RuqOaOycTiyT/w2atqbzBF4JurA0hpHFoliJu79va9FqqInThePO8vPvPdPmrNo
	wEizhTN6gUzs7Qj1STzK9pvXvnRARQi5fbuvHFWc37/WO3HjVeXfqwrAQBhEKaFH5pG3EamAFDh
	TJa7LUSQoH3bvV2DrgMuVu5ZkNOkWD02bTI3iiZ0i5C/+WRbTwcF/hb9IQIuWvmQ8Mo9hzF0sbS
	SekarCqQJ2cYs8EWlnGrWhjv+jMIXtBSaeEAoK+7fpbzdlQJuOWQjDzY5//zryfH84ewRuNNp8U
	Bloz9olB53MkG4a/mnxheN6wYng==
X-Google-Smtp-Source: AGHT+IH8qIUC7EPMwsTCtRxMBd9PDF6ooNYI/UggZD+5ILxzWi3jsIIlSuLSu8MLaTCUBjHsJ2qv5w==
X-Received: by 2002:a05:6000:2ab:b0:39c:13fa:7b9 with SMTP id ffacd0b85a97d-39d8fcb03a0mr1819442f8f.0.1744282706617;
        Thu, 10 Apr 2025 03:58:26 -0700 (PDT)
Message-ID: <09e1b9f3-6660-4cdd-9bcf-af075f95bb63@suse.com>
Date: Thu, 10 Apr 2025 12:58:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/16] x86/hyperlaunch: locate dom0 kernel with
 hyperlaunch
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-10-agarciav@amd.com>
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
In-Reply-To: <20250408160802.49870-10-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 18:07, Alejandro Vallejo wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> 
> Look for a subnode of type `multiboot,kernel` within a domain node. If
> found, locate it using the multiboot module helper to generically ensure
> it lives in the module list. If the bootargs property is present and
> there was not an MB1 string, then use the command line from the device
> tree definition.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
> v3:
>     * Add const to fdt
>     * Remove idx == NULL checks
>     * Add BUILD_BUG_ON for MAX_NR_BOOTMODS fitting in a uint32_t

At least this one looks to rather belong into patch 08?

> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -155,6 +155,52 @@ int __init fdt_read_multiboot_module(const void *fdt, int node,
>      return idx;
>  }
>  
> +static int __init process_domain_node(
> +    struct boot_info *bi, const void *fdt, int dom_node)
> +{
> +    int node;
> +    struct boot_domain *bd = &bi->domains[bi->nr_domains];
> +    const char *name = fdt_get_name(fdt, dom_node, NULL) ?: "unknown";
> +    int address_cells = fdt_address_cells(fdt, dom_node);
> +    int size_cells = fdt_size_cells(fdt, dom_node);

Oh, okay - regarding my earlier comment elsewhere: If the sizes come from DT,
then of course ASSERT_UNREACHABLE() can't be used at the place where bogus
ones are rejected.

> +    fdt_for_each_subnode(node, fdt, dom_node)
> +    {
> +        if ( fdt_node_check_compatible(fdt, node, "multiboot,kernel") == 0 )
> +        {

When the loop body is merely an if() with a non-negligible body, inverting
the condition and using "continue" is usually better. Much like you do ...

> +            int idx;
> +
> +            if ( bd->kernel )
> +            {
> +                printk(XENLOG_ERR "Duplicate kernel module for domain %s\n",
> +                       name);
> +                continue;

... here already.

Jan

