Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 151F2151901
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 11:52:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyvkc-0007yZ-53; Tue, 04 Feb 2020 10:48:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4ZTP=3Y=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iyvka-0007yU-JG
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 10:48:12 +0000
X-Inumbo-ID: d5bd5abc-473b-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5bd5abc-473b-11ea-b211-bc764e2007e4;
 Tue, 04 Feb 2020 10:48:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EA76CB021;
 Tue,  4 Feb 2020 10:48:08 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200121084330.18309-1-jgross@suse.com>
 <20200121084330.18309-5-jgross@suse.com>
 <05b9770e-1554-1f71-3757-4feb9c1fa247@suse.com>
 <d258dd8e-cd89-140e-4bf1-d0001f3eb32b@suse.com>
 <2ecc4058-a350-d67b-f860-0b2bf26ee5ca@suse.com>
 <e6235120-1c40-efcb-887e-4581ed374d56@suse.com>
 <7676bff8-dd0d-c9fa-2666-c362ed7c1e3e@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2e414b42-83f3-0496-8449-baae286683cc@suse.com>
Date: Tue, 4 Feb 2020 11:48:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <7676bff8-dd0d-c9fa-2666-c362ed7c1e3e@suse.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDIuMjAgMTA6NTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA0LjAyLjIwMjAgMTA6
MjEsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDA0LjAyLjIwIDA5OjQ4LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDA0LjAyLjIwMjAgMDc6NDMsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+
Pj4gT24gMDMuMDIuMjAgMTY6MDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyMS4wMS4y
MDIwIDA5OjQzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+Pj4gK3N0YXRpYyBpbnQgaHlwZnNf
cmVhZChjb25zdCBzdHJ1Y3QgaHlwZnNfZW50cnkgKmVudHJ5LAo+Pj4+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIHVhZGRyLCB1bnNpZ25lZCBs
b25nIHVsZW4pCj4+Pj4+PiArewo+Pj4+Pj4gKyAgICBzdHJ1Y3QgeGVuX2h5cGZzX2RpcmVudHJ5
IGU7Cj4+Pj4+PiArICAgIGxvbmcgcmV0ID0gLUVJTlZBTDsKPj4+Pj4+ICsKPj4+Pj4+ICsgICAg
aWYgKCB1bGVuIDwgc2l6ZW9mKGUpICkKPj4+Pj4+ICsgICAgICAgIGdvdG8gb3V0Owo+Pj4+Pj4g
Kwo+Pj4+Pj4gKyAgICBlLmZsYWdzID0gZW50cnktPndyaXRlID8gWEVOX0hZUEZTX1dSSVRFQUJM
RSA6IDA7Cj4+Pj4+PiArICAgIGUudHlwZSA9IGVudHJ5LT50eXBlOwo+Pj4+Pj4gKyAgICBlLmVu
Y29kaW5nID0gZW50cnktPmVuY29kaW5nOwo+Pj4+Pj4gKyAgICBlLmNvbnRlbnRfbGVuID0gZW50
cnktPnNpemU7Cj4+Pj4+PiArCj4+Pj4+PiArICAgIHJldCA9IC1FRkFVTFQ7Cj4+Pj4+PiArICAg
IGlmICggY29weV90b19ndWVzdCh1YWRkciwgJmUsIDEpICkKPj4+Pj4+ICsgICAgICAgIGdvdG8g
b3V0Owo+Pj4+Pj4gKwo+Pj4+Pj4gKyAgICByZXQgPSAwOwo+Pj4+Pj4gKyAgICBpZiAoIHVsZW4g
PCBlbnRyeS0+c2l6ZSArIHNpemVvZihlKSApCj4+Pj4+PiArICAgICAgICBnb3RvIG91dDsKPj4+
Pj4KPj4+Pj4gU28geW91IHJldHVybiAic3VjY2VzcyIgZXZlbiBpZiB0aGUgb3BlcmF0aW9uIGRp
ZG4ndCBjb21wbGV0ZQo+Pj4+PiBzdWNjZXNzZnVsbHkuIFRoaXMgaXNuJ3QgdmVyeSBuaWNlLCBw
bHVzIC4uLgo+Pj4+Cj4+Pj4gVGhlIGRpcmVudHJ5IGNvbnRhaW5zIHRoZSBuZWVkZWQgc2l6ZS4g
VGhlIGNhbGxlciBzaG91bGQga25vdyB0aGUKPj4+PiBzaXplIGhlIHBhc3NlZCB0byBYZW4uCj4+
Pj4KPj4+Pj4KPj4+Pj4+ICsgICAgZ3Vlc3RfaGFuZGxlX2FkZF9vZmZzZXQodWFkZHIsIHNpemVv
ZihlKSk7Cj4+Pj4+PiArCj4+Pj4+PiArICAgIHJldCA9IGVudHJ5LT5yZWFkKGVudHJ5LCB1YWRk
cik7Cj4+Pj4+Cj4+Pj4+IC4uLiBob3cgaXMgdGhlIGNhbGxlciB0byBrbm93IHdoZXRoZXIgZGly
ZW50cnkgd2FzIGF0IGxlYXN0Cj4+Pj4+IGNvcGllZCBpZiB0aGlzIHRoZW4gZmFpbHM/Cj4+Pj4K
Pj4+PiBJcyB0aGlzIHJlYWxseSBpbXBvcnRhbnQ/IE5vcm1hbGx5IC1FRkFVTFQgc2hvdWxkIGp1
c3Qgbm90IGhhcHBlbi4gSW4KPj4+PiBjYXNlIGl0IGRvZXMgSSBkb24ndCB0aGluayB0aGUgY2Fs
bGVyIGNhbiBtYWtlIHJlYWwgdXNlIG9mIHRoZSBkaXJlbnRyeS4KPj4+Cj4+PiAiSW1wb3J0YW50
IiBoYXMgdmFyaW91cyBwb3NzaWJsZSBtZWFuaW5ncy4gVGhlIHN1Y2Nlc3MvZmFpbHVyZQo+Pj4g
aW5kaWNhdGlvbiB0byB0aGUgY2FsbGVyIHNob3VsZCBhdCBsZWFzdCBiZSByYXRpb25hbC4gIklm
IHRoZQo+Pj4gZGF0YSBidWZmZXIgd2FzIG5vdCBsYXJnZSBlbm91Z2ggZm9yIGFsbCB0aGUgZGF0
YSBubyBlbnRyeSBkYXRhCj4+PiBpcyByZXR1cm5lZCwgYnV0IHRoZSBkaXJlbnRyeSB3aWxsIGNv
bnRhaW4gdGhlIG5lZWRlZCBzaXplIGZvcgo+Pj4gdGhlIHJldHVybmVkIGRhdGEiIGlzIGZpbmUg
dG8gYmUgc3RhdGVkIGluIHRoZSBwdWJsaWMgaGVhZGVyLAo+Pj4gYnV0IEkgdGhpbmsgdGhpcyB3
YW50cyB0byBiZSAtRU5PQlVGUyB0aGVuLCBub3QgMCAoc3VjY2VzcykuCj4+Cj4+IEkgd291bGQg
YmUgZmluZSB3aXRoIHRoaXMsIGJ1dCB0aGlzIGNvbnRyYWRpY3RzIHlvdXIgcHJldmlvdXMgZGVt
YW5kCj4+IG5vdCB0byBlbnVtZXJhdGUgdGhlIHBvc3NpYmxlIGZhaWx1cmUgY2FzZXMsIHdoaWNo
IHdvdWxkIGJlIGVzc2VudGlhbAo+PiBmb3IgdGhpcyBjYXNlLgo+IAo+IFNsaWdodGx5IHJlLXdy
aXRpbmcgdGhlIHBhcnQgb2YgdGhlIGNvbW1lbnQgSSBkaWQgcXVvdGUgd291bGQgYmUKPiBhbGwg
dGhhdCdzIG5lZWRlZCBhZmFpY3Q6ICJJZiB0aGUgZGF0YSBidWZmZXIgd2FzIG5vdCBsYXJnZSBl
bm91Z2gKPiBmb3IgYWxsIHRoZSBkYXRhIC1FTk9CVUZTIGFuZCBubyBlbnRyeSBkYXRhIGlzIHJl
dHVybmVkLCBidXQgdGhlCj4gZGlyZW50cnkgd2lsbCBjb250YWluIHRoZSBuZWVkZWQgc2l6ZSBm
b3IgdGhlIHJldHVybmVkIGRhdGEuIgoKT2theS4gRmluZSB3aXRoIG1lLgoKPiAKPj4+Pj4+ICsg
ICAgdW5pb24gewo+Pj4+Pj4gKyAgICAgICAgY2hhciBidWZbOF07Cj4+Pj4+PiArICAgICAgICB1
aW50OF90IHU4Owo+Pj4+Pj4gKyAgICAgICAgdWludDE2X3QgdTE2Owo+Pj4+Pj4gKyAgICAgICAg
dWludDMyX3QgdTMyOwo+Pj4+Pj4gKyAgICAgICAgdWludDY0X3QgdTY0Owo+Pj4+Pj4gKyAgICB9
IHU7Cj4+Pj4+PiArCj4+Pj4+PiArICAgIEFTU0VSVChsZWFmLT5lLnR5cGUgPT0gWEVOX0hZUEZT
X1RZUEVfVUlOVCAmJiBsZWFmLT5lLnNpemUgPD0gOCk7Cj4+Pj4+PiArCj4+Pj4+PiArICAgIGlm
ICggdWxlbiAhPSBsZWFmLT5lLnNpemUgKQo+Pj4+Pj4gKyAgICAgICAgcmV0dXJuIC1FRE9NOwo+
Pj4+Pgo+Pj4+PiBJcyB0aGlzIHJlc3RyaWN0aW9uIHJlYWxseSBuZWNlc3Nhcnk/IFNldHRpbmcg
ZS5nLiBhIDQtYnl0ZQo+Pj4+PiBmaWVsZCBmcm9tIDEtYnl0ZSBpbnB1dCBpcyBubyBwcm9ibGVt
IGF0IGFsbC4gVGhpcyBiZWluZyBmb3IKPj4+Pj4gYm9vbGVhbnMgSSBhbnl3YXkgd29uZGVyIHdo
eSBpbnB1dCBtaWdodCBiZSBoZWxwZnVsIHRvIGhhdmUKPj4+Pj4gbGFyZ2VyIHRoYW4gYSBzaW5n
bGUgYnl0ZS4gQnV0IG1heWJlIGFsbCBvZiB0aGlzIGlzIGFnYWluIGEKPj4+Pj4gcmVzdWx0IG9m
IG5vdCBzZWVpbmcgd2hhdCBhIHVzZXIgb2YgdGhlIGZ1bmN0aW9uIHdvdWxkIGxvb2sKPj4+Pj4g
bGlrZS4KPj4+Pgo+Pj4+IEkgd2FudGVkIHRvIGhhdmUgYXMgbGl0dGxlIGZ1bmN0aW9uYWxpdHkg
YXMgcG9zc2libGUgaW4gdGhlIGh5cGVydmlzb3IuCj4+Pj4gSXQgaXMgbm8gcHJvYmxlbSBmb3Ig
dGhlIGxpYnJhcnkgdG8gcGFzcyBhIHByb3Blcmx5IHNpemVkIGJ1ZmZlci4KPj4+Pgo+Pj4+IEFs
bG93aW5nIGxhcmdlciB2YXJpYWJsZXMgZm9yIGJvb2xlYW5zIGlzIGp1c3QgYSBjb25zZXF1ZW5j
ZSBvZiB0aGUKPj4+PiBoeXBlcnZpc29yIHBhcmFtZXRlcnMgYWxsb3dpbmcgdGhhdC4KPj4+Cj4+
PiBCdXQgdGhlIGNhbGxlciBzaG91bGRuJ3QgYmUgY29uY2VybmVkIG9mIHRoZSBoeXBlcnZpc29y
Cj4+PiBpbXBsZW1lbnRhdGlvbiBkZXRhaWwgb2Ygd2hhdCB0aGUgY2hvc2Ugd2lkdGggaXMuIE92
ZXIgdGltZSB3ZQo+Pj4gZS5nLiBjb252ZXJ0IGludCAoYWxvbmcgd2l0aCBib29sX3QpIHRvIGJv
b2wgd2hlbiBpdCdzIHVzZWQgaW4KPj4+IGEgYm9vbGVhbiB3YXkuIFRoaXMgc2hvdWxkIG5vdCBy
ZXN1bHQgaW4gdGhlIGNhbGxlciBuZWVkaW5nIHRvCj4+PiBjaGFuZ2UsIGRlc3BpdGUgdGhlIHdp
ZHRoIGNoYW5nZSBvZiB0aGUgdmFyaWFibGUuCj4+Cj4+IFRoaXMgaXMgYmFzaWNhbGx5IGEgY29u
c2VxdWVuY2Ugb2Ygbm93IHBhc3NpbmcgYmluYXJ5IHZhbHVlcyB0byBhbmQgZnJvbQo+PiB0aGUg
aHlwZXJ2aXNvci4KPj4KPj4gVGhlIG5vcm1hbCB3YXkgb2YgaGFuZGxpbmcgdGhpcyAoYXMgY2Fu
IGJlIHNlZW4gaW4gbGlieGVuaHlwZnMpIGlzIHRvCj4+IHF1ZXJ5IHRoZSBoeXBlcnZpc29yIGZv
ciB0aGUgc2l6ZSBvZiB0aGUgdmFsdWUgKG5vIG1hdHRlciB3aGV0aGVyIGl0cwo+PiBpbnQsIHVp
bnQgb3IgYm9vbCkgYW5kIHRoZW4gdG8gZG8gdGhlIGNvbnZlcnNpb24gYmV0d2VlbiBBU0NJSSBh
bmQgdGhlCj4+IGJpbmFyeSB2YWx1ZSBhdCB0aGUgY2FsbGVyJ3Mgc2lkZS4KPiAKPiBJIGNhbiBz
ZWUgd2h5IHRoaXMgaXMgbmVlZGVkIGZvciBlLmcuIGludGVnZXIgdmFsdWVzLCBidXQgSSBkb24n
dAo+IHNlZSB0aGUgbmVlZCBmb3IgYm9vbGVhbnMuCgpBdCBzb21lIGxldmVsIHRoZSBjb252ZXJz
aW9uIG5lZWRzIHRvIGJlIGRvbmUuIEknZCByYXRoZXIgZG8gaXQgZm9yIGFsbAp0eXBlcyBhdCB0
aGUgc2FtZSBsZXZlbC4KCj4gCj4+Pj4+PiArc3RydWN0IHhlbl9oeXBmc19kaXJlbnRyeSB7Cj4+
Pj4+PiArICAgIHVpbnQxNl90IGZsYWdzOwo+Pj4+Pj4gKyNkZWZpbmUgWEVOX0hZUEZTX1dSSVRF
QUJMRSAgICAweDAwMDEKPj4+Pj4+ICsgICAgdWludDhfdCB0eXBlOwo+Pj4+Pj4gKyNkZWZpbmUg
WEVOX0hZUEZTX1RZUEVfRElSICAgICAweDAwMDAKPj4+Pj4+ICsjZGVmaW5lIFhFTl9IWVBGU19U
WVBFX0JMT0IgICAgMHgwMDAxCj4+Pj4+PiArI2RlZmluZSBYRU5fSFlQRlNfVFlQRV9TVFJJTkcg
IDB4MDAwMgo+Pj4+Pj4gKyNkZWZpbmUgWEVOX0hZUEZTX1RZUEVfVUlOVCAgICAweDAwMDMKPj4+
Pj4+ICsjZGVmaW5lIFhFTl9IWVBGU19UWVBFX0lOVCAgICAgMHgwMDA0Cj4+Pj4+PiArI2RlZmlu
ZSBYRU5fSFlQRlNfVFlQRV9CT09MICAgIDB4MDAwNQo+Pj4+Pj4gKyAgICB1aW50OF90IGVuY29k
aW5nOwo+Pj4+Pj4gKyNkZWZpbmUgWEVOX0hZUEZTX0VOQ19QTEFJTiAgICAweDAwMDAKPj4+Pj4+
ICsjZGVmaW5lIFhFTl9IWVBGU19FTkNfR1pJUCAgICAgMHgwMDAxCj4+Pj4+Cj4+Pj4+IE1lYW5p
bmcgSSBjYW4gZS5nLiBoYXZlIGEgZ3ppcC1lZCBzdHJpbmcgb3IgYm9vbCAob3IgZXZlbiBkaXIp
Pwo+Pj4+PiBJZiB0aGlzIGlzIGp1c3QgZm9yICJibG9iIiwgd2h5IGhhdmUgc2VwYXJhdGUgZmll
bGRzIGluc3RlYWQgb2YKPj4+Pj4gZS5nLiBCTE9CX1JBVyBhbmQgQkxPQl9HWklQIG9yIHNvbWUg
c3VjaD8KPj4+Pgo+Pj4+IGd6aXAtZWQgc3RyaW5nIG9yIGJsb2IgYXJlIHRoZSBwcmltYXJ5IHRh
cmdldHMuCj4+Pj4KPj4+PiBNYXliZSB3ZSB3YW50IHRvIGhhdmUgb3RoZXIgZW5jb2RpbmcgcyBs
YXRlciAoQW5kcmV3IGFza2VkIGZvciB0aGF0Cj4+Pj4gcG9zc2liaWxpdHkgd2hlbiBJIHBvc3Rl
ZCB0aGUgcGF0Y2ggZm9yIHJldHJpZXZpbmcgdGhlIC5jb25maWcgZmlsZQo+Pj4+IGNvbnRlbnRz
IGVhcmx5IGxhc3QgeWVhcikuCj4+Pgo+Pj4gVG8gbWUgaXQgd291bGQgc2VlbSBwcmVmZXJhYmxl
IGlmIHRoZSBjb250ZW50cyBvZiBhIGJsb2IKPj4+IGlkZW50aWZpZWQgaXRzZWxmIGFzIHRvIGl0
cyBmb3JtYXQuIEJ1dCBzaW5jZSB0aGlzIGxlYXZlcwo+Pj4gcm9vbSBmb3IgYW1iaWd1aXRpZXMg
SSBhY2NlcHQgdGhhdCB0aGUgZm9ybWF0IG5lZWRzCj4+PiBzcGVjaWZ5aW5nLiBIb3dldmVyLCB0
byBtZSBhIGd6aXAtZWQgc3RyaW5nIGlzIGFzIGdvb2QgYXMgYQo+Pj4gZ3ppcC1lZCBibG9iLCBh
bmQgaGVuY2UgSSBzdGlsbCB0aGluayBzdWItZGl2aWRpbmcgImJsb2IiIGlzCj4+PiB0aGUgd2F5
IHRvIGdvLCB3aXRoIG5vIHNlcGFyYXRlICJlbmNvZGluZyIuIE90aGVyd2lzZSBhdCB0aGUKPj4+
IHZlcnkgbGVhc3QgYSBjb21tZW50IGhlcmUgd291bGQgbmVlZCBhZGRpbmcgdG8gY2xhcmlmeSB3
aGF0Cj4+PiBjb21iaW5hdGlvbnMgYXJlIHZhbGlkIC8gdG8gYmUgZXhwZWN0ZWQgYnkgY2FsbGVy
cy4KPj4KPj4gbGlieGVuaHlwZnMgaXMgYWJsZSB0byBoYW5kbGUgYWxsIHBvc3NpYmxlIGNvbWJp
bmF0aW9ucy4gSSBqdXN0IGRvbid0Cj4+IHRoaW5rIHNvbWUgb2YgdGhlIGNvbWJpbmF0aW9ucyBh
cmUgbWFraW5nIHNlbnNlIChnemlwLWluZyBhIGJpbmFyeQo+PiB2YWx1ZSBvZiA0IGJ5dGVzIGUu
Zy4gaXMgbm9uc2Vuc2UpLgo+Pgo+PiBPVE9IIGluIGNhc2Ugd2UnbGwgYWRkIGxhcmdlIGFycmF5
cyBvZiBsb25ncyBpbiB0aGUgZnV0dXJlIGl0IG1pZ2h0IGJlCj4+IGJlbmVmaWNpYWwgdG8gY29t
cHJlc3MgdGhlbSBpbiBzb21lIHdheS4gU28gSSdkIGxpa2UgdG8ga2VlcCB0eXBlIGFuZAo+PiBl
bmNvZGluZyBhcyBzZXBhcmF0ZSBpbmZvcm1hdGlvbi4KPiAKPiBPa2F5LCBJJ20gbm90IGVudGly
ZWx5IG9wcG9zZWQuIEJ1dCBJJ2QgYmUgY3VyaW91cyBpZiBhbnlvbmUKPiBlbHNlIGhhcyBhbiBv
cGluaW9uIGhlcmUuCgpJIHRoaW5rIGNvbnRlbnQgdHlwZSBhbmQgdHJhbnNwb3J0IGVuY29kaW5n
IHNob3VsZCBub3QgYmUgbWl4ZWQgdXAuIFRoZXkKYXJlIG9ydGhvZ29uYWwgdG8gZWFjaCBvdGhl
ciBhbmQgc28gdGhleSBzaG91bGQgYmUgaGFuZGxlZC4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
