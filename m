Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 254595FD5B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 21:15:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj7AF-0007Un-Dv; Thu, 04 Jul 2019 19:13:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E3Ia=VB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hj7AD-0007UY-D0
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 19:13:01 +0000
X-Inumbo-ID: bccf7d94-9e8f-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bccf7d94-9e8f-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 19:12:59 +0000 (UTC)
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
IronPort-SDR: M/HuL6fxQLfbuz7KH+2BH+zGkwdHb3BGMljhUkNsSzu5/sEFOTYmjdURsbjAiDwVSrloJotbg2
 hO8wUek6V71lil8DJ/i71MgfpbGHKGCKbvT9xTe3oniU3+vXeaWDdPjB2M/Flzw4XiIkiXxx0C
 dUlbY4BvkKFNS7GxUUHkPV0hwHlwc4noKcVyWOQURzIFcwlvtqn3qHK7lxuEP6bJxK95dmxi2v
 uuz6SDjV/glvt2lCEI+S3nOczEMNlIT4gzD7OA7vtH/KtsBDodeI2vJgzAUu6R+75IqjpUw8Jo
 G+U=
X-SBRS: 2.7
X-MesageID: 2629112
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2629112"
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <1561109798-8744-1-git-send-email-andrew.cooper3@citrix.com>
 <1561109798-8744-4-git-send-email-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <8271f24d-5319-9bd9-7fc8-6cbb878d4c37@citrix.com>
