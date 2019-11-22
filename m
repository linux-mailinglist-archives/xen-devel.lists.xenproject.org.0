Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 515E7107927
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 21:03:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYF5a-0004SM-Fo; Fri, 22 Nov 2019 19:59:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h8i3=ZO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iYF5Y-0004SH-Td
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 19:59:32 +0000
X-Inumbo-ID: 99188f40-0d62-11ea-9631-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99188f40-0d62-11ea-9631-bc764e2007e4;
 Fri, 22 Nov 2019 19:59:32 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 257CD20704;
 Fri, 22 Nov 2019 19:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574452771;
 bh=CuVuqLAFq+91+XI1syQAK8SoTKh5EKVG19Bm0nXqz6E=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=g5MAeRzpM1Xl64PGuBdI0c+qk+7bFJiLqssQ7I8du3IF73Y42nBDy/LdXSuIGue2D
 Ng06Q1UnkbqaSEPSjRzpe9zHCgwTMQ+tbphRu2R24S0JPm3zNVoIlw6cZjZbwXMTP9
 C67z5KO+jMWiXW6eA80zDm60iXci0SqFVhxiaii0=
Date: Fri, 22 Nov 2019 11:59:29 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Pavel Tatashin <pasha.tatashin@soleen.com>
In-Reply-To: <20191122022406.590141-2-pasha.tatashin@soleen.com>
Message-ID: <alpine.DEB.2.21.1911221159160.11302@sstabellini-ThinkPad-T480s>
References: <20191122022406.590141-1-pasha.tatashin@soleen.com>
 <20191122022406.590141-2-pasha.tatashin@soleen.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 1/3] arm/arm64/xen: use C inlines for
 privcmd_call
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
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, stefan@agner.ch,
 linux@armlinux.org.uk, yamada.masahiro@socionext.com, will@kernel.org,
 boris.ostrovsky@oracle.com, sashal@kernel.org, sstabellini@kernel.org,
 jmorris@namei.org, linux-arm-kernel@lists.infradead.org,
 xen-devel@lists.xenproject.org, vladimir.murzin@arm.com, marc.zyngier@arm.com,
 alexios.zavras@intel.com, tglx@linutronix.de, allison@lohutok.net,
 jgross@suse.com, steve.capper@arm.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, james.morse@arm.com, info@metux.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyMSBOb3YgMjAxOSwgUGF2ZWwgVGF0YXNoaW4gd3JvdGU6Cj4gcHJpdmNtZF9jYWxs
