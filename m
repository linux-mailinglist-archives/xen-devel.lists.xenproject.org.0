Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9000A164F
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 12:36:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3Hk3-0006L3-6d; Thu, 29 Aug 2019 10:33:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3Hk1-0006Ky-Dx
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 10:33:21 +0000
X-Inumbo-ID: 6b0ee516-ca48-11e9-b95f-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b0ee516-ca48-11e9-b95f-bc764e2007e4;
 Thu, 29 Aug 2019 10:33:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BE7EBB653;
 Thu, 29 Aug 2019 10:33:18 +0000 (UTC)
To: Paul Durrant <Paul.Durrant@citrix.com>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-4-paul.durrant@citrix.com>
 <1383f85e-bc08-c0be-bb02-f68b76ac1be5@suse.com>
 <0134b70d04b942b4b3ce65fd2340ff0c@AMSPEX02CL03.citrite.net>
 <b7ed5929dd864aefa93bb8572a7b5193@AMSPEX02CL03.citrite.net>
 <0854e0578b7445dbb7ac2e65ed81153b@AMSPEX02CL03.citrite.net>
 <b1036f3e-a2a4-306b-d37b-190936978ce5@suse.com>
 <4fe23438a0bf4248accdf0367c754662@AMSPEX02CL03.citrite.net>
 <355e06d7-06dc-14c2-7a4c-8310ea108492@suse.com>
 <33c48f9e1bde4b179a625e1831e980cd@AMSPEX02CL03.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b18ba462-8ad2-b9ad-eedd-7e2f39d3d124@suse.com>
Date: Thu, 29 Aug 2019 12:33:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <33c48f9e1bde4b179a625e1831e980cd@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/6] remove late (on-demand) construction of
 IOMMU page tables
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
Cc: 'Petre Pircalabu' <ppircalabu@bitdefender.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Razvan Cojocaru' <rcojocaru@bitdefender.com>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim\(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, 'JulienGrall' <julien.grall@arm.com>,
 'Tamas K Lengyel' <tamas@tklengyel.com>,
 "'xen-devel@lists.xenproject.org'" <xen-devel@lists.xenproject.org>,
 'Alexandru Isaila' <aisaila@bitdefender.com>,
 IanJackson <Ian.Jackson@citrix.com>,
 'VolodymyrBabchuk' <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDguMjAxOSAxMjoyMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IFNlbnQ6IDI5IEF1Z3VzdCAyMDE5IDEwOjUyCj4+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVy
cmFudEBjaXRyaXguY29tPgo+PiBDYzogJ0p1bGllbkdyYWxsJyA8anVsaWVuLmdyYWxsQGFybS5j
b20+OyAnQWxleGFuZHJ1IElzYWlsYScgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPjsgJ1BldHJl
Cj4+IFBpcmNhbGFidScgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPjsgJ1JhenZhbiBDb2pv
Y2FydScgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+OyBBbmRyZXcgQ29vcGVyCj4+IDxBbmRy
ZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRy
aXguY29tPjsgSWFuIEphY2tzb24KPj4gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBSb2dlciBQ
YXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgJ1ZvbG9keW15ckJhYmNodWsnCj4+IDxW
b2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47ICdTdGVmYW5vIFN0YWJlbGxpbmknIDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPjsgJ3hlbi0KPj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcnIDx4
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+OyAnS29ucmFkIFJ6ZXN6dXRlayBXaWxrJwo+
PiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47ICdUYW1hcyBLIExlbmd5ZWwnIDx0YW1hc0B0a2xl
bmd5ZWwuY29tPjsgVGltIChYZW4ub3JnKSA8dGltQHhlbi5vcmc+OyAnV2VpCj4+IExpdScgPHds
QHhlbi5vcmc+Cj4+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggMy82XSByZW1vdmUg
bGF0ZSAob24tZGVtYW5kKSBjb25zdHJ1Y3Rpb24gb2YgSU9NTVUgcGFnZSB0YWJsZXMKPj4KPj4g
T24gMjkuMDguMjAxOSAxMTozMywgUGF1bCBEdXJyYW50IHdyb3RlOgo+Pj4gVEJIIEkndmUgc2Vl
biBzdWZmaWNpZW50IG51bWJlcnMgb2YgZG9tYWluIGNyZWF0ZSBmYWlsdXJlcyB3aGVuIHVzaW5n
Cj4+PiBhdXRvLWJhbGxvb25pbmcgdGhhdCBJIHN0b3BwZWQgdXNpbmcgaXQgc29tZSB0aW1lIGFn
byAoYmVzaWRlcyB0aGUgZmFjdAo+Pj4gdGhhdCBpdCdzIHNsb3cpLiBJZiB5b3UncmUgaGFwcHkg
d2l0aCB0aGUgc2ltcGxpc3RpYwo+Pj4gZG91YmxlLXRoZS1wYWdlLXRhYmxlLXJlc2VydmF0aW9u
IGNhbGN1bGF0aW9uIHRoZW4gSSBjYW4gYWRkIHRoYXQgYnV0Cj4+PiBJTU8gaXQgd291bGQgYmUg
YmV0dGVyIHRvIGFkZCBhbm90aGVyIHBhdGNoIHRvIGp1c3QgcmVtb3ZlIGF1dG8tYmFsbG9vbmlu
Zy4KPj4KPj4gSSdkIG5vdCBiZSBvdmVybHkgaGFwcHksIGJ1dCBJIGNvdWxkIGxpdmUgd2l0aCB0
aGlzLiBCdXQgdGhpcyBuZWVkcwo+PiBjb25zZW50IGJ5IG90aGVycywgbm90IHRoZSBsZWFzdCB0
aGUgdG9vbCBzdGFjayBtYWludGFpbmVycy4KPj4KPiAKPiBPay4gSSdsbCBkZWFsIHdpdGggdGhh
dCBsYXRlci4gTG9va2luZyBhZ2FpbiB0aG91Z2gsIEknbSBub3Qgc3VyZSB3aGF0Cj4geW91IG1l
YW4gYnkgJ3RoZSBhbW91bnQgcmVzZXJ2ZWQgZm9yIHBhZ2UgdGFibGVzJz8gRG8geW91IG1lYW4K
PiAnc2hhZG93X21lbWtiJyBvciBzb21ldGhpbmcgZWxzZT8KClRoaXMgb25lLCBJIHRoaW5rLCB5
ZXMsIG9yIHRoZSB2YWx1ZSBpdCBnZXRzIGRlZmF1bHRlZCB0byB3aGVuIG5vdCBzZXQKaW4gdGhl
IGd1ZXN0IGNvbmZpZyBmaWxlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
