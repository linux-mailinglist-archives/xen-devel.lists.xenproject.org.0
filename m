Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63787614DBF
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 16:03:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.434776.687273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opsmr-0002OU-S7; Tue, 01 Nov 2022 15:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 434776.687273; Tue, 01 Nov 2022 15:02:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opsmr-0002M8-P9; Tue, 01 Nov 2022 15:02:45 +0000
Received: by outflank-mailman (input) for mailman id 434776;
 Tue, 01 Nov 2022 15:02:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e0HL=3B=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1opsmq-0002Lv-D7
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 15:02:44 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b47f9e7-59f6-11ed-91b5-6bf2151ebd3b;
 Tue, 01 Nov 2022 16:02:42 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 2A1F1vhX015299
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 1 Nov 2022 11:02:03 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 2A1F1v3f015298;
 Tue, 1 Nov 2022 08:01:57 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 3b47f9e7-59f6-11ed-91b5-6bf2151ebd3b
Date: Tue, 1 Nov 2022 08:01:57 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
        Rahul Singh <Rahul.Singh@arm.com>,
        Xen developer discussion <xen-devel@lists.xenproject.org>,
        Michal Orzel <Michal.Orzel@arm.com>,
        Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Jan Beulich <jbeulich@suse.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Juergen Gross <jgross@suse.com>
Subject: Re: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
Message-ID: <Y2E05RLmXRIR6heO@mattapan.m5p.com>
References: <EDDD0430-0BFF-4C95-B9CE-402487C2E5DE@arm.com>
 <fde8c845-8d35-83cd-d4fd-bb2c5fd1a7ed@xen.org>
 <227AD28E-DFB8-4EB3-9E0E-61C70A0D19EB@arm.com>
 <f777b164-54c6-6091-79ce-fac3dd603b8c@xen.org>
 <34B31FA6-72D8-4F03-AC94-3DC795D0FF55@arm.com>
 <222ed837-594d-6301-edec-6f9d26e1fadf@xen.org>
 <alpine.DEB.2.22.394.2210301523450.3408@ubuntu-linux-20-04-desktop>
 <82c45bc1-6052-502b-3007-8a16fbd1d433@xen.org>
 <alpine.DEB.2.22.394.2210302148150.3408@ubuntu-linux-20-04-desktop>
 <9F323893-B1C9-4D31-9A40-213345421860@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9F323893-B1C9-4D31-9A40-213345421860@arm.com>
X-Spam-Status: No, score=-0.0 required=10.0 tests=KHOP_HELO_FCRDNS,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Mon, Oct 31, 2022 at 01:26:44PM +0000, Bertrand Marquis wrote:
> 
> > On 30 Oct 2022, at 21:14, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > Ideally this would be something quick that can be easily invoked as the
> > first step of an external third-party build process.
> 
> I think that we are making this problem a lot to complex and I am not sure
> that all this complexity is required.

Speaking of complexity.  Is it just me or does a vIOMMU had an odd sort
of similarity with a Grant Table?

Both are about allowing foreign entities access to portions of the
current domain's memory.  Just in the case of a Grant Table the entity
happens to be another domain, whereas for a vIOMMU it is a hardware
device.

Perhaps some functionality could be shared between the two?  Perhaps
this is something for the designer of the next version of IOMMU to think
about?  (or perhaps I'm off the deep end and bringing in a silly idea)


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



