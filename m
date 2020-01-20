Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C75E142A0F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 13:07:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itVnm-0007kt-9Q; Mon, 20 Jan 2020 12:05:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UWIx=3J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1itVnk-0007kn-OB
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 12:05:04 +0000
X-Inumbo-ID: 15b4751c-3b7d-11ea-b958-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15b4751c-3b7d-11ea-b958-12813bfff9fa;
 Mon, 20 Jan 2020 12:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579521901;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=J7WmfrR5DLatztWNzpzyQhNIXjMw/wzX5KqRX94zww4=;
 b=XyuPELhOFdCTyD4T48hurIiFuT1PBBaXS6VZQ4rqwu/NhUeqLF8vfmdD
 h3JGBKwHK5xbyi9eezz+y8Z1SQEBsxFbgei8MS3YQjdtjaLAnWcj90Ll4
 Hl1kMTHfUN4l1/le1uxMSto4cIMbrR1oDEmGOjHApvma34jrB/3g2toyY w=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nK/YV+3zLfwA6QQ3+8BHBCL0Te2hqg2/qbi+lmMGb841JLTXB7bYV9KROeidguWbDClYXy9okT
 x3Xn2TxLtB2bwyhZ92aJQ7G6ZbyoyDS3hsJrrPwxnj6JEmOLALoaRY9zK/Iordx6DMceeIw20g
 L0dji+TCdnFcKqVsWokvRy7OKtNeNYOS/YEQVsH2OVE1rEuQzsW5Ko5H3Ift2Zw/9IhLUlHS2D
 6xN752v2gpCjLRp8qeOhlslTEOSkMtXq6p8bcHd6a/908++rvc3fIPyNdnw1PvSeSUw7iS/2Cm
 3ks=
