Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1103E3C5A13
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jul 2021 13:03:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154508.285500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2tiM-0008H5-93; Mon, 12 Jul 2021 11:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154508.285500; Mon, 12 Jul 2021 11:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2tiM-0008EG-5w; Mon, 12 Jul 2021 11:03:06 +0000
Received: by outflank-mailman (input) for mailman id 154508;
 Mon, 12 Jul 2021 11:03:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKSD=ME=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m2tiK-0008EA-Uf
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 11:03:04 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13b568aa-27b3-4e24-87ec-f93db7e88299;
 Mon, 12 Jul 2021 11:03:04 +0000 (UTC)
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
X-Inumbo-ID: 13b568aa-27b3-4e24-87ec-f93db7e88299
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626087783;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MDGf0GOT8MKEQ9BoxBwjqpUYukrI9cs/XR0ewV3rjgI=;
  b=BpfE7znsJvCL0YP5zQSoitxvP2Upv2s+/J2b8cdxWR+jn9L0MVhOhcsY
   Br+AO/pBKz9vuuQbRgILa0gNo6PDUSDGCvpBsXp5YQ7f8a/OqxN50NYkq
   d/Us7CB1hm9IqAhfOdoOkoHlJthxQUrafHhamjUOKWqv8i5H+uNuOIVhn
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +ZWWVgX8WxgtVXVnKsD9iejoiHigL0gY+lVoXiPUv4Ozx65KWKJnOMqtBahhaBeoQNftFQhp1T
 ThjZr/uiEWIsynxXFrxcyPixhlDlns7YEk4xnwglCugV42heexDBnPNoLjFShCHz9j+k52irBm
 H46p39zRLMtsdcw9n5paZp4UNaCHbueGmgh+ga66QkpZpyk7FNJLMuEHihwDyOu9VBKKlCqhv9
 hlOJ4iTjtHwsepTAb7XHfsalurXhCa2bwlxxtQ9PBXCxV/ofcRxw6afcLTQufr+yhCB31BiSNL
 9Xc=
X-SBRS: 5.1
X-MesageID: 48113017
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:B/pCia880OhYKgafUnpuk+DaI+orL9Y04lQ7vn2YSXRuE/Bws/
 re+8jztCWE7Ar5N0tNpTntAsa9qDbnhPhICOoqTNKftWvdyQiVxehZhOOIqVDd8m/Fh4xgPM
 9bAtFD4bbLbWSS4/yV3DWF
X-IronPort-AV: E=Sophos;i="5.84,232,1620705600"; 
   d="scan'208";a="48113017"
Date: Mon, 12 Jul 2021 12:02:59 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v6 05/31] build: factorise generation of the linker
 scripts
Message-ID: <YOwhY9yycoMACBGK@perard>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-6-anthony.perard@citrix.com>
 <5a9f0468-7ef6-eebb-cebc-492050ed7e8f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5a9f0468-7ef6-eebb-cebc-492050ed7e8f@suse.com>

On Wed, Jul 07, 2021 at 04:25:33PM +0200, Jan Beulich wrote:
> On 01.07.2021 16:09, Anthony PERARD wrote:
> > In Arm and X86 makefile, generating the linker script is the same, so
> > we can simply have both call the same macro.
> > 
> > We need to add *.lds files into extra-y so that Rules.mk can find the
> > .*.cmd dependency file and load it.
> > 
> > Change made to the command line:
> > - Use cpp_flags macro which simply filter -Wa,% options from $(a_flags).
> > - Added -D__LINKER__ even it is only used by Arm's lds.
> 
> I'm not really happy about this, not the least because the symbol's name
> doesn't fit its purpose (we're not linking, but producing a linker script
> at that stage), but well ...

Also, the leading "__" is probably a bad idea as I think it's reserved?

I'll look at adding creating a patch which would rename that to
LINKER_SCRIPT which seems more appropriate.

> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks,

-- 
Anthony PERARD

