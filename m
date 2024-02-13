Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6405D852B4B
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 09:36:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679788.1057479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZoGU-0001aI-QT; Tue, 13 Feb 2024 08:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679788.1057479; Tue, 13 Feb 2024 08:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZoGU-0001Yi-Mq; Tue, 13 Feb 2024 08:35:42 +0000
Received: by outflank-mailman (input) for mailman id 679788;
 Tue, 13 Feb 2024 08:35:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iJZn=JW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rZoGT-0001Yc-3D
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 08:35:41 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcc0e8ca-ca4a-11ee-98f5-efadbce2ee36;
 Tue, 13 Feb 2024 09:35:38 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-411c93e6bfaso729755e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 00:35:37 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 a4-20020a05600c224400b00410ebcf8180sm3888029wmm.43.2024.02.13.00.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 00:35:36 -0800 (PST)
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
X-Inumbo-ID: dcc0e8ca-ca4a-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707813337; x=1708418137; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YFlIjH8etZU1AYd/9gLFsW9bhhhfD3RrNOQVWytW6GY=;
        b=fjFemcnOB+9+6qqA8QI25rl2Kt6rabyaql5vzGb9P7I7P1P4bpl3uGxRS9GQROx+lc
         rcHKsvnhiZ2DvEp/2yX6KU+406QfqvvHlU6OWSbcXHpI3+1l/TDq8GPMJHJyPmvsXImp
         NfirmO8NbdlzbajcNXvpBu9L/mwYp81yvDa3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707813337; x=1708418137;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YFlIjH8etZU1AYd/9gLFsW9bhhhfD3RrNOQVWytW6GY=;
        b=YHBQQ4R2b19M93DlcI61jrTExljUGRR60QdW47md3CsKG15dDl4D1wPKghCBWSFNL0
         RERtR/wk/X1EqsfKrKQr1Qx9tPBy82JKiJDXH465yK3bU2hRqJ4Tj4gH9nMTSX1Dqlbp
         rJgyrErYGXaU0NGL58R1baNKHrYoCUQ8XO5agRYeJq2fUUTBotgRnIh0cTfZwqKO0INJ
         YwmhoY5eMj/xT6jClN4JmzmW8sVi2wbcDYvCHyEg823B1fvGxG9bgcgunp4HlgiaH3OK
         /yALV96qFWBHmiJ50UnufJ+5dlpvqpGV5X32IU1qnxuYHuEF/fh2kx4GEnVo5YNkMEyx
         hw0g==
X-Gm-Message-State: AOJu0YxMHF375DdmoNJFGnCPfH2aHnFmkcinArzSv3trLVCzGK0Fif5j
	DsYmWwxxaAT2fLr+WcwzL/RZS4TW/V8BfC0LhznZa08ycA0vA6Jbt7eP0Gq4sr0=
X-Google-Smtp-Source: AGHT+IEmuh2d/UmIQlG34Qjs8sefw4XcCVT6x31IOzqRfiJIN+IPZAC3rYi9GSgmVYKxUb6jBTvgNg==
X-Received: by 2002:a05:600c:1e1e:b0:411:e7d:9086 with SMTP id ay30-20020a05600c1e1e00b004110e7d9086mr2345558wmb.15.1707813336922;
        Tue, 13 Feb 2024 00:35:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJSI45pSbT8JX/1gkn01KuoBoMK8naFDhRNEObIJAlVJXM1+XE/cBPLEQwb9PRFIpGWzzkyVS6aR5wxSld8m0dlGOcDSKAkURKMFXYiYx2+O99Il2P/nqNIq1OyzfyErRa/qF3Uyo3CuvjGDNgEEsMzI5YD7uZr3fbCl8dPyC6RTbFPUgHvOzruKWQ2134SaEX7dAxKGdf//mCN++iaod+uwGsTIOsr6cknQo3Vq+zO41oCZh1gB9fMZykgrOIrHtxmp6QVF0y5WO0+htMckzZcGyRRv14lj8IrdMUKlAgKcK9OUMI/Vw4utsacfa0R9g0yOH0PGypt4NOiimDERrFHkhxjMfLC2jziebNz8hzvDztZPKrhBufSCEndQ8GIWEmiw9L
Date: Tue, 13 Feb 2024 09:35:35 +0100
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
Subject: Re: [PATCH v13 01/14] vpci: use per-domain PCI lock to protect vpci
 structure
