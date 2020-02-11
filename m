Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EF0159545
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 17:45:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1YcD-0005jf-Px; Tue, 11 Feb 2020 16:42:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=46st=37=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j1YcC-0005jV-CK
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 16:42:24 +0000
X-Inumbo-ID: 7a2ad2ee-4ced-11ea-8434-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a2ad2ee-4ced-11ea-8434-bc764e2007e4;
 Tue, 11 Feb 2020 16:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581439344;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iII0XkEWQ+64BtZs9wgZnK1T/7lEWMZqrUauibw6iAo=;
 b=CVQXhqFumsYxcWo/ySsfgT0udW6tZ9+HHe2BUCBkR3nR2LAy4QwbVjuw
 Ria9xKM1rpqvauLKSBGD7WvdCve9aOM/ozrE5MdJebkXyv8PAyQjREnKZ
 +9rdh2w4mvv2tZZW1M0BIQdPAqeBvgF/Xkd3lhrGupG62b60D2fls+mDJ M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sGDLvTzSgdK6dL2SBGRme0VDqawK3IlYKEmH48g4vJia/ibnmfykrd4HKsUNgGFUe9+Vio8FDL
 3GiXLFrvu4cAeHLVHq4pXt94q3gmBony22D9vAGd7pLav+BPeP77+/xWfU8ljNGgKCjBYR5hLm
 Li+zssszAzshyxPM/tmmxgMzdjQ1liB+VVDCHM0Iw2Bn3qf9TZTPiX9o1TP5P4x4NG35d9wWJ3
 baW83YmKz2L8hIVgUcfeHP12D4B9pnARadJXQAQ6nC+t0GcgsAzQ/69QMhQ6m8nCORdGUW2InD
 gFc=
