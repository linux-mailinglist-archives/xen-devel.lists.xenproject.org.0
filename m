Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4864840BDD4
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 04:41:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187181.335958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQKqq-0007L6-ED; Wed, 15 Sep 2021 02:40:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187181.335958; Wed, 15 Sep 2021 02:40:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQKqq-0007Io-BG; Wed, 15 Sep 2021 02:40:44 +0000
Received: by outflank-mailman (input) for mailman id 187181;
 Wed, 15 Sep 2021 02:40:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U58Y=OF=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1mQKqo-0007Ii-6Z
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 02:40:42 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50cee92a-15ce-11ec-b4d0-12813bfff9fa;
 Wed, 15 Sep 2021 02:40:40 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 18F2eWxa031805
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 14 Sep 2021 22:40:38 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 18F2eWfB031804;
 Tue, 14 Sep 2021 19:40:32 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 50cee92a-15ce-11ec-b4d0-12813bfff9fa
Date: Tue, 14 Sep 2021 19:40:32 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: HVM/PVH Balloon crash
Message-ID: <YUFdIPLo1AfM5BT2@mattapan.m5p.com>
References: <YTVAT0CQD9cPyyDF@mattapan.m5p.com>
 <84d9137e-a268-c3d8-57d2-76fb596e00d3@suse.com>
 <YTZ+XsnoKNnV4IOz@mattapan.m5p.com>
 <1b3d4cb1-ba61-0f61-5097-9978462a2401@suse.com>
 <YTd/SFtvuzejeiik@mattapan.m5p.com>
 <935dc03f-74f5-4b49-3a45-71148364fb5a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <935dc03f-74f5-4b49-3a45-71148364fb5a@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Tue, Sep 07, 2021 at 05:57:10PM +0200, Jan Beulich wrote:
> On 07.09.2021 17:03, Elliott Mitchell wrote:
> >  Could be this system is in an
> > intergenerational hole, and some spot in the PVH/HVM code makes an
> > assumption of the presence of NPT guarantees presence of an operational
> > IOMMU.  Otherwise if there was some copy and paste while writing IOMMU
> > code, some portion of the IOMMU code might be checking for presence of
> > NPT instead of presence of IOMMU.
> 
> This is all very speculative; I consider what you suspect not very likely,
> but also not entirely impossible. This is not the least because for a
> long time we've been running without shared page tables on AMD.
> 
> I'm afraid without technical data and without knowing how to repro, I
> don't see a way forward here.

Downtimes are very expensive even for lower-end servers.  Plus there is
the issue the system wasn't meant for development and thus never had
appropriate setup done.

Experimentation with a system of similar age suggested another candidate.
System has a conventional BIOS.  Might some dependancies on the presence
of UEFI snuck into the NPT code?


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



