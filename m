Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9911818DE
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 13:57:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC0se-0000B9-HB; Wed, 11 Mar 2020 12:54:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ysf6=44=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jC0sc-0000B4-U8
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 12:54:34 +0000
X-Inumbo-ID: 73fbfed2-6397-11ea-af88-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 73fbfed2-6397-11ea-af88-12813bfff9fa;
 Wed, 11 Mar 2020 12:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583931274;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=DgQ5bs3+GLD4r1BZQlDIZMcQv6ZxeNxcqAqj0wi6Es4=;
 b=XNk/RIX25HcBkCbjdvBiWrQgRJuNtd9B5RsARTWTnorgtMXZm8mVg3NQ
 hzhI8km9E3fu4d0MQzoGvZdWltQXbhYugo4RE3yVR+1nH1iFKLG9fJfM1
 SQQlP6kXDYKF6C4sSRZhjgLUw3uBt8oYKSp5PkLgVabz0q6Fty8hfATXL o=;
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
IronPort-SDR: ocCvMr2r1Ioml8vC22z6eSvT05OslIM7O8c3IpjmE1i3IreKJ7Cpt1Iksbfd3xLa5CgkCnvUj4
 VtiMzuQfamq+WzrCk2NN7M6EFMKI4R+Ofvh8Ne7k3/IACD46sJmWI98ntyVQvdcyCH+8r6CAh9
 3RkHA6oZSt8h64gyCM0fM2lRgP3+FomPESMmGsNQkO6UfR6aMXiqkQVLMpZnISfwUpi2+vB7eH
 /Co/J89t9sueyAqL8ZDlRZJNdaH07EwXAQCh3HOJM9/NLxY0PNmiMamuCdTWesJFvOYdSgvfKD
 efc=
X-SBRS: 2.7
X-MesageID: 13770251
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,540,1574139600"; d="scan'208";a="13770251"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24168.57219.503305.994984@mariner.uk.xensource.com>
Date: Wed, 11 Mar 2020 12:54:27 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
In-Reply-To: <20200311105216.3284-1-roger.pau@citrix.com>
References: <20200311105216.3284-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH OSSTEST v3 1/2] examine: detect IOMMU
 availability and add it as a hostflag
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltQQVRDSCBPU1NURVNUIHYzIDEvMl0gZXhhbWluZTog
ZGV0ZWN0IElPTU1VIGF2YWlsYWJpbGl0eSBhbmQgYWRkIGl0IGFzIGEgaG9zdGZsYWciKToKPiBJ
bnRyb2R1Y2UgYSBuZXcgdGVzdCB0byBjaGVjayBmb3IgaW9tbXUgYXZhaWxhYmlsaXR5IGFuZCBh
ZGQgaXQgYXMgYQo+IGhvc3RmbGFnIGlmIGZvdW5kLgoKSSByZWdyZXQgdG8gaGF2ZSB0byBzYXkg
dGhhdCB5b3Ugc2VlbSB0byBoYXZlIG92ZXJsb29rZWQgbXkgZW1haWxlZApyZXZpZXcgY29tbWVu
dHMgb24gdjIuICBEaWQgeW91IHJlY2VpdmUgdGhlbSA/CiAgU3ViamVjdDogUmU6IFtQQVRDSCBP
U1NURVNUIHYyIDEvMl0gZXhhbWluZTogZGV0ZWN0IElPTU1VIGF2YWlsYWJpbGl0eSBhbmQgYWRk
IGl0IGFzIGEgaG9zdGZsYWcKICBEYXRlOiBUdWUsIDEwIE1hciAyMDIwIDE1OjUxOjM0ICswMDAw
CiAgTWVzc2FnZS1JRDogPDI0MTY3LjQ2OTgyLjM5MDgxOS40NzI0MDBAbWFyaW5lci51ay54ZW5z
b3VyY2UuY29tPgoKUGxlYXNlIGNvdWxkIHlvdSBmaW5kIHRoYXQgbWFpbCBhbmQgYWRkcmVzcyBt
eSBjb21tZW50cy4KCihBcyB5b3UgZG8gdGhhdCwgcGxlYXNlIG1ha2Ugc3VyZSB0aGF0IHlvdSBj
b21iaW5lIHNldF9mbGFnIGFuZApyZW1vdmVfZmxhZyBpbnRvIG9uZSBmdW5jdGlvbiB3aGljaCB0
YWtlcyBhIGJvb2xlYW4gcGFyYW1ldGVyLiAgSQphbHJlYWR5IGFza2VkIGZvciB0aGUgYm9vbGVh
biBwYXJhbWV0ZXIgaW4gdjIuKQoKKFRoZXJlIHdhcyBhbHNvIGEgcmVwbHkgdG8gdjIgMi8yLiAg
SSBoYXZlbid0IGxvb2tlZCBhdCB2MyAyLzIgdG8gc2VlCmlmIHlvdSBhZGRyZXNzZWQgdGhvc2Ug
Y29tbWVudHMuKQoKU29ycnksCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
