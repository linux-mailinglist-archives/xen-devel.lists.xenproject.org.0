Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91769FB147
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 14:25:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUsbC-0008Cj-KR; Wed, 13 Nov 2019 13:22:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZSCI=ZF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iUsbB-0008Ce-Rx
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 13:22:17 +0000
X-Inumbo-ID: 9c77b75c-0618-11ea-adbe-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c77b75c-0618-11ea-adbe-bc764e2007e4;
 Wed, 13 Nov 2019 13:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573651337;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Sq8of7YGqGLHCGFXBN2fjNg/JBFDt3L3OL6lsGDLuSk=;
 b=BSF6sHRUOB7sLjA2bH6rQo8FKQtNmXgjZXpBN7yHfybHpxznXaF3751/
 rxxvW2ajxYia/5i+qT1u1wvgSbRTCOYuxNL2gHXxgvdntqFkoamfW7X85
 QsCFgsOAddRW4sKsMrpm0tL5voMSU2o3Am0EiLFbUzm5TEtQrsePYMXFh o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Q2LadqR49Woa2Q6kCYTZQA5CJxgZQ2Rfcm16lJTxSGe4tcEFmHNgS/3WkUCU8KBMuHse9HqZoJ
 Ac1RoVVDCO8BMsSGzsTlV+qRtrx4dNg19pMhaKwEG5fn0Lensog2HQ9ftQwkZiuCS6wl6mH7V+
 X34WEeQ6AV+98KPsI5V0lR1cpcExQhIEwbA1zrfzhIQ2uREH8z00iAu2mnNNBXJxCrV8yipzth
 WE7F6v0fj+E6nQUy0AQWd1f+kwcq806bVRbpaTSuEXSxwcPudEWVqZ19gbHBFZ6Bz+o9XyepYh
 9FA=
X-SBRS: 2.7
X-MesageID: 8258831
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,300,1569297600"; 
   d="scan'208";a="8258831"
To: Jan Beulich <jbeulich@suse.com>
References: <20191101202502.31750-1-andrew.cooper3@citrix.com>
 <20191101202502.31750-2-andrew.cooper3@citrix.com>
 <618aa239-278d-ab34-0f91-3cf7f257a612@suse.com>
 <447d5543-dcca-0126-b987-7b5de86e7c66@citrix.com>
 <77d8c562-2541-3d69-f03b-451dad94751e@suse.com>
 <708290ba-9d5f-1ec7-889a-1e90488a6016@citrix.com>
 <0776abb4-fbf7-d3e7-67ea-c1516fa3894c@suse.com>
 <b5c38b70-b8c9-8435-2dd8-3632a77170c3@citrix.com>
 <54628e08-fa04-ed20-9255-9de58b219184@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <646c50cb-a54d-694a-b081-adc50e3700ca@citrix.com>
