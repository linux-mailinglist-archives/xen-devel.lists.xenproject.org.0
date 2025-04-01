Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4DFA77ADB
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 14:24:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933967.1335818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzafC-0002Au-SB; Tue, 01 Apr 2025 12:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933967.1335818; Tue, 01 Apr 2025 12:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzafC-00028f-P0; Tue, 01 Apr 2025 12:24:18 +0000
Received: by outflank-mailman (input) for mailman id 933967;
 Tue, 01 Apr 2025 12:24:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzafA-00028I-Ny
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 12:24:16 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a0e8fa7-0ef4-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 14:24:15 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3914a5def6bso3097616f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 05:24:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e33asm14163357f8f.66.2025.04.01.05.24.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 05:24:14 -0700 (PDT)
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
X-Inumbo-ID: 3a0e8fa7-0ef4-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743510255; x=1744115055; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NG3GHntTYPBQ4J0/UTfJ45c6gyMAT8x80KJMDD/TFBI=;
        b=TsX4YXWknyAB+2A+6VLgS1dCTVybZdzS12IamNrXQP1fm6OW4qytWrUdG6EtLn3PtM
         S0po8xzMHPyQJos9u9UCRCgRLXPUM34PI8BdlsDhwT8TQVmRdAu0Q4MGiWbMEHMz4x+J
         gygqVz8MVEGB4dHAHDBluS/YjF3mlpb/O18wpnpqeaHir4j34HwrY0k40IkTW9bfAbUJ
         VIzEH57NB3aX6iDC//QJyWWeaYs9PkH962qARXL71lnBwNRZt4XnACGUGAkxG4ExUAbb
         9qN/yHfTciArjPIX7Br1qMUa4zsgs77LAGqsEZcTahCiVhp0K/J5zOp7D9ajDiDf124a
         wRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743510255; x=1744115055;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NG3GHntTYPBQ4J0/UTfJ45c6gyMAT8x80KJMDD/TFBI=;
        b=ol7FH18YJOH6Ws0a8bJUoUAzs0cM0xFMgEXYB+6S931zH/8nzhoOFy15e47k6q4Ne7
         TW6WfGHPwpPRD8yiwyTxzB2arNjwgxqXzHfvbsyh1QoEzk8PJT+PO3ikKU9CSV/YY16u
         Sl0VcXaDnegpRzacp/YDX9MWPfDTyqvPtSlmIUHdNR8pO2AVQRJH2vDql/tBPSViSVbN
         o+Br0KLDTY86PHNbTkWJYXRfrr0zG6UA/JInGQspL55mC2GxK8jImAhQOR9H2hZnEbQo
         mHCGuypDcnDUrna+vj4Z4gRtnc/aKtjRwr4abpz95USIr0aCNwMVbT90QlDFC7HK38ZF
         X8NQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0gWzma0tkLWr8d69+k+8FJoFZfaXWPAsAGHxo20HAktlnp0fxzaFGnfggPVS+swiQ1TdnGNZ0CLw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3K4zQZCxfs0GC33qxmVv9V3irnLbgLcOWQGfbjfC52IXb4yRl
	6DxHcrhftt78fkGluItfvWS0StFvpVnKUWIz9Ozh0f1cKzIHAHYKjrLO4I59kQ==
X-Gm-Gg: ASbGncvKCt9t7JIP+5HFLBeVUX2JP9/E4zoPLbtCStMLmxsUN9EvxlYc4NDQlzHxYjJ
	IupCdJzDmd17oxOLvNkEo46W2g0flV28bkVAEChyefNKxEegADgeBi+JliUpGi68W49DbAFwdVX
	mt3PRzeJic705aAW/TG1uQfhlLULjcgUcAAI2khJVm5zIYni4gDPsGIH9Povll5atuuiKgVBHl4
	aO+FaZqu/3t8zTtPAJjUmZ7RZwT78X1E2hkpCXq8fIo+CYEib6nsSVfBA7xkekwmbkEnGcqzheH
	HL8ZlkIUYesFZbTswz+UX53BmsWknbr13tlGJn79gpF2i8ye6fyzrpR/ug2jA0bzA1Csj+vuBE/
	uve4JW8n7/pILHNjs8GADd/IZVSnetQ==
X-Google-Smtp-Source: AGHT+IHpHdtykKUfHQC4Vd8c9qZ/pFruzPe4SK+4h9JYOtfBIkbjZTffQQbnc8IFVqFHd7y8DCWqhQ==
X-Received: by 2002:a5d:6d83:0:b0:38d:de45:bf98 with SMTP id ffacd0b85a97d-39c120cb898mr9117869f8f.8.1743510255260;
        Tue, 01 Apr 2025 05:24:15 -0700 (PDT)
Message-ID: <aead1e5f-8c3e-4579-94f3-6e75c77db0e0@suse.com>
Date: Tue, 1 Apr 2025 14:24:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/19] xen/sysctl: wrap around XEN_SYSCTL_readconsole
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
 <20250326055053.3313146-5-Penny.Zheng@amd.com>
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
In-Reply-To: <20250326055053.3313146-5-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2025 06:50, Penny Zheng wrote:
> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -58,6 +58,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>  
>      switch ( op->cmd )
>      {
> +#ifdef CONFIG_SYSCTL
>      case XEN_SYSCTL_readconsole:
>          ret = xsm_readconsole(XSM_HOOK, op->u.readconsole.clear);
>          if ( ret )
> @@ -66,6 +67,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>          ret = read_console_ring(&op->u.readconsole);
>          break;
>  
> +#endif /* CONFIG_SYSCTL */
>      case XEN_SYSCTL_tbuf_op:

Nit: Can the #endif please live ahead of the blank line?

Jan

