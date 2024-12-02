Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A509E0183
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 13:07:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846644.1261803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI5Cl-0001vv-8M; Mon, 02 Dec 2024 12:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846644.1261803; Mon, 02 Dec 2024 12:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI5Cl-0001sn-5Z; Mon, 02 Dec 2024 12:07:07 +0000
Received: by outflank-mailman (input) for mailman id 846644;
 Mon, 02 Dec 2024 12:07:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tI5Cj-0001s6-Ct
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 12:07:05 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f01b41a8-b0a5-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 13:07:01 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-434b3e32e9dso34935955e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 04:07:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa7e4c89sm179889225e9.41.2024.12.02.04.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 04:06:56 -0800 (PST)
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
X-Inumbo-ID: f01b41a8-b0a5-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzMiLCJoZWxvIjoibWFpbC13bTEteDMzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImYwMWI0MWE4LWIwYTUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMzMTQxMjIxLjgzODcwNCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733141221; x=1733746021; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2XWbVDXXoKXFVWcVjCzrVq3eYC2j9nnlFwtt9jS+5h4=;
        b=Cs08ad7Mcga6l7nmuRjBfQe/qEP6WDNlz4+kPGqRUwtSsO7HpZGaDLbO0phqiOf5pw
         K8jq3SIWkwtg5r5hHv+F8op0SAj/KX+w3Oryx0QeHeiD9gBISbR6GIyXaedP2TrRabAj
         emxN2411LFvAbWAv2jMhNlGdPq/BqvnOCLOzC1Me5IugSBbWiDlSDQOw88FXJNuxRPS3
         RWkMvSBSsLR2x2HthaGIXcB5N0Ww/+0EP5TIkiB9Aj+q23DB3j0+PScmmua+Jq/6Isw8
         IAdVVCQs6G69xzIFZ19Qxjn9r/hPZJgIo7+RuYsSUbnS7PzPdwC6wiHoVQONM35c1EvM
         6a6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733141221; x=1733746021;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2XWbVDXXoKXFVWcVjCzrVq3eYC2j9nnlFwtt9jS+5h4=;
        b=w6FOIwfyUYVTfA1FqgXQCdLBoEv2M0YsKxFmh6KdSlRN2dZJqoPhiE7fBjr0AV1BfZ
         5VgIcDvkX3s2hwA3hbJDdny0+Fm6e+g15FFKrBwbWgCqXsuVhuHlYXRtaGF63b+NZW3U
         yy7bD2jWY7VY34AA3+wZTZfDh+xYLUiHD0vBGy08XUR0h4b65piuyexMALYt/Eteh5EY
         wqD6aUEcFXQr2qDZcPXxYsD+HgCluCFBk13TPuYJR2UAF+wr8QWMEFUS0hiVk4DqHZny
         VLv7TlZR3MWnlS372ZsJSuT99UkfK7Z2/89PNy1WuAf0Seksp4M8V62h1Yn5CaT/i39L
         jYIg==
X-Forwarded-Encrypted: i=1; AJvYcCUgJDZqmy4V5ZzTrI7lRjMgtKoGzJXsofgLAnVdfIxslW8rPJjTHzSwq0UZKinx/U7rXI3DtBWnvWE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzY30WDOIIrEvwfPyCRJZ38kV38OFc6iZnGsQetLApfXva+yc7A
	hxZ6w8mn3hGkcE7uCdcxomVE5Hr9Tha4MQ9R7wA6SjV4YzZ1s5XeNxd8Obg3Og==
X-Gm-Gg: ASbGncvlJ6zaSjOhpPnVMI0vjfxvAvwddZEhBWJeJ0Y7jE7WzduTug0x3muUUIe6Qbj
	r0f35iCQqmdWmIFdv+k26s7rZoRj0wkMPv9v82xahANgDw5tpvoKvwtN3h4P1SiNhpDIH9NpklC
	pZ4/SpHfVxpHiEM5Vdow3FIJ9CwjTGWXSb8ZcwJhQwrILYSpokKq81CGMLdAW27Nk9dHiHGuK7Y
	dvdrfwYkM2qq4MnKvStCDmuwvcYydAX97G39u2rzEHP4ysJXrzZNrgpS/oCfQeqRkd8ABKacYyD
	sYqWCIcUSzHG3KHL8nZokmxOQomUcMD3Rz4=
X-Google-Smtp-Source: AGHT+IH+gXGOIVE4T3wrfxXJjuxzgSMdvBgZh8bT/72xJ1hKVJFZmghsLQ2AG5sDhJAKL9iWLK14VA==
X-Received: by 2002:a05:600c:4f12:b0:432:cbe5:4f09 with SMTP id 5b1f17b1804b1-434a9db8171mr214601175e9.4.1733141217186;
        Mon, 02 Dec 2024 04:06:57 -0800 (PST)
Message-ID: <294035fd-45c9-4c59-a5b7-bc1ebed90e47@suse.com>
Date: Mon, 2 Dec 2024 13:06:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/15] x86/hyperlaunch: specify dom0 mode with device tree
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-13-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241123182044.30687-13-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.11.2024 19:20, Daniel P. Smith wrote:
> --- a/xen/arch/x86/domain_builder/fdt.c
> +++ b/xen/arch/x86/domain_builder/fdt.c
> @@ -141,6 +141,25 @@ static int __init process_domain_node(
>              bd->domid = (domid_t)val;
>              printk("  domid: %d\n", bd->domid);
>          }
> +        if ( match_fdt_property(fdt, prop, "mode" ) )
> +        {
> +            if ( fdt_prop_as_u32(prop, &bd->mode) != 0 )
> +            {
> +                printk("  failed processing mode for domain %s\n",
> +                       name == NULL ? "unknown" : name);
> +                return -EINVAL;
> +            }
> +
> +            printk("  mode: ");
> +            if ( !(bd->mode & BUILD_MODE_PARAVIRT) ) {
> +                if ( bd->mode & BUILD_MODE_ENABLE_DM )
> +                    printk("HVM\n");
> +                else
> +                    printk("PVH\n");
> +            }
> +            else
> +                printk("PV\n");

Oh, and: What about BUILD_MODE_ENABLE_DM also being set here?

Jan

