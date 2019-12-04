Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9A9112990
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 11:52:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icSEZ-0002lF-EX; Wed, 04 Dec 2019 10:50:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WV3s=Z2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1icSEY-0002l8-5M
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 10:50:14 +0000
X-Inumbo-ID: d836b16f-1683-11ea-8200-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d836b16f-1683-11ea-8200-12813bfff9fa;
 Wed, 04 Dec 2019 10:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575456613;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RW4tFyDKYHaIGRpE9nPFkXsSxAnhW5awHVSnLRdKDoI=;
 b=BwSFo4oWj8cLHJhc34N9F+I3P2BB9bdWtJiiXyOHT8qGckvkw2Y52Zog
 cKBvqXVjE3nx5/gfqkpZdha0leix1XUZKsltrdCPzx9n2LCig2/Olg2PE
 N/A5NsRyo8JdwjUsUUVNZ7q+EQg+sj/C2kdR2DVd8fSgL2EKR2r203RG+ M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9LjzTafQKSSGBi7MI6lZmdagSrJ+mWXtqUaIKjGnpq1FGACABq/ByfHZsSnfzmgs9r4ksz0n5V
 FPJMLbwJM/lerD+8FLbjqNWRmJwAQEOjcuBO+nFB2OWJHu5zPVENA9xfhfib8gq+q8dsEBNGDe
 IGRxg6xujqnrjSzac4wcp6jTwAloxtrf4thG/FxrKyY0aX/8nPSa0lu0CtP+ar14M6KQYNXK0k
 T8lqU+fTqY/Pi1zRqw4blhgnTLsC5eDLP1OHimtCkgKv+g7YMFqUlNa/EhR8GpCbUD3BrW6giN
 JCk=
X-SBRS: 2.7
X-MesageID: 9182251
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,277,1571716800"; 
   d="scan'208";a="9182251"
