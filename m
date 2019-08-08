Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 749CC86D65
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 00:47:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvr9I-0000sr-2f; Thu, 08 Aug 2019 22:44:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6/vj=WE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hvr9G-0000sm-Tk
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 22:44:42 +0000
X-Inumbo-ID: 1bc1639d-ba2e-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1bc1639d-ba2e-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 22:44:41 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: C4H5dpfmvoXsMDNSveyc/jh4MDH0EMrTSws0IUskMcE1lc4O3WsRlDJAR9zEJAkz6MM9IMG0AO
 4RxG4efiJcbyvP4TgeBlCYqZNoqwIGpWVf9v0qUsMhEdBPBDlUa4+xj6F/+ICzAUSOtZ05s1S1
 FeWb2CxvdRBlQoLxJehlm7DVe+Yj9wZvpkWnwRUs07OaQivaAlx93RplaYoOX41VF7Dj+u55OL
 RbWTLgTaqUOuH8xp3NQyKmxHkU/VVDk3QUUwpuhf4SAIZdSpU0LuWyVC8RjuLNHpIRE3QesK6F
 3WE=
X-SBRS: 2.7
X-MesageID: 4197079
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,363,1559534400"; 
   d="scan'208";a="4197079"
To: Sander Eikelenboom <linux@eikelenboom.it>
References: <b2d51bfa-17e0-c843-de2f-9fcba9ebc9f6@eikelenboom.it>
 <dbb536d7-7bfb-27fb-902e-0851434bda96@citrix.com>
 <a6f00518-f761-9362-6040-ee28c22cf334@eikelenboom.it>
 <070124d4-93b6-e0f5-ea69-bcac2b5da7e3@citrix.com>
 <d4fab4d9-f2d1-1c18-2582-1bd1283aa1cd@eikelenboom.it>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <d0f9713d-0768-dca6-87b3-3d3d3d02207b@citrix.com>