X-SBRS: 2.7
X-MesageID: 11587893
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,341,1574139600"; d="scan'208";a="11587893"
Date: Mon, 20 Jan 2020 12:04:44 +0000
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200120120444.GY11756@Air-de-Roger>
References: <6f167053-38dc-19b5-a873-321d978e9a59@suse.com>
 <9f4b57e9-c7a4-78e9-32c1-b25530c550f4@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9f4b57e9-c7a4-78e9-32c1-b25530c550f4@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3 1/8] x86: determine HAVE_AS_* just once
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMDYsIDIwMjAgYXQgMDU6MzQ6NDVQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gV2l0aCB0aGUgZXhjZXB0aW9uIG9mIEhBVkVfQVNfUVVPVEVEX1NZTSwgcG9wdWxhdGUg
dGhlIHJlc3VsdHMgaW50byBhCj4gZ2VuZXJhdGVkIGhlYWRlciBpbnN0ZWFkIG9mIChhdCBsZWFz
dCBvbmNlIHBlciBbc3ViXWRpcmVjdG9yeSkgaW50bwo+IENGTEFHUy4gVGhpcyByZXN1bHRzIGlu
IHByb3BlciByZWJ1aWxkcyAodmlhIG1ha2UgZGVwZW5kZW5jaWVzKSBpbiBjYXNlCj4gdGhlIGNv
bXBpbGVyIHVzZWQgY2hhbmdlcyBiZXR3ZWVuIGJ1aWxkcy4gSXQgYWRkaXRpb25hbGx5IGVhc2Vz
Cj4gaW5zcGVjdGlvbiBvZiB3aGljaCBhc3NlbWJsZXIgZmVhdHVyZXMgd2VyZSBhY3R1YWxseSBm
b3VuZCB1c2FibGUuCj4gCj4gU29tZSB0cmlja2VyeSBpcyBuZWVkZWQgdG8gYXZvaWQgaGVhZGVy
IGdlbmVyYXRpb24gaXRzZWxmIHRvIHRyeSB0bwo+IGluY2x1ZGUgdGhlIHRvLWJlL25vdC15ZXQt
Z2VuZXJhdGVkIGhlYWRlci4KPiAKPiBTaW5jZSB0aGUgZGVmaW5pdGlvbnMgaW4gZ2VuZXJhdGVk
L2NvbmZpZy5oLCBwcmV2aW91c2x5IGhhdmluZyBiZWVuCj4gY29tbWFuZCBsaW5lIG9wdGlvbnMs
IG1pZ2h0IGV2ZW4gYWZmZWN0IHhlbi9jb25maWcuaCBvciBpdHMgZGVzY2VuZGFudHMsCj4gbW92
ZSBhZGRpbmcgb2YgdGhlIC1pbmNsdWRlIG9wdGlvbiBmb3IgdGhlIGxhdHRlciBhZnRlciBpbmNs
dXNpb24gb2YgdGhlCj4gcGVyLWFyY2ggUnVsZXMubWsuIFVzZSB0aGUgb2NjYXNpb24gdG8gYWxz
byBtb3ZlIHRoZSBtb3N0IGdlbmVyYWwgLUkKPiBvcHRpb24gdG8gdGhlIGNvbW1vbiBSdWxlcy5t
ay4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4g
LS0tCj4gdjQ6IE5ldy4KPiAtLS0KPiBBbiBhbHRlcm5hdGl2ZSB0byB0aGUgJChNQUtFQ01ER09B
TFMpIHRyaWNrZXJ5IHdvdWxkIGJlIHRvIG1ha2UKPiBnZW5lcmF0aW9uIG9mIGdlbmVyYXRlZC9j
b25maWcuaCBwYXJ0IG9mIHRoZSBhc20tb2Zmc2V0cy5zIHJ1bGUsIGluc3RlYWQKPiBvZiBhZGRp
bmcgaXQgYXMgYSBkZXBlbmRlbmN5IHRoZXJlLiBOb3Qgc3VyZSB3aGV0aGVyIGVpdGhlciBpcyB0
cnVseQo+IGJldHRlciB0aGFuIHRoZSBvdGhlci4KPiAKPiAtLS0gYS9Db25maWcubWsKPiArKysg
Yi9Db25maWcubWsKPiBAQCAtMTUxLDcgKzE1MSw3IEBAIGVuZGlmCj4gICMgYXMtaW5zbjogQ2hl
Y2sgd2hldGhlciBhc3NlbWJsZXIgc3VwcG9ydHMgYW4gaW5zdHJ1Y3Rpb24uCj4gICMgVXNhZ2U6
IGNmbGFncy15ICs9ICQoY2FsbCBhcy1pbnNuLENDIEZMQUdTLCJpbnNuIixvcHRpb24teWVzLG9w
dGlvbi1ubykKPiAgYXMtaW5zbiA9ICQoaWYgJChzaGVsbCBlY2hvICd2b2lkIF8odm9pZCkgeyBh
c20gdm9sYXRpbGUgKCAkKDIpICk7IH0nIFwKPiAtICAgICAgICAgICAgICAgICAgICAgICB8ICQo
ZmlsdGVyLW91dCAtTSUgJS5kIC1pbmNsdWRlICUvaW5jbHVkZS94ZW4vY29uZmlnLmgsJCgxKSkg
XAo+ICsgICAgICAgICAgICAgICAgICAgICAgIHwgJChmaWx0ZXItb3V0IC1NJSAlLmQgLWluY2x1
ZGUgJS9jb25maWcuaCwkKDEpKSBcCgpEb24ndCB5b3UgbmVlZCB0byBmaWx0ZXIgb3V0IC1pbmNs
dWRlIHhlbi9jb25maWcuaCBhcyBhZGRlZCB0byBDTEZBR1MKYmVsb3c/Cgo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAtYyAteCBjIC1vIC9kZXYvbnVsbCAtIDI+JjEpLCQoNCksJCgz
KSkKPiAgCj4gICMgYXMtb3B0aW9uLWFkZDogQ29uZGl0aW9uYWxseSBhZGQgb3B0aW9ucyB0byBm
bGFncwo+IC0tLSBhL3hlbi9SdWxlcy5tawo+ICsrKyBiL3hlbi9SdWxlcy5tawo+IEBAIC01OSw3
ICs1OSw3IEBAIGVuZGlmCj4gIENGTEFHUyArPSAtbm9zdGRpbmMgLWZuby1idWlsdGluIC1mbm8t
Y29tbW9uCj4gIENGTEFHUyArPSAtV2Vycm9yIC1XcmVkdW5kYW50LWRlY2xzIC1Xbm8tcG9pbnRl
ci1hcml0aAo+ICAkKGNhbGwgY2Mtb3B0aW9uLWFkZCxDRkxBR1MsQ0MsLVd2bGEpCj4gLUNGTEFH
UyArPSAtcGlwZSAtRF9fWEVOX18gLWluY2x1ZGUgJChCQVNFRElSKS9pbmNsdWRlL3hlbi9jb25m
aWcuaAo+ICtDRkxBR1MgKz0gLXBpcGUgLURfX1hFTl9fIC1JJChCQVNFRElSKS9pbmNsdWRlCj4g
IENGTEFHUy0kKENPTkZJR19ERUJVR19JTkZPKSArPSAtZwo+ICBDRkxBR1MgKz0gJy1EX19PQkpF
Q1RfRklMRV9fPSIkQCInCj4gIAo+IEBAIC05Nyw2ICs5Nyw5IEBAIExERkxBR1MgKz0gJChMREZM
QUdTLXkpCj4gIAo+ICBpbmNsdWRlICQoQkFTRURJUikvYXJjaC8kKFRBUkdFVF9BUkNIKS9SdWxl
cy5tawo+ICAKPiArIyBBbGxvdyB0aGUgYXJjaCB0byB1c2UgLWluY2x1ZGUgYWhlYWQgb2YgdGhp
cyBvbmUuCj4gK0NGTEFHUyArPSAtaW5jbHVkZSB4ZW4vY29uZmlnLmgKPiArCj4gIERFUFMgPSAu
Ki5kCj4gIAo+ICBpbmNsdWRlIE1ha2VmaWxlCj4gLS0tIGEveGVuL2FyY2gvYXJtL1J1bGVzLm1r
Cj4gKysrIGIveGVuL2FyY2gvYXJtL1J1bGVzLm1rCj4gQEAgLTYsOCArNiw2IEBACj4gICMgJ21h
a2UgY2xlYW4nIGJlZm9yZSByZWJ1aWxkaW5nLgo+ICAjCj4gIAo+IC1DRkxBR1MgKz0gLUkkKEJB
U0VESVIpL2luY2x1ZGUKPiAtCj4gICQoY2FsbCBjYy1vcHRpb25zLWFkZCxDRkxBR1MsQ0MsJChF
TUJFRERFRF9FWFRSQV9DRkxBR1MpKQo+ICAkKGNhbGwgY2Mtb3B0aW9uLWFkZCxDRkxBR1MsQ0Ms
LVduZXN0ZWQtZXh0ZXJucykKPiAgCj4gLS0tIGEveGVuL2FyY2gveDg2L01ha2VmaWxlCj4gKysr
IGIveGVuL2FyY2gveDg2L01ha2VmaWxlCj4gQEAgLTIyNCw3ICsyMjQsOCBAQCBlbmRpZgo+ICBl
ZmkvYm9vdC5pbml0Lm8gZWZpL3J1bnRpbWUubyBlZmkvY29tcGF0Lm8gZWZpL2J1aWxkaWQubyBl
ZmkvcmVsb2NzLWR1bW15Lm86ICQoQkFTRURJUikvYXJjaC94ODYvZWZpL2J1aWx0X2luLm8KPiAg
ZWZpL2Jvb3QuaW5pdC5vIGVmaS9ydW50aW1lLm8gZWZpL2NvbXBhdC5vIGVmaS9idWlsZGlkLm8g
ZWZpL3JlbG9jcy1kdW1teS5vOiA7Cj4gIAo+IC1hc20tb2Zmc2V0cy5zOiAkKFRBUkdFVF9TVUJB
UkNIKS9hc20tb2Zmc2V0cy5jICQoQkFTRURJUikvaW5jbHVkZS9hc20teDg2L2FzbS1tYWNyb3Mu
aAo+ICthc20tb2Zmc2V0cy5zOiAkKFRBUkdFVF9TVUJBUkNIKS9hc20tb2Zmc2V0cy5jICQoQkFT
RURJUikvaW5jbHVkZS9hc20teDg2L2FzbS1tYWNyb3MuaCBcCj4gKwkkKEJBU0VESVIpL2luY2x1
ZGUvZ2VuZXJhdGVkL2NvbmZpZy5oCj4gIAkkKENDKSAkKGZpbHRlci1vdXQgLVdhJChjb21tYSkl
IC1mbHRvLCQoQ0ZMQUdTKSkgLVMgLW8gJEAgJDwKPiAgCj4gIGFzbS1tYWNyb3MuaTogQ0ZMQUdT
ICs9IC1EX19BU1NFTUJMWV9fIC1QCj4gQEAgLTI0MCw2ICsyNDEsNDUgQEAgJChCQVNFRElSKS9p
bmNsdWRlL2FzbS14ODYvYXNtLW1hY3Jvcy5oOgo+ICAJZWNobyAnI2VuZGlmJyA+PiRALm5ldwo+
ICAJJChjYWxsIG1vdmUtaWYtY2hhbmdlZCwkQC5uZXcsJEApCj4gIAo+ICsjIFRoZXJlIGFyZSBt
dWx0aXBsZSBpbnZvY2F0aW9ucyBvZiB0aGlzIE1ha2VmaWxlLCBvbmUgZWFjaCBmb3IgYXNtLW9m
ZnNldC5zLAo+ICsjICQoVEFSR0VUKSwgYnVpbHRfaW4ubywgYW5kIHNldmVyYWwgbW9yZSBmcm9t
IHRoZSBydWxlcyBidWlsZGluZyAkKFRBUkdFVCkKPiArIyBhbmQgJChUQVJHRVQpLmVmaS4gVGhl
IDJuZCBhbmQgM3JkIG1heSByYWNlIHdpdGggb25lIGFub3RoZXIsIGFuZCB3ZSBkb24ndAo+ICsj
IHdhbnQgdG8gcmUtZ2VuZXJhdGUgY29uZmlnLmggaW4gdGhhdCBjYXNlIGFueXdheSwgc28gZ3Vh
cmQgdGhlIGxvZ2ljCj4gKyMgYWNjb3JkaW5nbHkuIChXZSBkbyB3YW50IHRvIGhhdmUgdGhlIEZP
UkNFIGRlcGVuZGVuY3kgb24gdGhlIHJ1bGUsIHRvIGJlCj4gKyMgc3VyZSB3ZSBwaWNrIHVwIGNo
YW5nZXMgd2hlbiB0aGUgY29tcGlsZXIgdXNlZCBoYXMgY2hhbmdlZC4pCj4gK2lmZXEgKCQoTUFL
RUNNREdPQUxTKSxhc20tb2Zmc2V0cy5zKQo+ICsKPiArYXMtSVNBLWxpc3QgOj0gQ0xXQiBFUFQg
RlNHU0JBU0UgSU5WUENJRCBSRFJBTkQgUkRTRUVEIFNTRTRfMiBWTVggWFNBVkVPUFQKPiArCj4g
K0NMV0ItaW5zbgk6PSBjbHdiICglcmF4KQo+ICtFUFQtaW5zbgk6PSBpbnZlcHQgKCVyYXgpLCVy
YXgKPiArRlNHU0JBU0UtaW5zbgk6PSByZGZzYmFzZSAlcmF4Cj4gK0lOVlBDSUQtaW5zbgk6PSBp
bnZwY2lkICglcmF4KSwlcmF4Cj4gK1JEUkFORC1pbnNuCTo9IHJkcmFuZCAlZWF4Cj4gK1JEU0VF
RC1pbnNuCTo9IHJkc2VlZCAlZWF4Cj4gK1NTRTRfMi1pbnNuCTo9IGNyYzMyICVlYXgsJWVheAo+
ICtWTVgtaW5zbgk6PSB2bWNhbGwKPiArWFNBVkVPUFQtaW5zbgk6PSB4c2F2ZW9wdCAoJXJheCkK
PiArCj4gK2FzLWZlYXR1cmVzLWxpc3QgOj0gJChhcy1JU0EtbGlzdCkgTkVHQVRJVkVfVFJVRSBO
T1BTX0RJUkVDVElWRQoKSSB0aGluayBpdCB3b3VsZCBiZSBjbGVhcmVyIHRvIHBsYWNlIHRoaXMg
YmVsb3cgdGhlIE5FR0FUSVZFX1RSVUUgYW5kCk5PUFNfRElSRUNUSVZFIGRlZmluaXRpb25zIGJl
bG93PyBTbyB0aGF0IGFsbCBGT08taW5zbiBhcmUgdG9nZXRoZXIuCgpUaGFua3MsIFJvZ2VyLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
