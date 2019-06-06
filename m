Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82162371CA
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 12:32:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYpe7-0000TL-99; Thu, 06 Jun 2019 10:29:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/1VA=UF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hYpe5-0000TG-Dl
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 10:29:21 +0000
X-Inumbo-ID: ee7757c0-8845-11e9-ac3d-af777fecf9d8
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee7757c0-8845-11e9-ac3d-af777fecf9d8;
 Thu, 06 Jun 2019 10:29:15 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1S20+gtygsTBPidIFP/k9Pj5u/uRAOLIrRe+nbVGoupjzKFyn2e/74i9THYEtEcDAC6luPZAlY
 41mT4zRN4tp2UxTwvH1SO0rWa5ufbTcebosEmPrfxIp5QN5nYTHWOR+pn6qpZaUiX3iDKRvpOT
 gxMLKJXRhSwGWzPfR/dfuUd5f1TyRElIn21mw4wWGdPyxEgGxNA43ExVzX7A8/D8+cdRMd2fIR
 yn6+gpdBgjS5jkBckUlrAEDaiifX9yovMV44iQfIOtyeDZuKI6RHjlY7twFSDAmJeBB8Vb8z27
 6D4=
X-SBRS: -0.9
X-MesageID: 1367599
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,559,1557201600"; 
   d="scan'208";a="1367599"
