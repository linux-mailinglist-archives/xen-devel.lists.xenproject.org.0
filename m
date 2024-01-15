Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8192982D558
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 09:53:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667221.1038263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPIic-0002C4-V2; Mon, 15 Jan 2024 08:53:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667221.1038263; Mon, 15 Jan 2024 08:53:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPIic-0002AV-SN; Mon, 15 Jan 2024 08:53:18 +0000
Received: by outflank-mailman (input) for mailman id 667221;
 Mon, 15 Jan 2024 08:53:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0sJ=IZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rPIia-0002AP-Om
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 08:53:16 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 854ad33f-b383-11ee-98f1-6d05b1d4d9a1;
 Mon, 15 Jan 2024 09:53:15 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3366ddd1eddso6999930f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 00:53:15 -0800 (PST)
Received: from localhost ([213.195.127.68]) by smtp.gmail.com with ESMTPSA id
 x18-20020adfffd2000000b003377680c55bsm11275017wrs.16.2024.01.15.00.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 00:53:14 -0800 (PST)
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
X-Inumbo-ID: 854ad33f-b383-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705308795; x=1705913595; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HIUKF3lLqQzKZ1u6IfeqNjZ2oNZaRqnWVzcYniBTp14=;
        b=FspunkgFZD6FOjTUOTtk8mr4DGpI8BQzVS2e3LCOnSFJeVr5GYC1CDq3l6ej37oGR3
         SSuknGZOMomT9w2gctUViMPjsFPaTKkC+BaaZFRWwZNsP4iD8bztd+s27hvNC8soQNU8
         8yaHhh4I2euz/xzP/NGLcQ52RKflfcUal6EGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705308795; x=1705913595;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HIUKF3lLqQzKZ1u6IfeqNjZ2oNZaRqnWVzcYniBTp14=;
        b=cciCKCo9xkxK7XRbI7gFFlH43Aw/K64O90ucF2IdEZq3y/tAEabsq/anLAxXAKsD0u
         wWSFwonohDABRHFkidJ8CY6yxOJ2FmIEyuzUKtvszpyI6+FDYyfut7cu8HagNOBrHVyv
         v5Ki3TvhTb5y0MxSCNZz6pPKTPCyT9LMo4vXMSiE1hDVPEo0WQwjQmPpeEtbTcpQd/dd
         +zrIMcignjStc+GGYLnKgOWGEYPQLhMGCaHVjvb+AkSRB8IM5JRcKNFsWnhmrAApcNRW
         Aq+zEFJ1sYlz6XgXHk6DrUokofy+0BA/PSeUdaU+EoLzdLaOqCu9UmtqMrIP8tVY4Cli
         5D9w==
X-Gm-Message-State: AOJu0YxfwAKTqn3nzJNBaaIgQiwROkZA+EtLYFVxMbQ/dGw/jQd+Liwa
	/776ugZM35WtXN0PrGP9Gt5yO1zEI2yNWw==
X-Google-Smtp-Source: AGHT+IEqcR6C7rorzKXEs2l2QRXS5RLRMKRaeWDUQeRFbczKfd3zk00JJ3681tKSaJNIvfEPRL9V8w==
X-Received: by 2002:adf:f44e:0:b0:337:7d38:4e94 with SMTP id f14-20020adff44e000000b003377d384e94mr1579426wrp.202.1705308794981;
        Mon, 15 Jan 2024 00:53:14 -0800 (PST)
Date: Mon, 15 Jan 2024 09:53:14 +0100
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
Subject: Re: [PATCH v12 01/15] vpci: use per-domain PCI lock to protect vpci
 structure
Message-ID: <ZaTyehqxp_q9wY3Y@macbook>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-2-stewart.hildebrand@amd.com>
 <ZaFDS7uZgW5l0eHG@macbook>
 <590a157a-b9d4-4d2d-8aff-6584da3045c3@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <590a157a-b9d4-4d2d-8aff-6584da3045c3@amd.com>

On Fri, Jan 12, 2024 at 12:54:56PM -0500, Stewart Hildebrand wrote:
> On 1/12/24 08:48, Roger Pau Monné wrote:
> > On Tue, Jan 09, 2024 at 04:51:16PM -0500, Stewart Hildebrand wrote:
> >> @@ -202,8 +204,20 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
> >>      struct map_data data = { .d = d, .map = true };
> >>      int rc;
> >>  
> >> +    ASSERT(rw_is_write_locked(&d->pci_lock));
> >> +
> >>      while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) == -ERESTART )
> >> +    {
> >> +        /*
> >> +         * It's safe to drop and reacquire the lock in this context
> >> +         * without risking pdev disappearing because devices cannot be
> >> +         * removed until the initial domain has been started.
> >> +         */
> >> +        write_unlock(&d->pci_lock);
> >>          process_pending_softirqs();
> >> +        write_lock(&d->pci_lock);
> > 
> > Hm, I should have noticed before, but we already call
> > process_pending_softirqs() with the pdev->vpci->lock held here, so it
> > would make sense to drop it also.
> 
> I don't quite understand this, maybe I'm missing something. I don't see where we acquire pdev->vpci->lock before calling process_pending_softirqs()?
> 
> Also, I tried adding
> 
>     ASSERT(!spin_is_locked(&pdev->vpci->lock));
> 
> both here in apply_map() and in vpci_process_pending(), and they haven't triggered in either dom0 or domU test cases, tested on both arm and x86.

I think I was confused.  Are you sure that pdev->vpci->lock is taken
in the apply_map() call?  I was mistakenly assuming that
vpci_add_handlers() called the init function with the vpci->lock
taken, but that doesn't seem to be case with the current code.  That
leads to apply_map() also being called without the vpci->lock taken.

I was wrongly assuming that apply_map() was called with the vpci->lock
lock taken, and that would need dropping around the
process_pending_softirqs() call.

Thanks, Roger.

