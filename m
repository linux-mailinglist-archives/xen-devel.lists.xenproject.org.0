Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD02B45840
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 11:09:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbiAH-0003Y4-7d; Fri, 14 Jun 2019 09:06:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5HGU=UN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hbiAF-0003Xz-LT
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 09:06:27 +0000
X-Inumbo-ID: ae983a04-8e83-11e9-94d5-c71745befd7d
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae983a04-8e83-11e9-94d5-c71745befd7d;
 Fri, 14 Jun 2019 09:06:23 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wB60pbv3sh/Y4rmSwBQJy/NGO8h3BI+puUNmuGP//fTLBZDBw6ffU18+IjxmQ8f5e6RpfqBl/L
 drDT2u8m8zJoETrff0l4xaKp9+xu+vXcdkCAscEV7GfXc6JQmrvX0T66gbidprQq2LEdAO6Pf7
 q0LJT3GEGjzCOCH0hQldiFGCMlJfgTTuDgTJkfJ7PcysmYO47La/EtBYvaI9A+7YUG5Y9yXpKc
 63pBlsRNtn462Y2QZRK8od7C9ASI2WGhv0L1SOWtD+dbM0E4Ulg+VYMMxDsiMZSClBHmk8s9JI
 iPI=
X-SBRS: 2.7
X-MesageID: 1741547
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,372,1557201600"; 
   d="scan'208";a="1741547"
Date: Fri, 14 Jun 2019 11:06:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190614090615.ywfm45lm3qvngo64@Air-de-Roger>
References: <20190607092232.83179-1-roger.pau@citrix.com>
 <20190607092232.83179-10-roger.pau@citrix.com>
 <5D025F630200007800237F41@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5D025F630200007800237F41@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 09/13] pci: switch pci_conf_read32 to use
 pci_sbdf_t
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDg6MzY6MTlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA3LjA2LjE5IGF0IDExOjIyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gQEAgLTgxNyw3ICs4MTEsNyBAQCBzdGF0aWMgdTY0IHJlYWRfcGNpX21lbV9iYXIo
dTE2IHNlZywgdTggYnVzLCB1OCBzbG90LCB1OCBmdW5jLCB1OCBiaXIsIGludCB2ZikKPiA+ICAg
ICAgICAgIGlmICggKytiaXIgPj0gbGltaXQgKQo+ID4gICAgICAgICAgICAgIHJldHVybiAwOwo+
ID4gICAgICAgICAgcmV0dXJuIGFkZHIgKyBkaXNwICsKPiA+IC0gICAgICAgICAgICAgICAoKHU2
NClwY2lfY29uZl9yZWFkMzIoc2VnLCBidXMsIHNsb3QsIGZ1bmMsCj4gPiArICAgICAgICAgICAg
ICAgKCh1NjQpcGNpX2NvbmZfcmVhZDMyKFBDSV9TQkRGKHNlZywgYnVzLCBzbG90LCBmdW5jKSwK
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmFzZSArIGJpciAqIDQp
IDw8IDMyKTsKPiAKPiBOb3QgdGFraW5nIHRoZSBvcHBvcnR1bml0eSB0byBzd2l0Y2ggdG8gdWlu
dDY0X3QgaGVyZSwgbGlrZSB5b3UgZG8KPiBlbHNld2hlcmU/Cj4gCj4gPiBAQCAtNzUwLDcgKzc0
Nyw3IEBAIGludCBwY2lfYWRkX2RldmljZSh1MTYgc2VnLCB1OCBidXMsIHU4IGRldmZuLAo+ID4g
ICAgICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgUENJX1NSSU9WX05VTV9CQVJTOyApCj4gPiAg
ICAgICAgICAgICAgewo+ID4gICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgaWR4ID0gcG9z
ICsgUENJX1NSSU9WX0JBUiArIGkgKiA0Owo+ID4gLSAgICAgICAgICAgICAgICB1MzIgYmFyID0g
cGNpX2NvbmZfcmVhZDMyKHNlZywgYnVzLCBzbG90LCBmdW5jLCBpZHgpOwo+ID4gKyAgICAgICAg
ICAgICAgICB1MzIgYmFyID0gcGNpX2NvbmZfcmVhZDMyKHBkZXYtPnNiZGYsIGlkeCk7Cj4gCj4g
U2ltaWxhcmx5IGhlcmUuCgpTb3JyeSwgSSB0cmllZCB0byBmaXggdGhlIHN1cnJvdW5kaW5nIGlz
c3VlcyB3aGVuIHRvdWNoaW5nIHRoZSBjb2RlLApidXQgc29tZSBvZiB0aG9zZSBzbGlwcGVkLiBX
aWxsIGZpeCBpbiBuZXh0IHZlcnNpb24uCgo+ID4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvdnRkL3F1aXJrcy5jCj4gPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvcXVp
cmtzLmMKPiA+IEBAIC0xMjgsOSArMTI4LDExIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBtYXBfaWdk
X3JlZyh2b2lkKQo+ID4gICAgICBpZiAoIGlnZF9yZWdfdmEgKQo+ID4gICAgICAgICAgcmV0dXJu
Owo+ID4gIAo+ID4gLSAgICBpZ2RfbW1pbyAgID0gcGNpX2NvbmZfcmVhZDMyKDAsIDAsIElHRF9E
RVYsIDAsIFBDSV9CQVNFX0FERFJFU1NfMSk7Cj4gPiArICAgIGlnZF9tbWlvICAgPSBwY2lfY29u
Zl9yZWFkMzIoUENJX1NCREYoMCwgMCwgSUdEX0RFViwgMCksCj4gCj4gQWZhaWN0IGF0IHRoaXMg
cG9pbnQgYWxsIHVzZXMgb2YgSUdEX0RFViBhcmUgaW4gY29uc3RydWN0cyBsaWtlIHRoaXMgb25l
Lgo+IEFzIHByZXZpb3VzbHkgc2F5LCBJIHRoaW5rIElHRF9ERVYgaXRzZWxmIHdvdWxkIG5vdyBi
ZXR0ZXIgYmVjb21lIGFuCj4gaW52b2NhdGlvbiBvZiBQQ0lfU0JERigpLiBTYW1lIGZvciBJT0hf
REVWIHRoZW4uCgpJcyBpdCBmaW5lIHRvIGRvIHRoaXMgYXMgYSBmb2xsb3d1cCBwYXRjaD8KCk9y
IGVsc2UgSSB3b3VsZCBhbHNvIGhhdmUgdG8gbW9kaWZ5IHRoZSBwY2lfY29uZl9yZWFkezgsMTZ9
IGNhbGxzIHRoYXQKdXNlIElHRF9ERVYgb3IgSU9IX0RFViBpbiB0aGlzIHBhdGNoLgoKVGhhbmtz
LCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
