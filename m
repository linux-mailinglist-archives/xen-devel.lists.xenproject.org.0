Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E272B719214
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 07:14:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541948.845857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4ad4-0000cD-SS; Thu, 01 Jun 2023 05:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541948.845857; Thu, 01 Jun 2023 05:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4ad4-0000Yz-Ox; Thu, 01 Jun 2023 05:13:42 +0000
Received: by outflank-mailman (input) for mailman id 541948;
 Wed, 31 May 2023 18:48:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9XKA=BU=gmail.com=jonas.gorski@srs-se1.protection.inumbo.net>)
 id 1q4QsO-0003N2-B3
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 18:48:52 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6c3d5d8-ffe3-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 20:48:48 +0200 (CEST)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1b041ccea75so25421375ad.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 11:48:48 -0700 (PDT)
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
X-Inumbo-ID: c6c3d5d8-ffe3-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685558927; x=1688150927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3EtbHmfy3w5R7KQLkJ5R/6zIzXV1vr/wfKtqhO2sLZ4=;
        b=Hm0hCkYdtfQRemjMKlbllQL4O8L2Qa3TjHMKohF0mlxv+EqXmacGN9VR1Ny8tXDjdD
         ACVftV9H3bIHuquZ0Z6IE+mZYNe74kNRg3Br1jlJLowCFdPWRxtQpFk0AR3q9LiI7a38
         qPm3c5PRQ8s61eGVhHEjXW5Ih2HToJ0OAz+aWBcvAjzRU6N56VF0Fcsn7e4Of0o6uY+V
         qRpB5UPr9AHKifnMYX6CIDRDJncTTr+hdj/URjfBb9uRPa4+D9LrQ9gR8d8PKDjKpkeg
         cNuAOwwh+6NOWOIuGiEwVq+aM6BLqglu5nX06SX1AVpMS+9Xl4QNAABt0kr2BfTfppz2
         6BaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685558927; x=1688150927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3EtbHmfy3w5R7KQLkJ5R/6zIzXV1vr/wfKtqhO2sLZ4=;
        b=IIj5P8yKIGlXlzDop8b1FNIx7sJpa5w0VMUDMT7+q+tTXqFfafQcPLTyijqr/yW/Wo
         CXqT5bWX0zYTQ9W0MXWorqo5meaLruLs0T8tD/ijylyYneoqzwv0FopzDlQ5EnFqC9LZ
         Ld6fbR9F9yqErf5oUEmMzrMtGzRUNT/7PcSO+HWWvUEpyXUygvwjzj0BhP9aSQ4URcS6
         96ZwIvnfDNbSEGdEVPpBcTlo7UW0+05/YId97spB4ZdIRLpTTGqX9ZNDzAIxrkDcMpGz
         5ehbnNtTMPAl9rdkTiqQjzy7rdTmzCP+aqmc0RM5ewrUEfMB9fLWU6yZMMnKaBjKTlsA
         e8kw==
X-Gm-Message-State: AC+VfDziFg/AxTQi+HxoT2txwasZVVyZnmI6DNJd3sVl1PxIaFov28W9
	VXEvZEYCYcFQPAiBdBrwcsNA2xMqgCjyJKrj32I=
X-Google-Smtp-Source: ACHHUZ5M6iYi6/JD6zVRIpgmhcItbt+ub8OAZYuPz3aXn9kIu5A1prvbpB5UhWxoMoGIS6vgwfkfFLYekeLrKRbR0kQ=
X-Received: by 2002:a17:902:ce86:b0:1b0:3df7:5992 with SMTP id
 f6-20020a170902ce8600b001b03df75992mr5572003plg.32.1685558926693; Wed, 31 May
 2023 11:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <ZF6YIezraETr9iNM@bhelgaas> <ZHZpcli2UmdzHgme@bhelgaas>
In-Reply-To: <ZHZpcli2UmdzHgme@bhelgaas>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Wed, 31 May 2023 20:48:35 +0200
Message-ID: <CAOiHx==5YWhDiZP2PyHZiJrmtqRzvqCqoSO59RwuYuR85BezBg@mail.gmail.com>
Subject: Re: [PATCH v8 0/7] Add pci_dev_for_each_resource() helper and update users
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, 
	Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Andrew Lunn <andrew@lunn.ch>, sparclinux@vger.kernel.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, 
	linux-acpi@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>, 
	Anatolij Gustschin <agust@denx.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Bjorn Helgaas <bhelgaas@google.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, 
	Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, 
	linux-mips@vger.kernel.org, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, linux-alpha@vger.kernel.org, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 30 May 2023 at 23:34, Bjorn Helgaas <helgaas@kernel.org> wrote:
> On Fri, May 12, 2023 at 02:48:51PM -0500, Bjorn Helgaas wrote:
> > On Fri, May 12, 2023 at 01:56:29PM +0300, Andy Shevchenko wrote:
> > > On Tue, May 09, 2023 at 01:21:22PM -0500, Bjorn Helgaas wrote:
> > > > On Tue, Apr 04, 2023 at 11:11:01AM -0500, Bjorn Helgaas wrote:
> > > > > On Thu, Mar 30, 2023 at 07:24:27PM +0300, Andy Shevchenko wrote:
> > > > > > Provide two new helper macros to iterate over PCI device resources and
> > > > > > convert users.
> > > >
> > > > > Applied 2-7 to pci/resource for v6.4, thanks, I really like this!
> > > >
> > > > This is 09cc90063240 ("PCI: Introduce pci_dev_for_each_resource()")
> > > > upstream now.
> > > >
> > > > Coverity complains about each use,
> > >
> > > It needs more clarification here. Use of reduced variant of the
> > > macro or all of them? If the former one, then I can speculate that
> > > Coverity (famous for false positives) simply doesn't understand `for
> > > (type var; var ...)` code.
> >
> > True, Coverity finds false positives.  It flagged every use in
> > drivers/pci and drivers/pnp.  It didn't mention the arch/alpha, arm,
> > mips, powerpc, sh, or sparc uses, but I think it just didn't look at
> > those.
> >
> > It flagged both:
> >
> >   pbus_size_io    pci_dev_for_each_resource(dev, r)
> >   pbus_size_mem   pci_dev_for_each_resource(dev, r, i)
> >
> > Here's a spreadsheet with a few more details (unfortunately I don't
> > know how to make it dump the actual line numbers or analysis like I
> > pasted below, so "pci_dev_for_each_resource" doesn't appear).  These
> > are mostly in the "Drivers-PCI" component.
> >
> > https://docs.google.com/spreadsheets/d/1ohOJwxqXXoDUA0gwopgk-z-6ArLvhN7AZn4mIlDkHhQ/edit?usp=sharing
> >
> > These particular reports are in the "High Impact Outstanding" tab.
>
> Where are we at?  Are we going to ignore this because some Coverity
> reports are false positives?

Looking at the code I understand where coverity is coming from:

#define __pci_dev_for_each_res0(dev, res, ...)                         \
       for (unsigned int __b = 0;                                      \
            res = pci_resource_n(dev, __b), __b < PCI_NUM_RESOURCES;   \
            __b++)

 res will be assigned before __b is checked for being less than
PCI_NUM_RESOURCES, making it point to behind the array at the end of
the last loop iteration.

Rewriting the test expression as

__b < PCI_NUM_RESOURCES && (res = pci_resource_n(dev, __b));

should avoid the (coverity) warning by making use of lazy evaluation.

It probably makes the code slightly less performant as res will now be
checked for being not NULL (which will always be true), but I doubt it
will be significant (or in any hot paths).

Regards,
Jonas

