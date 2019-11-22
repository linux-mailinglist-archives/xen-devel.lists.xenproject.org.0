Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5EC1073CF
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 15:03:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY9TZ-0000QJ-MG; Fri, 22 Nov 2019 13:59:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qik7=ZO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iY9TX-0000QE-Jm
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 13:59:55 +0000
X-Inumbo-ID: 5ba07bfa-0d30-11ea-9631-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ba07bfa-0d30-11ea-9631-bc764e2007e4;
 Fri, 22 Nov 2019 13:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574431194;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qtPBRaWuO7MCT7hwOI67o0Au0CWqYjVq0Y2HT/z70FY=;
 b=cZzzDfnjUJAcAcVOo8BEUKRJAxO18xNwOQE1f8tIslayhWJPKRC6HV4Q
 EOBLAVhoTUy+dcTeXAbgUObz6YngY2kQ8zsTz/JLgESX0vrEXLqTo94Cr
 5IaN1QirtUKu6lpOFK6hbX0BWzHa+SO0mH+D2zzy9LQN23o5oI0ggBRZR s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ce67d0fmvHWGuGz9H4PvlRgIVeH2yxlLvz3cr9cRz7PNGPkSkUs50L39786+r8H43eT9EFNKiC
 AGsIqqlnbhNhH59dZ0EoJCi0SHRZSVrkyMlLuR9KrPtCYeZUIexf5Bx3YL+yHZdKES/3gO9THU
 vXSMOEFzqA5DHOf3xatLG2jvv4mLz66BBvJtMbh9PS1NIkZNsK1hxfAj+Ei21Dj00Kv+VVgEwH
 9IjVIDuo8Fi/7oIzDpGUpBma+CXke5nSKrK5Ymg3oli36ZA5kt4GBqnaWJbecNIj0HTPE6RUMW
 Zt0=
X-SBRS: 2.7
X-MesageID: 9070016
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,229,1571716800"; 
   d="scan'208";a="9070016"
