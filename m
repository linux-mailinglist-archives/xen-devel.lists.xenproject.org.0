Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6114823349
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 14:13:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSh8p-0002sb-3Y; Mon, 20 May 2019 12:11:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EBqs=TU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hSh8n-0002sV-MH
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 12:11:41 +0000
X-Inumbo-ID: 6b95a7f8-7af8-11e9-be5f-6f9bbfa73a2d
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b95a7f8-7af8-11e9-be5f-6f9bbfa73a2d;
 Mon, 20 May 2019 12:11:39 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: l9TyoQta7eQWj4WsNuEXe76nzpzpz/eJ59DpAKaFUEh3jgKPZ4mx3wsLEe5aJ/ysxFWky1wY78
 IMH0Ts1YNIPGttN6PHt1WD+5WEhsEGx3XhBsWeRQ6G2J++OznRCX3ZQLBqYwQgrPGeB7PsjiEW
 Ka9jYeC45YrKMpoPBOg++PhzpK0Xrx0NPUlx3EBBIeEZaLgqNu4GSyC5Z5g6rCrTln0VrR6Ue/
 qEXSvFdmvFZBQU/mqXJFb25ZE6aRExNPh3Lbe55kDHcBuoofz18m4JWdM4fNZzQK8fmf2dWt6c
 2l0=
X-SBRS: 2.7
X-MesageID: 645591
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,491,1549947600"; 
   d="scan'208";a="645591"
To: Jan Beulich <JBeulich@suse.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B813F020000780021F164@prv1-mh.provo.novell.com>
 <4b177bfd-0aa0-5389-b8d4-91278d8a0fc0@citrix.com>
 <5C8F6B05020000780021FC05@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <3ffad362-eb39-e3c9-cd89-4ca969e9d710@citrix.com>
Date: Mon, 20 May 2019 13:11:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5C8F6B05020000780021FC05@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v8 09/50] x86emul: support AVX512{F,
 BW} integer unpack insns
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMDMvMjAxOSAwOTo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTUuMDMuMTkg
YXQgMTk6MjEsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMTUvMDMv
MjAxOSAxMDo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBAQCAtNjY4MSw2ICs2NjgxLDEyIEBA
IHg4Nl9lbXVsYXRlKAo+Pj4gICAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZiwgMHhm
Nik6IC8qIHZwc2FkYncgW3h5el1tbS9tZW0sW3h5el1tbSxbeHl6XW1tICovCj4+PiAgICAgICAg
ICBnZW5lcmF0ZV9leGNlcHRpb25faWYoZXZleC5vcG1zaywgRVhDX1VEKTsKPj4+ICAgICAgICAg
IC8qIGZhbGwgdGhyb3VnaCAqLwo+Pj4gKyAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgw
ZiwgMHg2MCk6IC8qIHZwdW5wY2tsYncgW3h5el1tbS9tZW0sW3h5el1tbSxbeHl6XW1te2t9ICov
Cj4+PiArICAgIGNhc2UgWDg2RU1VTF9PUENfRVZFWF82NigweDBmLCAweDYxKTogLyogdnB1bnBj
a2x3ZCBbeHl6XW1tL21lbSxbeHl6XW1tLFt4eXpdbW17a30gKi8KPj4+ICsgICAgY2FzZSBYODZF
TVVMX09QQ19FVkVYXzY2KDB4MGYsIDB4NjgpOiAvKiB2cHVucGNraGJ3IFt4eXpdbW0vbWVtLFt4
eXpdbW0sW3h5el1tbXtrfSAqLwo+Pj4gKyAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgw
ZiwgMHg2OSk6IC8qIHZwdW5wY2tod2QgW3h5el1tbS9tZW0sW3h5el1tbSxbeHl6XW1te2t9ICov
Cj4+PiArICAgICAgICBvcF9ieXRlcyA9IDE2IDw8IGV2ZXgubHI7Cj4+PiArICAgICAgICAvKiBm
YWxsIHRocm91Z2ggKi8KPj4gSWYgdGhpcyBzZXR0aW5nIG9mIG9wX2J5dGVzIGlzIHNhZmUgdG8g
ZG8gZm9yIHZwc2FkYncsIGhvdyBkb2VzIHRoZQo+PiBlbXVsYXRpb24gY3VycmVudGx5IHdvcms/
Cj4gVGhlIHNldHRpbmcgaXMgcmVkdW5kYW50IGZvciBWUFNBREJXICh0aGVyZSBpdCBnZXRzIHNl
dCBieSB2aXJ0dWUKPiBvZiBpdHMgdGFibGUgZW50cnkgc2F5aW5nIHNpbWRfcGFja2VkX2ludCks
IGJ1dCBpdCdzIG5lY2Vzc2FyeSBmb3IKPiBWVU5QQ0sqIGFzIHRoZWlyIHRhYmxlIGVudHJpZXMg
dXNlIHNpbWRfb3RoZXIsIHdoaWNoIGlzIG5lY2Vzc2FyeQo+IGJlY2F1c2Ugb2YgdGhlIG1lbW9y
eSBhY2Nlc3MgcGF0dGVybiBvZiBQVU5QQ0tMKi4gSW4gZmFjdCB0aGUKPiBQVU5QQ0tIKiBlbnRy
aWVzIGNvdWxkIGVxdWFsbHkgd2VsbCB1c2Ugc2ltZF9wYWNrZWRfaW50LCBidXQKPiB0aGF0IHdv
dWxkIHRoZW4gY2FsbCBmb3IgdGhlaXIgY2FzZSBsYWJlbHMgdG8gZ2V0IG1vdmVkIGF3YXkgZnJv
bQo+IHRoZSBQVU5QQ0tMKiBvbmVzLCBhbmQgSSBzbGlnaHRseSBwcmVmZXIgdGhlbSB0byBiZSBr
ZXB0IHRvZ2V0aGVyLgoKT2suCgpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
