Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CED0DC1EB6
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:10:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEsab-0003rp-Li; Mon, 30 Sep 2019 10:07:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jhqc=XZ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iEsaa-0003rk-6U
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:07:32 +0000
X-Inumbo-ID: 1d48f89a-e36a-11e9-b588-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id 1d48f89a-e36a-11e9-b588-bc764e2007e4;
 Mon, 30 Sep 2019 10:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569838051;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=Gq3hsMtkxvjLSAqCRB63Lv50QRoyd/ABr4REW7rNFvk=;
 b=VStg19PGYiEkzBAK+8UzxDsZeBPBDkK3Sv+beeXlS2i3AMk9GOqDVvtL
 VZUnRmFDXXpota8qkFZBtmSRgo5cQJxnLn3m83ozzj70MClzpUkK1TPVG
 Blslrw6nOAjfQFiNPg8ueHoQ5VK8HzjDi91VXyr4SZuL80z5lzVWTtvQU I=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: b8IAR73eR7RCPO/d9MuvCk3pYB/CNzaklxRqljXgPDP5Jpuafn8yyqjF5EBlsfowmhU+nqD2+R
 CWbbMx0JMBOxiE+gCxQT0CjdwKnoAC15Z6VnUpn0NyZEVSMns39VszAwAOUhVTTcBKg0Uh3Tya
 lNgdSzsCOH040YqTfL3KVI2T9ITZRHzo3dkhWNpW/lH6FDkwWQscO/8NYRa/1NTtZwLE15B35Y
 xP8LjYQxz/sSJ1d1WrwS+b6pSlgYHi3rQbyoASnacux5FBUd/ET9eS4pyFpJ7K6GFDiNa2ieiC
 KPs=
X-SBRS: 2.7
X-MesageID: 6247588
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,565,1559534400"; 
   d="scan'208";a="6247588"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23953.54239.532571.783220@mariner.uk.xensource.com>
Date: Mon, 30 Sep 2019 11:07:27 +0100
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
In-Reply-To: <e47e43c1-0a13-0ec3-7ac8-46c61b7c9f06@suse.com>
References: <20190927090048.28872-1-jgross@suse.com>
 <20190927090048.28872-2-jgross@suse.com>
 <23949.58956.637645.181431@mariner.uk.xensource.com>
 <05b68d90-0fb9-6415-61f3-56881ca428c0@suse.com>
 <23950.4274.238406.524438@mariner.uk.xensource.com>
 <1d8dda0e-0fbe-04b4-0b11-41844089cf90@suse.com>
 <23950.10341.746130.616131@mariner.uk.xensource.com>
 <2fc42744-addb-d19e-1ddc-a507fd4ed254@suse.com>
 <f9d931a4-64b3-6aca-961a-f9fbf8fa030e@suse.com>
 <e47e43c1-0a13-0ec3-7ac8-46c61b7c9f06@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v1 1/6] docs: add feature document for Xen
 hypervisor sysfs-like support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SsO8cmdlbiBHcm/DnyB3cml0ZXMgKCJSZTogW1BBVENIIHYxIDEvNl0gZG9jczogYWRkIGZlYXR1
cmUgZG9jdW1lbnQgZm9yIFhlbiBoeXBlcnZpc29yIHN5c2ZzLWxpa2Ugc3VwcG9ydCIpOgo+IE9u
IDMwLjA5LjE5IDEwOjU3LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+IE9uIDMwLjA5LjIwMTkgMTA6
MTcsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4gPj4gLmNvbmZpZyBjYW4gY29udGFpbiB1c2VyIHN1
cHBsaWVkIHN0cmluZ3MuIFdoaWxlIG5vdCBtYWtpbmcgbXVjaCBzZW5zZQo+ID4+IHRvIGhhdmUg
dW5wcmludGFibGUgY2hhcmFjdGVycyBpbiB0aGVyZSBJIGRvbid0IHNlZSBob3cgdG8gcHJldmVu
dCB0aGVtLgo+ID4gCj4gPiBEb2VzIC8gY2FuJ3Qga2NvbmZpZyByZWplY3QgdGhlbT8KPiAKPiBS
aWdodCBub3cgaXQgZG9lc24ndC4KPiAKPiBJIHRlc3RlZCB0aGF0IGJ5IG1hbnVhbGx5IG1vZGlm
eWluZyBteSAuY29uZmlnIGFuZCB0aGVuIGRvaW5nIGEgbWFrZS4KPiBUaGUgKHdyb25nKSAuY29u
ZmlnIHdhcyBhY2NlcHRlZCBhbmQgdGhlIGh5cGVydmlzb3IgYnVpbHQgd2l0aCBpdC4KClVyZ2gu
CgpJIHRoaW5rIHRoYXQgZWl0aGVyCgooQSkgdGhpcyBuZWVkcyB0byBiZSBwcmV2ZW50ZWQgc29t
ZWhvdywgb3IKCihCKSB5b3VyIHVzZXJsYW5kIHRvb2xzLCBhdCB0aGUgdmVyeSBsZWFzdCwgbmVl
ZCBzb3VwaW5nIHVwIHNvIHRoYXQKdGhleSAoaSkgYnkgZGVmYXVsdCBkbyBub3QgcmlzayBzcGFt
bWluZyB0aGUgdXNlcidzIHRlcm1pbmFsIHdpdGgKYmluYXJ5IGdpYmJlcmlzaCB3aGljaCBzb21l
b25lIHN0b3JlZCBpbiB4ZW5oeXBmcyAoaWkpIGNhbiBiZSB1c2VkIHRvCnJlbGlhYmx5IGV4dHJh
Y3QgYW55IGJpbmFyeSBvYmplY3RzIHdoaWNoIGhhdmUgYmVlbiBzdG9yZWQuCgpJIHRoaW5rIChC
KShpKSBuZWNlc3NhcmlseSBpbnZvbHZlcyBzb21lIGtpbmQgb2YgcXVvdGluZyBzY2hlbWUgOi0v
LgooQikoaWkpIG1lYW5zIHRoZSBxdW90aW5nIG5lZWRzIHRvIGJlIHR1cm4tb2ZmLWFibGUuCgpJ
YW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
