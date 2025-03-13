Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2784AA5FEB5
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 18:59:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913266.1319356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsmpR-0005H6-Pw; Thu, 13 Mar 2025 17:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913266.1319356; Thu, 13 Mar 2025 17:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsmpR-0005FB-NE; Thu, 13 Mar 2025 17:58:45 +0000
Received: by outflank-mailman (input) for mailman id 913266;
 Thu, 13 Mar 2025 17:58:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a3gq=WA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tsmpQ-0005F5-7m
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 17:58:44 +0000
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [2607:f8b0:4864:20::1030])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc96d5a2-0034-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 18:58:42 +0100 (CET)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2f9b9c0088fso2570122a91.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 10:58:42 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-301182181c3sm4148809a91.5.2025.03.13.10.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:58:40 -0700 (PDT)
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
X-Inumbo-ID: cc96d5a2-0034-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741888721; x=1742493521; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iNCZY87r+ZlGEzCF7anawqE69Cnd0PAVlCq7sAiI7n8=;
        b=LaRTch4l2UAZEryJ/g+REgP5EDY63BJUdUrcUF92ir5x5C4X0A61Ef/5iLp++VwNMU
         hDTR04wHTTtitKW8veDqR1P1XEN1hhsAvFw2RVBxqPaXq3alUFjnWBIgbpbX6YnCqi6w
         5t5VThzno7N598MTZBxjHIGI8MEZXwEtmTwIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741888721; x=1742493521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNCZY87r+ZlGEzCF7anawqE69Cnd0PAVlCq7sAiI7n8=;
        b=i6EloxocQQ4r5+EXtZiDIpLgbM5KyCDxqt7NvYFsP1CMK3WTkAM/QoyMTHTLE7P2hE
         PeM5BQOqALn9SZ75nqb2Ws8Env4XSCgdBjkwsOEcvsyKBqD/Fx3ox/80Gv8qkDk48PwJ
         3BfaA0yNdL14UgDF7xYt0RFiRxwjxL/3aAtcZFfrQ4Q7u0Q8m8S4eZX6XWG/ag4KvgXo
         QEyfmnhX4gi6jPzfpbhYLtRiGEfnMs0a1B99YL9BZ30NiLTTS97vewhbgAuRoDv/pHb9
         Qo4i4QpFH9+neihBq+v2N7MS0gEEuwJvU+pkso3fxOcpkD8M+VBNXjt0tbyqPRlbEg0t
         XgcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzwnShwo+msWfrd8PMp+RzgUQ+O3n6EYPsJOTRG6oi8LQubdVLRrt4t+VqE2cmMHt2OSQ6ImBybiQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwOM9RE80Chm4tNfRxdSoChf3sD2Imzdo3es0Wwq6/KyWiMPUm
	ZoqRz/QxcFQYBuiQMd/Ff/ajNFavt77tBe0IqoDxKcjHLHj3CIciAPF+QHS9zlOSNehp/9y5reY
	H
X-Gm-Gg: ASbGncsOAYWbn/IekWQDBP93lP/MFWyQ3qdjyTAHepc3VPQQnuyWH451WK4rUkNiiPk
	JIh2G5ZJQRahBaKEdMyU98NBCDP6ukF6xcP/LQDcMtBSR6g8/jcRURBsDm21m/Ark+x0oiClIDW
	IRAPtIT7vzjId6womXV3YJbt7QWPmCWdTUi1R+J5ZhNyXrPXzxNH9T6O4NAgWjDkwa4iGxn1RKL
	MTEz7ptoaiq1FbMfYE1HjZkAv4D3WaapSHFJgZmIQdFokinJ2/PlSaj8B2yaQdjH4gHZnYLEvTz
	kAfpVFxSpmKoWZQ5pA8rlNus2oHvqCNVmRLmCchZKx52lE9fdw==
X-Google-Smtp-Source: AGHT+IG/xGnqATyWZwmPcLenpH7bmoIvvTCClsy4lVLZoEfht0jZflnE2KgJ+XxLB35IvHO317rngQ==
X-Received: by 2002:a17:90b:5247:b0:2ee:5c9b:35c0 with SMTP id 98e67ed59e1d1-30135ed4067mr4410306a91.9.1741888721211;
        Thu, 13 Mar 2025 10:58:41 -0700 (PDT)
