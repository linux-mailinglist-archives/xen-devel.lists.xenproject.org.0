Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDFC139305
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 15:03:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir0Ha-0000Q0-7L; Mon, 13 Jan 2020 14:01:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aHII=3C=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ir0HY-0000Pi-8t
 for xen-devel@lists.xen.org; Mon, 13 Jan 2020 14:01:28 +0000
X-Inumbo-ID: 304d7e7b-360d-11ea-826e-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 304d7e7b-360d-11ea-826e-12813bfff9fa;
 Mon, 13 Jan 2020 14:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578924088;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=rNBk2n8/dJpnNsnXulITpj4HUGG63kV8+t5KmgGyV6c=;
 b=Alc1mWmbT2bfY/10fFcY25Omn62P2WyOOw3/94OQqzv0FNJRdu8Y6c9l
 iD+lCfd83SEJW5vjS4carVeqxSHPoN9dZu339j2J3DfesyLcjxgkHDTe3
 fFJXxipYngOl2lAPv3QFo1AmIVaYZ63TXqQUAYHK+Y6yBC6y01PIppqiS U=;
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
IronPort-SDR: RdiYVvqoTt3lp6iAsbLcZ9gTYY7LMrBoEQGpYt9fvMCWhcpywLo+zdWD+k0utI9vIgN1YPeuO2
 N77vXdJltPPAZRv8csGUWN9iy5c6g8aX2Zn26wyOIeuPOnLFKHMdsbN7gC6pbo82+bGoSBsqv7
 w9Gh6EhmkuD/wYq4lD/XiA2G+3sngFXVquEGRiwrUrccsenPysE3uOL/8Hivkdsb12kHxRp9AT
 yiSMZJUNVc1hlR4pPdLVe756ixgjsU5Iokc2BrGnRaDyGYt77q1CnFRvdY8wVCbIIe5xRVBu1v
 M6I=
X-SBRS: 2.7
X-MesageID: 10996991
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,429,1571716800"; d="scan'208";a="10996991"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24092.30771.810775.973167@mariner.uk.xensource.com>
Date: Mon, 13 Jan 2020 14:01:23 +0000
To: Doug Goldstein <cardoe@cardoe.com>
In-Reply-To: <68263b88-40b7-89d3-c962-6991c708dd89@cardoe.com>
References: <20200110103723.29538-1-sergey.dyasli@citrix.com>
 <c698d473-d8f2-7d53-b5f3-0cfefcc617f1@cardoe.com>
 <865DBCFC-92C9-41D2-A502-914A5999979F@citrix.com>
 <68263b88-40b7-89d3-c962-6991c708dd89@cardoe.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Xen-devel <xen-devel@lists.xen.org>,
 Jan Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RG91ZyBHb2xkc3RlaW4gd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2Ml0geHNtOiBo
aWRlIGRldGFpbGVkIFhlbiB2ZXJzaW9uIGZyb20gdW5wcml2aWxlZ2VkIGd1ZXN0cyIpOgo+IEkn
ZCBiZSBoYXBweSBpZiB3ZSBoYWQgYSBLY29uZmlnIG9wdGlvbiBiZWhpbmQgd2hhdCB0aGUgc3Ry
aW5nIGlzLiBHaXZlIAo+IG1lIGEgYmxhbmsgYXMgYW4gb3B0aW9uIGJ1dCBkZWZhdWx0IGl0IHRv
IHdoYXRldmVyIHN0cmluZyBsaWtlIAo+ICI8aGlkZGVuPiIgdGhhdCB5b3UnZCBsaWtlLiBFdmVy
eSBzaGlwcGluZyBYZW4gZGlzdHJvIEkndmUgd29ya2VkIG9uIGhhcyAKPiBoYWQgaXRzIG93biB2
MSB2YXJpYW50IG9mIHRoZSBwYXRjaCBhbmQgbm9uZSBvZiB0aGVtIGF1dGhvcmVkIGJ5IG1lLgoK
Rmlyc3RseTogSSBnZW5lcmFsbHkgYWdyZWUgd2l0aCBHZW9yZ2UncyBjb21tZW50cyBhYm91dCBu
b3QgbGlraW5nCnNpbGVudCBmYWlsdXJlLCBhbmQgSSBkaXNhZ3JlZSB3aXRoIEFuZHJldy4gIE15
IGluY2xpbmF0aW9uIHdvdWxkIGJlCnRvIGhhdmUgdGhpcyBzdHJpbmcgYmUgIjxoaWRkZW4+IiAo
b3Igc2ltaWxhcikgLSBhbmQgdG8gbm90IGZpbHRlciBpdAppbiB0aGUgRE1JIHRhYmxlcywgc28g
aXQgd291bGQgYmUgIjxoaWRkZW4+IiBldmVyeXdoZXJlLgoKRG91ZywgSSBjYW4ndCBmaWd1cmUg
b3V0IGZyb20geW91ciBtZXNzYWdlcyB3aGV0aGVyIHRoYXQgd291bGQgbWVldAp5b3VyIG5lZWRz
ID8gIElzIEdlb3JnZSByaWdodCB0aGF0IHRoZSByZWFzb24gZm9yIGZpbHRlcmluZyB3aGF0IHVz
ZWQKdG8gYmUgIjxkZW5pZWQ+IiBpcyBzaW1wbHkgdG8gcmVkdWNlIHN1cHBvcnQgYnVyZGVuIGR1
ZSB0byB0aGUKbmVnYXRpdmUgY29ubm90YXRpb25zIG9mICJkZW5pZWQiID8gIFdvdWxkICJoaWRk
ZW4iIGZpeCB0aGF0ID8KCklmIEkgYW0gd3JvbmcsIHdoYXQgaXMgdGhlIHJlYXNvbiBmb3IgdGhl
IGZpbHRlcmluZyA/CgpJZiB3ZSBoYXZlIHRvIGhhdmUgdGhpcyBzdHJpbmcgYmUgY29uZmlndXJh
YmxlIHRoZW4gc28gYmUgaXQgYnV0IEkKd291bGQgcmF0aGVyIHNlZSBpZiB3ZSBjYW4gZmluZCBv
bmUgdGhpbmcgdGhhdCBtZWV0cyBkb3duc3RyZWFtcycKbmVlZHMuCgpGVFIgSSBhZ3JlZSB3aXRo
IG1hbnkgb2YgdGhlIHBvaW50cyB5b3UgbWFrZSBhbmQgSSB1bmRlcnN0YW5kIHdoeSB5b3UKdGhp
bmsgdGhpcyBpcyBmcnVzdHJhdGluZy4gIEkgaG9wZSB3ZSBjYW4gY2xlYXIgdGhpcyB1cC4KCklh
bi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
