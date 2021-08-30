Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC8D3FB949
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 17:53:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175173.319198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKjaZ-0001NV-0s; Mon, 30 Aug 2021 15:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175173.319198; Mon, 30 Aug 2021 15:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKjaY-0001LC-Tc; Mon, 30 Aug 2021 15:52:46 +0000
Received: by outflank-mailman (input) for mailman id 175173;
 Mon, 30 Aug 2021 15:52:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ySg/=NV=gmail.com=lonyelon@srs-us1.protection.inumbo.net>)
 id 1mKjaX-0001Kn-Cv
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 15:52:45 +0000
Received: from mail-ej1-x631.google.com (unknown [2a00:1450:4864:20::631])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f93340d9-abee-400a-8525-6f1db71bd3f1;
 Mon, 30 Aug 2021 15:52:44 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id n27so32179477eja.5
 for <xen-devel@lists.xenproject.org>; Mon, 30 Aug 2021 08:52:44 -0700 (PDT)
Received: from localhost (host-79-37-188-60.retail.telecomitalia.it.
 [79.37.188.60])
 by smtp.gmail.com with ESMTPSA id j24sm7867334edj.56.2021.08.30.08.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 08:52:42 -0700 (PDT)
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
X-Inumbo-ID: f93340d9-abee-400a-8525-6f1db71bd3f1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=PH1GJR8SexO/UKBLmtFk69D6EteI0Vz3Y9qH+Bg02eQ=;
        b=vb5z/HhtPUclHouLpu5p8Ds97y10ykHwcW+PBhZGcjVpeg4nj/+bBsc0c4U8+K4Q9i
         XEiuxxuyxrx4rZgqWnUzKnrTjFIOSPSegqX/4gnW2hqjcfPYRil3mhFiyPUEVLGtCGOK
         WjPU+OUODFV+vcR2uAjZ/MlbFEdhu6AjSomLqWIh3Me/p8oeGnF0A29HdmQ0faU0YCRG
         fRG+ThgW+QgDIpYWtJ5Muq2l1wM6zAnoKhUV/G3aawS0433gyVkhsoaZVirYtKDtL2dy
         9IndTae+aqzxO+ft2rq5iOZJSWvIUQ1HzD6ifU7e/jYiWteXAnjocd/Ig3bxE6YPagRx
         XOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=PH1GJR8SexO/UKBLmtFk69D6EteI0Vz3Y9qH+Bg02eQ=;
        b=sr/02KhMvKxW3r0WrrlLZa3oAAXOGzzcCEA9emlMwBXkb+mGYuiRQUcnTGmfz10ZJf
         wRf1uqFwgiEoDPrs5opbc18wO7K8m3bnnsb+3NhMR6lQCKvBb7CS7PIJ1Cnpm4ScXMBL
         trcbunPKSNPx9Pripi1ackUNpVzM0w6fm9mzlbeHDdcjMh5aa3H0U4WGns6Z4O+ilynO
         7ks5lgE5DXJLN013zufLqMAMvLB416kJiOKx5Hrcwct33JNXj5uo9v2QYkW+s/5gpPP0
         myaD81TH+vaF20ICOElM12+iKshveJBCF8LH8svGhbqCBY6uX+8aqedcwixzGpcAsCSD
         V1iw==
X-Gm-Message-State: AOAM5301qGYSMuDE/zfPc1OoX9h3vtw+Ou6B1/uj0fy58TAaczWQcm31
	OOEEHsKfvdnVrhhEFsnuR0o=
X-Google-Smtp-Source: ABdhPJw9VzCBcePC+e+V22VC+MNoXy7oGDEupqmDnhVKiizEqkkqfrn2XNANKvjIPlvN6PQY6QZvdA==
X-Received: by 2002:a17:907:20d1:: with SMTP id qq17mr26329059ejb.439.1630338763366;
        Mon, 30 Aug 2021 08:52:43 -0700 (PDT)
