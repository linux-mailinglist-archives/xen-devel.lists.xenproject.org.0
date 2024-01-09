Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A38C5828423
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 11:40:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664384.1034577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN9XF-0006KQ-8L; Tue, 09 Jan 2024 10:40:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664384.1034577; Tue, 09 Jan 2024 10:40:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN9XF-0006Ir-5c; Tue, 09 Jan 2024 10:40:41 +0000
Received: by outflank-mailman (input) for mailman id 664384;
 Tue, 09 Jan 2024 10:40:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OpKn=IT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rN9XD-0006If-Iu
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 10:40:39 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86adf7c4-aedb-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 11:40:37 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a29a4f610b1so289803266b.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 02:40:37 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 k5-20020a17090627c500b00a2b1080cba7sm876564ejc.208.2024.01.09.02.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 02:40:36 -0800 (PST)
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
X-Inumbo-ID: 86adf7c4-aedb-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704796837; x=1705401637; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OC/YbqzZnpAN8+MpDaU2gZEdBrAgJyHu38bdIhoY7mU=;
        b=nBnF9/H4hG9g0Q3nhLxOkbgSdBsf2eBsR+1RkAKNR/b5uwuolGawGKnIqghIKfZPa7
         nAeBFayT7qqat74zFxlTrVGOOOP3lY1H6dthO1Ud/5aC32v43Q4bvcNnO8mYg5T4l0NM
         0lx+9OmfoORtNJUPGOHm4HGvbt0baqk9CLCY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704796837; x=1705401637;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OC/YbqzZnpAN8+MpDaU2gZEdBrAgJyHu38bdIhoY7mU=;
        b=W5snD0iBkj+mQqhclNTKxmsUF/B/3pS9pC6TkR2i3nanF9a1xGp4+Vv0GAIEJIs/HG
         9Mw4YSCsC+SA+Qdtt0W69gW7QUPdjdy3db/PfgGe7bOjD5Qm8W/F42neVi7koPfhJjoo
         iCbJ+Y+WrjPVoEgTlIJkrvv0+de/U0KC6CbA8UjLDHXLaaIcFSTbVmZb8v9e1OiDtZjj
         NQkMRZ7QHH90yqHjXX2X6pZ7KA6O/P9ip8LvnpQqkuYQz8ZuG4hFd3BiG6IBAbrNDtVJ
         AJULHhMz/16XIQ9RZG5Zf6VlIjWNMxxo1evB0rsXLBdBnSVU6+zpvzcI7lRQ0D5TPjtg
         ntZQ==
X-Gm-Message-State: AOJu0YxozViLR1saoKUWLA44DroaROtr3WbMgFCvU1EUhM+C3ygH7OO8
	nLhNzsVA+x2JbT471XymLVJg2mNSdbY5nQ==
X-Google-Smtp-Source: AGHT+IFPDmMpOxT0KNoyYz9sdV5GGtthi0mYKM4qVLzm7m3B3/3QQu6dQ08jlNptXF0xW5uWGqg7fw==
X-Received: by 2002:a17:906:f887:b0:a2b:2c8a:9c49 with SMTP id lg7-20020a170906f88700b00a2b2c8a9c49mr444002ejb.16.1704796837191;
        Tue, 09 Jan 2024 02:40:37 -0800 (PST)
Date: Tue, 9 Jan 2024 11:40:36 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC XEN PATCH v4 4/5] domctl: Use gsi to grant/revoke irq
 permission
Message-ID: <ZZ0ipBYirbJnLreJ@macbook>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
 <20240105070920.350113-5-Jiqian.Chen@amd.com>
 <alpine.DEB.2.22.394.2401051702200.3675@ubuntu-linux-20-04-desktop>
 <882bd39a-8a29-4f4f-b64f-765c4858b1c8@suse.com>
 <ZZwPSZoqyY6g9yhi@macbook>
 <BL1PR12MB58492746170F6BF777901141E76A2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b4ed7764-a44c-4ac8-bb56-379fdeba16e8@suse.com>
 <BL1PR12MB58490E62825A5B1ACCE605EAE76A2@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB58490E62825A5B1ACCE605EAE76A2@BL1PR12MB5849.namprd12.prod.outlook.com>

