Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4546199535
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 13:17:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJErI-0006XF-NF; Tue, 31 Mar 2020 11:15:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eCcS=5Q=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jJErH-0006X4-Jh
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 11:15:03 +0000
X-Inumbo-ID: ddc13342-7340-11ea-9e09-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ddc13342-7340-11ea-9e09-bc764e2007e4;
 Tue, 31 Mar 2020 11:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585653304;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=AWmERnk5R4yyvbeS/QVXv+Dmg6Sje0n76Qyv3nE6TvQ=;
 b=WrvytGtx14mPGInFYwWcr7cs4M8GSNlhBkatREF7nt03dAeDhihC5r3B
 jJnAM0r7od3xy+eWNCn8dQ2KO6TmJXFDjudJE6o3HpodoLzU2AvHc3Na1
 QQWQZtgWJ+TUom9byl3ojaj0WslzIXOOSgvwTMFxhv9l14upJ9eqvQGIk U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Kd5lI1IBV9OsSz/FxFSkNiFxyO+DU0z7QO1mD4DuIEuFh5wpaE0wUyJYcTc6+KsWbR3V78Wbl3
 QTk2MqDP3p3wD915l9+mTRApTpb/Nua1cXXo5auhjq8YyddVPadShZHspr9bNdTFfmctlotnud
 fpoPcCCniZ0aMOuBOFVu0hCY8Pf2580GqdK/SjUaZZo5fK/mzttX5z1df2SFtYCUe/zrMv4ZzF
 6jbRuhltlD+DvgWAoP5iUY/FJ1Vy6jIQd4ii2NGHwlpMb2EzEemDoOKkTMesUWBm21P+dL7kxO
 g/Q=
X-SBRS: 2.7
X-MesageID: 14905822
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,327,1580792400"; d="scan'208";a="14905822"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24195.9778.777751.710868@mariner.uk.xensource.com>
Date: Tue, 31 Mar 2020 12:14:58 +0100
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 4/8] tools/libxc: misc: Mark const the parameter 'params'
 of xc_set_parameters()
In-Reply-To: <20200330192157.1335-5-julien@xen.org>
References: <20200330192157.1335-1-julien@xen.org>
 <20200330192157.1335-5-julien@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 "dfaggioli@suse.com" <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Julien Grall writes ("[PATCH 4/8] tools/libxc: misc: Mark const the parameter 'params' of xc_set_parameters()"):
> From: Julien Grall <jgrall@amazon.com>
> 
> The parameter 'params' of xc_set_parameters() should never be modified.
> So mark it as const.

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