Date: Thu, 6 Jun 2019 12:28:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190606102853.c5vxgbpqmczevomq@Air-de-Roger>
References: <20190606090146.77381-1-roger.pau@citrix.com>
 <20190606090146.77381-2-roger.pau@citrix.com>
 <c5fc063ca2094937ac4ce0f2a345e5c9@AMSPEX02CL03.citrite.net>
 <5CF8E65B0200007800235DB8@prv1-mh.provo.novell.com>
 <20190606101315.ul56zhm64wvbbucn@Air-de-Roger>
 <5CF8E97E0200007800235DEC@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CF8E97E0200007800235DEC@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 01/12] pci: introduce a devfn field to
 pci_sbdf_t
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 IanJackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdW4gMDYsIDIwMTkgYXQgMDQ6MjI6NTRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA2LjA2LjE5IGF0IDEyOjEzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gVGh1LCBKdW4gMDYsIDIwMTkgYXQgMDQ6MDk6MzFBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDA2LjA2LjE5IGF0IDExOjUwLCA8UGF1bC5EdXJyYW50
QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+ID4+ICAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+
ID4+ID4+IEZyb206IFhlbi1kZXZlbCBbbWFpbHRvOnhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhl
bnByb2plY3Qub3JnXSBPbiBCZWhhbGYgT2YgCj4gPj4gPiBSb2dlciBQYXUgTW9ubmUKPiA+PiA+
PiBTZW50OiAwNiBKdW5lIDIwMTkgMTA6MDIKPiA+PiA+PiBUbzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnIAo+ID4+ID4+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgS29ucmFkIAo+ID4+ID4gUnplc3p1
dGVrIFdpbGsKPiA+PiA+PiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IEdlb3JnZSBEdW5sYXAg
PEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IEFuZHJldyAKPiA+PiA+IENvb3Blcgo+ID4+ID4+
IDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNp
dHJpeC5jb20+OyBUaW0gCj4gPiAoWGVuLm9yZykgCj4gPj4gPiA8dGltQHhlbi5vcmc+OyBKdWxp
ZW4KPiA+PiA+PiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+OyBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+OyBSb2dlciBQYXUgTW9ubmUgCj4gPj4gPiA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Cj4gPj4gPj4gU3ViamVjdDogW1hlbi1kZXZlbF0gW1BBVENIIHYyIDAxLzEyXSBwY2k6
IGludHJvZHVjZSBhIGRldmZuIGZpZWxkIHRvIAo+ID4+ID4gcGNpX3NiZGZfdAo+ID4+ID4+IAo+
ID4+ID4+IFRoaXMgaXMgZXF1aXZhbGVudCB0byB0aGUgY3VycmVudCBleHRmdW5jIGZpZWxkIGlu
IHRlcm0gb2YgY29udGVudHMuCj4gPj4gPj4gCj4gPj4gPj4gU3dpdGNoIHRoZSB0d28gY3VycmVu
dCB1c2VycyBvZiBleHRmdW5jIHRvIHVzZSBkZXZmbiBpbnN0ZWFkIGZvcgo+ID4+ID4+IGNvcnJl
Y3RuZXNzLgo+ID4+ID4+IAo+ID4+ID4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+ID4+ID4+IAo+
ID4+ID4+IFJlcXVlc3RlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4+
ID4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
Pgo+ID4+ID4+IC0tLQo+ID4+ID4+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgo+ID4+ID4+IENjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNp
dHJpeC5jb20+Cj4gPj4gPj4gQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXgu
Y29tPgo+ID4+ID4+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPj4gPj4g
Q2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gPj4gPj4gQ2M6IEtvbnJh
ZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPiA+PiA+PiBDYzogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+ID4+ID4+IENjOiBUaW0g
RGVlZ2FuIDx0aW1AeGVuLm9yZz4KPiA+PiA+PiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiA+
PiA+PiAtLS0KPiA+PiA+PiBDaGFuZ2VzIHNpbmNlIHYxOgo+ID4+ID4+ICAtIE5ldyBpbiB0aGlz
IHZlcnNpb24uCj4gPj4gPj4gLS0tCj4gPj4gPj4gTkI6IFBhdWwgc3VnZ2VzdGVkIHRvIG5hbWUg
dGhlIGZ1bmN0aW9uIGZpZWxkIGZuIGluc3RlYWQgb2YgZnVuYywgc28KPiA+PiA+PiB0aGF0IGl0
IHdvdWxkIG1hdGNoIHRoZSBuYW1pbmcgb2YgdGhlIGRldmZuIGZpZWxkLiBTYWRseSB0aGUgZnVu
Ywo+ID4+ID4+IGZpZWxkIGNhbm5vdCBiZSBhbGlhc2VkIHRvIGFub3RoZXIgZmllbGQgdXNpbmcg
YSB1bmlvbiBiZWNhdXNlIGl0J3MgYQo+ID4+ID4+IGJpdCBmaWVsZCwgc28gdGhlIG9ubHkgb3B0
aW9uIGlzIHRvIHJlbmFtZSBmdW5jIHRvIGZuLgo+ID4+ID4gCj4gPj4gPiBJcyB0aGF0IHRydWU/
IENhbiB5b3Ugbm90IGRvIHNvbWV0aGluZyBsaWtlLi4uCj4gPj4gPiAKPiA+PiA+IHVuaW9uIHsK
PiA+PiA+ICAgc3RydWN0IHsKPiA+PiA+ICAgICB1aW50OF90IGZ1bmMgOiAzLAo+ID4+ID4gICAg
ICAgICAgICAgZGV2ICA6IDU7Cj4gPj4gPiAgIH07Cj4gPj4gPiAgIHN0cnVjdCB7Cj4gPj4gPiAg
ICAgdWludDhfdCBmbiAgIDogMywKPiA+PiA+ICAgICAgICAgICAgIHBhZCAgOiA1Owo+ID4+IAo+
ID4+IEFuZCB0aGUgInBhZCIgZmllbGQgaGVyZSB3b3VsZG4ndCByZWFsbHkgYmUgbmVjZXNzYXJ5
Lgo+ID4+IAo+ID4+IElzIHRoZXJlIGEgcmVhc29uICJmdW5jIiBuZWVkcyB0byBiZSBrZXB0PyBJ
ZiBzbywgaXMgdGhlcmUgYSBwbGFuIHRvCj4gPj4gcGhhc2Ugb3V0IGl0cyB1c2U/IElmIHNvLCBw
ZXJoYXBzIGZuIGFuZCBkZXYgc2hvdWxkIGJlIGdyb3VwZWQKPiA+PiB0b2dldGhlciwgYW5kIGZ1
bmMgc2hvdWxkIGJlY29tZSB0aGUgKHRlbXBvcmFyeSkgYWxpYXM/Cj4gPiAKPiA+IEkgdGhpbmsg
SSBjYW4gcHJlcGFyZSBhIHByZS1wYXRjaCB0byByZW5hbWUgZnVuYyB0byBmbiwgdGhlIHVzZXJz
IG9mCj4gPiBwY2lfc2JkZl90IGFyZSB2ZXJ5IGxpbWl0ZWQgYXQgdGhpcyBwb2ludC4gSWYgeW91
IGFncmVlIHdpdGggdGhpcyBJCj4gPiB3aWxsIGFkZCBzdWNoIGEgcGF0Y2ggYXQgdGhlIGJlZ2lu
bmluZyBvZiB0aGUgc2VyaWVzLgo+IAo+IFdlbGwsIEknbSBva2F5IHdpdGggZWl0aGVyLCBhcyBl
YWNoIGhhcyBpdCdzIHVwIGFuZCBkb3duIHNpZGVzOgo+ICJmbiIgaXMgbW9yZSBjb25zaXN0ZW50
IHdpdGggImRldmZuIiwgYnV0ICJmdW5jIiBmaXRzIGJldHRlciB3aXRoCj4gUENJX0ZVTkMoKSAo
d2hpY2ggaXMgYWxyZWFkeSBub3QgcmVhbGx5IGZpdHRpbmcgd2l0aCBQQ0lfREVWRk4oKSwKPiBq
dXN0IGxpa2UgUENJX1NMT1QoKSBpc24ndCkuCj4gCj4gVGhlcmVmb3JlIEkgd291bGRuJ3Qgb2Jq
ZWN0IHRvIHN0aWNraW5nIHRvIGZ1bmMsIGJ1dCBzaW5jZSBQYXVsCj4gd291bGQgcHJlZmVyIGl0
IHRvIGJlY29tZSBmbiwgSSdtIGFsc28gb2theSB3aXRoIHRoYXQuIE9mIGNvdXJzZQo+IGp1c3Qg
YSBzaW5nbGUsIGNvbnNpc3RlbnRseSB1c2VkIG5hbWUgZm9yIHRoZSBmaWVsZCBhcyB0aGUgZmlu
YWwKPiByZXN1bHQgb2YgdGhlIHNlcmllcyB3b3VsZCBiZSB2ZXJ5IGRlc2lyYWJsZS4KCkknbSBm
aW5lIHdpdGggZm4gYWxzby4gVGhlbiBsZXQgbWUgcHJlcGFyZSB2My4KClRoYW5rcywgUm9nZXIu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
