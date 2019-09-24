Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CABBCBBB
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 17:45:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCmxr-0001KS-5w; Tue, 24 Sep 2019 15:42:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=htKO=XT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iCmxp-0001KF-57
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 15:42:53 +0000
X-Inumbo-ID: f755323f-dee1-11e9-9621-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by localhost (Halon) with ESMTPS
 id f755323f-dee1-11e9-9621-12813bfff9fa;
 Tue, 24 Sep 2019 15:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569339772;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Mb8/R7vfdS2+hucQ8fxNGdBXKmhm5r9iopUbG4L0E+A=;
 b=elZ23fDnZ7B5kXRJXlF2jc8elvuTMEgRR1tppO1rl5sldw0PSlSga/Af
 XEwMcnWqrZUk7L2Kf5b4t9hB+xxV1JAE5wa3eK8WUSF+grCj+ODWlsEnF
 tmnyYYSydb8wMnzjg2qI17VJ4rI/kcDzCKSEHhWyYQsbXDjqqU31fHB+H U=;
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
IronPort-SDR: XROcdx+YgW9Ah7Fdi12lY+nFPe38WhNQUqPqapBx9nKdx/nTFCPqFFOUS6Xe9ut0mTRu8ju1Lt
 BmfVTipOrBTd151ooQ7oLuFU+wzM/dUGWwTrMP9YR59WznD85kLfFQdKnnp0DW1tB9132dxFCz
 er9L7XDc/0lSIRsp+QgyvcJbOHukd9NXSkUb4ET1t1MFq5aj+oCjom1YJ5N63Ot0Yn5RA9KLEI
 KrHdt7w0BKYy8pHiEbCtnfEg7qNK6RJYVJqsH+UQPqJigDqTa4smOR9fcikTzUzy15P32GdFkq
 NE8=
X-SBRS: 2.7
X-MesageID: 6217232
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,544,1559534400"; 
   d="scan'208";a="6217232"
Date: Tue, 24 Sep 2019 17:42:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Joe Jin <joe.jin@oracle.com>
Message-ID: <20190924154242.nwhetdvkgmkhjgph@Air-de-Roger>
References: <70457d4e-068f-0160-532b-e00dd295b3b1@oracle.com>
 <20190913103335.ijzx6tuy4iwb5dt5@Air-de-Roger>
 <89c9c9b5-a99f-bfdb-c42c-df64e308a98e@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <89c9c9b5-a99f-bfdb-c42c-df64e308a98e@oracle.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH RFC] pass-through: sync pir to irr after
 msix vector been updated
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
Cc: xen-devel@lists.xenproject.org, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>,
 Joao Martins <joao.m.martins@oracle.com>, Jan Beulich <jbeulich@suse.com>,
 "DONGLI.ZHANG" <dongli.zhang@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMDk6NTA6MzRBTSAtMDcwMCwgSm9lIEppbiB3cm90ZToK
