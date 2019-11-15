Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 601CAFE3AC
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 18:10:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVf5i-0000ty-4W; Fri, 15 Nov 2019 17:09:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ISM0=ZH=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iVf5g-0000ts-Mz
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 17:09:00 +0000
X-Inumbo-ID: 9d56f616-07ca-11ea-9631-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d56f616-07ca-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 17:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573837739;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=hSDK6MEjs3SohT/Y/p5spfyBBm1AQp3v0oGBX71asIg=;
 b=PIyG21jwjeU3RoO0104K8bhyPvxTZYEEH5219sGeZOwRDTciqJjPHj8M
 O3z3iMEr9MbUrxhX1ruiJp4KZH3GF/xdbOITjxuCsvc0HDIlqMmWQf8nk
 6FaOpi+2wlIaLkju1LLQQmbU4th2GTdwMqNKXAx4K4Ya7oWDm8FfrNelr 0=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8UuvIqbBuafaVtp73ICjMqm4tPAgUqwT/mo07y1KH2HSv2tLLF1qc5K70YN/qp4xLa0mnmQime
 sit3IelJAT+p2+msoIb5+o7C8yzuEtujSVcd+/TNEnntba8J6U29+nnXz+vADkNgyfcOv/iSwc
 Vai8Qz/iSJOmYtO5s8dpew0GK1mHac4S7h4ky6+7Y4G5LS6R6f/lyHNCb8arJBOE43NBQj8mqW
 4uBx58hsjEBgMSJ7Vw7cS/enH5i4nsDN2DXKN+afRc3VMWX53gEKKMGbkjSqdBwJsPWR+e57xm
 Bw4=
X-SBRS: 2.7
X-MesageID: 8751199
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,308,1569297600"; 
   d="scan'208";a="8751199"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24014.56227.95184.373732@mariner.uk.xensource.com>
