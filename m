Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2529557E3D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 10:32:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgPlt-0003ab-St; Thu, 27 Jun 2019 08:28:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0PCY=U2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hgPls-0003aW-W8
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 08:28:45 +0000
X-Inumbo-ID: 91750f4c-98b5-11e9-9370-db8972bdc7b0
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91750f4c-98b5-11e9-9370-db8972bdc7b0;
 Thu, 27 Jun 2019 08:28:41 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: P4GJzsqQKoHajYZORygcV6PlnAwhbwfhup0nstVjLswhIyPqD+HJDh5Hu1foVehHqjBx2a4SFn
 kguCZS9bSQ+C/5QDpFFd1K8ue5K66f2wdNrhebHPv/JGdXz8DPK5EEif8B0hRZu8lz+A30l8Wo
 6I5Nxt6ZMzQi1hCSdrp2jk0vmXDdDYQmzH4543CXzGS6msowdtInn/k00PluNMAjGiLVd4OEWo
 Pv9qo0Z5RHskkmSR+qaT8Z6Sg3n3MyCaUsX+fsZI/4eDMWP5fHXpjZqkBhISfqvqds7Q4/qg4S
 K2s=
X-SBRS: 2.7
X-MesageID: 2314603
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,423,1557201600"; 
   d="scan'208";a="2314603"
Date: Thu, 27 Jun 2019 10:28:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20190627082834.ge2gr3lljjnomug5@MacBook-Air-de-Roger.local>
References: <20190626133726.29896-1-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626133726.29896-1-jgross@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] libxl: fix pci device re-assigning after
 domain reboot
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDM6Mzc6MjZQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBBZnRlciBhIHJlYm9vdCBvZiBhIGd1ZXN0IG9ubHkgdGhlIGZpcnN0IHBjaSBkZXZp
Y2UgY29uZmlndXJhdGlvbiB3aWxsCj4gYmUgcmV0cmlldmVkIGZyb20gWGVuc3RvcmUgcmVzdWx0
aW5nIGluIGxvc3Mgb2YgYW55IGZ1cnRoZXIgYXNzaWduZWQKPiBwYXNzZWQgdGhyb3VnaCBwY2kg
ZGV2aWNlcy4KPiAKPiBUaGUgbWFpbiByZWFzb24gaXMgdGhhdCBhbGwgcGFzc2VkIHRocm91Z2gg
cGNpIGRldmljZXMgcmVzaWRlIHVuZGVyIGEKPiBjb21tb24gcm9vdCBkZXZpY2UgIjAiIGluIFhl
bnN0b3JlLiBTbyB3aGVuIHRoZSBkZXZpY2UgbGlzdCBpcyByZWJ1aWx0Cj4gZnJvbSBYZW5zdG9y
ZSBhZnRlciBhIHJlYm9vdCB0aGUgc3ViLWRldmljZXMgYmVsb3cgdGhhdCByb290IGRldmljZQo+
IG5lZWQgdG8gYmUgc2VsZWN0ZWQgaW5zdGVhZCBvZiB1c2luZyB0aGUgcm9vdCBkZXZpY2UgbnVt
YmVyIGFzIGEKPiBzZWxlY3Rvci4KPiAKPiBGaXggdGhhdCBieSBhZGRpbmcgYSBuZXcgbWVtYmVy
IHRvIHN0cnVjdCBsaWJ4bF9kZXZpY2VfdHlwZSB3aGljaCB3aGVuCj4gc2V0IGlzIHVzZWQgdG8g
Z2V0IHRoZSBudW1iZXIgb2YgZGV2aWNlcy4gQWRkIHN1Y2ggYSBtZW1iZXIgZm9yIHBjaSB0bwo+
IGdldCB0aGUgY29ycmVjdCBudW1iZXIgb2YgcGNpIGRldmljZXMgaW5zdGVhZCBvZiBpbXBseWlu
ZyBpdCBmcm9tIHRoZQo+IG51bWJlciBvZiBwY2kgcm9vdCBkZXZpY2VzICh3aGljaCB3aWxsIGFs
d2F5cyBiZSAxKS4KPiAKPiBXaGlsZSBhdCBpdCBmaXggdGhlIHR5cGUgb2YgbGlieGxfX2Rldmlj
ZV9wY2lfZnJvbV94c19iZSgpIHRvIG1hdGNoCj4gdGhlIG9uZSBvZiB0aGUgLmZyb21feGVuc3Rv
cmUgbWVtYmVyIG9mIHN0cnVjdCBsaWJ4bF9kZXZpY2VfdHlwZS4gVGhpcwo+IGZpeGVzIGEgbGF0
ZW50IGJ1ZyBjaGVja2luZyB0aGUgcmV0dXJuIHZhbHVlIG9mIGEgZnVuY3Rpb24gcmV0dXJuaW5n
Cj4gdm9pZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+Cj4gVGVzdGVkLWJ5OiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPgoKUmV2aWV3ZWQt
Ynk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhhbmtzIQoKPiAt
LS0KPiAgdG9vbHMvbGlieGwvbGlieGxfZGV2aWNlLmMgICB8IDI0ICsrKysrKysrKysrKysrKysr
KystLS0tLQo+ICB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgIDIgKysKPiAgdG9vbHMv
bGlieGwvbGlieGxfcGNpLmMgICAgICB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RldmljZS5jIGIvdG9vbHMv
bGlieGwvbGlieGxfZGV2aWNlLmMKPiBpbmRleCBkYjZjMDIwM2I3Li5hMjU2OTEwMmVlIDEwMDY0
NAo+IC0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RldmljZS5jCj4gKysrIGIvdG9vbHMvbGlieGwv
bGlieGxfZGV2aWNlLmMKPiBAQCAtMjAyNiw2ICsyMDI2LDcgQEAgdm9pZCAqbGlieGxfX2Rldmlj
ZV9saXN0KGxpYnhsX19nYyAqZ2MsIGNvbnN0IHN0cnVjdCBsaWJ4bF9kZXZpY2VfdHlwZSAqZHQs
Cj4gICAgICBjaGFyICpsaWJ4bF9wYXRoOwo+ICAgICAgY2hhciAqKmRpciA9IE5VTEw7Cj4gICAg
ICB1bnNpZ25lZCBpbnQgbmRpcnMgPSAwOwo+ICsgICAgdW5zaWduZWQgaW50IG5kZXZzID0gMDsK
CkkgdGhpbmsgeW91IGNvdWxkIHJlZHVjZSB0aGUgc2NvcGUgb2YgbmRldnMuLi4KCj4gICAgICBp
bnQgcmM7Cj4gIAo+ICAgICAgKm51bSA9IDA7Cj4gQEAgLTIwMzcsMjEgKzIwMzgsMzQgQEAgdm9p
ZCAqbGlieGxfX2RldmljZV9saXN0KGxpYnhsX19nYyAqZ2MsIGNvbnN0IHN0cnVjdCBsaWJ4bF9k
ZXZpY2VfdHlwZSAqZHQsCj4gICAgICBkaXIgPSBsaWJ4bF9feHNfZGlyZWN0b3J5KGdjLCBYQlRf
TlVMTCwgbGlieGxfcGF0aCwgJm5kaXJzKTsKPiAgCj4gICAgICBpZiAoZGlyICYmIG5kaXJzKSB7
CgouLi4gYnkgZGVjbGFyaW5nIGl0IGhlcmUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
