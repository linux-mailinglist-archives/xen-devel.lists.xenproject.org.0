Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4783BF66B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 18:07:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDWH0-0004YY-8M; Thu, 26 Sep 2019 16:05:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1cs6=XV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iDWGy-0004YM-57
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 16:05:40 +0000
X-Inumbo-ID: 7b8ad3ce-e077-11e9-b588-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by localhost (Halon) with ESMTPS
 id 7b8ad3ce-e077-11e9-b588-bc764e2007e4;
 Thu, 26 Sep 2019 16:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569513939;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xNmwa2L9eYJpetxJuDJnYRvaTBOTMbKLB00awKgPVSU=;
 b=dnKdt3EWVyfcIQfuMOvqYMPCLkJLutndSjkcBnnOnmWeSRIT746g+n3Z
 i13lVw14msaKc9Er1KIQGFwTz5zpWxeqLgj5adMmnXsw2Hhyr2TpMXYlJ
 uG6xiQv+/lInuJiGhJ0fmawTD/sjsxqt6aQYZO005HI7EqK/6NVfzrSAp s=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Gi9aoeI53M4mpMg3vSqP45PllamDfvA9qxjmZQ55FFWLKkaQJ7dJTwNsCakp7FqvSmMQ3SOH/D
 +LCgEN2mWrLqo8sKqOYGBlY0a4FNuEb6c64gUC1D62+8OqmqIqtDblH9397trzq0BpIS2gYKex
 eLOlKJsp9h0ZUvoNg5lId8WTxqnrq6mDGz9LZvvnLX6ddV84vQG6FhWVRsDDYvATLsLoIMtzYd
 /Y7R2ruPKaw1xTfu9waa46uXpS24y1ydmXuMUdD+2rbnM6NZaotzzUbyrdKHcyD0iIpSq+iHt7
 7wY=
X-SBRS: 2.7
X-MesageID: 6357621
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,552,1559534400"; 
   d="scan'208";a="6357621"
