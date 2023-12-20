Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3450819DA0
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 12:04:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657660.1026694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuNQ-00010d-Gr; Wed, 20 Dec 2023 11:04:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657660.1026694; Wed, 20 Dec 2023 11:04:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuNQ-0000ys-Ds; Wed, 20 Dec 2023 11:04:36 +0000
Received: by outflank-mailman (input) for mailman id 657660;
 Wed, 20 Dec 2023 11:04:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFuNO-0000xC-7m
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 11:04:34 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dfd17fd-9f27-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 12:04:33 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33666946422so2822751f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 03:04:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o2-20020a5d6842000000b003367147831csm4231252wrw.108.2023.12.20.03.04.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 03:04:32 -0800 (PST)
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
X-Inumbo-ID: 8dfd17fd-9f27-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703070272; x=1703675072; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MQnS+PQhiYETEAegc7IO7ncTiF5tuHX0c9UDTtNRI4s=;
        b=QBcPE1nUdk+1ny1ouM4qng8CGjxWfE3rXY5lXXOa8j6g6pzian+O4dCLrPAiugdPRW
         HmCpEb7snP1k7/JrujA+2oPA/offiR1Lk0Vvg/82vwZfaOecFwit/nTOCEnx9wmRYpkA
         IN+9wE9VNf6im9ZfoyFVw6O2PZHQpz74wybc4a8zZUD6wxgdvtFLx9minMeG5Bhxwqsy
         kwKSl5iaNuPMWQXE8/J7nS5m2Xu8e9npa4e6584ALYSlphn3qt7amC6MkKhNUrU1260/
         TKbkoI61xw4uj/uvJchn6WFUQkHqlmkwAs2C5rt2OYuqLO1ho4/d2Y+aX1QdmbaZqBFe
         Q/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703070272; x=1703675072;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MQnS+PQhiYETEAegc7IO7ncTiF5tuHX0c9UDTtNRI4s=;
        b=EFQPhP5LckJ7uPJ5I1z7Np1fIHuNki1kGyA10mgqVl5aUuBEPEvCLefO3LOgp9x4mr
         ee3V7JEUkOv4koJTeeZnWT5xzfoJNS4kjcWQc0Ri2DrYUaJTnMkKCU579j+lfj+t78tK
         Oa3rKYRcroUUrl+GGnTmKuJeea6Nq9rjfDF8p75TjgJ4+RszqBedZQb1JTT1OSmlGsBJ
         YnggH/6Ve2ryx0QSQ0ioGHu837CJF64Zc2a9qQgH7T7C9q7D5yq4hlud753/K6lGtgmS
         qNIDfRE14HnSiR29hnGc9shuLS0/zhSxr9U9Rj0yAd8cNOpHdTZ/uLRjJbnoqlT0gGMW
         r9XQ==
X-Gm-Message-State: AOJu0YzAcEEwjAa6aMe7Gd7mALuac2YyY29hyr1weIlm0lRd2MQ/Ew0s
	hqpJdXt5tZwy+I0wSrJbIRec
X-Google-Smtp-Source: AGHT+IE/T+z9J1ekyKXopye1o5baU/kR/xWcnjmMqS0es2BVdbQnm3/7zqyGnWKwf3IRB8hpZhuU8A==
X-Received: by 2002:a05:6000:18c1:b0:333:43b6:9a5a with SMTP id w1-20020a05600018c100b0033343b69a5amr11436141wrq.78.1703070272570;
        Wed, 20 Dec 2023 03:04:32 -0800 (PST)
Message-ID: <18ff4bdd-c109-431e-a548-4d988c2072fd@suse.com>
Date: Wed, 20 Dec 2023 12:04:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 02/17] pci: introduce per-domain PCI rwlock
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
 <20231202012556.2012281-3-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20231202012556.2012281-3-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.12.2023 02:27, Volodymyr Babchuk wrote:
> Add per-domain d->pci_lock that protects access to
> d->pdev_list. Purpose of this lock is to give guarantees to VPCI code
> that underlying pdev will not disappear under feet. This is a rw-lock,
> but this patch adds only write_lock()s. There will be read_lock()
> users in the next patches.
> 
> This lock should be taken in write mode every time d->pdev_list is
> altered. All write accesses also should be protected by pcidevs_lock()
> as well. Idea is that any user that wants read access to the list or
> to the devices stored in the list should use either this new
> d->pci_lock or old pcidevs_lock(). Usage of any of this two locks will
> ensure only that pdev of interest will not disappear from under feet
> and that the pdev still will be assigned to the same domain. Of
> course, any new users should use pcidevs_lock() when it is
> appropriate (e.g. when accessing any other state that is protected by
> the said lock). In case both the newly introduced per-domain rwlock
> and the pcidevs lock is taken, the latter must be acquired first.

Shouldn't an abridged version of this also be put ...

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -461,6 +461,7 @@ struct domain
>  
>  #ifdef CONFIG_HAS_PCI
>      struct list_head pdev_list;
> +    rwlock_t pci_lock;
>  #endif

... here, for easy future reference? As locking is going to become
more complicated, documenting lock nesting rules in code is imo pretty
important.

Jan

