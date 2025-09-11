Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 332A9B531B7
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 14:06:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120129.1465198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwg3l-0005OP-Rp; Thu, 11 Sep 2025 12:05:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120129.1465198; Thu, 11 Sep 2025 12:05:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwg3l-0005Mw-PB; Thu, 11 Sep 2025 12:05:53 +0000
Received: by outflank-mailman (input) for mailman id 1120129;
 Thu, 11 Sep 2025 12:05:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUpj=3W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwg3k-0005Mq-Jr
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 12:05:52 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a880d0bd-8f07-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 14:05:50 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6228de281baso1058906a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 05:05:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62ec33f57dbsm1081546a12.25.2025.09.11.05.05.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 05:05:48 -0700 (PDT)
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
X-Inumbo-ID: a880d0bd-8f07-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757592350; x=1758197150; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zjTj9jIzhm4doUGKBlncqulQ5QU6mxkYS8CWuf3Huk0=;
        b=H8+uMrsP7s/nJhi99vd0eFTHryQfkEqF8RITj2dFhP9eBvAhK7Q5vNwLf1bKnofgJD
         gdrizSO2rbmuCf2VNwMSkLLkfFSVlhIzTetWK+bWjx2xZCIAik0WE+s6PpQyz30x83iQ
         pRx4jYGUxaS4QkyOhNjJgQlileO07uV7X18YznbuSt/OmbEiOm5A/FESvZte4n0L6j22
         9/LUcWrU0fOknx9s9AtWhvmCROExeYcmlOn0JOyOnV5a44rF4vg+5hwJTBK2LTabbvVW
         VREHQw/7aWUmiU9/r+nUzSeV2UhrZBEDnrnnco4V/aHPoZ3Qz0MLRz/tNBXTMr4H1QjO
         SOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757592350; x=1758197150;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjTj9jIzhm4doUGKBlncqulQ5QU6mxkYS8CWuf3Huk0=;
        b=LM2ipocQjS4FOD5JjhOuqXFmGh1hA6Ns3DVItH0e6pJFlBUxJF+DjC4IvpQY9ky8HK
         Pe0hN8+KiiTWb56k7AM+KfaVgn6MyPQDQWlss+eQ50hNWH1Br5Lqve4O7kK4ArhOHih1
         /4O+Uh1Pxd78tPdm26lcjBV93FHw5hN+/bbyCWxLkgNFklZMIWLvIY3OuJcpFH/wksQ6
         bCXeqbHj2OvQnlSJ7XcCSSZ8KPFhMIWaNXPaOcgdrXSSO/oS/vNTM1FO6/y3HzMOuu45
         CkA9pGnZ5mwUWPJrl1sXpgwouO1+RQ9Sv6AQQfLJNu2A/oLz76RqUnvLs7zW2W/7xyGG
         bzDg==
X-Forwarded-Encrypted: i=1; AJvYcCXCB4i7TdPuQ2jggU+6QRGmQU+XbYGmo12IBe3l9z9pJhtSbjWytRg+rETxQaHcaylVfacP4K9sRBw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMPNtW+XLOHoXu6lHvIpj6rIrZOZrHf+kNLGp+D+XUFmGPA3XN
	DOd1oX15GPH1bW0YB8CQcl6DUkr6rukGLfKZfSY+eW0TsrYCq4hNBBsXGlG4TOwB/g==
X-Gm-Gg: ASbGncsQJ2ft5tl5+/SiKyUqjjolZ7kYIZOBqPhz4PL1KvxxzfaKFddBsgAPGHvS9Eh
	X0oDM8FqIDiP+Q5SFV9Mnv+esFwgJJlkV2fzTJk6GXMvAGq81uwCRiTtcb14cPdb0e7A9yU/XF+
	iLUSPRDnWSZnVPe/BCP7Gi6swiNwnlGfh8yXNOFG17Dby4jy8RUIWAR0Z3pLrfxNOhuxICJDk3V
	HVP885Y8f4lTxlzMo14JKKtYXjAlxwR16wGdDuU/KBb5nzOb2qKhx1x2JBolgcY+gkuv55utOCM
	WIZRrSNMXFrx1PwypahRoc1YvMDeNZBw/0lzvnP+PtoHgDatNyXkB/40zh1Gyxv2DXT1wEzV1rF
	03ARLufMRIBl6Wg6myVJfXdNmUAviOkm/D7FlbUJZmpeWBCbq7Yvt5NwrbM64Gz5tmoV99WdmKP
	CUxkpIZ0nhdomwyKtyqg==
X-Google-Smtp-Source: AGHT+IGbaXBYENG3+R2LUsNPmoKGplewkWHGPaIaLjJAFNJg1wvChk0NIsFDsudME+vsJ2Ax9/Dy9A==
X-Received: by 2002:a05:6402:90b:b0:620:27e5:10fb with SMTP id 4fb4d7f45d1cf-62377109d22mr17851714a12.19.1757592349808;
        Thu, 11 Sep 2025 05:05:49 -0700 (PDT)
Message-ID: <dd9949e5-765a-47e0-8e8d-ffb87c8e0e39@suse.com>
Date: Thu, 11 Sep 2025 14:05:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/26] xen/xsm: wrap xsm-iommu-related functions with
 CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-22-Penny.Zheng@amd.com>
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
In-Reply-To: <20250910073827.3622177-22-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2025 09:38, Penny Zheng wrote:
> The following functions are xsm-related and only invoked under iommu-related
> domctl-op and shall all be wrapped with CONFIG_MGMT_HYPERCALLS:
> - xsm_get_device_group
> - xsm_assign_device
> - xsm_deassign_device
> - xsm_assign_dtdevice
> - xsm_deassign_dtdevice
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

First - aren't you dealing with unreachable code issues here that the earlier
patch introduced? I.e. would both patches need folding.

Then same question again as to xsm/dummy.h.

> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -123,13 +123,13 @@ struct xsm_ops {
>      int (*pci_config_permission)(struct domain *d, uint32_t machine_bdf,
>                                   uint16_t start, uint16_t end, uint8_t access);
>  
> -#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
> +#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI) && defined(CONFIG_MGMT_HYPERCALLS)

Here and elsewhere below you're introducing overly long lines. This may be
helped some by having

#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_MGMT_HYPERCALLS)
#ifdef CONFIG_HAS_PCI
...

>      int (*get_device_group)(uint32_t machine_bdf);
>      int (*assign_device)(struct domain *d, uint32_t machine_bdf);
>      int (*deassign_device)(struct domain *d, uint32_t machine_bdf);
>  #endif
>  
> -#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
> +#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY) && defined(CONFIG_MGMT_HYPERCALLS)

#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY

>      int (*assign_dtdevice)(struct domain *d, const char *dtpath);
>      int (*deassign_dtdevice)(struct domain *d, const char *dtpath);
>  #endif

And a double #endif here (and then similarly elsewhere).

Jan

