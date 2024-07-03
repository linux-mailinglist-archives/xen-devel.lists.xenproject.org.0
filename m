Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E994C926057
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 14:31:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752994.1161243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOz81-00006Z-HI; Wed, 03 Jul 2024 12:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752994.1161243; Wed, 03 Jul 2024 12:30:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOz81-0008WM-Ef; Wed, 03 Jul 2024 12:30:29 +0000
Received: by outflank-mailman (input) for mailman id 752994;
 Wed, 03 Jul 2024 12:30:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOz80-0008WG-1k
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 12:30:28 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06b632ea-3938-11ef-bbf9-fd08da9f4363;
 Wed, 03 Jul 2024 14:30:26 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ee794ebffbso24191101fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 05:30:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-708043b703fsm10626228b3a.145.2024.07.03.05.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 05:30:25 -0700 (PDT)
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
X-Inumbo-ID: 06b632ea-3938-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720009826; x=1720614626; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jIs/RD86rfiEWfOtxTqw8StoW+1prqpqUXKoTVtcBZY=;
        b=Gm2inqs7FOyhnNvz9bMnYFiV+qECeGVknSdUCDpMvn1XAUZyDJhJf22kKy+D6jBf4N
         59jyR9NBw3S+Ta+yTU0YFjeSfuu3itAydo+wsb1P+NCcZXIdgfXv8XBSnLyz3UclWaLI
         QnEJBQGo5DEmlsJy+wIK2+xB6kDSJ1Zlh73F8uw1bGhDI2fNjNRrC11dWa9C59LySjqW
         Tw9AAR+YSPjIxGwai0cTEN+ghclyu3vuDreHhasDUGsis/eGNWf/b0LLRKFu9miB8X0D
         qHy7I8U9O5M7ZI+lN8veEigkFNILwNNkpHwr6j+vRbpSQiT6BeoMKLSWycQK8/F4a6aI
         n6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720009826; x=1720614626;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIs/RD86rfiEWfOtxTqw8StoW+1prqpqUXKoTVtcBZY=;
        b=jmkUk5/5DogtIXXMGHenTDpz2MZKVUezkwBpU8wcrjvXrDiaSpl6NvmD77aF54j5RC
         UGmNV/+aQMkx163LL+lBdSxDh0f+Udi0ejglfPR+z+kSWvrFl1ovbpolExRVrzMHp7Tb
         hpI/J4t6UwwVzGYOna/f4qL+GJ5poswxbGRVIBn31WOJQ86/BtJ4OkJ1fNzr9Cb6JlpK
         jlAeWNYfWBtnor226JG+bqBxcmVFDHxNq900t16ZmaQQ89V7q6BVxdmz9joP9s5gzPmJ
         nDGYmjleSvEjVzzjqZqDicC2FhV52gMaEqA4st2WLSvrZnGlORE0ZLeL7hihmXRJEddj
         qe4g==
X-Forwarded-Encrypted: i=1; AJvYcCUqymjdDqJHOKFBvjQH65uN2tT24Ol2tPwaMdGjLfRrmcITo1rxadCCUlGFKtIY+RNj2Ze7jajnTGeldBqk2eXFJvXWoATz8Rp6aP56vf8=
X-Gm-Message-State: AOJu0YwcdaEaEwbzlGhQt+95aj13d27/QePdQtNvnhirvngtxrQk9Qs4
	XhGXkzCxd7Fo6UifZDQa6imYN/uRlOPgSiDUkuBo3rfN2W6RqD6pEFl2TvpejA==
X-Google-Smtp-Source: AGHT+IGL/jzsUxno5yOuxoOWN5UDyggTx7dZS7tAzY9YM3TdlmKG4hQOtW5clDzewpQxuFJ0GqCoQQ==
X-Received: by 2002:a05:651c:549:b0:2ec:1e6e:13f9 with SMTP id 38308e7fff4ca-2ee5e707c78mr94189351fa.52.1720009826194;
        Wed, 03 Jul 2024 05:30:26 -0700 (PDT)
