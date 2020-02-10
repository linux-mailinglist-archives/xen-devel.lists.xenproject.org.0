Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F181575D1
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 13:45:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j18OS-00036i-6k; Mon, 10 Feb 2020 12:42:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rnvo=36=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j18OQ-00036C-GO
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 12:42:26 +0000
X-Inumbo-ID: c9ceada2-4c02-11ea-b4b8-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9ceada2-4c02-11ea-b4b8-12813bfff9fa;
 Mon, 10 Feb 2020 12:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581338546;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AjylJs09jC+oXaYooUT7e7g35ZW0fk3halagEZ1dmzE=;
 b=c14XJOAd24dJLUA8A+QOlTDUoR9RSsHaeuWBQS+0wy7bATPvpH68YBh1
 FD9J7cKpi8gDH2fsq0bjGI0TYoK9WDp2XsizFhMCFEIcFJIiAHynSHioN
 SnDQnpSXKYnyuBl+jPXi2Hb1DnPDSpVM1l+sR9L2Hl9xyG8bWYbrt96zQ o=;
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
IronPort-SDR: Cqi6w4PA+vijoYowEhUDgmvgu+8d0B4cv4INokE1AfhdPPeiTxkuqjHkLpYOMiOMOyfRSeWetf
 jMzYQyYgo6INzGcTzFuxK+z96SVS4M2zQBTWxGsfvybbtWU8ilFeEXLgr+mN1LZ8YGrC9UFr73
 oXGHXGoEkmnCBn2vhIL/83Xbw7UC6AzHOqGx4uxHTqGYVm60Z4u+mllTikQqT8kFJeXprA/OH3
 l7M5KzOeoxGIRhfqK9Ey5HfTtckqHRbGeLajv3Z4biJnoSaZXlaBxL9J4DaRx8aDydd+8BaNcK
 Aig=
X-SBRS: 2.7
X-MesageID: 12373930
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,424,1574139600"; d="scan'208";a="12373930"
Date: Mon, 10 Feb 2020 13:42:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Message-ID: <20200210124217.GI4679@Air-de-Roger>
References: <20200210043516.1996-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210043516.1996-1-christopher.w.clark@gmail.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] tools/configure: generate stubs and
 long-double 32-bit headers if needed
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
Cc: xen-devel@lists.xenproject.org, Rich Persaud <persaur@gmail.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCBGZWIgMDksIDIwMjAgYXQgMDg6MzU6MTRQTSAtMDgwMCwgQ2hyaXN0b3BoZXIgQ2xh
cmsgd3JvdGU6Cj4gVGhlIGdudS9zdHVicy0zMi5oIGFuZCBiaXRzL2xvbmctZG91YmxlLTMyLmgg
aGVhZGVycyBhcmUgcmVxdWlyZWQgdG8KPiBidWlsZCBodm1sb2FkZXIgYnV0IGFyZSBub3QgYWx3
YXlzIGF2YWlsYWJsZSBpbiA2NC1iaXQgYnVpbGQKPiBlbnZpcm9ubWVudHMuIFRvIGF2b2lkIGlu
dHJvZHVjaW5nIGEgYnVpbGQgcmVxdWlyZW1lbnQgb24gMzItYml0Cj4gbXVsdGlsaWIgZ2VuZXJh
dGUgdmVyc2lvbnMgb2YgdGhlbSBmcm9tIHRoZSA2NC1iaXQgZXF1aXZhbGVudCBoZWFkZXIuCj4g
Cj4gVGhpcyBwYXRjaCBlbmFibGVzIHRoZSByZW1vdmFsIG9mIGRvd25zdHJlYW0gcGF0Y2hpbmcg
dGhhdCBoYXMgYmVlbgo+IGNhcnJpZWQgaW4gdGhlIFlvY3RvL09wZW5FbWJlZGRlZCBtZXRhLXZp
cnR1YWxpemF0aW9uIGxheWVyIHNpbmNlIDIwMTIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0
b3BoZXIgQ2xhcmsgPGNocmlzdG9waGVyLmNsYXJrNkBiYWVzeXN0ZW1zLmNvbT4KCkkgdGhpbmsg
dGhpcyB3b3VsZCBiZSBiZXR0ZXIgZG9uZSBpbiB0b29scy9pbmNsdWRlIGFzIHBhcnQgb2YKcG9w
dWxhdGluZyB0b29scy9pbmNsdWRlLgoKQWxzbyB0aGlzIGxvb2tzIHNwZWNpZmljIHRvIHVzaW5n
IGdjYyB0byBidWlsZCB0aGUgdG9vbHMsIHdoaWNoIGNvdWxkCmJlIHNraXBwZWQgd2hlbiBidWls
ZGluZyB3aXRoIGNsYW5nPwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