Date: Wed, 4 Dec 2019 11:50:04 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191204105004.GI980@Air-de-Roger>
References: <20191129112851.19273-1-roger.pau@citrix.com>
 <20191129112851.19273-3-roger.pau@citrix.com>
 <20191129113813.GX980@Air-de-Roger>
 <c06efe66-389c-2124-d4c1-f26a54d5ac5f@suse.com>
 <20191204091734.GG980@Air-de-Roger>
 <477e94ce-c27b-5ea9-15af-a6dd1844edc7@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <477e94ce-c27b-5ea9-15af-a6dd1844edc7@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 2/4] x86/apic: force phys mode if
 interrupt remapping is disabled
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBEZWMgMDQsIDIwMTkgYXQgMTA6MzQ6MTRBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDQuMTIuMjAxOSAxMDoxNywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFR1ZSwgRGVjIDAzLCAyMDE5IGF0IDA0OjE0OjQ2UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDI5LjExLjIwMTkgMTI6MzgsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+ID4+
PiBPbiBGcmksIE5vdiAyOSwgMjAxOSBhdCAxMjoyODo0OVBNICswMTAwLCBSb2dlciBQYXUgTW9u
bmUgd3JvdGU6Cj4gPj4+PiBDbHVzdGVyIG1vZGUgY2FuIG9ubHkgYmUgdXNlZCB3aXRoIGludGVy
cnVwdCByZW1hcHBpbmcgc3VwcG9ydCwgc2luY2UKPiA+Pj4+IHRoZSB0b3AgMTZiaXRzIG9mIHRo
ZSBBUElDIElEIGFyZSBmaWxsZWQgd2l0aCB0aGUgY2x1c3RlciBJRCwgYW5kCj4gPj4+PiBoZW5j
ZSBvbiBzeXN0ZW1zIHdoZXJlIHRoZSBwaHlzaWNhbCBJRCBpcyBzdGlsbCBzbWFsbGVyIHRoYW4g
MjU1IHRoZQo+ID4+Pj4gY2x1c3RlciBJRCBpcyBub3QuIEZvcmNlIHgyQVBJQyB0byB1c2UgcGh5
c2ljYWwgbW9kZSBpZiB0aGVyZSdzIG5vCj4gPj4+PiBpbnRlcnJ1cHQgcmVtYXBwaW5nIHN1cHBv
cnQuCj4gPj4+Pgo+ID4+Pj4gTm90ZSB0aGF0IHRoaXMgcmVxdWlyZXMgYSBmdXJ0aGVyIHBhdGNo
IGluIG9yZGVyIHRvIGVuYWJsZSB4MkFQSUMKPiA+Pj4+IHdpdGhvdXQgaW50ZXJydXB0IHJlbWFw
cGluZyBzdXBwb3J0Lgo+ID4+Pj4KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+ID4+Pgo+ID4+PiBUaGlzIGlzIG1pc3NpbmcgYSBj
b21tYW5kIGxpbmUgZG9jIHVwZGF0ZSBhbmQgdGhlIGxvZ2ljIGJlbG93IGlnbm9yZXMKPiA+Pj4g
YSB1c2VyLXNldCB4MmFwaWNfcGh5cyB2YWx1ZS4KPiA+Pgo+ID4+IFNvIHdoYXQgd291bGQgdGhl
IGJlaGF2aW9yIGJlIGluIHlvdXIgb3BpbmlvbiB3aGVuIHRoZSB1c2VyCj4gPj4gaGFzIHJlcXVl
c3RlZCBjbHVzdGVyIG1vZGU/IEkgY2FuJ3Qgc2VlIHlvdSBkbyBtdWNoIG90aGVyCj4gPj4gdGhh
biBwYW5pYygpLWluZywgcGVyaGFwcyBpdCdzIGJldHRlciB0byBvdmVycmlkZSB0aGUgcmVxdWVz
dAo+ID4+IChhcyB5b3UgYWxyZWFkeSBkbyk/Cj4gPiAKPiA+IEkgdGhpbmsgcGFuaWMnaW5nIGlz
IGZpbmUsIGEgdXNlciBzaG91bGRuJ3QgYmUgc2V0dGluZyB4MmFwaWNfcGh5cwo+ID4gdW5sZXNz
IHRoZXkga25vdyB3aGF0IGFyZSBkb2luZywgYW5kIHRoZW4gWGVuIGNoYW5naW5nIGl0IG9uIHRo
ZSBiYWNrCj4gPiBvZiB0aGUgdXNlciBhbHNvIGRvZXNuJ3Qgc2VlbSBmaW5lLgo+ID4gCj4gPiBB
IHBhbmljIGV4cGxhaW5pbmcgdGhhdCB4MmFwaWNfcGh5cz1mYWxzZSBpcyBub3Qgc3VwcG9ydGVk
IGFuZCB0aGF0Cj4gPiB0aGUgYm94IGNhbiBvbmx5IGJlIGJvb3RlZCB3aXRoIHgyYXBpYyBwaHlz
IG1vZGUgc2hvdWxkIGJlIGZpbmUgSU1PLgo+IAo+IEkgY2FuIHNlZSB0aGlzIGFzIGEgdmFsaWQg
cG9zaXRpb24gdG8gdGFrZS4gUGVyc29uYWxseSwgaG93ZXZlciwgSQo+IGRvIHRoaW5rIHdlIHNo
b3VsZCBhdm9pZCBmYWlsaW5nIHRvIGJvb3QgaWYgd2UgZWFzaWx5IGNhbi4gKFllcywgd2UKPiBz
aG91bGQgbG9nIHRoZSBmYWN0IHRoYXQgd2UgaWdub3JlIGEgY29tbWFuZCBsaW5lIG9wdGlvbiBp
biBzdWNoIGEKPiBjYXNlLikKCkFjaywgSSBkb24ndCBoYXZlIGEgc3Ryb25nIG9waW5pb24sIHNv
IEkgd291bGQgZ28gdGhpcyByb3V0ZS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
