Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5142217A937
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 16:50:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9siQ-0000TA-Va; Thu, 05 Mar 2020 15:47:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YWue=4W=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1j9siO-0000T5-Vw
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 15:47:13 +0000
X-Inumbo-ID: 92816b2e-5ef8-11ea-b52f-bc764e2007e4
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92816b2e-5ef8-11ea-b52f-bc764e2007e4;
 Thu, 05 Mar 2020 15:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7zaRKGsS0ZE69bPjVfBfvoMx3pCqo5nNA7n4fl7ujvw=; b=Jz13duDqLs43Wm1XWWqVFYDdVi
 uowHRKPtI85xiEhqC1CHiWIVqwu5o8osd2w3ocR/lktYKldMi/jWfzSYsehwW7zq6dHMTyWbdu9of
 OcmlvvPoZNMZ8i2Bb0effUlmmp2LE+ytNWqNMJMjKcWcOxVSE0totMaCx8pF35QZpVMA=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:54264
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1j9skC-0005zf-Kp; Thu, 05 Mar 2020 16:49:04 +0100
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200305114044.20235-1-jgross@suse.com>
 <20200305124255.GW24458@Air-de-Roger.citrite.net>
 <c2c1573a-8c98-4a99-64fb-1346ee724d08@suse.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <68f09f4e-180f-0fb7-c329-f3f03be72eb6@eikelenboom.it>