Date: Thu, 13 Mar 2025 18:58:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] [RFC] vpci: allow BAR write while mapped
Message-ID: <Z9Mcy9j8ec-TjipY@macbook.local>
References: <20250312195019.382926-1-stewart.hildebrand@amd.com>
 <D8F8IW559J11.2G40MDQH23I44@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <D8F8IW559J11.2G40MDQH23I44@cloud.com>

On Thu, Mar 13, 2025 at 03:14:26PM +0000, Alejandro Vallejo wrote:
> On Wed Mar 12, 2025 at 7:50 PM GMT, Stewart Hildebrand wrote:
> > Xen vPCI refuses BAR writes if the BAR is mapped in p2m. If firmware
> > initialized the BAR to a bad address, Linux will try to write a new
> > address to the BAR without disabling memory decoding. Allow the write
> > by updating p2m right away in the vPCI BAR write handler.
> >
> > Resolves: https://gitlab.com/xen-project/xen/-/issues/197
> > Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> > ---
> > RFC: Currently the deferred mapping machinery supports only map or
> >      unmap, not both. It might be better to rework the mapping machinery
> >      to support unmap-then-map operations, but please let me know your
> >      thoughts.
> > RFC: This patch has not yet made an attempt to distinguish between
> >      32-bit and 64-bit writes. It probably should.
> > ---
> >  xen/drivers/vpci/header.c | 65 +++++++++++++++++++++++++++++++--------
> >  1 file changed, 53 insertions(+), 12 deletions(-)
> >
> > diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> > index ef6c965c081c..66adb2183cfe 100644
> > --- a/xen/drivers/vpci/header.c
> > +++ b/xen/drivers/vpci/header.c
> > @@ -173,7 +173,7 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
> >          ASSERT_UNREACHABLE();
> >  }
> >  
> > -bool vpci_process_pending(struct vcpu *v)
> > +static bool process_pending(struct vcpu *v, bool need_lock)
> >  {
> >      struct pci_dev *pdev = v->vpci.pdev;
> >      struct vpci_header *header = NULL;
> > @@ -182,12 +182,14 @@ bool vpci_process_pending(struct vcpu *v)
> >      if ( !pdev )
> >          return false;
> >  
> > -    read_lock(&v->domain->pci_lock);
> > +    if ( need_lock )
> > +        read_lock(&v->domain->pci_lock);
> >  
> >      if ( !pdev->vpci || (v->domain != pdev->domain) )
> >      {
> >          v->vpci.pdev = NULL;
> > -        read_unlock(&v->domain->pci_lock);
> > +        if ( need_lock )
> > +            read_unlock(&v->domain->pci_lock);
> >          return false;
> >      }
> >  
> > @@ -209,17 +211,20 @@ bool vpci_process_pending(struct vcpu *v)
> >  
> >          if ( rc == -ERESTART )
> >          {
> > -            read_unlock(&v->domain->pci_lock);
> > +            if ( need_lock )
> > +                read_unlock(&v->domain->pci_lock);
> >              return true;
> >          }
> >  
> >          if ( rc )
> >          {
> > -            spin_lock(&pdev->vpci->lock);
> > +            if ( need_lock )
> > +                spin_lock(&pdev->vpci->lock);
> >              /* Disable memory decoding unconditionally on failure. */
> >              modify_decoding(pdev, v->vpci.cmd & ~PCI_COMMAND_MEMORY,
> >                              false);
> > -            spin_unlock(&pdev->vpci->lock);
> > +            if ( need_lock )
> > +                spin_unlock(&pdev->vpci->lock);
> >  
> >              /* Clean all the rangesets */
> >              for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> > @@ -228,7 +233,8 @@ bool vpci_process_pending(struct vcpu *v)
> >  
> >              v->vpci.pdev = NULL;
> >  
> > -            read_unlock(&v->domain->pci_lock);
> > +            if ( need_lock )
> > +                read_unlock(&v->domain->pci_lock);
> >  
> >              if ( !is_hardware_domain(v->domain) )
> >                  domain_crash(v->domain);
> > @@ -238,15 +244,23 @@ bool vpci_process_pending(struct vcpu *v)
> >      }
> >      v->vpci.pdev = NULL;
> >  
> > -    spin_lock(&pdev->vpci->lock);
> > +    if ( need_lock )
> > +        spin_lock(&pdev->vpci->lock);
> >      modify_decoding(pdev, v->vpci.cmd, v->vpci.rom_only);
> > -    spin_unlock(&pdev->vpci->lock);
> > +    if ( need_lock )
> > +        spin_unlock(&pdev->vpci->lock);
> >  
> > -    read_unlock(&v->domain->pci_lock);
> > +    if ( need_lock )
> > +        read_unlock(&v->domain->pci_lock);
> >  
> >      return false;
> >  }
> >  
> > +bool vpci_process_pending(struct vcpu *v)
> > +{
> > +    return process_pending(v, true);
> > +}
> > +
> >  static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
> >                              uint16_t cmd)
> >  {
> > @@ -565,6 +579,8 @@ static void cf_check bar_write(
> >  {
> >      struct vpci_bar *bar = data;
> >      bool hi = false;
> > +    bool reenable = false;
> > +    uint32_t cmd = 0;
> >  
> >      ASSERT(is_hardware_domain(pdev->domain));
> >  
> > @@ -585,10 +601,31 @@ static void cf_check bar_write(
> >      {
> >          /* If the value written is the current one avoid printing a warning. */
> >          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
> > +        {
> >              gprintk(XENLOG_WARNING,
> > -                    "%pp: ignored BAR %zu write while mapped\n",
> > +                    "%pp: allowing BAR %zu write while mapped\n",
> >                      &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> > -        return;
> > +            ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
> > +            ASSERT(spin_is_locked(&pdev->vpci->lock));
> > +            reenable = true;
> > +            cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
> > +            /*
> > +             * Write-while-mapped: unmap the old BAR in p2m. We want this to
> > +             * finish right away since the deferral machinery only supports
> > +             * unmap OR map, not unmap-then-remap. Ultimately, it probably would
> > +             * be better to defer the write-while-mapped case just like regular
> > +             * BAR writes (but still only allow it for 32-bit BAR writes).
> > +             */
> > +            /* Disable memory decoding */
> > +            modify_bars(pdev, cmd & ~PCI_COMMAND_MEMORY, false);
> > +            /* Call process pending here to ensure P2M operations are done */
> > +            while ( process_pending(current, false) )
> > +            {
> > +                /* Pre-empted, try again */
> 
> This seems a tad dangerous. There may be a non-negligible amount of work queued
> up. I also wonder whether the guest can induce spinning by increasing
> contention on the p2m (e.g: via ballooning) or by induces work being queued up.
> 
> I don't quite understand the logic, but I suspect you could
> raise_softirq(SCHEDULE_SOFTIRQ), decrease the IP so the instruction is
> replayed, release the locks, and simply exit the hypervisor.

There's no instruction replay in this case, instead the vCPU is
prevented from resuming operation until the deferred pending operation
is finished.  This is done by preventing hvm_do_resume() from
succeeding as long as vpci_process_pending() return true.

> The system ought
> to naturally split the operation in several continuations each of which does
> either unmapping or mapping if it couldn't be done in a single one. Replaying
> the instruction after decoding is disabled ought to be benign.

IMO the main issue is how to signal which operations are pending, so
they can be executed in the deferred context.  `struct vpci_vcpu` is
used to hold a single pending operation.

> I haven't tried any of what I just wrote, so take it with with several tons of
> salt though.
> 
> Do you know if Linux intentionally skips disabling decode? Or is it a bug?

For 32bit BARs it's possible to atomically reposition them with a
single atomic write, so Linux will try to do that.  For 64bit BARs
this is not possible (as it involves writes to two registers), and
hence Linux won't usually attempt to atomically reposition 64bit BARs.

Thanks, Roger.

