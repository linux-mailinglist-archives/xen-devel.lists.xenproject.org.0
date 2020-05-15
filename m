Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 916A21D4AC3
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 12:22:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZXTe-0004l4-8U; Fri, 15 May 2020 10:22:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0w9=65=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jZXTc-0004kz-Uu
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 10:22:00 +0000
X-Inumbo-ID: e90dd476-9695-11ea-b07b-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e90dd476-9695-11ea-b07b-bc764e2007e4;
 Fri, 15 May 2020 10:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589538119;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PLX/irBcj77s+RR4ozPmcDA6KQYvrn6NnBQ7KLS9iIc=;
 b=R1iDMpgHbFfFpB26Ua0an/7mqbQAkCjDkKIvjxddfgg4iUGhU6U1dvrj
 zYoGdmGwobw2h1MHQsswhmtk+1Bz4qwUiz2lPFONRgYB/ncSFcEaqeEwr
 SX/1GTUUtKZ6sDXzThjOd8+F4qGc1jFbk6Xa6jPid1HiwrYVFAUYjKDC5 M=;
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: pZRbFrtpvl5g/9Fs8nfhTIb67djmHS7ju521evFBt3UKyW1ZEYf5xD2yoZ104a1FtaC28Cle/r
 wOZEUz7uEt1CzQ1QRfC6t0ewtH7QcjuNB7PXsZsUedx1TOdjpZLq3WfYNEQKDkxdWv18hhvPf+
 HTZqKraVbhsx5mwDSX8LEOrumx+GtHIi/BJAxIcAcU22Xl+p/vxOHUHXUwq2xUquV0x/d1qcRP
 CpAfdibcZts3IZhHa5wHcjb5I4IupRJFu8pYgYwf+ncc/EmkahonKW3gii4CyBFHnXyu3043pn
 Mmg=
X-SBRS: 2.7
X-MesageID: 17972128
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,394,1583211600"; d="scan'208";a="17972128"
Date: Fri, 15 May 2020 12:21:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 4/6] x86/mem-paging: add minimal lock order
 enforcement to p2m_mem_paging_prep()
Message-ID: <20200515102149.GS54375@Air-de-Roger>
References: <b8437b1f-af58-70df-91d2-bd875912e57b@suse.com>
 <4af1f459-fe7a-cd61-43cb-fb3fa4f15c00@suse.com>
 <20200514162545.GI54375@Air-de-Roger>
 <8b9fd4ce-177f-6f57-8d24-8468fea0c299@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b9fd4ce-177f-6f57-8d24-8468fea0c299@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 15, 2020 at 11:46:23AM +0200, Jan Beulich wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> 
> On 14.05.2020 18:25, Roger Pau Monné wrote:
> > On Thu, Apr 23, 2020 at 10:38:44AM +0200, Jan Beulich wrote:
> >> While full checking is impossible (as the lock is being acquired/
> >> released down the call tree), perform at least a lock level check.
> > 
> > I'm slightly confused, doesn't alloc_domheap_page already have it's
> > own lock order checking?
> 
> I don't see how it would, as it doesn't (and can't legitimately)
> include arch/x86/mm/mm-locks.h. Also maybe this comment in the
> header clarifies it:
> 
> /* Page alloc lock (per-domain)
>  *
>  * This is an external lock, not represented by an mm_lock_t. However,
>  * pod code uses it in conjunction with the p2m lock, and expecting
>  * the ordering which we enforce here.
>  * The lock is not recursive. */


Thanks.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

