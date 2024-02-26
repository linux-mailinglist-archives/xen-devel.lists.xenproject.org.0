Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A368678F1
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 15:47:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685591.1066550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1recGJ-0007Zk-3T; Mon, 26 Feb 2024 14:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685591.1066550; Mon, 26 Feb 2024 14:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1recGJ-0007Xx-0R; Mon, 26 Feb 2024 14:47:23 +0000
Received: by outflank-mailman (input) for mailman id 685591;
 Mon, 26 Feb 2024 14:47:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1recGH-0007Xr-LL
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 14:47:21 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0e348d0-d4b5-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 15:47:19 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5640fef9fa6so4087958a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 06:47:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g14-20020a056402320e00b00564e4debe29sm2423346eda.78.2024.02.26.06.47.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 06:47:18 -0800 (PST)
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
X-Inumbo-ID: f0e348d0-d4b5-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708958839; x=1709563639; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z3XJgoMYHrTLdYZwssR39Cz6lXZjPT6Pt62MCOp6UDs=;
        b=ADqIoZzAJ3SHZkxM06M1zbxWuyy2VI1HSvqcfQcGLXWsu14U1HFtVTYZ732I0H0ViN
         wDXGhO28ahnE7nvruwUZQtF/1gKUrjSON6z4ON6Ws0OIgWiMjt4tdy5pYKtOE+yQbiTb
         TB1QL2IO7EAs/TxZqGifmnpExVbAjFpQdWL4Q5ZppjrDyqizbmXWVGqPPDgzSGVZC47P
         2vDVJfBjr1UxjcetkNG+bDfcsi7cnBUwo6LQlSyuS7k4MFPRkOLtNX47BdVPyfjA8wji
         IUeA9OGceyW2rjsPbj0qzWonmskod6YQcQUpw7xbfcm6DjfoIr94z1zXDJb32/Ye/eke
         emFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708958839; x=1709563639;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3XJgoMYHrTLdYZwssR39Cz6lXZjPT6Pt62MCOp6UDs=;
        b=A4vk4SsmR2Eap7kfWCRQNOEfWDUysJNBXtoS6xrJSIwVTMbW0ANpU1v9SA4RakFQ73
         t11fra2oqWidUz0R3DsSyJF0Os223qngZh2zC5YW5JElmzfDReMii6Uzokx+4FtFkBbW
         0rrDYuAA00FWJpb8eqbXcJchiB1Zp/R30Vc1ikxPragy6QW07cygiW/1+uv4C+t3E2i0
         jWJIbfHE58m7GnUznm1OLlU+tBtcoo9bli/G4z4uSF3u6UdZkG2/CeoqBOY2k51s39Kd
         kgEN3iwAoVRIX9wJ4LmXpXM9mYITkRcfv9I1/3fVQz8GTgsMGPhB5SHLHdIjTnr5jN67
         Xfvg==
X-Forwarded-Encrypted: i=1; AJvYcCXlTbY2fF+ab9eyxVrBgyWrwPq9vhzUjG03GK+qG4dVWJHrYEmzNryD2LGJKxCVOcact1ivTY4g4xwjsDPdIg78Hzso7lMrkVDc5ZDQe9I=
X-Gm-Message-State: AOJu0Yx+I1faDd+RI39aOCPZGGsrBvR6b9Ii+TIZE6d+dwKzjgYRIzEl
	p196jrXFawOI72gpmNqpBTC5kZEhMrZAJ8Ey39kwK1iIZE2mG0LQUmMPaOzULA==
X-Google-Smtp-Source: AGHT+IEFZ7hgnAtH6j0a4SYKRjEADqXNEyuZQmLKR8RC1Q/hSqSQ2gc15lqkPXWwXjREi3cJJXW/7Q==
X-Received: by 2002:a05:6402:5246:b0:565:e282:33d8 with SMTP id t6-20020a056402524600b00565e28233d8mr3121954edd.38.1708958838669;
        Mon, 26 Feb 2024 06:47:18 -0800 (PST)
