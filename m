Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A19D0268971
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 12:42:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHlvS-0007lJ-Qb; Mon, 14 Sep 2020 10:41:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=odsp=CX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kHlvR-0007lC-1x
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 10:41:33 +0000
X-Inumbo-ID: bef3e93c-b81b-49f6-a778-ed4a23322a2d
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bef3e93c-b81b-49f6-a778-ed4a23322a2d;
 Mon, 14 Sep 2020 10:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600080081;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8y9FjlmLmmqcLUlzgjBpq1JLUyEJtbJMrOjJW+aoA54=;
 b=aO3hzb7a5ZZ+C0c73BmWWd0qrIslHFj93qS/HV1GRgH3ZjNm938jJjHX
 jUq84P3tcAPA9LHAom6nk4qubAz3csSd3npdCLJPuOu1Mofw286Nw+zvT
 /qAetU4ye3cZfG81LQN9WBrxZOXh5G794rlxF9Q+OpG4Uv5JxwbNhV2h7 I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: aGPId1rx4HmlDDpMeAKeduKmGJMnaGc733VP/iD3spatDYCeAuMC5YFiPO38z/ShpG+7z5VBkU
 i14EWHIUyM3dlJYPhUNX9NQpe0sTqbTRxKp5tlOtDlKMGntMYyp5caKvcvYI7QcnRjdMdIzsOX
 05Ho+zjvJfONYWO6qGwF+7b3uakxNuxHUvQFvRZpx9U/duNmJ3YS4kG5x09SKwkZju8Y0k7+th
 japsTO+JXz13gxM935qk3wcS4FyzBnQw8MKiqo4kyCo1FlzswA9mmDBgSsfgJ1MyGy2qxqrM4V
 d6c=
X-SBRS: 2.7
X-MesageID: 26739045
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,425,1592884800"; d="scan'208";a="26739045"
Date: Mon, 14 Sep 2020 12:41:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
CC: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>, "Paul
 Durrant" <pdurrant@amazon.com>, Ian Jackson <iwj@xenproject.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>
Subject: Re: [PATCH 2/2] libxl: do not automatically force detach of block
 devices
Message-ID: <20200914104109.GE753@Air-de-Roger>
References: <20200903100537.1337-1-paul@xen.org>
 <20200903100537.1337-3-paul@xen.org>
 <20200908141903.it25fe672dltw7pm@liuwe-devbox-debian-v2>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200908141903.it25fe672dltw7pm@liuwe-devbox-debian-v2>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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

On Tue, Sep 08, 2020 at 02:19:03PM +0000, Wei Liu wrote:
> On Thu, Sep 03, 2020 at 11:05:37AM +0100, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> > 
> > The manpage for 'xl' documents that guest co-operation is required for a (non-
> > forced) block-detach operation and that it may consequently fail. Currently,
> > however, the implementation of generic device removal means that a time-out
> > of a block-detach is being automatically re-tried with the force flag set
> > rather than failing. This patch stops such behaviour.
> > 
> > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> 
> I'm two-minded here.
> 
> On the one hand, special-casing VBD in libxl to conform to xl's
> behaviour seems wrong to me.
> 
> On the other hand, if we want to treat all devices the same in libxl,
> libxl should drop its force-removal behaviour all together, and the
> retry behaviour would need to be implemented in xl for all devices
> excepts for VBD. This requires a bit of code churn and, more
> importantly, changes how those device removal APIs behave. In the end
> this effort may not worth it.

I would be worried about those changes, as we would likely have to
also change libvirt or any other downstreams?

> If we go with the patch here, we should document this special case on
> libxl level somehow.
> 
> Anthony and Ian, do you have any opinion on this?

Maybe a new function should be introduced instead, that attempts to
remove a device gracefully and fail otherwise?

Then none of the current APIs would change, and xl could use this new
function to handle VBD removal?

Roger.

