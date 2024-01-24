Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF43883A5AB
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 10:39:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670856.1043919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSZjA-0004GO-GP; Wed, 24 Jan 2024 09:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670856.1043919; Wed, 24 Jan 2024 09:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSZjA-0004E0-Dc; Wed, 24 Jan 2024 09:39:24 +0000
Received: by outflank-mailman (input) for mailman id 670856;
 Wed, 24 Jan 2024 09:39:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3ap=JC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rSZj8-0004Dp-8B
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 09:39:22 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73124b94-ba9c-11ee-98f5-6d05b1d4d9a1;
 Wed, 24 Jan 2024 10:39:20 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-337d5480a6aso4957495f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 01:39:20 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 q4-20020adfab04000000b00337d603fd01sm15310259wrc.66.2024.01.24.01.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 01:39:19 -0800 (PST)
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
X-Inumbo-ID: 73124b94-ba9c-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706089160; x=1706693960; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BouSWap0rhZxxjBdJxNrLY3LEopoGYXMaavX1hcr6Vw=;
        b=L14qUg82DMkSaXNIOUlV+mARLZw2bF+BaSO8olZObvGpGj97zY/Woa7qH/JCWHT9e1
         AN8dP8kObPR5hPcKjRaMfuZIti9Pj52nZI4Eyvk6ro1Etg2soZuNZQZDQJt83xAlABBm
         ZEF63/T4FTOGtRmiG4sEjzZXJZKZ9yuOwBGjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706089160; x=1706693960;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BouSWap0rhZxxjBdJxNrLY3LEopoGYXMaavX1hcr6Vw=;
        b=GYiEVceByGJJGiz6Yk9T+68SXIGmVF7fVVe5oLCZ+P0RX8wyUXEeGTKBqXdiDqHhLD
         P8apq/zuEwD/wdUM1KEDQpc+QeLe2JCMD5EURztSjRFX2piSR3/GvNzf4YDVFu0QQY2N
         ISy7g23HlZeLUvdixEgV0q4soyoUekWUipYQgHH8u32+SCK/OYmbq+w9qzk5HDtkwVHd
         RHrCyNWQ6vH6BylLWKkH5iK0C2ZVFM17Ew0jjfzK1IIITrAptQjpXPQmOLjClcBcUqMF
         uuxwAePzyB7nvqAlYmOUfmVWzk0Y3wlh7pQ0AF3fjkCdtF5NKEoU33hB3JzTud8H4Zxq
         NAFQ==
X-Gm-Message-State: AOJu0YzrJb/1KoXsiVrkj7YYbL8xW/3lis9osQUUY3CscWeELLBDQnG3
	A8SSj9BRMW5ogYqmqiwXaQFMXHXfJkoIAOyOpqxx8xmSbiWUvnSSNDq1NbzI2/s=
X-Google-Smtp-Source: AGHT+IEKw5a8KHFeqBy9NmNPIWIDROLcjb7ONIhgTd0c8jLdSrYRob3pVaTG/wervvp5fIaB1dJN8A==
X-Received: by 2002:a5d:58d0:0:b0:337:c555:18b5 with SMTP id o16-20020a5d58d0000000b00337c55518b5mr344700wrf.115.1706089159850;
        Wed, 24 Jan 2024 01:39:19 -0800 (PST)
Date: Wed, 24 Jan 2024 10:39:18 +0100
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
Subject: Re: [PATCH v12.2 01/15] vpci: use per-domain PCI lock to protect
 vpci structure
Message-ID: <ZbDaxiUO0T2w5UPs@macbook>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-2-stewart.hildebrand@amd.com>
 <20240115194309.45683-1-stewart.hildebrand@amd.com>
 <18ec3401-4334-40c0-82a0-31abfd9797d0@suse.com>
 <Za_Z_WlLbBgb0EzF@macbook>
 <c8792489-3e61-4c2e-af80-97832a3622b7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8792489-3e61-4c2e-af80-97832a3622b7@suse.com>

