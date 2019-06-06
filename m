Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5066637991
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 18:31:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYvEz-0000Tr-L8; Thu, 06 Jun 2019 16:27:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/1VA=UF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hYvEx-0000Tm-Mr
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 16:27:47 +0000
X-Inumbo-ID: 043ec6f7-8878-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 043ec6f7-8878-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 16:27:46 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qY4qD5N92vDMNgG6+pm072/KDamfHyJEOv1JzkPo3bWw8QwTi0XXhLruHiGhll4ZQhPYtkffOl
 22BvjcnRx6KV4o0IVFVHSsLHv1nMsO0DUzNV8ydt5IpqPZJl3U0nEqaIsXO6rXvJKKda3oXMGC
 haAmAK37ukUziAC/BAWbFQot7Fxt3upHXVxiT+k3GnLvabvYQZNWiCDlK3FZBK1zE4aX9MVaFf
 ujQlgXMe/Y0T0As+1b7MniwT+IECv7yb8u1R5MG2sC79YojITFsZ+/CWQZeseY6U49mzpvOGrK
 LFg=
X-SBRS: -0.9
X-MesageID: 1414879
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,560,1557201600"; 
   d="scan'208";a="1414879"
Date: Thu, 6 Jun 2019 18:27:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190606162735.wppqpdb6wpa7kapb@Air-de-Roger>
References: <20190606090146.77381-1-roger.pau@citrix.com>
 <20190606090146.77381-5-roger.pau@citrix.com>
 <4ca7756ef46f4bd4aa08fbf2ac838200@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4ca7756ef46f4bd4aa08fbf2ac838200@AMSPEX02CL03.citrite.net>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 04/12] pci: make PCI_SBDF2 return a
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
Cc: Kevin
 Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdW4gMDYsIDIwMTkgYXQgMDE6MjI6MzBQTSArMDIwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFhlbi1kZXZlbCBb
bWFpbHRvOnhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnXSBPbiBCZWhhbGYg
T2YgUm9nZXIgUGF1IE1vbm5lCj4gPiBTZW50OiAwNiBKdW5lIDIwMTkgMTA6MDIKPiA+IFRvOiB4
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiA+IENjOiBLZXZpbiBUaWFuIDxrZXZpbi50
aWFuQGludGVsLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz47IFdlaSBMaXUKPiA+IDx3bEB4ZW4ub3JnPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25y
YWQud2lsa0BvcmFjbGUuY29tPjsgR2VvcmdlIER1bmxhcAo+ID4gPEdlb3JnZS5EdW5sYXBAY2l0
cml4LmNvbT47IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBJYW4g
SmFja3Nvbgo+ID4gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBUaW0gKFhlbi5vcmcpIDx0aW1A
eGVuLm9yZz47IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+OyBKYW4KPiA+IEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KPiA+IFN1YmplY3Q6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2MiAwNC8xMl0gcGNpOiBt
YWtlIFBDSV9TQkRGMiByZXR1cm4gYSBwY2lfc2JkZl90Cj4gPiAKPiA+IEFuZCBmaXggaXQncyBv
bmx5IGNhbGxlci4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4gPiAtLS0KPiA+IENjOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFu
QGludGVsLmNvbT4KPiA+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgo+ID4gQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4K
PiA+IENjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiA+IENjOiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPiBDYzogSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4KPiA+IENjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53
aWxrQG9yYWNsZS5jb20+Cj4gPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPgo+ID4gQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgo+ID4gQ2M6IFdlaSBM
aXUgPHdsQHhlbi5vcmc+Cj4gPiAtLS0KPiA+ICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQv
ZG1hci5jIHwgMiArLQo+ID4gIHhlbi9pbmNsdWRlL3hlbi9wY2kuaCAgICAgICAgICAgICAgfCAz
ICsrLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2RtYXIu
YyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9kbWFyLmMKPiA+IGluZGV4IDU5YTQ2Y2Qx
YzYuLmI4NThmZTdjODAgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92
dGQvZG1hci5jCj4gPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvZG1hci5jCj4g
PiBAQCAtMTA0Nyw3ICsxMDQ3LDcgQEAgaW50IGludGVsX2lvbW11X2dldF9yZXNlcnZlZF9kZXZp
Y2VfbWVtb3J5KGlvbW11X2dyZG1fdCAqZnVuYywgdm9pZCAqY3R4dCkKPiA+IAo+ID4gICAgICAg
ICAgcmMgPSBmdW5jKFBGTl9ET1dOKHJtcnItPmJhc2VfYWRkcmVzcyksCj4gPiAgICAgICAgICAg
ICAgICAgICAgUEZOX1VQKHJtcnItPmVuZF9hZGRyZXNzKSAtIFBGTl9ET1dOKHJtcnItPmJhc2Vf
YWRkcmVzcyksCj4gPiAtICAgICAgICAgICAgICAgICAgUENJX1NCREYyKHJtcnItPnNlZ21lbnQs
IGJkZiksIGN0eHQpOwo+ID4gKyAgICAgICAgICAgICAgICAgIFBDSV9TQkRGMihybXJyLT5zZWdt
ZW50LCBiZGYpLnNiZGYsIGN0eHQpOwo+ID4gCj4gPiAgICAgICAgICBpZiAoIHVubGlrZWx5KHJj
IDwgMCkgKQo+ID4gICAgICAgICAgICAgIHJldHVybiByYzsKPiA+IGRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS94ZW4vcGNpLmggYi94ZW4vaW5jbHVkZS94ZW4vcGNpLmgKPiA+IGluZGV4IDllYTQx
Nzg5ZDAuLjMwYWZhY2E4MzggMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vcGNpLmgK
PiA+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9wY2kuaAo+ID4gQEAgLTM2LDcgKzM2LDggQEAKPiA+
ICAjZGVmaW5lIFBDSV9CREYyKGIsZGYpICAoKCgoYikgJiAweGZmKSA8PCA4KSB8ICgoZGYpICYg
MHhmZikpCj4gPiAgI2RlZmluZSBQQ0lfU0JERihzLGIsZCxmKSBcCj4gPiAgICAgICgocGNpX3Ni
ZGZfdCkgeyAuc2JkZiA9ICgoKHMpICYgMHhmZmZmKSA8PCAxNikgfCBQQ0lfQkRGKGIsZCxmKSB9
KQo+ID4gLSNkZWZpbmUgUENJX1NCREYyKHMsYmRmKSAoKCgocykgJiAweGZmZmYpIDw8IDE2KSB8
ICgoYmRmKSAmIDB4ZmZmZikpCj4gPiArI2RlZmluZSBQQ0lfU0JERjIocyxiZGYpIFwKPiA+ICsg
ICAgKChwY2lfc2JkZl90KSB7IC5zYmRmID0gKCgocykgJiAweGZmZmYpIDw8IDE2KSB8ICgoYmRm
KSAmIDB4ZmZmZikgfSkKPiAKPiBQZXJoYXBzLi4uCj4gCj4gKChwY2lfc2JkZl90KSB7IC5zZWcg
PSBzLCAuYmRmID0gYmRmIH0pCgpUaGF0IEknbSBhZnJhaWQgd29uJ3Qgd29yayB3aXRoIG9sZGVy
IHZlcnNpb25zIG9mIGdjYy4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
