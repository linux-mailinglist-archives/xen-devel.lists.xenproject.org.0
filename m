Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A05CF19F3FA
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 13:00:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLPU6-00017u-Gp; Mon, 06 Apr 2020 11:00:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=06X9=5W=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jLPU4-0000v6-L5
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 11:00:04 +0000
X-Inumbo-ID: c3e7cba3-77f5-11ea-bfe0-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3e7cba3-77f5-11ea-bfe0-12813bfff9fa;
 Mon, 06 Apr 2020 11:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586170803;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4hx5mGuHDzA5+dvvT4cVCkiCfX8ylquIvcCMnoby8o8=;
 b=AlT2GZlaPxuKcV9GX4kHCs+T2VidspOwSNV7/SIeYJD88XWKeSPZeTni
 hMQsZM52CW6M/btB8wxvoPyldho7EQUC9qMR8XEtZXCRBW5hOzE9fhiGd
 R56gfmol9r4Bnu8Ny1URAa2UdqyjS5BMmlWvpc6rbmHJ+I3jl4+7rhssd g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vzlJoJoPAWg3TfMFYrWLraz7UQzkYEFdlGGQmtyLH3Nt97LUS2ei0GJtf75z6whm2zpnCVqbKg
 IBJDVMR9rghkcT7KNpbYdfbCNOK97ABA+rihv4x55SWwFLeutrij99+YxiPQCXwL88XhjP8Bka
 0D8doIQw2ZfOrEey/y+p/kNmNQM0aHstCNclMfWLi5rBTmOoCBOMcZP0BaXycD0eDG5UqDdJNP
 rw35MtUdb7UYmSffiu/kglPgSDxVq2F1tl1nOEpblMtLp1NEnwWM6FMJuL4PGsKc9sAC5VfsT6
 +YM=
X-SBRS: 2.7
X-MesageID: 15547921
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,350,1580792400"; d="scan'208";a="15547921"
Date: Mon, 6 Apr 2020 11:59:54 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: <paul@xen.org>
Subject: Re: [PATCH for-5.0] xen-block: Fix double qlist remove
Message-ID: <20200406105954.GT4088@perard.uk.xensource.com>
References: <20200402130819.1216125-1-anthony.perard@citrix.com>
 <001801d608fa$d3f0d3f0$7bd27bd0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <001801d608fa$d3f0d3f0$7bd27bd0$@xen.org>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: 'Kevin Wolf' <kwolf@redhat.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, qemu-block@nongnu.org,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org, 'Max Reitz' <mreitz@redhat.com>,
 'Stefan Hajnoczi' <stefanha@redhat.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 02, 2020 at 03:27:22PM +0100, Paul Durrant wrote:
> > -----Original Message-----
> > From: Anthony PERARD <anthony.perard@citrix.com>
> > Sent: 02 April 2020 14:08
> > To: qemu-devel@nongnu.org
> > Cc: qemu-stable@nongnu.org; Anthony PERARD <anthony.perard@citrix.com>; Stefano Stabellini
> > <sstabellini@kernel.org>; Paul Durrant <paul@xen.org>; Stefan Hajnoczi <stefanha@redhat.com>; Kevin
> > Wolf <kwolf@redhat.com>; Max Reitz <mreitz@redhat.com>; xen-devel@lists.xenproject.org; qemu-
> > block@nongnu.org
> > Subject: [PATCH for-5.0] xen-block: Fix double qlist remove
> > 
> > Commit a31ca6801c02 ("qemu/queue.h: clear linked list pointers on
> > remove") revealed that a request was removed twice from a list, once
> > in xen_block_finish_request() and a second time in
> > xen_block_release_request() when both function are called from
> > xen_block_complete_aio(). But also, the `requests_inflight' counter is
> > decreased twice, and thus became negative.
> > 
> > This is a bug that was introduced in bfd0d6366043, where a `finished'
> > list was removed.
> > 
> > This patch simply re-add the `finish' parameter of
> > xen_block_release_request() so that we can distinguish when we need to
> > remove a request from the inflight list and when not.
> > 
> > Fixes: bfd0d6366043 ("xen-block: improve response latency")
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> It looks to me like it would just be more straightforward to simply drop the QLIST_REMOVE and requests_inflight-- from
> xen_block_release_request() and simply insist that xen_block_finish_request() is called in all cases (which I think means adding one
> extra call to it in xen_block_handle_requests()).

I'm thinking of going further than that. I've notice another bug, in
case of error in xen_block_do_aio(), xen_block_finish_request() is
called without ever calling send_response() or release_request(). I
think that mean a leak of request.

So, I'm thinking of creating a function that would do finish_request(),
send_response(), release_request(), has I believe those operations needs
to be done together anyway.

I'll rework the patch.

-- 
Anthony PERARD

