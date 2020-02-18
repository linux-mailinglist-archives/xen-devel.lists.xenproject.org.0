Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2C51624CF
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 11:44:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j40IS-0004tp-FE; Tue, 18 Feb 2020 10:40:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9Xbw=4G=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j40IR-0004tg-Ne
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 10:40:07 +0000
X-Inumbo-ID: 07158b84-523b-11ea-814b-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07158b84-523b-11ea-814b-12813bfff9fa;
 Tue, 18 Feb 2020 10:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582022406;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=LmxuARDso/oWBGCpbeGflHaghyplKRo2JjxIFIqrptY=;
 b=he9NqNtlcZerajv01UsBzjTZGSfY0oeAz+9kIbLpSVJMc/vHFthceKce
 1DzOzj1D9KCocpIKCoQQTjm5kZjn1UOnhby/Bqt8Y/xfTJ+WmieOkkQ1m
 G/1s/YXSJzZX7ucxSIef/WO0rVi5lFLNS/mnYHuo9DJT85t5Birk2MJxd U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JdSxOj/M7kVVoMOBSxdvuBuLvnsdUP6FY1uY3p7ZW0XVvspbhqgSB+NSEpowsmhic2DsFurDjq
 5w6F9hEw6SF+zp4/6v+9BlAq7y1taOW90B5hgv8B1DJv/J6Ct5BsasNR1c57vxuJUL2Y/2lt1Q
 HixBBQIYldcpFvzvmfdrYVXXOu6PPCL38lot/VxdyXb9ug7OxNTPKVPWxmdh4zZezzYLkOqyYN
 FTqsL/DWc8tEyX5ysQ9+6eiuop/T32jAqlO4jrts0054QZ+Ru36Gtv1C8viEVMb7PD+Q9D6iFY
 BWE=
X-SBRS: 2.7
X-MesageID: 13041699
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,456,1574139600"; d="scan'208";a="13041699"
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20200217184324.73762-1-roger.pau@citrix.com>
 <20200217184324.73762-5-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <49a2df52-27fc-c6f2-f28c-03e913fb0331@citrix.com>
Date: Tue, 18 Feb 2020 10:40:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217184324.73762-5-roger.pau@citrix.com>
Content-Language: en-US
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 4/6] x86: track when in #NMI context
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcvMDIvMjAyMCAxODo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEFkZCBoZWxwZXJz
IHRvIHRyYWNrIHdoZW4gcnVubmluZyBpbiAjTUMgY29udGV4dC4gVGhpcyBpcyBtb2RlbGVkCj4g
YWZ0ZXIgdGhlIGluX2lycSBoZWxwZXJzLCBidXQgZG9lcyBub3Qgc3VwcG9ydCByZWVudHJ5Lgo+
Cj4gTm90ZSB0aGF0IHRoZXJlIGFyZSBubyB1c2VycyBvZiBpbl9tYygpIGludHJvZHVjZWQgYnkg
dGhlIGNoYW5nZSwKPiBmdXJ0aGVyIHVzZXJzIHdpbGwgYmUgYWRkZWQgYnkgZm9sbG93dXAgY2hh
bmdlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgoKWW91IHByb2JhYmx5IG1lYW4gcy9tYy9ubWkvIHRocm91Z2hvdXQgdGhlIGNvbW1p
dCBtZXNzYWdlLCBidXQgSSdtCmFmcmFpZCB0aGVzZSBhcmUgcmF0aGVyIHByb2JsZW1hdGljLgoK
Tk1JcyBjYW4gYmUgcmVjdXJzaXZlbHkgZW50ZXJlZCwgZXNwZWNpYWxseSBvbiBjb3JuZXIgY2Fz
ZXMgaW4gdGhlIGNyYXNoCnBhdGguwqAgQXNzZXJ0aW5nIHRoYXQgdGhlIGNyYXNoIHBhdGggaXMg
bm90IHJlY3Vyc2l2ZSBjYW4gbGVhZCB0byBuZXZlcgplbnRlcmluZyB0aGUgY3Jhc2gga2VybmVs
LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
