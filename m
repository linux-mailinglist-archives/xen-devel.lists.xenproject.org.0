Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEA376007C
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 22:29:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569238.889589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO2An-0004BG-9W; Mon, 24 Jul 2023 20:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569238.889589; Mon, 24 Jul 2023 20:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO2An-000499-6o; Mon, 24 Jul 2023 20:28:53 +0000
Received: by outflank-mailman (input) for mailman id 569238;
 Mon, 24 Jul 2023 20:28:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Oom6=DK=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qO2Al-000493-Eb
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 20:28:51 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b162d782-2a60-11ee-b23c-6b7b168915f2;
 Mon, 24 Jul 2023 22:28:49 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 36OKSPew061528
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 24 Jul 2023 16:28:31 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 36OKSOYB061527;
 Mon, 24 Jul 2023 13:28:24 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: b162d782-2a60-11ee-b23c-6b7b168915f2
Date: Mon, 24 Jul 2023 13:28:24 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org, wl@xen.org, Anthony PERARD <anthony.perard@citrix.com>,
        Juergen Gross <jgross@suse.com>,
        Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: Python in Domain Configurations
Message-ID: <ZL7e6IcJWK38IHU7@mattapan.m5p.com>
References: <ZKiN80e08QIojRSL@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKiN80e08QIojRSL@mattapan.m5p.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Fri, Jul 07, 2023 at 03:13:07PM -0700, Elliott Mitchell wrote:
> 
> The only context I could find was 54fbaf446b and
> https://wiki.xenproject.org/wiki/PythonInXlConfig which don't explain
> the reasoning.
> 
> Would the maintainers be amenable to revisiting the decision to remove
> support for full Python in domain configuration files?

Any chance of this getting a response?

On examination it appears domain configuration files are a proper subset
of Python.  The interface to the parser is a bit interesting, but it
looks fairly simple to replace the parser with libpython.

My goal is to create an init script for some automatically started
domains.  Issue is there can be ordering concerns with domain start/stop,
and this seems best handled by adding an extra setting to the
configuration files.  If full Python syntax is available, I can use that
for this extra data.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



