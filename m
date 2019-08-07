Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A8A849B8
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 12:37:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvJGP-0005LI-Cu; Wed, 07 Aug 2019 10:33:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=besu=WD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hvJGO-0005LD-Ez
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 10:33:48 +0000
X-Inumbo-ID: d5b9efce-b8fe-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d5b9efce-b8fe-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 10:33:46 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /P8qnQs1H8zpZej3adEEIFdUVqvWTA6Vxu5tngivmqR98FdUUkO57tEaPxPyvzP8NnwR0dsdfM
 RGkhy+tKPmbI2QmV1GlVUM2regEnXcb0jSi6QN9hvoc09M6decSzK1gi6IkipkhSwpO0fc6X8e
 quJHZD6Sx++FIX6nbvoTFBxLN6tv+x44tgvsHR3ZhjcHS0iJbJqR/xoZj8Pxm/A6UDybvIwDmZ
 KJLCft6Q5st6KwMyF6Zpzg/7uBW47td8TQlvl3fNXnzAUxzTeJfDdG5SLkWa2YF0JfOPbolSnt
 09Q=
X-SBRS: 2.7
X-MesageID: 4008738
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,357,1559534400"; 
   d="scan'208";a="4008738"
To: Jan Beulich <jbeulich@suse.com>
References: <20190805124301.12887-1-andrew.cooper3@citrix.com>
 <20190805124301.12887-3-andrew.cooper3@citrix.com>
 <873a4d08-82c7-0342-7576-ba5cb2b8ae45@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <f594ca01-b0ee-b577-b53b-ae92694b99de@citrix.com>
Date: Wed, 7 Aug 2019 11:33:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <873a4d08-82c7-0342-7576-ba5cb2b8ae45@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/4] x86/boot: Minor improvements to
 efi_arch_post_exit_boot()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYvMDgvMjAxOSAxNjoyMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDUuMDguMjAxOSAx
