Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 503B5719AD4
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 13:17:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542412.846240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4gJE-0006ck-Uy; Thu, 01 Jun 2023 11:17:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542412.846240; Thu, 01 Jun 2023 11:17:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4gJE-0006a0-SA; Thu, 01 Jun 2023 11:17:36 +0000
Received: by outflank-mailman (input) for mailman id 542412;
 Thu, 01 Jun 2023 11:17:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gYM6=BV=gmail.com=jonas.gorski@srs-se1.protection.inumbo.net>)
 id 1q4gJD-0006Zu-NW
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 11:17:35 +0000
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7e01dc3-006d-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 13:17:34 +0200 (CEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-256712d65ceso218257a91.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Jun 2023 04:17:34 -0700 (PDT)
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
X-Inumbo-ID: e7e01dc3-006d-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685618253; x=1688210253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3KLMivggFERHTUQ4oKDCdCn/4yto409QZ31zuIfVcxw=;
        b=MeUm9YdyFvQ+EmzMauQm3DwWlQ0uGm51kMyqs4PhBgH/mijyrQiG2NopdYymwRbJxY
         WBb3Tf1Ln6XZqKWhH5S7yQhGi9LLiabQOTeQ8Pbm6c1NX2Xy4WY3/v4jgXe5Wm7qcbDH
         yEY3HNSHJGimYiFdpPz7nmg67nUmGWb4PamYB7ge/Vdfq0ytqPkY0wlqmD8GxJ3QU2ha
         YMgYHSJ7Qpd2tGHgPxbotFgYnGiJWb6n/hwdCwf80mscrhqXd4SxH5LEbISu95zojTnv
         WNtxh7RS0s5xKaXlqlboISfHSVYLF8kc+uAACZeNu+Oizk+CGC+kRe6EXEKAHfyfkH5e
         ZLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685618253; x=1688210253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3KLMivggFERHTUQ4oKDCdCn/4yto409QZ31zuIfVcxw=;
        b=dACHXyPjcVoRxFS9bPvk1a8fpIEMknxZgRZLwOvea8eD4ao6QzmQ3BgbFbo2iQOAda
         dbQI/Ah6A1KPzwFVORytO6r8GnCGOJ2Gy/WDULvi0WsrtT89dXblGQNn57wRLMRL9Csp
         ExrmgQtn/VAAkryfobQw5KvhYB8UKnCXdAXNy72Qp7Goxstjf8PJUTOdb87AliiEODnK
         IrHhwAW7gmUuL3tNeZ66Wzfy1suQjzak7/H2KGd864EYCUnUte9UtxYIheilCU0prTN7
         yb9dUdnH6AjYuewhC/+3UR+9T92OW8nBKhEUj56mxwOMkTromabs/oSFqvTb4dsTspvT
         MFlw==
X-Gm-Message-State: AC+VfDxdz8Bl5Ub2X+DD6SX+2SrEJExqymPI2e0rmOBGPijxcnglkZnl
	cSYENkKcRjwg+RUcNE3e+gE53LFMqSg2fO5M3sQ=
X-Google-Smtp-Source: ACHHUZ7nalKosql0wqoA6eLZQyCHzFFB2nLyOpniZjsGzpomunYZZ7UC7Kcp/mX27yNINR6qH69ddmRyUjrovwtppOk=
X-Received: by 2002:a17:90a:9f01:b0:253:50d0:a39d with SMTP id
 n1-20020a17090a9f0100b0025350d0a39dmr5508485pjp.48.1685618252985; Thu, 01 Jun
 2023 04:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAOiHx==5YWhDiZP2PyHZiJrmtqRzvqCqoSO59RwuYuR85BezBg@mail.gmail.com>
 <ZHe8dKb3f392MfBO@bhelgaas>
In-Reply-To: <ZHe8dKb3f392MfBO@bhelgaas>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Thu, 1 Jun 2023 13:17:21 +0200
Message-ID: <CAOiHx=nTgtnfUqRDJR0yFP0du3Yvs73PkEUR_1eb+1gtbDBM-g@mail.gmail.com>
Subject: Re: [PATCH v8 0/7] Add pci_dev_for_each_resource() helper and update users
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Andrew Lunn <andrew@lunn.ch>, sparclinux@vger.kernel.org, 
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

On Wed, 31 May 2023 at 23:30, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Wed, May 31, 2023 at 08:48:35PM +0200, Jonas Gorski wrote:
> > ...
>
> > Looking at the code I understand where coverity is coming from:
> >
> > #define __pci_dev_for_each_res0(dev, res, ...)                         \
> >        for (unsigned int __b = 0;                                      \
> >             res = pci_resource_n(dev, __b), __b < PCI_NUM_RESOURCES;   \
> >             __b++)
> >
> >  res will be assigned before __b is checked for being less than
> > PCI_NUM_RESOURCES, making it point to behind the array at the end of
> > the last loop iteration.
> >
> > Rewriting the test expression as
> >
> > __b < PCI_NUM_RESOURCES && (res = pci_resource_n(dev, __b));
> >
> > should avoid the (coverity) warning by making use of lazy evaluation.
> >
> > It probably makes the code slightly less performant as res will now be
> > checked for being not NULL (which will always be true), but I doubt it
> > will be significant (or in any hot paths).
>
> Thanks a lot for looking into this!  I think you're right, and I think
> the rewritten expression is more logical as well.  Do you want to post
> a patch for it?

Not sure when I'll come around to, so I have no strong feeling here.
So feel free to just borrow my suggestion, especially since I won't be
able to test it (don't have a kernel tree ready I can build and boot).

Also looking more closely at the Coverity output, I think it might not
handle the comma operator well in the loop condition:

>          11. incr: Incrementing __b. The value of __b may now be up to 17.
>          12. alias: Assigning: r = &pdev->resource[__b]. r may now point to as high as element 17 of pdev->resource (which consists of 17 64-byte elements).
>          13. Condition __b < PCI_NUM_RESOURCES, taking true branch.
>          14. Condition (r = &pdev->resource[__b]) , (__b < PCI_NUM_RESOURCES), taking true branch.

13 If __b is 17 ( = PCI_NUM_RESOURCES) we wouldn't taking the true
branch, but somehow Coverity thinks that we do. No idea if it is worth
reporting to Coverity.

The changed condition statement should hopefully silence the warning though.

Regards
Jonas

