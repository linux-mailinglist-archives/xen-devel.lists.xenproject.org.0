Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A7585A2E2
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 13:11:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682814.1062000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc2Tu-0003Zq-8V; Mon, 19 Feb 2024 12:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682814.1062000; Mon, 19 Feb 2024 12:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc2Tu-0003XQ-5J; Mon, 19 Feb 2024 12:10:46 +0000
Received: by outflank-mailman (input) for mailman id 682814;
 Mon, 19 Feb 2024 12:10:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SL20=J4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rc2Ts-0003XK-Jg
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 12:10:44 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6fb4ae0-cf1f-11ee-98f5-efadbce2ee36;
 Mon, 19 Feb 2024 13:10:42 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33d26da3e15so1299256f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 04:10:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v15-20020a5d610f000000b0033d4cf751b2sm3533324wrt.33.2024.02.19.04.10.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 04:10:41 -0800 (PST)
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
X-Inumbo-ID: e6fb4ae0-cf1f-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708344642; x=1708949442; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Heu9x30HCReYgHfO2KlQtAZBaU5xCTZkIFS0R3dxQcQ=;
        b=YOZgxcmr2/5HTvKWX7T+L+zN92rRnSDxZkWpEt168iTzgVoywPj7b/31VjVKNJnyux
         iD29Jowa1/m2F1ELVf/2ET7+ydI1ES0qyhg4jUZKef6CodMHRKGPRuRLFmjF8QeTJC5s
         YK5SeXBQz0Al6X4cuPyF6EaXgLnKb/7/vgB8BLqrGj6T71zwfVA9v99mEM0ibGDYHqDe
         sSmHte+mLZtkZuaxnabS5dR/4WmDI/XAtdpqLyzLA1NvTaBgqog4z7GswOEgShNUhNEF
         w5yOTWFrVClntgAXA5eo+UboQx0liVG3yqDOO4RDywrm+czQZjge7gZtkOlX0pPHdLu0
         Pvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708344642; x=1708949442;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Heu9x30HCReYgHfO2KlQtAZBaU5xCTZkIFS0R3dxQcQ=;
        b=LbXpyl8mJOzlo4bDAkuxphnuOdpHYTaPrY0ZD+tig88nolI5nwiqF2k2vPYqCuLRMA
         00QtFoPs2kzYJeXP2TxQv0Qeohr1pMXcHN+62KW1+sL4InDYdYeTFN+o8t00vbofcE3X
         lqxYb+Zmg49IF2jcJfvmMo5HTmpgO69zDpf7n8axVqYW0KmcxiJKUh5PkxGN4Ss7CAA8
         5uKIrI+KNDE+9CAy9yPd57/Sptl6nZsV0Zzdte1QIZYUfqSKMpH35+hQubTdxpxhwJ6f
         4pcErMWNMPtVmjr2k8N8eqWEnJw0lpwzdc9dUzKqhBMvhADCqW4/NNozgvFxasyKabrb
         dLsw==
X-Forwarded-Encrypted: i=1; AJvYcCUNoPIDBVbpRiEfYOTEsl9CI1YW8hG3hWjgC2iZrW1/G0pmayixMqRb+c2oHJM2bIdz1uIropDEeZkhqLfjOzeoNh+5lV8Y0zCODAQBDoU=
X-Gm-Message-State: AOJu0YzngP409jgnxAgVOFo7SPnR526/Dkznm1xUEujRWO0yiWKBHIHJ
	nSBxySU/jvCFkJhBY79n0GNOGuJXD6jbZz/vjoKgjLVFd2kQTWwcgg/zr5OonA==
X-Google-Smtp-Source: AGHT+IGRhPtngdLBWD6Dgm0XilfW4EEsMCOyVNL8DfxqJtdu/g2E2uiwhO6CncTHMDqqKkoPJ4GHZA==
X-Received: by 2002:adf:efd2:0:b0:33d:201f:ea9d with SMTP id i18-20020adfefd2000000b0033d201fea9dmr7276183wrp.2.1708344641568;
        Mon, 19 Feb 2024 04:10:41 -0800 (PST)
