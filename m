Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C752726676D
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 19:42:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGn3V-0002Id-Ht; Fri, 11 Sep 2020 17:41:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XH/S=CU=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kGn3U-0002IY-0m
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 17:41:48 +0000
X-Inumbo-ID: e6617af4-6929-4be2-af7f-bfe05e2e0285
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6617af4-6929-4be2-af7f-bfe05e2e0285;
 Fri, 11 Sep 2020 17:41:46 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 08BHfVqZ054519
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 11 Sep 2020 13:41:37 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 08BHfQqI054518;
 Fri, 11 Sep 2020 10:41:26 -0700 (PDT) (envelope-from ehem)
Date: Fri, 11 Sep 2020 10:41:26 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Doug Goldstein <cardoe@cardoe.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH 01/11 v2] gitignore: Move ignores from global to
 subdirectories
Message-ID: <20200911174126.GA54276@mattapan.m5p.com>
References: <202009092152.089LqrKZ039176@m5p.com>
 <75d49f83-f53a-8263-40c3-51d2cd624ccd@suse.com>
 <20200910182200.GB45655@mattapan.m5p.com>
 <3174b892-6177-cf8a-2c2a-7c6f1b0ecc2e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3174b892-6177-cf8a-2c2a-7c6f1b0ecc2e@suse.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
 autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Sep 11, 2020 at 08:29:51AM +0200, Jan Beulich wrote:
> On 10.09.2020 20:22, Elliott Mitchell wrote:
> > I had *thought* "./" would restrict to capturing files in the current
> > directory, but after some testing and then some reading of the
> > documentation (oh, `git check-ignore` is a thing).  Then reading the
> > documentation again.  Then reading the documentation *again*.  I found an
> > initial "/" restricts a pattern to the current directory, but `git`
> > doesn't handle "./".
> > 
> > Apparently a pattern with a slash *anywhere* besides the *end* (which
> > includes the very start) will be treated as a full path relative to the
> > current directory.  As such "foo/bar" and "/foo/bar" are equivalent.  Yet
> > "foo" and "/foo" are *not* equivalent.
> 
> But then ./foo and /foo ought to be equivalent, too. Unless of
> course the . gets in the way of matching names in the first
> place ...

Could be something along those lines.  Note gitignore is a function of
*git* *simulating* the actions involved in accessing files, not something
pretending to be all that close to an actual kernel implementation.

The result is testing with `git check-ignore` indicated "./" did not
work, so I had to use "/" which looks odd in a suspicions way.  I rather
liked "./", but with reality intruding.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