Date: Thu, 8 Aug 2019 23:44:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d4fab4d9-f2d1-1c18-2582-1bd1283aa1cd@eikelenboom.it>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [SUSPECTED SPAM]Xen-unstable staging build broken
 by pvshim patches.
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDgvMDgvMjAxOSAyMzozNCwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+IE9uIDA4LzA4
LzIwMTkgMjM6MTQsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDA4LzA4LzIwMTkgMjI6MTYs
IFNhbmRlciBFaWtlbGVuYm9vbSB3cm90ZToKPj4+IE9uIDA4LzA4LzIwMTkgMjM6MDUsIEFuZHJl
dyBDb29wZXIgd3JvdGU6Cj4+Pj4gT24gMDgvMDgvMjAxOSAyMTo1OSwgU2FuZGVyIEVpa2VsZW5i
b29tIHdyb3RlOgo+Pj4+PiBIaSBBbmRyZXcsCj4+Pj4+Cj4+Pj4+IEl0IHNlZW1zIHRoZSBwdnNo
aW0gcGF0Y2hlcyBpbiB4ZW4tdW5zdGFibGUgc3RhZ2luZyBicmVhayB0aGUgYnVpbGQgb24gbXkg
bWFjaGluZS4KPj4+Pj4gSSBjbG9uZWQgYSBmcmVzaCB0cmVlIHRvIGJlIHN1cmUsIGhhdmVuJ3Qg
Y2hlY2tlZCB3aGljaCBvZiB0aGUgdHdvIGNvbW1pdHMgY2F1c2VzIGl0Ogo+Pj4+PiAwNjBmNGVl
ZTBmYjQwOGIzMTY1NDg3NzVhYjkyMWUxNmI3YWNkMGUwIG9yIDMyYjFkNjI4ODdkMDFmODVmMGMx
ZDJlMDEwM2Y2OWY3NGUxZjZmYTMKPj4+Pj4KPj4+Pj4gLS0KPj4+Pj4gU2FuZGVyCj4+Pj4+Cj4+
Pj4+Cj4+Pj4+Cj4+Pj4+IFsgLWQgLy91c3IvbG9jYWwvbGliL3hlbi9ib290IF0gfHwgL3Vzci9z
cmMvbmV3L3hlbi11bnN0YWJsZS90b29scy9maXJtd2FyZS8uLi8uLi90b29scy9jcm9zcy1pbnN0
YWxsIC1kIC1tMDc1NSAtcCAvL3Vzci9sb2NhbC9saWIveGVuL2Jvb3QKPj4+Pj4gWyAtZCAvL3Vz
ci9sb2NhbC9saWIvZGVidWcvdXNyL2xvY2FsL2xpYi94ZW4vYm9vdCBdIHx8IC91c3Ivc3JjL25l
dy94ZW4tdW5zdGFibGUvdG9vbHMvZmlybXdhcmUvLi4vLi4vdG9vbHMvY3Jvc3MtaW5zdGFsbCAt
ZCAtbTA3NTUgLXAgLy91c3IvbG9jYWwvbGliL2RlYnVnL3Vzci9sb2NhbC9saWIveGVuL2Jvb3QK
Pj4+Pj4gWyAhIC1lIGh2bWxvYWRlci9odm1sb2FkZXIgXSB8fCAvdXNyL3NyYy9uZXcveGVuLXVu
c3RhYmxlL3Rvb2xzL2Zpcm13YXJlLy4uLy4uL3Rvb2xzL2Nyb3NzLWluc3RhbGwgLW0wNjQ0IC1w
IGh2bWxvYWRlci9odm1sb2FkZXIgLy91c3IvbG9jYWwvbGliL3hlbi9ib290Cj4+Pj4+IC91c3Iv
c3JjL25ldy94ZW4tdW5zdGFibGUvdG9vbHMvZmlybXdhcmUvLi4vLi4vdG9vbHMvY3Jvc3MtaW5z
dGFsbCAtbTA2NDQgLXAgc2VhYmlvcy1kaXIvb3V0L2Jpb3MuYmluIC8vdXNyL2xvY2FsL2xpYi94
ZW4vYm9vdC9zZWFiaW9zLmJpbgo+Pj4+PiAvdXNyL3NyYy9uZXcveGVuLXVuc3RhYmxlL3Rvb2xz
L2Zpcm13YXJlLy4uLy4uL3Rvb2xzL2Nyb3NzLWluc3RhbGwgLW0wNjQ0IC1wIHhlbi1kaXIveGVu
LXNoaW0gLy91c3IvbG9jYWwvbGliL3hlbi9ib290L3hlbi1zaGltCj4+Pj4+IGluc3RhbGw6IGNh
bm5vdCBzdGF0ICd4ZW4tZGlyL3hlbi1zaGltJzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+
Pj4+PiBtYWtlWzRdOiAqKiogW01ha2VmaWxlOjUyOiBpbnN0YWxsXSBFcnJvciAxCj4+Pj4+IG1h
a2VbNF06IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy9uZXcveGVuLXVuc3RhYmxlL3Rvb2xz
L2Zpcm13YXJlJwo+Pj4+PiBtYWtlWzNdOiAqKiogWy91c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUv
dG9vbHMvLi4vdG9vbHMvUnVsZXMubWs6MjM3OiBzdWJkaXItaW5zdGFsbC1maXJtd2FyZV0gRXJy
b3IgMgo+Pj4+PiBtYWtlWzNdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMvbmV3L3hlbi11
bnN0YWJsZS90b29scycKPj4+Pj4gbWFrZVsyXTogKioqIFsvdXNyL3NyYy9uZXcveGVuLXVuc3Rh
YmxlL3Rvb2xzLy4uL3Rvb2xzL1J1bGVzLm1rOjIzMjogc3ViZGlycy1pbnN0YWxsXSBFcnJvciAy
Cj4+Pj4+IG1ha2VbMl06IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy9uZXcveGVuLXVuc3Rh
YmxlL3Rvb2xzJwo+Pj4+PiBtYWtlWzFdOiAqKiogW01ha2VmaWxlOjczOiBpbnN0YWxsXSBFcnJv
ciAyCj4+Pj4+IG1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy9uZXcveGVuLXVu
c3RhYmxlL3Rvb2xzJwo+Pj4+PiBtYWtlOiAqKiogW01ha2VmaWxlOjEzMTogaW5zdGFsbC10b29s
c10gRXJyb3IgMgo+Pj4+IFRoYXQncyB3ZWlyZC4KPj4+Pgo+Pj4+IERvIHlvdSBoYXZlIHRoZSBm
dWxsIGxvZz/CoCBUaGUgcmVhbCBmYWlsdXJlIHdhcyBzb21ld2hlcmUgZWFybGllciB3aGVyZQo+
Pj4+IHhlbi1zaGltIGRpZG4ndCBnZXQgc3RhcnRlZC4KPj4+Pgo+Pj4+IH5BbmRyZXcKPj4+Pgo+
Pj4gSG1tIGlmIGZvcmdvdCBhbmQgdGh1cyBmb3Jnb3QgdG8gbWVudGlvbiBteSBidWlsZCBzY3Jp
cHQgZGlzYWJsZXMgc29tZSBzdHVmZjoKPj4+IC4vY29uZmlndXJlIC0tZGlzYWJsZS1xZW11LXRy
YWRpdGlvbmFsIC0tZGlzYWJsZS1zdHViZG9tIC0tZGlzYWJsZS1kb2NzIC0tZGlzYWJsZS1yb21i
aW9zCj4+Pgo+Pj4gQ291bGQgYmUgdGhhdCBvbmUgb2YgdGhvc2UgZG9lc24ndCB3b3JrIGFueW1v
cmUuCj4+IFRoZSBvbmx5IGludGVyZXN0aW5nIG9uZSB3b3VsZCBiZSAtLWRpc2FibGUtcm9tYmlv
cywgd2hpY2ggZG9lcyBtYWtlCj4+IGNoYW5nZXMgaW4gdGhpcyBhcmVhIG9mIHRoZSBidWlsZCwg
YnV0IGV2ZXJ5dGhpbmcgSSBjaGFuZ2VkIHdhcyBpbnNpZGUKPj4gdGhlIHhlbi1kaXIvIGRpcmVj
dG9yeSBzbyBzaG91bGRuJ3QgaW50ZXJhY3QuPgo+PiB+QW5kcmV3Cj4+Cj4gSXQgaW5kZWVkIHNl
ZW1zIHRvIGJlIHNvbWUgaW50ZXJhY3Rpb24gd2l0aCAtLWRpc2FibGUtcm9tYmlvcywgd2l0aCBq
dXN0Cj4gYSBwbGFpbiAuL2NvbmZpZ3VyZSBpdCBidWlsZHMgZmluZS4KPiBMb2dzIHdoZW4gYnVp
bGRpbmcgd2l0aCAtLWRpc2FibGUtcm9tYmlvcyBhcmUgYXR0YWNoZWQuCgpSaWdodC7CoCBTbyB0
aGUgYnVpbGQgaXRzZWxmIHdvcmtzLCBidXQgdGhlIHN1YnNlcXVlbnQgYG1ha2UgaW5zdGFsbGAg
ZmFpbHMuCgpBbmQgdG8gY29uZmlybSwgYSBidWlsZCBvZiA4ZDU0YTZhZGYgKHRoZSBwYXJlbnQg
b2YgbXkgZmlyc3Qgc2hpbQpjb21taXQpIHdvcmtzIGVudGlyZWx5IGZpbmU/Cgp+QW5kcmV3Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
