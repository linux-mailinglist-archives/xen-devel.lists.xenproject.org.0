Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E8039E15E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 18:01:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138082.255703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqHgN-000595-IF; Mon, 07 Jun 2021 16:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138082.255703; Mon, 07 Jun 2021 16:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqHgN-00056r-Em; Mon, 07 Jun 2021 16:00:55 +0000
Received: by outflank-mailman (input) for mailman id 138082;
 Mon, 07 Jun 2021 16:00:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gI4l=LB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lqHgL-00056l-Eu
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 16:00:53 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f2f3275-a6a1-4fbe-96ed-e98c39d48087;
 Mon, 07 Jun 2021 16:00:51 +0000 (UTC)
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
X-Inumbo-ID: 0f2f3275-a6a1-4fbe-96ed-e98c39d48087
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623081651;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+KkwsGrzndxOAS/E3lA6QFfueBllf0d4acF0r8yeGvU=;
  b=GoKXIMcsskXCFzYqRSBIzUmqZvQ4q/1n1hAO/8pRCkEDGv/0eFRQrYfL
   nVi/v/hz1JN6EmrjKYQEjNETx3re5gBjWrr2ccIshbDRSW8D5oEl8WseD
   gM2iQ1IzNjizsTnthjnPoY3GaDosrVBCaqTrvG19FjnZ0PNmF5rWq1mxT
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: AxTeQ2jRhwxGIWtJM6V00Zk8gorvYbI2SqDSbDwNKqConrtNd+1/KBZXQjs64TEKHK004RiJEK
 NtCf/JBQwXLY/iT/xgI7MakHx9Z41+dDBz1A5bi1GHyUxa/2NqQt2GaExKeDEu/PnG4RIM71xq
 Zu5dOaNtqf5k6z/uB956PuEjNN7NpEZmcf6sELLZCWZOJt7d2SMkwAfSxpacuRpLEtqrEsmEvB
 vG/cD38kYV47TbFhOlzj41i0b6xm4pcFtuTrWjPJ+BqxmfROJnl0OIVb44LeWc3zRJWFCAwa+X
 /DY=
X-SBRS: 5.1
X-MesageID: 45630884
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:0bFdh67JG9d+jI8tlQPXwY2BI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6AxxZJhAo6H4BEDkex/hHPFOkO4s1NuZLWzbUQiTXeNfBOnZskXd8kTFn4Yzu9
 YCT0VnMr3N5DBB/L3HCWKDYrAdKbe8gcSVbNPlvg1QpExRGtRdxjY8LjzePlx9RQFAC5Z8Po
 Gb/NB7qz2pfmlSRtinB1EeNtKz7OHjpdbDW1orFhQn4A6BgXeD87jhCSWV2R8YTndm3aoiy2
 7YiAb0j5/T+c1T8iWsmlM70q4m0ecJi+EzcvBks/JlXQkEXzzYLLiIWNW5zUAISa+UmRoXee
 L30msd1vJImgLsl1GO0GbQMjbboUkTAl/ZuCylaCjY0L7ErAxTMbs+uWseSGqs13Yd
X-IronPort-AV: E=Sophos;i="5.83,255,1616472000"; 
   d="scan'208";a="45630884"
Date: Mon, 7 Jun 2021 17:00:46 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Thomas Huth <thuth@redhat.com>
CC: Ahmed Abouzied <email@aabouzied.com>, <qemu-devel@nongnu.org>,
	<qemu-trivial@nongnu.org>, Stefano Stabellini <sstabellini@kernel.org>, "Paul
 Durrant" <paul@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] Remove leading underscores from Xen defines
Message-ID: <YL5Crh2VlyxGNUlI@perard>
References: <20210605175001.13836-1-email@aabouzied.com>
 <01ba2176-b559-1078-8a9f-39553989d9d3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <01ba2176-b559-1078-8a9f-39553989d9d3@redhat.com>

On Mon, Jun 07, 2021 at 08:36:07AM +0200, Thomas Huth wrote:
> On 05/06/2021 19.50, Ahmed Abouzied wrote:
> > Identifiers with leading underscores followed by capital letters or
> > underscores are reserved for C standards.
> > 
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/369
> > 
> > Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
> > ---
> >   include/hw/xen/interface/grant_table.h  | 4 ++--
> >   include/hw/xen/interface/io/blkif.h     | 4 ++--
> >   include/hw/xen/interface/io/console.h   | 4 ++--
> >   include/hw/xen/interface/io/fbif.h      | 4 ++--
> >   include/hw/xen/interface/io/kbdif.h     | 4 ++--
> >   include/hw/xen/interface/io/netif.h     | 4 ++--
> >   include/hw/xen/interface/io/protocols.h | 4 ++--
> >   include/hw/xen/interface/io/ring.h      | 4 ++--
> >   include/hw/xen/interface/io/usbif.h     | 4 ++--
> >   9 files changed, 18 insertions(+), 18 deletions(-)
> > 
> 
> I hope the Xen people can comment on whether the underscores had a purpose
> here or whether it's ok to remove them, thus:
> 
> Cc: xen-devel@lists.xenproject.org
> 
> From my QEMU-developer's side of view:
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 

Nacked-by: Anthony PERARD <anthony.perard@citrix.com>

Please don't change the header guards in include/hw/xen/interface/.
This have been attempted before and result in build failures, see
d1744bd3218daa820744c14572058491e4854399 (Revert xen/io/ring.h of "Clean up a few header guard symbols")

Cheers,

-- 
Anthony PERARD