Date: Thu, 5 Mar 2020 16:47:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c2c1573a-8c98-4a99-64fb-1346ee724d08@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/blkfront: fix ring info addressing
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
Cc: Jens Axboe <axboe@kernel.dk>, Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUvMDMvMjAyMCAxNDo0MCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwNS4wMy4yMCAx
Mzo0MiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4gT24gVGh1LCBNYXIgMDUsIDIwMjAgYXQg
MTI6NDA6NDRQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+IENvbW1pdCAwMjY1ZDZl
OGRkYjg5MCAoInhlbi9ibGtmcm9udDogbGltaXQgYWxsb2NhdGVkIG1lbW9yeSBzaXplIHRvCj4+
PiBhY3R1YWwgdXNlIGNhc2UiKSBtYWRlIHN0cnVjdCBibGtmcm9udF9yaW5nX2luZm8gc2l6ZSBk
eW5hbWljLiBUaGlzIGlzCj4+PiBmaW5lIHdoZW4gcnVubmluZyB3aXRoIG9ubHkgb25lIHF1ZXVl
LCBidXQgd2l0aCBtdWx0aXBsZSBxdWV1ZXMgdGhlCj4+PiBhZGRyZXNzaW5nIG9mIHRoZSBzaW5n
bGUgcXVldWVzIGhhcyB0byBiZSBhZGFwdGVkIGFzIHRoZSBzdHJ1Y3RzIGFyZQo+Pj4gYWxsb2Nh
dGVkIGluIGFuIGFycmF5Lgo+Pj4KPj4+IEZpeGVzOiAwMjY1ZDZlOGRkYjg5MCAoInhlbi9ibGtm
cm9udDogbGltaXQgYWxsb2NhdGVkIG1lbW9yeSBzaXplIHRvIGFjdHVhbCB1c2UgY2FzZSIpCj4+
PiBSZXBvcnRlZC1ieTogU2FuZGVyIEVpa2VsZW5ib29tIDxsaW51eEBlaWtlbGVuYm9vbS5pdD4K
Pj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4+IC0t
LQo+Pj4gVjI6Cj4+PiAtIGdldCByaWQgb2YgcmluZm9fcHRyKCkgaGVscGVyCj4+PiAtIHVzZSBw
cm9wZXIgcGFyZW50aGVzaXMgaW4gZm9yX2VhY2hfcmluZm8oKQo+Pj4gLSByZW5hbWUgcmluZm8g
cGFyYW1ldGVyIG9mIGZvcl9lYWNoX3JpbmZvKCkKPj4+IC0tLQo+Pj4gICBkcml2ZXJzL2Jsb2Nr
L3hlbi1ibGtmcm9udC5jIHwgNzkgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDM3IGRlbGV0
aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5j
IGIvZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYwo+Pj4gaW5kZXggZTJhZDZiYmEyMjgxLi44
ZTg0NGRhODI2ZGIgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5j
Cj4+PiArKysgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jCj4+PiBAQCAtMjEzLDYgKzIx
Myw3IEBAIHN0cnVjdCBibGtmcm9udF9pbmZvCj4+PiAgIAlzdHJ1Y3QgYmxrX21xX3RhZ19zZXQg
dGFnX3NldDsKPj4+ICAgCXN0cnVjdCBibGtmcm9udF9yaW5nX2luZm8gKnJpbmZvOwo+Pj4gICAJ
dW5zaWduZWQgaW50IG5yX3JpbmdzOwo+Pj4gKwl1bnNpZ25lZCBpbnQgcmluZm9fc2l6ZTsKPj4+
ICAgCS8qIFNhdmUgdW5jb21wbGV0ZSByZXFzIGFuZCBiaW9zIGZvciBtaWdyYXRpb24uICovCj4+
PiAgIAlzdHJ1Y3QgbGlzdF9oZWFkIHJlcXVlc3RzOwo+Pj4gICAJc3RydWN0IGJpb19saXN0IGJp
b19saXN0Owo+Pj4gQEAgLTI1OSw2ICsyNjAsMTggQEAgc3RhdGljIGludCBibGtmcm9udF9zZXR1
cF9pbmRpcmVjdChzdHJ1Y3QgYmxrZnJvbnRfcmluZ19pbmZvICpyaW5mbyk7Cj4+PiAgIHN0YXRp
YyB2b2lkIGJsa2Zyb250X2dhdGhlcl9iYWNrZW5kX2ZlYXR1cmVzKHN0cnVjdCBibGtmcm9udF9p
bmZvICppbmZvKTsKPj4+ICAgc3RhdGljIGludCBuZWdvdGlhdGVfbXEoc3RydWN0IGJsa2Zyb250
X2luZm8gKmluZm8pOwo+Pj4gICAKPj4+ICsjZGVmaW5lIGZvcl9lYWNoX3JpbmZvKGluZm8sIHB0
ciwgaWR4KQkJCQlcCj4+PiArCWZvciAoKHB0cikgPSAoaW5mbyktPnJpbmZvLCAoaWR4KSA9IDA7
CQkJXAo+Pj4gKwkgICAgIChpZHgpIDwgKGluZm8pLT5ucl9yaW5nczsJCQkJXAo+Pj4gKwkgICAg
IChpZHgpKyssIChwdHIpID0gKHZvaWQgKikocHRyKSArIChpbmZvKS0+cmluZm9fc2l6ZSkKPj4+
ICsKPj4+ICtzdGF0aWMgc3RydWN0IGJsa2Zyb250X3JpbmdfaW5mbyAqZ2V0X3JpbmZvKHN0cnVj
dCBibGtmcm9udF9pbmZvICppbmZvLAo+Pgo+PiBJIHN0aWxsIHRoaW5rIGlubGluZSBzaG91bGQg
YmUgYWRkZWQgaGVyZSwgYnV0IEkgZG9uJ3QgaGF2ZSBzdWNoIGEKPj4gc3Ryb25nIG9waW5pb24g
dG8gYmxvY2sgdGhlIHBhdGNoIG9uIGl0Lgo+IAo+IEkgY2FuIGFkZCBpdCBpZiB5b3UgbGlrZSB0
aGF0IGJldHRlci4gV29uJ3QgbWFrZSBtdWNoIGRpZmZlcmVuY2UgaW4gdGhlCj4gZW5kLgo+IAo+
PiBBbHNvLCBpbmZvIHNob3VsZCBiZSBjb25zdGlmaWVkIEFGQUlDVC4KPiAKPiBZZXMuCj4gCj4+
Cj4+IFdpdGggYXQgbGVhc3QgaW5mbyBjb25zdGlmaWVkOgo+Pgo+PiBBY2tlZC1ieTogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+Cj4+IENhbiB5b3UgcXVldWUgdGhp
cyB0aHJvdWdoIHRoZSBYZW4gdHJlZT8KPiAKPiBTdXJlLgo+IAo+IAo+IEp1ZXJnZW4KPiAKCkp1
c3QgdGVzdGVkIHYyIGFuZCBpdCB3b3JrcyBmb3IgbWUsIHRoYW5rcyAhCgotLQpTYW5kZXIKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