Date: Thu, 26 Sep 2019 18:05:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190926160532.gyfryybuc2aq2ene@Air-de-Roger>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-11-roger.pau@citrix.com>
 <bc884726839941139bef531d1118dbb9@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bc884726839941139bef531d1118dbb9@AMSPEX02CL03.citrite.net>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 10/11] ioreq: split the code to detect
 PCI config space accesses
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Liu <wl@xen.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMDQ6MDY6MjBQTSArMDIwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFJvZ2VyIFBhdSBN
b25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiBTZW50OiAwMyBTZXB0ZW1iZXIgMjAxOSAx
NzoxNAo+ID4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+ID4gQ2M6IFJvZ2Vy
IFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBQYXVsIER1cnJhbnQgPFBhdWwuRHVy
cmFudEBjaXRyaXguY29tPjsgSmFuIEJldWxpY2gKPiA+IDxqYmV1bGljaEBzdXNlLmNvbT47IEFu
ZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4u
b3JnPgo+ID4gU3ViamVjdDogW1BBVENIIHYyIDEwLzExXSBpb3JlcTogc3BsaXQgdGhlIGNvZGUg
dG8gZGV0ZWN0IFBDSSBjb25maWcgc3BhY2UgYWNjZXNzZXMKPiA+IAo+ID4gUGxhY2UgdGhlIGNv
ZGUgdGhhdCBjb252ZXJ0cyBhIFBJTy9DT1BZIGlvcmVxIGludG8gYSBQQ0lfQ09ORklHIG9uZQo+
ID4gaW50byBhIHNlcGFyYXRlIGZ1bmN0aW9uLCBhbmQgYWRqdXN0IHRoZSBjb2RlIHRvIG1ha2Ug
dXNlIG9mIHRoaXMKPiA+IG5ld2x5IGludHJvZHVjZWQgZnVuY3Rpb24uCj4gPiAKPiA+IE5vIGZ1
bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IC0tLQo+ID4gQ2hhbmdlcyBzaW5j
ZSB2MToKPiA+ICAtIE5ldyBpbiB0aGlzIHZlcnNpb24uCj4gPiAtLS0KPiA+ICB4ZW4vYXJjaC94
ODYvaHZtL2lvcmVxLmMgfCAxMTEgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDY3IGluc2VydGlvbnMoKyksIDQ0IGRlbGV0aW9ucygt
KQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jIGIveGVuL2Fy
Y2gveDg2L2h2bS9pb3JlcS5jCj4gPiBpbmRleCBmZWNkYzI3ODZmLi4zM2M1NmI4ODBjIDEwMDY0
NAo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jCj4gPiArKysgYi94ZW4vYXJjaC94
ODYvaHZtL2lvcmVxLmMKPiA+IEBAIC0xODMsNiArMTgzLDU0IEBAIHN0YXRpYyBib29sIGh2bV93
YWl0X2Zvcl9pbyhzdHJ1Y3QgaHZtX2lvcmVxX3ZjcHUgKnN2LCBpb3JlcV90ICpwKQo+ID4gICAg
ICByZXR1cm4gdHJ1ZTsKPiA+ICB9Cj4gPiAKPiA+ICtzdGF0aWMgdm9pZCBjb252ZXJ0X3BjaV9p
b3JlcShzdHJ1Y3QgZG9tYWluICpkLCBpb3JlcV90ICpwKQo+ID4gK3sKPiA+ICsgICAgY29uc3Qg
c3RydWN0IGh2bV9tbWNmZyAqbW1jZmc7Cj4gPiArICAgIHVpbnQzMl90IGNmOCA9IGQtPmFyY2gu
aHZtLnBjaV9jZjg7Cj4gPiArCj4gPiArICAgIGlmICggcC0+dHlwZSAhPSBJT1JFUV9UWVBFX1BJ
TyAmJiBwLT50eXBlICE9IElPUkVRX1RZUEVfQ09QWSApCj4gPiArICAgIHsKPiA+ICsgICAgICAg
IEFTU0VSVF9VTlJFQUNIQUJMRSgpOwo+ID4gKyAgICAgICAgcmV0dXJuOwo+ID4gKyAgICB9Cj4g
PiArCj4gPiArICAgIHJlYWRfbG9jaygmZC0+YXJjaC5odm0ubW1jZmdfbG9jayk7Cj4gCj4gQWN0
dWFsbHksIGxvb2tpbmcgYXQgdGhpcy4uLiBjYW4geW91IG5vdCByZXN0cmljdCBob2xkaW5nIHRo
ZSBtbWNmZ19sb2NrLi4uCj4gCj4gPiArICAgIGlmICggKHAtPnR5cGUgPT0gSU9SRVFfVFlQRV9Q
SU8gJiYKPiA+ICsgICAgICAgICAgKHAtPmFkZHIgJiB+MykgPT0gMHhjZmMgJiYKPiA+ICsgICAg
ICAgICAgQ0Y4X0VOQUJMRUQoY2Y4KSkgfHwKPiA+ICsgICAgICAgICAocC0+dHlwZSA9PSBJT1JF
UV9UWVBFX0NPUFkgJiYKPiA+ICsgICAgICAgICAgKG1tY2ZnID0gaHZtX21tY2ZnX2ZpbmQoZCwg
cC0+YWRkcikpICE9IE5VTEwpICkKPiA+ICsgICAgewo+ID4gKyAgICAgICAgdWludDMyX3QgeDg2
X2ZhbTsKPiA+ICsgICAgICAgIHBjaV9zYmRmX3Qgc2JkZjsKPiA+ICsgICAgICAgIHVuc2lnbmVk
IGludCByZWc7Cj4gPiArCj4gPiArICAgICAgICByZWcgPSBwLT50eXBlID09IElPUkVRX1RZUEVf
UElPID8gaHZtX3BjaV9kZWNvZGVfYWRkcihjZjgsIHAtPmFkZHIsCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmc2JkZikK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiBodm1fbW1jZmdf
ZGVjb2RlX2FkZHIobW1jZmcsIHAtPmFkZHIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZzYmRmKTsKPiAKPiAuLi4g
dG8gd2l0aGluIGh2bV9tbWNmZ19kZWNvZGVfYWRkcigpPwoKSG0sIG5vdCByZWFsbHkuIFRoZXJl
J3MgYSBjYWxsIHRvIGh2bV9tbWNmZ19maW5kIGluIHRoZSBpZiBjb25kaXRpb24Kd2hpY2ggbmVl
ZHMgdGhlIGxvY2sgdG8gYmUgaGVsZCwgYW5kIHRoZW4gYnJlYWtpbmcgdGhpcyBpbnRvIHR3bwpk
aWZmZXJlbnQgbG9jayBzZWN0aW9ucyAocGljayBsb2NrLCBnZXQgbW1jZmcsIHVubG9jaywgcGlj
ayBsb2NrLApkZWNvZGUsIHVubG9jaykgY291bGQgbGVhZCB0byB0aGUgbW1jZmcgcmVnaW9uIGJl
aW5nIGZyZWVkIHVuZGVyIG91cgpmZWV0LgoKSSB0aGluayB0aGUgbG9ja2luZyBuZWVkcyB0byBz
dGF5IGFzLWlzIHVubGVzcyB3ZSBzd2l0Y2ggdG8gYQpkaWZmZXJlbnQgbG9ja2luZyBtb2RlbCBm
b3IgdGhlIG1tY2ZnIHJlZ2lvbnMuIE5vdGUgaXQncyBhIHJlYWQgbG9jaywKc28gaXQgc2hvdWxk
bid0IGhhdmUgYW55IGNvbnRlbnRpb24gc2luY2UgbW9kaWZ5aW5nIHRoZSBtbWNmZyByZWdpb24K
bGlzdCBpcyB2ZXJ5IHJhcmUuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
