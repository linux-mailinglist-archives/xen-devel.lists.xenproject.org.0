Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC8B16A8C3
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 15:47:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6Exr-0001TQ-DB; Mon, 24 Feb 2020 14:44:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04fq=4M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6Exq-0001TL-Dc
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 14:44:06 +0000
X-Inumbo-ID: 1ae63036-5714-11ea-9207-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ae63036-5714-11ea-9207-12813bfff9fa;
 Mon, 24 Feb 2020 14:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582555446;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SCtUKsraI1pmxtdCLnrI15/hPMmw7Udo7c0HnF5+UDY=;
 b=Ucftuv0VRFyLCjJHdzfVlGqBhDuVrBSNPxPnYl02ONKfOPpOYjrzuRgi
 9mDJ5BR/osLE8gLgnO5xFkpLCH41zT/SPs+y5UZseI5PrlM7iU1foHG3W
 4EZbDzLA0g//0zdu4QONAc0//7VSYQqyAgbt2jeXc1ODBodSWuC2PfgaI Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LbKkooiHgsinLnG5IiW6HXpXAiwT4z5sEHMNspxI3iHTdDYWmMGbdjGhqcEyIwRHz7uQxdeZkm
 7Zq61HTfQf/MQvb12M+/RC/fyGFqSQ3wekInF5OCDSZloYJhYxZ8y3+TcUWLKpkg+gLjU9gers
 wwHDxJpoWeA9/cxuNJGDOCz7un1Lg2HTt/FjUR15b+XEGz2b/cExNpC4tdUAqfAeSWRQavtK0b
 AnyctC2kHGBSvJwqLWmNDLIFgGaMFnkQ7MnDJypn0ke9SW6CGQKRqNMMJAzMraaUiMnXJC8mse
 fas=
X-SBRS: 2.7
X-MesageID: 13088179
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,480,1574139600"; d="scan'208";a="13088179"
Date: Mon, 24 Feb 2020 15:43:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200224144357.GQ4679@Air-de-Roger>
References: <20200224142219.30690-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224142219.30690-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] xen/xmalloc Unify type handling in macros
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMDI6MjI6MTlQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgbWFjcm9zIGluIHhtYWxsb2MuaCBhcmUgYSBtaXggb2YgdXNpbmcgdGhlaXIg
dHlwZSBwYXJhbWV0ZXIgZGlyZWN0bHksIGFuZAo+IHVzaW5nIHR5cGVvZigpLgoKVGhlIG9ubHkg
b25lcyBJIGNvdWxkIHNwb3QgaW4gdGhlIG5laWdoYm9yaG9vZCBhcmUKeHJlYWxsb2NfZmxleF9z
dHJ1Y3QgYW5kIHhtZW1kdXAsIHdoaWNoIGRvbid0IGhhdmUgYSB0eXBlIHBhcmFtZXRlcgpidXQg
cmF0aGVyIGEgcG9pbnRlciBwYXJhbWV0ZXIsIGFuZCBoZW5jZSB1c2UgdHlwZW9mIGFnYWluc3Qg
dGhlCnBhc3NlZCBwb2ludGVyLgoKPiBTd2l0Y2ggdW5pZm9ybWx5IHRvIHRoZSBsYXR0ZXIgc28g
ZXhwcmVzc2lvbnMgY2FuIGJlIHVzZWQsCj4gcmF0aGVyIHRoYW4gb25seSB0eXBlIG5hbWVzLgoK
SSdtIGZpbmUgd2l0aCB0aGlzLCBidXQgSSBkb24ndCB0aGluayB0aGV5IGFyZSBhIG1peCwgbWFj
cm9zCnVzaW5nIGEgdHlwZSBwYXJhbWV0ZXIgY2xlYXJseSBleHBlY3QgYSB0eXBlLCB3aGlsZSBt
YWNyb3MgdXNpbmcgcHRyCmV4cGVjdCBhIHBvaW50ZXIsIGFuZCBoZW5jZSB1c2UgdHlwZW9mIHRv
IGdldCB0aGUgdHlwZS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
