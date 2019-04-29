Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB145E6BD
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 17:41:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL8MH-0008EK-UN; Mon, 29 Apr 2019 15:38:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NplV=S7=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hL8MH-0008EF-Al
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 15:38:21 +0000
X-Inumbo-ID: d0678512-6a94-11e9-807d-13c15593526d
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0678512-6a94-11e9-807d-13c15593526d;
 Mon, 29 Apr 2019 15:38:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556552300; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=xjwo6mGL2mDXS426D+rlkSzD1kHdH/Rld7YhHvvI7tY=;
 b=w+4lR3tqsYrusorx2b1J6NQOClv9iyDgb5UblHlNDseozORi61ftero0263dZccW3FqVnQOu
 p4R3BQyEIGBuCnHAN/xWUvCAY4cO7XqrSklPKltVcHmmL0mNjDOXTq8KXjCnZulNc7QdZAUu
 ftA7B5c9xBnoXE/I862DmyMqpwk=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mxa.mailgun.org with ESMTP id 5cc71a6a.7f8b91a1e530-smtp-out-n03;
 Mon, 29 Apr 2019 15:38:18 -0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id s18so16796323wrp.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2019 08:38:18 -0700 (PDT)
X-Gm-Message-State: APjAAAUK2BN0pyRY44D7ZXxKhVpc5uXoX5JeGHnEAxrxFDF8zOxCfSjX
 PCYAtKGA0HYphJpIu7ZmMAIzdsM1+DgnjKGkW3Q=
X-Google-Smtp-Source: APXvYqxqafhKmMs9mEfxntgXbknfrWRutznE/F29Q7Yb/TJe5enKOriH60XlA7fltHUGVEyXoJIX0TM/WA97n84Izg8=
X-Received: by 2002:adf:dec5:: with SMTP id i5mr12248826wrn.157.1556552297645; 
 Mon, 29 Apr 2019 08:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <1597d8fa-d3d0-83ba-bb19-21041e2cda11@citrix.com>
 <846a86f8-85b8-1f9c-5fbd-52c5ce07b819@citrix.com>
 <2f6f51e3-88da-0593-13cf-c504777c0807@citrix.com>
 <80cdb985-8407-a955-e6f6-86a599caa05f@citrix.com>
