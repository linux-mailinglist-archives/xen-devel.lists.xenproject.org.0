Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 204421647DD
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 16:09:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4Qwb-0000ak-2m; Wed, 19 Feb 2020 15:07:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O8+/=4H=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j4QwZ-0000af-GN
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 15:07:19 +0000
X-Inumbo-ID: 8552c9bf-5329-11ea-839b-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8552c9bf-5329-11ea-839b-12813bfff9fa;
 Wed, 19 Feb 2020 15:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582124838;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Rp0+G4n+nr233zTW26vOlGN8ccyCk7bv+yFGH2/c7GU=;
 b=iTJMixMcmhrssqkD7b9a2KAMdpjJ7Gil3IgyqAxX5LHhFAwoGcyABt1G
 fI8B6Kca6Xziuc/49phd8uPPgIhempNEaXcLj7ZXfzebe8mcbfCr+O3oa
 6yDu6h3H51j1vWQmlzH379N/rUiLCxEzKmgCwfjE7/wOIkwyFahsgPXEg Q=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ujHdYu6l4qTk/K1/L9e6jLJ2X2W/3Pcxoa8xflXdBHQJfyn9/SKv8HKFTIw/UDmlr18YM9VRd9
 hDOfnOhuTed3tIRC8cHjwS8PdmuaJRbt3WxQhQIFrn83h0xnoK4PNehJe7wCuCLUOUJ4ZYhB6n
 YS/Ab/Wy5Ac4+kmN0/tlFgbYNh+V8eqvoODk44Gn7gOkMz2eWmD4mqnPVLHpCPnKwQk3akmRxg
 mRxt50JPSeaaSllRRsHUqPw4msqa4IvZIljd8PbsvngjRkex1JNp4VHOuNNuK59Vh9DRQGCIQW
 55M=
X-SBRS: 2.7
X-MesageID: 13053193
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,459,1574139600"; d="scan'208";a="13053193"
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20200213113237.58795-1-roger.pau@citrix.com>
 <20200213113237.58795-3-roger.pau@citrix.com>
 <1b278189-c96a-796a-1733-a3584809227f@suse.com>
 <20200219132217.GB4679@Air-de-Roger>
 <960b4da8-4522-082a-42b9-ab870698a5ec@suse.com>
 <20200219144549.GD4679@Air-de-Roger>
 <3ae51529-1cfe-9872-68a4-ab57d634a1cd@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <63d07524-3e72-06e4-cc16-a0a1561a5c68@citrix.com>
