Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA147FEC84
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 11:07:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644521.1005636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8dwd-0004i2-Bm; Thu, 30 Nov 2023 10:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644521.1005636; Thu, 30 Nov 2023 10:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8dwd-0004gK-92; Thu, 30 Nov 2023 10:06:55 +0000
Received: by outflank-mailman (input) for mailman id 644521;
 Thu, 30 Nov 2023 10:06:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Jom=HL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r8dwb-0004gE-DM
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 10:06:53 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e6b6d1f-8f68-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 11:06:51 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40838915cecso6169495e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 Nov 2023 02:06:51 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 fc9-20020a05600c524900b0040b34720206sm1438474wmb.12.2023.11.30.02.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 02:06:50 -0800 (PST)
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
X-Inumbo-ID: 2e6b6d1f-8f68-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701338811; x=1701943611; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ByncsgI/LjtaL2chleaxOWtmdKGgd4kGHdutTTNQQIA=;
        b=ZilYyocjmSYoYyP9yJrwjmhlnUvLduwkTySEqlzKU+tZ7o3BucLS/6V83ZnedS7Xrk
         JqMtflbSUuGGezO2tq12yXgOMyH1CalSNcN15mYdUrDUdHERqcBlXSZOT0dIOmO1Tzee
         WItol/jXK5nhpJECNFyHgh4xzDo3vS6MEit28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701338811; x=1701943611;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ByncsgI/LjtaL2chleaxOWtmdKGgd4kGHdutTTNQQIA=;
        b=i1QiEaIKiRDYXlXKaGAGVMvF7qB6C+YjQhpa1hwc49zFIqIU9/J1wW2bDMeTyZThYl
         cQUBxkvk+2a5fwyBY+wUQUdGt2dYvOhC2+bG6xy+D0IpkbLU7Yr9rAbAZ4lUEbOMjQCY
         6oH3byqbfcv/x/WznS0/B4SrRYejP5skLaojFmqrc3xXAIQ0POgFgHUizmsauP2rgchQ
         o2u8V2NAz6f9fmsGiSO4xlh+F6tamEeQzX8EF1/XBS0m71sQrs42wrx6WffIb95C7oIp
         xQN/7LtXoMrnmautSyUrVsnhbRWE4dy7zYFs0/1RJb5W+55t7QNfeA0Y1q+AnVY7Fsa0
         k5ZA==
X-Gm-Message-State: AOJu0YxchtsC5Q9rInyf2R+pzbK6PDW/6l3/+AYc6xuhNoRsFdaB0kJC
	LHImL5sBPgZ9LoIEp7e4KMvieA==
X-Google-Smtp-Source: AGHT+IHa2FYNgAtOkAXgt7fgI4kDWRYmH8MDunnlID0kVtigCIQ383l1qhxArG54QJFKpoIwntUm+Q==
X-Received: by 2002:a05:600c:3505:b0:40a:5129:c284 with SMTP id h5-20020a05600c350500b0040a5129c284mr12124244wmq.35.1701338810743;
        Thu, 30 Nov 2023 02:06:50 -0800 (PST)
Date: Thu, 30 Nov 2023 11:06:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Alex Deucher <Alexander.Deucher@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Huang Rui <Ray.Huang@amd.com>,
	Honglei Huang <Honglei1.Huang@amd.com>,
	Julia Zhang <Julia.Zhang@amd.com>
Subject: Re: [RFC XEN PATCH v2 3/3] tools: Add new function to get gsi from
 irq
Message-ID: <ZWheuUjLxShoQ_qn@macbook>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
 <20231124104136.3263722-4-Jiqian.Chen@amd.com>
 <ZWX4R9UEE6oXiqaz@macbook>
 <alpine.DEB.2.22.394.2311291937170.3533093@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2311291956130.3533093@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2311291956130.3533093@ubuntu-linux-20-04-desktop>

On Wed, Nov 29, 2023 at 08:02:40PM -0800, Stefano Stabellini wrote:
> n Wed, 29 Nov 2023, Stefano Stabellini wrote:
> > On Tue, 28 Nov 2023, Roger Pau Monné wrote:
> > > On Fri, Nov 24, 2023 at 06:41:36PM +0800, Jiqian Chen wrote:
> > > > In PVH dom0, it uses the linux local interrupt mechanism,
> > > > when it allocs irq for a gsi, it is dynamic, and follow
> > > > the principle of applying first, distributing first. And
> > > > if you debug the kernel codes, you will find the irq
> > > > number is alloced from small to large, but the applying
> > > > gsi number is not, may gsi 38 comes before gsi 28, that
> > > > causes the irq number is not equal with the gsi number.
> > > > And when we passthrough a device, QEMU will use its gsi
> > > > number to do mapping actions, see xen_pt_realize->
> > > > xc_physdev_map_pirq, but the gsi number is got from file
> > > > /sys/bus/pci/devices/xxxx:xx:xx.x/irq in current code,
> > > > so it will fail when mapping.
> > > > And in current codes, there is no method to translate
> > > > irq to gsi for userspace.
> > > 
> > > I think it would be cleaner to just introduce a new sysfs node that
> > > contains the gsi if a device is using one (much like the irq sysfs
> > > node)?
> > > 
> > > Such ioctl to translate from IRQ to GSI has nothing to do with Xen, so
> > > placing it in privcmd does seem quite strange to me.  I understand
> > > that for passthrough we need the GSI, but such translation layer from
> > > IRQ to GSI is all Linux internal, and it would be much simpler to just
> > > expose the GSI in sysfs IMO.
> > 
> > Maybe something to add to drivers/xen/sys-hypervisor.c in Linux.
> > Juergen what do you think?
> 
> Let me also add that privcmd.c is already a Linux specific interface.
> Although it was born to be a Xen hypercall "proxy" in reality today we
> have a few privcmd ioctls that don't translate into hypercalls. So I
> don't think that adding IOCTL_PRIVCMD_GSI_FROM_IRQ would be a problem.

Maybe not all ioctls translate to hypercalls (I guess you are
referring to the IOCTL_PRIVCMD_RESTRICT ioctl), but they are specific
Xen actions.  Getting the GSI used by a device has nothing do to with
Xen.

IMO drivers/xen/sys-hypervisor.c is also not appropriate, but I'm not
the maintainer of any of those components.

There's nothing Xen specific about fetching the GSI associated with a
PCI device.  The fact that Xen needs it for passthrough is just a red
herring, further cases where the GSI is needed might arise outside of
Xen, and hence such node would better be placed in a generic
location.  The right location should be /sys/bus/pci/devices/<sbdf>/gsi.

Thanks, Roger.