IHJlcXVpcmVzIHRvIGVuYWJsZSBhY2Nlc3MgdG8gdXNlcnNwYWNlIGZvciB0aGUKPiBkdXJhdGlv
biBvZiB0aGUgaHlwZXJjYWxsLgo+IAo+IEN1cnJlbnRseSwgdGhpcyBpcyBkb25lIHZpYSBhc3Nl
bWJseSBtYWNyb3MuIENoYW5nZSBpdCB0byBDCj4gaW5saW5lcyBpbnN0ZWFkLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFBhdmVsIFRhdGFzaGluIDxwYXNoYS50YXRhc2hpbkBzb2xlZW4uY29tPgoKSSBh
bSBPSyB3aXRoIHRoaXMuCgpBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPgoKCj4gLS0tCj4gIGFyY2gvYXJtL2luY2x1ZGUvYXNtL2Fzc2VtYmxlci5o
ICAgICAgIHwgIDIgKy0KPiAgYXJjaC9hcm0vaW5jbHVkZS9hc20veGVuL2h5cGVyY2FsbC5oICAg
fCAxMCArKysrKysrKysKPiAgYXJjaC9hcm0veGVuL2VubGlnaHRlbi5jICAgICAgICAgICAgICAg
fCAgMiArLQo+ICBhcmNoL2FybS94ZW4vaHlwZXJjYWxsLlMgICAgICAgICAgICAgICB8ICA0ICsr
LS0KPiAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS94ZW4vaHlwZXJjYWxsLmggfCAyOCArKysrKysr
KysrKysrKysrKysrKysrKysrKwo+ICBhcmNoL2FybTY0L3hlbi9oeXBlcmNhbGwuUyAgICAgICAg
ICAgICB8IDE5ICsrLS0tLS0tLS0tLS0tLS0tCj4gIGluY2x1ZGUveGVuL2FybS9oeXBlcmNhbGwu
aCAgICAgICAgICAgIHwgMTIgKysrKystLS0tLS0KPiAgNyBmaWxlcyBjaGFuZ2VkLCA1MCBpbnNl
cnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vaW5j
bHVkZS9hc20vYXNzZW1ibGVyLmggYi9hcmNoL2FybS9pbmNsdWRlL2FzbS9hc3NlbWJsZXIuaAo+
IGluZGV4IDk5OTI5MTIyZGFkNy4uOGU5MjYyYTBmMDE2IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJt
L2luY2x1ZGUvYXNtL2Fzc2VtYmxlci5oCj4gKysrIGIvYXJjaC9hcm0vaW5jbHVkZS9hc20vYXNz
ZW1ibGVyLmgKPiBAQCAtNDgwLDcgKzQ4MCw3IEBAIFRIVU1CKAlvcnIJXHJlZyAsIFxyZWcgLCAj
UFNSX1RfQklUCSkKPiAgCS5tYWNybwl1YWNjZXNzX2Rpc2FibGUsIHRtcCwgaXNiPTEKPiAgI2lm
ZGVmIENPTkZJR19DUFVfU1dfRE9NQUlOX1BBTgo+ICAJLyoKPiAtCSAqIFdoZW5ldmVyIHdlIHJl
LWVudGVyIHVzZXJzcGFjZSwgdGhlIGRvbWFpbnMgc2hvdWxkIGFsd2F5cyBiZQo+ICsJICogV2hl
bmV2ZXIgd2UgcmUtZW50ZXIga2VybmVsLCB0aGUgZG9tYWlucyBzaG91bGQgYWx3YXlzIGJlCj4g
IAkgKiBzZXQgYXBwcm9wcmlhdGVseS4KPiAgCSAqLwo+ICAJbW92CVx0bXAsICNEQUNSX1VBQ0NF
U1NfRElTQUJMRQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9pbmNsdWRlL2FzbS94ZW4vaHlwZXJj
YWxsLmggYi9hcmNoL2FybS9pbmNsdWRlL2FzbS94ZW4vaHlwZXJjYWxsLmgKPiBpbmRleCAzNTIy
Y2JhZWQzMTYuLmNhYzViZDllZjUxOSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9pbmNsdWRlL2Fz
bS94ZW4vaHlwZXJjYWxsLmgKPiArKysgYi9hcmNoL2FybS9pbmNsdWRlL2FzbS94ZW4vaHlwZXJj
YWxsLmgKPiBAQCAtMSArMSwxMSBAQAo+ICsjaWZuZGVmIF9BU01fQVJNX1hFTl9IWVBFUkNBTExf
SAo+ICsjZGVmaW5lIF9BU01fQVJNX1hFTl9IWVBFUkNBTExfSAo+ICAjaW5jbHVkZSA8eGVuL2Fy
bS9oeXBlcmNhbGwuaD4KPiArCj4gK3N0YXRpYyBpbmxpbmUgbG9uZyBwcml2Y21kX2NhbGwodW5z
aWduZWQgaW50IGNhbGwsIHVuc2lnbmVkIGxvbmcgYTEsCj4gKwkJCQl1bnNpZ25lZCBsb25nIGEy
LCB1bnNpZ25lZCBsb25nIGEzLAo+ICsJCQkJdW5zaWduZWQgbG9uZyBhNCwgdW5zaWduZWQgbG9u
ZyBhNSkKPiArewo+ICsJcmV0dXJuIGFyY2hfcHJpdmNtZF9jYWxsKGNhbGwsIGExLCBhMiwgYTMs
IGE0LCBhNSk7Cj4gK30KPiArI2VuZGlmIC8qIF9BU01fQVJNX1hFTl9IWVBFUkNBTExfSCAqLwo+
IGRpZmYgLS1naXQgYS9hcmNoL2FybS94ZW4vZW5saWdodGVuLmMgYi9hcmNoL2FybS94ZW4vZW5s
aWdodGVuLmMKPiBpbmRleCBkZDY4MDRhNjRmMWEuLmU4NzI4MGM2ZDI1ZCAxMDA2NDQKPiAtLS0g
YS9hcmNoL2FybS94ZW4vZW5saWdodGVuLmMKPiArKysgYi9hcmNoL2FybS94ZW4vZW5saWdodGVu
LmMKPiBAQCAtNDQwLDQgKzQ0MCw0IEBAIEVYUE9SVF9TWU1CT0xfR1BMKEhZUEVSVklTT1JfcGxh
dGZvcm1fb3BfcmF3KTsKPiAgRVhQT1JUX1NZTUJPTF9HUEwoSFlQRVJWSVNPUl9tdWx0aWNhbGwp
Owo+ICBFWFBPUlRfU1lNQk9MX0dQTChIWVBFUlZJU09SX3ZtX2Fzc2lzdCk7Cj4gIEVYUE9SVF9T
WU1CT0xfR1BMKEhZUEVSVklTT1JfZG1fb3ApOwo+IC1FWFBPUlRfU1lNQk9MX0dQTChwcml2Y21k
X2NhbGwpOwo+ICtFWFBPUlRfU1lNQk9MX0dQTChhcmNoX3ByaXZjbWRfY2FsbCk7Cj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL3hlbi9oeXBlcmNhbGwuUyBiL2FyY2gvYXJtL3hlbi9oeXBlcmNhbGwu
Uwo+IGluZGV4IGIxMWJiYTU0MmZhYy4uMjc3MDc4YzdkYTQ5IDEwMDY0NAo+IC0tLSBhL2FyY2gv
YXJtL3hlbi9oeXBlcmNhbGwuUwo+ICsrKyBiL2FyY2gvYXJtL3hlbi9oeXBlcmNhbGwuUwo+IEBA
IC05NCw3ICs5NCw3IEBAIEhZUEVSQ0FMTDIobXVsdGljYWxsKTsKPiAgSFlQRVJDQUxMMih2bV9h
c3Npc3QpOwo+ICBIWVBFUkNBTEwzKGRtX29wKTsKPiAgCj4gLUVOVFJZKHByaXZjbWRfY2FsbCkK
PiArRU5UUlkoYXJjaF9wcml2Y21kX2NhbGwpCj4gIAlzdG1kYiBzcCEsIHtyNH0KPiAgCW1vdiBy
MTIsIHIwCj4gIAltb3YgcjAsIHIxCj4gQEAgLTExOSw0ICsxMTksNCBAQCBFTlRSWShwcml2Y21k
X2NhbGwpCj4gIAo+ICAJbGRtIHNwISwge3I0fQo+ICAJcmV0IGxyCj4gLUVORFBST0MocHJpdmNt
ZF9jYWxsKTsKPiArRU5EUFJPQyhhcmNoX3ByaXZjbWRfY2FsbCk7Cj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvaW5jbHVkZS9hc20veGVuL2h5cGVyY2FsbC5oIGIvYXJjaC9hcm02NC9pbmNsdWRl
L2FzbS94ZW4vaHlwZXJjYWxsLmgKPiBpbmRleCAzNTIyY2JhZWQzMTYuLjFhNzRmYjI4NjA3ZiAx
MDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3hlbi9oeXBlcmNhbGwuaAo+ICsr
KyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20veGVuL2h5cGVyY2FsbC5oCj4gQEAgLTEgKzEsMjkg
QEAKPiArI2lmbmRlZiBfQVNNX0FSTTY0X1hFTl9IWVBFUkNBTExfSAo+ICsjZGVmaW5lIF9BU01f
QVJNNjRfWEVOX0hZUEVSQ0FMTF9ICj4gICNpbmNsdWRlIDx4ZW4vYXJtL2h5cGVyY2FsbC5oPgo+
ICsjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgo+ICsKPiArc3RhdGljIGlubGluZSBsb25nIHBy
aXZjbWRfY2FsbCh1bnNpZ25lZCBpbnQgY2FsbCwgdW5zaWduZWQgbG9uZyBhMSwKPiArCQkJCXVu
c2lnbmVkIGxvbmcgYTIsIHVuc2lnbmVkIGxvbmcgYTMsCj4gKwkJCQl1bnNpZ25lZCBsb25nIGE0
LCB1bnNpZ25lZCBsb25nIGE1KQo+ICt7Cj4gKwlsb25nIHJ2Owo+ICsKPiArCS8qCj4gKwkgKiBQ
cml2Y21kIGNhbGxzIGFyZSBpc3N1ZWQgYnkgdGhlIHVzZXJzcGFjZS4gVGhlIGtlcm5lbCBuZWVk
cyB0bwo+ICsJICogZW5hYmxlIGFjY2VzcyB0byBUVEJSMF9FTDEgYXMgdGhlIGh5cGVydmlzb3Ig
d291bGQgaXNzdWUgc3RhZ2UgMQo+ICsJICogdHJhbnNsYXRpb25zIHRvIHVzZXIgbWVtb3J5IHZp
YSBBVCBpbnN0cnVjdGlvbnMuIFNpbmNlIEFUCj4gKwkgKiBpbnN0cnVjdGlvbnMgYXJlIG5vdCBh
ZmZlY3RlZCBieSB0aGUgUEFOIGJpdCAoQVJNdjguMSksIHdlIG9ubHkKPiArCSAqIG5lZWQgdGhl
IGV4cGxpY2l0IHVhY2Nlc3NfZW5hYmxlL2Rpc2FibGUgaWYgdGhlIFRUQlIwIFBBTiBlbXVsYXRp
b24KPiArCSAqIGlzIGVuYWJsZWQgKGl0IGltcGxpZXMgdGhhdCBoYXJkd2FyZSBVQU8gYW5kIFBB
TiBkaXNhYmxlZCkuCj4gKwkgKi8KPiArCXVhY2Nlc3NfdHRicjBfZW5hYmxlKCk7Cj4gKwlydiA9
IGFyY2hfcHJpdmNtZF9jYWxsKGNhbGwsIGExLCBhMiwgYTMsIGE0LCBhNSk7Cj4gKwkvKgo+ICsJ
ICogRGlzYWJsZSB1c2Vyc3BhY2UgYWNjZXNzIGZyb20ga2VybmVsIG9uY2UgdGhlIGh5cCBjYWxs
IGNvbXBsZXRlZC4KPiArCSAqLwo+ICsJdWFjY2Vzc190dGJyMF9kaXNhYmxlKCk7Cj4gKwo+ICsJ
cmV0dXJuIHJ2Owo+ICt9Cj4gKyNlbmRpZiAvKiBfQVNNX0FSTTY0X1hFTl9IWVBFUkNBTExfSCAq
Lwo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L3hlbi9oeXBlcmNhbGwuUyBiL2FyY2gvYXJtNjQv
eGVuL2h5cGVyY2FsbC5TCj4gaW5kZXggYzVmMDVjNGE0ZDAwLi45MjE2MTE3NzhkMmEgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9hcm02NC94ZW4vaHlwZXJjYWxsLlMKPiArKysgYi9hcmNoL2FybTY0L3hl
bi9oeXBlcmNhbGwuUwo+IEBAIC00OSw3ICs0OSw2IEBACj4gIAo+ICAjaW5jbHVkZSA8bGludXgv
bGlua2FnZS5oPgo+ICAjaW5jbHVkZSA8YXNtL2Fzc2VtYmxlci5oPgo+IC0jaW5jbHVkZSA8YXNt
L2FzbS11YWNjZXNzLmg+Cj4gICNpbmNsdWRlIDx4ZW4vaW50ZXJmYWNlL3hlbi5oPgo+ICAKPiAg
Cj4gQEAgLTg2LDI3ICs4NSwxMyBAQCBIWVBFUkNBTEwyKG11bHRpY2FsbCk7Cj4gIEhZUEVSQ0FM
TDIodm1fYXNzaXN0KTsKPiAgSFlQRVJDQUxMMyhkbV9vcCk7Cj4gIAo+IC1FTlRSWShwcml2Y21k
X2NhbGwpCj4gK0VOVFJZKGFyY2hfcHJpdmNtZF9jYWxsKQo+ICAJbW92IHgxNiwgeDAKPiAgCW1v
diB4MCwgeDEKPiAgCW1vdiB4MSwgeDIKPiAgCW1vdiB4MiwgeDMKPiAgCW1vdiB4MywgeDQKPiAg
CW1vdiB4NCwgeDUKPiAtCS8qCj4gLQkgKiBQcml2Y21kIGNhbGxzIGFyZSBpc3N1ZWQgYnkgdGhl
IHVzZXJzcGFjZS4gVGhlIGtlcm5lbCBuZWVkcyB0bwo+IC0JICogZW5hYmxlIGFjY2VzcyB0byBU
VEJSMF9FTDEgYXMgdGhlIGh5cGVydmlzb3Igd291bGQgaXNzdWUgc3RhZ2UgMQo+IC0JICogdHJh
bnNsYXRpb25zIHRvIHVzZXIgbWVtb3J5IHZpYSBBVCBpbnN0cnVjdGlvbnMuIFNpbmNlIEFUCj4g
LQkgKiBpbnN0cnVjdGlvbnMgYXJlIG5vdCBhZmZlY3RlZCBieSB0aGUgUEFOIGJpdCAoQVJNdjgu
MSksIHdlIG9ubHkKPiAtCSAqIG5lZWQgdGhlIGV4cGxpY2l0IHVhY2Nlc3NfZW5hYmxlL2Rpc2Fi
bGUgaWYgdGhlIFRUQlIwIFBBTiBlbXVsYXRpb24KPiAtCSAqIGlzIGVuYWJsZWQgKGl0IGltcGxp
ZXMgdGhhdCBoYXJkd2FyZSBVQU8gYW5kIFBBTiBkaXNhYmxlZCkuCj4gLQkgKi8KPiAtCXVhY2Nl
c3NfdHRicjBfZW5hYmxlIHg2LCB4NywgeDgKPiAgCWh2YyBYRU5fSU1NCj4gLQo+IC0JLyoKPiAt
CSAqIERpc2FibGUgdXNlcnNwYWNlIGFjY2VzcyBmcm9tIGtlcm5lbCBvbmNlIHRoZSBoeXAgY2Fs
bCBjb21wbGV0ZWQuCj4gLQkgKi8KPiAtCXVhY2Nlc3NfdHRicjBfZGlzYWJsZSB4NiwgeDcKPiAg
CXJldAo+IC1FTkRQUk9DKHByaXZjbWRfY2FsbCk7Cj4gK0VORFBST0MoYXJjaF9wcml2Y21kX2Nh
bGwpOwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3hlbi9hcm0vaHlwZXJjYWxsLmggYi9pbmNsdWRl
L3hlbi9hcm0vaHlwZXJjYWxsLmgKPiBpbmRleCBiNDA0ODVlNTRkODAuLjYyNGM4YWQ3ZTQyYSAx
MDA2NDQKPiAtLS0gYS9pbmNsdWRlL3hlbi9hcm0vaHlwZXJjYWxsLmgKPiArKysgYi9pbmNsdWRl
L3hlbi9hcm0vaHlwZXJjYWxsLmgKPiBAQCAtMzAsOCArMzAsOCBAQAo+ICAgKiBJTiBUSEUgU09G
VFdBUkUuCj4gICAqLwo+ICAKPiAtI2lmbmRlZiBfQVNNX0FSTV9YRU5fSFlQRVJDQUxMX0gKPiAt
I2RlZmluZSBfQVNNX0FSTV9YRU5fSFlQRVJDQUxMX0gKPiArI2lmbmRlZiBfQVJNX1hFTl9IWVBF
UkNBTExfSAo+ICsjZGVmaW5lIF9BUk1fWEVOX0hZUEVSQ0FMTF9ICj4gIAo+ICAjaW5jbHVkZSA8
bGludXgvYnVnLmg+Cj4gIAo+IEBAIC00MSw5ICs0MSw5IEBACj4gIAo+ICBzdHJ1Y3QgeGVuX2Rt
X29wX2J1ZjsKPiAgCj4gLWxvbmcgcHJpdmNtZF9jYWxsKHVuc2lnbmVkIGNhbGwsIHVuc2lnbmVk
IGxvbmcgYTEsCj4gLQkJdW5zaWduZWQgbG9uZyBhMiwgdW5zaWduZWQgbG9uZyBhMywKPiAtCQl1
bnNpZ25lZCBsb25nIGE0LCB1bnNpZ25lZCBsb25nIGE1KTsKPiArbG9uZyBhcmNoX3ByaXZjbWRf
Y2FsbCh1bnNpZ25lZCBpbnQgY2FsbCwgdW5zaWduZWQgbG9uZyBhMSwKPiArCQkgICAgICAgdW5z
aWduZWQgbG9uZyBhMiwgdW5zaWduZWQgbG9uZyBhMywKPiArCQkgICAgICAgdW5zaWduZWQgbG9u
ZyBhNCwgdW5zaWduZWQgbG9uZyBhNSk7Cj4gIGludCBIWVBFUlZJU09SX3hlbl92ZXJzaW9uKGlu
dCBjbWQsIHZvaWQgKmFyZyk7Cj4gIGludCBIWVBFUlZJU09SX2NvbnNvbGVfaW8oaW50IGNtZCwg
aW50IGNvdW50LCBjaGFyICpzdHIpOwo+ICBpbnQgSFlQRVJWSVNPUl9ncmFudF90YWJsZV9vcCh1
bnNpZ25lZCBpbnQgY21kLCB2b2lkICp1b3AsIHVuc2lnbmVkIGludCBjb3VudCk7Cj4gQEAgLTg4
LDQgKzg4LDQgQEAgTVVMVElfbW11X3VwZGF0ZShzdHJ1Y3QgbXVsdGljYWxsX2VudHJ5ICptY2ws
IHN0cnVjdCBtbXVfdXBkYXRlICpyZXEsCj4gIAlCVUcoKTsKPiAgfQo+ICAKPiAtI2VuZGlmIC8q
IF9BU01fQVJNX1hFTl9IWVBFUkNBTExfSCAqLwo+ICsjZW5kaWYgLyogX0FSTV9YRU5fSFlQRVJD
QUxMX0ggKi8KPiAtLSAKPiAyLjI0LjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
