Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A59AA10A70B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 00:18:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZk3v-0008JV-0G; Tue, 26 Nov 2019 23:16:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nsV+=ZS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iZk3t-0008JQ-Bd
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 23:16:01 +0000
X-Inumbo-ID: b596ca54-10a2-11ea-9db0-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b596ca54-10a2-11ea-9db0-bc764e2007e4;
 Tue, 26 Nov 2019 23:16:00 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 811832068E;
 Tue, 26 Nov 2019 23:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574810160;
 bh=Y2FPkzIFvItHRKBE8vANiFKNoz1dPI2EvWLff6NZbXk=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=2rCLb9GhMZFqJQZXuPGgzjx3pFkve3q6wm6EZbPuERCqDkPd4Ee0TYcRUPmVGpdBU
 WhAIoWnMJ2ki8u57hxQh09qw5pU6Kz0SpjdMrzo2Igmd3FFIlSkG+UJvHTqNzj8S2F
 BXNslNZyuAQt5tuy93Q4hA6+EbkcqjXNilC/HN8w=
Date: Tue, 26 Nov 2019 15:15:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
In-Reply-To: <20191115201037.44982-1-stewart.hildebrand@dornerworks.com>
Message-ID: <alpine.DEB.2.21.1911261356290.8205@sstabellini-ThinkPad-T480s>
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
 <20191115201037.44982-1-stewart.hildebrand@dornerworks.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [XEN PATCH v3 05/11] xen: arm: add interfaces to
 save/restore the state of a PPI.
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Ian Campbell <ian.campbell@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAxNSBOb3YgMjAxOSwgU3Rld2FydCBIaWxkZWJyYW5kIHdyb3RlOgo+IGRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2RvbWFpbi5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9k
b21haW4uaAo+IGluZGV4IGYzZjNmYjdkN2YuLmMzZjRjZDUwNjkgMTAwNjQ0Cj4gLS0tIGEveGVu
L2luY2x1ZGUvYXNtLWFybS9kb21haW4uaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vZG9t
YWluLmgKPiBAQCAtMzQsNiArMzQsMTcgQEAgZW51bSBkb21haW5fdHlwZSB7Cj4gIC8qIFRoZSBo
YXJkd2FyZSBkb21haW4gaGFzIGFsd2F5cyBpdHMgbWVtb3J5IGRpcmVjdCBtYXBwZWQuICovCj4g
ICNkZWZpbmUgaXNfZG9tYWluX2RpcmVjdF9tYXBwZWQoZCkgKChkKSA9PSBoYXJkd2FyZV9kb21h
aW4pCj4gIAo+ICtzdHJ1Y3QgaHdwcGlfc3RhdGUgewo+ICsgICAgLyogaC93IHN0YXRlICovCj4g
KyAgICB1bnNpZ25lZCBpcnE7CgpJdCBkb2Vzbid0IGxvb2sgbGlrZSB3ZSBuZWVkIHRvIHNhdmUg
dGhlIGlycSBudW1iZXIgYWdhaW4gaGVyZS4KCgo+ICsgICAgdW5zaWduZWQgbG9uZyBlbmFibGVk
OjE7Cj4gKyAgICB1bnNpZ25lZCBsb25nIHBlbmRpbmc6MTsKPiArICAgIHVuc2lnbmVkIGxvbmcg
YWN0aXZlOjE7Cj4gKwo+ICsgICAgLyogWGVuIHMvdyBzdGF0ZSAqLwo+ICsgICAgdW5zaWduZWQg
bG9uZyBpbnByb2dyZXNzOjE7Cj4gK307Cj4gKwo+ICBzdHJ1Y3QgdnRpbWVyIHsKPiAgICAgIHN0
cnVjdCB2Y3B1ICp2Owo+ICAgICAgaW50IGlycTsKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUv
YXNtLWFybS9naWMuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ2ljLmgKPiBpbmRleCA3OTNkMzI0
YjMzLi4xMTY0ZTBjN2E2IDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ2ljLmgK
PiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2dpYy5oCj4gQEAgLTI3NSw2ICsyNzUsMjYgQEAg
ZXh0ZXJuIGludCBnaWN2X3NldHVwKHN0cnVjdCBkb21haW4gKmQpOwo+ICBleHRlcm4gdm9pZCBn
aWNfc2F2ZV9zdGF0ZShzdHJ1Y3QgdmNwdSAqdik7Cj4gIGV4dGVybiB2b2lkIGdpY19yZXN0b3Jl
X3N0YXRlKHN0cnVjdCB2Y3B1ICp2KTsKPiAgCj4gKy8qCj4gKyAqIFNhdmUvcmVzdG9yZSB0aGUg
c3RhdGUgb2YgYSBzaW5nbGUgUFBJIHdoaWNoIG11c3QgYmUgcm91dGVkIHRvCj4gKyAqIDxjdXJy
ZW50LXZjcHU+ICh0aGF0IGlzLCBpcyBkZWZpbmVkIHRvIGJlIGluamVjdGVkIHRvIHRoZSBjdXJy
ZW50Cj4gKyAqIHZjcHUpLgo+ICsgKgo+ICsgKiBXZSBleHBlY3QgdGhlIGRldmljZSB3aGljaCB1
c2UgdGhpcyBQUEkgdG8gYmUgcXVpZXQgd2hpbGUgd2UKPiArICogc2F2ZS9yZXN0b3JlLgo+ICsg
Kgo+ICsgKiBGb3IgaW5zdGFuY2Ugd2Ugd2FudCB0byBkaXNhYmxlIHRoZSB0aW1lciBiZWZvcmUg
c2F2aW5nIHRoZSBzdGF0ZS4KPiArICogT3RoZXJ3aXNlIHdlIHdpbGwgbWVzcyB1cCB0aGUgc3Rh
dGUuCj4gKyAqLwo+ICtzdHJ1Y3QgaHdwcGlfc3RhdGU7CgpJdCBpcyBhIGJpdCBhd2t3YXJkIHRv
IGhhdmUgdG8gZG8gdGhpcyAicmVkZWZpbmUiIHN0cnVjdCBod3BwaV9zdGF0ZQpoZXJlLiBJIGtu
b3cgdGhhdCB0aGUgWGVuIGhlYWRlcnMgZmlsZSBkb24ndCBhbHdheXMgaW5jbHVkZSBjb3JyZWN0
bHksCmJ1dCBjb3VsZCB3ZSBtb3ZlIHRoZSBmdWxsIGRlZmluaXRpb24gb2Ygc3RydWN0IGh3cHBp
X3N0YXRlIGhlcmU/CmRvbWFpbi5oIGlzIGFscmVhZHkgaW5jbHVkaW5nIGdpYy5oLCBzbyBpdCBz
aG91bGQgd29yaz8KCgo+ICtleHRlcm4gdm9pZCBnaWNfaHdwcGlfc3RhdGVfaW5pdChzdHJ1Y3Qg
aHdwcGlfc3RhdGUgKnMsIHVuc2lnbmVkIGlycSk7Cj4gK2V4dGVybiB2b2lkIGdpY19od3BwaV9z
ZXRfcGVuZGluZyhzdHJ1Y3QgaHdwcGlfc3RhdGUgKnMpOwo+ICtleHRlcm4gdm9pZCBnaWNfc2F2
ZV9hbmRfbWFza19od3BwaShzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgaXJxLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgaHdwcGlfc3RhdGUgKnMpOwo+ICtl
eHRlcm4gdm9pZCBnaWNfcmVzdG9yZV9od3BwaShzdHJ1Y3QgdmNwdSAqdiwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uc3QgdW5zaWduZWQgdmlycSwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGh3cHBpX3N0YXRlICpzKTsKPiArCj4gIC8q
IFNHSSAoQUtBIElQSXMpICovCj4gIGVudW0gZ2ljX3NnaSB7Cj4gICAgICBHSUNfU0dJX0VWRU5U
X0NIRUNLID0gMCwKPiBAQCAtMzI1LDggKzM0NSwxMCBAQCBzdHJ1Y3QgZ2ljX2h3X29wZXJhdGlv
bnMgewo+ICAgICAgaW50ICgqaW5pdCkodm9pZCk7Cj4gICAgICAvKiBTYXZlIEdJQyByZWdpc3Rl
cnMgKi8KPiAgICAgIHZvaWQgKCpzYXZlX3N0YXRlKShzdHJ1Y3QgdmNwdSAqKTsKPiArICAgIHZv
aWQgKCpzYXZlX2FuZF9tYXNrX2h3cHBpKShzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MsIHN0cnVjdCBo
d3BwaV9zdGF0ZSAqcyk7Cj4gICAgICAvKiBSZXN0b3JlIEdJQyByZWdpc3RlcnMgKi8KPiAgICAg
IHZvaWQgKCpyZXN0b3JlX3N0YXRlKShjb25zdCBzdHJ1Y3QgdmNwdSAqKTsKPiArICAgIHZvaWQg
KCpyZXN0b3JlX2h3cHBpKShzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MsIGNvbnN0IHN0cnVjdCBod3Bw
aV9zdGF0ZSAqcyk7Cj4gICAgICAvKiBEdW1wIEdJQyBMUiByZWdpc3RlciBpbmZvcm1hdGlvbiAq
Lwo+ICAgICAgdm9pZCAoKmR1bXBfc3RhdGUpKGNvbnN0IHN0cnVjdCB2Y3B1ICopOwo+ICAKPiBk
aWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9pcnEuaCBiL3hlbi9pbmNsdWRlL2FzbS1h
cm0vaXJxLmgKPiBpbmRleCBlMTQwMDFiNWM2Li4zYjM3YTIxYzA2IDEwMDY0NAo+IC0tLSBhL3hl
bi9pbmNsdWRlL2FzbS1hcm0vaXJxLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2lycS5o
Cj4gQEAgLTk2LDYgKzk2LDggQEAgdm9pZCBpcnFfc2V0X2FmZmluaXR5KHN0cnVjdCBpcnFfZGVz
YyAqZGVzYywgY29uc3QgY3B1bWFza190ICpjcHVfbWFzayk7Cj4gICAqLwo+ICBib29sIGlycV90
eXBlX3NldF9ieV9kb21haW4oY29uc3Qgc3RydWN0IGRvbWFpbiAqZCk7Cj4gIAo+ICt2b2lkIGly
cV9zZXRfdmlycShzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MsIHVuc2lnbmVkIHZpcnEpOwo+ICsKPiAg
I2VuZGlmIC8qIF9BU01fSFdfSVJRX0ggKi8KPiAgLyoKPiAgICogTG9jYWwgdmFyaWFibGVzOgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
