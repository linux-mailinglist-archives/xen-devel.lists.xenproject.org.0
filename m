Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1F983B06B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 18:52:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671198.1044431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rShPE-0007ry-0f; Wed, 24 Jan 2024 17:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671198.1044431; Wed, 24 Jan 2024 17:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rShPD-0007ps-UE; Wed, 24 Jan 2024 17:51:19 +0000
Received: by outflank-mailman (input) for mailman id 671198;
 Wed, 24 Jan 2024 17:51:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3ap=JC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rShPC-0007oN-IM
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 17:51:18 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c8ed2d4-bae1-11ee-98f5-6d05b1d4d9a1;
 Wed, 24 Jan 2024 18:51:17 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40eb99a72dcso22337935e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 09:51:17 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 jg25-20020a05600ca01900b0040e5034d8e0sm348758wmb.43.2024.01.24.09.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 09:51:16 -0800 (PST)
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
X-Inumbo-ID: 2c8ed2d4-bae1-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706118677; x=1706723477; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qkv9S6EA2vAXDWj+0n1XIHPUiPzgbSxqqzLliHK3F5A=;
        b=TJAfZHM/xMy/ioLoGLrPhvZxgcKprzQPAo/YxumpzAdGP7edlBc7iPumpZDN2qiLyL
         oV6YYU+Qr7F3ozMfVTiq+W9uY5U9wcFAFaMMUQ+VNtX5pUsQzS8TU0WmyhqJTU+sLJPo
         oDU4hj36grCgF/iXAXgX8cUKEqtvbR0tbbaUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706118677; x=1706723477;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qkv9S6EA2vAXDWj+0n1XIHPUiPzgbSxqqzLliHK3F5A=;
        b=Zn3emvTBdRWxYtyzN/XDHGCZh+eTWWyva+Kyf34icwYDZRXkQ+V5O3sjXtyxP9hZMv
         r8dmWa739cn20zhhtgn5DONOjLBI9lJMv6Sd64XmcwS5CpkFN+0vf2h58VBVal5KzY5M
         HDtCJN+v073KU8Q99NRqTLLXistyer3gGh/iIFm+4fTratfeuggaVSR6KazAtdsFFb1U
         aEoeMdUo00DkNRllT9F7/6fRb+vRoED1CQhos6IyckDp4DsAiXm/THXYY02JeVhaxNZp
         EDhpBHVVGTC6dyW9Wxl8IMh4J45z4yyKgCe8GuWFvY6s+hWvIyd9dRMRBqkNliNQiSz8
         tQOQ==
X-Gm-Message-State: AOJu0Yxpf6dz7DnHJXNRLsJ/jSHRjukW3wOejXF6jXUG0Wn4vz5r5hgv
	MbyjgQVNS75vrHnUCVM+rwAs2rrSvH7xT9mD1O2WBXtf2jjRkW/FhXCigPzW7eM=
X-Google-Smtp-Source: AGHT+IEoWhWHv7rFIGr98dunGN5WlqLrM11UcJZMpc7liQDhZtKnWjaep/901ESi4fZGY6tOmXh96g==
X-Received: by 2002:a05:600c:880f:b0:40e:49c4:43c7 with SMTP id gy15-20020a05600c880f00b0040e49c443c7mr1334489wmb.159.1706118676900;
        Wed, 24 Jan 2024 09:51:16 -0800 (PST)
Date: Wed, 24 Jan 2024 18:51:15 +0100
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
Message-ID: <ZbFOE6kV7NXFrNjb@macbook>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-2-stewart.hildebrand@amd.com>
 <20240115194309.45683-1-stewart.hildebrand@amd.com>
 <715e40c9-1776-4677-9565-dac1565a2aa8@suse.com>
 <Za_WGzS14Eqt8yZF@macbook>
 <ae7a57f2-2433-4b75-ab45-c8be55d489c9@suse.com>
 <ZbDXXyucJhLJ4u9H@macbook>
 <a3233487-965b-49ae-bebe-e5476fcda29c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3233487-965b-49ae-bebe-e5476fcda29c@suse.com>

On Wed, Jan 24, 2024 at 12:34:10PM +0100, Jan Beulich wrote:
> On 24.01.2024 10:24, Roger Pau Monné wrote:
> > On Wed, Jan 24, 2024 at 09:48:35AM +0100, Jan Beulich wrote:
> >> On 23.01.2024 16:07, Roger Pau Monné wrote:
> >>> On Tue, Jan 23, 2024 at 03:32:12PM +0100, Jan Beulich wrote:
> >>>> On 15.01.2024 20:43, Stewart Hildebrand wrote:
> >>>>> @@ -2888,6 +2888,8 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
> >>>>>  {
> >>>>>      int irq, pirq, ret;
> >>>>>  
> >>>>> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
> >>>>
> >>>> If either lock is sufficient to hold here, ...
> >>>>
> >>>>> --- a/xen/arch/x86/physdev.c
> >>>>> +++ b/xen/arch/x86/physdev.c
> >>>>> @@ -123,7 +123,9 @@ int physdev_map_pirq(domid_t domid, int type, int *index, int *pirq_p,
> >>>>>  
> >>>>>      case MAP_PIRQ_TYPE_MSI:
> >>>>>      case MAP_PIRQ_TYPE_MULTI_MSI:
> >>>>> +        pcidevs_lock();
> >>>>>          ret = allocate_and_map_msi_pirq(d, *index, pirq_p, type, msi);
> >>>>> +        pcidevs_unlock();
> >>>>>          break;
> >>>>
> >>>
> >>> IIRC (Stewart can further comment) this is done holding the pcidevs
> >>> lock to keep the path unmodified, as there's no need to hold the
> >>> per-domain rwlock.
> >>
> >> Yet why would we prefer to acquire a global lock when a per-domain one
> >> suffices?
> > 
> > I was hoping to introduce less changes, specially if they are not
> > strictly required, as it's less risk.  I'm always quite worry of
> > locking changes.
> 
> In which case more description / code commenting is needed. The pattern
> of the assertions looks dangerous.

Is such dangerousness perception because you fear some of the pcidevs
lock usage might be there not just for preventing the pdev from going
away, but also to guarantee exclusive access to certain state?

> Even if (as you say in a later reply)
> this is only temporary, we all know how long "temporary" can be. It
> might even be advisable to introduce a helper construct.

The aim here was to modify as little as possible, in order to avoid
having to analyze all possible users of pcidevs lock, and thus not
block the vPCI work on the probably lengthy and difficult analysis.

Not sure adding a construct makes is much better, as I didn't want to
give the impression all checks for the pcidevs lock can merely be
replaced by the new construct.

Thanks, Roger.

