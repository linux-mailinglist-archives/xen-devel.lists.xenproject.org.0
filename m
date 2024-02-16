Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 117E5857BFC
	for <lists+xen-devel@lfdr.de>; Fri, 16 Feb 2024 12:45:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682168.1061263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raweM-000832-8C; Fri, 16 Feb 2024 11:45:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682168.1061263; Fri, 16 Feb 2024 11:45:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raweM-00081V-5Q; Fri, 16 Feb 2024 11:45:02 +0000
Received: by outflank-mailman (input) for mailman id 682168;
 Fri, 16 Feb 2024 11:45:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dcAy=JZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1raweL-00081P-Dc
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2024 11:45:01 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0650744-ccc0-11ee-8a4f-1f161083a0e0;
 Fri, 16 Feb 2024 12:44:59 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3394bec856fso1806640f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 Feb 2024 03:44:59 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 n22-20020ac86756000000b0042c7a76d267sm1455048qtp.36.2024.02.16.03.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 03:44:58 -0800 (PST)
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
X-Inumbo-ID: d0650744-ccc0-11ee-8a4f-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708083899; x=1708688699; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EqReswirfy9NFpG8T6pUC1gDvTEd0yiHeelX55cUq6g=;
        b=NXL07pSoAD7TqafC5zJIjBbFkvfSfAjb/tI7ZMm5ud1lq2GEeyVB2h2nb9aPqrhUP9
         kbBrHPhirplt0KD3+6M1+oV7GOcit1j4gGzb7tFdi4DC/N9nM/6yk6lI3jhuFM8WJ+ZL
         ajp3J1cDbHX2Rn1OGCQ9RT9YRS4j7Tul03J+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708083899; x=1708688699;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EqReswirfy9NFpG8T6pUC1gDvTEd0yiHeelX55cUq6g=;
        b=G6zCgEFhW9uS/1C1kZ1LepOm6aK0BfVhyJwzWWb29dEwyl6ytF+72UuTrVJ9M5Xd+Q
         SllHNKho95xSvbcKdNq7FWKAw3KdR/kERMi12mzg64YqearFdtUi6q1q8IqJd0ulxuuK
         naAhCXYppSXlR3rveGe9kUJgzxv2Rdr4Q7JPvJCfEFP3RlvE4SX4lEyMEUip0cwBsOuj
         2WL28dF9do/tY6/AIvznTvRKpR1J+ULzB/2zVi494STVEOt8ak4YQZh+8hk2Y6XldPVE
         3YyaoOLpkDLrZ+snrf9Aucs6uByN54uvgmGNd9i9v7dqHFstRWc0Hk0CDx6s/DR+FC5g
         0xIA==
X-Gm-Message-State: AOJu0Yzr3dRD3dIVKK+wkOfn4FFMfrZ/9Z2iGyPYE+p6UyvwydCoylH0
	ysVd3+7CLaJtSe6XCXO7130dQaysdti9iKz/1YQIW3/KXjPNYbLh/AfCpMOtwrM=
X-Google-Smtp-Source: AGHT+IFQn7SHyIzL2g0AB63oqNeJvuP1Csiyus5Qw88UebQaaQ8XfzwM8wd/CENBbmuaId9butHWcQ==
X-Received: by 2002:adf:cd06:0:b0:33c:deef:ac2d with SMTP id w6-20020adfcd06000000b0033cdeefac2dmr6586910wrm.31.1708083899311;
        Fri, 16 Feb 2024 03:44:59 -0800 (PST)
Date: Fri, 16 Feb 2024 12:44:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v13.1 01/14] vpci: use per-domain PCI lock to protect
 vpci structure
Message-ID: <Zc9KuCeoOciUdqTN@macbook>
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
 <20240202213321.1920347-2-stewart.hildebrand@amd.com>
 <20240215203001.1816811-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240215203001.1816811-1-stewart.hildebrand@amd.com>

On Thu, Feb 15, 2024 at 03:30:00PM -0500, Stewart Hildebrand wrote:
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

A couple of questions and the pdev_list_is_read_locked() needs a small
adjustment.

> @@ -895,6 +891,14 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>  {
>      unsigned int i;
>  
> +    /*
> +     * Assert that d->pdev_list doesn't change. pdev_list_is_read_locked() is
> +     * not suitable here because we may read_unlock(&pdev->domain->pci_lock)
> +     * before returning.

I'm confused by this comment, as I don't see why it matters that the
lock might be lock before returning.  We need to ensure the lock is
taken at the time of the assert, and hence pdev_list_is_read_locked()
can be used.

> +     */
> +    ASSERT(rw_is_locked(&msix->pdev->domain->pci_lock));
> +    ASSERT(spin_is_locked(&msix->pdev->vpci->lock));
> +
>      for ( i = 0; i < msix->max_entries; i++ )
>      {
>          const struct vpci_msix_entry *entry = &msix->entries[i];
> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> index aabc5465a7d3..9f31cb84c9f3 100644
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -171,6 +171,20 @@ void pcidevs_lock(void);
>  void pcidevs_unlock(void);
>  bool __must_check pcidevs_locked(void);
>  
> +#ifndef NDEBUG
> +/*
> + * Check for use in ASSERTs to ensure there will be no changes to the entries
> + * in d->pdev_list (but not the contents of each entry).
> + * This check is not suitable for protecting other state or critical regions.
> + */
> +#define pdev_list_is_read_locked(d) ({                             \
> +        /* NB: d may be evaluated multiple times, or not at all */ \
> +        pcidevs_locked() || (d && rw_is_locked(&d->pci_lock));     \

'd' is missing parentheses here, should be (d).

> +    })
> +#else
> +bool pdev_list_is_read_locked(const struct domain *d);
> +#endif

FWIW, if this is only intended to be used with ASSERT, it might as
well be an ASSERT itself:

ASSERT_PDEV_LIST_IS_READ_LOCKED(d) ...

Don't have a strong opinion, so I'm fine with how it's used, just
noting it might be clearer if it was an ASSERT_ right away.

Thanks, Roger.

