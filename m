Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B19739BA80
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 16:04:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136856.253612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpAPZ-0004RV-Em; Fri, 04 Jun 2021 14:02:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136856.253612; Fri, 04 Jun 2021 14:02:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpAPZ-0004PR-Bg; Fri, 04 Jun 2021 14:02:57 +0000
Received: by outflank-mailman (input) for mailman id 136856;
 Fri, 04 Jun 2021 14:02:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IglV=K6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lpAPX-0004P5-Ot
 for xen-devel@lists.xenproject.org; Fri, 04 Jun 2021 14:02:55 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd823290-e4eb-4ca0-9bdf-a19d4349493d;
 Fri, 04 Jun 2021 14:02:54 +0000 (UTC)
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
X-Inumbo-ID: bd823290-e4eb-4ca0-9bdf-a19d4349493d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622815374;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N4+fDvYI2amX88/8/iFILWCZCR6BXNTYicLBxZrRct0=;
  b=JA16YKQMkK/D9RW4tb6YiStK4mitj7XYyhAiw3vhwT8HDa4zzAToE4f8
   D/qt7jK3+aMUdPPk+x34vCj0etYvgBoYHMxOa3RHL4DtlRPIkNNPwGktI
   lsdqWfXeYo/6CmOG18ADtBwzX2Uw2uyTuBcA+F+Uxuaayu7PBoI7DgW/S
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: LccNi1ABg2fU2CGm1N+yXA8fL32vdOLwg77JtzvbgFqZhUzQQ7l1DftcgTsGJQktDZQPAU342D
 iZs9O98Ld9QBz+zy0kZvAHM8eDwBToXvTU6QwYgAJSDl8hnyv9nH8nXLBas9cF4nvqMTfRS+3T
 PfLRBb1qiwVFhMNN1sP9i/D6Pc6ibm96FTLDnHyzS84mvdzSHT+YGgmAuQ3ve7X4NwdXqTCrn2
 HqHRIlXjvLEYrYp2BmqmJzJGIS0tDS6OexX01rD7hRrIQEXnIg786sq/L1Ik/s3cpQl4IifUPf
 oSM=
X-SBRS: 5.1
X-MesageID: 45757060
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:7hC/i669S7LljvWAowPXwMzXdLJyesId70hD6qkXc20zTiX4rb
 HLoB1/73TJYVkqNE3I9eruBEDjex3hHO9OgbX5VI3KNGOKhILCFuBfBOXZsl/dMhy72ulB1b
 pxN4hSYeeAaGSSVPyKgzWFLw==
X-IronPort-AV: E=Sophos;i="5.83,248,1616472000"; 
   d="scan'208";a="45757060"
Date: Fri, 4 Jun 2021 15:02:50 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>, <lersek@redhat.com>
CC: Julien Grall <julien@xen.org>, Ard Biesheuvel <ardb+tianocore@kernel.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>, xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [edk2-devel] [PATCH 00/43] OvmfPkg: remove Xen support from
 OvmfPkg*.dsc, in favor of OvmfXen.dsc
Message-ID: <YLoyiqSYxPDJ7VRl@perard>
References: <20210526201446.12554-1-lersek@redhat.com>
 <71da2a3b-aab1-4ecf-7e01-16b537d841a2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <71da2a3b-aab1-4ecf-7e01-16b537d841a2@redhat.com>

On Wed, Jun 02, 2021 at 10:36:49AM +0200, Laszlo Ersek wrote:
> Anthony, Julien,
> 
> (or anyone else subscribed to xen-devel -- CC'd now),
> 
> On 05/26/21 22:14, Laszlo Ersek wrote:
> > Bugzilla: https://bugzilla.tianocore.org/show_bug.cgi?id=2122
> > Repo:     https://pagure.io/lersek/edk2.git
> > Branch:   xen_split_bz_2122
> 
> can you please build the OvmfXen platform on this branch, and check if
> there are any regressions?

Hi Laszlo,

OvmfXen seems to be working fine with that branch applied.

Thanks,

-- 
Anthony PERARD

