Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB67829D70
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 16:21:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665606.1035831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNaOb-0000V0-Bc; Wed, 10 Jan 2024 15:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665606.1035831; Wed, 10 Jan 2024 15:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNaOb-0000So-8p; Wed, 10 Jan 2024 15:21:33 +0000
Received: by outflank-mailman (input) for mailman id 665606;
 Wed, 10 Jan 2024 15:21:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sd/G=IU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rNaOa-0000Si-5C
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 15:21:32 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee973f71-afcb-11ee-98f0-6d05b1d4d9a1;
 Wed, 10 Jan 2024 16:21:31 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50e67e37661so5318580e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 07:21:31 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 h14-20020a170906590e00b00a26c2f13b73sm2225050ejq.143.2024.01.10.07.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 07:21:30 -0800 (PST)
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
X-Inumbo-ID: ee973f71-afcb-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704900091; x=1705504891; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xtkkJdbwaK1+r1hIy4LjxZaU9Yqe/RpF78GJPujKu4g=;
        b=TNp0bsIiSDW9y86dDTo4qHBBLgjzaPEs9rinpfPpeEmaQ1quj8H/EqLdxnFYI85UC9
         rRPCsXOAw1XO7GXl80j9Cc/akXlsJTkjjNTVfi6HbIyGHSexHG2Mzf7JhInMOpbuXEGa
         7EW58zad5tPwe0uPWX5ilA9eyq92e4c6EQhEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704900091; x=1705504891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtkkJdbwaK1+r1hIy4LjxZaU9Yqe/RpF78GJPujKu4g=;
        b=pGrb3scPR4or983GGaGt0/q4VKhIsWzu3SjH92f4N28In1jsCmEzBXy6Ns/r1mKGnj
         Dp2SAfgDtFxKH9ANpHaYoz2ImwhJrctwoKa82acos9XpqIQ48pKt5IQF40goXuhf3/b7
         S6UkF9Vfkt6X0k4Oc4l2qpZt+IzqVRwi+asiNKcU2LySL0UmOj8/IercNz5A56EGEwwp
         ecrYHa3hm+/1yrLxPuQ53ZHAJr3maKJhbCNh8cfJmxv/2Wvg0wdBvRLvfrGB5a7bZ4ki
         5fd1C+nZ5cLtdn0KXUfEkrEYeO8WISwJBwGAhyuP4oGJQphmx+7YU5DRW+Aybi4A9UVJ
         qShg==
X-Gm-Message-State: AOJu0Yz1e1oim00dupOOXqYpoIEy2JNx4ChTJEZqNM1AjUO2qtH3XqKh
	ep6us0VZzPDGLaID/N+JNHzh55o0RAQIcQ==
X-Google-Smtp-Source: AGHT+IFVTnbn0tT1UnBt4XOGBpZFJ4abzkQfbf8FOLEGgGkWkgsxJAKXLOjo2sJaMZ0TW5pk14J4BA==
X-Received: by 2002:a19:2d5b:0:b0:50e:7a10:af78 with SMTP id t27-20020a192d5b000000b0050e7a10af78mr589123lft.57.1704900090657;
        Wed, 10 Jan 2024 07:21:30 -0800 (PST)
Date: Wed, 10 Jan 2024 16:21:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/hvm: don't expose XENFEAT_hvm_pirqs by default
Message-ID: <ZZ61-SNkrKo12cwb@macbook>
References: <20240110095311.61809-1-roger.pau@citrix.com>
 <238b79f5-0510-4306-9c32-19dade08e819@suse.com>
 <ef67e4b1-3b1e-4cca-b431-cc46464700ca@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ef67e4b1-3b1e-4cca-b431-cc46464700ca@amd.com>

On Wed, Jan 10, 2024 at 03:47:12PM +0200, Xenia Ragiadakou wrote:
> 
> 
> On 10/1/24 12:26, Jan Beulich wrote:
> > On 10.01.2024 10:53, Roger Pau Monne wrote:
> > > The HVM pirq feature allows routing interrupts from both physical and emulated
> > > devices over event channels, this was done a performance improvement.  However
> > > its usage is fully undocumented, and the only reference implementation is in
> > > Linux.  It defeats the purpose of local APIC hardware virtualization, because
> > > when using it interrupts avoid the usage of the local APIC altogether.
> > 
> > So without sufficient APIC acceleration, isn't this arranging for degraded
> > performance then? IOW should the new default perhaps be dependent on the
> > degree of APIC acceleration?
> > 
> > > It has also been reported to not work properly with certain devices, at least
> > > when using some AMD GPUs Linux attempts to route interrupts over event
> > > channels, but Xen doesn't correctly detect such routing, which leads to the
> > > hypervisor complaining with:
> > > 
> > > (XEN) d15v0: Unsupported MSI delivery mode 7 for Dom15
> > > 
> > > When MSIs are attempted to be routed over event channels the entry delivery
> > > mode is set to ExtINT, but Xen doesn't detect such routing and attempts to
> > > inject the interrupt following the native MSI path, and the ExtINT delivery
> > > mode is not supported.
> > 
> > Shouldn't this be properly addressed nevertheless? The way it's described
> > it sounds as if MSI wouldn't work at all this way; I can't spot why the
> > issue would only be "with certain devices". Yet that in turn doesn't look
> > to be very likely - pass-through use cases, in particular SR-IOV ones,
> > would certainly have noticed.
> 
> The issue gets triggered when the guest performs save/restore of MSIs,
> because PHYSDEVOP_map_pirq is not implemented for MSIs, and thus, QEMU
> cannot remap the MSI to the event channel once unmapped.

I'm kind of confused by this sentence, PHYSDEVOP_map_pirq does support
MSIs, see xc_physdev_map_pirq_msi() helper in Xen code base.

> So, to fix this issue either would be needed to change QEMU to not unmap
> pirq-emulated MSIs or to implement PHYSDEVOP_map_pirq for MSIs.
> 
> But still, even when no device has been passed-through, scheduling latencies
> (of hundreds of ms), were observed in the guest even when running a simple
> loop application, that disappear once the flag is disabled. We did not have
> the chance to root cause it further.

So XENFEAT_hvm_pirqs is causing such latency issues?  That I certainly
didn't notice.

Regards, Roger.