On Tue, Jan 09, 2024 at 10:16:26AM +0000, Chen, Jiqian wrote:
> On 2024/1/9 17:38, Jan Beulich wrote:
> > On 09.01.2024 09:18, Chen, Jiqian wrote:
> >> On 2024/1/8 23:05, Roger Pau Monné wrote:
> >>> On Mon, Jan 08, 2024 at 09:55:26AM +0100, Jan Beulich wrote:
> >>>> On 06.01.2024 02:08, Stefano Stabellini wrote:
> >>>>> On Fri, 5 Jan 2024, Jiqian Chen wrote:
> >>>>>> --- a/tools/libs/light/libxl_pci.c
> >>>>>> +++ b/tools/libs/light/libxl_pci.c
> >>>>>> @@ -1418,6 +1418,7 @@ static void pci_add_dm_done(libxl__egc *egc,
> >>>>>>      unsigned long long start, end, flags, size;
> >>>>>>      int irq, i;
> >>>>>>      int r;
> >>>>>> +    int gsi;
> >>>>>>      uint32_t flag = XEN_DOMCTL_DEV_RDM_RELAXED;
> >>>>>>      uint32_t domainid = domid;
> >>>>>>      bool isstubdom = libxl_is_stubdom(ctx, domid, &domainid);
> >>>>>> @@ -1486,6 +1487,7 @@ static void pci_add_dm_done(libxl__egc *egc,
> >>>>>>          goto out_no_irq;
> >>>>>>      }
> >>>>>>      if ((fscanf(f, "%u", &irq) == 1) && irq) {
> >>>>>> +        gsi = irq;
> >>>>>
> >>>>> A question for Roger and Jan: are we always guaranteed that gsi == irq
> >>>>> (also in the PV case)?
> >>>>
> >>>> Iirc for IO-APIC based IRQs that's always the case;
> >>>
> >>> I think that's always the case on Linux, because it calls
> >>> PHYSDEVOP_map_pirq with index == pirq (see Linux
> >>> pci_xen_initial_domain()).  But other OSes could possibly make the
> >>> call with pirq == -1 and get a randomly allocated pirq for GSIs.
> >> I don't think it's important whether pirq is randomly generated. What's important is whether irq always equals gsi in xen.

My 'randomly generated' comment was in that direction, not so much as
the pirq being truly random, but no longer matching the gsi.

> >> If so, we can directly pass in and grant gsi. However, according to Jan's previous email reply, in the case of Msi, irq may not be equal to gsi, so my patch cannot meet this situation.
> >> I am confusing if the current domain doesn't have PIRQ flag, then regarding to XEN_DOMCTL_irq_permission, which kind of irq we should grant to caller domain? The gsi or other irq?
> >> Or can we add a check in XEN_DOMCTL_irq_permission, if the current domain has PRIQ, we can get irq from pirq(like the original implementation), if not we can assign gsi to irq, and then grant irq. Of course, that needs to require the caller to pass in both the pirq and gsi.
> > 
> > I expect MSI will need handling differently from GSIs. When MSI is
> > set up for a device (and hence for a domain in possession of that
> > device), access ought to be granted right away.
> > 
> >>> IOW: I don't think the pirq field in xen_domctl_irq_permission can be
> >>> altered like proposed here to switch from passing a pirq to a GSI.  A
> >>> new hypercall should be introduced that either is GSI specific, or
> >>> contains a type field in order to specify the namespace the field
> >>> targets.
> >> A new hypercall using for granting gsi? If so, how does the caller know to call which hypercall to grant permission, XEN_DOMCTL_irq_permission or that new hypercall?
> > 
> > Either we add a feature indicator, or the caller simply tries the
> > new GSI interface first.
> I am still not sure how to use and implement it.
> Taking pci_add_dm_done as an example, for now its implementation is:
> pci_add_dm_done
> 	xc_physdev_map_pirq
> 	xc_domain_irq_permission(,,pirq,)
> 		XEN_DOMCTL_irq_permission
> 
> And assume the new hypercall is XEN_DOMCTL_gsi_permission, do you mean:
> pci_add_dm_done
> 	xc_physdev_map_pirq
> 	ret = xc_domain_gsi_permission(,,gsi,)
> 		XEN_DOMCTL_gsi_permission

Making this first call would also depend on whether the 'gsi' can be
fetched from sysfs, otherwise the call should be avoided.

> 	if ( ret != 0 )
> 		xc_domain_irq_permission(,,pirq,)
> 			XEN_DOMCTL_irq_permission

You can only fallback when you have the pirq (ie: when in a PV dom0),
on a PVH dom0 there's no pirq, so no fallback.

The code in pci_add_dm_done() must be aware of this, and only fallback
when in PV dom0.

> But if so, I have a question that in XEN_DOMCTL_gsi_permission, when to fail and when to success?
> 
> Or do you mean:
> pci_add_dm_done
> 	xc_physdev_map_pirq
> 	ret = xc_domain_irq_permission(,,pirq,)
> 		XEN_DOMCTL_irq_permission
> 	if ( ret != 0 )
> 		xc_domain_gsi_permission(,,gsi,)
> 			XEN_DOMCTL_gsi_permission
> And in XEN_DOMCTL_gsi_permission, as long as the current domain has the access of gsi, then granting gsi to caller should be successful. Right?

No, I think that would be backwards, the logic above looks correct
regarding the ordering of the hypercalls.

Thanks, Roger.

