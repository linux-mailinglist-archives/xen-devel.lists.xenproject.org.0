Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE837DE75E
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 11:05:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMTaG-0005dC-HA; Mon, 21 Oct 2019 09:02:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=miS7=YO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iMTaF-0005d7-KW
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 09:02:35 +0000
X-Inumbo-ID: 850b51e4-f3e1-11e9-9445-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 850b51e4-f3e1-11e9-9445-12813bfff9fa;
 Mon, 21 Oct 2019 09:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571648554;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LV+fQUkwdZjScOnGDP0TiZKOBFDapV2GJB9gPrP8tlQ=;
 b=f9qXuhdsCn9b82CtRvQN05Q8k7jsGFcTyBqDh7rMIGjXQ+7TbgZ8gyPH
 mYKRRUbl42qp2OEH2kODwgKkKPnnLqQ/tOi4Wl2w9syznN14hPdz4WtaO
 tmhdw7g8kPNstcWA6jRMCWQAqU2DCMmEsqticH1hell5zMXO5ABv3j+1r s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vfhIZCvjM+GxAyfpoJeFoo1n8/ZWLRFiXfYiyKiP25S72+3dnun/mmvazEwsnZ7KqEgsum8Zk+
 vYteMDE9mJhvYomfZKdQFVT9irUldZIQTKqBYf0CYrUR0YS4v+Qr5pAgg3vyG/Z9yfdJ6KxIuH
 sV7/0fpvCcACA29iKpFVOjucrjDOHOIZpJqAk778cCObsjQtaPer1c9/wTa21Kd7KhsH6Wg0hZ
 PZt8OzywKLFIEVirHdvuuGEzhSXzXECnAr1A7U58p79Sxzsmt9TY/Y2YzsPUmCC3nuRp48KNkT
 1/c=
X-SBRS: 2.7
X-MesageID: 7188524
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,323,1566878400"; 
   d="scan'208";a="7188524"
Date: Mon, 21 Oct 2019 11:02:21 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20191021090221.GD17494@Air-de-Roger>
References: <20190930150044.5734-1-liuwe@microsoft.com>
 <20190930150044.5734-5-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190930150044.5734-5-liuwe@microsoft.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-next v2 4/9] x86: include xen/lib.h in
 guest/hypercall.h
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <liuwe@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>, Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMDQ6MDA6MzhQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBXZSBuZWVkIEFTU0VSVF9VTlJFQUNIQUJMRS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1
IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgoKVGhhbmtzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