Message-ID: <6024f2c9-90e6-4ce9-a421-c0ec7441a926@suse.com>
Date: Mon, 26 Feb 2024 15:47:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13.3 01/14] vpci: use per-domain PCI lock to protect vpci
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
 <20240221024504.357840-1-stewart.hildebrand@amd.com>
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
In-Reply-To: <20240221024504.357840-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.02.2024 03:45, Stewart Hildebrand wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Use the per-domain PCI read/write lock to protect the presence of the
> pci device vpci field. This lock can be used (and in a few cases is used
> right away) so that vpci removal can be performed while holding the lock
> in write mode. Previously such removal could race with vpci_read for
> example.
> 
> When taking both d->pci_lock and pdev->vpci->lock, they should be
> taken in this exact order: d->pci_lock then pdev->vpci->lock to avoid
> possible deadlock situations.
> 
> 1. Per-domain's pci_lock is used to protect pdev->vpci structure
> from being removed.
> 
> 2. Writing the command register and ROM BAR register may trigger
> modify_bars to run, which in turn may access multiple pdevs while
> checking for the existing BAR's overlap. The overlapping check, if
> done under the read lock, requires vpci->lock to be acquired on both
> devices being compared, which may produce a deadlock. It is not
> possible to upgrade read lock to write lock in such a case. So, in
> order to prevent the deadlock, use d->pci_lock in write mode instead.
> 
> All other code, which doesn't lead to pdev->vpci destruction and does
> not access multiple pdevs at the same time, can still use a
> combination of the read lock and pdev->vpci->lock.
> 
> 3. Drop const qualifier where the new rwlock is used and this is
> appropriate.
> 
> 4. Do not call process_pending_softirqs with any locks held. For that
> unlock prior the call and re-acquire the locks after. After
> re-acquiring the lock there is no need to check if pdev->vpci exists:
>  - in apply_map because of the context it is called (no race condition
>    possible)
>  - for MSI/MSI-X debug code because it is called at the end of
>    pdev->vpci access and no further access to pdev->vpci is made
> 
> 5. Use d->pci_lock around for_each_pdev and pci_get_pdev()
> while accessing pdevs in vpci code.
> 
> 6. Switch vPCI functions to use per-domain pci_lock for ensuring pdevs
> do not go away. The vPCI functions call several MSI-related functions
> which already have existing non-vPCI callers. Change those MSI-related
> functions to allow using either pcidevs_lock() or d->pci_lock for
> ensuring pdevs do not go away. Holding d->pci_lock in read mode is
> sufficient. Note that this pdev protection mechanism does not protect
> other state or critical sections. These MSI-related functions already
> have other race condition and state protection mechanims (e.g.
> d->event_lock and msixtbl RCU), so we deduce that the use of the global
> pcidevs_lock() is to ensure that pdevs do not go away.
> 
> 7. Introduce wrapper construct, pdev_list_is_read_locked(), for checking
> that pdevs do not go away. The purpose of this wrapper is to aid
> readability and document the intent of the pdev protection mechanism.
> 
> 8. When possible, the existing non-vPCI callers of these MSI-related
> functions haven't been switched to use the newly introduced per-domain
> pci_lock, and will continue to use the global pcidevs_lock(). This is
> done to reduce the risk of the new locking scheme introducing
> regressions. Those users will be adjusted in due time. One exception
> is where the pcidevs_lock() in allocate_and_map_msi_pirq() is moved to
> the caller, physdev_map_pirq(): this instance is switched to
> read_lock(&d->pci_lock) right away.
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with two small remaining remarks (below) and on the assumption that an
R-b from Roger in particular for the vPCI code is going to turn up
eventually.

> @@ -895,6 +891,15 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>  {
>      unsigned int i;
>  
> +    /*
> +     * Assert that pdev_list doesn't change. ASSERT_PDEV_LIST_IS_READ_LOCKED
> +     * is not suitable here because it may allow either pcidevs_lock() or
> +     * pci_lock to be held, but here we rely on pci_lock being held, not
> +     * pcidevs_lock().
> +     */
> +    ASSERT(rw_is_locked(&msix->pdev->domain->pci_lock));
> +    ASSERT(spin_is_locked(&msix->pdev->vpci->lock));

As to the comment, I think it's not really "may". I also think referral to
...

> @@ -913,13 +918,23 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>              struct pci_dev *pdev = msix->pdev;
>  
>              spin_unlock(&msix->pdev->vpci->lock);
> +            read_unlock(&pdev->domain->pci_lock);
>              process_pending_softirqs();
> +
> +            if ( !read_trylock(&pdev->domain->pci_lock) )
> +                return -EBUSY;
> +
>              /* NB: we assume that pdev cannot go away for an alive domain. */
>              if ( !pdev->vpci || !spin_trylock(&pdev->vpci->lock) )
> +            {
> +                read_unlock(&pdev->domain->pci_lock);
>                  return -EBUSY;
> +            }
> +
>              if ( pdev->vpci->msix != msix )
>              {
>                  spin_unlock(&pdev->vpci->lock);
> +                read_unlock(&pdev->domain->pci_lock);
>                  return -EAGAIN;
>              }
>          }

... this machinery would be quite helpful (and iirc you even had such in an
earlier version).

> @@ -313,17 +316,31 @@ void vpci_dump_msi(void)
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
> +        ;

I think a blank line ahead of this label and perhaps also ahead of
"pdev_done" would be quite nice.

I guess respective adjustments could be done while committing, provided
there's not going to be any other reason for yet another revision.

Jan

