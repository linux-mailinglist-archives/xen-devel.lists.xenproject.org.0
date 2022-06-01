Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8614753ABF6
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 19:33:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340661.565746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwSD5-0001A3-HG; Wed, 01 Jun 2022 17:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340661.565746; Wed, 01 Jun 2022 17:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwSD5-000177-E1; Wed, 01 Jun 2022 17:32:43 +0000
Received: by outflank-mailman (input) for mailman id 340661;
 Wed, 01 Jun 2022 17:32:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y5RR=WI=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nwSD4-000171-Az
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 17:32:42 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [2001:470:1f07:15ff::f7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d51c21ca-e1d0-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 19:32:40 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 251HWBV0087434
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 1 Jun 2022 13:32:16 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 251HWA8w087433;
 Wed, 1 Jun 2022 10:32:10 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: d51c21ca-e1d0-11ec-837f-e5687231ffcc
Date: Wed, 1 Jun 2022 10:32:10 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 3/4] build: replace get-fields.sh by a perl script
Message-ID: <Ypeimt5XHHog64qw@mattapan.m5p.com>
References: <20220601165909.46588-1-anthony.perard@citrix.com>
 <20220601165909.46588-4-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601165909.46588-4-anthony.perard@citrix.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Wed, Jun 01, 2022 at 05:59:08PM +0100, Anthony PERARD wrote:
> diff --git a/xen/tools/compat-xlat-header b/xen/tools/compat-xlat-header
> new file mode 100755
> index 0000000000..f1f42a9dde
> --- /dev/null
> +++ b/xen/tools/compat-xlat-header
> @@ -0,0 +1,539 @@
> +#!/usr/bin/perl -w
> +
> +use strict;
> +use warnings;

I hope to take more of a look at this, but one thing I immediately
notice:  -w is redundant with "use warnings;".  I strongly prefer
"use warnings;", but others may have different preferences.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



