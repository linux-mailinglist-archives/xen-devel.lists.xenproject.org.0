Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 289101C41C5
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 19:14:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVefM-0008Ko-Mk; Mon, 04 May 2020 17:14:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SbWK=6S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jVefK-0008Kf-Qs
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 17:14:02 +0000
X-Inumbo-ID: a6295cf2-8e2a-11ea-9d3b-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a6295cf2-8e2a-11ea-9d3b-12813bfff9fa;
 Mon, 04 May 2020 17:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588612442;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=OV6ifNQEXMIkyPbKgUmWZMnlZzWBPXmkTxRNaaDloXk=;
 b=HmDo6rgfw4IfxtTviCrRyXSOdMANFl5JLDm8quQ9nyIE0ExbjEINtNy6
 ezb0x7V5LtyndZdIyt2tezDPVqOC6FvYGf/lzcFF19g0gnf09xjmgStUX
 HONBNp9AC3AyblTu+ekW7+PDCgySJ4m0VYhbqVqoIlqh7ZhxgbTZT6be4 Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: v0G2zd5TKyLcWH1g0v+nILvRLvQL/7RnwG0rclLXfv1V3u8okbmg/fBhzyZXJJ6+lySdUx3R+C
 kNZYEF1PEMPPDIpZlnX+I2vDBGZ2NGg/HVpfuZQkvBzEiw1Wg6GLrH1NzVnvFK1blrP7n+gLDJ
 CgTjvd4ZhfxJdum4i24c0WkeHaGbgDj1Q2nFcKgbSJx7shoJlfCeKSmKXRhPEx++uYa3TwAk6+
 49aniIw9xkUwphjFR0UFXgHtTq3FkXy8Rwh/cb5gRsgtfRHdU4+np4rGGKl/qgxNutQ95cCNCO
 sr4=
X-SBRS: 2.7
X-MesageID: 16958198
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,352,1583211600"; d="scan'208";a="16958198"
Subject: Re: [PATCH] x86/hvm: simplify hvm_physdev_op allowance control
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20200504163103.7798-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6a06c35c-c7b6-a37b-32ab-07b462ad9c03@citrix.com>
Date: Mon, 4 May 2020 18:13:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504163103.7798-1-roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
Cc: Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04/05/2020 17:31, Roger Pau Monne wrote:
> PVHv1 dom0 was given access to all PHYSDEVOP hypercalls, and such
> restriction was not removed when PVHv1 code was removed. As a result
> the switch in hvm_physdev_op was more complicated than required, and
> relied on PVHv2 dom0 not having PIRQ support in order to prevent
> access to some PV specific PHYSDEVOPs.
>
> Fix this by moving the default case to the bottom of the switch, since
> there's no need for any fall through now. Also remove the hardware
> domain check, as all the not explicitly listed PHYSDEVOPs are
> forbidden for HVM domains.
>
> Finally tighten the condition to allow usage of
> PHYSDEVOP_pci_mmcfg_reserved: apart from having vPCI enabled it should
> only be used by the hardware domain. Note that the code in
> do_physdev_op is already restricting the call to privileged domains
> only, but it can be further restricted to the hardware domain only, as
> other privileged domains don't have access to MMCFG regions anyway.
>
> Overall no functional change should arise from this change.
>
> Reported-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