Date: Fri, 22 Nov 2019 14:59:39 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191122135939.GY72134@Air-de-Roger>
References: <20191121221551.1175-1-andrew.cooper3@citrix.com>
 <20191121221551.1175-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191121221551.1175-3-andrew.cooper3@citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/2] x86/svm: Write the correct %eip into
 the outgoing task
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTA6MTU6NTFQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgVEFTS19TV0lUQ0ggdm1leGl0IGhhcyBmYXVsdCBzZW1hbnRpY3MsIGFuZCBk
b2Vzbid0IHByb3ZpZGUgYW55IE5SSVBzCj4gYXNzaXN0YW5jZSB3aXRoIGluc3RydWN0aW9uIGxl
bmd0aC4gIEFzIGEgcmVzdWx0LCBhbnkgaW5zdHJ1Y3Rpb24taW5kdWNlZCB0YXNrCj4gc3dpdGNo
IGhhcyB0aGUgb3V0Z29pbmcgdGFzaydzICVlaXAgcG9pbnRpbmcgYXQgdGhlIGluc3RydWN0aW9u
IHN3aXRjaCBjYXVzZWQKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXiB0aGF0Cj4gdGhlIHN3aXRjaCwgcmF0aGVyIHRoYW4g
YWZ0ZXIgaXQuCj4gCj4gVGhpcyBjYXVzZXMgZXhwbGljaXQgdXNlIG9mIHRhc2sgZ2F0ZXMgdG8g
bGl2ZWxvY2sgKGFzIHdoZW4gdGhlIHRhc2sgcmV0dXJucywKPiBpdCBleGVjdXRlcyB0aGUgdGFz
ay1zd2l0Y2hpbmcgaW5zdHJ1Y3Rpb24gYWdhaW4pLCBhbmQgYW55IHJlc3RhcnRhYmxlIHRhc2sg
dG8KPiBiZWNvbWUgYSBub3AgYWZ0ZXIgaXRzIGZpcnN0IGluc3RhbnRpYXRpb24gKHRoZSBlbnRy
eSBzdGF0ZSBwb2ludHMgYXQgdGhlCj4gcmV0L2lyZXQgaW5zdHJ1Y3Rpb24gdXNlZCB0byBleGl0
IHRoZSB0YXNrKS4KPiAKPiAzMmJpdCBXaW5kb3dzIGluIHBhcnRpY3VsYXIgaXMga25vd24gdG8g
dXNlIHRhc2sgZ2F0ZXMgZm9yIE5NSSBoYW5kbGluZywgYW5kCj4gdG8gdXNlIE5NSSBJUElzLgo+
IAo+IEluIHRoZSB0YXNrIHN3aXRjaCBoYW5kbGVyLCBkaXN0aW5ndWlzaCBpbnN0cnVjdGlvbi1p
bmR1Y2VkIGZyb20KPiBpbnRlcnJ1cHQvZXhjZXB0aW9uLWluZHVjZWQgdGFzayBzd2l0Y2hlcywg
YW5kIGRlY29kZSB0aGUgaW5zdHJ1Y3Rpb24gdW5kZXIKPiAlcmlwIHRvIGNhbGN1bGF0ZSBpdHMg
bGVuZ3RoLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+Cj4gLS0tCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4K
PiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+Cj4gQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAK
PiBUaGUgaW1wbGVtZW50YXRpb24gb2Ygc3ZtX2dldF90YXNrX3N3aXRjaF9pbnNuX2xlbigpIGlz
IGJ1Zy1jb21wYXRpYmxlIHdpdGgKPiBzdm1fZ2V0X2luc25fbGVuKCkgd2hlbiBpdCBjb21lcyB0
byBjb25kaXRpb25hbCAjR1AnaW5nLiAgSSBzdGlsbCBoYXZlbid0IGhhZAo+IHRpbWUgdG8gYWRk
cmVzcyB0aGlzIG1vcmUgdGhvcm91Z2hseS4KPiAKPiBBTUQgZG9lcyBwZXJtaXQgVEFTS19TV0lU
Q0ggbm90IHRvIGJlIGludGVyY2VwdGVkIGFuZCwgSSdtIGluZm9ybWVkIGRvZXMgZG8KPiB0aGUg
cmlnaHQgdGhpbmcgd2hlbiBpdCBjb21lcyB0byBhIFRTUyBjcm9zc2luZyBhIHBhZ2UgYm91bmRh
cnkuICBIb3dldmVyLCBpdAo+IGlzIG5vdCBhY3R1YWxseSBzYWZlIHRvIGxlYXZlIHRhc2sgc3dp
dGNoZXMgdW5pbnRlcmNlcHRlZC4gIEFueSBOUFQgb3Igc2hhZG93Cj4gcGFnZSBmYXVsdCwgZXZl
biBmcm9tIGxvZ2RpcnR5L3BhZ2luZy9ldGMgd2lsbCBjb3JydXB0IGd1ZXN0IHN0YXRlIGluIGFu
Cj4gdW5yZWNvdmVyYWJsZSBtYW5uZXIuCj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9odm0vc3ZtL2Vt
dWxhdGUuYyAgICAgICAgfCA1NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+
ICB4ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYyAgICAgICAgICAgIHwgNDYgKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0KPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL2VtdWxhdGUu
aCB8ICAxICsKPiAgMyBmaWxlcyBjaGFuZ2VkLCA5MiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9zdm0vZW11bGF0ZS5jIGIv
eGVuL2FyY2gveDg2L2h2bS9zdm0vZW11bGF0ZS5jCj4gaW5kZXggM2U1MjU5Mjg0Ny4uMTc2YzI1
ZjYwZCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9lbXVsYXRlLmMKPiArKysg
Yi94ZW4vYXJjaC94ODYvaHZtL3N2bS9lbXVsYXRlLmMKPiBAQCAtMTE3LDYgKzExNyw2MSBAQCB1
bnNpZ25lZCBpbnQgc3ZtX2dldF9pbnNuX2xlbihzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgaW50
IGluc3RyX2VuYykKPiAgfQo+ICAKPiAgLyoKPiArICogVEFTS19TV0lUQ0ggdm1leGl0cyBuZXZl
ciBwcm92aWRlIGFuIGluc3RydWN0aW9uIGxlbmd0aC4gIFdlIG11c3QgYWx3YXlzCj4gKyAqIGRl
Y29kZSB1bmRlciAlcmlwIHRvIGZpbmQgdGhlIGFuc3dlci4KPiArICovCj4gK3Vuc2lnbmVkIGlu
dCBzdm1fZ2V0X3Rhc2tfc3dpdGNoX2luc25fbGVuKHN0cnVjdCB2Y3B1ICp2KQo+ICt7Cj4gKyAg
ICBzdHJ1Y3QgaHZtX2VtdWxhdGVfY3R4dCBjdHh0Owo+ICsgICAgc3RydWN0IHg4Nl9lbXVsYXRl
X3N0YXRlICpzdGF0ZTsKPiArICAgIHVuc2lnbmVkIGludCBlbXVsX2xlbiwgbW9kcm1fcmVnOwo+
ICsKPiArICAgIEFTU0VSVCh2ID09IGN1cnJlbnQpOwo+ICsgICAgaHZtX2VtdWxhdGVfaW5pdF9v
bmNlKCZjdHh0LCBOVUxMLCBndWVzdF9jcHVfdXNlcl9yZWdzKCkpOwo+ICsgICAgaHZtX2VtdWxh
dGVfaW5pdF9wZXJfaW5zbigmY3R4dCwgTlVMTCwgMCk7Cj4gKyAgICBzdGF0ZSA9IHg4Nl9kZWNv
ZGVfaW5zbigmY3R4dC5jdHh0LCBodm1lbXVsX2luc25fZmV0Y2gpOwo+ICsgICAgaWYgKCBJU19F
UlJfT1JfTlVMTChzdGF0ZSkgKQoKTWF5YmUgY3Jhc2ggdGhlIGd1ZXN0IGluIHRoaXMgY2FzZT8g
Tm90IGFkdmFuY2luZyB0aGUgaW5zdHJ1Y3Rpb24KcG9pbnRlciBpbiBhIHNvZnR3YXJlIGluZHVj
ZWQgdGFzayBzd2l0Y2ggd2lsbCBjcmVhdGUgYSBsb29wIEFGQUlDVD8KCj4gKyAgICAgICAgcmV0
dXJuIDA7Cj4gKwo+ICsgICAgZW11bF9sZW4gPSB4ODZfaW5zbl9sZW5ndGgoc3RhdGUsICZjdHh0
LmN0eHQpOwo+ICsKPiArICAgIC8qCj4gKyAgICAgKiBDaGVjayBmb3IgYW4gaW5zdHJ1Y3Rpb24g
d2hpY2ggY2FuIGNhdXNlIGEgdGFzayBzd2l0Y2guICBBbnkgZmFyCj4gKyAgICAgKiBqbXAvY2Fs
bC9yZXQsIGFueSBzb2Z0d2FyZSBpbnRlcnJ1cHQvZXhjZXB0aW9uLCBhbmQgaXJldC4KPiArICAg
ICAqLwo+ICsgICAgc3dpdGNoICggY3R4dC5jdHh0Lm9wY29kZSApCj4gKyAgICB7Cj4gKyAgICBj
YXNlIDB4ZmY6IC8qIEdycCA1ICovCj4gKyAgICAgICAgLyogY2FsbCAvIGptcCAoZmFyLCBhYnNv
bHV0ZSBpbmRpcmVjdCkgKi8KPiArICAgICAgICBpZiAoIHg4Nl9pbnNuX21vZHJtKHN0YXRlLCBO
VUxMLCAmbW9kcm1fcmVnKSAhPSAzIHx8Cj4gKyAgICAgICAgICAgICAobW9kcm1fcmVnICE9IDMg
JiYgbW9kcm1fcmVnICE9IDUpICkKPiArICAgICAgICB7Cj4gKyAgICAgICAgICAgIC8qIFdyb25n
IGluc3RydWN0aW9uLiAgVGhyb3cgI0dQIGJhY2sgZm9yIG5vdy4gKi8KPiArICAgIGRlZmF1bHQ6
Cj4gKyAgICAgICAgICAgIGh2bV9pbmplY3RfaHdfZXhjZXB0aW9uKFRSQVBfZ3BfZmF1bHQsIDAp
Owo+ICsgICAgICAgICAgICBlbXVsX2xlbiA9IDA7Cj4gKyAgICAgICAgICAgIGJyZWFrOwo+ICsg
ICAgICAgIH0KPiArICAgICAgICAvKiBGYWxsdGhyb3VnaCAqLwo+ICsgICAgY2FzZSAweDYyOiAv
KiBib3VuZCAqLwo+ICsgICAgY2FzZSAweDlhOiAvKiBjYWxsIChmYXIsIGFic29sdXRlKSAqLwoK
SSdtIHNsaWdodGx5IGxvc3MgaGVyZSwgaW4gdGhlIGNhc2Ugb2YgY2FsbCBvciBqbXAgZm9yIGV4
YW1wbGUsIGRvbid0CnlvdSBuZWVkIHRoZSBpbnN0cnVjdGlvbiBwb2ludGVyIHRvIHBvaW50IHRv
IHRoZSBkZXN0aW5hdGlvbiBvZiB0aGUKY2FsbC9qbXAgaW5zdGVhZCBvZiB0aGUgbmV4dCBpbnN0
cnVjdGlvbj8KCj4gKyAgICBjYXNlIDB4Y2E6IC8qIHJldCBpbW0xNiAoZmFyKSAqLwo+ICsgICAg
Y2FzZSAweGNiOiAvKiByZXQgKGZhcikgKi8KPiArICAgIGNhc2UgMHhjYzogLyogaW50MyAqLwo+
ICsgICAgY2FzZSAweGNkOiAvKiBpbnQgaW1tOCAqLwo+ICsgICAgY2FzZSAweGNlOiAvKiBpbnRv
ICovCj4gKyAgICBjYXNlIDB4Y2Y6IC8qIGlyZXQgKi8KPiArICAgIGNhc2UgMHhlYTogLyogam1w
IChmYXIsIGFic29sdXRlKSAqLwo+ICsgICAgY2FzZSAweGYxOiAvKiBpY2VicCAqLwo+ICsgICAg
ICAgIGJyZWFrOwo+ICsgICAgfQo+ICsKPiArICAgIHg4Nl9lbXVsYXRlX2ZyZWVfc3RhdGUoc3Rh
dGUpOwo+ICsKPiArICAgIHJldHVybiBlbXVsX2xlbjsKPiArfQo+ICsKPiArLyoKPiAgICogTG9j
YWwgdmFyaWFibGVzOgo+ICAgKiBtb2RlOiBDCj4gICAqIGMtZmlsZS1zdHlsZTogIkJTRCIKPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMgYi94ZW4vYXJjaC94ODYvaHZt
L3N2bS9zdm0uYwo+IGluZGV4IDA0OWI4MDBlMjAuLmJhOWMyNGE3MGMgMTAwNjQ0Cj4gLS0tIGEv
eGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9z
dm0uYwo+IEBAIC0yNzc2LDcgKzI3NzYsNDEgQEAgdm9pZCBzdm1fdm1leGl0X2hhbmRsZXIoc3Ry
dWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCj4gIAo+ICAgICAgY2FzZSBWTUVYSVRfVEFTS19TV0lU
Q0g6IHsKPiAgICAgICAgICBlbnVtIGh2bV90YXNrX3N3aXRjaF9yZWFzb24gcmVhc29uOwo+IC0g
ICAgICAgIGludDMyX3QgZXJyY29kZSA9IC0xOwo+ICsgICAgICAgIGludDMyX3QgZXJyY29kZSA9
IC0xLCBpbnNuX2xlbiA9IC0xOwoKUGxhaW4gaW50IHNlZW0gYmV0dGVyIGZvciBpbnNuX2xlbj8K
CkFsc28gSSdtIG5vdCBzdXJlIHRoZXJlJ3MgYSByZWFzb24gdGhhdCBlcnJjb2RlIHVzZXMgaW50
MzJfdCwgYnV0CnRoYXQncyBub3QgaW50cm9kdWNlZCBoZXJlIGFueXdheS4KClRoYW5rcywgUm9n
ZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
