Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DFC6AAE6
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 16:51:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnOkt-0002Cp-30; Tue, 16 Jul 2019 14:48:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DxGA=VN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hnOkr-0002Ck-Mq
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 14:48:33 +0000
X-Inumbo-ID: c622777a-a7d8-11e9-82d8-a79fcdccfb38
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c622777a-a7d8-11e9-82d8-a79fcdccfb38;
 Tue, 16 Jul 2019 14:48:29 +0000 (UTC)
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
IronPort-SDR: v10QZc8agaCjWFFTavyxQLG/qhyHdIX4FwEk7sV9N1hDjgjKfDeLh7u9TaGhcXC/A2auPb3RGX
 AqGjwGqeg0qx9GQFcywYphsoe49U8waL6TP1cfFNNMvr74hsJQZC6jRLzDiuVKTbi1f2UN+Caz
 UuuLztt4Igff3qT4I3J/R9zK8xRouvp6xBRx2CilJBCaEsq9CKGOUEHe/VS732u8xk509IWABn
 VTUCt5sF27QYvezFYtJLIP1BZ8ovZcmlq2VbVuGSXdVxYNqx94+JcnPF/8RgmviOlBKd4PYEV/
 BSo=
X-SBRS: 2.7
X-MesageID: 3020827
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,498,1557201600"; 
   d="scan'208";a="3020827"
