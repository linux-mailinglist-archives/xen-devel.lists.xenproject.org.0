Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E25416C04D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 13:08:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6Yyf-000074-N6; Tue, 25 Feb 2020 12:06:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UvFY=4N=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6Yye-00006y-Ci
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 12:06:16 +0000
X-Inumbo-ID: 387c1350-57c7-11ea-92e3-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 387c1350-57c7-11ea-92e3-12813bfff9fa;
 Tue, 25 Feb 2020 12:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582632376;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vvzPYpLsGNaADr4DEt702pI3LPb+Flqvzsqm0Z2NiTQ=;
 b=ctddWRFstpQCIswvnYak6RtoffwY7JIyaoH0xO88nILfBO6p3JQ4B74j
 GXPsPy/W0Q3p5IwcfvoeqWJJEuvoHg73e8MNVl/C4Ucp7clLHg3J2GiBC
 KhJ0GHGBqd4Z17voHCk0jr2Nob1jbvqiGT59nWrZm5NsuZ827IFkYm5v8 g=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WfiIEiomifcdBTdL2e7jJhn6THTALSkpI24cAHsszHBKdNBssbhcS3Q7p+poiaxYmTd90FUOF9
 ezO6J7Lmdygdw1AkFG0IFnydgtL33PDd32VsuBlOQqrn+AGLcHzx9q0V8NbdAqe0ftVVE+lU+R
 LMRTgO0cTVx6w5CKBnD6COrJXogb+xNOyYL5qUYeBNjGyWqfS0TmqtdEU9hQOAxeIgKcn4dHsQ
 djQbpL7XuFCln3LvhnxmOfVda8HeHLYzdqrV58KEpW1QFecfPwsykwxvfOoNYNxSz88h3Vc3Mf
 qWQ=
