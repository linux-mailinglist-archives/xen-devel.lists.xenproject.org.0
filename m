Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6E281891F
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 14:58:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656845.1025319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFabj-0007wQ-B3; Tue, 19 Dec 2023 13:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656845.1025319; Tue, 19 Dec 2023 13:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFabj-0007uU-8P; Tue, 19 Dec 2023 13:58:03 +0000
Received: by outflank-mailman (input) for mailman id 656845;
 Tue, 19 Dec 2023 13:58:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFabi-0007uO-BQ
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 13:58:02 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9eaeb1d5-9e76-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 14:58:00 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40d05ebe642so15860345e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 05:58:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0040c2963e5f3sm2982525wmp.38.2023.12.19.05.57.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 05:57:59 -0800 (PST)
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
X-Inumbo-ID: 9eaeb1d5-9e76-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702994280; x=1703599080; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qEsa6AhNdiOL934DM2czeICXaJmOeM/0Jtv2odSg8bs=;
        b=K54JPRUhVzvYHJtqpXuEXakBQESLUz9LGT1wdqU84dVU+v3ebDcO0knAtduza0te69
         pE6jH4iNR+pxeXwSACzFr2uYWBfuJODfXyCn4JjAUVsxFAHYQMlnFxmhl3pRAHw3zgS/
         lm8OUqHytxgxTrJcv6XoGb/7QkIhn4af577d45xbhbOFRP7KZEdrdQzgJ6lEEbAmaeEI
         7p2P0LBOHFjUzKI/MyYUGGeP0WgDsjMPvVGXLy3q5csBH4+AiYF/WktD/iNsE10ntoqO
         0SCyDOXs4lTI+r6Wk4MojTBIQtsnA+n4aG42dPWzlQElH3YIdbCRm3se/T+d+qJlNtZk
         Ynsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702994280; x=1703599080;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qEsa6AhNdiOL934DM2czeICXaJmOeM/0Jtv2odSg8bs=;
        b=cMIVn7rNFG70W53qqJ/rjobPkabFw4DkOk9QKxhp3f3dDicnu26I52eZLUDBCmd5VE
         4S295wzHP2FctSES8d8dksluB5erZXj32bweHZfzn4rT6Ylb9cJYzjRZQ6x6cWMkpxTa
         Lgobspns5Od/rzDm/O8WzmOQhuRjekVTYSEJLgURlSjgl8YHSYhLge+8uRoKmz6cOBF9
         ooa/+4RjvrKwrksX/5d6XHQn+SpfOGfhEwXureoH9vXJ1kvrZAUGV9zmy1ZHG5UPvXRD
         9DSDjvn97Ehurr/CMc5LqUg3K+npn/lDFjMP4LEO+xYq5GQYN9zvZgPZkFgI4HDKWR+Q
         WZrA==
X-Gm-Message-State: AOJu0YwCMnRrWZNykW/s4kJg7XAsEfEcnNpIb3msNpGFBs0SqHEJZnPk
	O+nO8qkvO6lp31j5QWAfSpVH
X-Google-Smtp-Source: AGHT+IEmed++1U6FUG7wUwv0BJvGsSQrwfKmaRW43LqIW8MEMai4azyaDTEcFYT9//wpWFE9WZIZiw==
X-Received: by 2002:a05:600c:245:b0:40c:3984:4985 with SMTP id 5-20020a05600c024500b0040c39844985mr533207wmj.79.1702994279716;
        Tue, 19 Dec 2023 05:57:59 -0800 (PST)
Message-ID: <7a149ad7-0363-4f4a-9de5-76be382e774c@suse.com>
Date: Tue, 19 Dec 2023 14:57:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/dm: arm: Introudce arm_inject_msi DM op
Content-Language: en-US
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6a631756a126e73390f95b9e86c69e3286c92f59.1702991909.git.mykyta_poturai@epam.com>
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
In-Reply-To: <6a631756a126e73390f95b9e86c69e3286c92f59.1702991909.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.12.2023 14:48, Mykyta Poturai wrote:
> This patch adds the ability for the device emulator to inject MSI
> interrupts into guests. This is done by adding a new DM op to the device
> model library.
> 
> It is not possible to reuse already existing inject_msi DM op, because
> it does not have a devid parameter, which is required for translation of
> MSIs to interrupt numbers on ARM.

Yet then ...

> @@ -112,6 +113,20 @@ int dm_op(const struct dmop_args *op_args)
>          break;
>      }
>  
> +    case XEN_DMOP_arm_inject_msi:
> +    {
> +        const struct xen_dm_op_arm_inject_msi *data =
> +            &op.u.arm_inject_msi;
> +
> +        if ( d->arch.vgic.its == NULL )
> +        {
> +            rc = -EINVAL;
> +            break;
> +        }
> +        vgic_its_trigger_msi(d, d->arch.vgic.its, data->devid, data->data);
> +        break;
> +
> +    }

... you're not using the addr field at all, which therefore could likely
hold the devid data (encoded to really represent some form of address,
or stored directly - much depends on what purpose the address serves on
Arm for MSI).

> --- a/xen/include/public/hvm/dm_op.h
> +++ b/xen/include/public/hvm/dm_op.h
> @@ -444,6 +444,15 @@ struct xen_dm_op_nr_vcpus {
>  };
>  typedef struct xen_dm_op_nr_vcpus xen_dm_op_nr_vcpus_t;
>  
> +#define XEN_DMOP_arm_inject_msi 21
> +
> +struct xen_dm_op_arm_inject_msi {
> +    uint64_t addr;
> +    uint32_t data;
> +    uint32_t devid;
> +};

Additionally xen_dm_op_inject_msi has a padding field, which is likely
possible to use as well (perhaps by simply renaming it).

Also note how the addr field there is using uint64_aligned_t.

Jan

