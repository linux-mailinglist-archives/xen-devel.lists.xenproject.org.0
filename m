Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DFB1C8545
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 11:00:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWcOY-00061h-CS; Thu, 07 May 2020 09:00:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Plze=6V=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jWcOW-00061Z-Nv
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 09:00:40 +0000
X-Inumbo-ID: 394d30ea-9041-11ea-9887-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 394d30ea-9041-11ea-9887-bc764e2007e4;
 Thu, 07 May 2020 09:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588842040;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HwkpoQSjNc5m7+JivnVXv/WyxYqKh3dTmzrZR2JHESk=;
 b=BFlnYleMZ1K4TJC8lCqJTcCo0TZM3lXUZ5m5e8uqA3HI1j2stYLLHVCT
 ibygWr3j4f+y2mbU6JIkWwuWfSqISBDZ5x45/QCfn0WN//21mB9OIFLw+
 an61ghDRu1N09pZ/niWDvd6jtkxFtHByCSLvJvn0jLIpmfmMY3CS7jb/i 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
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
IronPort-SDR: Tz2zzIGUh7TEabyWXqnpXH4d5xOh82p4IKFWCYSnY7EzABhZQH0noXSkpxq2KrekLZ1FFFUcWN
 3idpEbpYXLqDgX9wjlEbzncLb/cC25nnTBa5pg18iGT+hzzL9O0NF3Q1kBE4fkcjpZbMAM06SC
 OLjQKmhLzCaI+1Oz8PxclGRCNNSE4tAoHSWJbv6q7h8JUZ/0jJxxQ9xJXLdpNsB4lFNKDJewIY
 +righeNx10AJzps1Uw3HLgzHHkvig/gLcnsxVuR/IXQF6r1VAoUqZ7OqRk2+EUk0vH6Zb9aEXK
 xh0=
X-SBRS: 2.7
X-MesageID: 17324804
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,363,1583211600"; d="scan'208";a="17324804"
Date: Thu, 7 May 2020 11:00:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Subject: Re: [PATCH] libxl: update libxlu_disk_l.[ch]
Message-ID: <20200507090030.GG1353@Air-de-Roger>
References: <20200506165018.32209-1-wl@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200506165018.32209-1-wl@xen.org>
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, May 06, 2020 at 05:50:18PM +0100, Wei Liu wrote:
> Use flex 2.6.4 that is shipped in Debian Buster.
> 
> Signed-off-by: Wei Liu <wl@xen.org>
> ---
> Do this because Roger posted a patch to fix clang build, which requires
> updating the same files. I don't want bury his changes in unrelated
> ones.

Hm, I'm not sure it's helpful, but all I can do is Ack this:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

