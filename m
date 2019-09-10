Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5978AE775
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 12:00:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7cuC-0004xD-De; Tue, 10 Sep 2019 09:57:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dh0A=XF=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i7cuB-0004wz-5D
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 09:57:47 +0000
X-Inumbo-ID: 6f8edb60-d3b1-11e9-ac1a-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f8edb60-d3b1-11e9-ac1a-12813bfff9fa;
 Tue, 10 Sep 2019 09:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568109465;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=A0V1QVJ+WUgG70Ht4SZQHUEKlwLpCEcE5phxTl5nrUI=;
 b=VmEm9NoqitdKf/4ku/WCLGZlQRMb/FmhgTwHjMFYkrHIKRYpUvbS4WP9
 34QvfICmZSdvOMXHaYtvxmzGLGv8obBijeTi/+n4/5jGTb2uAXjye7ZQt
 Eq4n/SkH8/yWk8iPa3MO8HoylfS5dbrKPsnndS3QoXQIAtjN8q0k+mltW w=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /a8Lpjd832frpUBO6/QgkRKAFwoH/pvXdeduLaNLwYW7TydP8kErByMv51U731SfQTTA3dN6SS
 As0rUpq6owx3ErcS6dLIebM0KkOu0JtOTB6eyUz2SCqyvFsrURKnzJUC4T7kaOaInvk42PYokN
 fVCezJExzWZ1Vf/Eb0aIWSiBw0kxF4Yzmg4ZTrKOw4GmxWTlv0J1zNlPsI0CW8W5eGi59H8lPJ
 Euka0Bogpp2LqYl9NkcZgJiBuciKJL3gN9nbxkeWdeQR5pbsNe4bPQNSmkB/L5dvW+p+bo1xbO
 lyU=
X-SBRS: 2.7
X-MesageID: 5360664
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5360664"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23927.29559.385471.934984@mariner.uk.xensource.com>
Date: Tue, 10 Sep 2019 10:57:11 +0100
To: Christian Lindig <christian.lindig@citrix.com>
In-Reply-To: <22C7C052-B208-4BA5-97D2-D17EED80A424@citrix.com>
References: <20190909171206.25585-1-ian.jackson@eu.citrix.com>
 <20190909171206.25585-3-ian.jackson@eu.citrix.com>
 <22C7C052-B208-4BA5-97D2-D17EED80A424@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 3/3] tools/ocaml: Introduce xenctrl ABI
 build-time checks
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, David Scott <dave@recoil.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2hyaXN0aWFuIExpbmRpZyB3cml0ZXMgKCJSZTogW1BBVENIIDMvM10gdG9vbHMvb2NhbWw6IElu
dHJvZHVjZSB4ZW5jdHJsIEFCSSBidWlsZC10aW1lIGNoZWNrcyIpOgo+IEkgdW5kZXJzdGFuZCB0
aGUgZGVzaXJlIHRvIGF1dG9tYXRlIHRoaXMgYnV0IHdvdWxkIGhhdmUga2VwdCB0aGUKPiBvcmln
aW5hbCBwcm9wb3NhbCBmb3IgdGhlc2UgcmVhc29uczogY2hhbmdlcyBhcmUgcmFyZSBlbm91Z2gs
IGl0IGlzCj4gb2J2aW91cyBob3cgdG8gZXh0ZW5kIHRoZSBzY2hlbWUsIHRoZSBhcHByb2FjaCBz
dGF5ZWQgd2VsbCB3aXRoaW4KPiB0aGUgcmVzcGVjdGl2ZSBsYW5ndWFnZXMuIEFkZGluZyBwYXJz
ZXJzIGFuZCBjb2RlIGdlbmVyYXRvcnMgdG8gdGhlCj4gYnVpbGQgc3lzdGVtIHdpbGwgbWFrZSBp
dCBtb3JlIGRpZmZpY3VsdCB0byBpbXByb3ZlIGl0LCB3aGljaCBhdAo+IGxlYXN0IGZvciB0aGUg
T0NhbWwgcGFydCBpcyB2ZXJ5IGRlc2lyYWJsZS4gSG93ZXZlciwgSeKAmW0gbm90IGdvaW5nCj4g
dG8gb2JqZWN0IHRvIHRoZSBwYXRjaC4KCkkgd291bGQgbG92ZSB0byBoYXZlIHRoaXMgYWxsIGRv
bmUgaW4gYSBtb3JlICJwcm9wZXIiIHdheS4KCkhvd2V2ZXIsIGluIHRoZSBtZWFudGltZSBJIGRv
IHRoaW5rIGl0IGlzIGVzc2VudGlhbCB0byBoYXZlIGEgY2hlY2sKd2hpY2ggYWN0dWFsbHkgdGll
cyB0aGUgb2NhbWwgY29kZSByaWdodCBiYWNrIHRvIHRoZSBYZW4gaGVhZGVycyAodGhlCmxhdHRl
ciBiZWluZyB0aGUgY2Fub25pY2FsIEFCSSBkZWZpbml0aW9uKS4gIEluZGVlZCB0aGUgdjEgcGF0
Y2ggaW4KdGhpcyB2ZXJ5IHRocmVhZCBoYWQgYSBtaXNtYXRjaCBiZXR3ZWVuIHRoZSBvY2FtbCBh
bmQgdGhlIEJVSUxEX0JVR19PTgpsaXN0LCB3aGljaCBJIG9ubHkgZGlzY292ZXJlZCB3aGVuIG15
IGNoZWNrZXIgdGhyZXcgYW4gdW5leHBlY3RlZAplcnJvci4KCklmIHRoZXJlIGFyZSBvdGhlciBs
YW5ndWFnZSBiaW5kaW5ncyB3aGljaCBoYXZlIHNpbWlsYXIgaXNzdWVzIHdlCnNob3VsZCBjaGVj
ayB0aGVtIHRvby4KClVsdGltYXRlbHkgSSB3b3VsZCBwcmVmZXIgaXQgaWYgdGhlIFhlbiBBQkkg
d2VyZSBwcm92aWRlZCBpbiBhIHdheQp0aGF0IHdhcyB1c2VhYmxlIGZvciBhdXRvbWF0aWNhbGx5
IGdlbmVyYXRpbmcgYmluZGluZ3MuCgo+IEFja2VkLWJ5OiBDaHJpc3RpYW4gTGluZGlnIDxjaHJp
c3RpYW4ubGluZGlnQGNpdHJpeC5jb20+CgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
