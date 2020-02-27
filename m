Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2921714EB
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 11:25:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7GJb-0003Td-9v; Thu, 27 Feb 2020 10:22:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3dSL=4P=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j7GJa-0003Sk-7q
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 10:22:46 +0000
X-Inumbo-ID: 183744ae-594b-11ea-9636-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 183744ae-594b-11ea-9636-12813bfff9fa;
 Thu, 27 Feb 2020 10:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582798965;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+bOcw3H75dYkSuNpOb1O0sOZb6FzVnNSI/vXz/Lbo8Y=;
 b=BxXYARS62l2XVP0JT3CV6oWyc1fQyZqOZ1NKNvuyTrhPI00h/CGJ8wxJ
 OSpfBV59v22xmkb6SD2dmn7HJYsXVATEZk31BRFT3sJHEmxpidiYxmk4v
 gRLACD+vAsgRcogU0ILW1WkvD1xb4Czrih+afPEdchW/U7pzhtnUWNbcp g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: v43KGUfiq2Gb1RzUuDn5ZP7seevy1wXN7sN4uL/3XqzJdQYItCJ/afXs4xkxiM3rTy3jjKvklK
 QeODOzO9JlOYEAIttxUphBh3iTNPlMbtcOYDLRVAKgNmFfPxtglHXovu2gGOSTA868lBjNfJfr
 uqWL9JO5zkS3PulQTCJ9mGIj1p49Olxat7xwcNizK7DRN6O0hHuBLkYv+MsRCusYqzpInPBJyE
 iN4XrTNZt99qru2amq81g9+1CpHONcDAbYEBBBt9lsvvprH3wcsDUF91SqnAFVF5Prm1X5YUi/
 4N0=
X-SBRS: 2.7
X-MesageID: 13444250
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,491,1574139600"; d="scan'208";a="13444250"
Date: Thu, 27 Feb 2020 11:22:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20200227102238.GM24458@Air-de-Roger.citrite.net>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-15-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226113355.2532224-15-anthony.perard@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [XEN PATCH v3 14/23] xen/build: use new $(c_flags)
 and $(a_flags) instead of $(CFLAGS)
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@gmail.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgMTE6MzM6NDZBTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gRnJvbTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGdtYWlsLmNvbT4K
PiAKPiBJbiBhIGxhdGVyIHBhdGNoICgieGVuL2J1aWxkOiBoYXZlIHRoZSByb290IE1ha2VmaWxl
IGdlbmVyYXRlcyB0aGUKPiBDRkxBR1MpLCB3ZSB3YW50IHRvIGdlbmVyYXRlIHRoZSBDRkxBR1Mg
aW4geGVuL01ha2VmaWxlLCB0aGVuIGV4cG9ydAo+IGl0IGFuZCBoYXZlIFJ1bGVzLm1rIHVzZSBh
IENGTEFHUyBmcm9tIHRoZSBlbnZpcm9ubWVudCB2YXJpYWJsZXMuIFRoYXQKPiBjaGFuZ2VzIHRo
ZSBmbGF2b3Igb2YgdGhlIENGTEFHUyBhbmQgZmxhZ3MgaW50ZW5kZWQgZm9yIG9uZSB0YXJnZXQK
PiAobGlrZSAtRF9fT0JKRUNUX0ZJTEVfXyBhbmQgLU0lKSBnZXRzIHByb3BhZ2F0ZWQgYW5kIGR1
cGxpY2F0ZWQuIFNvIHdlCj4gc3RhcnQgYnkgbW92aW5nIHN1Y2ggZmxhZ3Mgb3V0IG9mICQoQ0ZM
QUdTKSBhbmQgaW50byAkKGNfZmxhZ3MpIHdoaWNoCj4gaXMgdG8gYmUgbW9kaWZpZWQgYnkgb25s
eSBSdWxlcy5tay4KPiAKPiBfX09CSkVDVF9GSUxFX18gaXMgb25seSB1c2VkIGJ5IGFyY2gveDg2
L21tLyouYyBmaWxlcywgc28gaGF2aW5nIGl0IGluCj4gJChjX2ZsYWdzKSBpcyBlbm91Z2gsIHdl
IGRvbid0IG5lZWQgaXQgaW4gJChhX2ZsYWdzKS4KClRoaXMgc2VlbSB0byBiZSB1c2VkIG9ubHkg
Ynkgc291cmNlIGZpbGVzIHRoYXQgYXJlIGJ1aWxkIG11bHRpcGxlCnRpbWVzIHdpdGggZGlmZmVy
ZW50IHBhcmFtZXRlcnMgaW4gb3JkZXIgdG8gZ2VuZXJhdGUgZGlmZmVyZW50IG9iamVjdApmaWxl
cy4KCklzIHRoZXJlIGFueSBoYXJtIGluIGhhdmluZyBpdCBhbHNvIGluIHRoZSBhc3NlbWJsZXIg
ZmxhZ3M/IChpbiBjYXNlCndlIHJlcXVpcmUgc3VjaCB1c2FnZSBpbiB0aGUgZnV0dXJlKQoKT3Ig
bWF5YmUgd2UgY291bGQgZXZlbiBsaW1pdCBfX09CSkVDVF9GSUxFX18gdG8gbW0vIGZpbGVzIHRo
YXQgcmVxdWlyZQppdCBvbmx5PwoKPiAKPiBGb3IgaW5jbHVkZS9NYWtlZmlsZSBhbmQgYXMtaW5z
biB3ZSBjYW4ga2VlcCB1c2luZyBDRkxBR1MsIGJ1dCBzaW5jZQo+IGl0IGRvZXNuJ3QgaGF2ZSAt
TSogZmxhZ3MgYW55bW9yZSB0aGVyZSBpcyBubyBuZWVkIHRvIGZpbHRlciB0aGVtIG91dC4KPiAK
PiBUaGUgWEVOX0JVSUxEX0VGSSB0ZXN0cyBpbiBhcmNoL3g4Ni9NYWtlZmlsZSB3YXMgZmlsdGVy
aW5nIG91dAo+IENGTEFHUy15LCBidXQgYWNjb3JkaW5nIHRvIGRkNDAxNzdjMWJjOCAoIng4Ni02
NC9FRkk6IGFkZCBDRkxBR1MgdG8KPiBjaGVjayBjb21waWxlIiksIGl0IHdhcyBkb25lIHRvIGZp
bHRlciBvdXQgLU1GLiBDRkxBR1MgZG9lc24ndAo+IGhhdmUgdGhvc2UgZmxhZ3MgYW55bW9yZSwg
c28gbm8gZmlsdGVyaW5nIGlzIG5lZWRlZC4KPiAKPiBUaGlzIGlzIGluc3BpcmVkIGJ5IHRoZSB3
YXkgS2J1aWxkIGdlbmVyYXRlcyBDRkxBR1MgZm9yIGVhY2ggdGFyZ2V0cy4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KClJldmll
d2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
