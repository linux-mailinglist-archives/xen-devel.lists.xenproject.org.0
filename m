Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 129BC7E154
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 19:46:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htF7m-0003fu-7U; Thu, 01 Aug 2019 17:44:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mTSR=V5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1htF7k-0003fp-9W
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 17:44:20 +0000
X-Inumbo-ID: fa425c2a-b483-11e9-aa89-6790ca81af39
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa425c2a-b483-11e9-aa89-6790ca81af39;
 Thu, 01 Aug 2019 17:44:15 +0000 (UTC)
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
IronPort-SDR: sSSVFZGVuYZePGqEPmBLJKjPEjWzUAooL6fqH1BIuI+dJcJxkiHoEwYw8GKFvfL6sEhDiNyW9z
 64DM8n6M5GPX/Kg8KUTdn31xEKAypVkC0AA8FBO8zPVrXishahbLNakySh9XS7iCskK332xYSZ
 TGFQYKBD7reX1y8T4RgXvBBD5/hj+kfdHw7Pun43rkp93z2ElaB4a7Tpydxc9CqrIn99c5+yCf
 j0mAZyyajow5OS3Uamd55IVhlf/AmCU6ol07qcJoYTUS0siSXETtp6VPIxofRWmxnl6L1rzcV8
 EeE=
X-SBRS: 2.7
X-MesageID: 3858696
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,335,1559534400"; 
   d="scan'208";a="3858696"
To: Roman Shaposhnik <roman@zededa.com>, Anthony PERARD
 <anthony.perard@citrix.com>
References: <CAMmSBy_60jh+YXMVEm0PnEnD-MP4R1A5AKEKWL62V_1bc2L5cw@mail.gmail.com>
 <20190801103019.GC5791@perard.uk.xensource.com>
 <CAMmSBy8t+ttKrVJ_aRFZxt-WCz7N0V5Of3yoZ9=8tmyySbpKAw@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <a4e1b6bc-2d0c-7976-a740-4bae9282434d@citrix.com>
Date: Thu, 1 Aug 2019 18:43:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy8t+ttKrVJ_aRFZxt-WCz7N0V5Of3yoZ9=8tmyySbpKAw@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [BUG] Assertion failed: !blk->legacy_dev
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEvMDgvMjAxOSAxODozNSwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPiBPbiBUaHUsIEF1
ZyAxLCAyMDE5IGF0IDM6MzAgQU0gQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJp
eC5jb20+IHdyb3RlOgo+PiBPbiBXZWQsIEp1bCAzMSwgMjAxOSBhdCAwMToxMToyMlBNIC0wNzAw
LCBSb21hbiBTaGFwb3NobmlrIHdyb3RlOgo+Pj4gSGkhCj4+IEhpIFJvbWFuLAo+Pgo+PiBUaGFu
a3MgZm9yIHRoZSBidWcgcmVwb3J0IQo+Pgo+PiBUaGF0IGJ1ZyAodGVjaG5pY2FsIGRlYnQgcmVh
bGx5KSB3YXMgZml4ZWQgaW4gUUVNVSA0LjAgKHNvIHdpbGwgYmUgZml4ZWQKPj4gaW4gWGVuIDQu
MTMpLiBJdCdzIGEgc2VyaWVzIG9mIHBhdGNoIHdpdGggdGhlIGxhc3Qgb25lIGJlZW4gZGI5ZmY0
NiBpZgo+PiB5b3Ugd2FudCB0byBoYXZlIGEgbG9vay4KPiBHb3QgaXQhIElzIHRoZXJlIGFueSBx
dWljayB3YXkgaG93IEkgY2FuIGNoZWNrIHRoYXQgdGhpcywgaW5kZWVkLCBzb2x2ZXMKPiBvdXIg
cHJvYmxlbSBhbmQgSSBjYW4gcmVtb3ZlIHRoZSBvdXQtb2YtdHJlZSBwYXRjaD8gSSBqdXN0IHJl
YWxseQo+IHdhbnQgdG8gbWFrZSBzdXJlIHRoYXQgd2hlbiA0LjEzIGNvbWVzIG91dCAtLSB0aGUg
aXNzdWUgaXMgZml4ZWQuCj4KPiBJJ20gc3RpbGwgYSBsaXR0bGUgYml0IG5ldyB0byBYZW4gZGV2
ZWxvcG1lbnQsIHNvIEkgZ3Vlc3MgSSBuZWVkIHRvIGNvbWJpbmU6Cj4gICAgICBodHRwOi8veGVu
Yml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9c3VtbWFyeQo+ICAgICAgaHR0cDovL3hl
bmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9cWVtdS14ZW4uZ2l0O2E9c3VtbWFyeQo+IHNvbWVob3cg
dG8gZ2V0IHRoZSBzYW1lIHRyZWUgSSBnZXQgd2hlbiBJIGRvd25sb2FkIGFuIG9mZmljaWFsIHJl
bGVhc2U/Cj4KPiBJcyB0aGVyZSBhIHNjcmlwdCBvciBiZXR0ZXIgeWV0IGEgbmlnaHRseSBidWls
ZCBvZiBzb21lIHNvcnQ/CgpTbyB0aGlzIGlzIGFuIGFyZWEgb2YgdGhlIFhlbiBidWlsZCBzeXN0
ZW0gd2hpY2ggYWxsIGRpc3RybyBkb3duc3RyZWFtcwpoYXRlIGFuZCB3b3JrIGFyb3VuZC4KCkRp
c3Ryb3MgZG9uJ3Qgc2hpcCB0d28gdmVyaXNvbnMgb2YgcWVtdSwgYW5kIGRvbid0IHdhbnQgWGVu
IHRvIGhhdmUgaXRzCm93biBwcml2YXRlIHZlcnNpb24uwqAgVGhlIGN1cnJlbnQgYmVoYXZpb3Vy
IGlzIHNvbWV3aGVyZSBiZXR3ZWVuICJ0aGF0cwpob3cgaXQgd2FzIGFsd2F5cyBkb25lIiBhbmQg
YSBjb252ZW5pZW5jZSBmb3IgZGV2ZWxvcGVycy4KClRoZSBjb21tb24gc29sdXRpb24gaXMgdG8g
YnVpbGQgdGhlIFhlbiB0b29scyB3aXRoCgouL2NvbmZpZ3VyZSAtLXdpdGgtc3lzdGVtLXFlbXU9
L3Vzci9saWI2NC94ZW4vYmluL3FlbXUtc3lzdGVtLWkzODYKCihwYXRoIGFzIGFwcHJvcHJpYXRl
IGZvciBkb20wKSB3aGljaCB0ZWxscyB4bCgvbGlieGw/IEkgZm9yZ2V0IHdoaWNoKQp3aGVyZSB0
byBmaW5kIHFlbXUsIGJ1dCBvdGhlcndpc2Uga2VlcHMgaXQgYXMgYW4gaW5kZXBlbmRlbnQgY29t
cG9uZW50LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
