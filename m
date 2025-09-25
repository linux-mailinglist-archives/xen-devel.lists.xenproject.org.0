Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C95EB9DB97
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 08:50:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129984.1469655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1fo2-0007g0-LB; Thu, 25 Sep 2025 06:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129984.1469655; Thu, 25 Sep 2025 06:50:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1fo2-0007eE-I0; Thu, 25 Sep 2025 06:50:18 +0000
Received: by outflank-mailman (input) for mailman id 1129984;
 Thu, 25 Sep 2025 06:50:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1fo1-0007e8-BX
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 06:50:17 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e41db2a6-99db-11f0-9809-7dc792cee155;
 Thu, 25 Sep 2025 08:50:15 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-62fbc90e6f6so873297a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Sep 2025 23:50:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3545991dcdsm99559266b.92.2025.09.24.23.50.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 23:50:14 -0700 (PDT)
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
X-Inumbo-ID: e41db2a6-99db-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758783015; x=1759387815; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iFUQSlpWaroYSYw75Hr7KvAGMNXe6nKQPNtGFl/1BPg=;
        b=V9i1s53m4H0QcAhBwJpEmkVq6Eptg3Ze88N4ex8wnbawfUjNjjRLHktOK722BvDeBI
         L7kyVlAsOA7y7g5PPQyf4gXFM/c7F5eEieNVlqIPi5agHTx5Zsbi2ve729IxCxO5RrN6
         7tYAU/R4MRhef5ULawgKA/Y/XtSAgiK8Lqzh/+rQ/PO5dRIbXcyPNCkuNneEP39hJo7d
         2AcvA8BZFKbb/7mU0PV5WKR+LIb15R0EgM1XAXtSUV1V6f+oCQAQSV3v+lF4tlkVuQV5
         NlCtJNZuJ0PnI2Hv0Zvris0mjKCGnFx0Ixbx2jNNqREiMxyJDaxtZaGFbmRU6hTNKNo+
         7sJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758783015; x=1759387815;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFUQSlpWaroYSYw75Hr7KvAGMNXe6nKQPNtGFl/1BPg=;
        b=HtkcROtewOROEt91cvfm4/fgUWblllPBIialVLDuQzyYj7E0JPfG7DU8RCtvtFFyvW
         /G3Ie/ZBnb9aMdargwZHdqRf2GWn4NtUHq3l946Xu94yLVRDpSFUArnN5z/sQyedxAlZ
         BQxkeSE6BMagXaavYIGsvuF7BpOst6fAeo1Tgc0lfQeOlrSeGdNIEGmXMippEFxZrYY5
         qU7dyshbtFblm1+Xb9jWqwIEjrU7A5k9yqG2324K7/f4DvXKZZqQ4QyWO3rR+Ko/DFmc
         wjZRXIw7Y/RfiUOg7d7VXtAQrUp5OWztqhtb1celQdzW0Is5araFy+/K0/9NGkRwo80r
         plHA==
X-Forwarded-Encrypted: i=1; AJvYcCV3pUzR4PzeHp9D4JvZUmDjGNfkYusZKTLK2nWylnbXWIsiaIBVw/tysi6i+lMQtGbGNg1DW83pf2U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwaV+DpChE8LaOODG58csbcu3i2Nk5YvGs9Ox13nEKCm+Dfnjnw
	4MhMma2kesKjsbbgIyopEZJf6BzRmRn8e9InnfdA/Diz/mXg1eRSJKKgZ6On2O/0rA==
X-Gm-Gg: ASbGnct6PA6LRZbzzeKA7c4EeBJxMO0XDIiHvROVFmI4eEId2EGu79UT0Xvn5Zwqssw
	XpT8HMRWXIwlWwy9ABR16fPvar4EKh4lPeNY6paE+JLZzVXWQwO7lXuJUMJkZlXiZPuGyLLBtoA
	gXtlDpAh014yCdm7VMDE5pHuHnjJZTj6LFxAmSumd9CE8m55bVsuIqpOFn7SMttl16WloEW+oYl
	KE2nsIM3aMR5JmZEIsnSaQ1RQYW57KBnNp1nuiOTN7COHLommCgKzFAQvVcdhoitd/HQMcZT7IH
	acDvwJcrqxCUqQlTxiVE7XHaun/j9J9yoHXfDOVrrPdPMXX1uK1NYkpy59z0qNz7RNkLll+NVkM
	pdx+GUxfktubfOrA/jHYNZ0AdE4+MEn4fX/Lulzwoj4b4u/+BR+zenwuRvfPbZnxTVCzxstQf75
	PXxp9yYio=
X-Google-Smtp-Source: AGHT+IErGt9RwqYcUfVWMmOam1RilUB2C7WuL1zrDzr1knQGknniBgOl8CpascIonP4GYMJut5eQVw==
X-Received: by 2002:a17:907:9407:b0:b2b:f498:e2f9 with SMTP id a640c23a62f3a-b34bd443af5mr262775366b.60.1758783014781;
        Wed, 24 Sep 2025 23:50:14 -0700 (PDT)
Message-ID: <2a881ace-eddc-4656-9e3b-3784cbcb6c17@suse.com>
Date: Thu, 25 Sep 2025 08:50:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/8] xen/pci: update DT for hwdom when it uses vpci
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Luca Fancellu <luca.fancellu@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1758618839.git.mykyta_poturai@epam.com>
 <f3efda4a607fe430f6620311ced6878e7c9b4c9b.1758618839.git.mykyta_poturai@epam.com>
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
In-Reply-To: <f3efda4a607fe430f6620311ced6878e7c9b4c9b.1758618839.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.09.2025 09:59, Mykyta Poturai wrote:
> --- a/xen/arch/x86/include/asm/pci.h
> +++ b/xen/arch/x86/include/asm/pci.h
> @@ -76,4 +76,10 @@ int pci_sanitize_bar_memory(struct rangeset *r);
>  
>  void pci_setup(void);
>  
> +/* Unlike ARM, HW domain does not ever use vpci for x86 */

What did you derive this from? PVH Dom0 very well uses vPCI. In fact that's
what it was first introduced for, iirc.

Jan

> +static inline bool hwdom_uses_vpci(void)
> +{
> +    return false;
> +}
> +
>  #endif /* __X86_PCI_H__ */


