Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D814114D8D4
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 11:20:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix6tL-0001mg-HE; Thu, 30 Jan 2020 10:17:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=avZM=3T=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ix6tJ-0001mY-DX
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 10:17:41 +0000
X-Inumbo-ID: bed379d0-4349-11ea-8a29-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bed379d0-4349-11ea-8a29-12813bfff9fa;
 Thu, 30 Jan 2020 10:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580379460;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TdWBsEqH9C3Lmt1HfiibWdwbe10h6oOUTGiGmvQ2xF8=;
 b=B32QdUS9S7O6/xzUFE58h6vaNEDJ/AOlvq9xgEcxRMD7reU/ELobsyhD
 BiUkSKysKvwnOSFfP7/edG0yOQDcXgEcVXvpLeek/2++5cIY+xWzL2S+3
 IsMMdBrxngBmSkTIlSxyqxSZCddMJEVYrvXbZtmRUmTpnhIudyQiQBK06 g=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SOEceepBbx2JbXi9Xqn+3S45GQQLan4a3QI5xJEWXwAz7wGgnBCKz14bt8S3q8n0jpxa0AesX+
 +AST/MVdv6wPyB9ewcDWEBBwNn9xCATS17ODlwUQ7m19/M3MD7ynyDVelDSn11iQSPjFfnQ5QN
 VOZfr+jahKQbkoi05dpyv91ryh+5ZdLxGGlpxp5IfR9amaXnQeG6+IHrVQ+wNa5No/6ywci+X2
 lLtjZH07rfBj5C13MspKhzPpoJbWS0mwO3u0T9pjXsCstL34e3onamYuujNfRBOBUqV+rzxm3N
 j6I=
