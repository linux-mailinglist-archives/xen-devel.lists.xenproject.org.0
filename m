Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 386943BA41C
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jul 2021 20:54:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149297.276038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzOHh-0003AS-5i; Fri, 02 Jul 2021 18:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149297.276038; Fri, 02 Jul 2021 18:53:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzOHh-00038Y-2X; Fri, 02 Jul 2021 18:53:05 +0000
Received: by outflank-mailman (input) for mailman id 149297;
 Fri, 02 Jul 2021 18:53:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aFP0=L2=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1lzOHf-00038S-1E
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 18:53:03 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9a71bfe-db66-11eb-83c4-12813bfff9fa;
 Fri, 02 Jul 2021 18:53:01 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 162IqlBN003070
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 2 Jul 2021 14:52:53 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 162Iqlv7003069;
 Fri, 2 Jul 2021 11:52:47 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: b9a71bfe-db66-11eb-83c4-12813bfff9fa
Date: Fri, 2 Jul 2021 11:52:47 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/Makefile: drop -Werror
Message-ID: <YN9gf2vhyH7w7V1X@mattapan.m5p.com>
References: <20210702170602.890817-1-fontaine.fabrice@gmail.com>
 <b920b793-734a-5f1f-6c4c-0d31ed27d01c@citrix.com>
 <CAPi7W81h=81ztVG6X0kh0+KEn9ryxAwXtK7-BWxonrXLJBZXaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPi7W81h=81ztVG6X0kh0+KEn9ryxAwXtK7-BWxonrXLJBZXaw@mail.gmail.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Fri, Jul 02, 2021 at 07:51:55PM +0200, Fabrice Fontaine wrote:
> 
> I do agree that setting -Werror is generally perfectly valid for upstream.
> However, for downstream packager, it is generally seen as an issue as
> it will always raise unexepected build failures with older, newer, or
> exotic toolchains, see
> https://embeddedartistry.com/blog/2017/05/22/werror-is-not-your-friend.
> It would be good to, at least, have an option to disable -Werror for
> example through a XEN_DISABLE_WERROR.

Two people don't make it a majority opinion, but if this was a meeting
this opinion would get a second.

I don't know where everyone is on the spectrum, but I also strongly
dislike -Werror yet do like -Wall and tend to get rid of warnings.
-Werror is good for continuous integration systems, not so great for
releases or active development.

-Werror kind of seems like Stack Ranking, good for use during brief
periods, but poor for long term continuous use.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