X-SBRS: 2.7
X-MesageID: 12277970
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,428,1574139600"; d="scan'208";a="12277970"
Date: Tue, 11 Feb 2020 17:42:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <20200211164215.GN4679@Air-de-Roger>
References: <2b7826d9-8822-97c8-0637-03bcb98d6418@citrix.com>
 <20200211160149.GL4679@Air-de-Roger>
 <7edfe77a-183b-8927-ffe7-d0ba2bd939e2@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7edfe77a-183b-8927-ffe7-d0ba2bd939e2@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] PV Shim ballooning
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMTEsIDIwMjAgYXQgMDQ6Mjk6MzZQTSArMDAwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gT24gMTEvMDIvMjAyMCAxNjowMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+
IE9uIFR1ZSwgRmViIDExLCAyMDIwIGF0IDAxOjM5OjQyUE0gKzAwMDAsIEFuZHJldyBDb29wZXIg
d3JvdGU6Cj4gPj4gU2hpbSBjYW4ndCBkZWNyZWFzZSByZXNlcnZhdGlvbiAoSFZNIHdpdGggTDAg
WGVuKSBvbiBhbnkgZnJhbWUgd2hvJ3MKPiA+PiByZWZlcmVuY2UgY291bnQgZGlkbid0IGRyb3Ag
dG8gMCBmcm9tIHRoZSBQViBndWVzdHMnIGNhbGwsIGFuZCB0aGVyZSBpcwo+ID4+IG5vdGhpbmcg
cHJlc2VudGx5IHRvIGNoZWNrIHRoaXMgY29uZGl0aW9uLgo+ID4gCj4gPiBCdXQgc2hpbSB3aWxs
IG9ubHkgYmFsbG9vbiBvdXQgZnJlZSBkb21oZWFwIHBhZ2VzIChhcyBpdCBnZXRzIHRoZW0KPiA+
IGZyb20gYWxsb2NfZG9taGVhcF9wYWdlcyksIGFuZCB0aG9zZSBzaG91bGRuJ3QgaGF2ZSBhbnkg
cmVmZXJlbmNlIGJ5Cj4gPiB0aGUgZ3Vlc3Q/Cj4gCj4gQ29ycmVjdCwgaG93ZXZlciBhbGwgdGhl
IGd1ZXN0cyB0aGF0IHdlIHRlc3QgaW4gWGVuUlQgYmVoYXZlIHByb3Blcmx5Lgo+IEknbSBub3Qg
YXdhcmUgb2YgYW55IGd1ZXN0IHRoYXQga2VlcHMgcmVmZXJlbmNlcyBhZnRlciBjYWxsaW5nCj4g
ZGVjcmVhc2VfcmVzZXJ2YXRpb24oKS4KPiAKPiA+PiBTaG9ydCBvZiBhIFBHQyBiaXQgYW5kIGV4
dHJhIHNoaW0gbG9naWMgaW4gZnJlZV9kb21oZWFwX3BhZ2UoKSwgSSBjYW4ndAo+ID4+IHNlZSBh
bnkgd2F5IHRvIHJlY29uY2lsZSB0aGUgYmVoYXZpb3VyLCBleGNlcHQgdG8gY2hhbmdlIHRoZSBz
ZW1hbnRpY3MKPiA+PiBvZiBkZWNyZWFzZSByZXNlcnZhdGlvbiBmb3IgUFYgZ3Vlc3RzLsKgIElu
IHByYWN0aWNlLCB0aGlzIHdvdWxkIGJlIGZhcgo+ID4+IG1vcmUgc2Vuc2libGUgYmVoYXZpb3Vy
LCBidXQgd2UgaGF2ZSBubyBpZGVhIGlmIGV4aXN0aW5nIFBWIGd1ZXN0cyB3b3VsZAo+ID4+IG1h
bmFnZS4KPiA+IAo+ID4gSG0sIEkgZ3Vlc3Mgd2UgY291bGQgYWRkIHNvbWUgaG9vayB0byBmcmVl
X2RvbWhlYXBfcGFnZSBpbiBvcmRlciB0bwo+ID4gcmVtb3ZlIHRoZW0gZnJvbSB0aGUgcGh5c21h
cCBvbmNlIHRoZSBndWVzdCBmcmVlcyB0aGVtPwo+ID4KPiA+IEhvdyBkb2VzIFhlbiBrbm93IHdo
aWNoIHBhZ2VzIGZyZWVkIGJ5IGEgUFYgZ3Vlc3Qgc2hvdWxkIGJlIGJhbGxvb25lZAo+ID4gb3V0
Pwo+IAo+IEl0IGRvZXNuJ3QgY3VycmVudGx5LgoKV2VsbCwgbm90IHdoZW4gcnVubmluZyBvbiB0
aGUgc2hpbSwgYnV0IEkgZ3Vlc3Mgd2hlbiBydW5uaW5nIGFzIGEKY2xhc3NpYyBQViBndWVzdCB0
aGUgcmVzZXJ2YXRpb24gZm9yIHRoZSBndWVzdCB3aWxsIGJlIGxvd2VyZWQgKHNvCnRoYXQgYWZ0
ZXIgdGhlIGNhbGwgdG8gZGVjcmVhc2VfcmVzZXJ2YXRpb24gdGhlIGd1ZXN0IHdpbGwgaGF2ZSBh
bgpvdmVyY29tbWl0IG9mIG1lbW9yeSkgYW5kIHBhZ2VzIHdvdWxkIGJlIHJlbW92ZWQgZnJvbSB0
aGUgZG9taGVhcCBhcwpyZWZlcmVuY2VzIGFyZSBkcm9wcGVkLgoKPiAKPiA+IElzIHRoYXQgZG9u
ZSBzb2xlbHkgYmFzZWQgb24gdGhlIGZhY3QgdGhhdCB0aG9zZSBwYWdlcyBkb24ndCBoYXZlIGFu
eQo+ID4gcmVmZXJlbmNlPwo+IAo+IFllcy4KPiAKPiA+IFRoYXQgZG9lc24ndCBzZWVtIGxpa2Ug
YSB2aWFibGUgb3B0aW9uIHVubGVzcyB3ZSBhZGQgYSBuZXcgYml0IHRvIHRoZQo+ID4gcGFnZSBz
dHJ1Y3QgaW4gb3JkZXIgdG8gc2lnbmFsIHRoYXQgdGhvc2UgcGFnZXMgc2hvdWxkIGJlIGJhbGxv
b25lZAo+ID4gb3V0IG9uY2UgZnJlZWQsIGFzIHlvdSBzdWdnZXN0Lgo+IAo+IEFncmVlLiBCdXQg
YXMgSSBzYWlkIEknbSBub3QgYXdhcmUgb2YgYW55IGd1ZXN0IHRoYXQgdmlvbGF0ZXMgdGhlCj4g
aW52YXJpYW50IG9mIGRlY3JlYXNlX3Jlc2VydmF0aW9uKCkgYmVpbmcgdGhlIGxhc3QgY2FsbC4K
Ck1heWJlIHdlIGNvdWxkIHBpZ2d5YmFjayBvbiB3aGV0aGVyIGEgcGFnZSBpcyByZW1vdmVkIGZy
b20gdGhlIGRvbWFpbgpkb21oZWFwIGFuZCB1c2UgdGhhdCBhcyBhIHNpZ25hbCB0aGF0IHRoZSBw
YWdlIHNob3VsZCBiZSBiYWxsb29uZWQKb3V0PwoKVGhlcmUncyBhbHJlYWR5IGFuIGFyY2hfZnJl
ZV9oZWFwX3BhZ2UgdGhhdCdzIGNhbGxlZCB3aGVuIGEgcGFnZSBpcwpyZW1vdmVkIGZyb20gYSBk
b21haW4sIHdoaWNoIG1pZ2h0IGJlIHN1aXRhYmxlIGZvciB0aGlzLiBJdCB3b3VsZApob3dldmVy
IGltcGx5IG1ha2luZyBhbiBoeXBlcmNhbGwgZm9yIGV2ZXJ5IHBhZ2UgdG8gYmUgYmFsbG9vbmVk
IG91dC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
