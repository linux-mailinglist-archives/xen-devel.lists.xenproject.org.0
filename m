Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDFB11CCEC
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 13:19:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifNPS-0006Le-DK; Thu, 12 Dec 2019 12:17:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Md0W=2C=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ifNPR-0006LU-Ho
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 12:17:33 +0000
X-Inumbo-ID: 5aa7cd12-1cd9-11ea-a914-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5aa7cd12-1cd9-11ea-a914-bc764e2007e4;
 Thu, 12 Dec 2019 12:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576153044;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=kRbf0LZMyS12MTZ/b2u346PTMiySi3B4NJzjYHwCJoY=;
 b=bdTK3x5c2Uz5C0eDbQGIhyeYF57bBN4Jc6OTzWw788f+6/U0Y+8QG29+
 YYCgJDb+SVmbzcDCZkka0L8jcVk5/ESKDs4vG15SpRzaPG9Py0qOeeaW5
 dSfxYKx+PTH0TMfsCCldw3VLoJsqMy1MZkXDnIovZ9STP/hHSDI1yckRQ 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wNV+NkTwLLuIHuRvtFnCyKUKMJckleKoGyx0A2VQdW5++nWHOl3UuIP5IAESMEB7oXHhuML6ut
 CuKKW3PEoWaOlbR8JpM4m8obS4x53v6/d+uXcAgmYyj6zdou6UrbMHlzEk9aqYeqR53jUhrAJ7
 gytTVa/+lmtZVi9fVzGRs08zD6oGzBpnKnI4xUxAXFiBfd3T8+CTHbdTCjdXTP5lpRbxuVCK7b
 j2/SxQ7jYb3Scdi4Sc3uPbbx3XpELWoqfSh1796T9LY6e4Jp+qJJehV8JepZmgo99QZTVCwfkg
 JZ0=
X-SBRS: 2.7
X-MesageID: 10144271
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,305,1571716800"; d="scan'208";a="10144271"
To: Jan Beulich <jbeulich@suse.com>
References: <83dd739a-8170-e135-51c4-c9716f47d3d6@suse.com>
 <bbfe755e-cab6-4c97-30d4-fefd8afbac0c@citrix.com>
 <fc7b85d5-7be6-884c-6602-31888d5bf531@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <00cee51f-5f38-a169-9688-526bb28f27d6@citrix.com>
