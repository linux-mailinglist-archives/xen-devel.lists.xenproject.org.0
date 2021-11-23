Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB24459A11
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 03:24:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229106.396514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpLSo-0005NE-IX; Tue, 23 Nov 2021 02:23:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229106.396514; Tue, 23 Nov 2021 02:23:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpLSo-0005LA-Ek; Tue, 23 Nov 2021 02:23:18 +0000
Received: by outflank-mailman (input) for mailman id 229106;
 Tue, 23 Nov 2021 02:23:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iQPh=QK=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1mpLSn-0005L4-Go
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 02:23:17 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ecd7d0b-4c04-11ec-9787-a32c541c8605;
 Tue, 23 Nov 2021 03:23:14 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 1AN2MuC9063958
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 22 Nov 2021 21:23:02 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 1AN2Mum2063957;
 Mon, 22 Nov 2021 18:22:56 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 4ecd7d0b-4c04-11ec-9787-a32c541c8605
Date: Mon, 22 Nov 2021 18:22:56 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Henry Wang <Henry.Wang@arm.com>
Subject: Re: ACPI/UEFI support for Xen/ARM status?
Message-ID: <YZxQgIKywpY5aCeY@mattapan.m5p.com>
References: <YY3tSAFTCR4r2FaI@mattapan.m5p.com>
 <AM9PR08MB62428F41C4F998AD676C027C92959@AM9PR08MB6242.eurprd08.prod.outlook.com>
 <YY6L5JQPn0s3c6Jp@mattapan.m5p.com>
 <1d3561ef-548a-ea13-d362-0f95d7dba33b@xen.org>
 <64e9208d-ecda-2e62-e10f-81750c0279fb@suse.com>
 <78aa1ec7-3d47-716d-c9d6-b74d66486e9e@xen.org>
 <f3c5087b-4eb2-8599-f68c-cc9dbd375767@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3c5087b-4eb2-8599-f68c-cc9dbd375767@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Tue, Nov 16, 2021 at 08:18:26AM +0100, Jan Beulich wrote:
> On 15.11.2021 20:09, Julien Grall wrote:
> > 
> > However, for Elliott's case, I am not sure this is going to sufficient. 
> > The Raspberry PI has some devices that can only DMA into the first 1GB 
> > of the RAM (the GPU seems to be one). So we need to make sure Xen is 
> > allocating enough memory for Dom0 below that limit.
> 
> Urgh.
> 
> > Do you have similar problem on x86? If so, how do you deal with it?
> 
> No, we don't have any such restrictions that I would be aware of.

x86 had *many* devices which were limited to the low 4GB, go back futher
and there might have been other devices with lower limits.  The oddity
here being devices with a 1GB limit on a board with aarch64 processors.

This simply needs effort to keep Xen out of low addresses (which has the
additional advantage of protection from DMA) and allocate more low
addresses to Domain 0.  Could also see value in preferring to load
Domain 0's kernel at higher addresses.

Last year I had been left with the impression full ACPI table support
was really a WIP and I should leave things alone.  Letting others push
the ACPI support forward, while I put effort into the piece which nobody
was putting significant effort into.

Yet again what has been typed leaves the impression full ACPI table
support on ARM is highly desired and likely very high value.  Just at the
incremental effort for per-device device-trees isn't that high, while the
full table support will initially be expensive.  Yet once that is done I
suspect there will be far lower per-device effort.

We seem to need a corporate entity to aggregate all the funding to get
ACPI into proper shape.  Then we could enjoy many more devices with much
lower per-device effort.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