PiBPbiA5LzEzLzE5IDM6MzMgQU0sIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiBPbiBUaHUs
IFNlcCAxMiwgMjAxOSBhdCAxMTowMzoxNEFNIC0wNzAwLCBKb2UgSmluIHdyb3RlOgo+ID4+IFdp
dGggYmVsb3cgdGVzdGNhc2UsIGd1ZXN0IGtlcm5lbCByZXBvcnRlZCAiTm8gaXJxIGhhbmRsZXIg
Zm9yIHZlY3RvciI6Cj4gPj4gICAxKS4gUGFzc3Rocm91Z2ggbWx4IGliIFZGIHRvIDIgcHZodm0g
Z3Vlc3RzLgo+ID4+ICAgMikuIFN0YXJ0IHJkcy1zdHJlc3MgYmV0d2VlbiAyIGd1ZXN0cy4KPiA+
PiAgIDMpLiBTY2FsZSBkb3duIDIgZ3Vlc3RzIHZjcHUgZnJvbSAzMiB0byA2IGF0IHRoZSBzYW1l
IHRpbWUuCj4gPj4KPiA+PiBSZXBlYXQgYWJvdmUgdGVzdCBzZXZlcmFsIGl0ZXJhdGlvbiwgZ3Vl
c3Qga2VybmVsIHJlcG9ydGVkICJObyBpcnEgaGFuZGxlcgo+ID4+IGZvciB2ZWN0b3IiLCBhbmQg
SUIgdHJhZmZpYyBkb3duZWQgdG8gemVybyB3aGljaCBjYXVzZWQgYnkgaW50ZXJydXB0IGxvc3Qu
Cj4gPj4KPiA+PiBXaGVuIHZjcHUgb2ZmbGluZSwga2VybmVsIGRpc2FibGVkIGxvY2FsIElSUSwg
bWlncmF0ZSBJUlEgdG8gb3RoZXIgY3B1LAo+ID4+IHVwZGF0ZSBNU0ktWCB0YWJsZSwgZW5hYmxl
IElSUS4gSWYgYW55IG5ldyBpbnRlcnJ1cHQgYXJyaXZlZCBhZnRlcgo+ID4+IGxvY2FsIElSUSBk
aXNhYmxlZCBhbHNvIGJlZm9yZSBNU0ktWCB0YWJsZSBiZWVuIHVwZGF0ZWQsIGludGVycnVwdCBz
dGlsbCAKPiA+PiB1c2VkIG9sZCB2ZWN0b3IgYW5kIGRlc3QgY3B1IGluZm8sIGFuZCB3aGVuIGxv
Y2FsIElSUSBlbmFibGVkIGFnYWluLCAKPiA+PiBpbnRlcnJ1cHQgYmVlbiBzZW50IHRvIHdyb25n
IGNwdSBhbmQgdmVjdG9yLgo+ID4gCj4gPiBZZXMsIGJ1dCB0aGF0J3Mgc29tZXRoaW5nIExpbnV4
IHNob3Vsa2QgYmUgYWJsZSB0byBoYW5kbGUsIGFjY29yZGluZwo+ID4gdG8geW91ciBkZXNjcmlw
dGlvbiB0aGVyZSdzIGEgd2luZG93IHdoZXJlIGludGVycnVwdHMgY2FuIGJlIGRlbGl2ZXJlZAo+
ID4gdG8gdGhlIG9sZCBDUFUsIGJ1dCB0aGF0J3Mgc29tZXRoaW5nIGV4cGVjdGVkLgo+IAo+IEFj
dHVhbGx5LCBrZXJuZWwgd2lsbCBjaGVjayBBUElDIElSUiB3aGVuIGRvIG1pZ3JhdGlvbiwgaWYg
YW55IHBlbmRpbmcKPiBJUlEsIHdpbGwgcmV0cmlnZ2VyIElSUSB0byBuZXcgZGVzdGluYXRpb24s
IGJ1dCBYZW4gZG9lcyBub3Qgc2V0IHRoZQo+IGJpdC4KClJpZ2h0LCBiZWNhdXNlIHRoZSBpbnRl
cnJ1cHQgaXMgcGVuZGluZyBpbiB0aGUgUElSUiBwb3N0ZWQgZGVzY3JpcHRvcgpmaWVsZCwgaXQg
aGFzIG5vdCB5ZXQgcmVhY2hlZCB0aGUgdmxhcGljIElSUi4KCj4gPiAKPiA+Pgo+ID4+IExvb2tz
IHN5bmMgUElSIHRvIElSUiBhZnRlciBNU0ktWCBiZWVuIHVwZGF0ZWQgaXMgaGVscCBmb3IgdGhp
cyBpc3N1ZS4KPiA+IAo+ID4gQUZBSUNUIHRoZSBzeW5jIHRoYXQgeW91IGRvIGlzIHN0aWxsIHVz
aW5nIHRoZSBvbGQgdmNwdSBpZCwgYXMKPiA+IHBpcnFfZHBjaS0+Z21zaS5kZXN0X3ZjcHVfaWQg
Z2V0cyB1cGRhdGVkIGEgbGl0dGxlIGJpdCBiZWxvdy4gSSdtCj4gPiB1bnN1cmUgYWJvdXQgd2h5
IGRvZXMgdGhpcyBoZWxwLCBJIHdvdWxkIGV4cGVjdCB0aGUgc3luYyBiZXR3ZWVuIHBpcgo+ID4g
YW5kIGlyciB0byBoYXBwZW4gYW55d2F5LCBhbmQgaGVuY2UgSSdtIG5vdCBzdXJlIHdoeSBpcyB0
aGlzIGhlbHBpbmcuCj4gCj4gQXMgbXkgYWJvdmUgdXBkYXRlLCBJUlEgcmV0cmlnZ2VyZWQgYnkg
b2xkIGNwdSwgc28gWGVuIG5lZWQgdG8gc2V0IElSUgo+IGZvciBvbGQgY3B1IGJ1dCBub3Qgb2Yg
bmV3LgoKQUZBSUNUIHlvdSBhcmUgZHJhaW5pbmcgYW55IHBlbmRpbmcgZGF0YSBmcm9tIHRoZSBw
b3N0ZWQgaW50ZXJydXB0ClBJUlIgZmllbGQgaW50byB0aGUgSVJSIHZsYXBpYyBmaWVsZCwgc28g
dGhhdCBubyBzdGFsZSBpbnRlcnJ1cHRzIGFyZQpsZWZ0IGJlaGluZCBhZnRlciB0aGUgTVNJIGZp
ZWxkcyBoYXZlIGJlZW4gdXBkYXRlZCBieSB0aGUgZ3Vlc3QuIEkKdGhpbmsgdGhpcyBpcyBjb3Jy
ZWN0LCBJIHdvbmRlciBob3dldmVyIHdoZXRoZXIgeW91IGFsc28gbmVlZCB0bwp0cmlnZ2VyIGEg
dmNwdSByZS1zY2hlZHVsaW5nIChwYXVzZS91bnBhdXNlIHRoZSB2cGN1KSwgc28gdGhhdCBwZW5k
aW5nCmludGVycnVwdHMgaW4gSVJSIGFyZSBpbmplY3RlZCBieSB2bXhfaW50cl9hc3Npc3QuCgpB
bHNvLCBJIHRoaW5rIHlvdSBzaG91bGQgZG8gdGhpcyBzeW5jaW5nIGFmdGVyIHRoZSBwaV91cGRh
dGVfaXJ0ZQpjYWxsLCBvciBlbHNlIHRoZXJlJ3Mgc3RpbGwgYSB3aW5kb3cgKGFsYmVpdCBzbWFs
bCkgd2hlcmUgeW91IGNhbgpzdGlsbCBnZXQgcG9zdGVkIGludGVycnVwdHMgZGVsaXZlcmVkIHRv
IHRoZSBvbGQgdmNwdS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