Date: Thu, 4 Jul 2019 20:12:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1561109798-8744-4-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: [Xen-devel] Ping: [PATCH 3/5] arm/gnttab: Implement stub helpers as
 static inlines
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEvMDYvMjAxOSAxMDozNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBJdCBpcyBpbmVmZmlj
aWVudCB0byBjYWxsIGludG8gYSBkaWZmZXJlbnQgdHJhbnNsYXRpb24gdW5pdCBmb3IgYSBzdHVi
Cj4gZnVuY3Rpb24sIHdoZW4gYSBzdGF0aWMgaW5saW5lIHdpbGwgd29yayBmaW5lLiAgUmVwbGFj
ZSBhbiBvcGVuLWNvZGVkCj4gcHJpbnRrX29uY2UoKSB3aGlsZSBtb3ZpbmcgaXQuCj4KPiBObyBm
dW5jdGlvbmFsIGNoYW5nZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gLS0tCj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gvYXJtL21tLmMgICAgICAgICAgICAgICAgIHwgMTYgLS0t
LS0tLS0tLS0tLS0tLQo+ICB4ZW4vaW5jbHVkZS9hc20tYXJtL2dyYW50X3RhYmxlLmggfCAxNyAr
KysrKysrKysrKysrKystLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDE4
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbS5jIGIveGVuL2Fy
Y2gvYXJtL21tLmMKPiBpbmRleCAzNWRjMWY3Li40NDI1OGFkIDEwMDY0NAo+IC0tLSBhL3hlbi9h
cmNoL2FybS9tbS5jCj4gKysrIGIveGVuL2FyY2gvYXJtL21tLmMKPiBAQCAtNDEsNyArNDEsNiBA
QAo+ICAjaW5jbHVkZSA8eGVuL3NpemVzLmg+Cj4gICNpbmNsdWRlIDx4ZW4vbGliZmR0L2xpYmZk
dC5oPgo+ICAKPiAtI2luY2x1ZGUgPGFzbS9ndWVzdF9hdG9taWNzLmg+Cj4gICNpbmNsdWRlIDxh
c20vc2V0dXAuaD4KPiAgCj4gIC8qIE92ZXJyaWRlIG1hY3JvcyBmcm9tIGFzbS9wYWdlLmggdG8g
bWFrZSB0aGVtIHdvcmsgd2l0aCBtZm5fdCAqLwo+IEBAIC0xNTMyLDIxICsxNTMxLDYgQEAgdm9p
ZCBwdXRfcGFnZV90eXBlKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpCj4gICAgICByZXR1cm47Cj4g
IH0KPiAgCj4gLXZvaWQgZ250dGFiX2NsZWFyX2ZsYWcoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWdu
ZWQgbG9uZyBuciwgdWludDE2X3QgKmFkZHIpCj4gLXsKPiAtICAgIGd1ZXN0X2NsZWFyX21hc2sx
NihkLCBCSVQobnIsIFVMKSwgYWRkcik7Cj4gLX0KPiAtCj4gLXZvaWQgZ250dGFiX21hcmtfZGly
dHkoc3RydWN0IGRvbWFpbiAqZCwgbWZuX3QgbWZuKQo+IC17Cj4gLSAgICAvKiBYWFg6IG1hcmsg
ZGlydHkgKi8KPiAtICAgIHN0YXRpYyBpbnQgd2FybmluZzsKPiAtICAgIGlmICghd2FybmluZykg
ewo+IC0gICAgICAgIGdkcHJpbnRrKFhFTkxPR19XQVJOSU5HLCAiZ250dGFiX21hcmtfZGlydHkg
bm90IGltcGxlbWVudGVkIHlldFxuIik7Cj4gLSAgICAgICAgd2FybmluZyA9IDE7Cj4gLSAgICB9
Cj4gLX0KPiAtCj4gIGludCBjcmVhdGVfZ3JhbnRfaG9zdF9tYXBwaW5nKHVuc2lnbmVkIGxvbmcg
YWRkciwgbWZuX3QgZnJhbWUsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGludCBmbGFncywgdW5zaWduZWQgaW50IGNhY2hlX2ZsYWdzKQo+ICB7Cj4gZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ3JhbnRfdGFibGUuaCBiL3hlbi9pbmNsdWRlL2FzbS1h
cm0vZ3JhbnRfdGFibGUuaAo+IGluZGV4IDFlZDBhZWYuLmIwZDY3M2IgMTAwNjQ0Cj4gLS0tIGEv
eGVuL2luY2x1ZGUvYXNtLWFybS9ncmFudF90YWJsZS5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNt
LWFybS9ncmFudF90YWJsZS5oCj4gQEAgLTYsNiArNiw4IEBACj4gICNpbmNsdWRlIDx4ZW4vcGZu
Lmg+Cj4gICNpbmNsdWRlIDx4ZW4vc2NoZWQuaD4KPiAgCj4gKyNpbmNsdWRlIDxhc20vZ3Vlc3Rf
YXRvbWljcy5oPgo+ICsKPiAgI2RlZmluZSBJTklUSUFMX05SX0dSQU5UX0ZSQU1FUyAxVQo+ICAj
ZGVmaW5lIEdOVFRBQl9NQVhfVkVSU0lPTiAxCj4gIAo+IEBAIC0xNCwxMyArMTYsMjQgQEAgc3Ry
dWN0IGdyYW50X3RhYmxlX2FyY2ggewo+ICAgICAgZ2ZuX3QgKnN0YXR1c19nZm47Cj4gIH07Cj4g
IAo+IC12b2lkIGdudHRhYl9jbGVhcl9mbGFnKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGxv
bmcgbnIsIHVpbnQxNl90ICphZGRyKTsKPiArc3RhdGljIGlubGluZSB2b2lkIGdudHRhYl9jbGVh
cl9mbGFnKHN0cnVjdCBkb21haW4gKmQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBsb25nIG5yLCB1aW50MTZfdCAqYWRkcikKPiArewo+ICsgICAgZ3Vl
c3RfY2xlYXJfbWFzazE2KGQsIEJJVChuciwgVUwpLCBhZGRyKTsKPiArfQo+ICsKPiArc3RhdGlj
IGlubGluZSB2b2lkIGdudHRhYl9tYXJrX2RpcnR5KHN0cnVjdCBkb21haW4gKmQsIG1mbl90IG1m
bikKPiArewo+ICsjaWZuZGVmIE5ERUJVRwo+ICsgICAgcHJpbnRrX29uY2UoWEVOTE9HX0dfV0FS
TklORyAiZ250dGFiX21hcmtfZGlydHkgbm90IGltcGxlbWVudGVkIHlldFxuIik7Cj4gKyNlbmRp
Zgo+ICt9Cj4gKwo+ICBpbnQgY3JlYXRlX2dyYW50X2hvc3RfbWFwcGluZyh1bnNpZ25lZCBsb25n
IGdwYWRkciwgbWZuX3QgbWZuLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBpbnQgZmxhZ3MsIHVuc2lnbmVkIGludCBjYWNoZV9mbGFncyk7Cj4gICNkZWZpbmUgZ250
dGFiX2hvc3RfbWFwcGluZ19nZXRfcGFnZV90eXBlKHJvLCBsZCwgcmQpICgwKQo+ICBpbnQgcmVw
bGFjZV9ncmFudF9ob3N0X21hcHBpbmcodW5zaWduZWQgbG9uZyBncGFkZHIsIG1mbl90IG1mbiwK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbmV3X2dwYWRk
ciwgdW5zaWduZWQgaW50IGZsYWdzKTsKPiAtdm9pZCBnbnR0YWJfbWFya19kaXJ0eShzdHJ1Y3Qg
ZG9tYWluICpkLCBtZm5fdCBtZm4pOwo+ICAjZGVmaW5lIGdudHRhYl9yZWxlYXNlX2hvc3RfbWFw
cGluZ3MoZG9tYWluKSAxCj4gIAo+ICAvKgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
