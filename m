Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0B6CE1CB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 14:33:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHS9d-0001wd-As; Mon, 07 Oct 2019 12:30:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3UgB=YA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iHS9b-0001wN-KU
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 12:30:19 +0000
X-Inumbo-ID: 3823183e-e8fe-11e9-97af-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3823183e-e8fe-11e9-97af-12813bfff9fa;
 Mon, 07 Oct 2019 12:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570451417;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=J51K/zz4HgOu8gAljF1/XHnqOCMkILzkJzp/40hJgRI=;
 b=BLBevW+Jvrp3uTqzRImwbX7y09W/U3c7PJCFx79sAiJG1IeFb/OdjIaT
 tqQntECi6+rR1lIi5fd7WnT2q+sEZpwMCm4wb36Vy1XSvxIHCObFslOL1
 +6OLgwXw7CB07B+aZs46XKsTZUv0c4Dw9YovWEzw9+XfEOzuxQZhLhmev U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0xOpRHfBLWHnHTfonOKhEx0G6SJF/OezJsi21GrYWiPvnMhzNkl6K5UNpZkrhJhyGftOeiPcwP
 M1tsnyROAJjJb9Ev436gcNhKmXGl4aTrDfTPvP6h7wEciVK0QDoZTUBcAbaIy+T8pOW6b6a2ih
 t1U3CXTG+2/5bwu26Hi9nisZV5r+whKOmkWnC/KTzatc04MdY5GPUCWx3FmAve6q8WGVKpmuRP
 JPMhDsJ5k2mwZ31KrQZnzEmiS9tCAX4tETDad3vQVfp5OSVKxoZ4VSQctAW8bEejsdKcaPpdmx
 FUE=
X-SBRS: 2.7
X-MesageID: 6802926
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,268,1566878400"; 
   d="scan'208";a="6802926"
To: Lars Kurth <lars.kurth@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>, Rich Persaud <persaur@gmail.com>, "Ian
 Jackson" <Ian.Jackson@citrix.com>
References: <20191003205623.20839-1-andrew.cooper3@citrix.com>
 <20191003205623.20839-2-andrew.cooper3@citrix.com>
 <3ED61DA0-6499-42D8-9244-CD9DA72891EB@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <fbea5626-78b8-8e65-d732-c1b67c872f3d@citrix.com>
