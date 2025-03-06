Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 110B0A54FF0
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 17:00:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903846.1311782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqDdo-0004lX-Bs; Thu, 06 Mar 2025 16:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903846.1311782; Thu, 06 Mar 2025 16:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqDdo-0004jM-96; Thu, 06 Mar 2025 16:00:08 +0000
Received: by outflank-mailman (input) for mailman id 903846;
 Thu, 06 Mar 2025 16:00:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tqDdn-0004jG-Ha
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 16:00:07 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 127e952e-faa4-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 17:00:06 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3912c09be7dso550901f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 08:00:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c103f57sm2438984f8f.91.2025.03.06.08.00.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 08:00:05 -0800 (PST)
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
X-Inumbo-ID: 127e952e-faa4-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741276806; x=1741881606; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IlQtbKQU5i3/b1Y/GFCrBu6ypR31T9nhVjsE/vNm3mM=;
        b=USEuajsigcW+elZg3c4vqMV4VAB0sPN1x9+LMpLBcxylQMcguDa0OgfA43eKdD6u/z
         zNAyznggpmFHQF8iHpR66Ajo4umhKLoQzy0RQo3oin/Vyc4SlW8IEPQtn3rv/A9Q+k9G
         +kFC1wO/mCdxs/oLdhXHVFZBAJkoOXLoyGuRPzEzD3BX0BxVsqdmxUu0XVPML6hdCoVI
         4YfrS7DWijiPcTl9LCniwx+CTIFx6LbNVzIrG5M998Uz9vEaSSNGpPutSnQag5gIY9UW
         OcV+CgB5TSuC4DhmZX2knlY2W07rr//R1rmGQG+m9uUHn8rozqADLDX3bADr2BT49Luz
         Afpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741276806; x=1741881606;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IlQtbKQU5i3/b1Y/GFCrBu6ypR31T9nhVjsE/vNm3mM=;
        b=tGV3oikDmmnUeVhv6xTB7j5bPVLVDR88V29UaVbA4nf+z6E+o7UcL7oiEJYchEBGCG
         /9SNtemndgBHSaPsXYs9VSlFrRLx8bvm6rf0wa3w6YNBreuETOLRTPLm9OWxplA/nd2k
         VtbosaOfXZo5S3xINDm9FnDXUFMwwjiG6e+nkDVwlROZZmwrtPC3IaMORj5SBUG/V05c
         rDpVOqEdkjcoF6fygAek8Yh+nmb2vUdzcqy956MQMTOaHfm8In6NaEbtUINBOFcMt2xn
         Vqco7Y+980fW3goHRldN2axTsKLMXLQ/qyVTOM7bfDkXpKkb5I04NI6E0HQOkCIssWaT
         H/Fw==
X-Forwarded-Encrypted: i=1; AJvYcCXNhVe+mmhKeKp+IIznTjajisFpSqzggkIgiIaTflrAp17GOWg0FvInKSasWJoVGouNIzaAkPo5ADA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZRb6cT2FfE6B/1pA9M0WCbvddN2Xrc+T5GuJwkn4qb0Hr4T4b
	ZUzR87Ithgm5s+9IW5YxouANA9nab8cxBWDxcSmqtppLChxgv/yAHqdL8CvEUg==
X-Gm-Gg: ASbGncvNF+/HKz5W9dKAoaxaVUSPOSW0F/vG3yNlBSK0q3D0yyWc8Y0wAkqYsIRqQLh
	Pxsm8i7ntb7eZ29ugpz9lNQzlCmjuoyhPX/fQni5StNEkhOgMaWGR6+WP2PHzacPS3GZh7G5g94
	17z8toGecINJkWn/C9nx9A/vLl/yyFor8eoftqEI3VMBgF/dXRIxtaHAWYOhZ4JpdiV+Et/D4x9
	MM49KvxNLeQiZJzfpOXmnk9IIu+fvfq5RF/A2qZAuiz4jjVItlnPbcvgxY88qjoOGOPHbYdyhS2
	0xyrijVR+gBjzAfAkP//Q5SQ5QeAH/idk1X1NRKNYsK5x4bZABxKUBoEsur7gFgJ+Fj8WfLdc24
	/eBboCEjPIsWw9Kd/ZThHayW3xakL6A==
X-Google-Smtp-Source: AGHT+IHrI25fhcwiTDncErfHgBebMvmMITK/Mv0pt3/fglUicQOoVkimDfd0/J8IO+aBfSq0dIZnkQ==
X-Received: by 2002:a5d:5850:0:b0:391:4f9:a039 with SMTP id ffacd0b85a97d-3911f7400aamr8060110f8f.16.1741276805841;
        Thu, 06 Mar 2025 08:00:05 -0800 (PST)
Message-ID: <bc274326-c914-4834-a2dd-a44727309e2e@suse.com>
Date: Thu, 6 Mar 2025 17:00:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/events: fix get_global_virq_handler() usage without
 hardware domain
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250306155423.3168-1-jgross@suse.com>
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
In-Reply-To: <20250306155423.3168-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 16:54, Juergen Gross wrote:
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -1036,7 +1036,9 @@ int set_global_virq_handler(struct domain *d, uint32_t virq)
>      {
>          old = global_virq_handlers[virq];
>          hdl = get_global_virq_handler(virq);
> -        if ( hdl != d )
> +        if ( !hdl )
> +            global_virq_handlers[virq] = d;
> +        else if ( hdl != d )
>          {
>              read_lock(&hdl->event_lock);
>  
> @@ -1091,7 +1093,7 @@ struct domain *lock_dom_exc_handler(void)
>      struct domain *d;
>  
>      d = get_global_virq_handler(VIRQ_DOM_EXC);
> -    if ( unlikely(!get_domain(d)) )
> +    if ( unlikely(!d || !get_domain(d)) )

According to my understanding of how unlikely() works this wants to be

    if ( unlikely(!d) || unlikely(!get_domain(d)) )

Of course I could also live with being given an explanation of why my
understanding is wrong.

>          return NULL;
>  
>      read_lock(&d->event_lock);

There's one more change needed: get_domain_state() needs to avoid calling
unlock_dom_exc_handler() when "hdl" is NULL.

Jan

