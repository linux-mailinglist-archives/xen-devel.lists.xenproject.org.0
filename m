Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 242BC1B2CFE
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 18:42:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQvyn-0001Qs-5c; Tue, 21 Apr 2020 16:42:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zbep=6F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jQvyl-0001Qm-SJ
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 16:42:35 +0000
X-Inumbo-ID: 1a32aac2-83ef-11ea-83d8-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a32aac2-83ef-11ea-83d8-bc764e2007e4;
 Tue, 21 Apr 2020 16:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587487355;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6WpbqOfaHNRMZy+BKWAm9DYG28/LEC8N2Z7Q30RqXhI=;
 b=ZzSZ4TS1cnFCUBzYZFR8WPwBe0JauuiIT9DWy4HUOJMLvI2X/9bhLbIq
 s8xlwOXFJ3Vwel+bSYKCZCfXIsoXdfGwUgHCcUGCFTMydIO74DlFyAhxs
 u4ROaYBWiNEjyMNaeZu5FbD9wzWcYmcfGj1YIOIrgN0XKOjqfT5KPU0Gb 8=;
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
IronPort-SDR: cja57WEcbFOEYparK8ju57BtnXLfIikixueAnbn7MDigsNkxM3L9XF6XluqH2rAiLUDrVRY6hh
 U7pupfDbdlzr/fPal/4yi6DkFMSR48uNazqy3nibOFE0bEtNMEcYdXId5ivWT5YgFGdjLCAgBl
 JNn6Fm6BiN4tbYc2oGi4Mn+wzIFhwVyXcwIN13W62mA0xBpVMkAnc2Utg9i5q+k3X2MBgm/9En
 IqX4kbCZP5JzOAHnRvfQNel92thTHJjOdPxMGH9OwU+K4VDKO96XR5nw43jd36ByTwhzZt/k40
 snY=
X-SBRS: 2.7
X-MesageID: 16416379
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,410,1580792400"; d="scan'208";a="16416379"
Date: Tue, 21 Apr 2020 18:42:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH OSSTEST v3 2/2] make-flight: add a core scheduling job
Message-ID: <20200421164227.GX28601@Air-de-Roger>
References: <20200415141009.10912-1-roger.pau@citrix.com>
 <20200415141009.10912-2-roger.pau@citrix.com>
 <24223.8666.764943.818163@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <24223.8666.764943.818163@mariner.uk.xensource.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 21, 2020 at 05:39:54PM +0100, Ian Jackson wrote:
> Roger Pau Monne writes ("[PATCH OSSTEST v3 2/2] make-flight: add a core scheduling job"):
> > Run a simple core scheduling tests on a host that has SMT support.
> > This is only enabled for Xen >= 4.13.
> 
> Thanks, pushed to pretest.
> 
> Once it makes it through staging the test will appear, but it will
> start failing (nonblockingly) until the SMT hostflag has been scanned.
> It would be sensible for me to run a special examine job for that.

Yes, I think so. Will try to keep an eye and ping you when it passes
osstest self push gate.

Thanks, Roger.

