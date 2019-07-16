Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4359F6AAA1
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 16:31:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnOQ8-0000oO-0F; Tue, 16 Jul 2019 14:27:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DxGA=VN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hnOQ6-0000oJ-Ai
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 14:27:06 +0000
X-Inumbo-ID: c65016d8-a7d5-11e9-ac9f-1f3b119cb7ca
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c65016d8-a7d5-11e9-ac9f-1f3b119cb7ca;
 Tue, 16 Jul 2019 14:27:01 +0000 (UTC)
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
IronPort-SDR: 7qPyYDr3Hcm7E4vXU8Fepim/lQ1gX4ifY4BE2WmhdY9dnmaIMXWwBVHKh8NgPB2YrG7meewNo8
 LGkrjHpyl6+yrhCkYQpTloqX/x/CJXU8VEtMHI8QP1xH6POy/xvv0Kcie15KaCUhWL0rMxUwX+
 23talfjFMHfiYTXKM1VlxHwuZiIDYAGX7eD1d1iZJ0ufg13J3AMi/HKuM7fpax6a1ZY6YbPFPG
 khXX0D6ZfR/viLjiTaAH/8qq2cirN2A9kLi6j/GsD1kqPt4Y5DPvQbLRFBYiazUb++Ecm4s9JN
 +e8=
X-SBRS: 2.7
X-MesageID: 3082160
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,498,1557201600"; 
   d="scan'208";a="3082160"
