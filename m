Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0E31519DC
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 12:30:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iywN7-0003gj-VV; Tue, 04 Feb 2020 11:28:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fS9R=3Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iywN5-0003ge-Je
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 11:27:59 +0000
X-Inumbo-ID: 648a141b-4741-11ea-8f11-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 648a141b-4741-11ea-8f11-12813bfff9fa;
 Tue, 04 Feb 2020 11:27:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 28AFAAD27;
 Tue,  4 Feb 2020 11:27:58 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200121084330.18309-1-jgross@suse.com>
 <20200121084330.18309-5-jgross@suse.com>
 <05b9770e-1554-1f71-3757-4feb9c1fa247@suse.com>
 <d258dd8e-cd89-140e-4bf1-d0001f3eb32b@suse.com>
 <2ecc4058-a350-d67b-f860-0b2bf26ee5ca@suse.com>
 <e6235120-1c40-efcb-887e-4581ed374d56@suse.com>
 <7676bff8-dd0d-c9fa-2666-c362ed7c1e3e@suse.com>
 <2e414b42-83f3-0496-8449-baae286683cc@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <09f068f7-52e3-0f5e-7325-8d902d3efec0@suse.com>
Date: Tue, 4 Feb 2020 12:28:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <2e414b42-83f3-0496-8449-baae286683cc@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 4/9] xen: add basic hypervisor filesystem
 support
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDIuMjAyMCAxMTo0OCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwNC4wMi4yMCAx
MDo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA0LjAyLjIwMjAgMTA6MjEsIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+PiBPbiAwNC4wMi4yMCAwOTo0OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gT24gMDQuMDIuMjAyMCAwNzo0MywgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4+Pj4gT24gMDMu
MDIuMjAgMTY6MDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMjEuMDEuMjAyMCAwOTo0
MywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4+PiArc3RydWN0IHhlbl9oeXBmc19kaXJlbnRy
eSB7Cj4+Pj4+Pj4gKyAgICB1aW50MTZfdCBmbGFnczsKPj4+Pj4+PiArI2RlZmluZSBYRU5fSFlQ
RlNfV1JJVEVBQkxFICAgIDB4MDAwMQo+Pj4+Pj4+ICsgICAgdWludDhfdCB0eXBlOwo+Pj4+Pj4+
ICsjZGVmaW5lIFhFTl9IWVBGU19UWVBFX0RJUiAgICAgMHgwMDAwCj4+Pj4+Pj4gKyNkZWZpbmUg
WEVOX0hZUEZTX1RZUEVfQkxPQiAgICAweDAwMDEKPj4+Pj4+PiArI2RlZmluZSBYRU5fSFlQRlNf
VFlQRV9TVFJJTkcgIDB4MDAwMgo+Pj4+Pj4+ICsjZGVmaW5lIFhFTl9IWVBGU19UWVBFX1VJTlQg
ICAgMHgwMDAzCj4+Pj4+Pj4gKyNkZWZpbmUgWEVOX0hZUEZTX1RZUEVfSU5UICAgICAweDAwMDQK
Pj4+Pj4+PiArI2RlZmluZSBYRU5fSFlQRlNfVFlQRV9CT09MICAgIDB4MDAwNQo+Pj4+Pj4+ICsg
ICAgdWludDhfdCBlbmNvZGluZzsKPj4+Pj4+PiArI2RlZmluZSBYRU5fSFlQRlNfRU5DX1BMQUlO
ICAgIDB4MDAwMAo+Pj4+Pj4+ICsjZGVmaW5lIFhFTl9IWVBGU19FTkNfR1pJUCAgICAgMHgwMDAx
Cj4+Pj4+Pgo+Pj4+Pj4gTWVhbmluZyBJIGNhbiBlLmcuIGhhdmUgYSBnemlwLWVkIHN0cmluZyBv
ciBib29sIChvciBldmVuIGRpcik/Cj4+Pj4+PiBJZiB0aGlzIGlzIGp1c3QgZm9yICJibG9iIiwg
d2h5IGhhdmUgc2VwYXJhdGUgZmllbGRzIGluc3RlYWQgb2YKPj4+Pj4+IGUuZy4gQkxPQl9SQVcg
YW5kIEJMT0JfR1pJUCBvciBzb21lIHN1Y2g/Cj4+Pj4+Cj4+Pj4+IGd6aXAtZWQgc3RyaW5nIG9y
IGJsb2IgYXJlIHRoZSBwcmltYXJ5IHRhcmdldHMuCj4+Pj4+Cj4+Pj4+IE1heWJlIHdlIHdhbnQg
dG8gaGF2ZSBvdGhlciBlbmNvZGluZyBzIGxhdGVyIChBbmRyZXcgYXNrZWQgZm9yIHRoYXQKPj4+
Pj4gcG9zc2liaWxpdHkgd2hlbiBJIHBvc3RlZCB0aGUgcGF0Y2ggZm9yIHJldHJpZXZpbmcgdGhl
IC5jb25maWcgZmlsZQo+Pj4+PiBjb250ZW50cyBlYXJseSBsYXN0IHllYXIpLgo+Pj4+Cj4+Pj4g
VG8gbWUgaXQgd291bGQgc2VlbSBwcmVmZXJhYmxlIGlmIHRoZSBjb250ZW50cyBvZiBhIGJsb2IK
Pj4+PiBpZGVudGlmaWVkIGl0c2VsZiBhcyB0byBpdHMgZm9ybWF0LiBCdXQgc2luY2UgdGhpcyBs
ZWF2ZXMKPj4+PiByb29tIGZvciBhbWJpZ3VpdGllcyBJIGFjY2VwdCB0aGF0IHRoZSBmb3JtYXQg
bmVlZHMKPj4+PiBzcGVjaWZ5aW5nLiBIb3dldmVyLCB0byBtZSBhIGd6aXAtZWQgc3RyaW5nIGlz
IGFzIGdvb2QgYXMgYQo+Pj4+IGd6aXAtZWQgYmxvYiwgYW5kIGhlbmNlIEkgc3RpbGwgdGhpbmsg
c3ViLWRpdmlkaW5nICJibG9iIiBpcwo+Pj4+IHRoZSB3YXkgdG8gZ28sIHdpdGggbm8gc2VwYXJh
dGUgImVuY29kaW5nIi4gT3RoZXJ3aXNlIGF0IHRoZQo+Pj4+IHZlcnkgbGVhc3QgYSBjb21tZW50
IGhlcmUgd291bGQgbmVlZCBhZGRpbmcgdG8gY2xhcmlmeSB3aGF0Cj4+Pj4gY29tYmluYXRpb25z
IGFyZSB2YWxpZCAvIHRvIGJlIGV4cGVjdGVkIGJ5IGNhbGxlcnMuCj4+Pgo+Pj4gbGlieGVuaHlw
ZnMgaXMgYWJsZSB0byBoYW5kbGUgYWxsIHBvc3NpYmxlIGNvbWJpbmF0aW9ucy4gSSBqdXN0IGRv
bid0Cj4+PiB0aGluayBzb21lIG9mIHRoZSBjb21iaW5hdGlvbnMgYXJlIG1ha2luZyBzZW5zZSAo
Z3ppcC1pbmcgYSBiaW5hcnkKPj4+IHZhbHVlIG9mIDQgYnl0ZXMgZS5nLiBpcyBub25zZW5zZSku
Cj4+Pgo+Pj4gT1RPSCBpbiBjYXNlIHdlJ2xsIGFkZCBsYXJnZSBhcnJheXMgb2YgbG9uZ3MgaW4g
dGhlIGZ1dHVyZSBpdCBtaWdodCBiZQo+Pj4gYmVuZWZpY2lhbCB0byBjb21wcmVzcyB0aGVtIGlu
IHNvbWUgd2F5LiBTbyBJJ2QgbGlrZSB0byBrZWVwIHR5cGUgYW5kCj4+PiBlbmNvZGluZyBhcyBz
ZXBhcmF0ZSBpbmZvcm1hdGlvbi4KPj4KPj4gT2theSwgSSdtIG5vdCBlbnRpcmVseSBvcHBvc2Vk
LiBCdXQgSSdkIGJlIGN1cmlvdXMgaWYgYW55b25lCj4+IGVsc2UgaGFzIGFuIG9waW5pb24gaGVy
ZS4KPiAKPiBJIHRoaW5rIGNvbnRlbnQgdHlwZSBhbmQgdHJhbnNwb3J0IGVuY29kaW5nIHNob3Vs
ZCBub3QgYmUgbWl4ZWQgdXAuIFRoZXkKPiBhcmUgb3J0aG9nb25hbCB0byBlYWNoIG90aGVyIGFu
ZCBzbyB0aGV5IHNob3VsZCBiZSBoYW5kbGVkLgoKSW4gcHJpbmNpcGxlIEkgYWdyZWUsIGJ1dCAi
YmxvYiIgcmVhbGx5IGNvdmVycyBhbnl0aGluZyBvciBub3RoaW5nCmF0IGFsbC4gWWVzLCBpZiBz
dHJpbmdzIGFyZSBtZWFudCB0byBiZSBwb3NzaWJsZSB0byBiZSBnemlwLWVkLAp0aGVuIHRoZXJl
IGlzIHZhbHVlIGluIHRoZSBzZXBhcmF0aW9uLiBJJ20gbm90IGZ1bGx5IGNvbnZpbmNlZAp0aG91
Z2ggdGhhdCBzdWNoIGNvbXByZXNzZWQgc3RyaW5ncyAoQXJlIHlvdSB0aGlua2luZyBhYm91dAou
Y29uZmlnIGhlcmU/KSBzaG91bGRuJ3Qgc2ltcGx5IGJlICJibG9iIiB0aGVuLCB0b28uCgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
