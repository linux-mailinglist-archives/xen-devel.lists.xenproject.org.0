Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEFA37167
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 12:14:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYpMk-0007Hq-Vs; Thu, 06 Jun 2019 10:11:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/1VA=UF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hYpMj-0007Hh-Oh
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 10:11:25 +0000
X-Inumbo-ID: 6e469554-8843-11e9-aacf-3792adf16b43
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e469554-8843-11e9-aacf-3792adf16b43;
 Thu, 06 Jun 2019 10:11:21 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BPbSgzUndRXQWeplvLbJtGLmrb9fQ88fQFHcfH9ZTwcqO5rKCnVKP4rXZMYSSSZbDeYtY0rj0U
 +62+Mz1042PUvTfkCw7bEt7c0q9AISYEK5IayqxZDxl1LDDr4Kv02vzJqtQimL9UTPke9aWQu4
 QLnhrfQ5VS9DuiWBPW9MwPOrhBK0VF0J1VuKf4xbRx+7thJ1aamaoGUkY95aUcciE9sdmVcGvu
 cQOdAPSKHJILfWDS/XFsmg8X9+MwzxjHajzYtRGoPQdhICpppccbVQo5MiknoLcGAvjGsUYhVC
 hG8=
X-SBRS: -0.9
X-MesageID: 1399422
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,559,1557201600"; 
   d="scan'208";a="1399422"
Date: Thu, 6 Jun 2019 12:11:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190606101105.q3oidnjpfxt6aq5w@Air-de-Roger>
References: <20190606090146.77381-1-roger.pau@citrix.com>
 <20190606090146.77381-2-roger.pau@citrix.com>
 <c5fc063ca2094937ac4ce0f2a345e5c9@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c5fc063ca2094937ac4ce0f2a345e5c9@AMSPEX02CL03.citrite.net>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdW4gMDYsIDIwMTkgYXQgMTE6NTA6MDZBTSArMDIwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFhlbi1kZXZlbCBb
bWFpbHRvOnhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnXSBPbiBCZWhhbGYg
T2YgUm9nZXIgUGF1IE1vbm5lCj4gPiBTZW50OiAwNiBKdW5lIDIwMTkgMTA6MDIKPiA+IFRvOiB4
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiA+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgS29ucmFkIFJ6
ZXN6dXRlayBXaWxrCj4gPiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IEdlb3JnZSBEdW5sYXAg
PEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IEFuZHJldyBDb29wZXIKPiA+IDxBbmRyZXcuQ29v
cGVyM0BjaXRyaXguY29tPjsgSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBU
aW0gKFhlbi5vcmcpIDx0aW1AeGVuLm9yZz47IEp1bGllbgo+ID4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgUm9nZXIgUGF1IE1v
bm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IFN1YmplY3Q6IFtYZW4tZGV2ZWxdIFtQQVRD
SCB2MiAwMS8xMl0gcGNpOiBpbnRyb2R1Y2UgYSBkZXZmbiBmaWVsZCB0byBwY2lfc2JkZl90Cj4g
PiAKPiA+IFRoaXMgaXMgZXF1aXZhbGVudCB0byB0aGUgY3VycmVudCBleHRmdW5jIGZpZWxkIGlu
IHRlcm0gb2YgY29udGVudHMuCj4gPiAKPiA+IFN3aXRjaCB0aGUgdHdvIGN1cnJlbnQgdXNlcnMg
b2YgZXh0ZnVuYyB0byB1c2UgZGV2Zm4gaW5zdGVhZCBmb3IKPiA+IGNvcnJlY3RuZXNzLgo+ID4g
Cj4gPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPiA+IAo+ID4gUmVxdWVzdGVkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IC0tLQo+ID4gQ2M6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gPiBDYzogR2VvcmdlIER1bmxhcCA8R2Vvcmdl
LkR1bmxhcEBldS5jaXRyaXguY29tPgo+ID4gQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBl
dS5jaXRyaXguY29tPgo+ID4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+
IENjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+ID4gQ2M6IEtvbnJhZCBS
emVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPiA+IENjOiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gPiBDYzogVGltIERlZWdhbiA8dGlt
QHhlbi5vcmc+Cj4gPiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiA+IC0tLQo+ID4gQ2hhbmdl
cyBzaW5jZSB2MToKPiA+ICAtIE5ldyBpbiB0aGlzIHZlcnNpb24uCj4gPiAtLS0KPiA+IE5COiBQ
YXVsIHN1Z2dlc3RlZCB0byBuYW1lIHRoZSBmdW5jdGlvbiBmaWVsZCBmbiBpbnN0ZWFkIG9mIGZ1
bmMsIHNvCj4gPiB0aGF0IGl0IHdvdWxkIG1hdGNoIHRoZSBuYW1pbmcgb2YgdGhlIGRldmZuIGZp
ZWxkLiBTYWRseSB0aGUgZnVuYwo+ID4gZmllbGQgY2Fubm90IGJlIGFsaWFzZWQgdG8gYW5vdGhl
ciBmaWVsZCB1c2luZyBhIHVuaW9uIGJlY2F1c2UgaXQncyBhCj4gPiBiaXQgZmllbGQsIHNvIHRo
ZSBvbmx5IG9wdGlvbiBpcyB0byByZW5hbWUgZnVuYyB0byBmbi4KPiAKPiBJcyB0aGF0IHRydWU/
IENhbiB5b3Ugbm90IGRvIHNvbWV0aGluZyBsaWtlLi4uCj4gCj4gdW5pb24gewo+ICAgc3RydWN0
IHsKPiAgICAgdWludDhfdCBmdW5jIDogMywKPiAgICAgICAgICAgICBkZXYgIDogNTsKPiAgIH07
Cj4gICBzdHJ1Y3Qgewo+ICAgICB1aW50OF90IGZuICAgOiAzLAo+ICAgICAgICAgICAgIHBhZCAg
OiA1Owo+ICAgfTsgCj4gICB1aW50OF90ICBleHRmdW5jOwo+IH07Cj4gCj4gPyBJJ20gY2VydGFp
bmx5IG5vdCBzZWVpbmcgYW55IGNvbXBsYWludHMgZnJvbSBnY2MuCgpEJ29oLCByaWdodC4gSSB3
YXMgc28gZm9jdXNlZCBvbiBhbGlhc2luZyB0aGUgZnVuYyBmaWVsZCBvbmx5IHRoYXQgaXQKZGlk
bid0IG9jY3VyIHRvIG1lLiBJIGNvdWxkIGV2ZW4gZG86Cgp1bmlvbiB7CiAgICBzdHJ1Y3Qgewog
ICAgICAgIHVpbnQ4X3QgZnVuYyA6IDMsCiAgICAgICAgICAgICAgICBkZXYgIDogNTsKICAgIH07
CiAgICBzdHJ1Y3QgewogICAgICAgIHVpbnQ4X3QgZm4gOiAzLAogICAgICAgICAgICAgICAgICAg
OiA1OwogICAgfTsKICAgIHVpbnQ4X3QgZXh0ZnVuYywKICAgICAgICAgICAgZGV2Zm47Cn07CgpM
ZXQgbWUgbWFrZSBzdXJlIHRoaXMgd29ya3Mgd2l0aCBhbGwgY29tcGlsZXJzIGFuZCBJIHdpbGwg
c2VuZCBhbgp1cGRhdGVkIHZlcnNpb24gb2YgdGhpcyBwYXRjaC4KClRoYW5rcywgUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
