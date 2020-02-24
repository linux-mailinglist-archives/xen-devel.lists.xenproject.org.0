Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B05216A4F7
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 12:34:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6Bxh-0001Mi-7d; Mon, 24 Feb 2020 11:31:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04fq=4M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6Bxg-0001MZ-3E
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 11:31:44 +0000
X-Inumbo-ID: 3b24972c-56f9-11ea-b0fd-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b24972c-56f9-11ea-b0fd-bc764e2007e4;
 Mon, 24 Feb 2020 11:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582543903;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pt1pnWSo9R14zw3GxtniKwFeisaOxCkdolPqPDbyd18=;
 b=I0yjDCpqo6xBUxOt3X8TYgdmyImSMPLnYjR8h8dcCYyD3PPMehCRquZx
 M2l6DDNmtkKkmueHXtrAr5rIRGNywx37kIguaFhNc54u+iGf2EEkNTen1
 zcAQH8I588aEHwgPwgd9D+ILCRdraoYoWWcKRQkyRwoxE5s2unwX79u32 w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ek5zILJPP4X67zOL6/JU7eI6IQXKln7pYc8hNJM3s8inu7qARi+4oQE0JvdYrQqD40du3eUchy
 rWSn0hF4v1NeTyf2mw/73s7y8HHXDFrFbqYFWG8029Pd4Y7lmf/raS0yuabv2zaNj/CxAAA1YZ
 D89Mu9LhQdYGCy1b0nY6zyTpp//V0GB8R4vBKk3Ccp2KCtpj1WYKWsYmLAxwV2xM05tKWSIogW
 z40cU0MS4VuZlDOIwtK//FRjnFQMjawOdnW+Gn/NryEKR27oUVhJ0/MndoOjYqiP7+XcOuHsRl
 nL8=
