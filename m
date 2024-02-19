Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D09D9859EAC
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 09:47:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682707.1061821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbzIV-0001He-Eh; Mon, 19 Feb 2024 08:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682707.1061821; Mon, 19 Feb 2024 08:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbzIV-0001Fe-BO; Mon, 19 Feb 2024 08:46:47 +0000
Received: by outflank-mailman (input) for mailman id 682707;
 Mon, 19 Feb 2024 08:46:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+22N=J4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rbzIU-0001FY-Hq
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 08:46:46 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68ace331-cf03-11ee-98f5-efadbce2ee36;
 Mon, 19 Feb 2024 09:46:44 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4126a159fa6so843505e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 00:46:44 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 dw5-20020a0560000dc500b0033b278cf5fesm9618991wrb.102.2024.02.19.00.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 00:46:43 -0800 (PST)
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
X-Inumbo-ID: 68ace331-cf03-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708332404; x=1708937204; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/oqXWhZsxZL0QLU80NygwO8q2mduUCkKazGcnk8V+Qk=;
        b=Bygf3Q+cIrX7VvKUNImsBNbENR3FI3ng4wkIbcyZNyHDpStcg+uPTNUj8/XCkkNljm
         IH/QWksCAKS9aSAB1GbipglnkPJVWAOHq9Lpa8gNarTws7o04NCy5JuQg626RWYw257O
         dbbOlFH5C1nfp5YlBe+rEkxDRuJ5rlB2Dz/14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708332404; x=1708937204;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/oqXWhZsxZL0QLU80NygwO8q2mduUCkKazGcnk8V+Qk=;
        b=sF5OR5ctguE0szhoLGT4RUXL+G1kGGgNK9QWaIFOspu3F5GuMvOP9w12WStVnEsVvR
         0uZE9VYYp1mtsdLMCUm9fDH0yI7PO9WrhF/Nsbxh/LbxbB2YSKJGPNzeal40dTllRYzi
         l1ZZLUgxJQEsdKtQP7tAaSGnnKFW/3HSsedF2mkI5HJJkHNyEX/0iTxt5i1+12/cOOfs
         Gs/0zp7maf6IS8u9/1focqAh7NQJCNeKDgnzKvI7KrVaUB8Wwpzpyts5ctPwD/CKNoFj
         vAxCyyLB4yMYlzm/kS0qXd52+H33HDO3VXblp1xguehxp1irVk7ZqKIOjCtPfNH5gVgb
         Dmbw==
X-Gm-Message-State: AOJu0YziB0vssTW++YFAFol6Pnu+/Asdt7IKd4tA227OnvWVdEOiw73j
	daGOjxvLWSxmNunuQBzmGQFu7rk8mL1dU8w+x0PoKEBlPQr5Hkoh0XyxR8+R81M=
X-Google-Smtp-Source: AGHT+IExeSayAXedpNqAnQ6g+aQ5E10KI0NqNSgNpOXRx7nUAP6uuZ6S7r9+/jZ0EXNLOlApFws+5w==
X-Received: by 2002:a5d:6e8b:0:b0:33d:150a:307f with SMTP id k11-20020a5d6e8b000000b0033d150a307fmr5669853wrz.64.1708332403883;
        Mon, 19 Feb 2024 00:46:43 -0800 (PST)
Date: Mon, 19 Feb 2024 09:46:42 +0100
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
Message-ID: <ZdMVctHtAeujcNq5@macbook>
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
 <20240202213321.1920347-2-stewart.hildebrand@amd.com>
 <20240215203001.1816811-1-stewart.hildebrand@amd.com>
 <Zc9KuCeoOciUdqTN@macbook>
 <f1e43851-8a3d-423d-b0da-4d881f8ecf91@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1e43851-8a3d-423d-b0da-4d881f8ecf91@amd.com>