Date: Mon, 7 Oct 2019 13:29:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3ED61DA0-6499-42D8-9244-CD9DA72891EB@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/4] docs/sphinx: License content with
 CC-BY-4.0
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "Tim \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMTAvMjAxOSAxMzowMSwgTGFycyBLdXJ0aCB3cm90ZToKPgo+IO+7v09uIDAzLzEwLzIw
MTksIDIxOjU2LCAiQW5kcmV3IENvb3BlciIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdy
b3RlOgo+Cj4gICAgIENyZWF0aXZlIENvbW1vbnMgaXMgYSBtb3JlIGNvbW1vbiBsaWNlbnNlIHRo
YW4gR1BMIGZvciBkb2N1bWVudGF0aW9uIHB1cnBvc2VzLgo+ICAgICBTd2l0Y2ggdG8gdXNpbmcg
Q0MtQlktNC4wIHRvIGV4cGxpY2l0bHkgcGVybWl0IHJlLXB1cnBvc2luZyBhbmQgcmVtaXhpbmcg
b2YKPiAgICAgdGhlIGNvbnRlbnQuCj4gICAgIAo+ICAgICBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+ICAgICAtLS0KPiAgICAgQ0M6IExh
cnMgS3VydGggPGxhcnMua3VydGhAY2l0cml4LmNvbT4KPiAgICAgQ0M6IEdlb3JnZSBEdW5sYXAg
PEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KPiAgICAgQ0M6IElhbiBKYWNrc29uIDxpYW4u
amFja3NvbkBjaXRyaXguY29tPgo+ICAgICBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2Uu
Y29tPgo+ICAgICBDQzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUu
Y29tPgo+ICAgICBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
Pgo+ICAgICBDQzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+Cj4gICAgIENDOiBXZWkgTGl1IDx3
bEB4ZW4ub3JnPgo+ICAgICBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KPiAgICAg
Q0M6IFJpY2ggUGVyc2F1ZCA8cGVyc2F1ckBnbWFpbC5jb20+Cj4gICAgIENDOiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gICAgIC0tLQo+ICAgICAgQ09QWUlORyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKysrCj4gICAgICBkb2NzL1JFQURNRS5zb3VyY2Ug
ICAgICAgICAgICAgICAgICAgICAgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kwo+ICAgICAgZG9jcy9hZG1pbi1ndWlkZS9pbmRleC5yc3QgICAgICAgICAgICAgIHwgIDIgKysK
PiAgICAgIGRvY3MvYWRtaW4tZ3VpZGUvbWljcm9jb2RlLWxvYWRpbmcucnN0ICB8ICAyICsrCj4g
ICAgICBkb2NzL2NvbmYucHkgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gICAg
ICBkb2NzL2d1ZXN0LWd1aWRlL2luZGV4LnJzdCAgICAgICAgICAgICAgfCAgMiArKwo+ICAgICAg
ZG9jcy9ndWVzdC1ndWlkZS94ODYvaHlwZXJjYWxsLWFiaS5yc3QgIHwgIDIgKysKPiAgICAgIGRv
Y3MvZ3Vlc3QtZ3VpZGUveDg2L2luZGV4LnJzdCAgICAgICAgICB8ICAyICsrCj4gICAgICBkb2Nz
L2h5cGVydmlzb3ItZ3VpZGUvY29kZS1jb3ZlcmFnZS5yc3QgfCAgMiArKwo+ICAgICAgZG9jcy9o
eXBlcnZpc29yLWd1aWRlL2luZGV4LnJzdCAgICAgICAgIHwgIDIgKysKPiAgICAgIGRvY3MvaW5k
ZXgucnN0ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsrCj4gICAgICAxMSBmaWxlcyBj
aGFuZ2VkLCA1MiBpbnNlcnRpb25zKCspCj4gICAgICBjcmVhdGUgbW9kZSAxMDA2NDQgZG9jcy9S
RUFETUUuc291cmNlCj4gICAgIAo+ICAgICBkaWZmIC0tZ2l0IGEvQ09QWUlORyBiL0NPUFlJTkcK
PiAgICAgaW5kZXggMzEwZmQ1MmMyNy4uODBmYWMwOTFkMyAxMDA2NDQKPiAgICAgLS0tIGEvQ09Q
WUlORwo+ICAgICArKysgYi9DT1BZSU5HCj4gICAgIEBAIC00Nyw2ICs0Nyw5IEBAIHZhcmlvdXMg
ZHJpdmVycywgc3VwcG9ydCBmdW5jdGlvbnMgYW5kIGhlYWRlciBmaWxlcyB3aXRoaW4gWGVuLWF3
YXJlCj4gICAgICBMaW51eCBzb3VyY2UgdHJlZXMuIEluIGFsbCBzdWNoIGNhc2VzLCBsaWNlbnNl
IHRlcm1zIGFyZSBzdGF0ZWQgYXQgdGhlCj4gICAgICB0b3Agb2YgdGhlIGZpbGUgb3IgaW4gYSBD
T1BZSU5HIGZpbGUgaW4gdGhlIHNhbWUgZGlyZWN0b3J5Lgo+ICAgICAgCj4gICAgICtTcGhpbngg
ZG9jdW1lbnRhdGlvbiBpcyBsaWNlbnNlZCB1bmRlciBDQy1CWSA0LjAuICBTZWUKPiAgICAgK2Rv
Y3MvUkVBRE1FLnNvdXJjZSBmb3IgbW9yZSBzcGVjaWZpYyBpbmZvcm1hdGlvbi4KPiAgICAgKwo+
ICAgICAgSW4gc29tZSBjYXNlcywgY29tcGF0aWJsZSAzcmQgcGFydHkgY29kZSBoYXMgYmVlbiBp
bXBvcnRlZCBpbnRvIHRoZQo+ICAgICAgWGVuIHRyZWUsIHJldGFpbmluZyB0aGUgb3JpZ2luYWwg
bGljZW5zZSwgc3VjaCBhcwo+ICAgICAgICAtIEFFUy0xMjggMy4wCj4gICAgIGRpZmYgLS1naXQg
YS9kb2NzL1JFQURNRS5zb3VyY2UgYi9kb2NzL1JFQURNRS5zb3VyY2UKPiAgICAgbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiAgICAgaW5kZXggMDAwMDAwMDAwMC4uZjIwZmE5MmMyOAo+ICAgICAtLS0g
L2Rldi9udWxsCj4gICAgICsrKyBiL2RvY3MvUkVBRE1FLnNvdXJjZQo+ICAgICBAQCAtMCwwICsx
LDMyIEBACj4gICAgICtTcGhpbnggZG9jdW1lbnRhdGlvbjoKPiAgICAgKwo+ICAgICArQWxsIHNv
dXJjZSByZW5kZXJlZCBieSBTcGhpbnggaXMgbGljZW5zZWQgdW5kZXIgQ0MtQlktNC4wLgo+Cj4g
U29ycnkgZm9yIG9wZW5pbmcgdGhpcyBjYW4gb2Ygd29ybXMuIAo+Cj4gQWx0aG91Z2ggSSBoYWQg
c2VlbiB0aGUgZGlzY3Vzc2lvbiBiZXR3ZWVuIFJpY2ggYW5kIHlvdSBhYm91dCB0aGlzLCBJIGhh
ZCAKPiBub3QgYWN0dWFsbHkgZG9uZSBhbnkgZ3JvdW5kd29yayBvbiB0aGUgbGljZW5zaW5nLiAK
Pgo+IFNvLCB3ZSBoYXZlIHRvIGxvb2sgYXQgdHdvIHRoaW5nczoKPgo+ICogQ29tcGF0aWJpbGl0
eToKPiAgICBTZWUgaHR0cHM6Ly9jcmVhdGl2ZWNvbW1vbnMub3JnLzIwMTUvMTAvMDgvY2MtYnkt
c2EtNC0wLW5vdy1vbmUtd2F5LWNvbXBhdGlibGUtd2l0aC1ncGx2My8gCj4gICAgVGhpcyBtYWtl
cyBDQy1CWS00LjAgaW5ib3VuZCBjb21wYXRpYmxlIHdpdGggR1BMdjMKPiAgICBJdCdzIG5vdCBj
bGVhciB0byBtZSB3aGV0aGVyIEdQTHYyIGlzIGNvbXBhdGlibGUgd2l0aCBDQy1CWSA0LjA6IGxh
Y2sgb2YgcHVibGljbHkKPiAgICBhdmFpbGFibGUgaW5mb3JtYXRpb24gaW1wbGllcyB0aGlzIGlz
IG5vdCB0aGUgY2FzZSAKPgo+ICogT3V0cHV0IExpY2Vuc2UKPiAgICBCdXQgZXZlbiBpZiBpdCBp
cywgdGhlIHByb2R1Y2VkIHNwaGlueCBvdXRwdXQgd291bGQgYmUgR1BMdjIsIG5vdCBDQy1CWSA0
LjAKPiAgICBUaGlzIHdvdWxkIGV2ZW4gYmUgdHJ1ZSBpZiBub25lIG9mIHRoZSBvbGRlciBHUEx2
MiBkb2NzIHBvcnRpb25zIHdlcmUgaW5jbHVkZWQsIGFzCj4gICAgdGhlIEFQSSBkb2NzIGdlbmVy
YXRlZCBmcm9tIHNvdXJjZSBhcmUgR1BMdjIKPgo+IEFzIHN1Y2ggdGhlIHN0YXRlbWVudCAiQWxs
IHNvdXJjZSByZW5kZXJlZCBieSBTcGhpbnggaXMgbGljZW5zZWQgdW5kZXIKPiBDQy1CWS00LjAi
IGlzIHdyb25nLgoKQXQgdGhlIG1vbWVudCwgSSAoYW5kIHRoZXJlZm9yZSBDaXRyaXggaW4gcHJh
Y3RpY2UpIGhvbGRzIHRoZSBjb3B5cmlnaHQKb24gYWxsIHJzdCBjb250ZW50IHdoaWNoIGV4aXN0
cyBpbiBYZW4uCgpUaGUgcG9pbnQgb2YgdGhpcyBwYXRjaCBpcyB0byBnZXQgaXQgbGljZW5zZWQg
c2Vuc2libHkgKGFuZCBpbgpwYXJ0aWN1bGFyLCBub3QgZmFsbGluZyBiYWNrIHRvIHRoZSBHUEwg
ZGVmYXVsdCkgYmVmb3JlIDQuMTMgZ29lcyBvdXQgb2YKdGhlIGRvb3IuCgpUaGUgcmVzdWx0IHRo
ZXJlZm9yZSBpcyB1bmlmb3JtbHkgQ0MtQlktNC4wLCB3aXRoIG5vIEdQTCBpbiBzaWdodC4KCj4g
QWx0aG91Z2ggaXQgaXMgcHJvYmFibHkgY29ycmVjdCB0byBzYXkgIkFsbCBDQy1CWSA0LjAgc291
cmNlIHJlbmRlcmVkIGJ5Cj4gU3BoaW54IGlzIGxpY2Vuc2VkIHVuZGVyIENDLUJZLTQuMCIsIGJl
Y2F1c2UgU3BoaW54IHJldGFpbnMgdGhlIHNvdXJjZSBmaWxlCj4gdG8gaHRtbCBtYXBwaW5nIGFu
ZCBsaW5rYWdlIGluIGRvY3MgZ2VuZXJhdGlvbiB3b3JrcyBkaWZmZXJlbnRseQo+IHRvIGxpbmth
Z2UgaW4gY29kZS4gCj4KPiBJIGFtIHdvbmRlcmluZyB3aGV0aGVyIGFueW9uZSBlbHNlIGhhcyBj
b21lIGFjcm9zcyB0aGlzLiBUaGlzIHF1ZXN0aW9uIGluCj4gcGFydGljdWxhciBnb2VzIGJhY2sg
dG8gUmljaCB3aG8gbWFkZSBhIHZlcnkgc3Ryb25nIGNhc2UgZm9yIENDLUJZLTQuMCBiYXNlZAo+
IGRvY3VtZW50YXRpb24uIEkgZG9uJ3QgdGhpbmsgd2Ugd291bGQgaGF2ZSBhbiBpc3N1ZSBpZiB0
aGUgZW50aXJlIHNwaGlueCBkb2Mtc2V0Cj4gaXMgR1BMdjIgaWYgbW9zdCBjb250ZW50IGlzIGxp
Y2Vuc2VkIHVuZGVyIENDLUJZLTQuMCwgZXhjZXB0IHRoYXQgc3VjaCBhbgo+IGFwcHJvYWNoIHdv
dWxkIG1ha2UgcmUtdXNpbmcgdGhlIGVudGlyZSBzcGhpbnggZ2VuZXJhdGVkIGRvY3NldCBtZXNz
eS4KPgo+IFdlIHByb2JhYmx5IGFsc28gd2FudCB0byBtYWludGFpbiB0aGUgY2FwYWJpbGl0eSB0
byBjb3B5IHRleHQgZnJvbSBzb21lCj4gZG9jdW1lbnRhdGlvbiBmcmVlbHkgaW50byB0aGUgc291
cmNlIHRyZWUgYW5kIHZpY2UgdmVyc2EsIGlmIG5lZWRlZC4gVGhpcyBpcwo+IHBhcnRpY3VsYXJs
eSB0cnVlIGZvciBjb250ZW50IGluIFRlY2huaWNhbCBEZWJ0LCB1c2VyIGNvbnRlbnQgKG1heSBl
bmQgdXAgaW4KPiBtYW4gcGFnZXMpLCBldGMuCgpJIGRpc2FncmVlLCBpbnNvZmFyIGFzIGJsaW5k
bHkgY29weWluZyBub3RlcyBvdXQgb2Ygc291cmNlIGNvZGUgYW5kIGludG8KdGhlIHNwaGlueCBk
b2N1bWVudGF0aW9uIGlzIGxpYWJsZSB0byBnZXQgYSAtMSBmcm9tIG1lLgoKVGhlIHR5cGVzIG9m
IHN0eWxlL2xhbmd1YWdlIHdoaWNoIGFyZSBhcHByb3ByaWF0ZSBmb3IgdGhlc2UgdHdvIGNhc2Vz
CmFyZSBhIGRpc2pvaW50IHNldC4KCj4KPiBNYXliZSB0aGUgcmlnaHQgYXBwcm9hY2ggd291bGQg
YmUgdG8gZHVhbGx5IGxpY2Vuc2UgdGhlIGRvY3VtZW50YXRpb24KPiBmaWxlcyB1c2luZyBib3Ro
IEdQTHYyIGFuZCBDQy1CWSA0LjAgYW5kIHF1YW50aWZ5aW5nIHRoaXMgaW4gdGhlIENPUFlJTkcK
PiBmaWxlIG9mIHRoZSBkb2NzIGRpcmVjdG9yeSAoc3RhcnRpbmcgZnJvbSBhIHNwZWNpZmljIGRh
dGUpLiBXZSBjb3VsZCBldmVudHVhbGx5Cj4gcmUtbGljZW5zZSBhbGwgdGhlIG90aGVyIHN0dWZm
IG92ZXIgdGltZSwgd2hpY2ggc2hvdWxkIGJlIHJlbGF0aXZlbHkgc3RyYWlnaHRmb3J3YXJkCj4g
YW5kL29yIGV4Y2x1ZGUgc3BlY2lmaWMgcHJvYmxlbWF0aWMgZGlyZWN0b3JpZXMuCgpJIGRvbid0
IHNlZSBob3cgdGhhdCBoZWxwcyBmb3IgYmxpbmRseSBjb3B5aW5nIHRoaW5ncyBpbi7CoCBUaGV5
J2Qgc3RpbGwKYmUgR1BMMiBzdHJpY3RseSwgYW5kIHdvdWxkIG5lZWQgZXhwbGljaXQgcmVsaWNl
bnNpbmcgdG8gYmVjb21lIGR1YWwKbGljZW5zZWQsIGF0IHdoaWNoIHBvaW50LCB3aHkgbm90IGdv
IHN0cmFpZ2h0IGZvciBjb25zaXN0ZW5jeT8KCj4KPiBUaGluZ3MgbGlrZSBzdGFuZGFyZGlzaW5n
IHNheSBtYW4gcGFnZXMgdG8gcnN0LCB3b3VsZCBwb3RlbnRpYWxseSBhbHNvCj4gY3JlYXRlIGNv
bXBsZXhpdGllcyB3aXRoIHRoaXMgcGF0Y2gsIGJlY2F1c2Ugb2YgCj4gICAgICtUaGlzIGluY2x1
ZGVzOgo+ICAgICArICAqIEFsbCBSZVN0cnVjdHVyZWQgVGV4dCBmaWxlczogICAgICAgICAgZG9j
cy8qLyoucnN0Cj4KPiBJIGRvbid0IHdhbnQgdGhpcyB0byBiZWNvbWUgYSBsb25nLXdpbmRlZCBj
b252ZXJzYXRpb24gZHVyaW5nIHRoZSA0LjEzIGZyZWV6ZS4KPiBQbGVhc2Uga2VlcCB0aGlzIGlu
IG1pbmQgd2hlbiByZXNwb25kaW5nLgo+Cj4gSXQgbWF5IG1lYW4gdGhvdWdoLCB0aGF0IHdlIGNh
bid0IHJlc29sdmUgdGhpcyBiZWZvcmUgNC4xMyBpcyByZWxlYXNlZAoKR2V0dGluZyB0aGlzIGZp
eGVkIGlzIGEgYmxvY2tlciBmb3IgNC4xMy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