Date: Tue, 16 Jul 2019 16:48:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190716144820.fgyplo5gnoishlfj@Air-de-Roger.citrite.net>
References: <0dbf8520-89c7-753e-c10a-13399aec9cd5@suse.com>
 <b5b7560a-2418-9df7-2062-3ba1f6f0152f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b5b7560a-2418-9df7-2062-3ba1f6f0152f@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 4/5] x86: allow limiting the max C-state
 sub-state
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDE6MDM6MDJQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gRnJvbTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+Cj4g
Cj4gQWxsb3cgbGltaXRpbmcgdGhlIG1heCBDLXN0YXRlIHN1Yi1zdGF0ZSBieSBhcHBlbmRpbmcg
dG8gdGhlIG1heF9jc3RhdGUKPiBjb21tYW5kLWxpbmUgcGFyYW1ldGVyLiBFLmcuIG1heF9jc3Rh
dGU9MSwwCj4gVGhlIGxpbWl0IG9ubHkgYXBwbGllcyB0byB0aGUgaGlnaGVzdCBsZWdhbCBDLXN0
YXRlLiBGb3IgZXhhbXBsZToKPiAgIG1heF9jc3RhdGUgPSAxLCBtYXhfY3N1YnN0YXRlID0gMCA9
PT4gQzAsIEMxIG9rYXksIGJ1dCBub3QgQzFFCj4gICBtYXhfY3N0YXRlID0gMSwgbWF4X2NzdWJz
dGF0ZSA9IDEgPT0+IEMwLCBDMSBhbmQgQzFFIG9rYXksIGJ1dCBub3QgQzIKPiAgIG1heF9jc3Rh
dGUgPSAyLCBtYXhfY3N1YnN0YXRlID0gMCA9PT4gQzAsIEMxLCBDMUUsIEMyIG9rYXksIGJ1dCBu
b3QgQzMKPiAgIG1heF9jc3RhdGUgPSAyLCBtYXhfY3N1YnN0YXRlID0gMSA9PT4gQzAsIEMxLCBD
MUUsIEMyIG9rYXksIGJ1dCBub3QgQzMKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb3NzIExhZ2Vyd2Fs
bCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Cj4gLS0tCj4gdjI6IEV4cGxpY2l0bHkgbG9nICJ1bmxpbWl0
ZWQiLiBQYXNzIE5VTEwgaW4gdGhlIDJuZCBzaW1wbGVfc3RydG91bCgpCj4gICAgICBpbnZvY2F0
aW9uLgo+IAo+IC0tLSBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYwo+ICsrKyBi
L2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYwo+IEBAIC0xMzc0LDkgKzEzNzQsMTEg
QEAgU3BlY2lmeSB0aGUgbWF4aW11bSBudW1iZXIgb2YgQ1BVcyB0aGF0Cj4gICBUaGlzIG9wdGlv
biBpcyBpZ25vcmVkIGluICoqcHYtc2hpbSoqIG1vZGUuCj4gICAKPiAgICMjIyBtYXhfY3N0YXRl
ICh4ODYpCj4gLT4gYD0gPGludGVnZXI+YAo+ICs+IGA9IDxpbnRlZ2VyPlssPGludGVnZXI+XWAK
PiAgIAo+IC1TcGVjaWZ5IHRoZSBkZWVwZXN0IEMtc3RhdGUgQ1BVcyBhcmUgcGVybWl0dGVkIHRv
IGJlIHBsYWNlZCBpbi4KPiArU3BlY2lmeSB0aGUgZGVlcGVzdCBDLXN0YXRlIENQVXMgYXJlIHBl
cm1pdHRlZCB0byBiZSBwbGFjZWQgaW4sIGFuZAo+ICtvcHRpb25hbGx5IHRoZSBtYXhpbXVtIHN1
YiBDLXN0YXRlIHRvIGJlIHVzZWQgdXNlZC4gIFRoZSBsYXR0ZXIgb25seSBhcHBsaWVzCj4gK3Rv
IHRoZSBoaWdoZXN0IHBlcm1pdHRlZCBDLXN0YXRlLgo+ICAgCj4gICAjIyMgbWF4X2dzaV9pcnFz
ICh4ODYpCj4gICA+IGA9IDxpbnRlZ2VyPmAKPiAtLS0gYS94ZW4vYXJjaC94ODYvYWNwaS9jcHVf
aWRsZS5jCj4gKysrIGIveGVuL2FyY2gveDg2L2FjcGkvY3B1X2lkbGUuYwo+IEBAIC0xMDQsNyAr
MTA0LDE3IEBAIGJvb2wgbGFwaWNfdGltZXJfaW5pdCh2b2lkKQo+ICAgCj4gICB2b2lkICgqX19y
ZWFkX21vc3RseSBwbV9pZGxlX3NhdmUpKHZvaWQpOwo+ICAgdW5zaWduZWQgaW50IG1heF9jc3Rh
dGUgX19yZWFkX21vc3RseSA9IFVJTlRfTUFYOwo+IC1pbnRlZ2VyX3BhcmFtKCJtYXhfY3N0YXRl
IiwgbWF4X2NzdGF0ZSk7Cj4gK3Vuc2lnbmVkIGludCBtYXhfY3N1YnN0YXRlIF9fcmVhZF9tb3N0
bHkgPSBVSU5UX01BWDsKPiArCj4gK3N0YXRpYyBpbnQgX19pbml0IHBhcnNlX2NzdGF0ZShjb25z
dCBjaGFyICpzKQo+ICt7Cj4gKyAgICBtYXhfY3N0YXRlID0gc2ltcGxlX3N0cnRvdWwocywgJnMs
IDApOwo+ICsgICAgaWYgKCAqcyA9PSAnLCcgKQo+ICsgICAgICAgIG1heF9jc3Vic3RhdGUgPSBz
aW1wbGVfc3RydG91bChzICsgMSwgTlVMTCwgMCk7Cj4gKyAgICByZXR1cm4gMDsKPiArfQo+ICtj
dXN0b21fcGFyYW0oIm1heF9jc3RhdGUiLCBwYXJzZV9jc3RhdGUpOwo+ICsKPiAgIHN0YXRpYyBi
b29sIF9fcmVhZF9tb3N0bHkgbG9jYWxfYXBpY190aW1lcl9jMl9vazsKPiAgIGJvb2xlYW5fcGFy
YW0oImxhcGljX3RpbWVyX2MyX29rIiwgbG9jYWxfYXBpY190aW1lcl9jMl9vayk7Cj4gICAKPiBA
QCAtMzQ3LDcgKzM1NywxMyBAQCBzdGF0aWMgdm9pZCBkdW1wX2N4KHVuc2lnbmVkIGNoYXIga2V5
KQo+ICAgCj4gICAgICAgcHJpbnRrKCInJWMnIHByZXNzZWQgLT4gcHJpbnRpbmcgQUNQSSBDeCBz
dHJ1Y3R1cmVzXG4iLCBrZXkpOwo+ICAgICAgIGlmICggbWF4X2NzdGF0ZSA8IFVJTlRfTUFYICkK
PiArICAgIHsKPiAgICAgICAgICAgcHJpbnRrKCJtYXggc3RhdGU6IEMldVxuIiwgbWF4X2NzdGF0
ZSk7Cj4gKyAgICAgICAgaWYgKCBtYXhfY3N1YnN0YXRlIDwgVUlOVF9NQVggKQo+ICsgICAgICAg
ICAgICBwcmludGsoIm1heCBzdWItc3RhdGU6ICV1XG4iLCBtYXhfY3N1YnN0YXRlKTsKPiArICAg
ICAgICBlbHNlCj4gKyAgICAgICAgICAgIHByaW50aygibWF4IHN1Yi1zdGF0ZTogdW5saW1pdGVk
XG4iKTsKPiArICAgIH0KPiAgICAgICBlbHNlCj4gICAgICAgICAgIHByaW50aygibWF4IHN0YXRl
OiB1bmxpbWl0ZWRcbiIpOwo+ICAgICAgIGZvcl9lYWNoX3ByZXNlbnRfY3B1ICggY3B1ICkKPiBA
QCAtNTkyLDcgKzYwOCwxMyBAQCBzdGF0aWMgdm9pZCBhY3BpX3Byb2Nlc3Nvcl9pZGxlKHZvaWQp
Cj4gICAKPiAgICAgICAgICAgZG8gewo+ICAgICAgICAgICAgICAgY3ggPSAmcG93ZXItPnN0YXRl
c1tuZXh0X3N0YXRlXTsKPiAtICAgICAgICB9IHdoaWxlICggY3gtPnR5cGUgPiBtYXhfc3RhdGUg
JiYgLS1uZXh0X3N0YXRlICk7Cj4gKyAgICAgICAgfSB3aGlsZSAoIChjeC0+dHlwZSA+IG1heF9z
dGF0ZSB8fAo+ICsgICAgICAgICAgICAgICAgICAgY3gtPmVudHJ5X21ldGhvZCA9PSBBQ1BJX0NT
VEFURV9FTV9OT05FIHx8Cj4gKyAgICAgICAgICAgICAgICAgICAoY3gtPmVudHJ5X21ldGhvZCA9
PSBBQ1BJX0NTVEFURV9FTV9GRkggJiYKPiArICAgICAgICAgICAgICAgICAgICBjeC0+dHlwZSA9
PSBtYXhfY3N0YXRlICYmCj4gKyAgICAgICAgICAgICAgICAgICAgKGN4LT5hZGRyZXNzICYgTVdB
SVRfU1VCU1RBVEVfTUFTSykgPiBtYXhfY3N1YnN0YXRlKSkgJiYKPiArICAgICAgICAgICAgICAg
ICAgLS1uZXh0X3N0YXRlICk7Cj4gKyAgICAgICAgICAgIGN4ID0gJnBvd2VyLT5zdGF0ZXNbbmV4
dF9zdGF0ZV07CgpJcyB0aGUgbGluZSBhYm92ZSBhIHN0cmF5IGFkZGl0aW9uPyBJdCBpcyBhdCBs
ZWFzdCBub3QgcHJvcGVybHkKYWxpZ25lZCBBRkFJQ1QuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
