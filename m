Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8BE15AE0E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 18:06:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1vOh-0000rY-SQ; Wed, 12 Feb 2020 17:01:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zgzp=4A=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j1vOg-0000rS-GR
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 17:01:58 +0000
X-Inumbo-ID: 6083e836-4db9-11ea-aa99-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6083e836-4db9-11ea-aa99-bc764e2007e4;
 Wed, 12 Feb 2020 17:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581526917;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1wPW03+UYWeNsfOmuD39l2FvNDKtoqByLBKjw6CDXbM=;
 b=TqdQyZtZB34p5/FdRMLw94As8J5jcDOH2BuvCk56rvAlNUsAJcWdAPyU
 UkR76aPCzSsULm7B9g5pV2Z2BRu7AOZbhWdZDTxm9W3pACSE3FroNEwEL
 3+3woibgxqP0Vil7Al7jmL/rZWKp60MUA/vq6eC72uKkYdnTxzYmXfV8i Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vMiJaXcvMvCuf+YXAjwSaYtiWg6NGIWWi+UHA/bd8YWhVKYRQI4Au03srQur+Xa0y5dJ5awMgB
 Pc1CWrNf0Pb3OnjuGwXIGZH0khXJf83uU05XpX9tMCqoSe7GKJ8OJP9IJ9JCpRibmpnf3JuyXo
 BkPyuQfP/b/qJZUrI8+9XXdbGS5DLECL9WYq82RJ9s1eGVc5/C+i/bFZ1h6G3/KUapcHVmaolE
 tZLtfNx+9IpPvVOl1Y5YImcVzXRx53FXrrY0uZk9zDtTTqyUHjFolmjFS/1EkwOZcoGxikJwMa
 yCI=
X-SBRS: 2.7
X-MesageID: 12968762
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,433,1574139600"; d="scan'208";a="12968762"
Date: Wed, 12 Feb 2020 18:01:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <20200212170150.GS4679@Air-de-Roger>
References: <20200212164949.56434-1-roger.pau@citrix.com>
 <1d26308a-cbe9-8a6c-a4a9-9211c0b165c5@eikelenboom.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1d26308a-cbe9-8a6c-a4a9-9211c0b165c5@eikelenboom.it>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 0/3] x86: fixes/improvements for scratch
 cpumask
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMTIsIDIwMjAgYXQgMDU6NTM6MzlQTSArMDEwMCwgU2FuZGVyIEVpa2VsZW5i
b29tIHdyb3RlOgo+IE9uIDEyLzAyLzIwMjAgMTc6NDksIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToK
PiA+IEhlbGxvLAo+ID4gCj4gPiBDb21taXQ6Cj4gPiAKPiA+IDU1MDBkMjY1YTJhOGZhNjNkNjBj
MDhiZWI1NDlkZThlYzgyZmY3YTUKPiA+IHg4Ni9zbXA6IHVzZSBBUElDIEFMTEJVVCBkZXN0aW5h
dGlvbiBzaG9ydGhhbmQgd2hlbiBwb3NzaWJsZQo+ID4gCj4gPiBJbnRyb2R1Y2VkIGEgYm9ndXMg
dXNhZ2Ugb2YgdGhlIHNjcmF0Y2ggY3B1bWFzazogaXQgd2FzIHVzZWQgaW4gYQo+ID4gZnVuY3Rp
b24gdGhhdCBjb3VsZCBiZSBjYWxsZWQgZnJvbSBpbnRlcnJ1cHQgY29udGV4dCwgYW5kIGhlbmNl
IHVzaW5nCj4gPiB0aGUgc2NyYXRjaCBjcHVtYXNrIHRoZXJlIGlzIG5vdCBzYWZlLiBQYXRjaCAj
MiBpcyBhIGZpeCBmb3IgdGhhdCB1c2FnZS4KPiA+IAo+ID4gUGF0Y2ggIzMgYWRkcyBzb21lIGRl
YnVnIGluZnJhc3RydWN0dXJlIHRvIG1ha2Ugc3VyZSB0aGUgc2NyYXRjaCBjcHVtYXNrCj4gPiBp
cyB1c2VkIGluIHRoZSByaWdodCBjb250ZXh0LCBhbmQgaGVuY2Ugc2hvdWxkIHByZXZlbnQgZnVy
dGhlciBtaXNzdXNlcy4KPiA+IAo+ID4gVGhhbmtzLCBSb2dlci4KPiAKPiBIaSBSb2dlciwKPiAK
PiBEbyB5b3Ugc3RpbGwgd2FudCBtZSB0byB0ZXN0IHRoZSAicGFuaWMiIHBhdGNoID8KPiBPciB0
ZXN0IHRoaXMgc2VyaWVzIGluc3RlYWQgPwoKSSd2ZSBiZWVuIGFibGUgdG8gdHJpZ2dlciB0aGlz
IG15c2VsZiwgc28gaWYgeW91IGNhbiBnaXZlIGEgdHJ5IHRvIHRoZQpzZXJpZXMgaW4gb3JkZXIg
dG8gYXNzZXJ0IGl0IGZpeGVzIHlvdXIgaXNzdWUgdGhhdCB3b3VsZCBiZSBncmVhdC4KClRoYW5r
cy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
