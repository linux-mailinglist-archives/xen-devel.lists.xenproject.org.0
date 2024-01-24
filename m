Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA6E83A552
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 10:25:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670840.1043900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSZV5-000824-5T; Wed, 24 Jan 2024 09:24:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670840.1043900; Wed, 24 Jan 2024 09:24:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSZV5-0007zU-2D; Wed, 24 Jan 2024 09:24:51 +0000
Received: by outflank-mailman (input) for mailman id 670840;
 Wed, 24 Jan 2024 09:24:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3ap=JC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rSZV3-0007zH-Uo
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 09:24:49 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bae4eb4-ba9a-11ee-98f5-6d05b1d4d9a1;
 Wed, 24 Jan 2024 10:24:49 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a2dc7827a97so577998566b.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 01:24:49 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 c3-20020a17090654c300b00a2a2426728bsm15379886ejp.178.2024.01.24.01.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 01:24:48 -0800 (PST)
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
X-Inumbo-ID: 6bae4eb4-ba9a-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706088288; x=1706693088; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V4EwUoOZBbZsvLoA6UXEk6Wj7UQEbhyHy+fuu11Fi7A=;
        b=O2JnU1fwQeSUbjsGzGYJQg36Fb3M/oSzhKVqFoWxcLwPmJoGahX1PVwhRW+4VWHWQw
         W0+lSukOOd2pMEuupaqHrjp1gpwkDeNmdM41UHxM1bgEsfCVLkw5RAJvA1zexXOE2BFV
         0w6CJ8m4yfDDyokMwBctoPjfMKh2rrFqPBSXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706088288; x=1706693088;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V4EwUoOZBbZsvLoA6UXEk6Wj7UQEbhyHy+fuu11Fi7A=;
        b=khT0VWtQtfQ7r5lusa+CP/SHKU4+oxtglRUOqDadE7pWJkWiaHT15B0YUITG17KPvA
         Wk2rQWOwfiKvyWwXn4Jo2fQpUbs1Izln/bo1JLTJi2jubhewB5G0lwzx5MKNkBnRQjD2
         ceAX2dZOXpvqtlZHmMbEPKAdUuUZ8qK/rtRnTbrCZO9QntFKX+6DhcyrlVrH5BaXjiIl
         OhkAq4IJif6AEGYy8LF5V3zka03av49MLqde2MbkOJtEAxuQhtarjaQvCiDIC8s14Pei
         Skf2STbE3g2TVVWrQWk5l8cIdwOoe/IABb9NrNzstJarmrRAV247TzzCrAliTcChz0Fm
         Ly6Q==
X-Gm-Message-State: AOJu0YxpBumz8s8prC40HRlFAiaxfmjKnO06gxNrDjgp+2eZt9hnvwmm
	YOVE9qS4EhYvZFF8QbYI8oeP9DTmd0LbuMS/Z3LEwXIIw30RIAF1tUYbNMY/XHs=
X-Google-Smtp-Source: AGHT+IG1vDeZ++GJaS0LfVwQt0h7tKWomTY+/CT2b92EEpDlL4zJFnBWj8It7Ej/cv4yym8EOjO3TQ==
X-Received: by 2002:a17:906:f8d4:b0:a2e:70b4:28b0 with SMTP id lh20-20020a170906f8d400b00a2e70b428b0mr627726ejb.3.1706088288593;
        Wed, 24 Jan 2024 01:24:48 -0800 (PST)
Date: Wed, 24 Jan 2024 10:24:47 +0100
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
Message-ID: <ZbDXXyucJhLJ4u9H@macbook>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-2-stewart.hildebrand@amd.com>
 <20240115194309.45683-1-stewart.hildebrand@amd.com>
 <715e40c9-1776-4677-9565-dac1565a2aa8@suse.com>
 <Za_WGzS14Eqt8yZF@macbook>
 <ae7a57f2-2433-4b75-ab45-c8be55d489c9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae7a57f2-2433-4b75-ab45-c8be55d489c9@suse.com>

On Wed, Jan 24, 2024 at 09:48:35AM +0100, Jan Beulich wrote:
> On 23.01.2024 16:07, Roger Pau Monné wrote:
> > On Tue, Jan 23, 2024 at 03:32:12PM +0100, Jan Beulich wrote:
> >> On 15.01.2024 20:43, Stewart Hildebrand wrote:
> >>> @@ -2888,6 +2888,8 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
> >>>  {
> >>>      int irq, pirq, ret;
> >>>  
> >>> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
> >>
> >> If either lock is sufficient to hold here, ...
> >>
> >>> --- a/xen/arch/x86/physdev.c
> >>> +++ b/xen/arch/x86/physdev.c
> >>> @@ -123,7 +123,9 @@ int physdev_map_pirq(domid_t domid, int type, int *index, int *pirq_p,
> >>>  
> >>>      case MAP_PIRQ_TYPE_MSI:
> >>>      case MAP_PIRQ_TYPE_MULTI_MSI:
> >>> +        pcidevs_lock();
> >>>          ret = allocate_and_map_msi_pirq(d, *index, pirq_p, type, msi);
> >>> +        pcidevs_unlock();
> >>>          break;
> >>
> > 
> > IIRC (Stewart can further comment) this is done holding the pcidevs
> > lock to keep the path unmodified, as there's no need to hold the
> > per-domain rwlock.
> 
> Yet why would we prefer to acquire a global lock when a per-domain one
> suffices?

I was hoping to introduce less changes, specially if they are not
strictly required, as it's less risk.  I'm always quite worry of
locking changes.

Thanks, Roger.

