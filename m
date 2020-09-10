Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDA5264CBC
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 20:22:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGRD9-0002Su-DT; Thu, 10 Sep 2020 18:22:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nxmn=CT=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kGRD7-0002Sn-I8
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 18:22:17 +0000
X-Inumbo-ID: 6f2c93b3-a9fd-4813-861b-3065d3fc2b27
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f2c93b3-a9fd-4813-861b-3065d3fc2b27;
 Thu, 10 Sep 2020 18:22:16 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 08AIM1B8045928
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 10 Sep 2020 14:22:06 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 08AIM0eI045927;
 Thu, 10 Sep 2020 11:22:00 -0700 (PDT) (envelope-from ehem)
Date: Thu, 10 Sep 2020 11:22:00 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Doug Goldstein <cardoe@cardoe.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH 01/11 v2] gitignore: Move ignores from global to
 subdirectories
Message-ID: <20200910182200.GB45655@mattapan.m5p.com>
References: <202009092152.089LqrKZ039176@m5p.com>
 <75d49f83-f53a-8263-40c3-51d2cd624ccd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75d49f83-f53a-8263-40c3-51d2cd624ccd@suse.com>
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

On Thu, Sep 10, 2020 at 11:13:26AM +0200, Jan Beulich wrote:
> On 27.08.2020 21:09, Elliott Mitchell wrote:
> > --- a/tools/misc/.gitignore
> > +++ b/tools/misc/.gitignore
> > @@ -1 +1,22 @@
> > -xen-ucode
> > +/cpuperf/cpuperf-perfcntr
> > +/cpuperf/cpuperf-xen
> > +/lowmemd
> > +/xc_shadow
> > +/xen-cpuid
> > +/xen-detect
> > +/xen-diag
> > +/xen-hptool
> > +/xen-hvmcrash
> > +/xen-hvmctx
> > +/xen-livepatch
> > +/xen-lowmemd
> > +/xen-mfndump
> > +/xen-tmem-list-parse
> > +/xen-ucode
> > +/xen_cpuperf
> > +/xencov
> > +/xenhypfs
> > +/xenlockprof
> > +/xenperf
> > +/xenpm
> > +/xenwatchdogd
> 
> The earlier discussion had left me with the impression that the ./
> form would be slightly better to use to avoid puzzling the
> occasional reader. Did I overlook or mis-interpret anything? Did you
> come to the conclusion that / is better, but forgot to mention the
> "why" in at least the cover letter?

Some of Xen's documentation isn't that great, even though most of `git`'s
documentation is quite good a few pieces aren't so great.  The
information on how .gitignore files are treated is less than wonderful.

I had *thought* "./" would restrict to capturing files in the current
directory, but after some testing and then some reading of the
documentation (oh, `git check-ignore` is a thing).  Then reading the
documentation again.  Then reading the documentation *again*.  I found an
initial "/" restricts a pattern to the current directory, but `git`
doesn't handle "./".

Apparently a pattern with a slash *anywhere* besides the *end* (which
includes the very start) will be treated as a full path relative to the
current directory.  As such "foo/bar" and "/foo/bar" are equivalent.  Yet
"foo" and "/foo" are *not* equivalent.

Meanwhile a slash at the end tells `git` to *only* match a directory.

Then you have "**" which will match zero or more directories.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