Date: Thu, 12 Dec 2019 12:17:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <fc7b85d5-7be6-884c-6602-31888d5bf531@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86emul: correct segment override decode
 for 64-bit mode
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMTIvMjAxOSAxMDowNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTEuMTIuMjAxOSAy
MTo1MSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTEvMTIvMjAxOSAwOToyNywgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBUaGUgbGVnYWN5IC8gY29tcGF0aWJpbGl0eSBtb2RlIEVTLCBDUywg
U1MsIGFuZCBEUyBvdmVycmlkZXMgYXJlIG51bGwKPj4+IHByZWZpeGVzIGluIDY0LWJpdCBtb2Rl
LCBpLmUuIHRoZXkgaW4gcGFydGljdWxhciBkb24ndCBjYW5jZWwgYW4KPj4+IGVhcmxpZXIgRlMg
b3IgR1Mgb25lLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KPj4gbnVsbCBpcyBhIHZlcnkgb3ZlcmxvYWRlZCB0ZXJtLsKgIFdoYXQgeW91IG1l
YW4gaGVyZSBpcyBzaW1wbHkgImlnbm9yZWQiLgo+IFRoZSBBTUQgUE0gaGFzICJJbnN0ZWFkLCB0
aGV5IGFyZSB0cmVhdGVkIGFzIG51bGwgcHJlZml4ZXMuIiBUaGlzIGlzCj4gd2hhdCBJJ3ZlIHRh
a2VuIHRvIHVzZSBoZXJlLiBJJ20gaGFwcHkgdG8gdGFrZSB3aGF0ZXZlciBvdGhlcgo+IHNlbnNp
YmxlIHdvcmRpbmcgeW91IGxpa2UgYmV0dGVyIChpbmNsdWRpbmcgImlnbm9yZWQiKS4gQnV0IEkn
ZCBsaWtlCj4geW91IHRvIGV4cGxpY2l0bHkgY2xhcmlmeSB0aGF0IHlvdSdyZSBub3Qgb2theSB3
aXRoIG1lIHVzaW5nIGEgdGVybQo+IGZyb20gdmVuZG9yIGRvY3VtZW50YXRpb24gaGVyZS4KCiJJ
Z25vcmVkIiBpcyB0aGUgbW9yZSBkZXNjcmlwdGl2ZSB0ZXJtLCBtYXRjaGVzIDIgZGlmZmVyZW50
IHBhcnRzIG9mIHRoZQpBUE0sIGFuZCBtb3N0IGltcG9ydGFudGx5LCBtb3JlIG9idmlvdXNseSBt
YXRjaGVzIHRoZSBjb2RlLgoKSSBjYW4ndCBldmVuIHNwb3QgbWVudGlvbiBvZiB0aGlzIGJlaGF2
aW91ciBpbiB0aGUgU0RNLgoKPgo+PiBJbiBhdHRlbXB0aW5nIHRvIGNvbmZpcm0vdGVzdCB0aGlz
LCBJJ3ZlIGZvdW5kIHlldCBhbm90aGVyIGN1cmlvc2l0eQo+PiB3aXRoIGluc3RydWN0aW9uIGxl
bmd0aCBjYWxjdWxhdGlvbnMgd2hlbiByZW9yZGVyaW5nIGEgcmV4IHByZWZpeCBhbmQKPj4gbGVn
YWN5IHByZWZpeC7CoCBPYmpkdW1wIGdldHMgaXQgd3JvbmcsIGJ1dCB0aGUgaW5zdHJ1Y3Rpb24g
Ym91bmRhcmllcwo+PiBhY2NvcmRpbmcgdG8gc2luZ2xlc3RlcCBhcmUgd2VpcmQuCj4gT2JqZHVt
cCBnZXR0aW5nIGl0IHdyb25nIGlzIG5vIHN1cnByaXNlIGF0IGFsbCB0byBtZSAod2hpY2ggaXMg
b25lCj4gb2YgdGhlIHJlYXNvbnMgd2h5IEkgcHJlZmVyIHRvIHVzZSBteSBvd24gZGlzYXNzZW1i
bGVyIHdoZXJldmVyCj4gcG9zc2libGUpLiBZZXQgd2l0aG91dCB5b3Ugc3BlbGxpbmcgb3V0IHdo
YXQgc3BlY2lmaWMgYW5vbWFsaWVzCj4geW91J3ZlIG9ic2VydmVkIChvciB3aGF0IHdlaXJkbmVz
cyB0aGVyZSBpcyB3aXRoIHNpbmdsZSBzdGVwcGluZykKPiBJIHdvbid0IGtub3cgd2hldGhlciBJ
IG1heSB3YW50IHRvIG1ha2UgYW4gYXR0ZW1wdCBhdCBmaXhpbmcKPiBvYmpkdW1wLiBOb3IgY2Fu
IEkgc2VlIHdoYXQgdGhpcyBjb21tZW50J3MgaW1wbGljYXRpb24gaXMgb24gdGhlCj4gcGF0Y2gg
aGVyZSwgaS5lLiB3aGF0IGNoYW5nZXMgeW91IG1lYW4gbWUgdG8gbWFrZS4KClRoZSBzZXF1ZW5j
ZSBpbiBxdWVzdGlvbiBpczoKCjEwNDhhMTrCoMKgwqAgNDjCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgwqDCoMKgIHJleC5XCjEwNDhhMjrCoMKgwqAgMmUgOGIgMzLCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgwqDCoMKgIG1vdsKgwqDCoCAlY3M6KCVyZHgpLCVlc2kKCndoaWNo
IHdhcyBkZWxpYmVyYXRlbHkgcGVybXV0aW5nIHRoZSByZXggYW5kICVjcyBwcmVmaXggdG8gc2Vl
IHdoYXQKaGFwcGVuZWQuCgpUaGUgaW5zdHJ1Y3Rpb24gYm91bmRhcnkgaXNzdWUgd2FzIGEgbWlz
dGFrZSBpbiBteSBjb2RlIGFuZCB3aXRoIGl0CmZpeGVkLCBib3RoIEludGVsIGFuZCBBTUQgcHJv
Y2Vzc29ycyBhZ3JlZSB0aGF0IHRoZSBhYm92ZSA0IGJ5dGVzIGlzIGEKc2luZ2xlIGluc3RydWN0
aW9uIHdpdGggMzJiaXQgb3BlcmFuZCBzaXplLsKgIHg4Nl9lbXVsYXRlKCkgYWxzbyBhZ3JlZXMs
CndoaWNoIHdhcyB0aGUgcG9pbnQgb2YgdGhlIHRlc3QuCgpBcyBJJ3ZlIHJlc29sdmVkIHRoZSBp
bnN0cnVjdGlvbiBsZW5ndGggYW1iaWd1aXR5LCBBY2tlZC9UZXN0ZWQtYnk6CkFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