On Wed, Jan 24, 2024 at 09:56:42AM +0100, Jan Beulich wrote:
> On 23.01.2024 16:23, Roger Pau Monné wrote:
> > On Tue, Jan 23, 2024 at 03:26:26PM +0100, Jan Beulich wrote:
> >> On 15.01.2024 20:43, Stewart Hildebrand wrote:
> >>> --- a/xen/arch/x86/hvm/vmsi.c
> >>> +++ b/xen/arch/x86/hvm/vmsi.c
> >>> @@ -468,7 +468,7 @@ int msixtbl_pt_register(struct domain *d, struct pirq *pirq, uint64_t gtable)
> >>>      struct msixtbl_entry *entry, *new_entry;
> >>>      int r = -EINVAL;
> >>>  
> >>> -    ASSERT(pcidevs_locked());
> >>> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
> >>>      ASSERT(rw_is_write_locked(&d->event_lock));
> >>>  
> >>>      if ( !msixtbl_initialised(d) )
> >>> @@ -538,7 +538,7 @@ void msixtbl_pt_unregister(struct domain *d, struct pirq *pirq)
> >>>      struct pci_dev *pdev;
> >>>      struct msixtbl_entry *entry;
> >>>  
> >>> -    ASSERT(pcidevs_locked());
> >>> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
> >>>      ASSERT(rw_is_write_locked(&d->event_lock));
> >>
> >> I was hoping to just ack this patch, but the two changes above look
> >> questionable to me: How can it be that holding _either_ lock is okay?
> >> It's not obvious in this context that consumers have to hold both
> >> locks now. In fact consumers looks to be the callers of
> >> msixtbl_find_entry(), yet the list is RCU-protected. Whereas races
> >> against themselves or against one another are avoided by holding
> >> d->event_lock.
> > 
> > The reason for the change here is that msixtbl_pt_{un,}register() gets
> > called by pt_irq_{create,destroy}_bind(), which is in turn called by
> > vPCI code (pcidevs_locked()) that has been switched to not take the
> > pcidevs lock anymore, and hence the ASSERT would trigger.
> 
> I understand this is the motivation for the change, but that doesn't
> (alone) render the construct above sensible / correct.

But we agreed that for the purpose of the device not going anyway,
either the pcidevs or the per-domain pci_lock should be held, both are
valid for the purpose, and hence functions have adjusted to take that
into account.

So your concern is about the pcidevs lock being used here not just for
preventing the device from being removed, but also for protecting MSI
related state?

> >> My only guess then for the original need of holding pcidevs_lock is
> >> the use of msi_desc->dev, with the desire for the device to not go
> >> away. Yet the description doesn't talk about interactions of the per-
> >> domain PCI lock with that one at all; it all circles around the
> >> domain'd vPCI lock.
> > 
> > I do agree that it looks like the original intention of holding
> > pcidevs_lock is to prevent msi_desc->dev from being removed - yet I'm
> > not sure it's possible for the device to go away while the domain
> > event_lock is hold, as device removal would need to take that same
> > lock in order to destroy the irq_desc.
> 
> Yes, that matches an observation of mine as well. If we can simplify
> (rather then complicate) locking, I'd prefer if we did. May need to
> be a separate (prereq) patch, though.

Hm, yes, that might be an option, and doing a pre-patch that removes
the need to have pcidevs locked here would avoid the what seem
controversial changes.

> >> Feels like I'm missing something that's obvious to everyone else.
> >> Or maybe this part of the patch is actually unrelated, and should be
> >> split off (with its own [proper] justification)? Or wouldn't it then
> >> be better to also change the other paths leading here to acquire the
> >> per-domain PCI lock?
> > 
> > Other paths in vPCI vpci_msi_update(), vpci_msi_arch_update(),
> > vpci_msi_arch_enable()... are switched in this patch to use the
> > per-domain pci_lock instead of pcidevs lock.
> 
> Hence my question: Can't we consolidate to all paths only using the
> per-domain lock? That would make these odd-looking assertions become
> normal-looking again.

Hm, I think that's more work than originally planned, as the initial
plan was to use both locks during an interim period in order to avoid
doing a full swept change to switch to the per-domain one.

Regards, Roger.

