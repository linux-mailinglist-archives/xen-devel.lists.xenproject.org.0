Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D26E2D3D0E
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 12:13:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIrsw-0007Vg-PY; Fri, 11 Oct 2019 10:10:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fsnF=YE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iIrsu-0007Vb-Vj
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 10:10:57 +0000
X-Inumbo-ID: 69e2ad1a-ec0f-11e9-beca-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69e2ad1a-ec0f-11e9-beca-bc764e2007e4;
 Fri, 11 Oct 2019 10:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570788656;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=/ewO0Caj2pf2S68yirwqZDs5A7wzLHGIFPYN+/kkobE=;
 b=DYDdM8D1BY7qqkqcBTrnm0YAyTePiStriSQawHvTmxSqQ+ziUFnFmkem
 cDNT4Bb0MsJyBpCMD5LJtTC0sbs+49cLzTlss5UJaqA8G2MeDmX99vR5S
 el/HUkmz6HY+nWdI1ALL1gsDYPJDPX0XIXvPeEt4oOM9MQfJdd2oHpxux U=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OXpf4F54zBSY+vu4ujgtj4pHfP6oUnyvHHLdNohwwlCK171B8JpukJoltLR1gPdbXRp/8A+pc9
 egVTnNmNDJYvT9nJKI7R2shHhPMqIwJyg5vVbXLBz4zYdaOUP/l6EptoOctne3DGWdPsRio5Sp
 z57rtL012wtTKWhfvMnaN17ukd+9kSQSVFZkROE037xTONZ0yEPCesbW/ywGKyqay9GE0kaGls
 WJLpGMnUONqZ/UZUqB0fgtbs+1WtAg3UJ1CKheHapd2G/Bj4f3NaYjnSbyhtXA001xsLPBtniT
 Bbs=
X-SBRS: 2.7
X-MesageID: 7151695
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,283,1566878400"; 
   d="scan'208";a="7151695"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23968.21804.761750.123295@mariner.uk.xensource.com>
