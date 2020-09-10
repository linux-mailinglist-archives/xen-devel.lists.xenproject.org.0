Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD448264C75
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 20:13:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGR3j-0001Ty-U2; Thu, 10 Sep 2020 18:12:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nxmn=CT=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kGR3i-0001Ts-Qk
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 18:12:34 +0000
X-Inumbo-ID: 15ca5c9a-6e01-4e6b-88e5-363775c6a43b
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15ca5c9a-6e01-4e6b-88e5-363775c6a43b;
 Thu, 10 Sep 2020 18:12:33 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 08AICJGk045870
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 10 Sep 2020 14:12:25 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 08AICIqP045869;
 Thu, 10 Sep 2020 11:12:18 -0700 (PDT) (envelope-from ehem)
Date: Thu, 10 Sep 2020 11:12:18 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 02/11] gitignore: Remove entries duplicating global entries
Message-ID: <20200910181218.GA45655@mattapan.m5p.com>
References: <202009092153.089Lr130039181@m5p.com>
 <fce7ca9b-0096-a484-d789-32716f5d0c64@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fce7ca9b-0096-a484-d789-32716f5d0c64@suse.com>
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

On Thu, Sep 10, 2020 at 11:20:11AM +0200, Jan Beulich wrote:
> On 02.09.2020 00:02, Elliott Mitchell wrote:
> > --- a/.gitignore
> > +++ b/.gitignore
> > @@ -1,6 +1,5 @@
> >  .hg
> >  .*.cmd
> > -.*.tmp
> 
> When the shell expands *.tmp, any .*.tmp won't match. Is this different
> for git? (Probably it is, seeing that we only have *.d and *.d2, but I'd
> still like to double check.)

`git --version` => "git version 2.20.1"
`git check-ignore -vn .foo.tmp`  =>  ".gitignore:23:*.tmp     .foo.tmp"
`git check-ignore -vn foo.tmp`   =>  ".gitignore:23:*.tmp     foo.tmp"
`git check-ignore -vn .tmp`      =>  ".gitignore:23:*.tmp     .tmp"
`git check-ignore -vn .foo`      =>  "::      .foo"

A shell will not expand "*" at the start to a filename starting with a
period, but `git` will (at least as of the version I've got).


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



