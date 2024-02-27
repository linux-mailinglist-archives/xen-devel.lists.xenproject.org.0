Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0E8868E5F
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 12:08:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685999.1067486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1revJu-0001oL-UK; Tue, 27 Feb 2024 11:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685999.1067486; Tue, 27 Feb 2024 11:08:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1revJu-0001mp-RY; Tue, 27 Feb 2024 11:08:22 +0000
Received: by outflank-mailman (input) for mailman id 685999;
 Tue, 27 Feb 2024 11:08:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7gEZ=KE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1revJt-0001mh-UB
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 11:08:21 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 843471ab-d560-11ee-afd6-a90da7624cb6;
 Tue, 27 Feb 2024 12:08:20 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-412949fd224so21383325e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Feb 2024 03:08:20 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 qj24-20020a056214321800b0068f9fd1d688sm4006600qvb.21.2024.02.27.03.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 03:08:19 -0800 (PST)
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
X-Inumbo-ID: 843471ab-d560-11ee-afd6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709032100; x=1709636900; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hjCem2GDc226H2NfOzwHUZjIVg4IVbP1kpH+LPAyKbA=;
        b=Px8Vr+3Sx4hwz+rTdalbfzBLk3YNA3NKViXsCjF5tOq01NsIWemac4M3t/Hi2FnY9X
         dHj/NyfFoDdJgUZH4bIgRqbRbbqouSnbErx918PNDIVsTmHxMcZeqBkOag6YahZh19KQ
         sYiEUa25qPu+yqegEvSGo3EmweAfsMIzEvOyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709032100; x=1709636900;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hjCem2GDc226H2NfOzwHUZjIVg4IVbP1kpH+LPAyKbA=;
        b=ezbza01Yb+wCf9KpO58qKZpomNF7BmDpJn6QKLJHEb/9VOO1TC1okrVsy+UeWKrAMq
         vAkB1t0sXH45A5ZhxGF79aNZWNJIKJOCMXFjVr7XH+jgOJjKsXbRfGKPmOGYHokvmXHL
         nvGo/Rd4x8SWLAX6tRbOckuMiaEG4Qk/7A1mfvdjrIE86aSXa4ZGdFosWBZb1zLhqA+n
         GiPF5dHuf7Vp9vqHLZhdwzGMmG5mE2RFe/qkZSAccrzNFuzGEQhXnhtKUJHQDNlEymql
         5rP9xYzivioKTXDe6dJ7dS36CHy8IgUExjwm7d1/UpeEdA6q3jqpMewvIikEBMZX2KP4
         WEFw==
X-Forwarded-Encrypted: i=1; AJvYcCWwYLCUbHVJ77kn5zPnOJDY35UQ8/ildOhSBI0xFsMaHMJXK6Po2X5IQ3atHNMHGx65FxWC9oaIZopFri/b6f85GN4dAKDIUSyHCze/h84=
X-Gm-Message-State: AOJu0YxkmNgAxYk9gKdXsXL1oz/+Z5ed/EiBAm7eS/7tohNNzRlLpnJm
	bqq300ly7+eZ/PVex+zLdHdV7iK2zY3B1+Q9sZOqdqQ9DeM8lLqJnvEdOEvWfxM=
X-Google-Smtp-Source: AGHT+IH1qo2rkVtqEz0aVpOgQQsjmoKQJH4cxoh8N4/CsAV0YwaJkBHoa7Cqwy/6qxobU9SVSZ7WKA==
X-Received: by 2002:adf:cd07:0:b0:33d:f1d4:37e0 with SMTP id w7-20020adfcd07000000b0033df1d437e0mr1096690wrm.4.1709032100237;
        Tue, 27 Feb 2024 03:08:20 -0800 (PST)
Date: Tue, 27 Feb 2024 12:08:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v13.3 01/14] vpci: use per-domain PCI lock to protect
 vpci structure
Message-ID: <Zd3CoaSHtU59PjZc@macbook>
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
 <20240202213321.1920347-2-stewart.hildebrand@amd.com>
 <20240221024504.357840-1-stewart.hildebrand@amd.com>
 <6024f2c9-90e6-4ce9-a421-c0ec7441a926@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6024f2c9-90e6-4ce9-a421-c0ec7441a926@suse.com>

