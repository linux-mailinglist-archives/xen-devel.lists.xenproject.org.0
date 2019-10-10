Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B95B2D27F7
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 13:30:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIWYk-0000eg-Am; Thu, 10 Oct 2019 11:24:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t5VA=YD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iIWYi-0000eb-5V
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 11:24:40 +0000
X-Inumbo-ID: 8b8b15ac-eb50-11e9-9800-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b8b15ac-eb50-11e9-9800-12813bfff9fa;
 Thu, 10 Oct 2019 11:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570706678;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dS0I4zE3KCtE35fIPdSrmZkiIXfzetEo5FQ4OZe4iyA=;
 b=fC3Ft58bfd6vzGqJgcaWHhvQkCC0N4qleuqbyhEOSe9aWTL2bdrL7Oya
 JKf0Z44JkEJgh5YVkkygCwc03FwNZ0eaZcp3l8112rOk63TBnTtEKhnCX
 kQ6O/0c8Y7YVkujl4WR5bGNve5lGV4u0ekmAH/ntqsJ7Ap5zvRY6cOkBL o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xJNDq36SCmgzRVQqmGuVOcjvZSoeeZq/dYvGuld5vNO9umSDFRjyFmJo4oV21KJl4Z2CBbFgyU
 AmIN4dug8UHdMv6/E1VRc68Rur6nSBWiRWGZSsQ7UMl+sxjh87vSBQ5IEuPcsqit9DeeeUWx4q
 R1A866/ZWE8DRcLWpdRAM4AGE5C34oHeYybNOhZlhC2iCUAi0CKQemg9ZvgWMMWGs0NoRGsIrb
 /Elaz6W6KZxfZ33zeIo9oqloKKDPg8iVrDtHZcv880E486rhTNDtpGfoEAfNCvdnZdeFeVQdW1
 pAk=
X-SBRS: 2.7
X-MesageID: 7018756
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,280,1566878400"; 
   d="scan'208";a="7018756"
Date: Thu, 10 Oct 2019 13:24:30 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Message-ID: <20191010112430.GE1389@Air-de-Roger.citrite.net>
References: <20191010110339.6447-1-roger.pau@citrix.com>
 <20191010110339.6447-2-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191010110339.6447-2-roger.pau@citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/2] x2APIC: translate IO-APIC entries when
 enabling the IOMMU
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
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMDE6MDM6MzhQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFdoZW4gaW50ZXJydXB0IHJlbWFwcGluZyBpcyBlbmFibGVkIGFzIHBhcnQgb2Yg
ZW5hYmxpbmcgeDJBUElDIHRoZQo+IElPLUFQSUMgZW50cmllcyBhbHNvIG5lZWQgdG8gYmUgdHJh
bnNsYXRlZCB0byB0aGUgbmV3IGZvcm1hdCBhbmQgYWRkZWQKPiB0byB0aGUgaW50ZXJydXB0IHJl
bWFwcGluZyB0YWJsZS4KPiAKPiBUaGlzIHByZXZlbnRzIElPTU1VIGludGVycnVwdCByZW1hcHBp
bmcgZmF1bHRzIHdoZW4gYm9vdGluZyBvbgo+IGhhcmR3YXJlIHRoYXQgaGFzIHVubWFza2VkIElP
LUFQSUMgcGlucy4KPiAKPiBSZXBvcnRlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KPiAtLS0KPiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
Pgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvYXBpYy5jICAgICAgICAgICB8IDEyICsrKysrKysrKyst
LQo+ICB4ZW4vYXJjaC94ODYvaW9fYXBpYy5jICAgICAgICB8ICA1ICsrKy0tCj4gIHhlbi9pbmNs
dWRlL2FzbS14ODYvaW9fYXBpYy5oIHwgIDMgKystCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L2FwaWMuYyBiL3hlbi9hcmNoL3g4Ni9hcGljLmMKPiBpbmRleCA2Y2RiNTBjZjQxLi45ODEwZGU3
NDczIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9hcGljLmMKPiArKysgYi94ZW4vYXJjaC94
ODYvYXBpYy5jCj4gQEAgLTUxNSw3ICs1MTUsNyBAQCBzdGF0aWMgdm9pZCByZXN1bWVfeDJhcGlj
KHZvaWQpCj4gICAgICBpb21tdV9lbmFibGVfeDJhcGljKCk7Cj4gICAgICBfX2VuYWJsZV94MmFw
aWMoKTsKPiAgCj4gLSAgICByZXN0b3JlX0lPX0FQSUNfc2V0dXAoaW9hcGljX2VudHJpZXMpOwo+
ICsgICAgcmVzdG9yZV9JT19BUElDX3NldHVwKGlvYXBpY19lbnRyaWVzLCB0cnVlKTsKPiAgICAg
IHVubWFza184MjU5QSgpOwo+ICAKPiAgb3V0Ogo+IEBAIC04ODcsNiArODg3LDcgQEAgdm9pZCBf
X2luaXQgeDJhcGljX2JzcF9zZXR1cCh2b2lkKQo+ICB7Cj4gICAgICBzdHJ1Y3QgSU9fQVBJQ19y
b3V0ZV9lbnRyeSAqKmlvYXBpY19lbnRyaWVzID0gTlVMTDsKPiAgICAgIGNvbnN0IGNoYXIgKm9y
aWdfbmFtZTsKPiArICAgIGJvb2wgaW9tbXVfZW5hYmxlZCA9IHRydWU7CgpUaGVyZSdzIG5vIG5l
ZWQgZm9yIHRoaXMgbG9jYWwgdmFyaWFibGUsIHgyYXBpY19lbmFibGVkIGNhbiBiZSB1c2VkCmlu
c3RlYWQuCgpXaWxsIHNlbmQgYSBuZXcgdmVyc2lvbiwgc29ycnkuCgpSb2dlci4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
