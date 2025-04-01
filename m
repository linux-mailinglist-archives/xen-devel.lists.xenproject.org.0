Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2D9A77AF4
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 14:27:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933978.1335829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzaiE-0002kv-Ao; Tue, 01 Apr 2025 12:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933978.1335829; Tue, 01 Apr 2025 12:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzaiE-0002ib-5r; Tue, 01 Apr 2025 12:27:26 +0000
Received: by outflank-mailman (input) for mailman id 933978;
 Tue, 01 Apr 2025 12:27:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzaiC-0002iV-28
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 12:27:24 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a98e2592-0ef4-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 14:27:22 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39ac9aea656so4521959f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 05:27:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8fbc1889sm154230465e9.16.2025.04.01.05.27.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 05:27:22 -0700 (PDT)
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
X-Inumbo-ID: a98e2592-0ef4-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743510442; x=1744115242; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9XOFuAm2foLrtwsOzZNmoxIVwlBZyCQ84zcLOGva/yo=;
        b=FWIruyhMaQdnF8gq5qdPb4pC+jx2WS43S2qC/wAolaHH5F0b5seJWjjg5d2jJgPk8g
         eYH5D8wS49ZX33n7bp7SHF85ojQT+KST8Fu0zVQ3VD328R2LNfW7CwsQNEZqye4lUFuY
         /Qy6+7ZTVEjui3LKE2V7RT36L1O35fH4FL0swCKiQGX6tItoknfF858wC9AMuEKjfEbL
         pFT9mmF50cXbaV1WihUYllq0kXqsyMO2fGT6xD2UbQtxF7y4jG7TIotq/s6cYVYkEJXu
         tOqgQ8wsJy/uIISVSsc4+Pd2gPgKgXXbgixHt87d4zyuW7DmuEyo2FJmcJJtbEL8I640
         H9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743510442; x=1744115242;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XOFuAm2foLrtwsOzZNmoxIVwlBZyCQ84zcLOGva/yo=;
        b=vQ/ZaHRoT0AUmAQY+NVgu1A998UmfcJa2x2qh3wh36uIAfuxnNcG2ESAgmlwNw0Vg9
         sbdp8xnHOxLecSQ87mgkOv3W+YIcxRq50BY3MQL3tFxbEluNOb8GD5366HDk9V9HOGkB
         19wbkWME3TxR7YqGcE/CxiWlPZx3WQFl6HQjHuQ82v85gkSGWX8r/uR/KOO5WhsDNoyT
         p/wYIVOp+eunIma6G1AsF7VKvEJhsZFAsP26S2wXm2MIUSHHK0KHgkqVA/AxvjP1eqM8
         bFiSGzrBhFJsAGhOahy2tBz7crpOLvXyKoWonIHra3zhqgKAJ7hxi5BzLVFt4lps19j/
         lO1w==
X-Forwarded-Encrypted: i=1; AJvYcCULWHceZFvL0TTM5H+BAafUql8o/3IeHFQPxc97Sd7mkEaCl6Qnvk/+X+IcCmzb7PnNN27l8hYBHgw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJqIzAuLBm2pbTF9t3uzeKl9qSidSv7fATTuq4e7NJFa1jxPtA
	q9yKsKifID88lvGRrttXqLt9Hmyh8zfp5QoDhdJl9uw+G4xzr51CyGM4tNtw0g==
X-Gm-Gg: ASbGncscKnFoR1XJnCMpzpmuL2GncTGgE2A+l6rMXlceRvGJwLKjSHNbNt8bYy+nrsp
	wQz9hEpw7ElqhD/qBE+abnlOC8bXS+ccdEhr6s488z8o0f+S4cpuASO0gQjYYKXtviKRLGjZQfF
	vcJsphPKxL34kTH0BCsTMAA462yIilk85v0ov2MQDpO53d0T0YoEggI2hNKJOE51EZODUkrwuHK
	4Uk0f6QMWXS2LrgNL63M+GpTZCj5oxneKiseulx6KOO2QajZzx+y1ZJMUsbcQ1a43nB05TMA3Og
	chJpiqPRJEuRPmtcUUfPuN+wNzuiiv7qFOb1jKiQEE+o94c9/XR75GcthfL/nWpfrSi7DCPfGd3
	nHiRG0oq8Wr3Z63H/QsXycZHPD+kNFw==
X-Google-Smtp-Source: AGHT+IFcFU6RTaKHZMHnsc3RxJYuJ23jeO0RsZsrVSo0X7/JmFGaXxozlwWa8ofvtpUIIbpQmBh3+w==
X-Received: by 2002:a5d:47a7:0:b0:391:487f:280b with SMTP id ffacd0b85a97d-39c120cb53amr10963785f8f.10.1743510442380;
        Tue, 01 Apr 2025 05:27:22 -0700 (PDT)
Message-ID: <f1e9a924-68c8-4ebb-9f20-bfef028f2b52@suse.com>
Date: Tue, 1 Apr 2025 14:27:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/19] xen/sysctl: wrap around XEN_SYSCTL_sched_id
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
 <20250326055053.3313146-7-Penny.Zheng@amd.com>
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
In-Reply-To: <20250326055053.3313146-7-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2025 06:50, Penny Zheng wrote:
> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -72,10 +72,12 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>          ret = tb_control(&op->u.tbuf_op);
>          break;
>  
> +#ifdef CONFIG_SYSCTL
>      case XEN_SYSCTL_sched_id:
>          op->u.sched_id.sched_id = scheduler_id();
>          break;
>  
> +#endif /* CONFIG_SYSCTL */
>      case XEN_SYSCTL_getdomaininfolist:

Same as in the earlier patch (and I may not repeat this if later in the series
this re-occurs): #endif ahead of the blank line please.

Jan

