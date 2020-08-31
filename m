Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FD92573C4
	for <lists+xen-devel@lfdr.de>; Mon, 31 Aug 2020 08:38:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCdSA-0007QG-77; Mon, 31 Aug 2020 06:38:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zoll=CJ=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kCdS8-0007QB-GW
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 06:38:04 +0000
X-Inumbo-ID: 1ecbc283-afee-440a-bfc9-bbfb2835f68f
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ecbc283-afee-440a-bfc9-bbfb2835f68f;
 Mon, 31 Aug 2020 06:38:03 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 07V6boIn006748
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Mon, 31 Aug 2020 02:37:55 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 07V6bmwK006747;
 Sun, 30 Aug 2020 23:37:48 -0700 (PDT) (envelope-from ehem)
Date: Sun, 30 Aug 2020 23:37:48 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Doug Goldstein <cardoe@cardoe.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH] gitignore: Move ignores from global to subdirectories
Message-ID: <20200831063748.GB1522@mattapan.m5p.com>
References: <20200828025747.GA25246@mattapan.m5p.com>
 <d284a27c-f347-f80f-f62f-78134749e20d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d284a27c-f347-f80f-f62f-78134749e20d@suse.com>
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

On Fri, Aug 28, 2020 at 09:24:41AM +0200, Jan Beulich wrote:
> On 28.08.2020 04:57, Elliott Mitchell wrote:
> > Subdirectories which have .gitignore files should not be referenced in
> > the global .gitignore files.  Move several lines to appropriate subdirs.
> > 
> > Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> > 
> > ---
> > Hopefully the commit message covers it.  When moved to the subdirectories
> > I'm using "./<file>" as otherwise any file sharing the name in a deeper
> > subdirectory would be subject to the match.
> 
> May I ask why this last sentence isn't part of the commit message?

My thinking is it was pretty straightforward to figure out when looking.
Not /quite/ obvious enough to avoid commenting in e-mail, but not quite
obscure enough to have in commit message.  This can go either way really.

The .gitignore files aren't very consistent.  I'm unsure whether it is
worth going after the inconsistencies, but it is certainly there.

Before this I noticed xen/xsm/flask/.gitignore had "/policy.c", which
overlapped with "xen/xsm/flask/policy.*" in the top-level .gitignore.
Checking the documentation on .gitignore files if it simply had
"policy.c", git would have ignored any file name "policy.c" in
subdirectories.

Is it better to prefix lines in the current directory with "./" versus
"/"?  (I kind of like "./" since it looks like a relative path, but it
*isn't* actually a relative path)

Should files in subdirectories also include "./"?  Preferences in
sorting?


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



