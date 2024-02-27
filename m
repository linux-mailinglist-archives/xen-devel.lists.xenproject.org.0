Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CFF868E5D
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 12:08:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685997.1067476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1revIc-0001IQ-LR; Tue, 27 Feb 2024 11:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685997.1067476; Tue, 27 Feb 2024 11:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1revIc-0001GJ-IN; Tue, 27 Feb 2024 11:07:02 +0000
Received: by outflank-mailman (input) for mailman id 685997;
 Tue, 27 Feb 2024 11:07:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7gEZ=KE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1revIb-0001GD-4W
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 11:07:01 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 535d9570-d560-11ee-a1ee-f123f15fe8a2;
 Tue, 27 Feb 2024 12:06:58 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-512b29f82d1so5652519e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Feb 2024 03:06:58 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 h11-20020a05620a21cb00b00787bc4a187dsm3461692qka.98.2024.02.27.03.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 03:06:57 -0800 (PST)
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
X-Inumbo-ID: 535d9570-d560-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709032018; x=1709636818; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P56KoYlKn+q6+EBgOUVJxkt0jtKwzfqfiZxHZSHtIfE=;
        b=nmqx87OQJGwqMjwwxXJpNw+1hZ0M83eBbF/bWLPfRbpTHgIgQb0d0vgJjLis0gEbh7
         IKtMbMKKptmGZx4bnqD5k80390ghy0D6NHwhNpgUzWDKsAZNXLR0zFO3iSDaso9/uBVV
         w5EQfMeKIUoOyW+aM5gK8qtiRhQGQ0KSwrg/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709032018; x=1709636818;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P56KoYlKn+q6+EBgOUVJxkt0jtKwzfqfiZxHZSHtIfE=;
        b=cA2WGjPSATvOAi2POPqqTIdJ2uhsI6QuXwRqTVQyf4vcKzy+kBbjuyIdng5DjCRC3r
         tx4SXV+j/b0irZFybFGSdXnYPAtHgovWh+qkfrEiJu+Et3R3msB/kAIvIQAbP0zrgEds
         d9gv6ptP+X4bhq64CJf3jVEB4T6M02EkKblBSDm/JclZWkGQyxEviqcuRUSp6FG+MQMJ
         +6aTx4WXBOFWOmpZxgP6a0S0DKi7mleiAh+ekKTJfLBpdkrAjn/fbahGQuj6yZWmxaD6
         BH7FY8hyGA5b2+LJT98pDohILyPn65u6uGiIMK7axs4Up4+yQK52kf3IESn83YUGPfr9
         NiFw==
X-Gm-Message-State: AOJu0Yzo+0rkEL5VQv9bAHSNtjpjD4bXtFa2pOr4Bv3Bo1gdFthox6KY
	UsfrEEnzYnnGsEgnQ1gv/4y0vCGu6l3cI2YWB3IMSBGu4VWk4JQgNqO9RYCFL6A=
X-Google-Smtp-Source: AGHT+IE2DH+fWiPGdbX1ZcQRr0ouT2AENOBZBeiWlI14QRzc9Ilp8XTeQWHpErGElXAVuvDrwyYk/Q==
X-Received: by 2002:a05:6512:1053:b0:512:bf09:624a with SMTP id c19-20020a056512105300b00512bf09624amr6724437lfb.66.1709032018099;
        Tue, 27 Feb 2024 03:06:58 -0800 (PST)
Date: Tue, 27 Feb 2024 12:06:55 +0100
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
Subject: Re: [PATCH v13.3 01/14] vpci: use per-domain PCI lock to protect
 vpci structure
Message-ID: <Zd3CT37FrXU14qFa@macbook>
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
 <20240202213321.1920347-2-stewart.hildebrand@amd.com>
 <20240221024504.357840-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240221024504.357840-1-stewart.hildebrand@amd.com>

On Tue, Feb 20, 2024 at 09:45:03PM -0500, Stewart Hildebrand wrote:
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

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

