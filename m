Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E112BF58A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 17:10:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDVN1-0005Ej-8g; Thu, 26 Sep 2019 15:07:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1cs6=XV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iDVMz-0005Ed-U6
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 15:07:49 +0000
X-Inumbo-ID: 66e326f4-e06f-11e9-bf31-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by localhost (Halon) with ESMTPS
 id 66e326f4-e06f-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 15:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569510468;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=68mocggzIjIMIAe560GL7wsheh16y1KoAeVtP2PcTfA=;
 b=eWOAKKnOQVmGY3diL41F06Je//o7QhrKtMy93H6jNkMH5IYPbPmTl3ER
 8TcFC2qnWZ/exyDBFf0Ocna9a6p1qdLcAa11Svs6h0JT01crGSZdSnz67
 USIamQArX8Z0qvyfJ/a+i9BE3gpnCKHGjSl255qSHAdVTOgInVmbR/olK g=;
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
IronPort-SDR: TNIXDzHpuGdtRMzBOnUxIllqAy17uNjcFIcVDwXmt0KO/c7Is23VQuVyJj2BFlJn0q/xBcTNqD
 2tD663NAvF0XLUjsD0Tkajw2Bb4BVEM8OZxYNqdxTQM270IxSCYWShqiuSyTqQ0B3wQSLhhb+c
 ckcxvcIdXZwRhxxjSeRO9KwYypixKEQ8vmKuKW20vH0WRdL320n/htT6ceb++WKjTdH0ltA9NF
 eNndCklEnkYtpCZcG3AJA6Fm5+XZ7Por6Mzf7isIelYwP/4lG6+BY218lv6SRaUselfDzP71Lp
 MJo=
X-SBRS: 2.7
X-MesageID: 6353161
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,552,1559534400"; 
   d="scan'208";a="6353161"
Date: Thu, 26 Sep 2019 17:07:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190926150718.omalmgpxuxsezbov@Air-de-Roger>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-10-roger.pau@citrix.com>
 <8b2ae16a846a4e88bf264a8d5a768a37@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b2ae16a846a4e88bf264a8d5a768a37@AMSPEX02CL03.citrite.net>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 09/11] vpci: register as an internal
 ioreq server
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMDM6NDk6NDFQTSArMDIwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFJvZ2VyIFBhdSBN
b25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiBTZW50OiAwMyBTZXB0ZW1iZXIgMjAxOSAx
NzoxNAo+ID4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+ID4gQ2M6IFJvZ2Vy
IFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBJYW4gSmFja3NvbiA8SWFuLkphY2tz
b25AY2l0cml4LmNvbT47IFdlaSBMaXUKPiA+IDx3bEB4ZW4ub3JnPjsgQW5kcmV3IENvb3BlciA8
QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBA
Y2l0cml4LmNvbT47IEphbgo+ID4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrCj4gPiA8
a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsKPiA+IFBhdWwgRHVycmFu
dCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMDkvMTFd
IHZwY2k6IHJlZ2lzdGVyIGFzIGFuIGludGVybmFsIGlvcmVxIHNlcnZlcgo+ID4gQEAgLTQ3OCw2
ICs0ODAsNjcgQEAgdm9pZCB2cGNpX3dyaXRlKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50
IHJlZywgdW5zaWduZWQgaW50IHNpemUsCj4gPiAgICAgIHNwaW5fdW5sb2NrKCZwZGV2LT52cGNp
LT5sb2NrKTsKPiA+ICB9Cj4gPiAKPiA+ICsjaWZkZWYgX19YRU5fXwo+ID4gK3N0YXRpYyBpbnQg
aW9yZXFfaGFuZGxlcihzdHJ1Y3QgdmNwdSAqdiwgaW9yZXFfdCAqcmVxLCB2b2lkICpkYXRhKQo+
ID4gK3sKPiA+ICsgICAgcGNpX3NiZGZfdCBzYmRmOwo+ID4gKwo+ID4gKyAgICBpZiAoIHJlcS0+
dHlwZSA9PSBJT1JFUV9UWVBFX0lOVkFMSURBVEUgKQo+ID4gKyAgICAgICAgLyoKPiA+ICsgICAg
ICAgICAqIElnbm9yZSBpbnZhbGlkYXRlIHJlcXVlc3RzLCB0aG9zZSBjYW4gYmUgcmVjZWl2ZWQg
ZXZlbiB3aXRob3V0Cj4gPiArICAgICAgICAgKiBoYXZpbmcgYW55IG1lbW9yeSByYW5nZXMgcmVn
aXN0ZXJlZCwgc2VlIHNlbmRfaW52YWxpZGF0ZV9yZXEuCj4gPiArICAgICAgICAgKi8KPiA+ICsg
ICAgICAgIHJldHVybiBYODZFTVVMX09LQVk7Cj4gCj4gSW4gZ2VuZXJhbCwgSSB3b25kZXIgd2hl
dGhlciBpbnRlcm5hbCBzZXJ2ZXJzIHdpbGwgZXZlciBuZWVkIHRvIGRlYWwgd2l0aCBpbnZhbGlk
YXRlPyBUaGUgY29kZSBvbmx5IGV4aXN0cyB0byBnZXQgUUVNVSB0byBkcm9wIGl0cyBtYXAgY2Fj
aGUgYWZ0ZXIgYSBkZWNyZWFzZV9yZXNlcnZhdGlvbiBzbyB0aGF0IHRoZSBwYWdlIHJlZnMgZ2V0
IGRyb3BwZWQuCgpJIHRoaW5rIHRoZSBiZXN0IHNvbHV0aW9uIGhlcmUgaXMgdG8gcmVuYW1lIGh2
bV9icm9hZGNhc3RfaW9yZXEgdG8KaHZtX2Jyb2FkY2FzdF9pb3JlcV9leHRlcm5hbCBhbmQgc3dp
dGNoIGl0J3MgY2FsbGVycy4gQm90aApzZW5kX3RpbWVvZmZzZXRfcmVxIGFuZCBzZW5kX2ludmFs
aWRhdGVfcmVxIHNlZW0gb25seSByZWxldmFudCB0bwpleHRlcm5hbCBpb3JlcSBzZXJ2ZXJzLgoK
VGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