Message-ID: <5f31aa96-52a8-413a-8c10-0ad01d095be9@suse.com>
Date: Wed, 3 Jul 2024 14:30:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/17] xen: address violations of MISRA C:2012 Directive
 4.10
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: nicola.vetrini@bugseng.com, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
 <76caa62c49a7aa02e43892f9edd72d90e9f39243.1719829101.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <76caa62c49a7aa02e43892f9edd72d90e9f39243.1719829101.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.07.2024 15:36, Alessandro Zucchelli wrote:
> --- a/xen/include/xen/err.h
> +++ b/xen/include/xen/err.h
> @@ -1,5 +1,6 @@
> -#if !defined(__XEN_ERR_H__) && !defined(__ASSEMBLY__)
> -#define __XEN_ERR_H__
> +#ifndef INCLUDE_XEN_ERR_H
> +#define INCLUDE_XEN_ERR_H

There once was a document (or was it a patch description) describing the
naming system for these guards. Where did that go? With include files
typically living under include/, seeing INCLUDE_ as a prefix is, well,
odd and unnecessary baggage. I also don't recall there having been
agreement to use names like the ones presented here.

Jan

> +#ifndef __ASSEMBLY__
>  
>  #include <xen/compiler.h>
>  #include <xen/errno.h>
> @@ -41,4 +42,5 @@ static inline int __must_check PTR_RET(const void *ptr)
>  	return IS_ERR(ptr) ? PTR_ERR(ptr) : 0;
>  }
>  
> -#endif /* __XEN_ERR_H__ */
> +#endif /* __ASSEMBLY__ */
> +#endif /* INCLUDE_XEN_ERR_H */
> diff --git a/xen/include/xen/pci_ids.h b/xen/include/xen/pci_ids.h
> index e798477a7e..8e40c78db7 100644
> --- a/xen/include/xen/pci_ids.h
> +++ b/xen/include/xen/pci_ids.h
> @@ -1,3 +1,6 @@
> +#ifndef INCLUDE_XEN_PCI_IDS_H
> +#define INCLUDE_XEN_PCI_IDS_H
> +
>  #define PCI_VENDOR_ID_AMD                0x1022
>  
>  #define PCI_VENDOR_ID_NVIDIA             0x10de
> @@ -11,3 +14,5 @@
>  #define PCI_VENDOR_ID_BROADCOM           0x14e4
>  
>  #define PCI_VENDOR_ID_INTEL              0x8086
> +
> +#endif /* INCLUDE_XEN_PCI_IDS_H */
> diff --git a/xen/include/xen/softirq.h b/xen/include/xen/softirq.h
> index 33d6f2ecd2..90d4875df7 100644
> --- a/xen/include/xen/softirq.h
> +++ b/xen/include/xen/softirq.h
> @@ -1,5 +1,6 @@
> -#if !defined(__XEN_SOFTIRQ_H__) && !defined(__ASSEMBLY__)
> -#define __XEN_SOFTIRQ_H__
> +#ifndef INCLUDE_XEN_SOFTIRQ_H
> +#define INCLUDE_XEN_SOFTIRQ_H
> +#ifndef __ASSEMBLY__
>  
>  /* Low-latency softirqs come first in the following list. */
>  enum {
> @@ -40,4 +41,5 @@ void cpu_raise_softirq_batch_finish(void);
>   */
>  void process_pending_softirqs(void);
>  
> -#endif /* __XEN_SOFTIRQ_H__ */
> +#endif /* __ASSEMBLY__ */
> +#endif /* INCLUDE_XEN_SOFTIRQ_H */
> diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
> index 0c16baa85f..ec1b6b05e9 100644
> --- a/xen/include/xen/vmap.h
> +++ b/xen/include/xen/vmap.h
> @@ -1,5 +1,6 @@
> -#if !defined(__XEN_VMAP_H__) && defined(VMAP_VIRT_START)
> -#define __XEN_VMAP_H__
> +#ifndef INCLUDE_XEN_VMAP_H
> +#define INCLUDE_XEN_VMAP_H
> +#ifdef VMAP_VIRT_START
>  
>  #include <xen/mm-frame.h>
>  #include <xen/page-size.h>
> @@ -42,4 +43,5 @@ static inline void vm_init(void)
>      vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, arch_vmap_virt_end());
>  }
>  
> -#endif /* __XEN_VMAP_H__ */
> +#endif /* VMAP_VIRT_START */
> +#endif /* INCLUDE_XEN_VMAP_H */


