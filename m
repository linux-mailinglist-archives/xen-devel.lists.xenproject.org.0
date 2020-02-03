Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F75A150576
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 12:41:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iya4W-0003im-6f; Mon, 03 Feb 2020 11:39:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BfOp=3X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iya4U-0003id-Cq
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 11:39:18 +0000
X-Inumbo-ID: cf4d2512-4679-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf4d2512-4679-11ea-b211-bc764e2007e4;
 Mon, 03 Feb 2020 11:39:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D29D9B066;
 Mon,  3 Feb 2020 11:39:16 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-6-liuwe@microsoft.com>
 <20200131175659.5nabkw7joiaepku2@debian>
 <397903e741134867a20bbbb92322e5e8@EX13D32EUC003.ant.amazon.com>
 <5b057f62-d238-267d-3e99-6c43c416e629@suse.com>
 <7fe8ad8c3fdc4375a25695a9b9728d06@EX13D32EUC003.ant.amazon.com>
 <4810a799-3e91-6828-898e-da6e778789f3@suse.com>
 <32f4362647654dad9a6dd9a8755a3ef9@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c332bf8b-b075-9568-ace8-54c61ca14397@suse.com>
Date: Mon, 3 Feb 2020 12:39:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <32f4362647654dad9a6dd9a8755a3ef9@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 05/11] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDIuMjAyMCAxMjozNywgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
PiBTZW50OiAwMyBGZWJydWFyeSAyMDIwIDExOjM0Cj4+IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVy
cmFudEBhbWF6b24uY28udWs+Cj4+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgWGVuIERldmVs
b3BtZW50IExpc3QgPHhlbi0KPj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+OyBNaWNoYWVs
IEtlbGxleSA8bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT47IFdlaQo+PiBMaXUgPGxpdXdlQG1pY3Jv
c29mdC5jb20+OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsKPj4g
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjYgMDUvMTFdIHg4Ni9oeXBlcnY6IHNldHVwIGh5cGVyY2FsbCBwYWdlCj4+Cj4+IE9u
IDAzLjAyLjIwMjAgMTI6MjEsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4+Pj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
Cj4+Pj4gU2VudDogMDMgRmVicnVhcnkgMjAyMCAxMTowNgo+Pj4+IFRvOiBEdXJyYW50LCBQYXVs
IDxwZHVycmFudEBhbWF6b24uY28udWs+Cj4+Pj4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBY
ZW4gRGV2ZWxvcG1lbnQgTGlzdCA8eGVuLQo+Pj4+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
PjsgTWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1pY3Jvc29mdC5jb20+Owo+PiBXZWkKPj4+PiBM
aXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPjsKPj4+PiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
Pj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDA1LzExXSB4ODYvaHlwZXJ2OiBzZXR1cCBoeXBl
cmNhbGwgcGFnZQo+Pj4+Cj4+Pj4gT24gMDMuMDIuMjAyMCAxMTozOSwgRHVycmFudCwgUGF1bCB3
cm90ZToKPj4+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+Pj4+PiBGcm9tOiBXZWkg
TGl1IDx3bEB4ZW4ub3JnPgo+Pj4+Pj4gU2VudDogMzEgSmFudWFyeSAyMDIwIDE3OjU3Cj4+Pj4+
PiBUbzogWGVuIERldmVsb3BtZW50IExpc3QgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
Zz4KPj4+Pj4+IENjOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+OyBNaWNo
YWVsIEtlbGxleQo+Pj4+Pj4gPG1pa2VsbGV5QG1pY3Jvc29mdC5jb20+OyBXZWkgTGl1IDxsaXV3
ZUBtaWNyb3NvZnQuY29tPjsgV2VpIExpdQo+Pj4+Pj4gPHdsQHhlbi5vcmc+OyBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+OyBBbmRyZXcgQ29vcGVyCj4+Pj4+PiA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+
Pj4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAwNS8xMV0geDg2L2h5cGVydjogc2V0dXAgaHlw
ZXJjYWxsIHBhZ2UKPj4+Pj4+Cj4+Pj4+PiAoTm90ZSB0byBzZWxmKQo+Pj4+Pj4KPj4+Pj4+IE9u
IEZyaSwgSmFuIDMxLCAyMDIwIGF0IDA1OjQ5OjI0UE0gKzAwMDAsIFdlaSBMaXUgd3JvdGU6Cj4+
Pj4+PiBbLi4uXQo+Pj4+Pj4+ICtzdGF0aWMgdWludDY0X3QgZ2VuZXJhdGVfZ3Vlc3RfaWQodm9p
ZCkKPj4+Pj4+PiArewo+Pj4+Pj4+ICsgICAgdW5pb24gaHZfZ3Vlc3Rfb3NfaWQgaWQ7Cj4+Pj4+
Pj4gKwo+Pj4+Pj4KPj4+Pj4+ICAgICAgICBpZC5yYXcgPSAwOwo+Pj4+Pgo+Pj4+PiBPciBqdXN0
IHVzZSBhIEM5OSBpbml0aWFsaXplciB0byBzZXQgdGhpbmdzIHVwLiBBIGJpdCBuZWF0ZXIgSU1P
Lgo+Pj4+Cj4+Pj4gSWYgeW91IG1lYW4gdGhpcyBmb3IgLi4uCj4+Pj4KPj4+Pj4+PiArICAgIGlk
LnZlbmRvciA9IEhWX1hFTl9WRU5ET1JfSUQ7Cj4+Pj4+Pj4gKyAgICBpZC5tYWpvciA9IHhlbl9t
YWpvcl92ZXJzaW9uKCk7Cj4+Pj4+Pj4gKyAgICBpZC5taW5vciA9IHhlbl9taW5vcl92ZXJzaW9u
KCk7Cj4+Pj4KPj4+PiAuLi4gdGhlc2UgdGhyZWUgZmllbGRzLCB0aGVuIHRoaXMgd29uJ3Qgd29y
ayB3aXRoIHJhdGhlciBvbGQgZ2NjCj4+Pj4gd2Ugc3RpbGwgcGVybWl0IHRvIGJlIHVzZWQuIFVz
aW5nIHsgLnJhdyA9IDAgfSB3b3VsZCB3b3JrIGFmYWljdC4KPj4+Pgo+Pj4KPj4+IE5vdCBldmVu
IHsgLnZlbmRvciA9IEhWX1hFTl9WRU5ET1JfSUQgfSA/Cj4+Cj4+IE5vLCBiZWNhdXNlIG9mIGl0
IGJlaW5nIHBhcnQgb2YgYW4gdW5uYW1lZCAoc3RydWN0KSBtZW1iZXIgb2YKPj4gdGhlIHVuaW9u
Lgo+IAo+IE9rLi4uIHNoYW1lLiBQcmVzdW1hYmx5IGFuIGVtcHR5IGluaXRpYWxpemVyIC0ge30g
LSAgd291bGQgYmUgb2s/CgpJIHRoaW5rIHNvLCB5ZXMuIEkgdW5kZXJzdGFuZCB5b3UnZCBsaWtl
IHRoaXMgYmV0dGVyIHRoYW4KeyAucmF3ID0gMCB9ID8KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