Date: Wed, 13 Nov 2019 13:22:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <54628e08-fa04-ed20-9255-9de58b219184@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/3] x86/boot: Remove cached CPUID data from
 the trampoline
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMTEvMjAxOSAxNzoxNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTIuMTEuMjAxOSAx
NzowOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDQvMTEvMjAxOSAxNTozMSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAwNC4xMS4yMDE5IDE2OjIyLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IE9uIDA0LzExLzIwMTkgMTU6MDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAw
NC4xMS4yMDE5IDE1OjU5LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+Pj4gT24gMDQvMTEvMjAx
OSAxMzoyNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4gT24gMDEuMTEuMjAxOSAyMToyNSwg
QW5kcmV3IENvb3BlciB3cm90ZToKPj4+Pj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS9pbnRl
bC5jCj4+Pj4+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvaW50ZWwuYwo+Pj4+Pj4+PiBAQCAt
MjcwLDYgKzI3MCw3IEBAIHN0YXRpYyB2b2lkIGVhcmx5X2luaXRfaW50ZWwoc3RydWN0IGNwdWlu
Zm9feDg2ICpjKQo+Pj4+Pj4+PiAgCWlmIChkaXNhYmxlKSB7Cj4+Pj4+Pj4+ICAJCXdybXNybChN
U1JfSUEzMl9NSVNDX0VOQUJMRSwgbWlzY19lbmFibGUgJiB+ZGlzYWJsZSk7Cj4+Pj4+Pj4+ICAJ
CWJvb3RzeW0odHJhbXBvbGluZV9taXNjX2VuYWJsZV9vZmYpIHw9IGRpc2FibGU7Cj4+Pj4+Pj4+
ICsJCWJvb3RzeW0odHJhbXBvbGluZV9lZmVyKSB8PSBFRkVSX05YOwo+Pj4+Pj4+PiAgCX0KPj4+
Pj4+PiBJJ20gZmluZSB3aXRoIGFsbCBvdGhlciBjaGFuZ2VzIGhlcmUsIGp1c3QgdGhpcyBvbmUg
Y29uY2VybnMgbWU6Cj4+Pj4+Pj4gQmVmb3JlIHlvdXIgY2hhbmdlIHdlIGxhdGNoIGEgdmFsdWUg
aW50byB0cmFtcG9saW5lX21pc2NfZW5hYmxlX29mZgo+Pj4+Pj4+IGp1c3QgdG8gYmUgdXNlZCBm
b3Igc3Vic2VxdWVudCBJQTMyX01JU0NfRU5BQkxFIHdyaXRlcyB3ZSBkby4gVGhpcwo+Pj4+Pj4+
IG1lYW5zIHRoYXQsIG9uIGEgaHlwZXJ2aXNvciAobGlrZSBYZW4gaXRzZWxmKSBzaW1wbHkgZGlz
Y2FyZGluZwo+Pj4+Pj4+IGd1ZXN0IHdyaXRlcyB0byB0aGUgTVNSICh3aGljaCBpcyAiZmluZSIg
d2l0aCB0aGUgZGVzY3JpYmVkIHVzYWdlCj4+Pj4+Pj4gb2Ygb3VycyB1cCB0byBub3cpLCB3aXRo
IHlvdXIgY2hhbmdlIHdlJ2Qgbm93IGVuZCB1cCB0cnlpbmcgdG8gc2V0Cj4+Pj4+Pj4gRUZFUi5O
WCB3aGVuIHRoZSBmZWF0dXJlIG1heSBub3QgYWN0dWFsbHkgYmUgZW5hYmxlZCBpbgo+Pj4+Pj4+
IElBMzJfTUlTQ19FTkFCTEUuIFdvdWxkbid0IHN1Y2ggYW4gRUZFUiB3cml0ZSBiZSBsaWFibGUg
dG8gI0dQKDApPwo+Pj4+Pj4+IEkuZS4gZG9uJ3Qgd2UgbmVlZCB0byByZWFkIGJhY2sgdGhlIE1T
UiB2YWx1ZSBoZXJlLCBhbmQgdmVyaWZ5Cj4+Pj4+Pj4gd2UgYWN0dWFsbHkgbWFuYWdlZCB0byBj
bGVhciB0aGUgYml0IGJlZm9yZSBhY3R1YWxseSBPUi1pbmcgaW4KPj4+Pj4+PiBFRkVSX05YPwo+
Pj4+Pj4gSWYgdGhpcyBpcyBhIHByb2JsZW0gaW4gcHJhY3RpY2UsIGV4ZWN1dGlvbiB3b24ndCBj
b250aW51ZSBiZXlvbmQgdGhlCj4+Pj4+PiBuZXh0IGlmKCkgY29uZGl0aW9uIGp1c3Qgb3V0IG9m
IGNvbnRleHQsIHdoaWNoIHNldCBFRkVSLk5YIG9uIHRoZSBCU1AKPj4+Pj4+IHdpdGggYW4gdW5n
dWFyZGVkIFdSTVNSLgo+Pj4+PiBBbmQgaG93IGlzIHRoaXMgYW55IGdvb2Q/IFRoaXMga2luZCBv
ZiBjcmFzaCBpcyBleGFjdGx5IHdoYXQgSSdtCj4+Pj4+IGFza2luZyB0byBhdm9pZC4KPj4+PiBX
aGF0IGlzIHRoZSBwb2ludCBvZiB3b3JraW5nIGFyb3VuZCBhIHRoZW9yZXRpY2FsIGVkZ2UgY2Fz
ZSBvZiBicm9rZW4KPj4+PiBuZXN0aW5nIHVuZGVyIFhlbiB3aGljaCBkZW1vbnN0cmFibHkgZG9l
c24ndCBleGlzdCBpbiBwcmFjdGljZT8KPj4+IFdlbGwsIHNvIGZhciBub3RoaW5nIHdhcyBzYWlk
IGFib3V0IHRoaXMgbm90IGJlaW5nIGFuIGFjdHVhbCBwcm9ibGVtLgo+PiBJdHMgbm90IGFuIGFj
dHVhbCBwcm9ibGVtLsKgIElmIGl0IHdlcmUsIHdlIHdvdWxkIGhhdmUgaGFkIGNyYXNoIHJlcG9y
dHMuCj4+Cj4+PiBJIHNpbXBseSBkb24ndCBrbm93IHdoZXRoZXIgaGFyZHdhcmUgd291bGQgcmVm
dXNlIHN1Y2ggYW4gRUZFUiB3cml0ZS4KPj4gSSd2ZSBqdXN0IGV4cGVyaW1lbnRlZCAtIHdyaXRp
bmcgRUZFUi5OWCB0YWtlcyBhICNHUCBmYXVsdCB3aGVuCj4+IE1JU0NfRU5BQkxFLlhEIGlzIHNl
dC4KPj4KPj4+IElmIGl0IGRvZXMsIGl0IHdvdWxkIGJlIGFwcHJvcHJpYXRlIGZvciBoeXBlcnZp
c29ycyB0byBhbHNvIHJlZnVzZQo+Pj4gaXQuIEkuZS4gaWYgd2UgZG9uJ3QgZG8gc28gcmlnaHQg
bm93LCBjb3JyZWN0aW5nIHRoZSBiZWhhdmlvciB3b3VsZAo+Pj4gdHJpcCB0aGUgY29kZSBoZXJl
Lgo+PiBNSVNDX0VOQUJMRVMuWEQgaXMgYXJjaGl0ZWN0dXJhbCBvbiBhbnkgSW50ZWwgc3lzdGVt
IHdoaWNoIGVudW1lcmF0ZXMKPj4gTlgsIGFuZCBpZiB0aGUgYml0IGlzIHNldCwgaXQgY2FuIGJl
IGNsZWFyZWQuwqAgKEFsdGhvdWdoIHRoZSBzZW1hbnRpY3MKPj4gZGVzY3JpYmVkIGluIHRoZSBT
RE0gYXJlIGJyb2tlbi7CoCBJdCBpcyBvbmx5IGF2YWlsYWJsZSBpZiBOWCBpcwo+PiBlbnVtZXJh
dGVkLCB3aGljaCBpcyBvYmZ1c2NhdGVkIGJ5IHNldHRpbmcgWEQpLgo+Pgo+PiBIb3dldmVyLCBu
byBoeXBlcnZpc29yIGlzIGdvaW5nIHRvIGJvdGhlciB2aXJ0dWFsaXNpbmcgdGhpcwo+PiBmdW5j
dGlvbmFsaXR5LsKgIEVpdGhlciBjb25maWd1cmUgdGhlIFZNIHdpdGggTlggb3Igd2l0aG91dC7C
oCAoS1ZNIGZvcgo+PiBleGFtcGxlIGRvZXNuJ3QgdmlydHVhbGlzZSBNSVNDX0VOQUJMRVMgYXQg
YWxsLikKPiBJJ20gc29ycnksIGJ1dCBJIHN0aWxsIGRvbid0IGZvbGxvdzogWW91IHNheSAiaWYg
dGhlIGJpdCBpcyBzZXQsIGl0Cj4gY2FuIGJlIGNsZWFyZWQiLCB3aGljaCBpcyBjbGVhcmx5IG5v
dCBpbiBsaW5lIHdpdGggb3VyIGN1cnJlbnQgZ3Vlc3QKPiBNU1Igd3JpdGUgaGFuZGxpbmcuCgpZ
ZXMgLSBYZW4ncyBNU1IgaGFuZGluZyBpcyBicm9rZW4sIGJ1dCB5b3Ugc25pcHBlZCB0aGF0IHBh
cnQgb2YgbXkgcmVwbHkuCgo+IEl0IGp1c3Qgc28gaGFwcGVucyB0aGF0IHdlIGhhdmUgbm8gY29t
bWFuZCBsaW5lCj4gb3B0aW9uIGFsbG93aW5nIHRvIHN1cHByZXNzIHRoZSBjbGVhcmluZyBvZiBY
RC4KCk5vciBkb2VzIExpbnV4LsKgIEFzIHRvIHRoZSBvdGhlciBoeXBlcnZpc29ycy4uLgoKPiBJ
ZiB3ZSBoYWQsIGFjY29yZGluZwo+IHRvIHlvdXIgZmluZGluZ3MgYWJvdmUgd2UnZCBydW4gaW50
byBhICNHUCB1cG9uIHRyeWluZyB0byBzZXQgTlguCgpZZXMuCgo+IEhvdyBjYW4geW91IGVhc2ls
eSBleGNsdWRlIGFub3RoZXIgaHlwZXJ2aXNvciBhY3R1YWxseSBkb2luZyBzbyAoYW5kCj4gbm9i
b2R5IGhhdmluZyBydW4gaW50byB0aGUgaXNzdWUgc2ltcGx5IGJlY2F1c2UgdGhlIG9wdGlvbiBp
cyByYXJlbHkKPiB1c2VkKT8KCi4uLiBvYnNlcnZlIHRoYXQgdGhleSByZXF1aXJlIE5YIHN1cHBv
cnQgYXMgYSBwcmVyZXF1aXNpdGUgdG8gaW5zdGFsbC7CoApZb3Ugd2lsbCBub3QgZmluZCBhIHN5
c3RlbSB3aXRoIFhEIHNldCB0aGVzZSBkYXlzLgoKPiBCdHcgLSBhbGwgd291bGQgYmUgZmluZSBp
ZiB0aGUgY29kZSBpbiBxdWVzdGlvbiB3YXMgZ3VhcmRlZCBieSBhbgo+IE5YIGZlYXR1cmUgY2hl
Y2ssIGJ1dCBhcyB5b3Ugc2F5IHRoYXQncyBub3QgcG9zc2libGUgYmVjYXVzZSBYRCBzZXQKPiBm
b3JjZXMgTlggY2xlYXIuIEhvd2V2ZXIsIG91ciBzZXR0aW5nIG9mIEVGRVIuTlggY291bGQgYmUg
Z3VhcmRlZAo+IHRoaXMgd2F5LCBhcyB3ZSBfZXhwZWN0XyBYRCB0byBiZSBjbGVhciBhdCB0aGF0
IHBvaW50LgoKWEQgd2FzIGNsZWFybHkgbmV2ZXIgZGVzaWduZWQgZm9yIHRoZSBPUyB0byBmaW5k
IGFuZCB0dXJuIG9mZiwgYnV0IE5YCmZ1bmN0aW9uYWxpdHkgaXMgc2ltcGx5IHRvbyBpbXBvcnRh
bnQgdG8gbGV0IG1pc2NvbmZpZ3VyZWQgZmlybXdhcmUgZ2V0CmluIHRoZSB3YXkgb2YgdXNpbmcu
CgoKVGhlIGxvbmcgYW5kIHRoZSBzaG9ydCBvZiBpdCBpcyB0aGF0IHRoaXMgcGF0Y2ggZG9lcyBu
b3QgY2hhbmdlIFhlbidzCmJlaGF2aW91ciBXUlQgcG9vcmx5IHZpcnR1YWxpc2VkIFhELgoKSSBh
bSBub3QgY29udmluY2VkIHRoZSBiZWhhdmlvdXIgaXMgd29ydGggY2hhbmdpbmcsIGFuZCBJIGRv
bid0IGhhdmUKdGltZSBmb3IgdGhpcyBzY29wZSBjcmVlcC7CoCBJZiB5b3Ugd2FudCB0byBzdWJt
aXQgYSBmaXggdGhlbiBnbyBhaGVhZCwKYnV0IHBhdGNoIDMgb2YgdGhpcyBpcyBpbXBvcnRhbnQg
dG8gZ2V0IGluIGZvciA0LjEzCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