Message-ID: <Zcsp15Aqve11Icjb@macbook>
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
 <20240202213321.1920347-2-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240202213321.1920347-2-stewart.hildebrand@amd.com>

On Fri, Feb 02, 2024 at 04:33:05PM -0500, Stewart Hildebrand wrote:
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
> pcidevs_lock() is to ensure that pdevs do not go away. Existing non-vPCI
> callers of these MSI-related functions will remain (ab)using the global
> pcidevs_lock() to ensure pdevs do not go away so as to minimize changes
> to existing non-vPCI call paths.
> 
> 7. Introduce wrapper construct, pdev_list_is_read_locked(), for checking
> that pdevs do not go away. The purpose of this wrapper is to aid
> readability and document the intent of the pdev protection mechanism.

I would add that when possible, the existing callers haven't been
switched to use the newly introduced per-domain pci_lock, and will
continue to use the global pcidevs lock.  This is done to reduce the
risk of the new locking scheme introducing regressions.  Those users
will be adjusted in due time.

IIRC Jan had concerns about why some existing use-cases are not
switched straight to use the new per-domain pci_lock in this patch.

> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> Changes in v13:
>  - hold off adding Roger's R-b tag even though it was provided on v12.2
>  - use a wrapper construct to ease readability of odd-looking ASSERTs
>  - new placement of ASSERT in __pci_enable_msix(), __pci_enable_msi(),
>    and pci_enable_msi(). Rearrange/add pdev NULL check.
>  - expand commit description with details about using either
>    pcidevs_lock() or d->pci_lock
> 
> Changes in v12.2:
>  - drop Roger's R-b
>  - drop both locks on error paths in vpci_msix_arch_print()
>  - add another ASSERT in vpci_msix_arch_print(), to enforce the
>    expectation both locks are held before calling vpci_msix_arch_print()
>  - move pdev_done label in vpci_dump_msi()
>  - update comments in vpci_dump_msi() to say locks (plural)
> 
> Changes in v12.1:
>  - use read_trylock() in vpci_msix_arch_print()
>  - fixup in-code comments (revert double space, use DomXEN) in
>    vpci_{read,write}()
>  - minor updates in commit message
>  - add Roger's R-b
> 
> Changes in v12:
>  - s/pci_rwlock/pci_lock/ in commit message
>  - expand comment about scope of pci_lock in sched.h
>  - in vpci_{read,write}, if hwdom is trying to access a device assigned
>    to dom_xen, holding hwdom->pci_lock is sufficient (no need to hold
>    dom_xen->pci_lock)
>  - reintroduce ASSERT in vmx_pi_update_irte()
>  - reintroduce ASSERT in __pci_enable_msi{x}()
>  - delete note 6. in commit message about removing ASSERTs since we have
>    reintroduced them
> 
> Changes in v11:
>  - Fixed commit message regarding possible spinlocks
>  - Removed parameter from allocate_and_map_msi_pirq(), which was added
>  in the prev version. Now we are taking pcidevs_lock in
>  physdev_map_pirq()
>  - Returned ASSERT to pci_enable_msi
>  - Fixed case when we took read lock instead of write one
>  - Fixed label indentation
> 
> Changes in v10:
>  - Moved printk pas locked area
>  - Returned back ASSERTs
>  - Added new parameter to allocate_and_map_msi_pirq() so it knows if
>  it should take the global pci lock
>  - Added comment about possible improvement in vpci_write
>  - Changed ASSERT(rw_is_locked()) to rw_is_write_locked() in
>    appropriate places
>  - Renamed release_domain_locks() to release_domain_write_locks()
>  - moved domain_done label in vpci_dump_msi() to correct place
> Changes in v9:
>  - extended locked region to protect vpci_remove_device and
>    vpci_add_handlers() calls
>  - vpci_write() takes lock in the write mode to protect
>    potential call to modify_bars()
>  - renamed lock releasing function
>  - removed ASSERT()s from msi code
>  - added trylock in vpci_dump_msi
> 
> Changes in v8:
>  - changed d->vpci_lock to d->pci_lock
>  - introducing d->pci_lock in a separate patch
>  - extended locked region in vpci_process_pending
>  - removed pcidevs_lockis vpci_dump_msi()
>  - removed some changes as they are not needed with
>    the new locking scheme
>  - added handling for hwdom && dom_xen case
> ---
>  xen/arch/x86/hvm/vmsi.c       | 31 +++++++++++++--------
>  xen/arch/x86/hvm/vmx/vmx.c    |  2 +-
>  xen/arch/x86/irq.c            |  8 +++---
>  xen/arch/x86/msi.c            | 20 +++++++++-----
>  xen/arch/x86/physdev.c        |  2 ++
>  xen/drivers/passthrough/pci.c |  9 +++---
>  xen/drivers/vpci/header.c     | 18 ++++++++++++
>  xen/drivers/vpci/msi.c        | 30 +++++++++++++++++---
>  xen/drivers/vpci/msix.c       | 52 ++++++++++++++++++++++++++++++-----
>  xen/drivers/vpci/vpci.c       | 24 ++++++++++++++--
>  xen/include/xen/sched.h       | 15 +++++++++-
>  11 files changed, 170 insertions(+), 41 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
> index 128f23636279..f29089178a59 100644
> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -468,7 +468,7 @@ int msixtbl_pt_register(struct domain *d, struct pirq *pirq, uint64_t gtable)
>      struct msixtbl_entry *entry, *new_entry;
>      int r = -EINVAL;
>  
> -    ASSERT(pcidevs_locked());
> +    ASSERT(pdev_list_is_read_locked(d));
>      ASSERT(rw_is_write_locked(&d->event_lock));
>  
>      if ( !msixtbl_initialised(d) )
> @@ -538,7 +538,7 @@ void msixtbl_pt_unregister(struct domain *d, struct pirq *pirq)
>      struct pci_dev *pdev;
>      struct msixtbl_entry *entry;
>  
> -    ASSERT(pcidevs_locked());
> +    ASSERT(pdev_list_is_read_locked(d));
>      ASSERT(rw_is_write_locked(&d->event_lock));
>  
>      if ( !msixtbl_initialised(d) )
> @@ -684,7 +684,7 @@ static int vpci_msi_update(const struct pci_dev *pdev, uint32_t data,
>  {
>      unsigned int i;
>  
> -    ASSERT(pcidevs_locked());
> +    ASSERT(rw_is_locked(&pdev->domain->pci_lock));

Any reason to not use the newly introduced helper here?  I know the
pcidevs will never be locked here given the new lock usage, but still
it would be less confusing if the new helper was used consistently.

Otherwise we need a comment here as to why the helper can't be used,
in order to avoid confusion in the future.

>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 9da91e0e6244..c3adec1aca3c 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -462,7 +462,8 @@ struct domain
>  #ifdef CONFIG_HAS_PCI
>      struct list_head pdev_list;
>      /*
> -     * pci_lock protects access to pdev_list.
> +     * pci_lock protects access to pdev_list. pci_lock also protects pdev->vpci
> +     * structure from being removed.
>       *
>       * Any user *reading* from pdev_list, or from devices stored in pdev_list,
>       * should hold either pcidevs_lock() or pci_lock in read mode. Optionally,
> @@ -628,6 +629,18 @@ struct domain
>      unsigned int cdf;
>  };
>  
> +/*
> + * Check for use in ASSERTs to ensure that:
> + *   1. we can *read* d->pdev_list
> + *   2. pdevs (belonging to this domain) do not go away
> + *   3. pdevs (belonging to this domain) do not get assigned to other domains

I think you can just state that this check ensures there will be no
changes to the entries in d->pdev_list, but not the contents of each
entry.  No changes to d->pdev_list already ensures not devices can be
deassigned or removed from the system, and obviously makes the list
safe to iterate against.

I would also drop the explicitly mention this is intended for ASSERT
usage: there's nothing specific in the code that prevents it from
being used in other places (albeit I think that's unlikely).

> + * This check is not suitable for protecting other state or critical regions.
> + */
> +#define pdev_list_is_read_locked(d) ({                           \

I would be tempted to drop at least the '_read_' part from the name,
the name is getting a bit too long for my taste.

> +        struct domain *d_ = (d);                                 \

Why do you need this local domain variable?  Can't you use the d
parameter directly?

Such assign will prevent using a const 'd' parameter, and 'd_' itself
should be const IMO (iff we really need this).

Also sched.h is not the best place, can't you just place it in
pci.h?

Thanks, Roger.

