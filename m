Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B10190CE2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 12:57:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGi9V-0002MC-4n; Tue, 24 Mar 2020 11:55:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jf9l=5J=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jGi9U-0002M7-5O
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 11:55:24 +0000
X-Inumbo-ID: 57884fb0-6dc6-11ea-83da-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57884fb0-6dc6-11ea-83da-12813bfff9fa;
 Tue, 24 Mar 2020 11:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585050923;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=+qottVZwLfzowz0r1RRhaa0UwiEXV9Fr1MPK58mruJs=;
 b=YEqaW7Ojrs3dOWMo2xPH8dngl1OIJxsGgVx9FQnNJ3IX4fpaNiNTKt1F
 HBRtypd5qxuIg0JNoGGKbB0qKpq/b1tQzcTGN+sSbj15cqHagwtWGyrVs
 GPAfPH2IPE0aN+i7ESf4DPq9TAsebwtcA4Yl/hQmcBDFyFHaREGQRsvam 0=;
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
IronPort-SDR: R0DqKjq3AEys5FPeeZFKpTpp8xp4wqyBMwMZuec5uUfP7A/GLY3RXAbwM2+Zjqc9wzkh3mWvJm
 q50DGtFFPDZfnZ1XVBiiHwexTfgXnxxckTc0NZzThRSfGNOSMUB6rg+5bC25vUrgG8WJl1R6Z7
 cxWMLZkLIREA/wsVSw2XXMWgtSzo8iPkwP1egEtVAcPikCeOHgcrTbU4QGPyvts4aeOlfnZG3B
 si7Vg1JQVva/bxxFzxInkkJBzSXLN8nddXwE9G4xzZK1XWIeRRHDKPTyCwcO6zMoKMwFPjibcY
 jdY=
X-SBRS: 2.7
X-MesageID: 14740865
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,300,1580792400"; d="scan'208";a="14740865"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24185.62757.192771.632832@mariner.uk.xensource.com>
Date: Tue, 24 Mar 2020 11:55:17 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
In-Reply-To: <20200323143835.46117-1-roger.pau@citrix.com>
References: <20200323143835.46117-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH OSSTEST] kernel-build: enable
 XEN_BALLOON_MEMORY_HOTPLUG
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian
 Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Roger Pau Monne writes ("[PATCH OSSTEST] kernel-build: enable XEN_BALLOON_MEMORY_HOTPLUG"):
> This allows a PVH/HVM domain to use unpopulated memory ranges to map
> foreign memory or grants, and is required for a PVH dom0 to function
> properly.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

I will push this to pretest immediately.

Thanks,
Ian.

