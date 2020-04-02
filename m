Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8E019C536
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 16:59:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK1IY-0007zX-Bh; Thu, 02 Apr 2020 14:58:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8h32=5S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jK1IW-0007zN-GQ
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 14:58:24 +0000
X-Inumbo-ID: 660b528e-74f2-11ea-b4f4-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 660b528e-74f2-11ea-b4f4-bc764e2007e4;
 Thu, 02 Apr 2020 14:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585839503;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=bNsByaUJDBzaiwE/jquFDrTeBFFX1Nymgn11ncNpHJ8=;
 b=a/WAGPkrShevz4Kj/plF/SU2dpFL45QBFTiW6i1ZziLrEv2bd/tqAavs
 i6gSw+/U9wK+nblTrRLUjbCOY/gRS2uupMitwH1IERnKhDS3a+Sg1r2C6
 9YaMoNSN7XDValBY0kl6leXZs/4ttuxZCnXCNJhctA5iw45MsH2Eko6vr E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OKkuyVzuuGQDqwWV1Jp1QdWrZQF2yBnwamIE4C1KESb8GeavZ6qYD7fy1Ttz4hkG6F7kOOANzP
 SARQ3LzLYFEz7+DKtF4ND8L2YLnrycekX7vLC9qiFYv/Hf0qC0ZCZk4g+7vw53oGRGL+miwXRM
 Wpvi2pntPFZwIevHuqj5VVhHBCysQKzsD/5yk3vn8DYQCEe58PI99J2sQFTx9bn4EqAZcES2Kr
 uuc6ex71SvRqDI5/1lqTtiLebbohLcdtVVhAApOhgWTWHSmcPOT4v0aJgJss/J6gHyZIANkw/n
 F3E=
X-SBRS: 2.7
X-MesageID: 15733647
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,336,1580792400"; d="scan'208";a="15733647"
Subject: Re: [PATCH v2 0/2] x86/cpuidle: Cannon Lake adjustments
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <e39d4326-57d1-a4b5-3081-76b5160644ae@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <afe81b7e-4895-89ee-49dd-b6c0130923a1@citrix.com>
Date: Thu, 2 Apr 2020 15:58:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <e39d4326-57d1-a4b5-3081-76b5160644ae@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02/04/2020 09:22, Jan Beulich wrote:
> As requested in reply to v1, this is now a pair of patches with
> the expectation that only patch 1 would be acked and go in.
>
> 1: drop Cannon Lake support
> 2: support Cannon Lake (again)

Dropping Cannon Lake support is only of any incremental benefit if we
drop it from everywhere, and I didn't mean to block this single patch on it.

Consider either A-by.

However, it would be helpful to consider what we could do for better
KCONFIG-able CPU support.

Some downstreams have a separate build for each platform, and some go as
far as cramming Xen into the boot SPI ROM, so space saving is a very
important aspect.

On a different front, being able to compile out support for CPUs without
VMX unrestricted mode, or without CMPXCHG16B would be helpful.

I would certainly like to get CONFIG_{INTEL,AMD} usable even if only so
randconfig can help keep our interfaces clean.

~Andrew

