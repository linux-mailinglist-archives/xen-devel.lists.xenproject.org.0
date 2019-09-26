Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7087BF47B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 15:53:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDUBN-0003QX-NE; Thu, 26 Sep 2019 13:51:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1cs6=XV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iDUBM-0003Pn-2o
 for xen-devel@lists.xen.org; Thu, 26 Sep 2019 13:51:44 +0000
X-Inumbo-ID: c56baf62-e064-11e9-bf31-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id c56baf62-e064-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 13:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569505903;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qq200ZW65jrvkBaXVBXR8hF0oHZu6OYM1Ostodgyjuk=;
 b=Hdk8hE42r2gMzC37xzpbnTqWnW/slWAD8zUbmJl/06suXbzNtEBm98WV
 6kbnqjF/rWF33Aun7sYihselD9ozZmXCuZ2+DXNu1/lGU0vrwkjjbBYid
 740XuTeVDA1wniuVtQIFne5xxkGT7qL/Wy3yX+coDFmokU+HzVz8ZlADD g=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CDzYjnsVk3C9fYEA9H+OLgWE1wlJFWxPlyfY0LAc2wnnTSSziG07duAtn7y/F1KixbN0YtePvJ
 zGQm7tBfwYUvUWrXnUMPJsCNPxpNTWH9inFVYGw4JHAQg7F7ndEDc6n3LLdA0NfnjCl9sUlpil
 /AWX5X+jS5WppKkRo/frWHbP1Rm5uB6T870u50A1cON+tcSP4xkBl8fzSiLj/0qnjclwEarwCE
 sZd70FOXhIXfwbeB3XySnN/GjsXRdq8YcFm/OOjbtu8SSkR2w2hvYckiPkyuHGutikxKsXPZ+u
 nXg=
X-SBRS: 2.7
X-MesageID: 6185745
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,552,1559534400"; 
   d="scan'208";a="6185745"
Date: Thu, 26 Sep 2019 15:51:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Message-ID: <20190926135041.72cri2bam4ub3ojq@Air-de-Roger>
References: <20190926133618.24083-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190926133618.24083-1-sergey.dyasli@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/shim: fix ballooning down the guest
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan
 Beulich <jbeulich@suse.com>, xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMDI6MzY6MThQTSArMDEwMCwgU2VyZ2V5IER5YXNsaSB3
cm90ZToKPiBDdXJyZW50bHkgYmFsbG9vbmluZyBkb3duIGEgcHZzaGltIGd1ZXN0IGNhdXNlcyB0
aGUgZm9sbG93aW5nIGVycm9ycwo+IGluc2lkZSB0aGUgc2hpbToKPiAKPiAgICAgZDN2MCBmYWls
ZWQgdG8gcmVzZXJ2ZSA1MTIgZXh0ZW50cyBvZiBvcmRlciA1MTIgZm9yIG9mZmxpbmluZwo+IAo+
IEFuZCB0aGUgYmFsbG9vbmVkLW91dCBwYWdlcyBzdGF5IGluc2lkZSBzaGltIGFuZCBkb24ndCBy
ZWFjaCBMMCBYZW4uCj4gCj4gRml4IHRoaXMgYnkgcGFzc2luZyB0aGUgY29ycmVjdCBhcmd1bWVu
dHMgdG8gcHZfc2hpbV9vZmZsaW5lX21lbW9yeSgpCj4gZHVyaW5nIGEgWEVOTUVNX2RlY3JlYXNl
X3Jlc2VydmF0aW9uIHJlcXVlc3QuCj4gCgpUaGlzIGlzIG1pc3Npbmc6CgpGaXhlczogYjIyNDVh
Y2M2MGMzICgneGVuL3B2c2hpbTogbWVtb3J5IGhvdHBsdWcnKQoKPiBTaWduZWQtb2ZmLWJ5OiBT
ZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpBbHNvIGFkZGluZyBKdWVyZ2Vu
IGZvciBhIHJlbGVhc2UgQWNrLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
