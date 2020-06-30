Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9772220EB0B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 03:51:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jq5Py-0003Ol-8s; Tue, 30 Jun 2020 01:50:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aLIy=AL=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1jq5Px-0003Og-Ao
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 01:50:37 +0000
X-Inumbo-ID: 17972d72-ba74-11ea-bb8b-bc764e2007e4
Received: from mail-pl1-x644.google.com (unknown [2607:f8b0:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17972d72-ba74-11ea-bb8b-bc764e2007e4;
 Tue, 30 Jun 2020 01:50:36 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id u9so4212695pls.13
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2020 18:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xbDPOfO5dEbdEvgJJa4Ml3IePWDMkowsVt6h1wk1qyg=;
 b=N2fg+fr8mqvdKWpq9X9sEDS0YRXkxTaCEaHnSynv0E+CJmWBkqAxjGBhqoYQpIBufO
 onfhne3a+qibTxaHP2kik1llKVIdvui6mdH2hgy2xdnHGHwu6Le2LzVLnsL+BjBCMI3r
 NOoRqe/khCIJcI2yYujX13iu3UJyFh9iho2n3CeK172KdOuOdfQkvopN36wrBEQw6q7q
 xdS3samPZIlTqqPfLEPfAynW2LtOodTm/IGlvPwFh7BkNeiHdZRXugNEnX5vDN0jp/1Q
 JppX7rIRimsVdR8YZ7mmtUFujE3F/dwwXqjZM7DeuEpmeAss4ZnlUtFF4ahp4zJtYlVL
 TN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xbDPOfO5dEbdEvgJJa4Ml3IePWDMkowsVt6h1wk1qyg=;
 b=c8dVXLbczI26gKVdzSKZAGgv+hQ7wqsjQcfgv9+HZfduyUB0lndw+6iaoSlkNUSHaV
 Y/QyQhgk2YGQSKKPA1zA9EMyq2b17gPG9HGOzhSi254CgM/u9ga4Sz89aIXDgV2Wd7pI
 Ryfq7OOhWRv0aIj4xoiCJo431rbCgXsoXo/KG9jCXGsh6uJO32fdZdL/sw4CsOgjSbTM
 5hWpDpMb5iouhMwMP9LzgtxaLsvSS04lW18Ci+tAf5pcLamwYWDOWaUhiZR5UjNMYzmq
 1SFnOqm5L94gwnoY9tqi0AsZVqNhAdPvaK/O2i96LTkPQIdDW4FVm1Q/VxH4G6hK/Ch3
 TFCA==
X-Gm-Message-State: AOAM5307klCCRmTMGR5m31gYDYkr7ih/r8r2lQnVxBki896085O6x+M+
 1pyGZPP4FjquNGt+lnQ3TTE=
X-Google-Smtp-Source: ABdhPJwYSRXrEaDV1d+CJQ7e8CQjvlAOuwOviKCnwuwwolCNe1gAB3GOHaLDv7hzTlN5Pk2kDEv7oQ==
X-Received: by 2002:a17:902:7e04:: with SMTP id
 b4mr7222010plm.295.1593481835725; 
 Mon, 29 Jun 2020 18:50:35 -0700 (PDT)
Received: from piano ([2601:1c2:4f00:c640:fc6:7318:8185:4d2d])
 by smtp.gmail.com with ESMTPSA id z13sm782982pfq.220.2020.06.29.18.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 18:50:35 -0700 (PDT)
Date: Mon, 29 Jun 2020 18:50:33 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC XEN PATCH 00/23] xen: beginning support for RISC-V
Message-ID: <20200630015033.GA8470@piano>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
 <alpine.DEB.2.21.2006151802470.9074@sstabellini-ThinkPad-T480s>
 <f1bff09cf101b185efe7c2f7d53d64b0aeee84a2.camel@wdc.com>
 <20200616035100.GA19383@piano>
 <alpine.DEB.2.21.2006161315200.24982@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2006161315200.24982@sstabellini-ThinkPad-T480s>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "dan@dlrobertson.com" <dan@dlrobertson.com>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "bobby.eshleman@starlab.io" <bobby.eshleman@starlab.io>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 16, 2020 at 01:16:10PM -0700, Stefano Stabellini wrote:
> On Mon, 15 Jun 2020, Bobby Eshleman wrote:
> > On Tue, Jun 16, 2020 at 01:10:17AM +0000, Alistair Francis wrote:
> > > On Mon, 2020-06-15 at 18:03 -0700, Stefano Stabellini wrote:
> > > > Any updates? I am looking forward to this :-)
> > > 
> > 
> > It has been on a slow burn since I became a new dad (shortly after the RFC).
> > I've gradually regained free time, and so I've been able to change that
> > slow burn to a moderate burn in the last couple weeks.
> > 
> > Most of my progress has been around build environment improvements.  I've done
> > some work stripping it down to the bare minimum required to build a new arch
> > and rooting the commit history from there, and some work with incorporating it
> > into the gitlab CI, containerizing the build and QEMU run, etc...
> > 
> > As far as hypervisor status:  I'm just about done with incorporating the boot
> > module FDT parsing code, extracting kernel info and ram regions
> > (taken/generalized from arch/arm), plus implementing the arch-specific pieces
> > of domain_create().
> > 
> > On the verge of being able to dive into a guest kernel and see what breaks
> > first :)
> > 
> > I'm expected to commit an extra day or two per week in the next month or so at
> > Vates, so this will considerably bump up my cadence in comparison to the last
> > few months.
> 
> Great to hear and congratulations! I'll stay tuned. Next time I'll try
> to rebuild and run your series on QEMU, I might ask you for some help
> with the setup.
> 

Thanks!  And absolutely, feel free :)