Date: Fri, 15 Nov 2019 17:08:51 +0000
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191030180704.261320-7-anthony.perard@citrix.com>
References: <20191030180704.261320-1-anthony.perard@citrix.com>
 <20191030180704.261320-7-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 6/6] libxl_qmp: Have a lock
 for QMP socket access
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Sander Eikelenboom <linux@eikelenboom.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1hFTiBQQVRDSCBmb3ItNC4xMyB2MiA2LzZdIGxpYnhs
X3FtcDogSGF2ZSBhIGxvY2sgZm9yIFFNUCBzb2NrZXQgYWNjZXNzIik6Cj4gQmFja2dyb3VuZDoK
PiAgICAgVGhpcyBoYXBwZW5zIHdoZW4gYXR0ZW1wdGluZyB0byBjcmVhdGUgYSBndWVzdCB3aXRo
IG11bHRpcGxlCj4gICAgIHBjaSBkZXZpY2VzIHBhc3N0aHJvdWdoLCBsaWJ4bCBjcmVhdGVzIG9u
ZSBjb25uZWN0aW9uIHBlciBkZXZpY2UgdG8KPiAgICAgYXR0YWNoIGFuZCBleGVjdXRlIGNvbm5l
Y3QoKSBvbiBhbGwgYXQgb25jZSBiZWZvcmUgYW55IHNpbmdsZQo+ICAgICBjb25uZWN0aW9uIGhh
cyBmaW5pc2hlZC4KPiAKPiBUbyB3b3JrIGFyb3VuZCB0aGlzLCB3ZSB1c2UgYSBuZXcgbG9jay4K
ClRoYW5rcyBhZ2FpbiBmb3IgdGFja2xpbmcgdGhpcy4KCj4gRXJyb3IgaGFuZGxpbmcgb2YgY29u
bmVjdCgpIGFuZCBsb2NrKCkgaXMgYSBiaXQgYXdrd2FyZCBhcwo+IGxpYnhsX19ldl9xbXBfc2Vu
ZCgpIGRvZXNuJ3QgYWxsb3cgdG8gY2FsbCB0aGUgY2FsbGJhY2sgc3luY2hyb25vdXNseS4KPiBT
byB3ZSBzZXR1cCBhIHRpbWVyIHRvIGhhdmUgYSBjYWxsYmFjayB0aGF0IGhhcyBiZWVuIGNhbGxl
ZAo+IGFzeW5jaHJvbm91c2x5LiBXZSB1c2UgdGhlIF9hYnMgdmFyaWFudCBpdCBkb2VzIHN0cmlj
dGx5IGxlc3MgdGhhbgo+IF9yZWwsIHRodXMgYXZvaWRpbmcgdW5uZWNlc3NhcnkgY29kZSB0aGF0
IGNvdWxkIHJldHVybiBhbiBlcnJvcgo+ICh1bm5lY2Vzc2FyeSBiZWNhdXNlIHdlIG9ubHkgbmVl
ZCB0byBoYXZlIHRoZSBjYWxsYmFjayBiZWVuIGNhbGxlZAo+IEFTQVApLgoKSSBoYXZlIHNvbWUg
cHJvYmxlbXMgd2l0aCB0aGUgYXBwcm9hY2ggaGVyZSwgSSdtIGFmcmFpZC4KCj4gVGhpcyBwYXRj
aCB3b3JrYXJvdW5kIHRoZSBmYWN0IHRoYXQgaXQncyBub3QgcG9zc2libGUgdG8gY29ubmVjdAo+
IG11bHRpcGxlIHRpbWUgdG8gYSBzaW5nbGUgUU1QIHNvY2tldC4gUUVNVSBsaXN0ZW4gb24gdGhl
IHNvY2tldCB3aXRoCj4gYSBiYWNrbG9nIHZhbHVlIG9mIDEsIHdoaWNoIG1lYW4gdGhhdCBvbiBM
aW51eCB3aGVuIGNvbmN1cnJlbnQgdGhyZWFkCj4gY2FsbCBjb25uZWN0KCkgb24gdGhlIHNvY2tl
dCwgdGhleSBnZXQgRUFHQUlOLgouLi4KPiAgICogcW1wX3N0YXRlICAgICBFeHRlcm5hbCAgIGNm
ZCAgICBlZmQgICAgIGlkICAgICByeF9idWYqIHR4X2J1ZiogbXNnKgo+ICAgKiBkaXNjb25uZWN0
ZWQgICBJZGxlICAgICAgIE5VTEwgICBJZGxlICAgIHJlc2V0ICBmcmVlICAgIGZyZWUgICAgZnJl
ZQo+ICsgKiB3YWl0aW5nX2xvY2sgICBBY3RpdmUgICAgIG9wZW4gICBJZGxlICAgIHJlc2V0ICB1
c2VkICAgIGZyZWUgICAgc2V0Cj4gICAqIGNvbm5lY3RpbmcgICAgIEFjdGl2ZSAgICAgb3BlbiAg
IElOICAgICAgcmVzZXQgIHVzZWQgICAgZnJlZSAgICBzZXQKPiAgICogY2FwLm5lZyAgICAgICAg
QWN0aXZlICAgICBvcGVuICAgSU58T1VUICBzZW50ICAgdXNlZCAgICBjYXBfbmVnIHNldAo+ICAg
KiBjYXAubmVnICAgICAgICBBY3RpdmUgICAgIG9wZW4gICBJTiAgICAgIHNlbnQgICB1c2VkICAg
IGZyZWUgICAgc2V0CgpEb24ndCBgbG9jaycgYW5kIGB0aW1lJyBuZWVkIHRvIGJlIGFkZGVkIHRv
IHRoaXMgdGFibGUgPwpUaGUgdGFibGUgbWF5IGJlY29tZSByYXRoZXIgd2lkZSA6LS8uICBNYXli
ZSBpdCBjb3VsZCBiZQpjb21wcmVzc2VkL2FiYnJldmlhdGVkIHNvbWUgbW9yZSBvciBtYXliZSB3
ZSdsbCBqdXN0IGxpdmUgd2l0aCBpdApiZWNvbWluZyB3aWRlci4KCj4gIG91dDoKPiAtICAgIHJl
dHVybiByYzsKPiArICAgIC8qIEFuIGVycm9yIG9jY3VycmVkIGFuZCB3ZSBuZWVkIHRvIGxldCB0
aGUgY2FsbGVyIGtub3cuICBBdCB0aGlzCj4gKyAgICAgKiBwb2ludCwgd2UgY2FuIG9ubHkgZG8g
c28gdmlhIHRoZSBjYWxsYmFjay4gVW5mb3J0dW5hdGVseSwgdGhlCj4gKyAgICAgKiBjYWxsYmFj
ayBvZiBsaWJ4bF9fZXZfc2xvd2xvY2tfbG9jaygpIG1pZ2h0IGJlIGNhbGxlZCBzeW5jaHJvbm91
c2x5LAo+ICsgICAgICogYnV0IGxpYnhsX19ldl9xbXBfc2VuZCgpIHByb21pc2UgdGhhdCBpdCB3
aWxsIG5vdCBjYWxsIHRoZSBjYWxsYmFjawo+ICsgICAgICogc3luY2hyb25vdXNseS4gU28gd2Ug
aGF2ZSB0byBhcnJhbmdlIHRvIGNhbGwgdGhlIGNhbGxiYWNrCj4gKyAgICAgKiBhc3luY2hyb25v
dXNseS4gKi8KPiArICAgIGV2LT5yYyA9IHJjOwo+ICsgICAgc3RydWN0IHRpbWV2YWwgbm93ID0g
eyAwIH07Cj4gKyAgICByYyA9IGxpYnhsX19ldl90aW1lX3JlZ2lzdGVyX2Ficyhldi0+YW8sICZl
di0+ZXRpbWUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsb2NrX2Vy
cm9yX2NhbGxiYWNrLCBub3cpOwo+ICsgICAgLyogSWYgc2V0dGluZyB1cCB0aGUgdGltZXIgZmFp
bGVkLCB0aGVyZSBpcyBubyB3YXkgdG8gdGVsbCB0aGUgY2FsbGVyCj4gKyAgICAgKiBvZiBsaWJ4
bF9fZXZfcW1wX3NlbmQoKSB0aGF0IHRoZSBjb25uZWN0aW9uIHRvIHRoZSBRTVAgc29ja2V0Cj4g
KyAgICAgKiBmYWlsZWQuIEJ1dCB0aGV5IGFyZSBzdXBwb3NlZCB0byBoYXZlIGEgdGltZXIgb2Yg
dGhlaXIgb3duLiAqLwo+ICsgICAgaWYgKHJjKQo+ICsgICAgICAgIExPR0QoRVJST1IsIGV2LT5k
b21pZCwKPiArICAgICAgICAgICAgICJGYWlsZWQgdG8gc2V0dXAgYSBjYWxsYmFjayBjYWxsLiBy
Yz0lZCIsIHJjKTsKCkkgZG9uJ3QgdGhpbmsgdGhpcyBpcyByaWdodC4gIEkgdGhpbmsgdGhpcyBj
YWxsYmFjayBoYXMgdG8gYmUgc2V0IHVwCmluIGEgd2F5IHRoYXQgY2FuJ3QgZmFpbC4gIEJ1dCBJ
IHRoaW5rIHRoaXMgaXMgcG9zc2libGUuICBXZSdyZSBmcmVlCnRvIGFsbG9jYXRlIG1lbW9yeSAo
YWx0aG91Z2ggdGhpcyBtYXkgbm90IGJlIG5lZWRlZCkgYW5kIHRoZSBlZ2MKKHdoaWNoIHdlIGhh
dmUpIGNhbiBjb250YWluIGNhbGxiYWNrIHBvaW50ZXJzLgoKSSBjYW4gc2VlIHR3byBhcHByb2Fj
aGVzOgoKIDEuIEludmVudCBhIG5ldyBsaWJ4bF9ldl9pbW1lZGlhdGVfYnV0X25vdF9yZWVudHJh
bnRfY2FsbGJhY2sgKGNhbid0CiAgICB0aGluayBvZiBhIGdvb2QgbmFtZSByaWdodCBub3cpLiAg
QWRkIGEgbmV3IGxpc3QgaGVhZCB0byB0aGUgZWdjLAogICAgYW5kIHdoZW4geW91IHdhbnQgdG8g
cmVnaXN0ZXIgYSBjYWxsYmFjaywgcHV0IGl0IG9uIHRoYXQgbGlzdC4KICAgIEFkZCB0aGUgY2Fs
bGJhY2sgZXhlY3V0aW9uIHRvIGVnY19ydW5fY2FsbGJhY2tzLCBwcm9iYWJseSBhdCB0aGUKICAg
IHRvcCBpbiBhIGxvb3AgKHNpbmNlIGltbWVkaWF0ZSBjYWxsYmFja3MgbWF5IGFkZCBtb3JlIGlt
bWVkaWF0ZQogICAgY2FsbGJhY2tzKS4KCiAyLiBVc2UgbGlieGxfX2V2X3RpbWU7IHByb3ZpZGUg
bGlieGxfX2V2X3RpbWVfcmVnaXN0ZXJfbm93IHdoaWNoCiAgICBjYW5ub3QgZmFpbDogaXQgc2V0
cyB0aGUgYWJzIHRpbWUgdG8gMCBhbmQgc2tpcHMgdGhlIGFib3J0YWJsZQogICAgc3R1ZmYsIGFu
ZCBwdXRzIHRoZSBsaWJ4bF9fZXZfdGltZSBvbiB0aGUgZnJvbnQgb2YgdGhlIENUWCBldGltZXMK
ICAgIGxpc3QuICBIYXZlIGVnY19ydW5fY2FsbGJhY2tzIHJ1biBpbW1lZGlhdGUgdGltZW91dHM6
IGllLCBpZiB0aGUKICAgIGhlYWQgb2YgdGhlIGV0aW1lcyBsaXN0IGhhcyBhYnMgdGltZSBvZiAw
LCBzdHJpcCBpdCwgYW5kIGNhbGwgaXQuCgogICAgSSB0aGluayB0aGlzIGludm9sdmVzIHNvbWUg
c3BlY2lhbCBoYW5kbGluZyBvZiB0aGlzIGNhc2UgYmVjYXVzZQogICAgeW91IHdhbnQgdG8gYXZv
aWQgbWVzc2luZyBhYm91dCB3aXRoIHRoZSBPU0VWRU5UX0hPT0tzLCBzbwogICAgeW91IHByb2Jh
Ymx5IG5lZWQgYSBuZXcgYml0IGluIGxpYnhsX19ldl90aW1lLiAgT3RoZXJ3aXNlCiAgICB0aW1l
X2RlcmVnaXN0ZXIgd291bGRuJ3Qga25vdyB3aGF0IHRvIGRvLgoKSSB0aGluayAxIGlzIHByb2Jh
Ymx5IGxlc3MgY29uZnVzaW5nIGFuZCBsZXNzIHJpc2t5LiAgSXQgZG9lc24ndApkaXN0dXJiLCBv
ciBnZXQgZW50YW5nbGVkIGluLCB0aGUgZXhpc3RpbmcgZXZfdGltZSBjb2RlOyBpdCBkb2Vzbid0
Cmludm9sdmUgcG9pbnRsZXNzbHkgYWxsb2NhdGluZyBhbiB1bnVzZWQgYWJvcnRhYmxlLiAgQW5k
IGl0IGRvZXNuJ3QKaW52b2x2ZSBjb25mdXNpb24gb3ZlciB3aGljaCBlcnJvciByZXR1cm5zIGFy
ZSBwb3NzaWJsZSB3aGVyZSBhbmQKd2hpY2ggcmMgdmFsdWVzIG11c3QgYmUga2VwdCBhbmQgd2hp
Y2ggZGlzY2FyZGVkLgoKU29ycnksCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
