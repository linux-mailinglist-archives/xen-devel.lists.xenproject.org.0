Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E64E510B4A9
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 18:41:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia1Gr-0005jG-Gx; Wed, 27 Nov 2019 17:38:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uws6=ZT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ia1Gq-0005jB-Lj
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 17:38:32 +0000
X-Inumbo-ID: ba963aea-113c-11ea-83b8-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba963aea-113c-11ea-83b8-bc764e2007e4;
 Wed, 27 Nov 2019 17:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574876311;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=6hjDba6oBwnnkyA6IyIO9+vklUpLeTKxYU2EbVAy0LA=;
 b=QQt/YvjmYI9YXaGpga1NMZgFWWndG6JGSIL21kDMC6ImMeUcYtp05Y0I
 aUnUfbsABPjsJj+osxkObOwNEHpmNZ8vjBWUSSj3eOfG/szgnR2a0+iD0
 LEY3kfRbqv3OOxMaFoGqSJuKXhzeAAMOI+sLp9ld3hDS/mcYhc1ludXve Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cZrX9wB+fpJcI3Xj7W9hElM8+AXgVKCSXqsdGwwe09CWIdL2aR8nSbfHgg/C3AiQ4Rje1OhyX+
 MIJ5Xh2BFlvMC48YFEW0UJpUrKkG18Z99PRr/RfCCQNPI7bibvGhCfEvtcwGBABnLIQA/rLW35
 5k3StgJg4KsH94LyPTLNonR88irvu+DbmgYId8fZAljTlM2ay+vo1C5q+KxYu4wzoYdNc/AcI0
 q7UAMUp/1wEHouQPbklyCDlvpE1YDf/sNCZUm5Ki+lmbffiXPN1KT5uC03R00AMaOh2AE4CqVF
 dW4=
X-SBRS: 2.7
X-MesageID: 9331395
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,250,1571716800"; 
   d="scan'208";a="9331395"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191126150112.12704-1-andrew.cooper3@citrix.com>
 <20191126150112.12704-3-andrew.cooper3@citrix.com>
 <20191127094011.GM980@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <bae8bb91-adaa-0b68-a792-274671a0c808@citrix.com>
