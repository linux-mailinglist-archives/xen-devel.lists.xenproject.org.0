Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D793731F
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 13:40:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYqi4-0007qu-Uj; Thu, 06 Jun 2019 11:37:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ATwH=UF=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hYqi3-0007qp-U6
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 11:37:31 +0000
X-Inumbo-ID: 775c666c-884f-11e9-970d-9f9a99530e00
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 775c666c-884f-11e9-970d-9f9a99530e00;
 Thu, 06 Jun 2019 11:37:30 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=SoftFail smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QRckigsJFRxiZLNruDJEn2FXsOcwXE+fiTCSatahwVQHmF6TQqnvdIHyQQEHPlaM1xe41NtN+o
 VEr11X0ODWjbylTU3JpK4D4clRRlXLzeC4gRBIfAqiLPw/O7NmXj1132tpNijqPuwqlKne+VWB
 T69/xKT44jEU7RHw09nahWw5ROYbVVaXflBtJgEboh6ckaMaJZC9p6nlNUqs0EhRVL2s42HFXF
 L2OOI+1sbNX7E/ixfJ1zIC+50W6FtShwTyxgDCl1YBJNN0kCzOG2IcLzKu+lAsFqCmBiz0MFkG
 MxM=
X-SBRS: -0.9
X-MesageID: 1402407
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,559,1557201600"; 
   d="scan'208";a="1402407"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v2 03/12] pci: make PCI_SBDF return a
 pci_sbdf_t
Thread-Index: AQHVHEat2EWOrJMpPE+UVYYSe0+AlqaOeHHwgAABWcD//+LaAIAAIxnA
Date: Thu, 6 Jun 2019 11:37:25 +0000
Message-ID: <4c0b8fbb351c46f9aa981ae11a5dd76d@AMSPEX02CL03.citrite.net>
References: <20190606090146.77381-1-roger.pau@citrix.com>
 <20190606090146.77381-4-roger.pau@citrix.com>
 <d0590126d33a4ca69da45b09d6038cb5@AMSPEX02CL03.citrite.net>
 <b163694e8a174570870d5ff7839a685c@AMSPEX02CL03.citrite.net>
 <5CF8F9880200007800235E6A@prv1-mh.provo.novell.com>
In-Reply-To: <5CF8F9880200007800235E6A@prv1-mh.provo.novell.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 03/12] pci: make PCI_SBDF return a
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Ian
 Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMDYgSnVuZSAyMDE5IDEyOjMxCj4gVG86IFBhdWwg
RHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+OyBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXgu
Y29tPjsgR2VvcmdlIER1bmxhcAo+IDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFj
a3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uZQo+IDxyb2dlci5w
YXVAY2l0cml4LmNvbT47IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPjsgU3RlZmFu
byBTdGFiZWxsaW5pCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4ZW4tZGV2ZWwgPHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IEtvbnJhZCBSemVzenV0ZWsgV2lsawo+IDxrb25y
YWQud2lsa0BvcmFjbGUuY29tPjsgVGltIChYZW4ub3JnKSA8dGltQHhlbi5vcmc+OyBXZWlMaXUg
PHdsQHhlbi5vcmc+Cj4gU3ViamVjdDogUkU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2MiAwMy8xMl0g
cGNpOiBtYWtlIFBDSV9TQkRGIHJldHVybiBhIHBjaV9zYmRmX3QKPiAKPiA+Pj4gT24gMDYuMDYu
MTkgYXQgMTM6MTksIDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPj4gIC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPj4gRnJvbTogWGVuLWRldmVsIFttYWlsdG86eGVuLWRl
dmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmddIE9uIEJlaGFsZiBPZiBQYXVsIER1cnJh
bnQKPiA+PiBTZW50OiAwNiBKdW5lIDIwMTkgMTI6MTEKPiA+Pgo+ID4+ID4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPiA+PiA+IEZyb206IFhlbi1kZXZlbCBbbWFpbHRvOnhlbi1kZXZlbC1i
b3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnXSBPbiBCZWhhbGYgT2YgUm9nZXIgUGF1IE1vbm5l
Cj4gPj4gPiBTZW50OiAwNiBKdW5lIDIwMTkgMTA6MDIKPiA+PiA+IC0tLSBhL3hlbi9pbmNsdWRl
L3hlbi9wY2kuaAo+ID4+ID4gKysrIGIveGVuL2luY2x1ZGUveGVuL3BjaS5oCj4gPj4gPiBAQCAt
MzQsNyArMzQsOCBAQAo+ID4+ID4gICNkZWZpbmUgUENJX0RFVkZOMihiZGYpICgoYmRmKSAmIDB4
ZmYpCj4gPj4gPiAgI2RlZmluZSBQQ0lfQkRGKGIsZCxmKSAgKCgoKGIpICYgMHhmZikgPDwgOCkg
fCBQQ0lfREVWRk4oZCxmKSkKPiA+PiA+ICAjZGVmaW5lIFBDSV9CREYyKGIsZGYpICAoKCgoYikg
JiAweGZmKSA8PCA4KSB8ICgoZGYpICYgMHhmZikpCj4gPj4gPiAtI2RlZmluZSBQQ0lfU0JERihz
LGIsZCxmKSAoKCgocykgJiAweGZmZmYpIDw8IDE2KSB8IFBDSV9CREYoYixkLGYpKQo+ID4+ID4g
KyNkZWZpbmUgUENJX1NCREYocyxiLGQsZikgXAo+ID4+ID4gKyAgICAoKHBjaV9zYmRmX3QpIHsg
LnNiZGYgPSAoKChzKSAmIDB4ZmZmZikgPDwgMTYpIHwgUENJX0JERihiLGQsZikgfSkKPiA+Cj4g
PiBXb3VsZG4ndCB0aGlzIGJlIGJldHRlciBjb2RlZCBhbG9uZyB0aGUgbGluZXMgb2YuLi4KPiA+
Cj4gPiAgICAgKChwY2lfc2JkZl90KSB7IC5zZWcgPSBzLCAuYnVzID0gYiwgLmRldiA9IGQsIC5m
biA9IGYgfSkKPiAKPiBObywgYXMgcGVyIHRoZSBwcmlvciB2ZXJzaW9uJ3MgZGlzY3Vzc2lvbjog
T2xkZXIgZ2NjIHdvbid0IGNvcGUgd2l0aCB0aGlzLgoKT2gsIG9rLiBGYWlyIGVub3VnaCB0aGVu
LgoKICBQYXVsCgo+IAo+IEphbgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
