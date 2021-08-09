Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E06D13E4781
	for <lists+xen-devel@lfdr.de>; Mon,  9 Aug 2021 16:28:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165007.301528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD6FQ-0002kU-6U; Mon, 09 Aug 2021 14:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165007.301528; Mon, 09 Aug 2021 14:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD6FQ-0002ig-2t; Mon, 09 Aug 2021 14:27:24 +0000
Received: by outflank-mailman (input) for mailman id 165007;
 Mon, 09 Aug 2021 14:27:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gMyi=NA=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mD6FO-0002ia-15
 for xen-devel@lists.xenproject.org; Mon, 09 Aug 2021 14:27:22 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7b0caca-f91d-11eb-9f1d-12813bfff9fa;
 Mon, 09 Aug 2021 14:27:20 +0000 (UTC)
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
X-Inumbo-ID: e7b0caca-f91d-11eb-9f1d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1628519240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R8VO/kvFDYCLV8l12XG/+e7jrz2/DHPGxYKuo/PtC0U=;
  b=hUcxRnnPT7E3VzBAiz134keuiey5cV/mctPdREE7IIK/EmUPyBvKA0V1
   DcjuLyDsPxzNGt0MzEk7DQ8+f/Nw/MNDnTd7yWqUDDXDpbuVT8JRjWIlk
   cuTEPUOw6M7KUGaEIISWsf7x0d+Hjc94vjQtmNWuZ9okWdvxOO66tOulP
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: sGlJlofAClClz2rH+Dyxt4HmTBS4Cii+FHyYMxACIcZztRFk8hMzUr79qwYHE+YTtCeiDKgLS4
 dj1mF2moWS7l6xU23z7GvzgbFTliNAZhPA0A/Uwkt3eDBNy6No8f10nSa2BYvXmBOK2ypmFtJE
 x4F9FlzfqFXUNyFUK8YC9qElXiJtzdt906Mq269HAaNs80YbSi8vlhe/sZSLscOI5sZCPzEGhO
 IUYUxhPvQH/aZ299TZRIKpg/NL4DFQ/fIX4I05kfLwvSpPdb/KOWX1OZqDkaj3zsdwIJZ77QjP
 w/k2MEpmfo6Seir0tl0LUKmz
X-SBRS: 5.1
X-MesageID: 50037784
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:WRg++69JjrLfKvE0PeVuk+DaI+orL9Y04lQ7vn2YSXRuE/Bws/
 re+8jztCWE7Ar5N0tNpTntAsa9qDbnhPhICOoqTNKftWvdyQiVxehZhOOIqVDd8m/Fh4xgPM
 9bAtFD4bbLbWSS4/yV3DWF
X-IronPort-AV: E=Sophos;i="5.84,307,1620705600"; 
   d="scan'208";a="50037784"
Date: Mon, 9 Aug 2021 15:27:10 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v6 20/31] build: generate "include/xen/compile.h"
 with filechk
Message-ID: <YRE7PjLJBF/AbzED@perard>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-21-anthony.perard@citrix.com>
 <442ad44d-66f9-0646-18a5-441b76f91744@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <442ad44d-66f9-0646-18a5-441b76f91744@suse.com>

On Thu, Aug 05, 2021 at 09:20:10AM +0200, Jan Beulich wrote:
> On 01.07.2021 16:10, Anthony PERARD wrote:
> > This will always try regenerate the content of compile.h, but if it
> > didn't change the file isn't updated.
> > 
> > Also, as it's currently the case, the file isn't regenerated during
> > `sudo make install` if it exist and does belong to a different user.
> > 
> > Thus, we can remove the target "delete-unfresh-files".
> > Target $(TARGET) still need a phony dependency, so add FORCE.
> > 
> > This patch imports the macro 'filechk' from Linux v5.12.
> 
> Would you mind clarifying why $(if_changed ...) cannot be used here
> (unlike for .banner in the earlier patch)?

if_changed can be used instead of filechk. I probably use "filechk"
because I was looking for an excuse to use it, so I've used it here.

filechk advantage over if_changed is that the output of the command is
compared so there is no need to have an extra dependency (.*.cmd) file
generated. That probably mostly an advantage when the generated file
changed often, or when the command is simple enough.

But it seems that "filechk" is only used once in this patch series, in
this patch. So I can rework the patch to use "if_changed" instead, that
would avoid the need to import another macro from Linux, and avoid the
weird need to have the command "cat" the target when update isn't
wanted.

Thanks,

-- 
Anthony PERARD