X-SBRS: 2.7
X-MesageID: 13526057
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,480,1574139600"; d="scan'208";a="13526057"
Date: Mon, 24 Feb 2020 12:31:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20200224113135.GM4679@Air-de-Roger>
References: <20200218122114.17596-1-jgross@suse.com>
 <20200218122114.17596-5-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218122114.17596-5-jgross@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 4/4] xen/rcu: add assertions to debug
 build
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMTgsIDIwMjAgYXQgMDE6MjE6MTRQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBYZW4ncyBSQ1UgaW1wbGVtZW50YXRpb24gcmVsaWVzIG9uIG5vIHNvZnRpcnEgaGFu
ZGxpbmcgdGFraW5nIHBsYWNlCj4gd2hpbGUgYmVpbmcgaW4gYSBSQ1UgY3JpdGljYWwgc2VjdGlv
bi4gQWRkIEFTU0VSVCgpcyBpbiBkZWJ1ZyBidWlsZHMKPiBpbiBvcmRlciB0byBjYXRjaCBhbnkg
dmlvbGF0aW9ucy4KPiAKPiBGb3IgdGhhdCBwdXJwb3NlIG1vZGlmeSByY3VfcmVhZF9bdW5dbG9j
aygpIHRvIHVzZSBhIGRlZGljYXRlZCBwZXJjcHUKPiBjb3VudGVyIGluc3RlYWQgb2YgcHJlZW1w
dF9bZW58ZGlzXWFibGUoKSBhcyB0aGlzIGVuYWJsZXMgdG8gdGVzdAo+IHRoYXQgY29uZGl0aW9u
IGluIF9fZG9fc29mdGlycSgpIChBU1NFUlRfTk9UX0lOX0FUT01JQygpIGlzIG5vdAo+IHVzYWJs
ZSB0aGVyZSBkdWUgdG8gX19jcHVfdXAoKSBjYWxsaW5nIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJx
cygpCj4gd2hpbGUgaG9sZGluZyB0aGUgY3B1IGhvdHBsdWcgbG9jaykuCj4gCj4gRHJvcHBpbmcg
dGhlIG5vdyBubyBsb25nZXIgbmVlZGVkICNpbmNsdWRlIG9mIHByZWVtcHQuaCBpbiByY3VwZGF0
ZS5oCj4gcmVxdWlyZXMgYWRkaW5nIGl0IGluIHNvbWUgc291cmNlcy4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gLS0tCj4gIHhlbi9jb21tb24v
bXVsdGljYWxsLmMgICAgIHwgIDEgKwo+ICB4ZW4vY29tbW9uL3JjdXBkYXRlLmMgICAgICB8ICA0
ICsrKysKPiAgeGVuL2NvbW1vbi9zb2Z0aXJxLmMgICAgICAgfCAgMiArKwo+ICB4ZW4vY29tbW9u
L3dhaXQuYyAgICAgICAgICB8ICAxICsKPiAgeGVuL2luY2x1ZGUveGVuL3JjdXBkYXRlLmggfCAy
MSArKysrKysrKysrKysrKysrKy0tLS0KPiAgNSBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL211bHRpY2Fs
bC5jIGIveGVuL2NvbW1vbi9tdWx0aWNhbGwuYwo+IGluZGV4IDVhMTk5ZWJmOGYuLjY3ZjFhMjM0
ODUgMTAwNjQ0Cj4gLS0tIGEveGVuL2NvbW1vbi9tdWx0aWNhbGwuYwo+ICsrKyBiL3hlbi9jb21t
b24vbXVsdGljYWxsLmMKPiBAQCAtMTAsNiArMTAsNyBAQAo+ICAjaW5jbHVkZSA8eGVuL211bHRp
Y2FsbC5oPgo+ICAjaW5jbHVkZSA8eGVuL2d1ZXN0X2FjY2Vzcy5oPgo+ICAjaW5jbHVkZSA8eGVu
L3BlcmZjLmg+Cj4gKyNpbmNsdWRlIDx4ZW4vcHJlZW1wdC5oPgo+ICAjaW5jbHVkZSA8eGVuL3Ry
YWNlLmg+Cj4gICNpbmNsdWRlIDxhc20vY3VycmVudC5oPgo+ICAjaW5jbHVkZSA8YXNtL2hhcmRp
cnEuaD4KPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9yY3VwZGF0ZS5jIGIveGVuL2NvbW1vbi9y
Y3VwZGF0ZS5jCj4gaW5kZXggZTZhZGQwYjEyMC4uYjAzZjRiNDRkOSAxMDA2NDQKPiAtLS0gYS94
ZW4vY29tbW9uL3JjdXBkYXRlLmMKPiArKysgYi94ZW4vY29tbW9uL3JjdXBkYXRlLmMKPiBAQCAt
NDYsNiArNDYsMTAgQEAKPiAgI2luY2x1ZGUgPHhlbi9jcHUuaD4KPiAgI2luY2x1ZGUgPHhlbi9z
dG9wX21hY2hpbmUuaD4KPiAgCj4gKyNpZm5kZWYgTkRFQlVHCj4gK0RFRklORV9QRVJfQ1BVKHVu
c2lnbmVkIGludCwgcmN1X2xvY2tfY250KTsKPiArI2VuZGlmCj4gKwo+ICAvKiBHbG9iYWwgY29u
dHJvbCB2YXJpYWJsZXMgZm9yIHJjdXBkYXRlIGNhbGxiYWNrIG1lY2hhbmlzbS4gKi8KPiAgc3Rh
dGljIHN0cnVjdCByY3VfY3RybGJsayB7Cj4gICAgICBsb25nIGN1cjsgICAgICAgICAgIC8qIEN1
cnJlbnQgYmF0Y2ggbnVtYmVyLiAgICAgICAgICAgICAgICAgICAgICAqLwo+IGRpZmYgLS1naXQg
YS94ZW4vY29tbW9uL3NvZnRpcnEuYyBiL3hlbi9jb21tb24vc29mdGlycS5jCj4gaW5kZXggM2Zl
NzVjYTNlOC4uMThiZThkYjBjNiAxMDA2NDQKPiAtLS0gYS94ZW4vY29tbW9uL3NvZnRpcnEuYwo+
ICsrKyBiL3hlbi9jb21tb24vc29mdGlycS5jCj4gQEAgLTMwLDYgKzMwLDggQEAgc3RhdGljIHZv
aWQgX19kb19zb2Z0aXJxKHVuc2lnbmVkIGxvbmcgaWdub3JlX21hc2ssIGJvb2wgcmN1X2FsbG93
ZWQpCj4gICAgICB1bnNpZ25lZCBpbnQgaSwgY3B1Owo+ICAgICAgdW5zaWduZWQgbG9uZyBwZW5k
aW5nOwo+ICAKPiArICAgIEFTU0VSVCghcmN1X2FsbG93ZWQgfHwgcmN1X3F1aWVzY2VfYWxsb3dl
ZCgpKTsKPiArCj4gICAgICBmb3IgKCA7IDsgKQo+ICAgICAgewo+ICAgICAgICAgIC8qCj4gZGlm
ZiAtLWdpdCBhL3hlbi9jb21tb24vd2FpdC5jIGIveGVuL2NvbW1vbi93YWl0LmMKPiBpbmRleCAy
NDcxNmU3Njc2Li45Y2RiMTc0MDM2IDEwMDY0NAo+IC0tLSBhL3hlbi9jb21tb24vd2FpdC5jCj4g
KysrIGIveGVuL2NvbW1vbi93YWl0LmMKPiBAQCAtMTksNiArMTksNyBAQAo+ICAgKiBhbG9uZyB3
aXRoIHRoaXMgcHJvZ3JhbTsgSWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNl
cy8+Lgo+ICAgKi8KPiAgCj4gKyNpbmNsdWRlIDx4ZW4vcHJlZW1wdC5oPgo+ICAjaW5jbHVkZSA8
eGVuL3NjaGVkLmg+Cj4gICNpbmNsdWRlIDx4ZW4vc29mdGlycS5oPgo+ICAjaW5jbHVkZSA8eGVu
L3dhaXQuaD4KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3JjdXBkYXRlLmggYi94ZW4v
aW5jbHVkZS94ZW4vcmN1cGRhdGUuaAo+IGluZGV4IDg3ZjM1Yjc3MDQuLmE1ZWU3ZmVjMmIgMTAw
NjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3JjdXBkYXRlLmgKPiArKysgYi94ZW4vaW5jbHVk
ZS94ZW4vcmN1cGRhdGUuaAo+IEBAIC0zNCwxMCArMzQsMjMgQEAKPiAgI2luY2x1ZGUgPHhlbi9j
YWNoZS5oPgo+ICAjaW5jbHVkZSA8eGVuL3NwaW5sb2NrLmg+Cj4gICNpbmNsdWRlIDx4ZW4vY3B1
bWFzay5oPgo+IC0jaW5jbHVkZSA8eGVuL3ByZWVtcHQuaD4KPiArI2luY2x1ZGUgPHhlbi9wZXJj
cHUuaD4KPiAgCj4gICNkZWZpbmUgX19yY3UKPiAgCj4gKyNpZm5kZWYgTkRFQlVHCj4gK0RFQ0xB
UkVfUEVSX0NQVSh1bnNpZ25lZCBpbnQsIHJjdV9sb2NrX2NudCk7Cj4gKwo+ICsjZGVmaW5lIHJj
dV9xdWllc2NlX2Rpc2FibGUoKSAodGhpc19jcHUocmN1X2xvY2tfY250KSkrKwo+ICsjZGVmaW5l
IHJjdV9xdWllc2NlX2VuYWJsZSgpICAodGhpc19jcHUocmN1X2xvY2tfY250KSktLQoKSSB0aGlu
ayB5b3UgbmVlZCBhIGJhcnJpZXIgaGVyZSBsaWtlIGl0J3MgY3VycmVudGx5IHVzZWQgaW4KcHJl
ZW1wdF97ZW5hYmxlZC9kaXNhYmxlfSwgb3IgdXNlIGFyY2hfbG9ja197YWNxdWlyZS9yZWxlYXNl
fV9iYXJyaWVyCndoaWNoIHdvdWxkIGJlIGJldHRlciBJTU8uCgo+ICsjZGVmaW5lIHJjdV9xdWll
c2NlX2FsbG93ZWQoKSAoIXRoaXNfY3B1KHJjdV9sb2NrX2NudCkpCgpBU1NFUlRfTk9UX0lOX0FU
T01JQyBzaG91bGQgYmUgZXhwYW5kZWQgdG8gYWxzbyBhc3NlcnQKIXRoaXNfY3B1KHJjdV9sb2Nr
X2NudCksIG9yIGVsc2UgbWlzc2luZyBwYWlycyBvZgpyY3VfcmVhZF97bG9jay91bmxvY2t9IHdv
dWxkIGJlIHVuZGV0ZWN0ZWQuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
