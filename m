Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDE9B11E5
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 17:14:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8Qkh-0000Bl-9J; Thu, 12 Sep 2019 15:11:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k1F3=XH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i8Qkf-0000Bg-Ax
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 15:11:17 +0000
X-Inumbo-ID: 90891173-d56f-11e9-959c-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 90891173-d56f-11e9-959c-12813bfff9fa;
 Thu, 12 Sep 2019 15:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568301075;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xbyL3XLhWgzqODsiazfd0w8dW6+DcAUOnpTKv8N7mOg=;
 b=DphpL/Gh36rbEXWyDYKVQUYUlNoFaJz2ypwbxPS5L206K0Xlb8GdB/J6
 aKdpwM7sB9E8YULkqZs6mfYMGN/YB28I92Iv91vEfYP4GafM4Qd5KrRfi
 XPcQdHb+G8kHu6KyIg3/UNtWWj2ghieIFv5b0rNsFgX2A0cU2MtrAXyMc Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Y48loven7CUlExCRz++RY1XYppYRKOHhNbQVyFZl1zmu4MYqEanOwMpqdfNa/m8PaB3JwRIIml
 a2jNaKWI86QVLfG6Roso4uuaE59erJlypVt1WBLHOZUtBcJ+jiQPz5MGJ7xWLCFze0sLAJnWcX
 jVh+VyjVflnpR2tkKZ3e3hgUgqWQ7OuGFAigKTot3Fc8FiRdRy1p1kgPbwnRz2LWgLRvI3n2uQ
 1E1059c+GskkWP4XL6B8X8/KyD1+Rk1tatedVjrJonobeBtqpCRwuW7SqfEBJ7hNcAFpWHGPF7
 KYA=
X-SBRS: 2.7
X-MesageID: 5687199
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,497,1559534400"; 
   d="scan'208";a="5687199"
Date: Thu, 12 Sep 2019 17:11:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190912151108.gyjiawr46fhkllyn@Air-de-Roger>
References: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
 <acba3aac-bcf3-ce8f-1b0f-bd5017007553@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <acba3aac-bcf3-ce8f-1b0f-bd5017007553@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 8/9] x86/CPUID: drop INVPCID dependency on
 PCID
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMTEsIDIwMTkgYXQgMDU6MjY6MTJQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gUENJRCB2YWxpZGx5IGRlcGVuZHMgb24gTE0sIGFzIGl0IGNhbiBiZSBlbmFibGVkIGlu
IExvbmcgTW9kZSBvbmx5Lgo+IElOVlBDSUQsIG90b2gsIGNhbiBiZSB1c2VkIG5vdCBvbmx5IHdp
dGhvdXQgUENJRCBlbmFibGVkLCBidXQgYWxzbwo+IG91dHNpZGUgb2YgTG9uZyBNb2RlIGFsdG9n
ZXRoZXIuIEluIGJvdGggY2FzZXMgaXRzIGZ1bmN0aW9uYWxpdHkgaXMKPiBzaW1wbHkgcmVzdHJp
Y3RlZCB0byBQQ0lEIDAsIHdoaWNoIGlzIHNvcnQgb2YgZXhwZWN0ZWQgYXMgbm8gb3RoZXIgUENJ
RAo+IGNhbiBiZSBhY3RpdmF0ZWQgdGhlcmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
