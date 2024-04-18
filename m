Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 419B28A9DD4
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 16:59:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708448.1107370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxTEP-0003HO-4A; Thu, 18 Apr 2024 14:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708448.1107370; Thu, 18 Apr 2024 14:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxTEP-0003F6-1X; Thu, 18 Apr 2024 14:59:21 +0000
Received: by outflank-mailman (input) for mailman id 708448;
 Thu, 18 Apr 2024 14:59:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxTEO-0003Da-7x
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 14:59:20 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ae0ab1f-fd94-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 16:59:18 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-416a8ec0239so6020135e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 07:59:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bi18-20020a05600c3d9200b00418d5b16fa2sm3753983wmb.30.2024.04.18.07.59.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 07:59:17 -0700 (PDT)
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
X-Inumbo-ID: 3ae0ab1f-fd94-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713452357; x=1714057157; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wUgMT56pi4yzexntG71G7Hyq33TqpzPXAEEN5iyNDEI=;
        b=Aggsz4x9HF3cZgXKT0CxkjP95e9hFCuLopb0hnXL/ttA6c2N5pDurA78mU2kiNheaK
         MNYKEN2fVWjvpIVbMmwk64/tpbNxgIl5TPwgiHzOd8ReCqtP2Jun6E8ErEsAQar1cQ3a
         /AWm3itIvoZweris1haVlGxinHYaFbM2K79rqUPBw/4kEWEX0SdCEpbPDzHC0xQTg9JW
         kDZxQzVZy+tiYN6WbVNMqPgGzJj3gmgJc8dfH4ewhzR/Pw81sxmqGbjdMPzOwqQPKxyB
         rspaqxoLbBrnb606Py8EtUT5vzinZ+a+9A5aS+yhJEF4f9p6cW/Qr9jV4hO4tThUAl85
         vtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713452357; x=1714057157;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wUgMT56pi4yzexntG71G7Hyq33TqpzPXAEEN5iyNDEI=;
        b=iLfl48fy9OfqyblrH0OP6aVOpVHkHovkud6vjprxHnFopWwwaQuw31AB+Fkf1+xHZO
         EmbtRJqIU7IR5sQ3Ut54tlDMFVSrFSsc+5CQDE/12MMbEJyCVGk7wJ3c/VN35c2OZrPX
         s402fsWoszLBHBMuSbPLIWM532w2oOivVImMt+HW4G3DlJ0ZIbr4h5xLlQXbUUX3AlN/
         yTvHC6CuZ+XZLalILpMHNhGX6vWfVdlI8Zds9iUjTlD77YWiaMLq3h2wNFHTs98JXzGm
         ZdJZJMXViF7Aw57haEsSNMkW7x+5z6Y3BRJF0Gv2llAHCVQ7x2LRCwUlYYeBkZV6dHTh
         W0Yg==
X-Forwarded-Encrypted: i=1; AJvYcCXMdyHpPPnuP7cOfzjtW80JWF42vVc6BRT/GU1xYKYdM8/L3DE7TwkmAb5Bsdd3z8jZArJpwnxyozjQ/CAlbb8F/y9AkPNROrQboIwRJwA=
X-Gm-Message-State: AOJu0Yy4XKiogiWRPEMfmJmOonpHLPWIZ4mHjQR2IGlGiO+aVzDrPx/i
	j8jgAW01Q8jx9pa9kO0hWOqavGiiNj9dZW1kbF/LNcCWTSAHn04SfRvRtuF+DA==
X-Google-Smtp-Source: AGHT+IGFygqWnx57klAp+JSvqS3JYrSwMXDgPwDcro/73WXsWoDawf33leFOA5s6HqrtDIKNtw6ToQ==
X-Received: by 2002:a05:600c:1c85:b0:418:7ec1:7bdb with SMTP id k5-20020a05600c1c8500b004187ec17bdbmr2253445wms.5.1713452357290;
        Thu, 18 Apr 2024 07:59:17 -0700 (PDT)
Message-ID: <b1b9a3f4-f53e-4f13-81de-6462d106b55a@suse.com>
Date: Thu, 18 Apr 2024 16:59:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/2] xen/domctl: Add highest allocated evtchn port to
 getdomaininfo
Content-Language: en-US
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1712840924.git.matthew.barnes@cloud.com>
 <55a9cc8fa53e57f898d05463746cbabda821ce25.1712840924.git.matthew.barnes@cloud.com>
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
In-Reply-To: <55a9cc8fa53e57f898d05463746cbabda821ce25.1712840924.git.matthew.barnes@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.04.2024 17:24, Matthew Barnes wrote:
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -73,6 +73,7 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
>  
>      info->domain = d->domain_id;
>      info->max_vcpu_id = XEN_INVALID_MAX_VCPU_ID;
> +    info->highest_evtchn_port = read_atomic(&d->valid_evtchns);
>  
>      /*
>       * - domain is marked as blocked only if all its vcpus are blocked
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -145,7 +145,8 @@ struct xen_domctl_getdomaininfo {
>      xen_domain_handle_t handle;
>      uint32_t cpupool;
>      uint8_t gpaddr_bits; /* Guest physical address space size. */
> -    uint8_t pad2[7];
> +    uint8_t pad2[3];
> +    evtchn_port_t highest_evtchn_port; /* Highest allocated event channel port. Used for enumeration */

While, as per my reply to patch 2, I don't think this is a viable route, I'd
still like to mention that the name of the new field is wrong, leading to an
off-by-1 in the consumer in patch 2. d->valid_evtchns is a count, not the
"maximum valid" port number.

Jan

