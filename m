Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F848C5C81
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 22:52:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721775.1125444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6z7k-0008Ca-KN; Tue, 14 May 2024 20:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721775.1125444; Tue, 14 May 2024 20:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6z7k-0008AJ-H5; Tue, 14 May 2024 20:51:48 +0000
Received: by outflank-mailman (input) for mailman id 721775;
 Tue, 14 May 2024 20:51:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0OWz=MR=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1s6z7j-00089q-86
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 20:51:47 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c50038e2-1233-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 22:51:44 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:8ac4:0:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.17.1) with ESMTPS id 44EKpS3x036440
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 14 May 2024 16:51:34 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 44EKpSDN036439;
 Tue, 14 May 2024 13:51:28 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: c50038e2-1233-11ef-b4bb-af5377834399
Date: Tue, 14 May 2024 13:51:28 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
        Wei Liu <wl@xen.org>, Kelly Choi <kelly.choi@cloud.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: Serious AMD-Vi(?) issue
Message-ID: <ZkPO0D0/Jx4ZnRBO@mattapan.m5p.com>
References: <c2ce4002-58d5-48a3-949c-3c361c78c0ac@suse.com>
 <ZhdNxWNpM0KCzz8E@mattapan.m5p.com>
 <2aa4d1f4-ff37-4f12-bfbb-3ef5ad3f6fdd@suse.com>
 <ZiDBc3ye2wqmBAfq@mattapan.m5p.com>
 <f0bdb386-0870-4468-846c-6c8a91eaf806@suse.com>
 <ZiH0G5kN6m+wlNjn@mattapan.m5p.com>
 <Zj7vkp4r0EY9rxT4@mattapan.m5p.com>
 <ZkHTC4RpUSpKj4wf@macbook>
 <ZkJz9U2A/mVKnkjA@mattapan.m5p.com>
 <08503965-4ba9-4fe3-a176-895623f4ad92@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <08503965-4ba9-4fe3-a176-895623f4ad92@suse.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

On Tue, May 14, 2024 at 10:22:51AM +0200, Jan Beulich wrote:
> On 13.05.2024 22:11, Elliott Mitchell wrote:
> > On Mon, May 13, 2024 at 10:44:59AM +0200, Roger Pau Monné wrote:
> >> Why do you mask the device SBDF in the above snippet?  I would really
> >> like to understand what's so privacy relevant in a PCI SBDF number.
> > 
> > I doubt it reveals much.  Simply seems unlikely to help debugging and
> > therefore I prefer to mask it.
> 
> SBDF in one place may be matchable against a memory address in another
> place. _Any_ hiding of information is hindering analysis. Please can
> you finally accept that it needs to be the person doing the analysis
> to judge what is or is not relevant to them?

Not going to happen as I'd accepted this long ago.  The usual approach
is all developers have PGP keys (needed for security issues anyway) and
you don't require all logs to be public.

I've noticed the core of the Xen project appears centered in the EU.  Yet
you're not catering to data privacy at all?  Or is this a service
exclusively provided to people who prove they're EU citizens?


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



