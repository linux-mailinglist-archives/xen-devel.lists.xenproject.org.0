Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 969F2608BF
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 17:06:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjPjG-0006AT-R2; Fri, 05 Jul 2019 15:02:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=c8AU=VC=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hjPjG-0006AO-2m
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 15:02:26 +0000
X-Inumbo-ID: e5e76eae-9f35-11e9-a7f3-03686d0714aa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5e76eae-9f35-11e9-a7f3-03686d0714aa;
 Fri, 05 Jul 2019 15:02:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D18C79E635;
 Fri,  5 Jul 2019 15:02:06 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-244.ams2.redhat.com
 [10.36.116.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B53CCBA118;
 Fri,  5 Jul 2019 15:01:58 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-10-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <49c9f224-dc09-6fb9-903a-409b98867890@redhat.com>
Date: Fri, 5 Jul 2019 17:01:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190704144233.27968-10-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 05 Jul 2019 15:02:23 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v3 09/35] OvmfPkg/OvmfXen: use a TimerLib
 instance that depends only on the CPU
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jordan Justen <jordan.l.justen@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMDQvMTkgMTY6NDIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IEFDUEkgVGltZXIgZG9l
cyBub3Qgd29yayBpbiBhIFBWSCBndWVzdCwgYnV0IGxvY2FsIEFQSUMgd29ya3Mgb24gYm90aAo+
IFBWSCBhbmQgSFZNLgo+IAo+IE5vdGUgdGhhdCB0aGUgdXNlIG9mIFNlY1BlaUR4ZVRpbWVyTGli
Q3B1IG1pZ2h0IGJlIGFuIGlzc3VlIHdpdGggYQo+IGRyaXZlciBvZiB0eXBlIERYRV9SVU5USU1F
X0RSSVZFUi4gSSd2ZSBhdHRlbXB0ZGUgdG8gZmluZCBvdXQgd2hpY2ggb2YKPiB0aGUgRFhFX1JV
TlRJTUVfRFJJVkVSIHVzZXMgdGhlIFRpbWVyTGliIGF0IHJ1bnRpbWUuIEkndmUgZG9uZSB0aGF0
IGJ5Cj4gcmVwbGFjaW5nIHRoZSBUaW1lckxpYiBldmFsdWF0aW9uIGluCj4gW0xpYnJhcnlDbGFz
c2VzLmNvbW1vbi5EWEVfUlVOVElNRV9EUklWRVJdIGJ5IGEgZGlmZmVyZW50IG9uZSBhbmQKPiBj
aGVjayBldmVyeSBtb2R1bGUgdGhhdCB1c2VzIGl0ICh3aXRoIHRoZSAtLXJlcG9ydC1maWxlPXJl
cG9ydCBidWlsZAo+IG9wdGlvbikuCj4gCj4gUmVzZXRTeXN0ZW1SdW50aW1lRHhlIGlzIGNhbGxp
bmcgdGhlIFRpbWVyTGliIEFQSSBhdCBydW50aW1lIHRvIGRvIHRoZQo+IG9wZXJhdGlvbiAiRWZp
UmVzZXRDb2xkIiwgc28gdGhpcyBtYXkgbmV2ZXIgY29tcGxldGUgaWYgdGhlIE9TIGhhdmUKPiBk
aXNhYmxlZCB0aGUgTG9jYWwgQVBJQyBUaW1lci4KPiAKPiBSZWY6IGh0dHBzOi8vYnVnemlsbGEu
dGlhbm9jb3JlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTY4OQo+IFNpZ25lZC1vZmYtYnk6IEFudGhv
bnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IC0tLQo+IAo+IE5vdGVzOgo+
ICAgICB2MzoKPiAgICAgLSBjbGVhbnVwIC5kc2MsIGxlYXZlIG9ubHkgb25lIFRpbWVyTGliIHJl
c29sdXRpb24KPiAgICAgLSBBZGRlZCBhIG5vdGUgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIHJlZ2Fy
ZGluZyB0aGUgdXNlIG9mIHRoZSBsb2NhbCBhcGljCj4gICAgICAgYnkgcnVudGltZSBkcml2ZXJz
CgpHb29kIG5vdGUgLS0geWVzLCB0aGUgd2FybmluZyBpbgoiTWRlUGtnL0xpYnJhcnkvU2VjUGVp
RHhlVGltZXJMaWJDcHUvU2VjUGVpRHhlVGltZXJMaWJDcHUuaW5mIiBhcHBsaWVzLgpJIGd1ZXNz
IFhlbiBzZXR1cHMgY2FuIGxpdmUgd2l0aCB0aGF0IHBvdGVudGlhbCBwcm9ibGVtLCBmb3Igbm93
LgoKQWNrZWQtYnk6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+CgpUaGFua3MKTGFz
emxvCgo+IAo+ICBPdm1mUGtnL092bWZYZW4uZHNjIHwgNyArLS0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvT3Zt
ZlBrZy9Pdm1mWGVuLmRzYyBiL092bWZQa2cvT3ZtZlhlbi5kc2MKPiBpbmRleCA5Zjc5ZDQ1NWZh
Li42Mjg4Mzk0ZWI4IDEwMDY0NAo+IC0tLSBhL092bWZQa2cvT3ZtZlhlbi5kc2MKPiArKysgYi9P
dm1mUGtnL092bWZYZW4uZHNjCj4gQEAgLTEwNCw3ICsxMDQsNyBAQCBbU2t1SWRzXQo+ICAjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIwo+ICBbTGlicmFyeUNsYXNzZXNdCj4gICAgUGNkTGlifE1kZVBr
Zy9MaWJyYXJ5L0Jhc2VQY2RMaWJOdWxsL0Jhc2VQY2RMaWJOdWxsLmluZgo+IC0gIFRpbWVyTGli
fE92bWZQa2cvTGlicmFyeS9BY3BpVGltZXJMaWIvQmFzZUFjcGlUaW1lckxpYi5pbmYKPiArICBU
aW1lckxpYnxNZGVQa2cvTGlicmFyeS9TZWNQZWlEeGVUaW1lckxpYkNwdS9TZWNQZWlEeGVUaW1l
ckxpYkNwdS5pbmYKPiAgICBQcmludExpYnxNZGVQa2cvTGlicmFyeS9CYXNlUHJpbnRMaWIvQmFz
ZVByaW50TGliLmluZgo+ICAgIEJhc2VNZW1vcnlMaWJ8TWRlUGtnL0xpYnJhcnkvQmFzZU1lbW9y
eUxpYlJlcFN0ci9CYXNlTWVtb3J5TGliUmVwU3RyLmluZgo+ICAgIEJhc2VMaWJ8TWRlUGtnL0xp
YnJhcnkvQmFzZUxpYi9CYXNlTGliLmluZgo+IEBAIC0yMDIsNyArMjAyLDYgQEAgW0xpYnJhcnlD
bGFzc2VzLmNvbW1vbl0KPiAgICBCYXNlQ3J5cHRMaWJ8Q3J5cHRvUGtnL0xpYnJhcnkvQmFzZUNy
eXB0TGliL0Jhc2VDcnlwdExpYi5pbmYKPiAgCj4gIFtMaWJyYXJ5Q2xhc3Nlcy5jb21tb24uU0VD
XQo+IC0gIFRpbWVyTGlifE92bWZQa2cvTGlicmFyeS9BY3BpVGltZXJMaWIvQmFzZVJvbUFjcGlU
aW1lckxpYi5pbmYKPiAgICBRZW11RndDZmdMaWJ8T3ZtZlBrZy9MaWJyYXJ5L1FlbXVGd0NmZ0xp
Yi9RZW11RndDZmdTZWNMaWIuaW5mCj4gICFpZmRlZiAkKERFQlVHX09OX1NFUklBTF9QT1JUKQo+
ICAgIERlYnVnTGlifE1kZVBrZy9MaWJyYXJ5L0Jhc2VEZWJ1Z0xpYlNlcmlhbFBvcnQvQmFzZURl
YnVnTGliU2VyaWFsUG9ydC5pbmYKPiBAQCAtMjgxLDcgKzI4MCw2IEBAIFtMaWJyYXJ5Q2xhc3Nl
cy5jb21tb24uRFhFX0NPUkVdCj4gIAo+ICBbTGlicmFyeUNsYXNzZXMuY29tbW9uLkRYRV9SVU5U
SU1FX0RSSVZFUl0KPiAgICBQY2RMaWJ8TWRlUGtnL0xpYnJhcnkvRHhlUGNkTGliL0R4ZVBjZExp
Yi5pbmYKPiAtICBUaW1lckxpYnxPdm1mUGtnL0xpYnJhcnkvQWNwaVRpbWVyTGliL0R4ZUFjcGlU
aW1lckxpYi5pbmYKPiAgICBIb2JMaWJ8TWRlUGtnL0xpYnJhcnkvRHhlSG9iTGliL0R4ZUhvYkxp
Yi5pbmYKPiAgICBEeGVDb3JlRW50cnlQb2ludHxNZGVQa2cvTGlicmFyeS9EeGVDb3JlRW50cnlQ
b2ludC9EeGVDb3JlRW50cnlQb2ludC5pbmYKPiAgICBNZW1vcnlBbGxvY2F0aW9uTGlifE1kZVBr
Zy9MaWJyYXJ5L1VlZmlNZW1vcnlBbGxvY2F0aW9uTGliL1VlZmlNZW1vcnlBbGxvY2F0aW9uTGli
LmluZgo+IEBAIC0yOTgsNyArMjk2LDYgQEAgW0xpYnJhcnlDbGFzc2VzLmNvbW1vbi5EWEVfUlVO
VElNRV9EUklWRVJdCj4gIAo+ICBbTGlicmFyeUNsYXNzZXMuY29tbW9uLlVFRklfRFJJVkVSXQo+
ICAgIFBjZExpYnxNZGVQa2cvTGlicmFyeS9EeGVQY2RMaWIvRHhlUGNkTGliLmluZgo+IC0gIFRp
bWVyTGlifE92bWZQa2cvTGlicmFyeS9BY3BpVGltZXJMaWIvRHhlQWNwaVRpbWVyTGliLmluZgo+
ICAgIEhvYkxpYnxNZGVQa2cvTGlicmFyeS9EeGVIb2JMaWIvRHhlSG9iTGliLmluZgo+ICAgIER4
ZUNvcmVFbnRyeVBvaW50fE1kZVBrZy9MaWJyYXJ5L0R4ZUNvcmVFbnRyeVBvaW50L0R4ZUNvcmVF
bnRyeVBvaW50LmluZgo+ICAgIE1lbW9yeUFsbG9jYXRpb25MaWJ8TWRlUGtnL0xpYnJhcnkvVWVm
aU1lbW9yeUFsbG9jYXRpb25MaWIvVWVmaU1lbW9yeUFsbG9jYXRpb25MaWIuaW5mCj4gQEAgLTMx
Myw3ICszMTAsNiBAQCBbTGlicmFyeUNsYXNzZXMuY29tbW9uLlVFRklfRFJJVkVSXQo+ICAKPiAg
W0xpYnJhcnlDbGFzc2VzLmNvbW1vbi5EWEVfRFJJVkVSXQo+ICAgIFBjZExpYnxNZGVQa2cvTGli
cmFyeS9EeGVQY2RMaWIvRHhlUGNkTGliLmluZgo+IC0gIFRpbWVyTGlifE92bWZQa2cvTGlicmFy
eS9BY3BpVGltZXJMaWIvRHhlQWNwaVRpbWVyTGliLmluZgo+ICAgIEhvYkxpYnxNZGVQa2cvTGli
cmFyeS9EeGVIb2JMaWIvRHhlSG9iTGliLmluZgo+ICAgIE1lbW9yeUFsbG9jYXRpb25MaWJ8TWRl
UGtnL0xpYnJhcnkvVWVmaU1lbW9yeUFsbG9jYXRpb25MaWIvVWVmaU1lbW9yeUFsbG9jYXRpb25M
aWIuaW5mCj4gICAgUmVwb3J0U3RhdHVzQ29kZUxpYnxNZGVNb2R1bGVQa2cvTGlicmFyeS9EeGVS
ZXBvcnRTdGF0dXNDb2RlTGliL0R4ZVJlcG9ydFN0YXR1c0NvZGVMaWIuaW5mCj4gQEAgLTMzNyw3
ICszMzMsNiBAQCBbTGlicmFyeUNsYXNzZXMuY29tbW9uLkRYRV9EUklWRVJdCj4gIAo+ICBbTGli
cmFyeUNsYXNzZXMuY29tbW9uLlVFRklfQVBQTElDQVRJT05dCj4gICAgUGNkTGlifE1kZVBrZy9M
aWJyYXJ5L0R4ZVBjZExpYi9EeGVQY2RMaWIuaW5mCj4gLSAgVGltZXJMaWJ8T3ZtZlBrZy9MaWJy
YXJ5L0FjcGlUaW1lckxpYi9EeGVBY3BpVGltZXJMaWIuaW5mCj4gICAgSG9iTGlifE1kZVBrZy9M
aWJyYXJ5L0R4ZUhvYkxpYi9EeGVIb2JMaWIuaW5mCj4gICAgTWVtb3J5QWxsb2NhdGlvbkxpYnxN
ZGVQa2cvTGlicmFyeS9VZWZpTWVtb3J5QWxsb2NhdGlvbkxpYi9VZWZpTWVtb3J5QWxsb2NhdGlv
bkxpYi5pbmYKPiAgICBSZXBvcnRTdGF0dXNDb2RlTGlifE1kZU1vZHVsZVBrZy9MaWJyYXJ5L0R4
ZVJlcG9ydFN0YXR1c0NvZGVMaWIvRHhlUmVwb3J0U3RhdHVzQ29kZUxpYi5pbmYKPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