On Mon, Feb 26, 2024 at 03:47:17PM +0100, Jan Beulich wrote:
> On 21.02.2024 03:45, Stewart Hildebrand wrote:
> > From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > 
> > Use the per-domain PCI read/write lock to protect the presence of the
> > pci device vpci field. This lock can be used (and in a few cases is used
> > right away) so that vpci removal can be performed while holding the lock
> > in write mode. Previously such removal could race with vpci_read for
> > example.
> > 
> > When taking both d->pci_lock and pdev->vpci->lock, they should be
> > taken in this exact order: d->pci_lock then pdev->vpci->lock to avoid
> > possible deadlock situations.
> > 
> > 1. Per-domain's pci_lock is used to protect pdev->vpci structure
> > from being removed.
> > 
> > 2. Writing the command register and ROM BAR register may trigger
> > modify_bars to run, which in turn may access multiple pdevs while
> > checking for the existing BAR's overlap. The overlapping check, if
> > done under the read lock, requires vpci->lock to be acquired on both
> > devices being compared, which may produce a deadlock. It is not
> > possible to upgrade read lock to write lock in such a case. So, in
> > order to prevent the deadlock, use d->pci_lock in write mode instead.
> > 
> > All other code, which doesn't lead to pdev->vpci destruction and does
> > not access multiple pdevs at the same time, can still use a
> > combination of the read lock and pdev->vpci->lock.
> > 
> > 3. Drop const qualifier where the new rwlock is used and this is
> > appropriate.
> > 
> > 4. Do not call process_pending_softirqs with any locks held. For that
> > unlock prior the call and re-acquire the locks after. After
> > re-acquiring the lock there is no need to check if pdev->vpci exists:
> >  - in apply_map because of the context it is called (no race condition
> >    possible)
> >  - for MSI/MSI-X debug code because it is called at the end of
> >    pdev->vpci access and no further access to pdev->vpci is made
> > 
> > 5. Use d->pci_lock around for_each_pdev and pci_get_pdev()
> > while accessing pdevs in vpci code.
> > 
> > 6. Switch vPCI functions to use per-domain pci_lock for ensuring pdevs
> > do not go away. The vPCI functions call several MSI-related functions
> > which already have existing non-vPCI callers. Change those MSI-related
> > functions to allow using either pcidevs_lock() or d->pci_lock for
> > ensuring pdevs do not go away. Holding d->pci_lock in read mode is
> > sufficient. Note that this pdev protection mechanism does not protect
> > other state or critical sections. These MSI-related functions already
> > have other race condition and state protection mechanims (e.g.
> > d->event_lock and msixtbl RCU), so we deduce that the use of the global
> > pcidevs_lock() is to ensure that pdevs do not go away.
> > 
> > 7. Introduce wrapper construct, pdev_list_is_read_locked(), for checking
> > that pdevs do not go away. The purpose of this wrapper is to aid
> > readability and document the intent of the pdev protection mechanism.
> > 
> > 8. When possible, the existing non-vPCI callers of these MSI-related
> > functions haven't been switched to use the newly introduced per-domain
> > pci_lock, and will continue to use the global pcidevs_lock(). This is
> > done to reduce the risk of the new locking scheme introducing
> > regressions. Those users will be adjusted in due time. One exception
> > is where the pcidevs_lock() in allocate_and_map_msi_pirq() is moved to
> > the caller, physdev_map_pirq(): this instance is switched to
> > read_lock(&d->pci_lock) right away.
> > 
> > Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> > Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> with two small remaining remarks (below) and on the assumption that an
> R-b from Roger in particular for the vPCI code is going to turn up
> eventually.
> 
> > @@ -895,6 +891,15 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
> >  {
> >      unsigned int i;
> >  
> > +    /*
> > +     * Assert that pdev_list doesn't change. ASSERT_PDEV_LIST_IS_READ_LOCKED
> > +     * is not suitable here because it may allow either pcidevs_lock() or
> > +     * pci_lock to be held, but here we rely on pci_lock being held, not
> > +     * pcidevs_lock().
> > +     */
> > +    ASSERT(rw_is_locked(&msix->pdev->domain->pci_lock));
> > +    ASSERT(spin_is_locked(&msix->pdev->vpci->lock));
> 
> As to the comment, I think it's not really "may". I also think referral to
> ...

+1 to dropping 'may'.

Thanks, Roger.