Date: Fri, 11 Oct 2019 11:10:52 +0100
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
In-Reply-To: <17defd97-e6b8-761e-0bd8-0aa0a2de7bed@citrix.com>
References: <20191010151111.22125-1-ian.jackson@eu.citrix.com>
 <20191010151111.22125-10-ian.jackson@eu.citrix.com>
 <17defd97-e6b8-761e-0bd8-0aa0a2de7bed@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 9/9] libxl/xl: Overhaul
 passthrough setting logic
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
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <pdurrant@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogW1hFTiBQQVRDSCBmb3ItNC4xMyB2MiA5LzldIGxp
YnhsL3hsOiBPdmVyaGF1bCBwYXNzdGhyb3VnaCBzZXR0aW5nIGxvZ2ljIik6Cj4gT24gMTAvMTAv
MjAxOSAxNjoxMSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gPiArICAgIGlmIChjX2luZm8tPnBhc3N0
aHJvdWdoID09IExJQlhMX1BBU1NUSFJPVUdIX0RJU0FCTEVEICYmIG5lZWRfcHQpIHsKPiA+ICsg
ICAgICAgIExPR0QoRVJST1IsIGRvbWlkLAo+ID4gKyAgICAgICAgICAgICAicGFzc3Rocm91Z2gg
ZGlzYWJsZWQgYnV0IGRldmljZXMgYXJlIHNwZWNpZmllZCIpOwo+IAo+IFRoaXMgaXMgdGhlIG9u
bHkgbG9nIG1lc3NhZ2Ugd2hpY2ggaXNuJ3QgcHJlZml4ZWQgd2l0aCBFUlJPUjoKCkkgd2lsbCBz
dHJpcCB0aGUgRVJST1I6IG91dCBvZiB0aGUgb3RoZXJzLiAgSSB0aGluayBJIGluaGVyaXRlZCB0
aGVtCmZyb20gd2hlbiB0aGlzIGNvZGUgd2FzIGluIHhsLCB3aGVyZSBpdCdzIGp1c3QgZnByaW50
ZiBzdGRlcnIuICBIZXJlCnRoZSBwcmlvcml0eSBpcyBhbiBhcmd1bWVudCB0byBMT0dELgoKPiA+
ICsgICAgY29uc3QgY2hhciAqd2h5bm90X3B0X3NoYXJlID0KPiA+ICsgICAgICAgIGNfaW5mby0+
dHlwZSA9PSBMSUJYTF9ET01BSU5fVFlQRV9QViA/ICJub3QgdmFsaWQgZm9yIFBWIGRvbWFpbiIg
Ogo+ID4gKyAgICAgICAgIXBoeXNpbmZvLmNhcF9pb21tdV9oYXBfcHRfc2hhcmUgPyAibm90IHN1
cHBvcnRlZCBvbiB0aGlzIHBsYXRmb3JtIiA6Cj4gPiArICAgICAgICBOVUxMOwo+IAo+IFRoaXMg
aXMgYSBsaXR0bGUgbW9yZSBjb21wbGljYXRlZC4KCkkgYWltZWQgdG8gcmVwbGljYXRlIHRoZSBs
b2dpYyBwcmlvciB0byBteSBzZXJpZXMuICBGVEFPRCBJIHRoaW5rIHRoaXMKbWVhbnMgdGhpcyB3
YXMgYWxyZWFkeSBicm9rZW4gaW4geGwgPyAgQW55d2F5OgoKPiBGb3IgQVJNLCBkb2Vzbid0IGxp
YnhsIHRyZWF0IGd1ZXN0cyBhcyBQViwgb3IgaGFzIHRoYXQgYmVlbiBmaXhlZCBub3c/wqAKPiBB
Uk0ncyBvbmx5IHBhc3N0aHJvdWdoIG1vZGUgaXMgUFRfU0hBUkUuCgpJIHRoaW5rIHRoaXMgbWVh
bnMgdGhhdCBJIG5lZWQgdG8gbW92ZSB0aGUgY2FsY3VsYXRpb24gb2YKd2h5bm90X3B0X3NoYXJl
IGludG8gYXJjaC1zcGVjaWZpYyBjb2RlLiAgSSdsbCB3YWl0IGFuZCBzZWUgd2hhdCBBUk0KZm9s
a3Mgc2F5LgoKPiBPbiB4ODYgZm9yIFBWSCwgcGFzc3Rocm91Z2ggZG9lc24ndCB3b3JrIHlldC7C
oCBUaGlzIG1heSBub3QgYmUgYW4KPiBhcmd1bWVudCBhZ2FpbnN0IGNvbnN0cnVjdGluZyB0aGUg
Z3Vlc3Qgc3VpdGFibHksIGJ1dCB3ZSBzaG91bGQgY2hlY2sKPiB0aGF0IHRoaW5ncyBkb24ndCBl
eHBsb2RlIGluIG5ldyBhbmQgaW50ZXJlc3Rpbmcgd2F5cyBmcm9tIHRoaXMgY2hhbmdlLgoKSWYg
d2Uga25vdyBpdCBkb2Vzbid0IHdvcmssIGl0J3Mgbm90IGEgZ29vZCBpZGVhIHRvIGFjY2VwdCBp
dC4gIEkgd2lsbAphcnJhbmdlIHRvIHJlamVjdCBpdC4KCj4gRm9yIHg4NiBIVk0sIFBUX1NIQVJF
IGlzIG9ubHkgYXZhaWxhYmxlIGZvciBIQVAgZ3Vlc3RzLCBzbyBzaGFkb3cgZ3Vlc3RzCj4gbXVz
dCB1c2UgUFRfU1lOQy4KCkkgd2lsbCBhZGQgYSBjaGVjayBmb3IgY19pbmZvLT5oYXAuCgo+ID4g
KyAgICAvKiBBbiBleHBsaWNpdCBzZXR0aW5nIHNob3VsZCBub3cgaGF2ZSBiZWVuIGNob3NlbiAq
Lwo+ID4gKyAgICBhc3NlcnQoY19pbmZvLT5wYXNzdGhyb3VnaCAhPSBMSUJYTF9QQVNTVEhST1VH
SF9VTktOT1dOKTsKPiA+ICsgICAgYXNzZXJ0KGNfaW5mby0+cGFzc3Rocm91Z2ggIT0gTElCWExf
UEFTU1RIUk9VR0hfRU5BQkxFRCk7Cj4gCj4gVGhpcyBpcyBjb25mdXNpbmcuwqAgSSB0aGluayBp
dCB3b3VsZCBoZWxwIGlmIC4uLgouLi4KPiAuLi4gdGhpcyBoYWQgYSBjb21tZW50IGV4cGxhaW5p
bmcgZW5hYmxlZCBpcyBqdXN0IGludGVyaW0gdmFsdWUuCj4gCj4gKDIsICJlbmFibGVkIiksICMg
YmVjb21lcyB7c3luYyxzaGFyZX1fcHQgb25jZSBkZWZhdWx0cyBhcmUgZXZhbHVhdGVkCgpHb29k
IGlkZWEsIHRoYW5rcy4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
