Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3BD618814
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 19:59:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436987.691302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqfQp-000773-Ty; Thu, 03 Nov 2022 18:59:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436987.691302; Thu, 03 Nov 2022 18:59:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqfQp-00074Y-Qm; Thu, 03 Nov 2022 18:59:15 +0000
Received: by outflank-mailman (input) for mailman id 436987;
 Thu, 03 Nov 2022 18:29:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rIun=3D=gmail.com=kswilczynski@srs-se1.protection.inumbo.net>)
 id 1oqeyR-00011G-GP
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 18:29:55 +0000
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8236c6f2-5ba5-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 19:29:54 +0100 (CET)
Received: by mail-pg1-f181.google.com with SMTP id f63so2421444pgc.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Nov 2022 11:29:53 -0700 (PDT)
Received: from rocinante (fpd11144dd.ap.nuro.jp. [209.17.68.221])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a170902d4ce00b0018157b415dbsm1034089plg.63.2022.11.03.11.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 11:29:51 -0700 (PDT)
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
X-Inumbo-ID: 8236c6f2-5ba5-11ed-91b5-6bf2151ebd3b
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZjEyPGh7N/ck24vh/VKMs5s50UIlOa2pgI4ml3dqpA=;
        b=nYo1vbk9UDNpY1maOTBkxOBgqZyfZiaz2NO7leQKbBvnBeCbgDxdHSNSuyx30uG7q2
         5ZROmmuEio4uvxnlwxepe7o9r19OWmaPVFklaMKDZmWTvsEZkeWiJ6IxWLGVoalR8h6m
         CA04rBt0tMELbCTsM+R75mx9S69LoSoa9j0idmYdvrKwjICqd8DaLMhU3CSJcjg1OSKd
         1GKMofnZd73OHXx62LraoloQEnMVgHXMtoxitI8QlvcyWQujdZ3LRQgq+HMnbDv7Vg2r
         4KAYjF+uz7LpuoxSDIcGok5P8ACLb8qwlTPKpKs3iLUQtqxQYp8PcBFtP8KD9OS/xHHn
         ByWQ==
X-Gm-Message-State: ACrzQf1novfyieDG4+Xi35YmuzRNWwmlB/H9GPz/jqEXI0aT8C8ZMXbl
	HGFHWkc1ngVANyvtsSBITbk=
X-Google-Smtp-Source: AMsMyM4MMb94EAGz1kO2Q0DRDyjidkdmznJiyzQZ8JfQK1Y1FbZfy+aOFpE2yYDeDmYpBxRHuxCHKQ==
X-Received: by 2002:aa7:8c15:0:b0:56b:ead2:3950 with SMTP id c21-20020aa78c15000000b0056bead23950mr32086578pfd.77.1667500192405;
        Thu, 03 Nov 2022 11:29:52 -0700 (PDT)
Date: Fri, 4 Nov 2022 03:29:44 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>,
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <helgaas@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org, linux-pci@vger.kernel.org,
	xen-devel@lists.xenproject.org, Miguel Ojeda <ojeda@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH v2 4/4] pcmcia: Convert to use
 pci_bus_for_each_resource_p()
Message-ID: <Y2QImB0OLakzz1+F@rocinante>
References: <20221103164644.70554-1-andriy.shevchenko@linux.intel.com>
 <20221103164644.70554-5-andriy.shevchenko@linux.intel.com>
 <Y2P0XCNJvTVuziO7@owl.dominikbrodowski.net>
 <Y2P2ja26ikNecTsv@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y2P2ja26ikNecTsv@smile.fi.intel.com>

Hello,

[...]
> > > -
> > > -	for (i = 0; i < PCI_BRIDGE_RESOURCE_NUM; i++) {
> > > -		res = s->cb_dev->bus->resource[i];
> > > -#else
> > > -	pci_bus_for_each_resource(s->cb_dev->bus, res, i) {
> > >  #endif
> > > +
> > > +	pci_bus_for_each_resource_p(s->cb_dev->bus, res) {
> > >  		if (!res)
> > >  			continue;
> > 
> > Doesn't this remove the proper iterator for X86? Even if that is the right
> > thing to do, it needs an explict explanation.
> 
> I dunno what was in 2010, but reading code now I have found no differences in
> the logic on how resources are being iterated in these two pieces of code.

This code is over a decade old (13 years old to be precise) and there was
something odd between Bjorn's and Jesse's patches, as per:

  89a74ecccd1f ("PCI: add pci_bus_for_each_resource(), remove direct bus->resource[] refs")
  cf26e8dc4194 ("pcmcia: do not autoadd root PCI bus resources")

> But fine, I will add a line to a commit message about this change.

I wouldn't, personally.  The change you are proposing is self-explanatory
and somewhat in-line with what is there already - unless I am also reading
the current implementation wrong.

That said, Dominik is the maintainer of PCMCIA driver, so his is the last
word, so to speak. :)

> Considering this is done, can you issue your conditional tag so I will
> incorporate it in v3?

No need, really.  Again, unless Dominik thinks otherwise.

	Krzysztof

