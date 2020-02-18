Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B908516295F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 16:25:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j44he-0006WJ-K1; Tue, 18 Feb 2020 15:22:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=171L=4G=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j44hd-0006WE-W4
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 15:22:26 +0000
X-Inumbo-ID: 76a2df71-5262-11ea-81ae-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76a2df71-5262-11ea-81ae-12813bfff9fa;
 Tue, 18 Feb 2020 15:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582039345;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=JHnrY3HlEYPE0HQXhYy/rwFYZ6FzkiJvlbrrTVtvUfU=;
 b=DD0mz76T6wv9V4BCsFQOgZBM67LDJf6D40Vrlcx91FdyRmmqFjm+F4Yx
 c5eBE397PERcSxszQfrpy5XAf+WITae3ul53/cVOzsWaLmuJFzUSzPWQ9
 Op5WwQknLM5SqMsYsJmm8pS0ycxhiEyJqVCiBUEo5QpV+PFGBNNYRLOQ1 M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wjMgD1KJWjM82LOXp7oWFXX7T51PGxkBfaWWIaJfKnx+VtfqP7HOXUxBee0KSMezEhUc+49khz
 OnQIhpOZlggwfJ1ET+qt0jyWxbC/sV3PCZczBDwmGhZ4L0pZaUkJSvOf75UIP8qYI8UfcS6mOS
 85fttzk0w6RXrmm1ZrlRrViOoaIwNTHs+SROD4ZULqHw98e95ezv0Zj6OOWbg/ulvs+i5+Z5x6
 eS068IxM4gFpuCsSZrxSiVeQEYCH5G9IlzFeU4t2hl/Xw8Dug2OJLiXhTdbob13bFqzikKyxsg
 3UU=
X-SBRS: 2.7
X-MesageID: 12631363
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,456,1574139600"; d="scan'208";a="12631363"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24140.292.319788.96740@mariner.uk.xensource.com>
Date: Tue, 18 Feb 2020 15:22:12 +0000
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <a92287c03fed310e08ba40063e370038569b94ac.camel@infradead.org>
References: <a92287c03fed310e08ba40063e370038569b94ac.camel@infradead.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [RFC PATCH v3 0/22] Live update: boot memory
 management, data stream handling, record format
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Varad Gautam <vrd@amazon.de>,
 paul@xen.org, Hongyan Xia <hongyxia@amazon.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Amit Shah <aams@amazon.de>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGF2aWQgV29vZGhvdXNlIHdyaXRlcyAoIltSRkMgUEFUQ0ggdjMgMC8yMl0gTGl2ZSB1cGRhdGU6
IGJvb3QgbWVtb3J5IG1hbmFnZW1lbnQsIGRhdGEgc3RyZWFtIGhhbmRsaW5nLCByZWNvcmQgZm9y
bWF0Iik6Cj4gTm93IHdpdGggYWRkZWQgZG9jdW1lbnRhdGlvbjoKPiBodHRwOi8vZGF2aWQud29v
ZGhvdS5zZS9saXZlLXVwZGF0ZS1oYW5kb3Zlci5wZGYKCkkgaGFkIGEgbG9vayBhdCB0aGlzLiAg
SSBkaWRuJ3QgcmVhZCB0aGUgcGF0Y2hlcyBpbiBkZXRhaWwsIGJ1dCBJIGRpZApyZWFkIGFsbCBv
ZgogICBbUkZDIFBBVENIIHYzIDA1LzIyXSBBZGQgS0VYRUNfVFlQRV9MSVZFX1VQREFURQpJdCBz
ZWVtcyBwbGF1c2libGUgdG8gbWUuICBUaGlzIHNlZW1zIGEgbmV3IGFuZCBpbnRlcmVzdGluZyB3
YXkgb2YKdXBkYXRpbmcgWGVuIHVuZGVybmVhdGggcnVubmluZyBndWVzdHMuCgpCVVQgSSBhbSBu
b3QgYW4gZXhwZXJ0IG9uIHRoZSBtaWdyYXRpb24gY29kZS4gIEkgaG9wZSBBbmRyZXcgQ29vcGVy
CndpbGwgYmUgYWJsZSB0byBjb21tZW50Li4uCgpSZWdhcmRzLApJYW4uCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
