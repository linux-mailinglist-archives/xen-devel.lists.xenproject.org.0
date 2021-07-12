Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 659163C54A4
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jul 2021 12:54:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154500.285490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2tZP-0006lU-D6; Mon, 12 Jul 2021 10:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154500.285490; Mon, 12 Jul 2021 10:53:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2tZP-0006jC-9U; Mon, 12 Jul 2021 10:53:51 +0000
Received: by outflank-mailman (input) for mailman id 154500;
 Mon, 12 Jul 2021 10:53:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKSD=ME=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m2tZN-0006j6-Ka
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 10:53:49 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7987c5bb-0b59-41ff-9601-9226955f7269;
 Mon, 12 Jul 2021 10:53:48 +0000 (UTC)
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
X-Inumbo-ID: 7987c5bb-0b59-41ff-9601-9226955f7269
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626087228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TGWOSZFW36I+1wTfbvinRjzRN7QWE80Sw924WPMV/V8=;
  b=ZkFG4f+Zb8bumqYUTzv8BCXKor6/lHO4bMBMmq4Xi0+b5DK4quALSYOt
   o0rUcV9mficqem9vCCdZFxvBhls01nxUZnsb3RzAL0GDuWbVrWo3c4QeX
   vZC3yio4pEssVxV0ZU/pB5vySx6ntadU0qpHVRRz5EhepjMz7e6F/K6Vp
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Y/zBjq4bDdCpLPDRfTg0OLBa5RDI3wsg3PBQnImaTiZ6Hno2DZ/wiH38oKvGpKtpAkNBNqbBsi
 I+/c5BN8/dpqagQSqef79nwOtqeUAry4KDDaJf7CHnHi1oU8inGWL0V2PdQxJuZi+r4ki104J7
 814FvhVDpDtgztqy2TYcihaaFhm4VC9RpcEdzOa2WfAcfbmX+LHDW7tlDV6BE7x6olchgmHGce
 xKcPWmJOeo0qwR8A7BMAvZp/jDCAqupTJXXknOqoWTyaNEp4PfrWW7+Dd390cjNcR7FSdPIXjp
 2tM=
X-SBRS: 5.1
X-MesageID: 49691875
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Pk6sV6j4X1wjUPBb+E7KjxpOkHBQXuIji2hC6mlwRA09TyXPrb
 HLoB1973/JYVcqOU3I9urpBEDtexjhHP1Oj7X5X43PYOC8ghrMEGgK1+LfKlvbcREWndQz6U
 4PScVD4HKbNykcsS5XijPIcOrJYbO8gcKVuds=
X-IronPort-AV: E=Sophos;i="5.84,232,1620705600"; 
   d="scan'208";a="49691875"
Date: Mon, 12 Jul 2021 11:53:44 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, "Tim
 Deegan" <tim@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v6 02/31] build: introduce cpp_flags macro
Message-ID: <YOwfOPEd0pdH3N4F@perard>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-3-anthony.perard@citrix.com>
 <1eaf6dcc-1b92-361e-04d2-a172223ae96c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1eaf6dcc-1b92-361e-04d2-a172223ae96c@suse.com>

On Wed, Jul 07, 2021 at 04:18:18PM +0200, Jan Beulich wrote:
> On 01.07.2021 16:09, Anthony PERARD wrote:
> >  xen/Rules.mk                    | 7 +++++--
> >  xen/arch/x86/mm/Makefile        | 2 +-
> >  xen/arch/x86/mm/hap/Makefile    | 2 +-
> >  xen/arch/x86/mm/shadow/Makefile | 2 +-
> >  4 files changed, 8 insertions(+), 5 deletions(-)
> 
> There are two further uses, one in xen/Makefile and one in
> xen/x86/Makefile. I think both want replacing too, and the
> former suggests you also want to strip -flto alongside -Wa,%.
> I can accept the use in xen/include/Makefile not getting
> touched, as it also removes an -include option at the same
> time.

Sounds good, I'll filter -flto and convert "asm-offsets.s" and
"xen.lds".

Thanks,

-- 
Anthony PERARD