Date: Wed, 27 Nov 2019 17:38:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191127094011.GM980@Air-de-Roger>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/2] AMD/IOMMU: Render IO_PAGE_FAULT errors
 in a more useful manner
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcvMTEvMjAxOSAwOTo0MCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIE5v
diAyNiwgMjAxOSBhdCAwMzowMToxMlBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBQ
cmludCB0aGUgUENJIGNvb3JkaW5hdGVzIGluIGl0cyBjb21tb24gZm9ybWF0IGFuZCB1c2UgZCV1
IG5vdGF0aW9uIGZvciB0aGUKPj4gZG9tYWluLiAgQXMgd2VsbCBhcyBwcmludGluZyBmbGFncywg
ZGVjb2RlIHRoZW0uICBJT19QQUdFX0ZBVUxUIGlzIHVzZWQgZm9yCj4+IGludGVycnVwdCByZW1h
cHBpbmcgZXJyb3JzIGFzIHdlbGwgYXMgRE1BIHJlbWFwcGluZyBlcnJvcnMuCj4+Cj4+IEJlZm9y
ZToKPj4gICAoWEVOKSBBTUQtVmk6IElPX1BBR0VfRkFVTFQ6IGRvbWFpbiA9IDAsIGRldmljZSBp
ZCA9IDB4YTEsIGZhdWx0IGFkZHJlc3MgPSAweGJmNjk1MDAwLCBmbGFncyA9IDB4MTAKPj4gICAo
WEVOKSBBTUQtVmk6IElPX1BBR0VfRkFVTFQ6IGRvbWFpbiA9IDAsIGRldmljZSBpZCA9IDB4YTEs
IGZhdWx0IGFkZHJlc3MgPSAweGJmNjk1MDQwLCBmbGFncyA9IDB4MTAKPj4gICAoWEVOKSBBTUQt
Vmk6IElPX1BBR0VfRkFVTFQ6IGRvbWFpbiA9IDAsIGRldmljZSBpZCA9IDB4YTEsIGZhdWx0IGFk
ZHJlc3MgPSAweGZmZmZmZmYwLCBmbGFncyA9IDB4MzAKPj4gICAoWEVOKSBBTUQtVmk6IElPX1BB
R0VfRkFVTFQ6IGRvbWFpbiA9IDAsIGRldmljZSBpZCA9IDB4YTEsIGZhdWx0IGFkZHJlc3MgPSAw
eDEwMDAwMDAwMCwgZmxhZ3MgPSAweDMwCj4+ICAgKFhFTikgQU1ELVZpOiBJT19QQUdFX0ZBVUxU
OiBkb21haW4gPSAwLCBkZXZpY2UgaWQgPSAweGExLCBmYXVsdCBhZGRyZXNzID0gMHgxMDAwMDAw
NDAsIGZsYWdzID0gMHgzMAo+Pgo+PiBBZnRlcjoKPj4gICAoWEVOKSBBTUQtVmk6IElPX1BBR0Vf
RkFVTFQ6IDAwMDA6MDA6MTQuMSBkMCBhZGRyIDAwMDAwMDAwYmY1ZmMwMDAgZmxhZ3MgMHgxMCBQ
Ugo+PiAgIChYRU4pIEFNRC1WaTogSU9fUEFHRV9GQVVMVDogMDAwMDowMDoxNC4xIGQwIGFkZHIg
MDAwMDAwMDBiZjVmYzA0MCBmbGFncyAweDEwIFBSCj4+ICAgKFhFTikgQU1ELVZpOiBJT19QQUdF
X0ZBVUxUOiAwMDAwOjAwOjE0LjEgZDAgYWRkciAwMDAwMDAwMGZmZmZmZmYwIGZsYWdzIDB4MzAg
UlcgUFIKPj4gICAoWEVOKSBBTUQtVmk6IElPX1BBR0VfRkFVTFQ6IDAwMDA6MDA6MTQuMSBkMCBh
ZGRyIDAwMDAwMDAxMDAwMDAwMDAgZmxhZ3MgMHgzMCBSVyBQUgo+PiAgIChYRU4pIEFNRC1WaTog
SU9fUEFHRV9GQVVMVDogMDAwMDowMDoxNC4xIGQwIGFkZHIgMDAwMDAwMDEwMDAwMDA0MCBmbGFn
cyAweDMwIFJXIFBSCj4gTml0OiBJIHdvdWxkIHBsYWNlIHRoZSBkb21haW4gaWQgaW5mb3JtYXRp
b24gYXQgdGhlIGJlZ2lubmluZyAoc2luY2UKPiB0aGF0J3MgbW9yZSBzaW1pbGFyIHRvIGdwcmlu
dGsgZm9ybWF0KSwgYW5kIG1heWJlIGRyb3AgdGhlIEFNRC1WaQo+IHByZWZpeCwgaXQncyBub3Qg
dmVyeSB1c2VmdWwgSU1POgo+Cj4gKFhFTikgZDAgSU9fUEFHRV9GQVVMVCAwMDAwOjAwOjE0LjEg
YWRkciAwMDAwMDAwMTAwMDAwMDQwIGZsYWdzIDB4MzAgUlcgUFIKPgo+IEJ1dCBJJ20gbm90IHNw
ZWNpYWxseSBjb25jZXJuZWQuCgpTbyBJIGRlYmF0ZWQgbm90IHVzaW5nIGQlZCBmb3JtYXQuwqAg
VGhpcyBpcyB0aGUgRFRFJ3MgImRvbWFpbl9pZCIKKGEuay5hLiBUYWcgaW4gdGhlIElPLVRMQikg
ZmllbGQgd2hpY2ggYnkgY29udmVudGlvbiB3ZSBzZXQgdG8gdGhlIGRvbWlkCm9mIHRoZSBvd25p
bmcgZGV2aWNlLCBidXQgaXNuJ3QgbmVjZXNzYXJpbHkgdGhlIGJlc3Qgb3B0aW9uLgoKSW4gcGFy
dGljdWxhciwgaXQgbWlnaHQgYmUgd2lzZSB0byB1c2UgZG9taWQgKyAxIGFuZCBjaG9rZSBpZiB3
ZSBldmVyCmZpbmQgMCBpbiB1c2UuCgo+Cj4+ICsgICAgICAgIHVpbnQ2NF90IGFkZHIgPSAqKHVp
bnQ2NF90ICopKGVudHJ5ICsgMik7Cj4+ICsKPj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIg
IkFNRC1WaTogJXM6ICUwNHg6JTAyeDolMDJ4LiV1IGQlZCBhZGRyICUwMTYiUFJJeDY0Cj4+ICsg
ICAgICAgICAgICAgICAiIGZsYWdzICUjeCVzJXMlcyVzJXMlcyVzJXMlcyVzXG4iLAo+PiArICAg
ICAgICAgICAgICAgY29kZV9zdHIsIGlvbW11LT5zZWcsIFBDSV9CVVMoZGV2aWNlX2lkKSwgUENJ
X1NMT1QoZGV2aWNlX2lkKSwKPj4gKyAgICAgICAgICAgICAgIFBDSV9GVU5DKGRldmljZV9pZCks
IGRvbWFpbl9pZCwgYWRkciwgZmxhZ3MsCj4+ICsgICAgICAgICAgICAgICAoZmxhZ3MgJiAweGUw
MCkgPyAiID8/IiA6ICIiLAo+PiArICAgICAgICAgICAgICAgKGZsYWdzICYgMHgxMDApID8gIiBU
UiIgOiAiIiwKPj4gKyAgICAgICAgICAgICAgIChmbGFncyAmIDB4MDgwKSA/ICIgUloiIDogIiIs
Cj4+ICsgICAgICAgICAgICAgICAoZmxhZ3MgJiAweDA0MCkgPyAiIFBFIiA6ICIiLAo+PiArICAg
ICAgICAgICAgICAgKGZsYWdzICYgMHgwMjApID8gIiBSVyIgOiAiIiwKPj4gKyAgICAgICAgICAg
ICAgIChmbGFncyAmIDB4MDEwKSA/ICIgUFIiIDogIiIsCj4+ICsgICAgICAgICAgICAgICAoZmxh
Z3MgJiAweDAwOCkgPyAiIEkiIDogIiIsCj4+ICsgICAgICAgICAgICAgICAoZmxhZ3MgJiAweDAw
NCkgPyAiIFVTIiA6ICIiLAo+PiArICAgICAgICAgICAgICAgKGZsYWdzICYgMHgwMDIpID8gIiBO
WCIgOiAiIiwKPj4gKyAgICAgICAgICAgICAgIChmbGFncyAmIDB4MDAxKSA/ICIgR04iIDogIiIp
Owo+IEkgd29sZCByYXRoZXIgaGF2ZSB0aG9zZSBhZGRlZCB3aXRoIHByb3BlciBkZWZpbmVkIG5h
bWVzIHRvCj4gYW1kLWlvbW11LWRlZnMuaC4KCkFsbCBvZiB0aGlzIGlzIGluIGRlc3BlcmF0ZSBu
ZWVkIG9mIHR1cm5pbmcgaW50byByZWFsIEMgc3RydWN0cywgcmF0aGVyCnRoYW4gYmVpbmcgb3Bl
bmNvZGVkIGluIHRlcm1zIG9mIHUzMltdIGFuZCBvZmZzZXRzL3NoaWZ0cy9tYXNrcywgYnV0CnN1
Y2ggYSBjaGFuZ2UgZGVmaW5pdGVseSBpc24ndCBhcHByb3ByaWF0ZSBmb3IgYmFja3BvcnQuCgp+
QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
