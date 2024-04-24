Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6640C8B017F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 08:05:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711117.1110828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzVky-0008Gi-I0; Wed, 24 Apr 2024 06:05:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711117.1110828; Wed, 24 Apr 2024 06:05:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzVky-0008E6-E4; Wed, 24 Apr 2024 06:05:24 +0000
Received: by outflank-mailman (input) for mailman id 711117;
 Wed, 24 Apr 2024 06:05:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzVkx-0008Dz-4T
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 06:05:23 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a262d601-0200-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 08:05:22 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41b0bc4ce39so1228645e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 23:05:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r30-20020adfb1de000000b00343e392829dsm16379916wra.97.2024.04.23.23.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 23:05:21 -0700 (PDT)
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
X-Inumbo-ID: a262d601-0200-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713938721; x=1714543521; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u4imGHJZzQiILxfsOclmq+kHVBQ53kfcMw2z1a5Q+5M=;
        b=TpphYQpt/RaDEd6qBpE2lgYpSFrAZTjtDTtnPFz10FTs2wYZgzWWr7h+Wt/vPc8dVq
         t1/3pn9/FBpZckbFzm6mjGYXH8YY93dB5lVAzpIbpQ7UOnNgD6CPbsUOx8/kmHRKb+V0
         SYhrxWRmYFYilqnPZtUN4tu1N6Axh+7g+AC9pjLKmtRdTTS+tOCjiPwQQF2l1sW7XEuy
         cF39piFA7Wall4umP73F9VIB71iX9UK/CY5q68/hAvy1+c4Mlw/0LV3kKwguqNAp3cl7
         vO4+WRYoH95S/jXpczlusDhnpU5af6cxr1eg2S+Ud11FcrZ7UgWf+IYiZfeOMc0ZbMcf
         EidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713938721; x=1714543521;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u4imGHJZzQiILxfsOclmq+kHVBQ53kfcMw2z1a5Q+5M=;
        b=uALGok03c3ewPJpQH7TXWiP7CQ4nrwQYkqMZF7lThNQevc+NgFgvjq5vf4YI/Sva/L
         Npr+XcPjkSxsWBXtIoSbbKlL0MQWFoiA3j7c4bmB3rwCq9q4/QDEu1OPwuJvl3VD931a
         5FGkxVcOeexKgarlXM7ccOLIRjXpVQxzAw3K8hagoukdOIkAI0XLbfRPNIkWvcDba155
         Kumj4ljxiYhU1v/08Otamy1u/MQETbLoqGn8IYATXmI6Y94Dvv/rbR6Kvfp9EXD9eYFK
         trySaWJjb9Kj2fRMYfHlBWDDOnFyKWhGmutvZCchbN03ZhL88LLTIjiGOkK4vu44bmbL
         Ma9g==
X-Forwarded-Encrypted: i=1; AJvYcCX0NMnRspPdpAHeAJ0laX9dKFVsZm3DCwMhBfIECzgCHEfztOnrza/wF1uejrNhztuba6SgFWEv4c3GuNHDvwpMId9vlx9JA8OM1qYryZQ=
X-Gm-Message-State: AOJu0YxaTc5aiToOPk0sTkP6yjD1Wli6k2LVi55t9hBwo443BfYkLP4S
	iB8/JVDIi6PnnPAhFGpNU5lTkjWpGbJV9IEm3QeXt07c8acduxBtDAOo+gY5bw==
X-Google-Smtp-Source: AGHT+IHeMvghrJ+vwEmRSztmJFzmQaJR0iYk8xO0VisE43p8PRN3JGLYupQyY/Bk2s6VAv9/GXBBUg==
X-Received: by 2002:a05:600c:56d4:b0:418:e7b6:21de with SMTP id ju20-20020a05600c56d400b00418e7b621demr1215722wmb.23.1713938721347;
        Tue, 23 Apr 2024 23:05:21 -0700 (PDT)
Message-ID: <da67f90f-6807-4fdc-b65b-f7a4ba9f78ad@suse.com>
Date: Wed, 24 Apr 2024 08:05:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] xen/overlay: Enable device tree overlay assignment
 to running domains
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>, Vikram Garhwal <fnu.vikram@xilinx.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-8-xin.wang2@amd.com>
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
In-Reply-To: <20240424033449.168398-8-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.04.2024 05:34, Henry Wang wrote:
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -1197,7 +1197,9 @@ struct xen_sysctl_dt_overlay {
>  #define XEN_SYSCTL_DT_OVERLAY_ADD                   1
>  #define XEN_SYSCTL_DT_OVERLAY_REMOVE                2
>      uint8_t overlay_op;                     /* IN: Add or remove. */
> -    uint8_t pad[3];                         /* IN: Must be zero. */
> +    bool domain_mapping;                    /* IN: True of False. */
> +    uint8_t pad[2];                         /* IN: Must be zero. */
> +    uint32_t domain_id;
>  };

If you merely re-purposed padding fields, all would be fine without
bumping the interface version. Yet you don't, albeit for an unclear
reason: Why uint32_t rather than domid_t? And on top of that - why a
separate boolean when you could use e.g. DOMID_INVALID to indicate
"no domain mapping"?

That said - anything taking a domain ID is certainly suspicious in a
sysctl. Judging from the description you really mean this to be a
domctl. Anything else will require extra justification.

Jan

