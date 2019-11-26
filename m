Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C044C10A151
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 16:37:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZcrb-0008AF-8w; Tue, 26 Nov 2019 15:34:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=up47=ZS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iZcrZ-0008A9-PF
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 15:34:49 +0000
X-Inumbo-ID: 44cc2a8e-1062-11ea-a3a3-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44cc2a8e-1062-11ea-a3a3-12813bfff9fa;
 Tue, 26 Nov 2019 15:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574782484;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VZXei2W5e47yWf9mB96ouGVY7hAhN1Zv/74GoKNJorw=;
 b=KdJBC9hN2L9JRdcG/ft7HkOzOXmW159Zp3YE92g5Bu4HxcOQbpE5GuN+
 sUice1KLHVcb1Va2xq45OrLW9JagN5bv24NRZ8qQwHdO4IIcKzxIDgVzo
 jt/O0CoIgKic/wOyPwmUW8pGxiETF3p3RRlM7Tw5mP2+mfeWr+WnG5Dx0 I=;
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
IronPort-SDR: 2uUSp+9ZvUiRTrlpSNwymQO8xdz8Q1AnSt5vcIWOHexaGPrqm86KYgOjdRwL7Q8leUVr1S2CEj
 wnjS5g8Am/IZCoSZF+gLineHaCwacoxuQ6b3wHuhPtsrpVWsZ821h2U9j67+zBkEl0nWzfEnZH
 vib1anvS67Y8AMUEwPyW0PchxHMQtziD3n7sYpY/Dw1LO1XbqAE0Dr/77zB7Lq+1ASe3uxFiO3
 gnS7H1dhE0fa5th1R1YomI2SoNviqXeiqJIj/QNVFUAc8kRwRq4XhcUYzcbR46iT7fXAPVyFs5
 hTs=
X-SBRS: 2.7
X-MesageID: 9402733
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,246,1571716800"; 
   d="scan'208";a="9402733"
Date: Tue, 26 Nov 2019 16:34:36 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191126153436.GF980@Air-de-Roger>
References: <20191126120357.13398-1-andrew.cooper3@citrix.com>
 <20191126120357.13398-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126120357.13398-3-andrew.cooper3@citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 2/3] x86/svm: Always intercept ICEBP
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Juergen Gross <jgross@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMTI6MDM6NTZQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBJQ0VCUCBpc24ndCBoYW5kbGVkIHdlbGwgYnkgU1ZNLgo+IAo+IFRoZSBWTWV4aXQg
c3RhdGUgZm9yIGEgI0RCLXZlY3RvcmVkIFRBU0tfU1dJVENIIGhhcyAlcmlwIHBvaW50aW5nIHRv
IHRoZQo+IGFwcHJvcHJpYXRlIGluc3RydWN0aW9uIGJvdW5kYXJ5IChmYXVsdCBvciB0cmFwLCBh
cyBhcHByb3ByaWF0ZSksIGV4Y2VwdCBmb3IKPiBhbiBJQ0VCUC1pbmR1Y2VkICNEQiBUQVNLX1NX
SVRDSCwgd2hlcmUgJXJpcCBwb2ludHMgYXQgdGhlIElDRUJQIGluc3RydWN0aW9uCj4gcmF0aGVy
IHRoYW4gYWZ0ZXIgaXQuICBBcyBJQ0VCUCBpc24ndCBkaXN0aW5ndWlzaGVkIGluIHRoZSB2ZWN0
b3JpbmcgZXZlbnQKPiB0eXBlLCB0aGUgc3RhdGUgaXMgYW1iaWd1b3VzLgo+IAo+IFRvIGFkZCB0
byB0aGUgY29uZnVzaW9uLCBhbiBJQ0VCUCB3aGljaCBvY2N1cnMgZHVlIHRvIEludHJvc3BlY3Rp
b24KPiBpbnRlcmNlcHRpbmcgdGhlIGluc3RydWN0aW9uLCBvciBmcm9tIHg4Nl9lbXVsYXRlKCkg
d2lsbCBoYXZlICVyaXAgdXBkYXRlZCBhcwo+IGEgY29uc2VxdWVuY2Ugb2YgcGFydGlhbCBlbXVs
YXRpb24gcmVxdWlyZWQgdG8gaW5qZWN0IGFuIElDRUJQIGV2ZW50IGluIHRoZQo+IGZpcnN0IHBs
YWNlLgo+IAo+IFdlIGNvdWxkIGluIHByaW5jaXBsZSBzcG90IHRoZSBub24taW5qZWN0ZWQgY2Fz
ZSBpbiB0aGUgVEFTS19TV0lUQ0ggaGFuZGxlciwKPiBidXQgdGhpcyBzdGlsbCByZXN1bHRzIGlu
IGNvbXBsZXhpdHkgaWYgdGhlIElDRUJQIGluc3RydWN0aW9uIGFsc28gaGFzIGFuCj4gSW5zdHJ1
Y3Rpb24gQnJlYWtwb2ludCBhY3RpdmUgb24gaXQgKHdoaWNoIGdlbnVpbmVseSBoYXMgZmF1bHQg
c2VtYW50aWNzKS4KPiAKPiBVbmNvbmRpdGlvbmFsbHkgaW50ZXJjZXB0IElDRUJQLiAgVGhpcyBk
b2VzIGhhdmUgYSB0cmFwIHNlbWFudGljcyBmb3IgdGhlCj4gaW50ZXJjZXB0LCBhbmQgYWxsb3dz
IHVzIHRvIG1vdmUgJXJpcCBmb3J3YXJkcyBhcHByb3ByaWF0ZWx5IGJlZm9yZSB0aGUKPiBUQVNL
X1NXSVRDSCBpbnRlcmNlcHQgaXMgaGl0LiAgVGhpcyBtYWtlcyB0aGUgYmVoYXZpb3VyIG9mICNE
Qi12ZWN0b3JlZAo+IHN3aXRjaGVzIGNvbnNpc3RlbnQgaG93ZXZlciB0aGUgSUNFQlAgI0RCIGNh
bWUgYWJvdXQsIGFuZCBhdm9pZHMgc3BlY2lhbCBjYXNlcwo+IGluIHRoZSBUQVNLX1NXSVRDSCBp
bnRlcmNlcHQuCj4gCj4gVGhpcyBpbiB0dXJuIGFsbG93cyBmb3IgdGhlIHJlbW92YWwgb2YgdGhl
IGNvbmRpdGlvbmFsCj4gaHZtX3NldF9pY2VicF9pbnRlcmNlcHRpb24oKSBsb2dpYyB1c2VkIGJ5
IHRoZSBtb25pdG9yIHN1YnN5c3RlbSwgYXMgSUNFQlAncwo+IHdpbGwgbm93IGFsd2F5cyBiZSBz
dWJtaXR0ZWQgZm9yIG1vbml0b3JpbmcgY2hlY2tzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpBRkFJQ1QgdGhpcyBicmluZ3MgQU1E
IGltcGxlbWVudGF0aW9uIGlubGluZSB3aXRoIEludGVsIHRoYXQgYWxzbyB3aWxsCnVuY29uZGl0
aW9uYWxseSB2bWV4aXQgb24gaWNlYnA/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
