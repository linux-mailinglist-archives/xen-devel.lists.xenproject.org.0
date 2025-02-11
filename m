Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E074A30E0F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 15:20:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885599.1295404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thr7K-0004UT-Tl; Tue, 11 Feb 2025 14:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885599.1295404; Tue, 11 Feb 2025 14:20:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thr7K-0004RQ-Pr; Tue, 11 Feb 2025 14:20:02 +0000
Received: by outflank-mailman (input) for mailman id 885599;
 Tue, 11 Feb 2025 14:20:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jP5V=VC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1thr7J-0004F5-1Q
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 14:20:01 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4664631b-e883-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 15:20:00 +0100 (CET)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2fa1e25e337so7109822a91.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 06:19:59 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fa2f54880dsm8365728a91.11.2025.02.11.06.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 06:19:57 -0800 (PST)
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
X-Inumbo-ID: 4664631b-e883-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739283598; x=1739888398; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GJS28p912xovLWtmoEKwAYTGIZPOs5u3PJFMUlcCJKo=;
        b=S6rmUyJrGKXXW0RhRMA028v40t2CsyTxjl7Bx0PTY8tQDJo0KErdFXmGsUNgtJdfR6
         Hwx1yNo5CH7y3wiBSfWF2z8ZM4Fwaddky5HxFRMn1QEHuV53d9Y9gdnlVjy+6ZxbdEEM
         8Z7Z+2LgbV4BXwHVfRgJzbZ79nR1VtFrCFQHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739283598; x=1739888398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJS28p912xovLWtmoEKwAYTGIZPOs5u3PJFMUlcCJKo=;
        b=LQG7l8ifNq+387AxUqQ5Nd2Ivw3EG9E4zkDwbtZw5tnUAcRg1zXCANEjmq8WyWj17n
         AHpI9FqFGNRQh64YoEBaNRNfc2gcW52WutDLOHG1AD4MB7ZiDz2cZKAsqHy3201/QTTq
         Qf/ZaHJQ/DvJ18vdJf0Uc/4yxz1pnLQwzg2Vrr+PBRIs95BSZ7ZIOMSmYz2jA0SY2bZq
         PG4Sd/wnQFGp7veDQQpNIv9NA0HM53qlWCtztc9vt+Mlu4+L2nddj/h3um1r3uv8Q8bg
         e0VxiAWziDVdb06sEdBghYaNlAbkJM5MfGfXQY06UUebtIeUB9+VaTU7q8gwSmlj0ik2
         TY7w==
X-Forwarded-Encrypted: i=1; AJvYcCUYzZp86SQ/MNFwdpbEUPdub5BWZxN+xydHFtJFEB3JLJl4edoLEEeENkjLlSMwr4F0vvM+N529uCo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJkIz9+DJV6534ZaMW99bGTQJOTAYVORMxXBj3iUgcMdfFFiLv
	7+yBIqo9Ci8JueovdNntG8MN+N1CBNXU9PEe3UHvdudis6HXGMiZyBf8a95XYMk=
X-Gm-Gg: ASbGnct/G5D5AmbeYtqH2t6c7cYQtB7W59lvZbZm6lZhuW6rUjWuZjy1APL7qlK3ff0
	RLyw/ocSLSMsvbh1QSzFGsrvP0FjYuUyfDVa/grr+6nJb2bu+LhLqwxu2McQr0Z+PC9RlIxH5Mq
	toqZTVgbj012jDjfhbhXrPU+d6/YIjtxCFVfR1zAte/57ZFTDA69pTWBDNwDU5WBHxpJLH131wE
	S9Dtnth5r7G56013JI6fHC98XULLHfRE/bo7dU8WbyhfU2oCq08zmzPhZL6mjl2dK86G1kNTlco
	7T6W9D2siwa7qnpW34F3FkvVnQ==
X-Google-Smtp-Source: AGHT+IFKnsdGgCr51iV7FCFjqRUATwjTmQxaYolgVqCZpqBfMMw0NxA6lUDndHs/pE0exKFavZK1YA==
X-Received: by 2002:a17:90b:4b8c:b0:2fa:f8d:65e7 with SMTP id 98e67ed59e1d1-2fa23f43a0emr29113049a91.2.1739283598452;
        Tue, 11 Feb 2025 06:19:58 -0800 (PST)
Date: Tue, 11 Feb 2025 15:19:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.20 v3 4/5] x86/pci: disable MSI(-X) on all devices
 at shutdown
Message-ID: <Z6tciLmjLJt1Qs0o@macbook.local>
References: <20250211110209.86974-1-roger.pau@citrix.com>
 <20250211110209.86974-5-roger.pau@citrix.com>
 <604fd3cd-6542-4776-b06b-1191c6a11b31@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <604fd3cd-6542-4776-b06b-1191c6a11b31@suse.com>

On Tue, Feb 11, 2025 at 12:34:41PM +0100, Jan Beulich wrote:
> On 11.02.2025 12:02, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/crash.c
> > +++ b/xen/arch/x86/crash.c
> > @@ -175,6 +175,13 @@ static void nmi_shootdown_cpus(void)
> >           */
> >          x2apic_enabled = (current_local_apic_mode() == APIC_MODE_X2APIC);
> >  
> > +        if ( !pcidevs_locked() )
> > +            /*
> > +             * Assume the PCI device list to be in a consistent state if the
> > +             * lock is not held when the crash happened.
> > +             */
> > +            pci_disable_msi_all();
> 
> Hmm, I really meant try-lock to be used here. For recursive locks
> rspin_is_locked() tells you only whether the local CPU owns the lock,
> whereas here you want to know whether anyone owns it.

Indeed, I always forget about this quirk of recursive locks.  I will
need to introduce a new pcidevs_trylock() helper then.

> > --- a/xen/drivers/passthrough/pci.c
> > +++ b/xen/drivers/passthrough/pci.c
> > @@ -1802,6 +1802,45 @@ int iommu_do_pci_domctl(
> >      return ret;
> >  }
> >  
> > +struct segment_iter {
> > +    int (*handler)(struct pci_dev *pdev, void *arg);
> > +    void *arg;
> > +    int rc;
> > +};
> > +
> > +static int cf_check iterate_all(struct pci_seg *pseg, void *arg)
> > +{
> > +    struct segment_iter *iter = arg;
> > +    struct pci_dev *pdev;
> > +
> > +    list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
> > +    {
> > +        int rc = iter->handler(pdev, iter->arg);
> > +
> > +        if ( !iter->rc )
> > +            iter->rc = rc;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +/*
> > + * Iterate without locking or preemption over all PCI devices known by Xen.
> > + * Expected to be called with interrupts disabled.
> > + */
> > +int pci_iterate_devices(int (*handler)(struct pci_dev *pdev, void *arg),
> > +                        void *arg)
> > +{
> > +    struct segment_iter iter = {
> > +        .handler = handler,
> > +        .arg = arg,
> > +    };
> > +
> > +    ASSERT(!local_irq_is_enabled());
> 
> I'm not sure we want to go this far. Maybe my earlier comment was ambiguous
> though. What I meant is that the function needs to be documented to be
> prepared to be called with IRQs off. I didn't mean that to be a requirement
> to call the function (as there's no dependency on that, afaics).

Well, I mostly did this because the function is traversing the list of
PCI devices list without any locking, and wanted to make it clear
interrupts might not be safe in case they perform modifications to the
list of PCI devices (I don't think we have such usage).

Since I need to do a v4 of this one I don't mind dropping the assert.

Thanks, Roger.

