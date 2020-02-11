Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A239159A72
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 21:22:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1bz1-0008Mz-JS; Tue, 11 Feb 2020 20:18:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BEN5=37=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j1byz-0008Mk-H3
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 20:18:09 +0000
X-Inumbo-ID: 9dd679dc-4d0b-11ea-ade5-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9dd679dc-4d0b-11ea-ade5-bc764e2007e4;
 Tue, 11 Feb 2020 20:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581452288;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=6Eu/pIm4YSc6/BpAhk9eC6Rv0tpiDgeV5XUOJjla4Sg=;
 b=Tt3QbhyrkTgE8MoJPmMYA3lzu5rxc5+Cclzm4KAmhwz82HUCUjYT8wFL
 TjcPLkNLORfZZH7M07vSfrQ7AZ4L/j78vDy04ojGVTBbMWtvHokgLQg4S
 LtN/TNu/wqiVWjYxyPyOMp1J9FWp5bTv1TJ1ehxve8fR3XHF/ebkoIiLj 0=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PMjndM2TlwFV0NF2oqdNkQbTSZs9LT4sjAJzZmZMGmEU3lUe4g6dnw2o83MPK4FpDxnldF3wqF
 ITVhrprxwlw/c8ekfzlEynEUs0HuAaYO8JnDiPT7rZKQUWln7ogq1e+luYv4LtDA88as56zq6r
 xQG0/H1bSbX8VQJGUYgNFvWcRyt9yzwuSfi86DdpVjkNEWoUU1Bk45gP+QLzSjlxzEIeny66By
 ev2XQNVWDE6z6sYpCfYlf5wa4cAOrYwaCi3Pfw7bPr5nZqsj/LJo6cWDRouJM8TjPUNxkHDwAP
 ULU=
X-SBRS: 2.7
X-MesageID: 12665361
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,428,1574139600"; d="scan'208";a="12665361"
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20200128142818.27200-1-jgross@suse.com>
 <20200128142818.27200-2-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <6c49ac2f-fb4f-dd40-d916-a8a6f7e6272e@citrix.com>
