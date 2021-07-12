Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CA23C5C98
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jul 2021 14:49:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154550.285562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2vNE-0003zM-0L; Mon, 12 Jul 2021 12:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154550.285562; Mon, 12 Jul 2021 12:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2vND-0003xH-TL; Mon, 12 Jul 2021 12:49:23 +0000
Received: by outflank-mailman (input) for mailman id 154550;
 Mon, 12 Jul 2021 12:49:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKSD=ME=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m2vNB-0003x9-TZ
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 12:49:21 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93809bc0-e30f-11eb-86e8-12813bfff9fa;
 Mon, 12 Jul 2021 12:49:20 +0000 (UTC)
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
X-Inumbo-ID: 93809bc0-e30f-11eb-86e8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626094160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oM74VD8l8XOPg3/eEybFck4wjl/ovZD5q3idvb/NzRI=;
  b=TXZRHXVvDyZ0Hn+5T1dCfCLPUuLSExZrydAzF5viUBYhYokbjMQ+AqQU
   Zu7PQI2MrhYK8vohzlUs2wK9DVRQ5S/wyMtTrAf8wNCFsJEgRw3C683YU
   XxLSZMyHJCPe+ccJfGNx7/YjNoPZeTmHB4GILJK6YWb5BymYk9L2i5Mi0
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: oKsT2lLZY3nNM1eeJ8Q/FszhjtyMX765Bhr8p2+87MorSaP/cl+d3HvydRXYm7TfF7cvqUZw3u
 9reLguJfwWNOy3N6bCBdt4aM7Kp1KYgNYoCZ56DHfeU4nGFLI2ywOxsn3KQu708YoCtkZHdpRn
 q8QfDKHB8CGcBHHNbWH6d6X+k56oQ7GeVMay3yatontqxSAtlg8fZu1ZTCafu4ohKNGOGaAdXZ
 XZd4JrMzAooTC+GTJ/Gnkd2ep/FUxO3XgLjpP/DKkbPKbhvYMc5ogHrcCSALcmQg8L8jxQ2qBX
 bzk=
X-SBRS: 5.1
X-MesageID: 48056604
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:uMzOu6BXjgiU9krlHemu55DYdb4zR+YMi2TC1yhKKCC9Vvbo8P
 xG/c5rsSMc5wx8ZJhNo7+90ey7MBXhHP1OkOws1NWZLWrbUQKTRekIh+bfKn/bak/DH4ZmpN
 5dmsNFaOEYY2IVsfrH
X-IronPort-AV: E=Sophos;i="5.84,232,1620705600"; 
   d="scan'208";a="48056604"
Date: Mon, 12 Jul 2021 13:49:15 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, "Tim
 Deegan" <tim@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v6 06/31] x86/mm: avoid building multiple .o from a
 single .c file
Message-ID: <YOw6S4uJ4hF6/P3y@perard>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-7-anthony.perard@citrix.com>
 <73b924a9-dd69-7cc8-acf6-e4ae746c244c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <73b924a9-dd69-7cc8-acf6-e4ae746c244c@suse.com>

On Wed, Jul 07, 2021 at 04:45:11PM +0200, Jan Beulich wrote:
> On 01.07.2021 16:09, Anthony PERARD wrote:
> >  xen/Makefile                            | 11 -----------
> >  xen/Rules.mk                            |  2 +-
> >  xen/arch/x86/mm/Makefile                |  9 ---------
> >  xen/arch/x86/mm/guest_walk.c            |  3 ---
> >  xen/arch/x86/mm/guest_walk_2.c          |  2 ++
> >  xen/arch/x86/mm/guest_walk_3.c          |  2 ++
> >  xen/arch/x86/mm/guest_walk_4.c          |  2 ++
> >  xen/arch/x86/mm/hap/Makefile            |  9 ---------
> >  xen/arch/x86/mm/hap/guest_walk.c        |  3 ---
> >  xen/arch/x86/mm/hap/guest_walk_2level.c |  2 ++
> >  xen/arch/x86/mm/hap/guest_walk_3level.c |  2 ++
> >  xen/arch/x86/mm/hap/guest_walk_4level.c |  2 ++
> 
> Is there a particular reason you've kept the "level" in these three
> file names? Preferably with them shortened (and ideally dashes used
> everywhere in the new file names instead of underscores)

I had no reason to rename them. (Also, renaming them makes the patch
bigger ;-) as we would rename the objects files.)

But I can rename as part of the patch. Should I rename all of them (mm
hap and shadow) to "guest-walk-$level.c" ? Or just "guest-$level.c" like
in shadow/ ? On the other hand, it would probably be helpful to have the same
basename for both the source and the .c that includes the source (e.g.
"guest_walk.c" and "guest_walk_2.c" have "guest_walk" in common). So if
we were to replace underscores by dashes, we should probably rename
"guest_walk.c" to "guest-walk.c" as well.

So I'll remove the "level" from the filenames in hap/ to start with in
an update to this patch, it it worth it to do more that that?

> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks,

-- 
Anthony PERARD