On Fri, Feb 16, 2024 at 09:41:19AM -0500, Stewart Hildebrand wrote:
> On 2/16/24 06:44, Roger Pau Monné wrote:
> > On Thu, Feb 15, 2024 at 03:30:00PM -0500, Stewart Hildebrand wrote:
> >> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>
> >> Use the per-domain PCI read/write lock to protect the presence of the
> >> pci device vpci field. This lock can be used (and in a few cases is used
> >> right away) so that vpci removal can be performed while holding the lock
> >> in write mode. Previously such removal could race with vpci_read for
> >> example.
> >>
> >> When taking both d->pci_lock and pdev->vpci->lock, they should be
> >> taken in this exact order: d->pci_lock then pdev->vpci->lock to avoid
> >> possible deadlock situations.
> >>
> >> 1. Per-domain's pci_lock is used to protect pdev->vpci structure
> >> from being removed.
> >>
> >> 2. Writing the command register and ROM BAR register may trigger
> >> modify_bars to run, which in turn may access multiple pdevs while
> >> checking for the existing BAR's overlap. The overlapping check, if
> >> done under the read lock, requires vpci->lock to be acquired on both
> >> devices being compared, which may produce a deadlock. It is not
> >> possible to upgrade read lock to write lock in such a case. So, in
> >> order to prevent the deadlock, use d->pci_lock in write mode instead.
> >>
> >> All other code, which doesn't lead to pdev->vpci destruction and does
> >> not access multiple pdevs at the same time, can still use a
> >> combination of the read lock and pdev->vpci->lock.
> >>
> >> 3. Drop const qualifier where the new rwlock is used and this is
> >> appropriate.
> >>
> >> 4. Do not call process_pending_softirqs with any locks held. For that
> >> unlock prior the call and re-acquire the locks after. After
> >> re-acquiring the lock there is no need to check if pdev->vpci exists:
> >>  - in apply_map because of the context it is called (no race condition
> >>    possible)
> >>  - for MSI/MSI-X debug code because it is called at the end of
> >>    pdev->vpci access and no further access to pdev->vpci is made
> >>
> >> 5. Use d->pci_lock around for_each_pdev and pci_get_pdev()
> >> while accessing pdevs in vpci code.
> >>
> >> 6. Switch vPCI functions to use per-domain pci_lock for ensuring pdevs
> >> do not go away. The vPCI functions call several MSI-related functions
> >> which already have existing non-vPCI callers. Change those MSI-related
> >> functions to allow using either pcidevs_lock() or d->pci_lock for
> >> ensuring pdevs do not go away. Holding d->pci_lock in read mode is
> >> sufficient. Note that this pdev protection mechanism does not protect
> >> other state or critical sections. These MSI-related functions already
> >> have other race condition and state protection mechanims (e.g.
> >> d->event_lock and msixtbl RCU), so we deduce that the use of the global
> >> pcidevs_lock() is to ensure that pdevs do not go away.
> >>
> >> 7. Introduce wrapper construct, pdev_list_is_read_locked(), for checking
> >> that pdevs do not go away. The purpose of this wrapper is to aid
> >> readability and document the intent of the pdev protection mechanism.
> >>
> >> 8. When possible, the existing non-vPCI callers of these MSI-related
> >> functions haven't been switched to use the newly introduced per-domain
> >> pci_lock, and will continue to use the global pcidevs_lock(). This is
> >> done to reduce the risk of the new locking scheme introducing
> >> regressions. Those users will be adjusted in due time. One exception
> >> is where the pcidevs_lock() in allocate_and_map_msi_pirq() is moved to
> >> the caller, physdev_map_pirq(): this instance is switched to
> >> read_lock(&d->pci_lock) right away.
> >>
> >> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> >> Suggested-by: Jan Beulich <jbeulich@suse.com>
> >> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> >> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> > 
> > A couple of questions and the pdev_list_is_read_locked() needs a small
> > adjustment.
> > 
> >> @@ -895,6 +891,14 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
> >>  {
> >>      unsigned int i;
> >>  
> >> +    /*
> >> +     * Assert that d->pdev_list doesn't change. pdev_list_is_read_locked() is
> >> +     * not suitable here because we may read_unlock(&pdev->domain->pci_lock)
> >> +     * before returning.
> > 
> > I'm confused by this comment, as I don't see why it matters that the
> > lock might be lock before returning.  We need to ensure the lock is
> > taken at the time of the assert, and hence pdev_list_is_read_locked()
> > can be used.
> 
> pdev_list_is_read_locked() currently would allow either pcidevs_lock()
> or d->pci_lock. If vpci_msix_arch_print() is entered with only
> pcidevs_lock() held, we may end up unlocking d->pci_lock when it is
> not locked, which would be wrong.
> 
> Perhaps the comment could be clarified as:
> 
>     /*
>      * Assert that d->pdev_list doesn't change. ASSERT_PDEV_LIST_IS_READ_LOCKED
>      * is not suitable here because it may allow either pcidevs_lock() or
>      * d->pci_lock to be held, but here we rely on d->pci_lock being held, not
>      * pcidevs_lock().
>      */

Yes, this is indeed better.

Thanks, Roger.