Date: Tue, 16 Jul 2019 16:26:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190716142632.zallvho5vor4ug75@Air-de-Roger.citrite.net>
References: <0dbf8520-89c7-753e-c10a-13399aec9cd5@suse.com>
 <7e5fba10-b957-81ed-a1d8-d4c7447f0d51@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e5fba10-b957-81ed-a1d8-d4c7447f0d51@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 3/5] x86/AMD: make C-state handling
 independent of Dom0
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Brian Woods <brian.woods@amd.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDE6MDE6NDhQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gQXQgbGVhc3QgZm9yIG1vcmUgcmVjZW50IENQVXMsIGZvbGxvd2luZyB3aGF0IEJLREcg
LyBQUFIgc3VnZ2VzdCBmb3IgdGhlCj4gQklPUyB0byBzdXJmYWNlIHZpYSBBQ1BJIHdlIGNhbiBt
YWtlIG91cnNlbHZlcyBpbmRlcGVuZGVudCBvZiBEb20wCj4gdXBsb2FkaW5nIHJlc3BlY3RpdmUg
ZGF0YS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
Cj4gLS0tCj4gdjI6IEhhbmRsZSBIeWdvbiBGYW0xOC4gU2V0IGxvY2FsX2FwaWNfdGltZXJfYzJf
b2sgKGZvciBGYW0xNyBhbmQgSHlnb24KPiAgICAgIEZhbTE4IG9ubHkgZm9yIG5vdykuCj4gLS0t
Cj4gVEJEOiBXZSBtYXkgd2FudCB0byB2ZXJpZnkgdGhhdCBITFQgaW5kZWVkIGlzIGNvbmZpZ3Vy
ZWQgdG8gZW50ZXIgQ0M2Lgo+IFRCRDogQnJpYW4ncyBzZXJpZXMgc3BlY2lmaWVzIC50YXJnZXRf
cmVzaWRlbmN5IGFzIDEwMDAgZm9yIENDNjsgbWF5Cj4gICAgICAgd2FudCB0byBkbyBzbyBoZXJl
IGFzIHdlbGwuIFF1ZXN0aW9uIHRoZW4gaXMgd2hldGhlciB0aGlzIHZhbHVlIGlzCj4gICAgICAg
YWxzbyBzdWl0YWJsZSBmb3IgdGhlIG9sZGVyIGZhbWlsaWVzLgo+IFRCRDogSSBndWVzcyB3ZSBj
b3VsZCBleHRlbmQgdGhpcyB0byBmYW1pbGllcyBvbGRlciB0aGVuIEZhbTE1IGFzIHdlbGwuCj4g
Cj4gLS0tIGEveGVuL2FyY2gveDg2L2FjcGkvY3B1X2lkbGUuYwo+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9hY3BpL2NwdV9pZGxlLmMKPiBAQCAtMTEwLDYgKzExMCw4IEBAIGJvb2xlYW5fcGFyYW0oImxh
cGljX3RpbWVyX2MyX29rIiwgbG9jYWwKPiAgIAo+ICAgc3RydWN0IGFjcGlfcHJvY2Vzc29yX3Bv
d2VyICpfX3JlYWRfbW9zdGx5IHByb2Nlc3Nvcl9wb3dlcnNbTlJfQ1BVU107Cj4gICAKPiArc3Rh
dGljIGludDhfdCBfX3JlYWRfbW9zdGx5IHZlbmRvcl9vdmVycmlkZTsKCkFGQUlDVCBmcm9tIHRo
ZSBjb2RlIGJlbG93IHRoaXMgaXMgYSB0cmktc3RhdGUgKC0xLCAwLCAxKS4gQ291bGQgaXQKbWF5
YmUgYmUgdHVybmVkIGludG8gYW4gZW51bSB3aXRoIGRlZmluaXRpb25zIG9mIHRoZSBkaWZmZXJl
bnQKc3RhdGVzPwoKSSB0aGluayBpdCB3b3VsZCBtYWtlIHRoZSB1c2FnZSBjbGVhcmVyLgoKPiAr
Cj4gICBzdHJ1Y3QgaHdfcmVzaWRlbmNpZXMKPiAgIHsKPiAgICAgICB1aW50NjRfdCBtYzA7Cj4g
QEAgLTEyMTQsNiArMTIxNiw5IEBAIGxvbmcgc2V0X2N4X3BtaW5mbyh1aW50MzJfdCBhY3BpX2lk
LCBzdHIKPiAgICAgICBpZiAoIHBtX2lkbGVfc2F2ZSAmJiBwbV9pZGxlICE9IGFjcGlfcHJvY2Vz
c29yX2lkbGUgKQo+ICAgICAgICAgICByZXR1cm4gMDsKPiAgIAo+ICsgICAgaWYgKCB2ZW5kb3Jf
b3ZlcnJpZGUgPiAwICkKPiArICAgICAgICByZXR1cm4gMDsKPiArCj4gICAgICAgcHJpbnRfY3hf
cG1pbmZvKGFjcGlfaWQsIHBvd2VyKTsKPiAgIAo+ICAgICAgIGNwdV9pZCA9IGdldF9jcHVfaWQo
YWNwaV9pZCk7Cj4gQEAgLTEyODYsNiArMTI5MSwxMDMgQEAgbG9uZyBzZXRfY3hfcG1pbmZvKHVp
bnQzMl90IGFjcGlfaWQsIHN0cgo+ICAgICAgIHJldHVybiAwOwo+ICAgfQo+ICAgCj4gK3N0YXRp
YyB2b2lkIGFtZF9jcHVpZGxlX2luaXQoc3RydWN0IGFjcGlfcHJvY2Vzc29yX3Bvd2VyICpwb3dl
cikKPiArewo+ICsgICAgdW5zaWduZWQgaW50IGksIG5yID0gMDsKPiArICAgIGNvbnN0IHN0cnVj
dCBjcHVpbmZvX3g4NiAqYyA9ICZjdXJyZW50X2NwdV9kYXRhOwo+ICsgICAgY29uc3QgdW5zaWdu
ZWQgaW50IGVjeF9yZXEgPSBDUFVJRDVfRUNYX0VYVEVOU0lPTlNfU1VQUE9SVEVEIHwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQ1BVSUQ1X0VDWF9JTlRFUlJVUFRfQlJFQUs7
Cj4gKyAgICBjb25zdCBzdHJ1Y3QgYWNwaV9wcm9jZXNzb3JfY3ggKmN4ID0gTlVMTDsKPiArICAg
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgYWNwaV9wcm9jZXNzb3JfY3ggZmFtMTdbXSA9IHsKPiArICAg
ICAgICB7Cj4gKyAgICAgICAgICAgIC50eXBlID0gQUNQSV9TVEFURV9DMSwKPiArICAgICAgICAg
ICAgLmVudHJ5X21ldGhvZCA9IEFDUElfQ1NUQVRFX0VNX0ZGSCwKPiArICAgICAgICAgICAgLmFk
ZHJlc3MgPSAwLAoKYWRkcmVzcyBmaWVsZCB3aWxsIGFscmVhZHkgZ2V0IHNldCB0byAwIGJ5IGRl
ZmF1bHQuCgo+ICsgICAgICAgICAgICAubGF0ZW5jeSA9IDEsCj4gKyAgICAgICAgfSwKPiArICAg
ICAgICB7Cj4gKyAgICAgICAgICAgIC50eXBlID0gQUNQSV9TVEFURV9DMiwKPiArICAgICAgICAg
ICAgLmVudHJ5X21ldGhvZCA9IEFDUElfQ1NUQVRFX0VNX0hBTFQsCj4gKyAgICAgICAgICAgIC5s
YXRlbmN5ID0gNDAwLAoKTWF5YmUgdGhlIGxhdGVuY3kgdmFsdWVzIGNvdWxkIGJlIGFkZGVkIHRv
IGNwdWlkbGUuaCBhcyBkZWZpbmVzPwoKPiArICAgICAgICB9LAo+ICsgICAgfTsKPiArCj4gKyAg
ICBpZiAoIHBtX2lkbGVfc2F2ZSAmJiBwbV9pZGxlICE9IGFjcGlfcHJvY2Vzc29yX2lkbGUgKQo+
ICsgICAgICAgIHJldHVybjsKPiArCj4gKyAgICBpZiAoIHZlbmRvcl9vdmVycmlkZSA8IDAgKQo+
ICsgICAgICAgIHJldHVybjsKPiArCj4gKyAgICBzd2l0Y2ggKCBjLT54ODYgKQo+ICsgICAgewo+
ICsgICAgY2FzZSAweDE4Ogo+ICsgICAgICAgIGlmICggYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9y
ICE9IFg4Nl9WRU5ET1JfSFlHT04gKQo+ICsgICAgICAgIHsKPiArICAgIGRlZmF1bHQ6Cj4gKyAg
ICAgICAgICAgIHZlbmRvcl9vdmVycmlkZSA9IC0xOwo+ICsgICAgICAgICAgICByZXR1cm47Cj4g
KyAgICAgICAgfQo+ICsgICAgICAgIC8qIGZhbGwgdGhyb3VnaCAqLwo+ICsgICAgY2FzZSAweDE3
Ogo+ICsgICAgICAgIGlmICggY3B1X2hhc19tb25pdG9yICYmIGMtPmNwdWlkX2xldmVsID49IENQ
VUlEX01XQUlUX0xFQUYgJiYKPiArICAgICAgICAgICAgIChjcHVpZF9lY3goQ1BVSURfTVdBSVRf
TEVBRikgJiBlY3hfcmVxKSA9PSBlY3hfcmVxICkKPiArICAgICAgICB7Cj4gKyAgICAgICAgICAg
IGN4ID0gZmFtMTc7Cj4gKyAgICAgICAgICAgIG5yID0gQVJSQVlfU0laRShmYW0xNyk7Cj4gKyAg
ICAgICAgICAgIGxvY2FsX2FwaWNfdGltZXJfYzJfb2sgPSB0cnVlOwo+ICsgICAgICAgICAgICBi
cmVhazsKPiArICAgICAgICB9Cj4gKyAgICAgICAgLyogZmFsbCB0aHJvdWdoICovCj4gKyAgICBj
YXNlIDB4MTU6Cj4gKyAgICBjYXNlIDB4MTY6Cj4gKyAgICAgICAgY3ggPSAmZmFtMTdbMV07Cj4g
KyAgICAgICAgbnIgPSBBUlJBWV9TSVpFKGZhbTE3KSAtIDE7Cj4gKyAgICAgICAgYnJlYWs7Cj4g
KyAgICB9Cj4gKwo+ICsgICAgcG93ZXItPmZsYWdzLmhhc19jc3QgPSB0cnVlOwo+ICsKPiArICAg
IGZvciAoIGkgPSAwOyBpIDwgbnI7ICsraSApCj4gKyAgICB7Cj4gKyAgICAgICAgaWYgKCBjeFtp
XS50eXBlID4gbWF4X2NzdGF0ZSApCj4gKyAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgIHBv
d2VyLT5zdGF0ZXNbaSArIDFdID0gY3hbaV07Cj4gKyAgICAgICAgcG93ZXItPnN0YXRlc1tpICsg
MV0uaWR4ID0gaSArIDE7Cj4gKyAgICAgICAgcG93ZXItPnN0YXRlc1tpICsgMV0udGFyZ2V0X3Jl
c2lkZW5jeSA9IGN4W2ldLmxhdGVuY3kgKiBsYXRlbmN5X2ZhY3RvcjsKCllvdSBjb3VsZCBzZXQg
dGFyZ2V0X3Jlc2lkZW5jeSBhcyBwYXJ0IG9mIHRoZSBpbml0aWFsaXphdGlvbiwgYnV0IEkKZ3Vl
c3MgbGF0ZW5jeV9mYWN0b3IgYmVpbmcgbm9uLWNvbnN0IHRoYXQgd291bGQgbW92ZSBmYW0xNyBv
dXRzaWRlIG9mCi5yb2RhdGE/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