NDo0MiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gU3BsaXQgdXAgdGhlIGxvbmcgYXNtIGJsb2Nr
IGJ5IGNvbW1lbnRpbmcgdGhlIGxvZ2ljYWwgc3Vic2VjdGlvbnMuCj4+Cj4+IFRoZSBtb3ZhYnMg
Zm9yIG9idGFpbmluZyBfX3N0YXJ0X3hlbiBjYW4gYmUgYSByaXAtcmVsYXRpdmUgbGVhCj4+IGlu
c3RlYWQuwqAgVGhpcwo+PiBoYXMgdGhlIGFkZGVkIGFkdmFudGFnZSB0aGF0IG9iamR1bXAgY2Fu
IG5vdyBjcm9zcyByZWZlcmVuY2UgaXQgZHVyaW5nCj4+IGRpc2Fzc2VtYmx5Lgo+Cj4gSSdtIHN1
cnByaXNlZCB0aGlzIHdvcmtzLCBidXQgSSB0YWtlIGl0IHRoYXQgeW91J3ZlIHRlc3RlZCBpdDoK
ClNvIEkgZGlkIHNwZWNpZmljYWxseSB0ZXN0IGl0LCBidXQgaXQgbm93IG9jY3VycyB0byBtZSB0
aGF0IHRoZSB0ZXN0IEkKZGlkIHdhcyB2aWEgdGhlIE1CMiA2NC1iaXQgRUZJIHBhdGgsIHdoaWNo
IGlzbid0IHRoaXMgcGF0aC7CoCAvc2lnaAoKPiBBdCB0aGUgdGltZSB0aGUgYXNtKCkgZXhlY3V0
ZXMsIEkgdGhvdWdodCB3ZSdyZSBzdGlsbCBpbiAod2hhdCBFRkkKPiBjYWxscykgcGh5c2ljYWwg
bW9kZSwgaS5lLiAlcmlwIGhvbGRpbmcgYSB2YWx1ZSBsZXNzIHRoYW4gNEdiLgoKSW4gd2hpY2gg
Y2FzZSwgd2hhdCBpcyB0aGUgcG9pbnQgb2YgdXNpbmcgYSBmaWxlIGZvcm1hdCB3aGljaCBkb2Vz
CmlkZW50aWZ5IHRoZSB2aXJ0dWFsIGFkZHJlc3MgaXQgd291bGQgcHJlZmVyIHRvIHJ1biBhdC4u
LgoKKFRoaXMgaXMgYSByaGV0b3JpY2FsIHF1ZXN0aW9uLsKgIFRoZSBhbnN3ZXIgaXMgImJlY2F1
c2UgRUZJIHNlZW1zIHRvCmFsd2F5cyBkbyB0aGUgdW5oZWxwZnVsIHRoaW5nLCBnaXZlbiB0aGUg
Y2hvaWNlIi4pCgo+IEFjY2Vzc2luZyBtZW1vcnkgdXNpbmcgJXJpcC1yZWxhdGl2ZSBhZGRyZXNz
aW5nIGlzIGZpbmUsIHNpbmNlCj4gdGhlIFhlbiBpbWFnZSBpcyBtYXBwZWQgaW4gYm90aCBwbGFj
ZXMsIGJ1dCBvYnRhaW5pbmcgdGhlIG5ldwo+IGxpbmVhciBhZGRyZXNzIGZvciAlcmlwIHRoaXMg
d2F5IHZpYSBsZWEgc2hvdWxkIG5vdCBiZSwgYXMgdGhpcwo+IHdvdWxkbid0IG1vdmUgdXMgdG8g
dGhlIFhFTl9WSVJUX3tTVEFSVCxFTkR9IHJhbmdlLiBJJ20gY3VyaW91cwo+IHRvIGxlYXJuIHdo
aWNoIHBhcnQgb2YgbXkgdW5kZXJzdGFuZGluZyBpcyB3cm9uZyBoZXJlLgo+Cj4+IFRoZSBzdGFj
ayBoYW5kaW5nIGlzIGNvbmZ1c2luZyB0byBmb2xsb3cuwqAgJXJzcCBpcyBzZXQgdXAgYnkgcmVh
ZGluZwo+PiBzdGFja19zdGFydCB3aGljaCBpcyBhIHBvaW50ZXIgdG8gY3B1MF9zdGFjaywgdGhl
biBjb25zdHJ1Y3RpbmcgYW4KPj4gbHJldCBmcmFtZQo+PiB1bmRlciAlcnNwICh0byBhdm9pZCBj
bG9iYmVyaW5nIHdoYXRldmVyIGlzIGFkamFjZW50IHRvIGNwdTBfc3RhY2spLAo+PiBhbmQgdXNl
cwo+PiB0aGUgUGFzY2FsIGZvcm0gb2YgbHJldCB0byBtb3ZlICVyc3AgdG8gdGhlIGJhc2Ugb2Yg
Y3B1MF9zdGFjay4KPj4KPj4gUmVtb3ZlIHN0YWNrX3N0YXJ0IGZyb20gdGhlIG1peCBhbmQgdXNl
IGEgc2luZ2xlIGxlYSB0byBsb2FkCj4+IGNwdTBfc3RhY2sgYmFzZQo+PiBkaXJlY3RseSwKPgo+
IEkgZGlzYWdyZWUgd2l0aCB0aGlzIGNoYW5nZSwgYXQgbGVhc3QgYXMgbG9uZyBhcwo+IHhlbi9h
cmNoL3g4Ni9ib290L3g4Nl82NC5TIGFsc28gcmVhZHMgZnJvbSBzdGFja19zdGFydCwgcmF0aGVy
IHRoYW4KPiBhY2Nlc3NpbmcgY3B1MF9zdGFjayBkaXJlY3RseS4KClRoYXQgZG9lc24ndCBtZWFu
IHRoYXQgYSkgaXRzIGNvbmNlcHR1YWxseSB0aGUgcmlnaHQgdGhpbmcgdG8gZG8gLi4uCgo+IFRo
ZSBjb2RlIGhlcmUgaXMgaW50ZW5kZWQgdG8gbWlycm9yCj4gd2hhdCdzIGJlaW5nIGRvbmUgb24g
dGhlIG5vbi1FRkkgcGF0aC7CoCBBbmQgaXQgd2FzIGFsd2F5cyBteQo+IHVuZGVyc3RhbmRpbmcg
dGhhdCBpdCdzIGRvbmUgdGhpcyB3YXkgc3VjaCB0aGF0IG9uZSB3b3VsZCBuZWVkIHRvIGdvCj4g
aHVudCBmb3IgdXNlcyBpZiBvbmUgd2FudGVkIHRvIGNoYW5nZSB3aGF0IChyaWdodCBub3cpIHN0
YWNrX3N0YXJ0Cj4gcG9pbnRzIGF0IGR1cmluZyBwcmUtU01QIGJvb3QuIE90aGVyd2lzZSBzdGFj
a19zdGFydCB3b3VsZG4ndCBuZWVkCj4gYW4gaW5pdGlhbGl6ZXIgYW55bW9yZSwgYW5kIGhlbmNl
IGNvdWxkIG1vdmUgdG8gLmJzcy4KCi4uLiBvciBiKSB0aGF0IEkgaGF2ZSBhbnkgaW50ZW50aW9u
IG9mIGxldHRpbmcgc3RhY2tfc3RhcnQgc3Vydml2ZS7CoApTcGVjaWZpY2FsbHksIGl0IGlzIGFu
IHVubmVjZXNzYXJ5IHBvaW50IG9mIHNlcmlhbGlzYXRpb24gZm9yIEFQcywgd2hpY2gKbmVlZHMg
dG8gZGlzYXBwZWFyLgoKY3B1MF9zdGFjayBpcyB3aGVyZSBjcHUwIHNob3VsZCBoYXZlIGl0cyBz
dGFjaywgYW5kIHRoaXMgcGF0aCBpcwpleGNsdXNpdmUgdG8gY3B1MC4KCj4KPj4gYW5kIHVzZSB0
aGUgbW9yZSBjb21tb24gcHVzaC9wdXNoL2xyZXRxIHNlcXVlbmNlIGZvciByZWxvYWRpbmcgJWNz
Lgo+Cj4gSSBkb24ndCBzZWUgd2hhdCdzIHdyb25nIHdpdGggd2hhdCB5b3UgY2FsbCAiUGFzY2Fs
IGZvcm0iIG9mIGxyZXQKPiAoQydzIF9fc3RkY2FsbCB1c2VzIHRoaXMgYXMgd2VsbCwgZm9yIGV4
YW1wbGUpLgoKSSdtIGFmcmFpZCB0aGF0IHRoaXMgc3RhdGVtZW50IGNsZWFybHkgaGlnaGxpZ2h0
cyB0aGUgcHJvYmxlbSBJJ20gdHJ5aW5nCnRvIHNvbHZlLgoKPiBJIGRvbid0IGhlYXZpbHkKPiBt
aW5kIHRoaXMgdHJhbnNmb3JtYXRpb24sIGJ1dCAoSSdtIHNvcnJ5IHRvIHNheSB0aGF0KSBpdCBs
b29rcyB0bwo+IG1lIGFzIGlmIHRoaXMgd2FzIGEgY2hhbmdlIGZvciB0aGUgc2FrZSBvZiBjaGFu
Z2luZyB0aGUgY29kZSwgbm90Cj4gZm9yIG1ha2luZyBpdCBhbnkgImJldHRlciIgKGZvciB3aGF0
ZXZlciBkZWZpbml0aW9uIG9mICJiZXR0ZXIiKS4KCkl0IHJlYWxseSBkb2Vzbid0IG1hdHRlciBp
ZiB5b3UgY2FuIGZvbGxvdyB0aGUgY29kZSwgb3Igd2hldGhlciBJIGNhbgpmb2xsb3cgaXQgd2hl
biBJJ3ZlIGRvdWJsZSBjaGVja2VkIHRoZSBpbnN0cnVjdGlvbiBiZWhhdmlvdXIgYmVjYXVzZSwK
d2hpbGUgSSdtIGF3YXJlIHRoaXMgZm9ybSBleGlzdHMsIGZyYW5rbHkgSSdtIGEgbGl0dGxlIHJ1
c3R5IG9uIFBhc2NhbAppdCBoYXZpbmcgY2Vhc2VkIHRvIGJlIGEgZG9taW5hbnQgcHJvZ3JhbW1p
bmcgbGFuZ3VhZ2UgYmVmb3JlIEkgd2FzIGJvcm4uLi4KClRoZSBlYXNpZXIgY29kZSBpcyB0byBm
b2xsb3csIHRoZSBlYXNpZXIgdGltZSBvdGhlciBwZW9wbGUgd2lsbCBoYXZlIHRvCmRlYnVnIGFu
ZCBkZXZlbG9wIG9uIGl0LCBhbmQgdGhlIGhlYWx0aGllciB0aGUgWGVuIGNvbW11bml0eSB3aWxs
IGJlIGFzCnJlc3VsdC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