In-Reply-To: <80cdb985-8407-a955-e6f6-86a599caa05f@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 29 Apr 2019 09:37:40 -0600
X-Gmail-Original-Message-ID: <CABfawh=yvY0H2YvB8wS16KCAJpGjdQxAc2P+Jm5VsoLpwoA58w@mail.gmail.com>
Message-ID: <CABfawh=yvY0H2YvB8wS16KCAJpGjdQxAc2P+Jm5VsoLpwoA58w@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v3 1/4] x86/mem_sharing: reorder when pages
 are unlocked and released
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
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgODo1NCBBTSBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gNC8yOS8xOSAzOjQ5IFBNLCBBbmRyZXcgQ29v
cGVyIHdyb3RlOgo+ID4gT24gMjkvMDQvMjAxOSAxNTo0NiwgR2VvcmdlIER1bmxhcCB3cm90ZToK
PiA+PiBPbiA0LzI5LzE5IDM6MzIgUE0sIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gPj4+IE9uIDQv
MjYvMTkgNjoyMSBQTSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4+Pj4gQ2FsbGluZyBfcHV0
X3BhZ2VfdHlwZSB3aGlsZSBhbHNvIGhvbGRpbmcgdGhlIHBhZ2VfbG9jawo+ID4+Pj4gZm9yIHRo
YXQgcGFnZSBjYW4gY2F1c2UgYSBkZWFkbG9jay4KPiA+Pj4+Cj4gPj4+PiBTaWduZWQtb2ZmLWJ5
OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4gPj4+PiBDYzogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4+Pj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gPj4+PiBDYzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1
bmxhcEBldS5jaXRyaXguY29tPgo+ID4+Pj4gQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5j
b20+Cj4gPj4+PiBDYzogUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+
Pj4+IC0tLQo+ID4+Pj4gdjM6IHNpbXBsaWZpZWQgcGF0Y2ggYnkga2VlcGluZyB0aGUgYWRkaXRp
b25hbCByZWZlcmVuY2VzIGFscmVhZHkgaW4tcGxhY2UKPiA+Pj4+IC0tLQo+ID4+Pj4gIHhlbi9h
cmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jIHwgMTkgKysrKysrKysrKy0tLS0tLS0tLQo+ID4+Pj4g
IDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+ID4+Pj4K
PiA+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYyBiL3hlbi9h
cmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jCj4gPj4+PiBpbmRleCBkZmMyNzlkMzcxLi5lMmY3NGFj
NzcwIDEwMDY0NAo+ID4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKPiA+
Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jCj4gPj4+PiBAQCAtNjQ4LDEw
ICs2NDgsNiBAQCBzdGF0aWMgaW50IHBhZ2VfbWFrZV9wcml2YXRlKHN0cnVjdCBkb21haW4gKmQs
IHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpCj4gPj4+PiAgICAgICAgICByZXR1cm4gLUVCVVNZOwo+
ID4+Pj4gICAgICB9Cj4gPj4+Pgo+ID4+Pj4gLSAgICAvKiBXZSBjYW4gb25seSBjaGFuZ2UgdGhl
IHR5cGUgaWYgY291bnQgaXMgb25lICovCj4gPj4+PiAtICAgIC8qIEJlY2F1c2Ugd2UgYXJlIGxv
Y2tpbmcgcGFnZXMgaW5kaXZpZHVhbGx5LCB3ZSBuZWVkIHRvIGRyb3AKPiA+Pj4+IC0gICAgICog
dGhlIGxvY2sgaGVyZSwgd2hpbGUgdGhlIHBhZ2UgaXMgdHlwZWQuIFdlIGNhbm5vdCByaXNrIHRo
ZQo+ID4+Pj4gLSAgICAgKiByYWNlIG9mIHBhZ2VfdW5sb2NrIGFuZCB0aGVuIHB1dF9wYWdlX3R5
cGUuICovCj4gPj4+PiAgICAgIGV4cGVjdGVkX3R5cGUgPSAoUEdUX3NoYXJlZF9wYWdlIHwgUEdU
X3ZhbGlkYXRlZCB8IFBHVF9sb2NrZWQgfCAyKTsKPiA+Pj4+ICAgICAgaWYgKCBwYWdlLT51Lmlu
dXNlLnR5cGVfaW5mbyAhPSBleHBlY3RlZF90eXBlICkKPiA+Pj4+ICAgICAgewo+ID4+Pj4gQEAg
LTY2MCwxMiArNjU2LDEyIEBAIHN0YXRpYyBpbnQgcGFnZV9tYWtlX3ByaXZhdGUoc3RydWN0IGRv
bWFpbiAqZCwgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSkKPiA+Pj4+ICAgICAgICAgIHJldHVybiAt
RUVYSVNUOwo+ID4+Pj4gICAgICB9Cj4gPj4+Pgo+ID4+Pj4gLSAgICAvKiBEcm9wIHRoZSBmaW5h
bCB0eXBlY291bnQgKi8KPiA+Pj4+IC0gICAgcHV0X3BhZ2VfYW5kX3R5cGUocGFnZSk7Cj4gPj4+
PiAtCj4gPj4+PiAgICAgIC8qIE5vdyB0aGF0IHdlJ3ZlIGRyb3BwZWQgdGhlIHR5cGUsIHdlIGNh
biB1bmxvY2sgKi8KPiA+Pj4+ICAgICAgbWVtX3NoYXJpbmdfcGFnZV91bmxvY2socGFnZSk7Cj4g
Pj4+Pgo+ID4+Pj4gKyAgICAvKiBEcm9wIHRoZSBmaW5hbCB0eXBlY291bnQgKi8KPiA+Pj4+ICsg
ICAgcHV0X3BhZ2VfYW5kX3R5cGUocGFnZSk7Cj4gPj4+PiArCj4gPj4+PiAgICAgIC8qIENoYW5n
ZSB0aGUgb3duZXIgKi8KPiA+Pj4+ICAgICAgQVNTRVJUKHBhZ2VfZ2V0X293bmVyKHBhZ2UpID09
IGRvbV9jb3cpOwo+ID4+Pj4gICAgICBwYWdlX3NldF9vd25lcihwYWdlLCBkKTsKPiA+Pj4+IEBA
IC05MDAsNiArODk2LDcgQEAgc3RhdGljIGludCBzaGFyZV9wYWdlcyhzdHJ1Y3QgZG9tYWluICpz
ZCwgZ2ZuX3Qgc2dmbiwgc2hyX2hhbmRsZV90IHNoLAo+ID4+Pj4gICAgICBwMm1fdHlwZV90IHNt
Zm5fdHlwZSwgY21mbl90eXBlOwo+ID4+Pj4gICAgICBzdHJ1Y3QgdHdvX2dmbnMgdGc7Cj4gPj4+
PiAgICAgIHN0cnVjdCBybWFwX2l0ZXJhdG9yIHJpOwo+ID4+Pj4gKyAgICB1bnNpZ25lZCBsb25n
IHB1dF9jb3VudCA9IDA7Cj4gPj4+Pgo+ID4+Pj4gICAgICBnZXRfdHdvX2dmbnMoc2QsIHNnZm4s
ICZzbWZuX3R5cGUsIE5VTEwsICZzbWZuLAo+ID4+Pj4gICAgICAgICAgICAgICAgICAgY2QsIGNn
Zm4sICZjbWZuX3R5cGUsIE5VTEwsICZjbWZuLCAwLCAmdGcpOwo+ID4+Pj4gQEAgLTk4NCw3ICs5
ODEsNyBAQCBzdGF0aWMgaW50IHNoYXJlX3BhZ2VzKHN0cnVjdCBkb21haW4gKnNkLCBnZm5fdCBz
Z2ZuLCBzaHJfaGFuZGxlX3Qgc2gsCj4gPj4+PiAgICAgICAgICAgKiBEb24ndCBjaGFuZ2UgdGhl
IHR5cGUgb2Ygcm1hcCBmb3IgdGhlIGNsaWVudCBwYWdlLiAqLwo+ID4+Pj4gICAgICAgICAgcm1h
cF9kZWwoZ2ZuLCBjcGFnZSwgMCk7Cj4gPj4+PiAgICAgICAgICBybWFwX2FkZChnZm4sIHNwYWdl
KTsKPiA+Pj4+IC0gICAgICAgIHB1dF9wYWdlX2FuZF90eXBlKGNwYWdlKTsKPiA+Pj4+ICsgICAg
ICAgIHB1dF9jb3VudCsrOwo+ID4+Pj4gICAgICAgICAgZCA9IGdldF9kb21haW5fYnlfaWQoZ2Zu
LT5kb21haW4pOwo+ID4+Pj4gICAgICAgICAgQlVHX09OKCFkKTsKPiA+Pj4+ICAgICAgICAgIEJV
R19PTihzZXRfc2hhcmVkX3AybV9lbnRyeShkLCBnZm4tPmdmbiwgc21mbikpOwo+ID4+Pj4gQEAg
LTk5OSw2ICs5OTYsMTAgQEAgc3RhdGljIGludCBzaGFyZV9wYWdlcyhzdHJ1Y3QgZG9tYWluICpz
ZCwgZ2ZuX3Qgc2dmbiwgc2hyX2hhbmRsZV90IHNoLAo+ID4+Pj4gICAgICBtZW1fc2hhcmluZ19w
YWdlX3VubG9jayhzZWNvbmRwZyk7Cj4gPj4+PiAgICAgIG1lbV9zaGFyaW5nX3BhZ2VfdW5sb2Nr
KGZpcnN0cGcpOwo+ID4+Pj4KPiA+Pj4+ICsgICAgQlVHX09OKCFwdXRfY291bnQpOwo+ID4+Pj4g
KyAgICB3aGlsZSAoIHB1dF9jb3VudC0tICkKPiA+Pj4+ICsgICAgICAgIHB1dF9wYWdlX2FuZF90
eXBlKGNwYWdlKTsKPiA+Pj4+ICsKPiA+Pj4+ICAgICAgLyogRnJlZSB0aGUgY2xpZW50IHBhZ2Ug
Ki8KPiA+Pj4+ICAgICAgaWYodGVzdF9hbmRfY2xlYXJfYml0KF9QR0NfYWxsb2NhdGVkLCAmY3Bh
Z2UtPmNvdW50X2luZm8pKQo+ID4+Pj4gICAgICAgICAgcHV0X3BhZ2UoY3BhZ2UpOwo+ID4+Pj4g
QEAgLTExNjcsOCArMTE2OCw4IEBAIGludCBfX21lbV9zaGFyaW5nX3Vuc2hhcmVfcGFnZShzdHJ1
Y3QgZG9tYWluICpkLAo+ID4+Pj4gICAgICB7Cj4gPj4+PiAgICAgICAgICBpZiAoICFsYXN0X2dm
biApCj4gPj4+PiAgICAgICAgICAgICAgbWVtX3NoYXJpbmdfZ2ZuX2Rlc3Ryb3kocGFnZSwgZCwg
Z2ZuX2luZm8pOwo+ID4+Pj4gLSAgICAgICAgcHV0X3BhZ2VfYW5kX3R5cGUocGFnZSk7Cj4gPj4+
PiAgICAgICAgICBtZW1fc2hhcmluZ19wYWdlX3VubG9jayhwYWdlKTsKPiA+Pj4+ICsgICAgICAg
IHB1dF9wYWdlX2FuZF90eXBlKHBhZ2UpOwo+ID4+Pj4gICAgICAgICAgaWYgKCBsYXN0X2dmbiAp
Cj4gPj4+PiAgICAgICAgICB7Cj4gPj4+PiAgICAgICAgICAgICAgaWYgKCAhZ2V0X3BhZ2UocGFn
ZSwgZG9tX2NvdykgKQo+ID4+PiAuLi5Qcm9iYWJseSBzaG91bGQgaGF2ZSBtZW50aW9uZWQgdGhh
dCB0aGlzIG5lZWRzIHRvIGJlIGFwcGxpZWQgYWZ0ZXIKPiA+Pj4geW91ciBvdGhlciBwYXRjaC4g
Oi0pCj4gPj4gSG1tIC0tIGFjdHVhbGx5LCB0aGUgYmFzZSBhcHBlYXJzIHRvIGJlIGEgbm9uLXB1
YmxpY2x5LWF2YWlsYWJsZSB0cmVlCj4gPj4gKEFuZHkncyBwcml2YXRlIHg4Ni1uZXh0KS4KPiA+
Cj4gPiBJdHMgcGVyZmVjdGx5IHB1YmxpYwo+ID4KPiA+IGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcv
Z2l0d2ViLz9wPXBlb3BsZS9hbmRyZXdjb29wL3hlbi5naXQ7YT1zaG9ydGxvZztoPXJlZnMvaGVh
ZHMveDg2LW5leHQKPgo+IE9LLCBkaWRuJ3QgcmVhbGl6ZSB0aGlzLgo+Cj4gPgo+ID4gYW5kIGhh
cyBiZWVuIGluIGVmZmVjdCBkdXJpbmcgY29tbWl0IGZyZWV6ZXMgZm9yIHRoZSBwYXN0IHNldmVy
YWwgeWVhcnMKPiA+IHdvcnRoIG9mIHJlbGVhc2VzLgo+ID4KPiA+IEl0IGlzIGZpbmUgdG8gcG9z
dCBhIHRyZWUgYmFzZWQgb24gc29tZXRoaW5nIG90aGVyIHRoYW4geGVuLmdpdC9zdGFnaW5nCj4g
PiBzbyBsb25nIGFzIHRoZSBjb3ZlciBsZXR0ZXIgaWRlbnRpZmllcyB3aGVyZSB0aGUgc2VyaWVz
IGlzIGJhc2VkLiAgQSBsb3QKPiA+IG9mIGRldmVsb3BtZW50IGFscmVhZHkgb2NjdXJzIGluIHRo
aXMgd2F5IG9uIHhlbi1kZXZlbC4KPgo+IEkgYWdyZWUgaXQncyBmaW5lIHdoZW4gYSBVUkwgaXMg
cHJvdmlkZWQuCj4KClllYXAsIHNvcnJ5LCBzaG91bGQgaGF2ZSBwb2ludGVkIG91dCBJIHJlYmFz
ZWQgb24geDg2LW5leHQgc28gSSBkb24ndAprZWVwIHNlbmRpbmcgcGF0Y2hlcyB0aGF0IGFyZSBh
bHJlYWR5IHB1bGxlZCBpbi4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