Date: Tue, 11 Feb 2020 20:18:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200128142818.27200-2-jgross@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 1/3] xenstore: setup xenstore stubdom
 console interface properly
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMDEvMjAyMCAxNDoyOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBJbiBvcmRlciB0byBi
ZSBhYmxlIHRvIGdldCBhY2Nlc3MgdG8gdGhlIGNvbnNvbGUgb2YgWGVuc3RvcmUgc3R1YmRvbQo+
IHdlIG5lZWQgYW4gYXBwcm9wcmlhdGUgZ3JhbnR0YWIgZW50cnkuIFNvIGNhbGwgeGNfZG9tX2du
dHRhYl9pbml0KCkKPiB3aGVuIGNvbnN0cnVjdGluZyB0aGUgZG9tYWluIGFuZCBwcmVzZXQgc29t
ZSBpbmZvcm1hdGlvbiBuZWVkZWQKPiBmb3IgdGhhdCBmdW5jdGlvbiBpbiB0aGUgZG9tIHN0cnVj
dHVyZS4KPgo+IFdlIG5lZWQgdG8gY3JlYXRlIHRoZSBldmVudCBjaGFubmVsIGZvciB0aGUgY29u
c29sZSwgdG9vLiBEbyB0aGF0IGFuZAo+IHN0b3JlIGFsbCBuZWNlc3NhcnkgZGF0YSBsb2NhbGx5
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IC0t
LQo+ICB0b29scy9oZWxwZXJzL2luaXQteGVuc3RvcmUtZG9tYWluLmMgfCAxMyArKysrKysrKysr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
dG9vbHMvaGVscGVycy9pbml0LXhlbnN0b3JlLWRvbWFpbi5jIGIvdG9vbHMvaGVscGVycy9pbml0
LXhlbnN0b3JlLWRvbWFpbi5jCj4gaW5kZXggYWRiODQwOGI2My4uYTMxMmJjMzhiOCAxMDA2NDQK
PiAtLS0gYS90b29scy9oZWxwZXJzL2luaXQteGVuc3RvcmUtZG9tYWluLmMKPiArKysgYi90b29s
cy9oZWxwZXJzL2luaXQteGVuc3RvcmUtZG9tYWluLmMKPiBAQCAtMjQsNiArMjQsOCBAQCBzdGF0
aWMgY2hhciAqcGFyYW07Cj4gIHN0YXRpYyBjaGFyICpuYW1lID0gIlhlbnN0b3JlIjsKPiAgc3Rh
dGljIGludCBtZW1vcnk7Cj4gIHN0YXRpYyBpbnQgbWF4bWVtOwo+ICtzdGF0aWMgeGVuX3Bmbl90
IGNvbnNvbGVfbWZuOwo+ICtzdGF0aWMgdW5zaWduZWQgaW50IGNvbnNvbGVfZXZ0Y2huOwo+ICAK
PiAgc3RhdGljIHN0cnVjdCBvcHRpb24gb3B0aW9uc1tdID0gewo+ICAgICAgeyAia2VybmVsIiwg
MSwgTlVMTCwgJ2snIH0sCj4gQEAgLTExMyw2ICsxMTUsNyBAQCBzdGF0aWMgaW50IGJ1aWxkKHhj
X2ludGVyZmFjZSAqeGNoKQo+ICAgICAgICAgIGZwcmludGYoc3RkZXJyLCAieGNfZG9tYWluX3Nl
dG1heG1lbSBmYWlsZWRcbiIpOwo+ICAgICAgICAgIGdvdG8gZXJyOwo+ICAgICAgfQo+ICsgICAg
Y29uc29sZV9ldnRjaG4gPSB4Y19ldnRjaG5fYWxsb2NfdW5ib3VuZCh4Y2gsIGRvbWlkLCAwKTsK
ClByZXN1bWFibHkgc29tZSBmb3JtIG9mIGVycm9yIGNoZWNraW5nPwoKQWxzbywgd2hpbGUgaXQg
aXMgcHJvYmFibHkgZmluZSBmb3Igbm93LCBJIHRoaW5rIHRoaXMgZG9lcyBoaWdobGlnaHQgYQpm
dXR1cmUgaXNzdWUuwqAgV2hhdCBoYXBwZW5zIHdoZW4geGVuY29uc29sZWQgaXMgYWxzbyBhIHN0
dWJkb21haW4/CgpJIHN1c3BlY3Qgd2UgaGF2ZSBhIGxvb21pbmcgY2hpY2tlbiZlZ2cgcHJvYmxl
bSwgd2hlcmUgdGhlIHRvb2xzdGFjayBpcwpnb2luZyB0byBoYXZlIHRvIGRvIHNvbWUgY2FyZWZ1
bCBkb21pZCBhbmQgcGx1bWJpbmcgdG8gc2V0IHVwIGJ1aWxkIGJvdGgKc3R1YmRvbXMgaW4gdGFu
ZGVtLgoKPiAgICAgIHJ2ID0geGNfZG9tYWluX3NldF9tZW1tYXBfbGltaXQoeGNoLCBkb21pZCwg
bGltaXRfa2IpOwo+ICAgICAgaWYgKCBydiApCj4gICAgICB7Cj4gQEAgLTEzMyw2ICsxMzYsOSBA
QCBzdGF0aWMgaW50IGJ1aWxkKHhjX2ludGVyZmFjZSAqeGNoKQo+ICAgICAgICAgIHNucHJpbnRm
KGNtZGxpbmUsIDUxMiwgIi0tZXZlbnQgJWQgLS1pbnRlcm5hbC1kYiIsIHJ2KTsKPiAgCj4gICAg
ICBkb20gPSB4Y19kb21fYWxsb2NhdGUoeGNoLCBjbWRsaW5lLCBOVUxMKTsKCkFueSBjaGFuY2Ug
b2Ygc29tZSBlcnJvciBoYW5kbGluZywgdW5saWtlbHkgYXMgaXQgaXMgdG8gZ28gd3Jvbmc/Cgo+
ICsgICAgZG9tLT5jb250YWluZXJfdHlwZSA9IFhDX0RPTV9QVl9DT05UQUlORVI7Cj4gKyAgICBk
b20tPnhlbnN0b3JlX2RvbWlkID0gZG9taWQ7Cj4gKyAgICBkb20tPmNvbnNvbGVfZXZ0Y2huID0g
Y29uc29sZV9ldnRjaG47CgphbmQgYSBuZXdsaW5lIGhlcmU/Cgo+ICAgICAgcnYgPSB4Y19kb21f
a2VybmVsX2ZpbGUoZG9tLCBrZXJuZWwpOwo+ICAgICAgaWYgKCBydiApCj4gICAgICB7Cj4gQEAg
LTE4Niw2ICsxOTIsMTIgQEAgc3RhdGljIGludCBidWlsZCh4Y19pbnRlcmZhY2UgKnhjaCkKPiAg
ICAgICAgICBmcHJpbnRmKHN0ZGVyciwgInhjX2RvbV9ib290X2ltYWdlIGZhaWxlZFxuIik7Cj4g
ICAgICAgICAgZ290byBlcnI7Cj4gICAgICB9Cj4gKyAgICBydiA9IHhjX2RvbV9nbnR0YWJfaW5p
dChkb20pOwo+ICsgICAgaWYgKCBydiApCj4gKyAgICB7Cj4gKyAgICAgICAgZnByaW50ZihzdGRl
cnIsICJ4Y19kb21fZ250dGFiX2luaXQgZmFpbGVkXG4iKTsKPiArICAgICAgICBnb3RvIGVycjsK
PiArICAgIH0KPiAgCj4gICAgICBydiA9IHhjX2RvbWFpbl9zZXRfdmlycV9oYW5kbGVyKHhjaCwg
ZG9taWQsIFZJUlFfRE9NX0VYQyk7Cj4gICAgICBpZiAoIHJ2ICkKPiBAQCAtMjAxLDYgKzIxMyw3
IEBAIHN0YXRpYyBpbnQgYnVpbGQoeGNfaW50ZXJmYWNlICp4Y2gpCj4gICAgICB9Cj4gIAo+ICAg
ICAgcnYgPSAwOwo+ICsgICAgY29uc29sZV9tZm4gPSB4Y19kb21fcDJtKGRvbSwgZG9tLT5jb25z
b2xlX3Bmbik7CgpUaGlzIGRvZXNuJ3QgYXBwZWFyIHRvIGJlIHVzZWQuCgp+QW5kcmV3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
