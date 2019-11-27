Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8046110AEB5
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 12:31:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZvVr-0003Ey-K3; Wed, 27 Nov 2019 11:29:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eB6N=ZT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iZvVp-0003Er-Et
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 11:29:37 +0000
X-Inumbo-ID: 310d92ce-1109-11ea-b155-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 310d92ce-1109-11ea-b155-bc764e2007e4;
 Wed, 27 Nov 2019 11:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574854176;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BZc1lDlpClhVje60tyYPd+OARl7C5QD/WWHfGeyBuZs=;
 b=Ck8/h2GUkrj6luEQlp6FCJlHDa0c1gk6L0SCUQAZnnNS3hnO/4dwBtsf
 Ihwt+WnaNt05tjYQcCNkFh15RJg6ud+Jkai1dPV8EzCMIMzylM/7EDaLX
 +2swo1hpo+a3sEb2BzSvg1tobJHDutHLvYetcNCdjuaB6Ea5SsiP53UrA I=;
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
IronPort-SDR: 780hEUCwztExK3iUA5T96NLr0NSQFm0yx+CeIPx7MJvg5ot6c7U/1JuzEidP6mmJCprwWqsIgj
 2Hz2d0WHt5tL03KR6QCtMveFeUgqBs10EcQudqWlkIysO8vzskQrfGUGcVsKrXvZzBmfeWKFmD
 OS0Ad4wi7yeYk8Pc7VmlFgcS/O57VaQcIrAqRAh1mOqgindODgkO9nfpQRMzWydMkzLrpuvYYZ
 hSK+tK3Oag0Z6jPJ0hURLwZ5I5Wj8R7CHU9Uvy/wYSRHj0bMkbvBie2vyHbCVJf0fz76M4SS1S
 Vd8=
X-SBRS: 2.7
X-MesageID: 9257721
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,249,1571716800"; 
   d="scan'208";a="9257721"
Date: Wed, 27 Nov 2019 12:29:27 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191127112927.GQ980@Air-de-Roger>
References: <20191118101600.94645-1-roger.pau@citrix.com>
 <14ccf9a0-ecb4-6e09-6461-99f989353f34@suse.com>
 <20191118140302.GL72134@Air-de-Roger>
 <3e543cfd-d81a-1a4b-0268-7b121ae23c23@suse.com>
 <20191118145554.GN72134@Air-de-Roger>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D611FB5@SHSMSX104.ccr.corp.intel.com>
 <20191127110332.GN980@Air-de-Roger>
 <8b5eebe0-0f72-7dee-37a7-1b2b94e85e5d@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b5eebe0-0f72-7dee-37a7-1b2b94e85e5d@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/vmx: always sync PIR to IRR
 before vmentry
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Joe Jin <joe.jin@oracle.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMTI6MTY6MzdQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjcuMTEuMjAxOSAxMjowMywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBXZWQsIE5vdiAyNywgMjAxOSBhdCAwMjowNzoxNkFNICswMDAwLCBUaWFuLCBLZXZpbiB3cm90
ZToKPiA+PiBUaGVuIHdoYXQncyB0aGUgZGlmZmVyZW5jZSBmcm9tIG9yaWdpbmFsIGxvZ2ljPwo+
ID4gCj4gPiBUaGUgb3JpZ2luYWwgbG9naWMgaXM6Cj4gPiAKPiA+IGlmICggcnVubmluZyAmJiAo
aW5faXJxKCkgfHwgKHYgIT0gY3VycmVudCkpICkKPiA+IHsKPiA+ICAgICAgICAgdW5zaWduZWQg
aW50IGNwdSA9IHYtPnByb2Nlc3NvcjsKPiA+IAo+ID4gICAgICAgICBpZiAoIGNwdSAhPSBzbXBf
cHJvY2Vzc29yX2lkKCkgKQo+ID4gICAgICAgICAgICAgc2VuZF9JUElfbWFzayhjcHVtYXNrX29m
KGNwdSksIHBvc3RlZF9pbnRyX3ZlY3Rvcik7Cj4gPiAgICAgICAgIGVsc2UgaWYgKCAhc29mdGly
cV9wZW5kaW5nKGNwdSkgKQo+ID4gICAgICAgICAgICAgcmFpc2Vfc29mdGlycShWQ1BVX0tJQ0tf
U09GVElSUSk7Cj4gPiB9Cj4gPiAKPiA+IFdoaWNoIEkgZmluZCBtdWNoIGhhcmRlciB0byB1bmRl
cnN0YW5kLiBGb3IgZXhhbXBsZSBJJ20gbm90IHN1cmUgb2YKPiA+IHdoYXQncyB0aGUgYmVuZWZp
dCBvZiBkb2luZyB0aGUgY3B1ICE9IHNtcF9wcm9jZXNzb3JfaWQoKSBjaGVjawo+ID4gaW5zdGVh
ZCBvZiBzaW1wbHkgZG9pbmcgdiAhPSBjdXJyZW50IChsaWtlIGluIHRoZSBvdXRlciBpZiBjb25k
aXRpb24pLgo+IAo+IFRoZXJlIGFyZSB0d28gYXNwZWN0cyB0byBjb25zaWRlcjogT25lIGlzIHRo
YXQgdi0+cHJvY2Vzc29yCj4gbWF5IGVxdWFsIHNtcF9wcm9jZXNzb3JfaWQoKSBhbHNvIGZvciB2
ICE9IGN1cnJlbnQuIFRoZSBvdGhlcgo+IGlzIHRoYXQgd2l0aG91dCB0aGlzIGNoZWNrIGluIHRo
ZSBpZigpIGl0IHdvdWxkIG5lZWQgYWRkaW5nCj4gdG8gdGhlIGVsc2UtaWYoKS4gSSdtIG5vdCBz
dXJlIHRvIHdoYXQgZGVncmVlIHdoaWNoIG9mIHRoZQo+IHR3byBtYXR0ZXJzIGZ1bmN0aW9uYWxp
dHkgd2lzZS4KClNpbmNlIHRoZSB2Q1BVIGlzIHJ1bm5pbmcgdi0+cHJvY2Vzc29yIGNhbiBvbmx5
IGVxdWFsIHNtcF9wcm9jZXNzb3JfaWQKaWYgdiA9PSBjdXJyZW50LCBhbmQgaGVuY2UgSSB0aGlu
ayBib3RoIGNoZWNrcyBhY2hpZXZlIGV4YWN0bHkgdGhlCnNhbWUgZW5kIHJlc3VsdCwgaXQncyBq
dXN0IHRoYXQgSU1PIGRvaW5nIHRoZSBvdXRlciBvbmUgd2l0aCB2ICE9CmN1cnJlbnQgYW5kIHRo
ZSBpbm5lciBvbmUgd2l0aCBjcHUgIT0gc21wX3Byb2Nlc3Nvcl9pZCgpIGlzIGNvbmZ1c2luZy4K
Ck1heWJlIEknbSBtaXNzaW5nIHNvbWV0aGluZyBlbHNlIHRoYXQgYWN0dWFsbHkgcmVxdWlyZXMg
ZG9pbmcgdGhlCmlubmVyIGNoZWNrIHdpdGggdi0+cHJvY2Vzc29yIGFuZCBzbXBfcHJvY2Vzc29y
X2lkKCkuCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
