Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4351D366A
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 18:26:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZGgE-00054K-Uc; Thu, 14 May 2020 16:25:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=otfA=64=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jZGgD-00054A-Ip
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 16:25:53 +0000
X-Inumbo-ID: 94419cac-95ff-11ea-b07b-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94419cac-95ff-11ea-b07b-bc764e2007e4;
 Thu, 14 May 2020 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589473552;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GN4lWMY13FvzACO9lWX0bYCvDy9k+rCP+X515Is5yuI=;
 b=LndPkm+KDiNGOTKp29QLfRPOhOQHoe/8jpSPOlc5VB2bxlH+y7k+va3e
 PXHTPxjfPiIpBhvpODbuEP/g77jdomjdGq44/PO+loigyqX2NiCarND6N
 tciUgrFtmpNw30xNFlKLSrujchd0opzvM3IlGGA6WxyFig2R2aAMXpyDn A=;
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
IronPort-SDR: +thdOU5cCjKvYfEL6b95SNZaWPP2F83xCOjbhQEksgT//E9HlcekbPntUisPJNXJsiMAQ1jjCq
 7zCpPfA0NrppecU22kngUbNqAjTfrW0FFV/FhuwsKktgYHR9Ha0lzXSN8W6UloJK25wEfDYWoZ
 BmveTCd3DOU5BP6PMYVjhuY75WdDhec6TTG6EdpW+sVYtWki9JucBsJ1ZCZiBSKEb4T8zXLl7J
 mwJtz3BCJgEqGlbpDpMDQMuvnTsZVwJS6e/ic6xVGgi2UongvoYM+L7v49tkxjHWgqd29Bx/kp
 aBg=
X-SBRS: 2.7
X-MesageID: 17908928
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,392,1583211600"; d="scan'208";a="17908928"
Date: Thu, 14 May 2020 18:25:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 4/6] x86/mem-paging: add minimal lock order
 enforcement to p2m_mem_paging_prep()
Message-ID: <20200514162545.GI54375@Air-de-Roger>
References: <b8437b1f-af58-70df-91d2-bd875912e57b@suse.com>
 <4af1f459-fe7a-cd61-43cb-fb3fa4f15c00@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <4af1f459-fe7a-cd61-43cb-fb3fa4f15c00@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

On Thu, Apr 23, 2020 at 10:38:44AM +0200, Jan Beulich wrote:
> While full checking is impossible (as the lock is being acquired/
> released down the call tree), perform at least a lock level check.

I'm slightly confused, doesn't alloc_domheap_page already have it's
own lock order checking?

Thanks, Roger.