Date: Mon, 30 Aug 2021 19:52:36 +0200
From: Sergio =?utf-8?Q?Migu=C3=A9ns?= Iglesias <lonyelon@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, rjw@rjwysocki.net, lenb@kernel.org,
	boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
	konrad.wilk@oracle.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Sergio =?utf-8?Q?Migu=C3=A9ns?= Iglesias <sergio@lony.xyz>
Subject: Re: [PATCH] PCI: Fix general code style
Message-ID: <20210830175236.7d62its7nwqosuwk@archlap>
References: <20210804222832.1023161-1-sergio@lony.xyz>
 <20210825204356.GA3601025@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210825204356.GA3601025@bjorn-Precision-5520>

I can not thank you enough for the amount of time you must have spent
writing this response. I will look into those things in the following
days for sure! ( I have already started looking into the "__ref" stuff)

Thanks again for this,
Sergio M. Iglesias.

On 21/08/25 03:43, Bjorn Helgaas wrote:
> On Thu, Aug 05, 2021 at 12:28:32AM +0200, Sergio Miguéns Iglesias wrote:
> > The code style for most files was fixed. This means that blank lines
> > were added when needed (normally after variable declarations), spaces
> > before tabs were removed, some code alignment issues were solved, block
> > comment style was fixed, every instance of "unsigned var" was replaced
> > with "unsigned int var"... Etc.
> > 
> > This commit does not change the logic of the code, it just fixes
> > aesthetic problems.
> 
> I generally *like* this, and it does fix some annoying things, but I
> think it's a little too much all at once.  If we're working in a file
> and doing actual bug fixes or new functionality, and we want to fix
> some typos or something at the end, that might be OK, but I think the
> churn in the git history outweighs the benefit of this huge patch.
> 
> So I would encourage you to use some of the PCI expertise you've
> gained by looking at all this code to work on something with a little
> more impact.  Here are a couple ideas:
> 
>   - There are only two uses of __ref and __refdata in drivers/pci/.
>     The fact that they're so rare makes me suspect that we don't need
>     them.  But I haven't investigated these to see.  Somebody could
>     check that out and remove them if we don't need them.  Be aware
>     that I will want a clear argument for why they're not needed :)
> 
>   - Coverity complains about several issues in drivers/pci/ [1].  Most
>     of the time these are false positives, but not always.  Sometimes
>     there's an actual bug, and sometimes there's a way to restructure
>     the code to avoid the warning (which usually means doing things
>     the same way they are done elsewhere).
> 
>   - "make C=2 drivers/pci/" (sparse checker, [2]) complains about a
>     few things.  Leave the pci_power_t ones alone for now, but there
>     are a couple other type issues that could be cleaned up.
> 
> [1] https://docs.google.com/spreadsheets/d/19eyNDou83JACzf44j0NRzEWysva6g44G2_Z9IEXGVNk/edit?usp=sharing
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/dev-tools/sparse.rst?id=v5.13
> 
> > Signed-off-by: Sergio Miguéns Iglesias <sergio@lony.xyz>
> > ---
> >  drivers/pci/access.c       | 22 +++++++++++++---------
> >  drivers/pci/bus.c          |  3 ++-
> >  drivers/pci/msi.c          | 12 +++++++-----
> >  drivers/pci/pci-acpi.c     |  3 ++-
> >  drivers/pci/pci-driver.c   | 19 +++++++++++++------
> >  drivers/pci/pci-sysfs.c    | 14 ++++++++++++--
> >  drivers/pci/pci.c          | 16 ++++++++++++----
> >  drivers/pci/proc.c         | 15 +++++++++++++++
> >  drivers/pci/quirks.c       | 35 ++++++++++++++++++++++++-----------
> >  drivers/pci/remove.c       |  1 +
> >  drivers/pci/rom.c          |  2 +-
> >  drivers/pci/setup-bus.c    |  5 ++++-
> >  drivers/pci/setup-irq.c    | 12 +++++++-----
> >  drivers/pci/setup-res.c    |  2 +-
> >  drivers/pci/slot.c         |  5 ++++-
> >  drivers/pci/syscall.c      |  5 +++--
> >  drivers/pci/xen-pcifront.c | 20 ++++++++++++--------
> >  17 files changed, 133 insertions(+), 58 deletions(-)

