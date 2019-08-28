Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0500A084B
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 19:20:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i31YV-0005JF-P3; Wed, 28 Aug 2019 17:16:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+/MF=WY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i31YU-0005JA-Fu
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 17:16:22 +0000
X-Inumbo-ID: 8da845c3-c9b7-11e9-ae49-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8da845c3-c9b7-11e9-ae49-12813bfff9fa;
 Wed, 28 Aug 2019 17:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567012580;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=OmiYV30sbefa/6doodoj6FgxZI7sqSv4r1ZbKzRpa/E=;
 b=Ots4iMiKjZzEFIh6zGtWEQIiXWcqVG+Uxj8wiiR8Z+7xvui68kOXjGoy
 x0iBc2XnwfcJoXJBwrJw1y4xQuWHoBMt2hvMCHpXL3+4g0qy2Hqb1wUxJ
 2QONOUak75u4Aj3qZeeOmurNvrJf2OfDwEASMx+zlMsHSXe/4eho1XDyA g=;
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
IronPort-SDR: VNKqCMqZcm/8XXbzaicOMQodIQuQuVq8j0mic6clwsqvd8vCEWfLZh3CJwHA2wmpuVwVRnltkv
 NGpTv22jJC5jbiF/PRZxdwRdHqazWb1ZhaxKtMQGZM2IZnpBZ3cSuz/nESlxfwFi2TUiW9A1aB
 12rHEgEk4rXuG5XaRpDAn7NqJ11lTPsRNfDzv0xJJ/RGPAYtyJil2MdEPhLSY/oTTIFUcPSr2N
 fqE4RgzzHNCn1n+qT4lZlBTfW3Os0oLBsDsfDQwatEXGUP/FgW0Z+SlynnoWDHMS4DaiVb0WAG
 KT0=
X-SBRS: 2.7
X-MesageID: 5024427
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,441,1559534400"; 
   d="scan'208";a="5024427"
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <CABfawhm+eu2ebwdou3btLJxcxBbq+uCHNxf82zahxp8dcsoDEQ@mail.gmail.com>
 <8c7ba37a-7fd0-4901-fd5b-4d04e02d63fc@suse.com>
 <CABfawhkHm89cqMu5m-6SiLU-r8m4kFXcTMAH_3cFfvRQCUDBug@mail.gmail.com>
 <43f75b07-0e2d-1c71-1a98-d3e875e09b82@suse.com>
 <CABfawhnc6-h_KAS62k08P0L98Q1ZCAm4AM7U_pJKdDVGnhH=MQ@mail.gmail.com>
 <50340e5f-32ab-f856-d1ec-5ed50a59e1ca@citrix.com>
 <CABfawhngYn69x3yERpVSWPdhEcR+W4Yb6Y20M1pGtKb=eA6LBQ@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <b4bd1a12-c156-4f1f-734c-5c3bb9c6cd42@citrix.com>
