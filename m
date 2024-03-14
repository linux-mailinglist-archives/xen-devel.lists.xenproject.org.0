Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCB787B893
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 08:26:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692914.1080632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfU9-0003DB-Kb; Thu, 14 Mar 2024 07:26:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692914.1080632; Thu, 14 Mar 2024 07:26:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfU9-0003Aq-Hq; Thu, 14 Mar 2024 07:26:41 +0000
Received: by outflank-mailman (input) for mailman id 692914;
 Thu, 14 Mar 2024 07:26:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkfU8-0003Ak-BR
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 07:26:40 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31e664d1-e1d4-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 08:26:38 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a466a256726so119611766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 00:26:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f23-20020a1709067f9700b00a43e8e76825sm424651ejr.149.2024.03.14.00.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 00:26:37 -0700 (PDT)
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
X-Inumbo-ID: 31e664d1-e1d4-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710401198; x=1711005998; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DgaqQRLa/bceGTxMnXEXk4fxq4M6cGxB2GPnK5l9feI=;
        b=VWRcASX33rwHVNM/wXJHrT7xIK4X/nVdQLEaSSwQHMNZVC8VoeMmEKFho3hdLptO3t
         t+mabPYJz5VaJdiCw3bnhd3vu42bq2M8uNw9JDzqAY43OP6rKDWgcmlBfk29vjVRG67M
         73suKqvw5i6aBd4tukQODhrc18lZkP7OsCHIOia8qnc5KAweR+JjPZPpWTThHk7KMMz+
         eHi4CmnaSb8PFAlgUaP5L5dUBjuFZXXbrs2KDJHhj5PHJWs3Yfy6OSX0bRE2qV2cPJev
         P+sRNlwzJontsLAN0sagqWtzcITz1x14SjyMJr/SRKhS6kgrgcRB/uv7Yi5lryCVPrqu
         jNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710401198; x=1711005998;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DgaqQRLa/bceGTxMnXEXk4fxq4M6cGxB2GPnK5l9feI=;
        b=MztA5qfSS1lnlX+oR5f1DiGKUzNqAy+m1n1rdUcU1kGeMz5LgL4LhHxnZ7gbqKv+gq
         LtM43Mk/L2S3mFiUKZL6IGQjfr+gwZoMq6FPULlgbWc+7PUusXlF98E02+auMaDAVPX3
         IBfxJUXWeLYHBlmnGlLAcj9I5f1EtXl3MdTPDHeHl2LbRW11N3HwONbV1IUoGC8B2Zcq
         UMHscl2DGXntJ63FTkL1SQM1PwBA/AVA7o2DCKXFAj/R3arOpt8C+DdgSHB5KVFkyVI3
         DIjiIXomKPxB2odstYzKSG70u0epI2O7ims9o6OGdS+5cvnQqx9mA8OtV9wBDZcDaim8
         wytQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2cstJWGObRp4mspxKCdaR0+B2GZDB41QF2ysHgn0zIVVJ/FJKyoAaYF2EA2BzWhpHmbyJ3MSUs4bdAxHY0SU5YRvQbQKHHKl9wC85Odg=
X-Gm-Message-State: AOJu0YyYigeaAnyu8tIkPUVrZXtpk4B7qU3N+1EFhmYOqO6usZfYc4yq
	P8M1qghzPpVxT3n9wcHk72F86El6vdnVZ9ywWlcvAqhrn0lEkzO8Yc11LrNQeg==
X-Google-Smtp-Source: AGHT+IEESfg3kAvlJ0pFbGpp9wwXZHIsccwivDl9X+A3LfW2040M7bnzjFpf7TwRUgN+twxMvRYN7Q==
X-Received: by 2002:a17:906:6a03:b0:a46:75d3:dd46 with SMTP id qw3-20020a1709066a0300b00a4675d3dd46mr320990ejc.17.1710401197826;
        Thu, 14 Mar 2024 00:26:37 -0700 (PDT)
Message-ID: <cf161b43-0011-4faa-8d96-f99384448544@suse.com>
Date: Thu, 14 Mar 2024 08:26:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/13] xen: allow up to 16383 cpus
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240314072029.16937-1-jgross@suse.com>
 <20240314072029.16937-14-jgross@suse.com>
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
In-Reply-To: <20240314072029.16937-14-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 08:20, Juergen Gross wrote:
> With lock handling now allowing up to 16384 cpus (spinlocks can handle
> 65535 cpus, rwlocks can handle 16384 cpus), raise the allowed limit for
> the number of cpus to be configured to 16383.
> 
> The new limit is imposed by IOMMU_CMD_BUFFER_MAX_ENTRIES and
> QINVAL_MAX_ENTRY_NR required to be larger than 2 * CONFIG_NR_CPUS.

That's quite sad - I was really hoping we'd finally end up with a
power-of-2 upper bound.

Jan

