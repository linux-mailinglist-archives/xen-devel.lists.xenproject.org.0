Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AB41F4A31
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 01:55:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jio5g-0001AL-J8; Tue, 09 Jun 2020 23:55:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EX0f=7W=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jio5e-0001AF-Tb
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 23:55:35 +0000
X-Inumbo-ID: b528404e-aaac-11ea-b7bb-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b528404e-aaac-11ea-b7bb-bc764e2007e4;
 Tue, 09 Jun 2020 23:55:34 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id o26so105247edq.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 16:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GV/A4Kh8sVQ2w1SEO1QkQrrDgKaqgB1xllhmlI0qHTg=;
 b=vTyhtxW+0A8Wk5HyQj2FuhuLr6h1tNuBVWhi3IuMikW/3jRpbWjePVyRyojdzPHAFI
 G6lhh36ugDN57tHgPSr6YX1RHoPMNAgeHDm366KrZiZ/+8uToeMUORc2/PsWPxiyfmD0
 Az5ijpkiIVTAbSYazoi4vNxMcMB440cD/EiqOH11h5TPjdRukQzSicYjG/fKUSKj3L1v
 opmrUXP3PBV9NCIxHAGB7mYq7a7xhJk8IHNvk3qPWUD2uUElrqCjGW+HXxU8cuOYAVFG
 6kY3IymVxz50TX6E2rpiFa+FFFlcU8QApy4hAgFHKdQvLt4kH3lGKSJtSfA60jq0Knc0
 vLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GV/A4Kh8sVQ2w1SEO1QkQrrDgKaqgB1xllhmlI0qHTg=;
 b=mH/nfZTCMwP4IBW5Kyl5O+KmBxJaUqZLjx+aTYM4GOXXV6UF8hr+bVzuqwxVbx8hxO
 MLJS1x25uio9S1Y90bzXXAficuPO759E9KhXYEcWEdU5YZERIHauLO546gUxsmmKZ0rF
 eyi7osJOEmkUUNnfyp28/l2mPOpMo9TIV6wbM9EyMb8DQ14L4cw/n2B1d784RVGjx4nF
 o4YNbmTE+Tzf1pVMUvs5UhigRSpVedfI6me/XvciM39XPjWLOok1hdjI48ujBXPlcRu3
 Di9WGIb11R4+LpjX8kF/96yMe64QExT6nC/3d8PGxrpE5vHL15RzzXPqSYXoti8Mkqj2
 0rSA==
X-Gm-Message-State: AOAM532WlHXT4pcBge3/lQdIYcDOfB+48kgsAaiIvjWSew/XUD9j9yjT
 2yH0hNn3AUseu+hN34xSiJ67XbFCPA4=
X-Google-Smtp-Source: ABdhPJySyz80np8dmlbvxoeVeaqk6d9QP2lR8f8yW5dYONC+BFLgxvuJ9/7n2maaqtxTTO21TeiYqg==
X-Received: by 2002:a50:bf0e:: with SMTP id f14mr213117edk.37.1591746932556;
 Tue, 09 Jun 2020 16:55:32 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50])
 by smtp.gmail.com with ESMTPSA id f19sm15796272edq.14.2020.06.09.16.55.31
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 16:55:31 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id j10so212435wrw.8
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 16:55:31 -0700 (PDT)
X-Received: by 2002:adf:f0c6:: with SMTP id x6mr371356wro.301.1591746931082;
 Tue, 09 Jun 2020 16:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1591017086.git.tamas.lengyel@intel.com>
 <a7ecf7703357130dbd9f23481d39adafea569872.1591017086.git.tamas.lengyel@intel.com>
 <MWHPR11MB16457D9235F56F9F10BDFE358C820@MWHPR11MB1645.namprd11.prod.outlook.com>
 <MWHPR11MB1645DBCA96748D2E924275288C820@MWHPR11MB1645.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB1645DBCA96748D2E924275288C820@MWHPR11MB1645.namprd11.prod.outlook.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 9 Jun 2020 17:54:50 -0600
X-Gmail-Original-Message-ID: <CABfawhnKP2=m5U65MxkaRqOcGDyWbkKnvhucfyqzsNKUKpPu-g@mail.gmail.com>
Message-ID: <CABfawhnKP2=m5U65MxkaRqOcGDyWbkKnvhucfyqzsNKUKpPu-g@mail.gmail.com>
Subject: Re: [PATCH v19 for-4.14 01/13] x86/mem_sharing: block interrupt
 injection for forks
To: "Tian, Kevin" <kevin.tian@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "Lengyel, Tamas" <tamas.lengyel@intel.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 9, 2020 at 5:53 PM Tian, Kevin <kevin.tian@intel.com> wrote:
>
> > From: Tian, Kevin
> > Sent: Wednesday, June 10, 2020 7:44 AM
> >
> > > From: Lengyel, Tamas <tamas.lengyel@intel.com>
> > > Sent: Monday, June 1, 2020 9:22 PM
> > >
> > > When running VM forks without device models (QEMU), it may
> > > be undesirable for Xen to inject interrupts. When creating such forks from
> > > Windows VMs we have observed the kernel trying to process interrupts
> > > immediately after the fork is executed. However without QEMU running
> > such
> > > interrupt handling may not be possible because it may attempt to interact
> > > with
> > > devices that are not emulated by a backend. In the best case scenario such
> >
> > I asked this question before. the interrupts could come from Xen itself, e.g.
> > due to timer virtualization. So I didn't get why it's desired to block all
> > interrupts
> > just because no QEMU is running. Also it's weird why Windows VMs are
> > observed to process interrupts that are generated by QEMU when no such
> > backend emulation exists at all. It sounds like a workaround instead of a real
> > fix...
>
> ok, I rechecked your reply. Looks it's about the case that parent VM has QEMU
> and pending interrupts while you fork it into child VMs without QEMU so those
> pending interrupts become problematic.
>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

HI Kevin,
thanks! That's the case but really we just want to block all
interrupts irrespective of where the are coming from. The fork VMs are
being reset hundreds or thousands of times per second during fuzzing,
so there is no point in injecting any interrupt at all in that
particular use-case.

Tamas

