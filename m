Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A35D13138B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 15:22:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioTFT-0002jR-Kp; Mon, 06 Jan 2020 14:20:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VNL8=23=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ioTFS-0002jM-Mt
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 14:20:50 +0000
X-Inumbo-ID: bce7d570-308f-11ea-ab0e-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bce7d570-308f-11ea-ab0e-12813bfff9fa;
 Mon, 06 Jan 2020 14:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578320450;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=cbJiX8dIiIiuZp0swD0dXXjyOU0evSQpIxt9dMvfI4Q=;
 b=ILmrvTdpIfW5PARCwWsjo1eGVc1OE1eHotCRuDpVp3hb97FwXbECVOYv
 5pbuVFRdR152r8BMAk7GFw01PhXzdPRqPMUY5HE6CawkNeKgSUbRlZg7R
 iv7IP+a657j8Ecyh/5lzVLUkopcgetkHmP9mSNi6FiWxLz1KeQc7NTcSq o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: b3bYyqVkEvoZ09UX8b40hdgapdTGPo8/+68ha8sWCrqYT8s83PhD4unRgV37G7smu8HcsZB6xI
 edVnlsEHap6glWgjVxB4d/gz9O149KGIfC5Gqb4hl3o1hkVyaK/KSjWi55/VngcFzsUj/Ij4wY
 E2PDU1+2ob32QnWPKoazqnH2NC/NPGk10DN0sIKGM2vcQmI5jun9kg17CdaR8tPuTpqeTZrpp5
 N1PEf26R6ra2p5bQdIkSihXpO1xYJq5/FbrodUVLr8iXm8bm8ovhSTszDHm62LSU59IyzRcg/1
 7Zo=
X-SBRS: 2.7
X-MesageID: 10650072
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,402,1571716800"; d="scan'208";a="10650072"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24083.16958.769634.476071@mariner.uk.xensource.com>
Date: Mon, 6 Jan 2020 14:20:46 +0000
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
In-Reply-To: <20200105084148.18887-1-marmarek@invisiblethingslab.com>
References: <20200105084148.18887-1-marmarek@invisiblethingslab.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] libxl: create backend/ xenstore dir for
 driver domains
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyaXRlcyAoIltQQVRDSF0gbGlieGw6IGNyZWF0
ZSBiYWNrZW5kLyB4ZW5zdG9yZSBkaXIgZm9yIGRyaXZlciBkb21haW5zIik6Cj4gQ2xlYW5pbmcg
dXAgYmFja2VuZCB4ZW5zdG9yZSBlbnRyaWVzIGlzIGEgcmVzcG9uc2liaWxpdHkgb2YgdGhlIGJh
Y2tlbmQuCj4gV2hlbiBiYWNrZW5kIGxpdmVzIG91dHNpZGUgb2YgZG9tMCwgdGhlIGRvbWFpbiBu
ZWVkcyBwcm9wZXIgcGVybWlzc2lvbnMKPiB0byBkbyBpdC4gTm9ybWFsbHkgaXQgaXMgZ2l2ZW4g
cGVybWlzc2lvbiB0byByZW1vdmUgdGhlIGRldmljZSBkaXIKPiBpdHNlbGYsIGJ1dCBub3QgdGhl
IGRpciBjb250YWluaW5nIGl0IChuYW1lZCBhZnRlciBmcm9udGVuZCBJRCkuIEFmdGVyIGEKPiB3
aG9sZSB0aG9zZSBlbXB0eSBsZWZ0b3ZlciBkaXJlY3RvcmllcyBhY2N1bXVsYXRlIHRvIHRoZSBw
b2ludCB4ZW5zdG9yZQo+IHJldHVybmluZyBFMkJJRyBvbiBsaXN0aW5nIHRoZW0uCj4gCj4gRml4
IHRoaXMgYnkgZ2l2aW5nIGJhY2tlbmQgZG9tYWluIHdyaXRlIGFjY2VzcyBhbHNvIHRvIGJhY2tl
bmQvCj4gZGlyZWN0b3J5IGl0c2VsZiB3aGVuIGNfaW5mby0+ZHJpdmVyX2RvbWFpbiBvcHRpb24g
aXMgc2V0LiBUaGUgY29kZQo+IHJlbW92aW5nIHJlbGV2YW50IGRpciBpcyBhbHJlYWR5IHRoZXJl
IChqdXN0IGxhY2tlZCBwZXJtaXNzaW9ucyB0byBkbyBzbykuCj4gCj4gTm90ZSB0aGlzIGFsc28g
YWxsb3dzIHRoZSBiYWNrZW5kIGRvbWFpbiB0byBjcmVhdGUgbmV3IGVudHJpZXMsCj4gcHJldGVu
ZGluZyB0byBob3N0IGJhY2tlbmQgZGV2aWNlcyBpdCBkb24ndCBoYXZlLiBCdXQgc2luY2UgbGli
eGwgdXNlcwo+IC9saWJ4bC8geGVuc3RvcmUgZGlyIGZvciB0aGlzIGluZm9ybWF0aW9uIChzdGls
bCBvdXRzaWRlIG9mIGJhY2tlbmQKPiBkb21haW4gY29udHJvbCksIHRoaXMgc2hvdWxkbid0IGJl
IGFuIGlzc3VlLgoKVGhpcyBzZWVtcyBxdWl0ZSBoYXphcmRvdXMgdG8gbWUuICBUaGUgcmVhc29u
aW5nIHlvdSB1c2UgdG8gc2hvdyB0aGF0CnRoaXMgaXdzIE9LIHNlZW1zIGZyYWdpbGUsIGFuZCBp
biBnZW5lcmFsIGl0IGRvZXNuJ3QgZmVlbCByaWdodCB0bwpnaXZlIHRoZSBwYXJ0aWN1bGFyIGJh
Y2tlbmQgc3VjaCB3aWRlIHNjb3BlLgoKQ2FuIHdlIGZpbmQgYW5vdGhlciB3YXkgdG8gYWRkcmVz
cyB0aGlzIHByb2JsZW0gPyAgSSB0aGluayB0aGUKY29udGFpbmluZyBkaXJlY3Rvcnkgc2hvdWxk
IGJlIHJlbW92ZWQgYnkgdGhlIHRvb2xzdGFjay4gIFdoeSBpcyB0aGlzCmRpZmZpY3VsdCA/ICAo
SSBwcmVzdW1lIHRoZXJlIGlzIGEgcmVhc29uIG9yIHlvdSB3b3VsZCBoYXZlIGRvbmUgaXQKdGhh
dCB3YXkuLi4pCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
