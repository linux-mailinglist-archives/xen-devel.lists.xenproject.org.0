Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E2E48AAE
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 19:42:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcvbn-0003Dv-JL; Mon, 17 Jun 2019 17:39:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ct8y=UQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hcvbl-0003Dp-Vq
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 17:39:54 +0000
X-Inumbo-ID: e9aa8f31-9126-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e9aa8f31-9126-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 17:39:53 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1tsebmpJ43nPIjt+TMtepzv+z1Xeyn4uYHclsVWNXDUNDTU9cTnb+OgrIYkyyxqCdZVu3YTjE+
 3gTf9g9gyjyg7txzsDZXm2qltQBGOPA+mAuz6ZmCvoM3zO0xGMMiclFdth9srT4u1t8vSNqWyy
 vsgOzTYYooDa+zBMZzqk0rvo/vHz+BmCz+wdFv4SSqYgJLKzqbCIo+ONOiSpuL2EWxqkjOmuRQ
 EHoegiS+4BgeXx0vkXHq/1Lf7LXaCQQUwIt/UUSL2WL3jel2Roxv7b7L0mYuvUvXQi3kBEaf1G
 7kk=
X-SBRS: 2.7
X-MesageID: 1838452
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,386,1557201600"; 
   d="scan'208";a="1838452"
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5CEE5C4D02000078002335A0@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <caa80cec-7b46-b31a-88e2-2554a495e159@citrix.com>
Date: Mon, 17 Jun 2019 18:39:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5CEE5C4D02000078002335A0@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/SMP: don't try to stop already stopped
 CPUs
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
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkvMDUvMjAxOSAxMToxNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSW4gcGFydGljdWxhciB3
aXRoIGFuIGVuYWJsZWQgSU9NTVUgKGJ1dCBub3QgcmVhbGx5IGxpbWl0ZWQgdG8gdGhpcwo+IGNh
c2UpLCB0cnlpbmcgdG8gaW52b2tlIGZpeHVwX2lycXMoKSBhZnRlciBoYXZpbmcgYWxyZWFkeSBk
b25lCj4gZGlzYWJsZV9JT19BUElDKCkgLT4gY2xlYXJfSU9fQVBJQygpIGlzIGEgcmF0aGVyIGJh
ZCBpZGVhOgo+Cj4gIFJJUDogICAgZTAwODpbPGZmZmY4MmQwODAyNmEwMzY+XSBhbWRfaW9tbXVf
cmVhZF9pb2FwaWNfZnJvbV9pcmUrMHhkZS8weDExMwo+ICBSRkxBR1M6IDAwMDAwMDAwMDAwMTAw
MDYgICBDT05URVhUOiBoeXBlcnZpc29yIChkMHYwKQo+ICByYXg6IGZmZmY4MzIwMjkxZGUwMGMg
ICByYng6IDAwMDAwMDAwMDAwMDAwMDMgICByY3g6IGZmZmY4MzIwMzUwMDAwMDAKPiAgcmR4OiAw
MDAwMDAwMDAwMDAwMDAwICAgcnNpOiAwMDAwMDAwMDAwMDAwMDAwICAgcmRpOiBmZmZmODJkMDgw
NWNhODQwCj4gIHJicDogZmZmZjgzMDA5ZThhNzljOCAgIHJzcDogZmZmZjgzMDA5ZThhNzlhOCAg
IHI4OiAgMDAwMDAwMDAwMDAwMDAwMAo+ICByOTogIDAwMDAwMDAwMDAwMDAwMDQgICByMTA6IDAw
MDAwMDAwMDAwOGI5ZjkgICByMTE6IDAwMDAwMDAwMDAwMDAwMDYKPiAgcjEyOiAwMDAwMDAwMDAw
MDEwMDAwICAgcjEzOiAwMDAwMDAwMDAwMDAwMDAzICAgcjE0OiAwMDAwMDAwMDAwMDAwMDAwCj4g
IHIxNTogMDAwMDAwMDBmZmZlZmZmZiAgIGNyMDogMDAwMDAwMDA4MDA1MDAzMyAgIGNyNDogMDAw
MDAwMDAwMDM0MDZlMAo+ICBjcjM6IDAwMDAwMDIwMzVkNTkwMDAgICBjcjI6IGZmZmY4ODgyNGNj
YjRlZTAKPiAgZnNiOiAwMDAwN2YyMTQzZjA4ODQwICAgZ3NiOiBmZmZmODg4MjU2YTAwMDAwICAg
Z3NzOiAwMDAwMDAwMDAwMDAwMDAwCj4gIGRzOiAwMDAwICAgZXM6IDAwMDAgICBmczogMDAwMCAg
IGdzOiAwMDAwICAgc3M6IGUwMTAgICBjczogZTAwOAo+ICBYZW4gY29kZSBhcm91bmQgPGZmZmY4
MmQwODAyNmEwMzY+IChhbWRfaW9tbXVfcmVhZF9pb2FwaWNfZnJvbV9pcmUrMHhkZS8weDExMyk6
Cj4gICBmZiAwNyAwMCAwMCAzOSBkMyA3NCAwMiA8MGY+IDBiIDQxIDgxIGU0IDAwIGY4IGZmIGZm
IDhiIDEwIDg5IGQwIDI1IDAwIDAwCj4gIFhlbiBzdGFjayB0cmFjZSBmcm9tIHJzcD1mZmZmODMw
MDllOGE3OWE4Ogo+ICAuLi4KPiAgWGVuIGNhbGwgdHJhY2U6Cj4gICAgIFs8ZmZmZjgyZDA4MDI2
YTAzNj5dIGFtZF9pb21tdV9yZWFkX2lvYXBpY19mcm9tX2lyZSsweGRlLzB4MTEzCj4gICAgIFs8
ZmZmZjgyZDA4MDI2YmY3Yj5dIGlvbW11X3JlYWRfYXBpY19mcm9tX2lyZSsweDEwLzB4MTIKPiAg
ICAgWzxmZmZmODJkMDgwMjdmNzE4Pl0gaW9fYXBpYy5jI21vZGlmeV9JT19BUElDX2lycSsweDVl
LzB4MTI2Cj4gICAgIFs8ZmZmZjgyZDA4MDI3ZjljNT5dIGlvX2FwaWMuYyN1bm1hc2tfSU9fQVBJ
Q19pcnErMHgyZC8weDQxCj4gICAgIFs8ZmZmZjgyZDA4MDI4OWJjNz5dIGZpeHVwX2lycXMrMHgz
MjAvMHg0MGIKPiAgICAgWzxmZmZmODJkMDgwMmE4MmM0Pl0gc21wX3NlbmRfc3RvcCsweDRiLzB4
YTgKPiAgICAgWzxmZmZmODJkMDgwMmE3YjJmPl0gbWFjaGluZV9yZXN0YXJ0KzB4OTgvMHgyODgK
PiAgICAgWzxmZmZmODJkMDgwMjUyMjQyPl0gY29uc29sZV9zdXNwZW5kKzAvMHgyOAo+ICAgICBb
PGZmZmY4MmQwODAyYjAxZGE+XSBkb19nZW5lcmFsX3Byb3RlY3Rpb24rMHgyMDQvMHgyNGUKPiAg
ICAgWzxmZmZmODJkMDgwMzg1YTNkPl0geDg2XzY0L2VudHJ5LlMjaGFuZGxlX2V4Y2VwdGlvbl9z
YXZlZCsweDY4LzB4OTQKPiAgICAgWzwwMDAwMDAwMGFhNWI1MjZiPl0gMDAwMDAwMDBhYTViNTI2
Ygo+ICAgICBbPGZmZmY4MmQwODAyYTdjN2Q+XSBtYWNoaW5lX3Jlc3RhcnQrMHgxZTYvMHgyODgK
PiAgICAgWzxmZmZmODJkMDgwMjQwZjc1Pl0gaHdkb21fc2h1dGRvd24rMHhhMi8weDExZAo+ICAg
ICBbPGZmZmY4MmQwODAyMGJhYTI+XSBkb21haW5fc2h1dGRvd24rMHg0Zi8weGQ4Cj4gICAgIFs8
ZmZmZjgyZDA4MDIzZmU5OD5dIGRvX3NjaGVkX29wKzB4MTJmLzB4NDJhCj4gICAgIFs8ZmZmZjgy
ZDA4MDM3ZTQwND5dIHB2X2h5cGVyY2FsbCsweDFlNC8weDU2NAo+ICAgICBbPGZmZmY4MmQwODAz
ODU0MzI+XSBsc3Rhcl9lbnRlcisweDExMi8weDEyMAo+Cj4gRG9uJ3QgY2FsbCBmaXh1cF9pcnFz
KCkgYW5kIGRvbid0IHNlbmQgYW55IElQSSBpZiB0aGVyZSdzIG9ubHkgb25lCj4gb25saW5lIENQ
VSBhbnl3YXksIGFuZCBkb24ndCBjYWxsIF9fc3RvcF90aGlzX2NwdSgpIGF0IGFsbCB3aGVuIHRo
ZSBDUFUKPiB3ZSdyZSBvbiB3YXMgYWxyZWFkeSBtYXJrZWQgb2ZmbGluZSAoYnkgYSBwcmlvciBp
bnZvY2F0aW9uIG9mCj4gX19zdG9wX3RoaXNfY3B1KCkpLgo+Cj4gUmVwb3J0ZWQtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSXQgaXMgcHJvYmFibHkgd29ydGggbm90aW5n
IHRoYXQgdGhlIGFib3ZlIHN0YWNrIHRyYWNlIGlzIGEgY2FzY2FkZQpmYXVsdCwgd2hlcmUgd2Ug
dG9vayBhICNHUCBmYXVsdCBpbiB0aGUgbWlkZGxlIG9mIHRoZSBFRkkgZmlybXdhcmUsIGFuZAp0
aGVuIHRyaWVkIHJlc3RhcnRpbmcgYSBzZWNvbmQgdGltZS4KCkZvciB0aGUgY2hhbmdlIGl0IGlz
IGFuIGltcHJvdmVtZW50LCBzbyBBY2tlZC1ieTogQW5kcmV3IENvb3Blcgo8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KClRoZXJlIGFyZSBmdXJ0aGVyIGZpeGVzIG5lZWRpbmcgKHdoaWNoIGhh
dmUgYmVlbiBvbiBteSB0b2RvIGxpc3QgZm9yCnJhdGhlciB0b28gbG9uZykgdG8gYXZvaWQgYW55
IGxvY2FsX2lycV9lbmFibGUoKSBvbiB0aGUgc2h1dGRvd24gcGF0aCwKYmVjYXVzZSBkdXJpbmcg
YSBjcmFzaCAoZXNwZWNpYWxseSBvbmUgaW4gdGhlIG1pZGRsZSBvZiBhIHZjcHUgY29udGV4dApz
d2l0Y2gpLCBpdHMgbm90IHNhZmUgdG8gcmUtZW5hYmxlIGludGVycnVwdHMuCgpUaGUgb25seSBz
b2x1dGlvbiBJJ3ZlIGdvdCBpbnZvbHZlcyB1c2luZyBOTUkgYmFzZWQgSVBJcy9zaG9vdGRvd25z
LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