X-SBRS: 2.7
X-MesageID: 11668420
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,381,1574139600"; d="scan'208";a="11668420"
Date: Thu, 30 Jan 2020 11:17:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200130101733.GF4679@Air-de-Roger>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-5-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129202034.15052-5-liuwe@microsoft.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v5 04/12] x86: make paddr_bits available
 earlier
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjksIDIwMjAgYXQgMDg6MjA6MjZQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBNb3ZlIGVhcmx5X2NwdV9pbml0IGJlZm9yZSBpbml0X2U4MjAsIHN1Y2ggdGhhdCBwYWRkcl9i
aXRzIGNhbiBiZSB1c2VkCj4gYnkgZTgyMCBjb2RlLgo+IAo+IFRoaXMgd2lsbCByZWR1Y2UgY29k
ZSByZXBldGl0aW9uIGFuZCBwcmVwYXJlIGZvciBmdXJ0aGVyIGFkanVzdG1lbnQgd2hlbgo+IEww
IGh5cGVydmlzb3IgY29tZXMgaW50byBwbGF5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUg
PGxpdXdlQG1pY3Jvc29mdC5jb20+CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+CgpPbmUgdHlwbyBiZWxvdy4KCj4gLS0tCj4gIHhlbi9hcmNoL3g4
Ni9lODIwLmMgIHwgMTQgKysrKy0tLS0tLS0tLS0KPiAgeGVuL2FyY2gveDg2L3NldHVwLmMgfCAg
NSArKystLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9lODIwLmMgYi94ZW4vYXJjaC94ODYv
ZTgyMC5jCj4gaW5kZXggMDgyZjk5MjhhMS4uMzg5MmM5Y2ZiNyAxMDA2NDQKPiAtLS0gYS94ZW4v
YXJjaC94ODYvZTgyMC5jCj4gKysrIGIveGVuL2FyY2gveDg2L2U4MjAuYwo+IEBAIC00MjAsNyAr
NDIwLDcgQEAgc3RhdGljIHVpbnQ2NF90IF9faW5pdCBtdHJyX3RvcF9vZl9yYW0odm9pZCkKPiAg
ewo+ICAgICAgdWludDMyX3QgZWF4LCBlYngsIGVjeCwgZWR4Owo+ICAgICAgdWludDY0X3QgbXRy
cl9jYXAsIG10cnJfZGVmLCBhZGRyX21hc2ssIGJhc2UsIG1hc2ssIHRvcDsKPiAtICAgIHVuc2ln
bmVkIGludCBpLCBwaHlzX2JpdHMgPSAzNjsKPiArICAgIHVuc2lnbmVkIGludCBpOwo+ICAKPiAg
ICAgIC8qIEJ5IGRlZmF1bHQgd2UgY2hlY2sgb25seSBJbnRlbCBzeXN0ZW1zLiAqLwo+ICAgICAg
aWYgKCBlODIwX210cnJfY2xpcCA9PSAtMSApCj4gQEAgLTQ0NSwxNSArNDQ1LDkgQEAgc3RhdGlj
IHVpbnQ2NF90IF9faW5pdCBtdHJyX3RvcF9vZl9yYW0odm9pZCkKPiAgICAgIGlmICggIXRlc3Rf
Yml0KFg4Nl9GRUFUVVJFX01UUlIgJiAzMSwgJmVkeCkgKQo+ICAgICAgICAgICByZXR1cm4gMDsK
PiAgCj4gLSAgICAvKiBGaW5kIHRoZSBwaHlzaWNhbCBhZGRyZXNzIHNpemUgZm9yIHRoaXMgQ1BV
LiAqLwo+IC0gICAgZWF4ID0gY3B1aWRfZWF4KDB4ODAwMDAwMDApOwo+IC0gICAgaWYgKCAoZWF4
ID4+IDE2KSA9PSAweDgwMDAgJiYgZWF4ID49IDB4ODAwMDAwMDggKQo+IC0gICAgewo+IC0gICAg
ICAgIHBoeXNfYml0cyA9ICh1aW50OF90KWNwdWlkX2VheCgweDgwMDAwMDA4KTsKPiAtICAgICAg
ICBpZiAoIHBoeXNfYml0cyA+IFBBRERSX0JJVFMgKQo+IC0gICAgICAgICAgICBwaHlzX2JpdHMg
PSBQQUREUl9CSVRTOwo+IC0gICAgfQo+IC0gICAgYWRkcl9tYXNrID0gKCgxdWxsIDw8IHBoeXNf
Yml0cykgLSAxKSAmIH4oKDF1bGwgPDwgMTIpIC0gMSk7Cj4gKyAgICAvKiBwYWRkcl9iaXRzIG11
c3QgaGF2ZSBiZWVuIHNldCBhdCB0aGlzIHBvaW50ICovCj4gKyAgICBBU1NFUlQocGFkZHJfYml0
cyk7Cj4gKyAgICBhZGRyX21hc2sgPSAoKDF1bGwgPDwgcGFkZHJfYml0cykgLSAxKSAmIFBBR0Vf
TUFTSzsKPiAgCj4gICAgICByZG1zcmwoTVNSX01UUlJjYXAsIG10cnJfY2FwKTsKPiAgICAgIHJk
bXNybChNU1JfTVRSUmRlZlR5cGUsIG10cnJfZGVmKTsKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L3NldHVwLmMgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwo+IGluZGV4IGQ4NTg4ODM0MDQuLjg5
ZmU0OTE0OWYgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L3NldHVwLmMKPiArKysgYi94ZW4v
YXJjaC94ODYvc2V0dXAuYwo+IEBAIC05NTQsNiArOTU0LDkgQEAgdm9pZCBfX2luaXQgbm9yZXR1
cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlfcCkKPiAgICAgIGVsc2UKPiAgICAgICAg
ICBwYW5pYygiQm9vdGxvYWRlciBwcm92aWRlZCBubyBtZW1vcnkgaW5mb3JtYXRpb25cbiIpOwo+
ICAKPiArICAgIC8qIFRoaXMgbXVzdCBjb21lIGJlZm9yZSBlODIwIGNvZGUgYmVjdWF1c2UgaXQg
c2V0cyBwYWRkcl9iaXRzLiAqLwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBeIGJlY2F1c2UKClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