Date: Wed, 28 Aug 2019 18:16:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CABfawhngYn69x3yERpVSWPdhEcR+W4Yb6Y20M1pGtKb=eA6LBQ@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] Question about xenpage_list
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMDgvMjAxOSAxODowNywgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFdlZCwgQXVn
IDI4LCAyMDE5IGF0IDEwOjU1IEFNIEFuZHJldyBDb29wZXIKPiA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDI4LzA4LzIwMTkgMTc6MjUsIFRhbWFzIEsgTGVuZ3llbCB3
cm90ZToKPj4+IE9uIFdlZCwgQXVnIDI4LCAyMDE5IGF0IDk6NTQgQU0gSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPj4+PiBPbiAyOC4wOC4yMDE5IDE3OjUxLCBUYW1hcyBL
IExlbmd5ZWwgd3JvdGU6Cj4+Pj4+IE9uIFdlZCwgQXVnIDI4LCAyMDE5IGF0IDk6MzUgQU0gSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPj4+Pj4+IE9uIDI4LjA4LjIwMTkg
MTc6MjgsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4+Pj4+PiBIaSBhbGwsCj4+Pj4+Pj4gSSdt
IHRyeWluZyB0byB0cmFjayBkb3duIGhvdyBhIGNhbGwgaW4gY29tbW9uL2dyYW50X3RhYmxlLmMg
dG8KPj4+Pj4+PiBzaGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0IHdpbGwgYWN0dWFsbHkgcG9wdWxh
dGUgdGhhdCBwYWdlIGludG8gdGhlCj4+Pj4+Pj4gZ3Vlc3QncyBwaHlzbWFwLgo+PiBzaGFyZV94
ZW5fcGFnZV93aXRoX2d1ZXN0KCkgaXMgcGVyaGFwcyBwb29ybHkgbmFtZWQuICBJdCBtYWtlcyB0
aGUgcGFnZQo+PiBhYmxlIHRvIGJlIGluc2VydGVkIGludG8gdGhlIGd1ZXN0cyBwMm0uCj4+Cj4+
IEl0IGlzIGludGVybmFsIGFjY291bnRpbmcsIHNvIHRoYXQgdGhlIHBlcm1pc3Npb24gY2hlY2tz
IGluIGEgc3Vic2VxdWVudAo+PiBhZGRfdG9fcGh5c21hcCgpIGNhbGwgd2lsbCBwYXNzLgo+Pgo+
PiBQZXJoYXBzIGl0IHNob3VsZCBiZSBuYW1lZCAiYWxsb3dfZ3Vlc3RfYWNjZXNzX3RvX2ZyYW1l
KCkiIG9yIHNpbWlsYXIuCj4+Cj4+Pj4+Pj4gIEltbWVkaWF0ZWx5IGFmdGVyIHRoZSBjYWxsIHRo
ZSBwYWdlIGRvZXNuJ3Qgc2VlbSB0bwo+Pj4+Pj4+IGJlIHByZXNlbnQgaW4gdGhlIHBoeXNtYXAs
IGFzIHNoYXJlX3hlbl9wYWdlX3dpdGhfZ3Vlc3Qgd2lsbCBqdXN0IGFkZAo+Pj4+Pj4+IHRoZSBw
YWdlIHRvIHRoZSBkb21haW4ncyB4ZW5wYWdlX2xpc3QgbGlua2VkLWxpc3Q6Cj4+Pj4+Pj4KPj4+
Pj4+PiAgICAgICAgIHVuc2lnbmVkIGxvbmcgbWZuOwo+Pj4+Pj4+ICAgICAgICAgdW5zaWduZWQg
bG9uZyBnZm47Cj4+Pj4+Pj4KPj4+Pj4+PiAgICAgICAgIHNoYXJlX3hlbl9wYWdlX3dpdGhfZ3Vl
c3QodmlydF90b19wYWdlKGd0LT5zaGFyZWRfcmF3W2ldKSwgZCwgU0hBUkVfcncpOwo+Pj4+Pj4+
Cj4+Pj4+Pj4gICAgICAgICBtZm4gPSB2aXJ0X3RvX21mbihndC0+c2hhcmVkX3Jhd1tpXSk7Cj4+
Pj4+Pj4gICAgICAgICBnZm4gPSBtZm5fdG9fZ21mbihkLCBtZm4pOwo+Pj4+Pj4+Cj4+Pj4+Pj4g
ICAgICAgICBnZHByaW50ayhYRU5MT0dfSU5GTywgIlNoYXJpbmcgJWx4IC0+ICVseCB3aXRoIGRv
bWFpbiAldVxuIiwKPj4+Pj4+PiBnZm4sIG1mbiwgZC0+ZG9tYWluX2lkKTsKPj4+Pj4+Pgo+Pj4+
Pj4+IFRoaXMgcmVzdWx0cyBpbiB0aGUgZm9sbG93aW5nOgo+Pj4+Pj4+Cj4+Pj4+Pj4gKFhFTikg
Z3JhbnRfdGFibGUuYzoxODIwOmQwdjAgU2hhcmluZyBmZmZmZmZmZmZmZmZmZmZmIC0+IDQyYzcx
ZSB3aXRoIGRvbWFpbiAxCj4+Pj4+Pj4KPj4+Pj4+PiBBRkFJQ1QgdGhlIHBhZ2Ugb25seSBnZXRz
IHBvcHVsYXRlZCBpbnRvIHRoZSBwaHlzbWFwIG9uY2UgdGhlIGRvbWFpbgo+Pj4+Pj4+IGdldHMg
dW5wYXVzZWQuIElmIEkgbGV0IHRoZSBkb21haW4gcnVuIGFuZCB0aGVuIHBhdXNlIGl0IEkgY2Fu
IHNlZQo+Pj4+Pj4+IHRoYXQgdGhlIHBhZ2UgaXMgaW4gdGhlIGd1ZXN0J3MgcGh5c21hcCAoYnkg
bG9vcGluZyB0aHJvdWdoIGFsbCB0aGUKPj4+Pj4+PiBlbnRyaWVzIGluIGl0cyBFUFQpOgo+Pj4+
Pj4+Cj4+Pj4+Pj4gKFhFTikgbWVtX3NoYXJpbmcuYzoxNjM2OmQwdjAgMHhmMjAwMCAtPiAweDQy
YzcxZSBpcyBhIGdyYW50IG1hcHBpbmcKPj4+Pj4+PiBzaGFyZWQgd2l0aCB0aGUgZ3Vlc3QKPj4+
Pj4+IFRoaXMgc2hvdWxkIGJlIHRoZSByZXN1bHQgb2YgdGhlIGRvbWFpbiBoYXZpbmcgbWFkZSBh
IHJlc3BlY3RpdmUKPj4+Pj4+IFhFTk1BUFNQQUNFX2dyYW50X3RhYmxlIHJlcXVlc3QsIHNob3Vs
ZG4ndCBpdD8KPj4+Pj4+Cj4+Pj4+IERvIHlvdSBtZWFuIHRoZSBndWVzdCBpdHNlbGYgb3IgdGhl
IHRvb2xzdGFjaz8KPj4+PiBUaGUgZ3Vlc3QgaXRzZWxmIC0gaG93IHdvdWxkIHRoZSB0b29sIHN0
YWNrIGtub3cgd2hlcmUgdG8gcHV0IHRoZQo+Pj4+IGZyYW1lKHMpPwo+Pj4gSSBkb24ndCB0aGlu
ayB0aGF0IG1ha2VzIHNlbnNlLiBIb3cgd291bGQgYSBndWVzdCBpdHNlbGYgbm93IHRoYXQgaXQK
Pj4+IG5lZWRzIHRvIG1hcCB0aGF0IGZyYW1lPyBXaGVuIHlvdSByZXN0b3JlIHRoZSBWTSBmcm9t
IGEgc2F2ZWZpbGUsIGl0Cj4+PiBpcyBhbHJlYWR5IHJ1bm5pbmcgYW5kIG5vIGZpcm13YXJlIGlz
IGdvaW5nIHRvIHJ1biBpbiBpdCB0byBpbml0aWFsaXplCj4+PiBzdWNoIEdGTnMuCj4+Pgo+Pj4g
QXMgZm9yIHRoZSB0b29sc3RhY2ssIEkgc2VlIGNhbGxzIHRvIHhjX2RvbV9nbnR0YWJfc2VlZCBm
cm9tIHRoZQo+Pj4gdG9vbHN0YWNrIGR1cmluZyBkb21haW4gY3JlYXRpb24gKGJlIGl0IGEgbmV3
IGRvbWFpbiBvciBvbmUgYmVpbmcKPj4+IHJlc3RvcmVkIGZyb20gYSBzYXZlIGZpbGUpIHdoaWNo
IGRvZXMgaXNzdWUgYSBYRU5NRU1fYWRkX3RvX3BoeXNtYXAKPj4+IHdpdGggdGhlIHNwYWNlIGJl
aW5nIHNwZWNpZmllZCBhcyBYRU5NQVBTUEFDRV9ncmFudF90YWJsZS4gTG9va3MgbGlrZQo+Pj4g
aXQgZ2F0aGVycyB0aGUgR0ZOIHZpYSB4Y19jb3JlX2FyY2hfZ2V0X3NjcmF0Y2hfZ3Bmbi4gU28g
aXQgbG9va3MgbGlrZQo+Pj4gdGhhdCdzIGhvdyBpdHMgZG9uZS4KPj4gT24gZG9tYWluIGNyZWF0
aW9uLCB0aGUgdG9vbHN0YWNrIG5lZWRzIHRvIHdyaXRlIHRoZSBzdG9yZS9jb25zb2xlIGdyYW50
Cj4+IGVudHJ5Lgo+Pgo+PiBJZiBYRU5NRU1fYWNxdWlyZV9yZXNvdXJjZSBpcyBhdmFpbGFibGUg
YW5kIHVzYWJsZSAobmVlZHMgbmV3aXNoIFhlbiBhbmQKPj4gZG9tMCBrZXJuZWwpLCB0aGVuIHRo
YXQgbWV0aG9kIGlzIHByZWZlcnJlZC4gIFRoaXMgbGV0cyB0aGUgdG9vbHN0YWNrCj4+IG1hcCB0
aGUgZ3JhbnQgdGFibGUgZnJhbWUgZGlyZWN0bHksIHdpdGhvdXQgaW5zZXJ0aW5nIGl0IGludG8g
dGhlIGd1ZXN0cwo+PiBwMm0gZmlyc3QuCj4+Cj4+IFRoZSBmYWxsYmFjayBwYXRoIGlzIHRvIHBp
Y2sgYSBmcmVlIHBmbiwgaW5zZXJ0IGl0IGludG8gdGhlIGd1ZXN0Cj4+IHBoeXNtYXAsIGZvcmVp
Z24gbWFwIGl0LCB3cml0ZSB0aGUgZW50cmllcywgdW5tYXAgYW5kIHJlbW92ZSBmcm9tIHRoZQo+
PiBndWVzdCBwaHlzbWFwLiAgVGhpcyBoYXMgdmFyaW91cyBwb29yIHByb3BlcnRpZXMgbGlrZSBz
aGF0dGVyaW5nCj4+IHN1cGVycGFnZXMgZm9yIHRoZSBndWVzdCwgYW5kIGEgZ2VuZXJhbCBpbmFi
aWxpdHkgdG8gZnVuY3Rpb24gY29ycmVjdGx5Cj4+IG9uY2UgdGhlIGd1ZXN0IGhhcyBzdGFydGVk
IGV4ZWN1dGluZyBhbmQgaGFzIGEgYmFsbG9vbiBkcml2ZXIgaW4gcGxhY2UuCj4+Cj4+IEF0IGEg
bGF0ZXIgcG9pbnQsIG9uY2UgdGhlIGd1ZXN0IHN0YXJ0cyBleGVjdXRpbmcsIGEgZ3JhbnQtdGFi
bGUgYXdhcmUKPj4gcGFydCBvZiB0aGUga2VybmVsIG91Z2h0IHRvIG1hcCB0aGUgZ3JhbnQgdGFi
bGUgYXQgdGhlIGtlcm5lbHMgcHJlZmVycmVkCj4+IGxvY2F0aW9uIGFuZCBrZWVwIGl0IHRoZXJl
IHBlcm1hbmVudGx5Lgo+Pgo+IE9LLCBtYWtlcyBzZW5zZSwgYnV0IHdoZW4gdGhlIGd1ZXN0IGlz
IGJlaW5nIHJlc3RvcmVkIGZyb20gYSBzYXZlZmlsZSwKPiBob3cgZG9lcyBpdCBrbm93IHRoYXQg
aXQgbmVlZHMgdG8gZG8gdGhhdCBtYXBwaW5nIGFnYWluPyBUaGF0IGZyYW1lIGlzCj4gYmVpbmcg
cmUtY3JlYXRlZCBkdXJpbmcgcmVzdG9yYXRpb24sIHNvIHdoZW4gdGhlIGd1ZXN0IHN0YXJ0cyB0
bwo+IGV4ZWN1dGUgYWdhaW4gaXQgd291bGQganVzdCBoYXZlIGEgd2hvbGUgd2hlcmUgdGhhdCBw
YWdlIHVzZWQgdG8gYmUuCgpUaGlzIGlzIHdoZXJlIHdlIGdldCB0byB0aGUgcHJvYmxlbXMgb2Yg
WGVuJ3MgIm1pZ3JhdGlvbiIgbm90IGJlaW5nCnRyYW5zcGFyZW50LsKgIEN1cnJlbnRseSBpdCBp
cyB0aGUgcmVxdWlyZW1lbnQgb2YgdGhlIGd1ZXN0IGtlcm5lbCB0bwpyZW1hcCB0aGUgZ3JhbnQg
dGFibGUgb24gcmVzdW1lLgoKVGhpcyBpcyBhIHJlYXNvbmFibGUgcmVxdWlyZW1lbnQgZm9yIFBW
IGd1ZXN0cy7CoCBCZWNhdXNlIFBWIGd1ZXN0Cmtlcm5lbHMgbWFpbnRhaW4gdGhlaXIgb3duIFAy
TSwgaXQgaXMgaW1wb3NzaWJsZSB0byBtaWdyYXRlIHRyYW5zcGFyZW50bHkuCgpUaGlzIHNob3Vs
ZCBuZXZlciBoYXZlIG1hZGUgaXQgaW50byB0aGUgSFZNIEFCSSwgYnV0IGl0IGRpZCBhbmQgd2Un
cmUgYQpkZWNhZGUgdG9vIGxhdGUsIGFuZCBvbmx5IGp1c3Qgc3RhcnRpbmcgdG8gcGljayB1cCB0
aGUgcGllY2VzLgoKSSBwcmVzdW1lIHlvdSdyZSBkb2luZyBzb21lIHBhZ2luZyB3b3JrIGhlcmUs
IGFuZCBhcmUgbG9naWNhbGx5CnJlc3RvcmluZyBhIGd1ZXN0IHdpdGhvdXQgaXRzIGtub3dsZWRn
ZT8KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