Date: Wed, 19 Feb 2020 15:07:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3ae51529-1cfe-9872-68a4-ab57d634a1cd@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/2] smp: convert cpu_hotplug_begin into a
 blocking lock acquisition
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkvMDIvMjAyMCAxNDo1NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTkuMDIuMjAyMCAx
NTo0NSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4gT24gV2VkLCBGZWIgMTksIDIwMjAgYXQg
MDI6NDQ6MTJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBPbiAxOS4wMi4yMDIwIDE0
OjIyLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4+IE9uIFdlZCwgRmViIDE5LCAyMDIwIGF0
IDAxOjU5OjUxUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxMy4wMi4yMDIw
IDEyOjMyLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+Pj4+PiBEb24ndCBhbGxvdyBjcHVfaG90
cGx1Z19iZWdpbiB0byBmYWlsIGJ5IGNvbnZlcnRpbmcgdGhlIHRyeWxvY2sgaW50byBhCj4+Pj4+
PiBibG9ja2luZyBsb2NrIGFjcXVpc2l0aW9uLiBXcml0ZSB1c2VycyBvZiB0aGUgY3B1X2FkZF9y
ZW1vdmVfbG9jayBhcmUKPj4+Pj4+IGxpbWl0ZWQgdG8gQ1BVIHBsdWcvdW5wbHVnIG9wZXJhdGlv
bnMsIGFuZCBjYW5ub3QgZGVhZGxvY2sgYmV0d2Vlbgo+Pj4+Pj4gdGhlbXNlbHZlcyBvciBvdGhl
ciB1c2VycyB0YWtpbmcgdGhlIGxvY2sgaW4gcmVhZCBtb2RlIGFzCj4+Pj4+PiBjcHVfYWRkX3Jl
bW92ZV9sb2NrIGlzIGFsd2F5cyBsb2NrZWQgd2l0aCBpbnRlcnJ1cHRzIGVuYWJsZWQuIFRoZXJl
Cj4+Pj4+PiBhcmUgYWxzbyBubyBvdGhlciBsb2NrcyB0YWtlbiBkdXJpbmcgdGhlIHBsdWcvdW5w
bHVnIG9wZXJhdGlvbnMuCj4+Pj4+IEkgZG9uJ3QgdGhpbmsgdGhlIGdvYWwgd2FzIGRlYWRsb2Nr
IGF2b2lkYW5jZSwgYnV0IHJhdGhlciBsaW1pdGluZwo+Pj4+PiBvZiB0aGUgdGltZSBzcGVudCBz
cGlubmluZyB3aGlsZSB0cnlpbmcgdG8gYWNxdWlyZSB0aGUgbG9jaywgaW4KPj4+Pj4gZmF2b3Ig
b2YgaGF2aW5nIHRoZSBjYWxsZXIgcmV0cnkuCj4+Pj4gTm93IHRoYXQgdGhlIGNvbnRlbnRpb24g
YmV0d2VlbiByZWFkLW9ubHkgdXNlcnMgaXMgcmVkdWNlZCBhcyB0aG9zZQo+Pj4+IGNhbiB0YWtl
IHRoZSBsb2NrIGluIHBhcmFsbGVsIEkgdGhpbmsgaXQncyBzYWZlIHRvIHN3aXRjaCB3cml0ZXJz
IHRvCj4+Pj4gYmxvY2tpbmcgbW9kZS4KPj4+IEknZCBhZ3JlZSBpZiB3cml0ZXJzIGNvdWxkbid0
IGJlIHN0YXJ2ZWQgYnkgKG1hbnkpIHJlYWRlcnMuCj4+IEFGQUlDVCBmcm9tIHRoZSBydyBsb2Nr
IGltcGxlbWVudGF0aW9uIHJlYWRlcnMgd29uJ3QgYmUgYWJsZSB0byBwaWNrCj4+IHRoZSBsb2Nr
IGFzIHNvb24gYXMgdGhlcmUncyBhIHdyaXRlciB3YWl0aW5nLCB3aGljaCBzaG91bGQgYXZvaWQg
dGhpcwo+PiBzdGFydmF0aW9uPwo+Pgo+PiBZb3Ugc3RpbGwgbmVlZCB0byB3YWl0IGZvciBjdXJy
ZW50IHJlYWRlcnMgdG8gZHJvcCB0aGUgbG9jaywgYnV0IG5vCj4+IG5ldyByZWFkZXJzIHdvdWxk
IGJlIGFibGUgdG8gbG9jayBpdCwgd2hpY2ggSSB0aGluayBzaG91bGQgZ2l2YmUgdXMKPj4gZW5v
dWdoIGZhaXJuZXNzLgo+IEFoLCByaWdodCwgaXQgd2FzIHJhdGhlciB0aGUgb3RoZXIgd2F5IGFy
b3VuZCAtIGJhY2stdG8tYmFjawo+IHdyaXRlcnMgY2FuIHN0YXJ2ZSByZWFkZXJzIHdpdGggb3Vy
IGN1cnJlbnQgaW1wbGVtZW50YXRpb24uCj4KPj4gT1RPSCB3aGVuIHVzaW5nIF90cnlsb2NrIG5l
dyByZWFkZXJzIGNhbiBzdGlsbCBwaWNrCj4+IHRoZSBsb2NrIGluIHJlYWQgbW9kZSwgYW5kIGhl
bmNlIEkgdGhpbmsgdXNpbmcgYmxvY2tpbmcgbW9kZSBmb3IKPj4gd3JpdGVycyBpcyBhY3R1YWxs
eSBiZXR0ZXIsIGFzIHlvdSBjYW4gYXNzdXJlIHRoYXQgcmVhZGVycyB3b24ndCBiZQo+PiBhYmxl
IHRvIHN0YXJ2ZSB3cml0ZXJzLgo+IFRoaXMgaXMgYSBnb29kIHBvaW50LiBOZXZlcnRoZWxlc3Mg
SSByZW1haW4gdW5jb252aW5jZWQgdGhhdAo+IHRoZSBjaGFuZ2UgaXMgd2FycmFudGVkIGdpdmVu
IHRoZSBvcmlnaW5hbCBpbnRlbnRpb25zIChhcyBmYXIKPiBhcyB3ZSdyZSBhYmxlIHRvIHJlY29u
c3RydWN0IHRoZW0pLiBJZiB0aGUgY3VycmVudCBiZWhhdmlvcgo+IGdldHMgaW4gdGhlIHdheSBv
ZiBzZW5zaWJsZSBzaGltIG9wZXJhdGlvbiwgcGVyaGFwcyB0aGUKPiBiZWhhdmlvciBzaG91bGQg
YmUgbWFkZSBkZXBlbmRlbnQgdXBvbiBydW5uaW5nIGluIHNoaW0gbW9kZT8KCkhvdHBsdWcgaXNu
J3QgZ2VuZXJhbGx5IHVzZWQgYXQgYWxsLCBzbyB0aGVyZSBpcyAwIHdyaXRlIHByZXNzdXJlIG9u
IHRoZQpsb2NrLgoKV2hlbiBpdCBpcyB1c2VkLCBpdCBpcyBhbGwgYXQgZXhwbGljaXQgcmVxdWVz
dCBmcm9tIHRoZSBjb250cm9sbGluZwplbnRpdHkgaW4gdGhlIHN5c3RlbSAoaGFyZHdhcmUgZG9t
YWluLCBvciBzaW5nbGV0b24gc2hpbSBkb21haW4pLgoKSWYgdGhhdCBlbnRpdHkgaXMgdHJ5aW5n
IHRvIERvUyB5b3UsIHlvdSd2ZSBhbHJlYWR5IGxvc3QuCgpUaGVyZSBtaWdodCBiZSBhdHRlbXB0
cyB0byBqdXN0aWZ5IHdoeSB0aGUgbG9ja2luZyB3YXMgZG9uZSBsaWtlIHRoYXQgaW4KdGhlIGZp
cnN0IHBsYWNlLCBidXQgaXQgZG9lc24ndCBtZWFuIHRoZXkgd2VyZSBuZWNlc3NhcmlseSBjb3Jy
ZWN0IHRvCmJlaW5nIHdpdGgsIGFuZCB0aGV5IGRvbid0IG1hdGNoIHVwIHdpdGggdGhlIHJlYWxp
c3RpYyB1c2FnZSBvZiB0aGUgbG9jay4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
