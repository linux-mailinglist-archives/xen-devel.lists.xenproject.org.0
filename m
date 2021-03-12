Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA831339530
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 18:39:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97277.184751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKlkZ-0005r0-OL; Fri, 12 Mar 2021 17:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97277.184751; Fri, 12 Mar 2021 17:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKlkZ-0005qb-Kv; Fri, 12 Mar 2021 17:38:59 +0000
Received: by outflank-mailman (input) for mailman id 97277;
 Fri, 12 Mar 2021 17:38:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0ZG=IK=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1lKlkY-0005qV-Pr
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 17:38:58 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 55f4ed62-aea6-42d3-a2bd-5b4f2865e42f;
 Fri, 12 Mar 2021 17:38:57 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 12CHcaIH077739
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 12 Mar 2021 12:38:42 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 12CHcaQA077738;
 Fri, 12 Mar 2021 09:38:36 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 55f4ed62-aea6-42d3-a2bd-5b4f2865e42f
Date: Fri, 12 Mar 2021 09:38:36 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
        Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.15] arm: replace typeof() with __typeof__()
Message-ID: <YEunHIrnCCMy9lh5@mattapan.m5p.com>
References: <202103092114.129LEgZp059925@m5p.com>
 <eaef1b6d-db89-945a-e8be-2b3f9145780c@citrix.com>
 <e8c826f7-8bf5-fb5d-c1ec-97d8ba1d79d0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8c826f7-8bf5-fb5d-c1ec-97d8ba1d79d0@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Wed, Mar 10, 2021 at 09:54:57AM +0100, Jan Beulich wrote:
> On 09.03.2021 22:27, Andrew Cooper wrote:
> > 
> > I wonder why our header checks don't pick this up.?? Do we need to throw
> > a -pedantic around?
> 
> That's a long-standing issue with the checking: For issues to be
> found in macros, the macros would actually need to be used.

This is key since only the hunk for xen/include/public/arch-arm.h was
found during a build.  The other two hunks were found while preparing to
submit this to the Xen Project since I checked for other occurrences of
typeof().  Had I not spent the time to look, the other three uses might
have generated 2-3 additional patches in the future.

Also notable the ARM portion was originally found more than 5 years ago
(between 4.2 and 4.6), so this had been lurking for a long time.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



