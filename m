Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03598539ABB
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 03:26:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340138.565093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwD7M-0005GG-9I; Wed, 01 Jun 2022 01:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340138.565093; Wed, 01 Jun 2022 01:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwD7M-0005EK-5X; Wed, 01 Jun 2022 01:25:48 +0000
Received: by outflank-mailman (input) for mailman id 340138;
 Wed, 01 Jun 2022 01:25:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y5RR=WI=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nwD7K-0005E9-67
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 01:25:46 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [2001:470:1f07:15ff::f7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfdc4f4d-e149-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 03:25:43 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 2511PJYT083152
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 31 May 2022 21:25:25 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 2511PDJs083151;
 Tue, 31 May 2022 18:25:13 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: bfdc4f4d-e149-11ec-bd2c-47488cf2e6aa
Date: Tue, 31 May 2022 18:25:13 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 3/3] tools/xl: Allow specifying JSON for domain
 configuration file format
Message-ID: <Ypa/+X7FQT2WaX12@mattapan.m5p.com>
References: <cover.1651285313.git.ehem+xen@m5p.com>
 <9aa6160b2664a52ff778fad67c366d67d3a0f8ab.1651285313.git.ehem+xen@m5p.com>
 <Yoeh3nMNW0AfcHr/@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yoeh3nMNW0AfcHr/@perard.uk.xensource.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Fri, May 20, 2022 at 03:12:46PM +0100, Anthony PERARD wrote:
> On Tue, Apr 19, 2022 at 06:23:41PM -0700, Elliott Mitchell wrote:
> > JSON is currently used when saving domains to mass storage.  Being able
> > to use JSON as the normal input to `xl create` has potential to be
> > valuable.  Add the functionality.
> > 
> > Move the memset() earlier so to allow use of the structure sooner.
> > 
> > Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> 
> So, I gave this a try and creating a guest from a json config, and that
> fails very early with "Unknown guest type".
> 
> Have you actually tried to create a guest from config file written in
> json?
> 
> Also, this would need documentation about the new option, about the
> format. The man page need to be edited.
> 
> An example of a config file written in json would be nice as well.

I'll be trying for these at some point, but no timeframe yet.  This was
an idea which occurred to me when looking at things.  I'm wavering on
whether this is the way to go...

Real goal is I would like to generate a replacement for the `xendomains`
init script.  While functional the script is woefully inadaquate for
anything other than the tiniest installation.

Notably there can be ordering constraints for start/shutdown (worse,
those could be distinct).  One might also wish different strategies for
different domains (some get saved to disk on reboot, some might get
shutdown/restarted).


For some of the configuration for this, adding to domain.cfg files makes
sense.  This though ends up with the issue of what should the extra data
look like?

I'm oscillating between adding a section in something libxl's parser
takes as a comment, versus adding a configuration option to domain.cfg
(libxl's parser ignores unknown sections which is not entirely good!).
JSON's structure would be good for an addition, but JSON comes with its
own downsides.

Most likely such a thing would be implemented in Python.  Needs a bit
more math than shell is good for.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



