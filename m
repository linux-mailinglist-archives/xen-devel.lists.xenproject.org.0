Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F64C91D8FB
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 09:32:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751275.1159168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOBWU-0002Au-73; Mon, 01 Jul 2024 07:32:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751275.1159168; Mon, 01 Jul 2024 07:32:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOBWU-000280-4G; Mon, 01 Jul 2024 07:32:26 +0000
Received: by outflank-mailman (input) for mailman id 751275;
 Mon, 01 Jul 2024 07:32:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kQX2=OB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOBWT-00027s-7V
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 07:32:25 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e6e65cd-377c-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 09:32:23 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52e8cdc6a89so205334e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 00:32:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c91d3e2cd3sm6035030a91.49.2024.07.01.00.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 00:32:21 -0700 (PDT)
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
X-Inumbo-ID: 0e6e65cd-377c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719819142; x=1720423942; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g/Rt9slov6tqTVpwOXfyHzGrdTlGusarrkfUDF6/WbM=;
        b=OYFCzq9icjqLck417JcnQ9tlD8YDf3VGhgiC6Sjp86xKdrdtWzsU75ezFoWNe7zGzg
         HcKYhk+AN7NJzWzxbAvIlA/0ja5ZDfQb1i4V3Wiv/a66p5KeLh0VpD7PGjzZEDNz1S+s
         dI19OQuavp354pq+StWYy0XcVE7K6VO0x9or57QIk7gQZ8uAkIbZ0G+Py75hdnQLobp8
         zqG6BOJbkIjU43NKKp26WoGoRTbIuOesoyU+PoCh2TaFC5ydoHXNP0JTCM+mef39s9Oc
         Ls4hjqerukm8/EogU+HgcYd4vCNuPaa0/Qtwlj0HFjSRQFWemx5EPJfs6KuMedzld4zo
         1N4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719819142; x=1720423942;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/Rt9slov6tqTVpwOXfyHzGrdTlGusarrkfUDF6/WbM=;
        b=nD5AbY8nkekOcDsmUfj0T6lsSRiidZdMeoTTjOvYWwwVeQ1NtuDTysJZhp/198EEmI
         l5+YTK9SiSeGXoUZqR2HjE9YQtXcWJgPWfrpR6PXkPsdhwsnWHr2NANzRo6j0yGRzLB6
         emoj3MDIkIKDaxj+1FiMG3XiIQd4AwqdT5Jg/d6jXBzgYuI2AwIcKrIotsaa2lTR/m0A
         Z/hyWlRgJXJbaUS4DNQOtUzB61PeuVprhrmFBpCCe6VapzyhmuyD5E1JwZWy+tRNV8xX
         Bn/17TrqytaDXTvkCtaPfUAKMSTwSu4lfdDFZPFqp69kSm0Xs2zyZebQ07GIVr/f7rQJ
         OfWg==
X-Forwarded-Encrypted: i=1; AJvYcCWOQ7eVRxqifAd6toofyzSw3is4VUAI3E77YEb7g+Nn402dqWir9ASnbG0spf4UOaBV3Dl9BAV+VHPgFnUIoiuTtjsQI7Lzx3T7O+aYrxk=
X-Gm-Message-State: AOJu0Yzix4vI8dgQea7f/qVswmNasj/Mn9w5ZnkPMa4rUT78rqXAcUh4
	UiPHY4i54PfdtUeQH7o9NnplOf/WiDZJ/n49EBjxEh/jW69MxtxgQkDIexacQA==
X-Google-Smtp-Source: AGHT+IEVkMhvSIV6KB1YSMdHgvlsgGCzZUExzXxh1wYffV/DyCya/EU+136LjNU/CvmB2FCllc2NcA==
X-Received: by 2002:a2e:b889:0:b0:2ec:3d2e:2408 with SMTP id 38308e7fff4ca-2ee5e6bc703mr30507441fa.33.1719819142447;
        Mon, 01 Jul 2024 00:32:22 -0700 (PDT)
Message-ID: <ff827def-743c-4312-88fb-dbd1b87bb85d@suse.com>
Date: Mon, 1 Jul 2024 09:32:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v11 7/8] tools: Add new function to get gsi from
 dev
To: Jiqian Chen <Jiqian.Chen@amd.com>, Anthony PERARD <anthony@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <Ray.Huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240630123344.20623-1-Jiqian.Chen@amd.com>
 <20240630123344.20623-8-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240630123344.20623-8-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.06.2024 14:33, Jiqian Chen wrote:
> --- a/tools/libs/ctrl/xc_physdev.c
> +++ b/tools/libs/ctrl/xc_physdev.c
> @@ -111,3 +111,38 @@ int xc_physdev_unmap_pirq(xc_interface *xch,
>      return rc;
>  }
>  
> +int xc_physdev_gsi_from_pcidev(xc_interface *xch, uint32_t sbdf)
> +{
> +    int rc = -1;
> +
> +#if defined(__linux__)
> +    int fd;
> +    privcmd_gsi_from_pcidev_t dev_gsi = {
> +        .sbdf = sbdf,
> +        .gsi = 0,
> +    };
> +
> +    fd = open("/dev/xen/privcmd", O_RDWR);
> +
> +    if (fd < 0 && (errno == ENOENT || errno == ENXIO || errno == ENODEV)) {
> +        /* Fallback to /proc/xen/privcmd */
> +        fd = open("/proc/xen/privcmd", O_RDWR);
> +    }
> +
> +    if (fd < 0) {
> +        PERROR("Could not obtain handle on privileged command interface");
> +        return rc;
> +    }
> +
> +    rc = ioctl(fd, IOCTL_PRIVCMD_GSI_FROM_PCIDEV, &dev_gsi);
> +    close(fd);
> +
> +    if (rc) {
> +        PERROR("Failed to get gsi from dev");
> +    } else {
> +        rc = dev_gsi.gsi;
> +    }
> +#endif
> +
> +    return rc;
> +}

I realize Anthony had asked to move this out of libxencall, yet doing it like
this (without really abstracting away the OS specifics) doesn't look quite
right either. In particular the opening of /dev/xen/privcmd looks questionable
to now have yet another instance in yet another library. Couldn't we split
osdep_xencall_open(), making available its former half for use here and in the
other two libraries? Of course that'll still leave the ioctl() invocation,
which necessarily is OS-specific, too.

Jan

