Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA11213AE6D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 17:09:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irOhc-0001Sk-Hz; Tue, 14 Jan 2020 16:06:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QqHR=3D=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1irOha-0001Sc-Px
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 16:05:58 +0000
X-Inumbo-ID: bb674bf0-36e7-11ea-a985-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb674bf0-36e7-11ea-a985-bc764e2007e4;
 Tue, 14 Jan 2020 16:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579017950;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=ECf4ngJCJDNux9ImENZwWX9HHpNO0efA7/cvgVTi7ZM=;
 b=OrT7K4NigknhGg26ed9UCLocGkSOULtQQ23xtRTzO+fsJOqtY71CxijO
 9Z4lTs8fetXsBd2gSXo4KD48CkIJsuwCoF98pPTXDS2sQt3hcHjm/sHiU
 X78Jc1zY8ukR5VaIhp6uLU6atQjqSOgvtrdnrkW1cfXdA9uQTwww/JxYv o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: avKI/hj5TT6r3D0rrYpPx6IPZPjBXrdSQlEEx+Ldj0tXnBj7xCb2EN1WjMxuyv38lAbRaqiozZ
 DrTy5q8FVVU0O2nZ6+xmpoJLRvlgWFyx4Eda6UzfpIsVpFkvBLbMEPq5R4vB6PTH15UpIZxJy0
 WVulroZaLgYu/nZLvMib54WV6Nfh5P/o7TQmXUul05uLN55eJCwHX5iS7acoO69bjC0WhapNLP
 Lg/bbqHjDamydqtM4LPiMBQ/e4oojnRfT+yi1p7OogxUCeaPWCsd8yy7NMIgKZ7eNPtG1VsAdA
 DRM=
X-SBRS: 2.7
X-MesageID: 11327165
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,433,1571716800"; d="scan'208";a="11327165"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24093.59099.230772.270446@mariner.uk.xensource.com>
Date: Tue, 14 Jan 2020 16:05:47 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20191224151932.6304-6-andrew.cooper3@citrix.com>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
 <20191224151932.6304-6-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 05/12] tools/migration: Drop IHDR_VERSION
 constant from libxc and python
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggMDUvMTJdIHRvb2xzL21pZ3JhdGlvbjogRHJv
cCBJSERSX1ZFUlNJT04gY29uc3RhbnQgZnJvbSBsaWJ4YyBhbmQgcHl0aG9uIik6Cj4gTWlncmF0
aW9uIHYzIGlzIGluIHRoZSBwcm9jZXNzIG9mIGJlaW5nIGludHJvZHVjZWQsIG1lYW5pbmcgdGhh
dCB0aGUgY29kZSBoYXMKPiB0byBjb3BlIHdpdGggYm90aCB2ZXJzaW9ucy4gIFVzZSBhbiBleHBs
aWNpdCAyIGZvciBub3cuCj4gCj4gRm9yIHRoZSB2ZXJpZnktc3RyZWFtLXYyIGFuZCBjb252ZXJ0
LWxlZ2FjeS1zdHJlYW0gc2NyaXB0cywgdXBkYXRlIHRleHQgdG8gc2F5Cj4gInYyIChvciBsYXRl
cikiLiAgV2hhdCBtYXR0ZXJzIGlzIHRoZSBkaXN0aW5jdGlvbiB2cyBsZWdhY3kgc3RyZWFtcy4K
CkhvdyBhYm91dCBpbnRyb2R1Y2luZwogIGVudW0geyBJSERSX1ZFUlNJT05fMiA9IDIgfQpvciBz
b21lIHN1Y2ggPwoKSW4gQyBpdCBjYW4gYmUgaGFyZCBvdGhlcndpc2UgdG8gZmluZCBhbGwgdGhl
IHJlbGV2YW50IHRlc3RzLiAgQmVpbmcKYWJsZSB0byBncmVwIGZvciBJSERSX1ZFUlNJT04gd291
bGQgaGVscC4gIFNvIEkgd291bGQgcHJlZmVyIG1hbmlmZXN0CmNvbnN0YW50cyBvZiBzb21lIGtp
bmQgdG8gdW52YXJuaXNoZWQgaW50ZWdlcnMuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
