Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCF6AEBAB
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 15:36:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7gGr-0000UV-Kt; Tue, 10 Sep 2019 13:33:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G+U8=XF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i7gGq-0000UN-1U
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 13:33:24 +0000
X-Inumbo-ID: 8f560176-d3cf-11e9-b299-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f560176-d3cf-11e9-b299-bc764e2007e4;
 Tue, 10 Sep 2019 13:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568122404;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jmx0j0By+uSgciTbsZJj81v5jvtmP/r0E2dTbZ3t7Os=;
 b=Tfr67CkTErXja39EHV6Pmogbhs4iH2NqLa/vo2mT0mYloe/xGpVlrwBP
 DM3eITCanpZTMhcC/XDVVgswne2TaiGD5nOJUBAGL3ifIBJ8IukIiLWIj
 D/l1EGQuUfiLL5txofOLkAfDUZrwUb+HSs2byuU4fRgzoelren91xwTif 8=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YvgmgHnQFO0jFRODVCixQT+J2wM2fI9snY526uiakssvktsD5lT1d+YtS461FA+kyLx8h2UzAn
 DpDIVlYypBinLgZ1C0h18Yzv0YgRH5dEA58Nt2mx8qrEjqSnF69tVAg5b8Y4TD/POdKyUrLSt2
 xAgF9wUnf5fnpAqCQVMet049Efah1KkDrzNI8Po9tSylNfuahuZI/OYJh/Pra7qbH7ar2xzOV1
 rM1ov2na3Gl5fyI9sZY88byjWsdP+e6XnST12hdFyuRxX1X3JQ0Jowsbp3Sx7d5ykIQ+xZZJuQ
 T7M=
X-SBRS: 2.7
X-MesageID: 5371185
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5371185"
Date: Tue, 10 Sep 2019 15:33:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190910133315.i35z5jfmbxwl4kyi@Air-de-Roger>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-2-roger.pau@citrix.com>
 <7a37466e-4bb8-2358-f940-42aa5426bdcb@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7a37466e-4bb8-2358-f940-42aa5426bdcb@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 01/11] ioreq: fix
 hvm_all_ioreq_servers_add_vcpu fail path cleanup
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul.durrant@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMDM6Mjg6NTdQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDMuMDkuMjAxOSAxODoxNCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gLS0t
IGEveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2lv
cmVxLmMKPiA+IEBAIC0xMTk1LDcgKzExOTUsNyBAQCBpbnQgaHZtX2FsbF9pb3JlcV9zZXJ2ZXJz
X2FkZF92Y3B1KHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB2Y3B1ICp2KQo+ID4gICAgICByZXR1
cm4gMDsKPiA+ICAKPiA+ICAgZmFpbDoKPiA+IC0gICAgd2hpbGUgKCBpZC0tICE9IDAgKQo+ID4g
KyAgICB3aGlsZSAoIGlkKysgIT0gTUFYX05SX0lPUkVRX1NFUlZFUlMgKQo+ID4gICAgICB7Cj4g
PiAgICAgICAgICBzID0gR0VUX0lPUkVRX1NFUlZFUihkLCBpZCk7Cj4gCj4gV2l0aCBQYXVsJ3Mg
Ui1iIEkgd2FzIGFib3V0IHRvIGNvbW1pdCB0aGlzLCBidXQgZG9lc24ndCB0aGlzCj4gbmVlZCB0
byBiZSArK2lkPyAoSWYgc28sIEknbGwgYmUgaGFwcHkgdG8gZml4IHdoaWxlIGNvbW1pdHRpbmcu
KQoKVGhlIGluY3JlbWVudCBpcyBhbHJlYWR5IGRvbmUgaW4gdGhlIGxvb3AgY29uZGl0aW9uLgoK
VGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
