Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEB08A93FB
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 09:26:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707995.1106498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxMA3-0000E8-Nj; Thu, 18 Apr 2024 07:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707995.1106498; Thu, 18 Apr 2024 07:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxMA3-0000CE-KF; Thu, 18 Apr 2024 07:26:23 +0000
Received: by outflank-mailman (input) for mailman id 707995;
 Thu, 18 Apr 2024 07:26:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxMA1-0000C7-Oh
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 07:26:21 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3f3819c-fd54-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 09:26:20 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3465921600dso427667f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 00:26:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a7-20020adfeec7000000b00349cadc5024sm1083425wrp.61.2024.04.18.00.26.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 00:26:19 -0700 (PDT)
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
X-Inumbo-ID: f3f3819c-fd54-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713425180; x=1714029980; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I1FTM9vNEaTc3mPbY3bPEEbPRuJnJvUdbWIQVpq+TdM=;
        b=IX2cuwqBpuVXeIHf7DJcv0DcAUbmKqEmFLfpTvEbjXc+roPrh9bIjvyTis82nIbm4j
         Vz39hcywEJyLcAajevswL6egIWDuRCN3aIKmiMp4QS1I0O7X+VaCZ9Sb5HUWyx+vN6v4
         QMDmZ8FyRToB6WpnC7jMTnIQIQ0yfVeEwtDc5n6l/g6WIl1UdQ9N3xQmSz3aEHFU8c/q
         4YIlyaWNSo+HlSnyypevpY4KWrLPP1OOyJRwYYfT3dgyMAbZG7o221ReTAjmW5qXyCij
         Q3M/vGIAMYm+GSNGrOMqQF4o/dNxm05MApZe/7vbiqO4cQI9vThOoEIAd/jqHERWDb4r
         MDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713425180; x=1714029980;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I1FTM9vNEaTc3mPbY3bPEEbPRuJnJvUdbWIQVpq+TdM=;
        b=oXeFoGihgorGcLMqEu9jBK5JHUkJk6EtwYeSWClXQOybdLhm+aDrzKTXkPWI9yLX1r
         gWsTGPqVz1vDrCOatoYL4fQOa1k0KLHJsLtKPW2+4FENFPiFtU0QGkP55oAGi3CpRm9y
         Lmohu9hKXf8SUsIfAX4nq1djbf0w7Pu9niNZSpkj4Y3MYXkufr1dJKGkGdXu8DkaJO+1
         n5eLPR0ueY5OeuWpaMocgTZKiVmuG2dB29DIG4gj9ybAVm86hETeqsVZI/eYhBIw1FKG
         FkBrwUUdpFfl2cfY4Zi2+uAWsje3aSLNEtIwUQsnuoO3C7uhiZhLJ3Kum/AByZ7YLshX
         x8+w==
X-Forwarded-Encrypted: i=1; AJvYcCX44TkqlFeLTBMdPH4JrokTm7xygyk1M/FtA6ysNyv9vqDhxPXdLJl8zJsi2L0cEYPhtb+l+xGciFCDZjM123kxjowkn0Vw9TmHkzudu4M=
X-Gm-Message-State: AOJu0Yzw5RcwIHnlLRGt8/yRENPVB5QcYFbSH+WqO4lKRD0iavXgjD7M
	9Zn7qMXC+ga3yunMKphcSCwqbFFJGOzQByB/Ry4QgpRopaFTJyMIKdaXd+0cEw==
X-Google-Smtp-Source: AGHT+IFS6c2+4mMDxAX7zi031y6+yExxXhxNXCI0yPVKicEUn16ek0SCyCLqnX9/Rm2mtf5Q2YihcA==
X-Received: by 2002:a05:6000:1:b0:346:d2c0:7682 with SMTP id h1-20020a056000000100b00346d2c07682mr946112wrx.30.1713425180128;
        Thu, 18 Apr 2024 00:26:20 -0700 (PDT)
Message-ID: <e8210c90-e023-4912-8d12-640512c97805@suse.com>
Date: Thu, 18 Apr 2024 09:26:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] public: xen: Define missing guest handle for int32_t
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240417121442.56178-1-michal.orzel@amd.com>
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
In-Reply-To: <20240417121442.56178-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.04.2024 14:14, Michal Orzel wrote:
> Commit afab29d0882f ("public: s/int/int32_t") replaced int with int32_t
> in XEN_GUEST_HANDLE() in memory.h but there is no guest handle defined
> for it. This results in a build failure. Example on Arm:
> 
> ./include/public/arch-arm.h:205:41: error: unknown type name ‘__guest_handle_64_int32_t’
>   205 | #define __XEN_GUEST_HANDLE(name)        __guest_handle_64_ ## name
>       |                                         ^~~~~~~~~~~~~~~~~~
> ./include/public/arch-arm.h:206:41: note: in expansion of macro ‘__XEN_GUEST_HANDLE’
>   206 | #define XEN_GUEST_HANDLE(name)          __XEN_GUEST_HANDLE(name)
>       |                                         ^~~~~~~~~~~~~~~~~~
> ./include/public/memory.h:277:5: note: in expansion of macro ‘XEN_GUEST_HANDLE’
>   277 |     XEN_GUEST_HANDLE(int32_t) errs;
> 
> Fix it. Also, drop guest handle definition for int given no further use.

Such cannot be done like this. Consumers of the header may have grown their
own uses. The declaration needs to remain active for any consumers
supplying __XEN_INTERFACE_VERSION__ < 0x00041900. Which means you need to
bump __XEN_LATEST_INTERFACE_VERSION__ and wrap the handle type declaration
in #ifdef. Provided the removal of that handle type for newer interface
versions is really warranting all this effort.

Jan