X-SBRS: 2.7
X-MesageID: 12944726
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,484,1574139600"; d="scan'208";a="12944726"
Date: Tue, 25 Feb 2020 13:06:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Message-ID: <20200225120606.GB4679@Air-de-Roger>
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <dff6668838b61fb7fe508588bef91d650cddfeb5.1582310142.git.tamas.lengyel@intel.com>
 <20200225100452.GA4679@Air-de-Roger>
 <CABfawhn8ukW3KrcM-epW7QwSQjLupQdQ4HDDe31R=0URF8tjJg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABfawhn8ukW3KrcM-epW7QwSQjLupQdQ4HDDe31R=0URF8tjJg@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v9 3/5] xen/mem_sharing: VM forking
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMjUsIDIwMjAgYXQgMDQ6NDM6MzBBTSAtMDcwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+IE9uIFR1ZSwgRmViIDI1LCAyMDIwIGF0IDM6MDUgQU0gUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwgRmViIDIxLCAy
MDIwIGF0IDEwOjQ5OjIxQU0gLTA4MDAsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+ID4gVk0g
Zm9ya2luZyBpcyB0aGUgcHJvY2VzcyBvZiBjcmVhdGluZyBhIGRvbWFpbiB3aXRoIGFuIGVtcHR5
IG1lbW9yeSBzcGFjZSBhbmQgYQo+ID4gPiBwYXJlbnQgZG9tYWluIHNwZWNpZmllZCBmcm9tIHdo
aWNoIHRvIHBvcHVsYXRlIHRoZSBtZW1vcnkgd2hlbiBuZWNlc3NhcnkuIEZvcgo+ID4gPiB0aGUg
bmV3IGRvbWFpbiB0byBiZSBmdW5jdGlvbmFsIHRoZSBWTSBzdGF0ZSBpcyBjb3BpZWQgb3ZlciBh
cyBwYXJ0IG9mIHRoZSBmb3JrCj4gPiA+IG9wZXJhdGlvbiAoSFZNIHBhcmFtcywgaGFwIGFsbG9j
YXRpb24sIGV0YykuCj4gPgo+ID4gSSd2ZSBqdXN0IHJlYWxpemVkIHRoYXQgSSdtIG5vdCBzdXJl
IGhvdyBhcmUgc3BlY2lhbCBwYWdlcyBoYW5kbGVkLAo+ID4gd2hhdCBoYXBwZW5zIHRvIHRoZSB4
ZW5zdG9yZSwgY29uc29sZSwgc2hhcmVkIGluZm8gcGFnZXMsIG9yIHRoZQo+ID4gdmNwdSBpbmZv
IHBhZ2VzIGlmIHRoZSBwYXJlbnQgaGFzIHRob3NlIHJlZ2lzdGVyZWQ/Cj4gCj4gVGhlIGZvcmsg
c3RhcnRzIG91dCB3aXRoIGFuIGVtcHR5IHAybSBzbyB0aGVzZSBwYWdlcyBhcmUgbm90IHByZXNl
bnQuCj4gSW4gY2FzZSB0aGUgZ3Vlc3QgaXRzZWxmIHRyaWVzIHRvIGFjY2VzcyB0aGVzZSBwYWdl
cywgb3IgYSBmb3JlaWduCj4gbWFwcGluZyBpcyBzZXQgdXAgZm9yIHRoZW0sIHRoZW4gdGhhdCB3
aWxsIHRyaWdnZXIgZm9ya19wYWdlIGZyb20gdGhlCj4gcGFyZW50LiBJIHNlZSB0aGF0IGluIHRo
ZSBWTSByZXN0b3JlIHBhdGggY2xlYXJzIHRoZSBwYWdlcyBmb3IKPiBIVk1fUEFSQU1fQ09OU09M
RV9QRk4sIEhWTV9QQVJBTV9TVE9SRV9QRk4sIEhWTV9QQVJBTV9JT1JFUV9QRk4gYW5kCj4gSFZN
X1BBUkFNX0JVRklPUkVRX1BGTiBidXQgZG9lc24ndCByZWFsbHkgZXhwbGFpbiB3aHkgdGhhdCB3
b3VsZCBiZQo+IHJlcXVpcmVkLiBJIGNhbiBjZXJ0YWlubHkgYWRkIHRoZSBzYW1lIHNwZWNpYWwg
aGFuZGxpbmcgZm9yIHRoZXNlIEhWTQo+IHBhcmFtcyB3aGVuIHRoZXkgZ2V0IGNvcGllZCBkdXJp
bmcgdGhlIGZvcmsgaHlwZXJjYWxsLgoKVGhvc2UgcGFyYW1zIGFyZSBsaWtlbHkgc2V0IGJ5IHRo
ZSB0b29sc3RhY2sgd2hlbiBjcmVhdGluZyB0aGUgZG9tYWluLgpJIHRoaW5rIHlvdSB3aWxsIGhh
dmUgdG8gYXQgbGVhc3QgY29weSB0aGUgdmFsdWVzIGZyb20gdGhlIHBhcmVudCBhbmQKbWF5YmUg
cHJlLXBvcHVsYXRlIHRoZW0gd2hlbiBmb3JraW5nLCB0aGF0IGRlcGVuZHMgb24gd2hldGhlciBp
bnRlcm5hbApYZW4gYWNjZXNzZXMgd2lsbCBhbHNvIHRyaWdnZXIgdGhlIHBvcHVsYXRlIGxvZ2lj
LgoKPiBBcyBmb3IgdGhlIHZjcHUgaW5mbyBwYWdlLCBJJ20gbm90IHN1cmUgd2hlcmUgdGhhdCBn
ZXRzIGFsbG9jYXRlZCBhbmQKPiBtYXBwZWQgbm9ybWFsbHkuIEkgZG9uJ3Qgc2VlIGFueSBzcGVj
aWFsIGhhbmRsaW5nIGZvciB0aGF0IGluIHRoZQo+IHNhdmUvcmVzdG9yZSBwYXRocy4KClRoZSBz
aGFyZWQgaW5mbyBwYWdlLCB0aGUgdmNwdSBpbmZvIGFuZCB0aGUgc3RvbGVuIHRpbWUgcGFnZXMg
YXJlIHRlYXIKZG93biBkdXJpbmcgc3VzcGVuZC9yZXN0b3JlLCBhbmQgdGhlIGd1ZXN0IHJlLXJl
Z2lzdGVycyB0aGVtIHdoZW4KcmVzdW1pbmcuIFNpbmNlIHRoZSBndWVzdCBpcyBub3QgYXdhcmUg
b2YgdGhlIGZvcmsgaGFwcGVuaW5nLCB5b3Ugd2lsbApoYXZlIHRvIHBvcHVsYXRlIHRob3NlIG9u
IGZvcmsgYW5kIG1ha2Ugc3VyZSB0aGUgZG9tYWluIGZpZWxkcwpwb2ludGluZyB0byB0aGVtIGFy
ZSB1cGRhdGVkLCBzbyB0aGF0IFhlbiBjYW4gY29udGludWUgdXBkYXRpbmcgdGhpcwpzaGFyZWQg
YXJlYXMuCgo+IFdlIHVzZSB0aGUgc3RhbmRhcmQgY3JlYXRlZG9tYWluIGh5cGVyY2FsbCB0bwo+
IHNldHVwIHRoZSBWTSB0aGF0IHdpbGwgYmUgdXNlZCBmb3IgdGhlIGZvcmssIHRoZW4gdXNlIHZj
cHVfY3JlYXRlIHRvCj4gYnJpbmcgdXAgdGhlIHZDUFVzIGFuZCBqdXN0IGxvYWQgdGhlbSB3aXRo
IHRoZSBodm0gY29udGV4dCwgcHJldHR5Cj4gbXVjaCB0aGUgc2FtZSB3YXkgdGhlIHJlc3RvcmUg
cGF0aCB3b3VsZC4KCkRlcGVuZGluZyBvbiBob3cgbXVjaCBvZiB0aGUgY3JlYXRpb24gcHJvY2Vz
cyB5b3Ugc2tpcCB5b3UgbWlnaHQgZW5kCnVwIG1pc3NpbmcgYml0cywgdGhlcmUgYXJlIGEgYnVu
Y2ggb2YgaHlwZXJjYWxscyBpbnZvbHZlZCBpbiBkb21haW4KY3JlYXRpb24uCgpOb3RlIGFsc28g
dGhhdCBkdXJpbmcgYSByZXN0b3JlIHRoZSBndWVzdCBpcyBhd2FyZSBvZiBzdWNoIHByb2Nlc3Ms
CmFuZCB3aWxsIGtub3cgdGhhdCBpdCBuZWVkcyB0byByZS1yZWdpc3RlciBzb21lIHN0dWZmLCBi
dXQgdGhhdCdzIG5vdAp0aGUgY2FzZSB3aGVuIGZvcmtpbmcsIHNpbmNlIHRoZSBndWVzdCBpcyBu
b3QgYXdhcmUgeW91IG5lZWQgdG8gbWFrZQpzdXJlIGV2ZXJ5dGhpbmcgaXMgaW4gcGxhY2UuIFRo
ZXJlIGFyZSBhbHNvIHRoZSBncmFudCB0YWJsZSBwYWdlcywKd2hpY2ggSSB0aGluayBzaG91bGQg
YWxzbyBiZSBoYW5kbGVkIHNvbWVob3cgKG9yIHdlIG5lZWQgdG8gYXQgbGVhc3QKbm90ZSB0aGlz
IGlzbid0IGhhbmRsZWQgYW5kIHdpbGwgbmVlZCBmaXhpbmcpLgoKPiA+IEFsc28sIHdoYXQgaGFw
cGVucyB0byBwYWdlcyB0aGF0IGFyZSBiZWluZyB1c2VkIGZvciBETUEgd2l0aCBlbXVsYXRlZAo+
ID4gZGV2aWNlcz8gV2lsbCBRRU1VIGZvcmVpZ24gbWFwcGluZ3MgYWxzbyB0cmlnZ2VyIHRoZSBw
b3B1bGF0ZSBvbgo+ID4gZGVtYW5kIHJvdXRpbmUsIHNvIHRoYXQgZXh0ZXJuYWwgZW11bGF0b3Jz
IGNhbiBhY2Nlc3MgdGhvc2U/Cj4gCj4gRm9yZWlnbiBtYXBwaW5ncyBkbyB0cmlnZ2VyIHRoZSBm
b3JrX3BhZ2Ugcm91dGluZSwgeWVzLiBTYW1lIGZvcgo+IHNldHRpbmcgbWVtX2FjY2VzcyBwZXJt
aXNzaW9ucy4KCk9LLCB0aGF0J3MgZmluZSB0aGVuLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