Message-ID: <8e807612-fd14-4d01-b200-1deb583afa22@suse.com>
Date: Mon, 19 Feb 2024 13:10:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13.2 01/14] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
 <20240202213321.1920347-2-stewart.hildebrand@amd.com>
 <20240219114750.151730-1-stewart.hildebrand@amd.com>
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
In-Reply-To: <20240219114750.151730-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.02.2024 12:47, Stewart Hildebrand wrote:
> @@ -895,6 +891,15 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>  {
>      unsigned int i;
>  
> +    /*
> +     * Assert that d->pdev_list doesn't change. ASSERT_PDEV_LIST_IS_READ_LOCKED
> +     * is not suitable here because it may allow either pcidevs_lock() or
> +     * d->pci_lock to be held, but here we rely on d->pci_lock being held, not
> +     * pcidevs_lock().
> +     */
> +    ASSERT(rw_is_locked(&msix->pdev->domain->pci_lock));
> +    ASSERT(spin_is_locked(&msix->pdev->vpci->lock));

There's no "d" in sight here, so it's a little odd that "d" is being talked
about. But I guess people can infer what's meant without too much trouble.

> @@ -313,17 +316,36 @@ void vpci_dump_msi(void)
>                  {
>                      /*
>                       * On error vpci_msix_arch_print will always return without
> -                     * holding the lock.
> +                     * holding the locks.
>                       */
>                      printk("unable to print all MSI-X entries: %d\n", rc);
> -                    process_pending_softirqs();
> -                    continue;
> +                    goto pdev_done;
>                  }
>              }
>  
> +            /*
> +             * Unlock locks to process pending softirqs. This is
> +             * potentially unsafe, as d->pdev_list can be changed in
> +             * meantime.
> +             */
>              spin_unlock(&pdev->vpci->lock);
> +            read_unlock(&d->pci_lock);
> +        pdev_done:
>              process_pending_softirqs();
> +            if ( !read_trylock(&d->pci_lock) )
> +            {
> +                printk("unable to access other devices for the domain\n");
> +                goto domain_done;
> +            }
>          }
> +        read_unlock(&d->pci_lock);
> +    domain_done:
> +        /*
> +         * We need this label at the end of the loop, but some
> +         * compilers might not be happy about label at the end of the
> +         * compound statement so we adding an empty statement here.
> +         */
> +        ;

As to "some compilers": Are there any which accept a label not followed
by a statement? Depending on the answer, this comment may be viewed as
superfluous. Or else I'd ask about wording: Besides a grammar issue I
also don't view it as appropriate that a comment talks about "adding"
something when its adjacent code that is meant. That something is there
when the comment is there, hence respective wording should imo be used.

> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -171,6 +171,19 @@ void pcidevs_lock(void);
>  void pcidevs_unlock(void);
>  bool __must_check pcidevs_locked(void);
>  
> +#ifndef NDEBUG
> +/*
> + * Check to ensure there will be no changes to the entries in d->pdev_list (but
> + * not the contents of each entry).
> + * This check is not suitable for protecting other state or critical regions.
> + */
> +#define ASSERT_PDEV_LIST_IS_READ_LOCKED(d)                               \
> +        /* NB: d may be evaluated multiple times, or not at all */       \
> +        ASSERT(pcidevs_locked() || ((d) && rw_is_locked(&(d)->pci_lock)))

Is there actually any case where d can be NULL here?

> +#else
> +#define ASSERT_PDEV_LIST_IS_READ_LOCKED(d) ({ (void)(d); })

Evaluating d here isn't very useful when the assertion expression doesn't
guarantee single evaluation. Plus even if it needed evaluating, there would
be no need to use a compiler extension here:

#define ASSERT_PDEV_LIST_IS_READ_LOCKED(d) ((void)(d))

Jan

