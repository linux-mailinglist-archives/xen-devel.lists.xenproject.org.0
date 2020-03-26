Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C90819453C
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 18:17:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHW52-0000Vy-Dr; Thu, 26 Mar 2020 17:14:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C/RX=5L=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jHW50-0000Vt-SQ
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 17:14:06 +0000
X-Inumbo-ID: 32158138-6f85-11ea-8823-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 32158138-6f85-11ea-8823-12813bfff9fa;
 Thu, 26 Mar 2020 17:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585242846;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=cmRchjwNto76J2Gl/1QYJEwtQJh32wTy2r7u8WH1uLE=;
 b=WWzRYHsdcEF+vAXj5MTKsKe/FZuaaK1rCHBLwz5adp/29wbOaAtW6Lia
 5v4o1Xn0HgNsJKB5DdCR/l8OlEC4nROC+Kc9Nl1iTfaJsTyfALakygQ/Y
 QU+Kcdyid7EGOX+HNWyeENHn9DtDVPa0KaA+hz0y5rT+vh/BcnQ4iD1tE w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1Q0rUJbKc0Aoxy3/YvCB1Nq30ZyL1lCn/Ogum4ql1ohORUmPJS6t66tqmdmxlTyTrJVED56ncv
 RSa6FYsjxrBAKDGf5gCSVx+EoVnF8/TtxuMKMhyK7SO91z2Po8g+iNKPGnxf2veWb0T2UyvJKZ
 GIcUZWyTT95kmTDt6XAtj8ggVxEi81jxfQvZ54sKLinF+r5rrSj+lajTHFUcld+u8cmPogmVh/
 O3zUBvCWanxWmgMwVaRFncFFFhm/1/ZxXNvv3ogA0YFdoH+26CZ+fw7aOiqRGv5MVcY6/LKSUQ
 afE=
X-SBRS: 2.7
X-MesageID: 14913055
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,309,1580792400"; d="scan'208";a="14913055"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24188.58071.444694.257081@mariner.uk.xensource.com>
Date: Thu, 26 Mar 2020 17:13:59 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
In-Reply-To: <20200324151628.GM24458@Air-de-Roger.citrite.net>
References: <20200324150015.50496-1-roger.pau@citrix.com>
 <20200324150015.50496-2-roger.pau@citrix.com>
 <f4ce1d95-c80a-8727-7ddc-9199bb2036c4@suse.com>
 <20200324151628.GM24458@Air-de-Roger.citrite.net>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 2/2] xen: enable BALLOON_MEMORY_HOTPLUG by
 default
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Roger Pau Monne writes ("Re: [PATCH 2/2] xen: enable BALLOON_MEMORY_HOTPLUG by default"):
> I would rather have it always on if possible, as gntdev or privcmd
> (when used to map foreign pages from user-space) will also require it,
> and they are not gated on XEN_BACKEND AFAICT.

Currently there seem to be problems with this:

http://logs.test-lab.xenproject.org/osstest/logs/149014/test-amd64-amd64-dom0pvh-xl-intel/info.html

For now I have rolled back the change in osstest to enable this option
explicitly.

Ian.

