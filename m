Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1397616256D
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 12:22:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j40vO-0000X0-Q1; Tue, 18 Feb 2020 11:20:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bFjr=4G=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j40vN-0000Wu-Aa
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 11:20:21 +0000
X-Inumbo-ID: a4c70d8c-5240-11ea-8156-12813bfff9fa
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a4c70d8c-5240-11ea-8156-12813bfff9fa;
 Tue, 18 Feb 2020 11:20:20 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id p3so24383951edx.7
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2020 03:20:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l5JSEx/iPg8fHKLH7/ukYJIxUlGHcBEFlF+2VED3jI4=;
 b=m2xc6wXIEds4KvxuJGIG9gqZncPr3TVUDXU5neQNldgF5RmvyI3c7Jyg33a920YqDH
 MOXS54NkUTKkCACD8H+vbYlZnZjboRxm3E+IITggc+xwacWZfb12Vmmme5SvN+ZZxevk
 kEfYxDtNNEJjiuWMIq7wntTYeHFvadDcubg0W3cliieQBQ1aSPhACnlxRcNEGNirG46E
 C+Flazs5fs+ApwUu4Z2aTba9/kpfpMqixIYUlRG7qlBxJ42ugWAxk/p6xlgypqtiGK+K
 FP5Krl3llQCkKPq/xGssi96vto2zgwsA7w3242IqwLIZaU0Cb+LqjNym5+d7fCiCxHdM
 3qxA==
X-Gm-Message-State: APjAAAXP5bU1zABv0BnxmiL5qz9MguhKvWsmC56dGWGfnYEN5BfBxp44
 jrlgYFhoursdBxiSLC+ayDs=
X-Google-Smtp-Source: APXvYqwKtYDA/hShp7ZpXfOlUA5Y2d1F4yHnBCwWGifCkf25eJsceckgOcrwP1j/p73ParZjIVOrXw==
X-Received: by 2002:a05:6402:1a41:: with SMTP id
 bf1mr18801118edb.150.1582024819519; 
 Tue, 18 Feb 2020 03:20:19 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-226.amazon.com.
 [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id cb8sm98768ejb.42.2020.02.18.03.20.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2020 03:20:18 -0800 (PST)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200217184324.73762-1-roger.pau@citrix.com>
 <20200217184324.73762-4-roger.pau@citrix.com>
 <69fbdc2a-e64b-ff93-6392-661ca71a88a7@xen.org>
 <20200218094826.GP4679@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <2c8a52fb-ac7e-4b3c-2507-818be41293d6@xen.org>
Date: Tue, 18 Feb 2020 11:20:17 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200218094826.GP4679@Air-de-Roger>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2 3/6] x86: track when in #MC context
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUm9nZXIsCgpPbiAxOC8wMi8yMDIwIDA5OjQ4LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+
IE9uIE1vbiwgRmViIDE3LCAyMDIwIGF0IDA3OjI5OjI5UE0gKzAwMDAsIEp1bGllbiBHcmFsbCB3
cm90ZToKPj4gSGkgUm9nZXIsCj4+Cj4+IE9uIDE3LzAyLzIwMjAgMTg6NDMsIFJvZ2VyIFBhdSBN
b25uZSB3cm90ZToKPj4+IEFkZCBoZWxwZXJzIHRvIHRyYWNrIHdoZW4gZXhlY3V0aW5nIGluICNN
QyBjb250ZXh0LiBUaGlzIGlzIG1vZGVsZWQKPj4+IGFmdGVyIHRoZSBpbl9pcnEgaGVscGVycy4K
Pj4+Cj4+PiBOb3RlIHRoYXQgdGhlcmUgYXJlIG5vIHVzZXJzIG9mIGluX21jKCkgaW50cm9kdWNl
ZCBieSB0aGUgY2hhbmdlLAo+Pj4gZnVydGhlciB1c2VycyB3aWxsIGJlIGFkZGVkIGJ5IGZvbGxv
d3VwIGNoYW5nZXMuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4+PiAtLS0KPj4+ICAgIHhlbi9hcmNoL3g4Ni9jcHUvbWNoZWNr
L21jZS5jIHwgMiArKwo+Pj4gICAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9oYXJkaXJxLmggfCA1ICsr
KysrCj4+PiAgICB4ZW4vaW5jbHVkZS94ZW4vaXJxX2NwdXN0YXQuaCB8IDEgKwo+Pj4gICAgMyBm
aWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L2NwdS9tY2hlY2svbWNlLmMgYi94ZW4vYXJjaC94ODYvY3B1L21jaGVjay9tY2UuYwo+
Pj4gaW5kZXggZDYxZTU4MmFmMy4uOTNlZDU3NTJhYyAxMDA2NDQKPj4+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9jcHUvbWNoZWNrL21jZS5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvY3B1L21jaGVjay9t
Y2UuYwo+Pj4gQEAgLTkzLDcgKzkzLDkgQEAgdm9pZCB4ODZfbWNlX3ZlY3Rvcl9yZWdpc3Rlcih4
ODZfbWNlX3ZlY3Rvcl90IGhkbHIpCj4+PiAgICB2b2lkIGRvX21hY2hpbmVfY2hlY2soY29uc3Qg
c3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCj4+PiAgICB7Cj4+PiArICAgIG1jX2VudGVyKCk7
Cj4+PiAgICAgICAgX21hY2hpbmVfY2hlY2tfdmVjdG9yKHJlZ3MpOwo+Pj4gKyAgICBtY19leGl0
KCk7Cj4+PiAgICB9Cj4+PiAgICAvKgo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14
ODYvaGFyZGlycS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9oYXJkaXJxLmgKPj4+IGluZGV4IDM0
ZTFiNDkyNjAuLmFmM2VhYjZhNGQgMTAwNjQ0Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2
L2hhcmRpcnEuaAo+Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9oYXJkaXJxLmgKPj4+IEBA
IC04LDYgKzgsNyBAQCB0eXBlZGVmIHN0cnVjdCB7Cj4+PiAgICAJdW5zaWduZWQgaW50IF9fc29m
dGlycV9wZW5kaW5nOwo+Pj4gICAgCXVuc2lnbmVkIGludCBfX2xvY2FsX2lycV9jb3VudDsKPj4+
ICAgIAl1bnNpZ25lZCBpbnQgX19ubWlfY291bnQ7Cj4+PiArCXVuc2lnbmVkIGludCBtY19jb3Vu
dDsKPj4+ICAgIAlib29sX3QgX19td2FpdF93YWtldXA7Cj4+PiAgICB9IF9fY2FjaGVsaW5lX2Fs
aWduZWQgaXJxX2NwdXN0YXRfdDsKPj4+IEBAIC0xOCw2ICsxOSwxMCBAQCB0eXBlZGVmIHN0cnVj
dCB7Cj4+PiAgICAjZGVmaW5lIGlycV9lbnRlcigpCShsb2NhbF9pcnFfY291bnQoc21wX3Byb2Nl
c3Nvcl9pZCgpKSsrKQo+Pj4gICAgI2RlZmluZSBpcnFfZXhpdCgpCShsb2NhbF9pcnFfY291bnQo
c21wX3Byb2Nlc3Nvcl9pZCgpKS0tKQo+Pj4gKyNkZWZpbmUgaW5fbWMoKSAJKG1jX2NvdW50KHNt
cF9wcm9jZXNzb3JfaWQoKSkgIT0gMCkKPj4+ICsjZGVmaW5lIG1jX2VudGVyKCkJKG1jX2NvdW50
KHNtcF9wcm9jZXNzb3JfaWQoKSkrKykKPj4+ICsjZGVmaW5lIG1jX2V4aXQoKQkobWNfY291bnQo
c21wX3Byb2Nlc3Nvcl9pZCgpKS0tKQo+Pj4gKwo+Pj4gICAgdm9pZCBhY2tfYmFkX2lycSh1bnNp
Z25lZCBpbnQgaXJxKTsKPj4+ICAgIGV4dGVybiB2b2lkIGFwaWNfaW50cl9pbml0KHZvaWQpOwo+
Pj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9pcnFfY3B1c3RhdC5oIGIveGVuL2luY2x1
ZGUveGVuL2lycV9jcHVzdGF0LmgKPj4+IGluZGV4IDczNjI5ZjZlYzguLjEyYjkzMmZjMzkgMTAw
NjQ0Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vaXJxX2NwdXN0YXQuaAo+Pj4gKysrIGIveGVu
L2luY2x1ZGUveGVuL2lycV9jcHVzdGF0LmgKPj4+IEBAIC0yNiw1ICsyNiw2IEBAIGV4dGVybiBp
cnFfY3B1c3RhdF90IGlycV9zdGF0W107Cj4+PiAgICAjZGVmaW5lIGxvY2FsX2lycV9jb3VudChj
cHUpCV9fSVJRX1NUQVQoKGNwdSksIF9fbG9jYWxfaXJxX2NvdW50KQo+Pj4gICAgI2RlZmluZSBu
bWlfY291bnQoY3B1KQkJX19JUlFfU1RBVCgoY3B1KSwgX19ubWlfY291bnQpCj4+PiAgICAjZGVm
aW5lIG13YWl0X3dha2V1cChjcHUpCV9fSVJRX1NUQVQoKGNwdSksIF9fbXdhaXRfd2FrZXVwKQo+
Pj4gKyNkZWZpbmUgbWNfY291bnQoY3B1KQkJX19JUlFfU1RBVCgoY3B1KSwgbWNfY291bnQpCj4+
Cj4+IFRoZSBoZWFkZXIgaXMgb25seSBtZWFudCB0byBjb250YWluIGFyY2gtaW5kZXBlbmRlbnQg
SVJRIHN0YXRzIChzZWUgY29tbWVudAo+PiBhIGZldyBsaW5lcyBhYm92ZSkuIFRoaXMgaXMgdW5s
aWtlbHkgdG8gYmUgdXNlZCBvbiBBcm0sIHNvIGNhbiB5b3UgbW92ZSB0aGlzCj4+IGludG8gYW4g
eDg2IHNwZWNpZmljIGhlYWRlcj8KPiAKPiBOb3cgdGhhdCBJIGxvb2sgYXQgaXQsIHRoZXJlJ3Mg
YWxzbyBubWlfY291bnQgYW5kIG13YWl0X3dha2V1cCBkZWZpbmVkCj4gaW4gaXJxX2NwdXN0YXQu
aCB3aGljaCB3b24ndCBidWlsZCBpZiB1c2VkIG9uIEFybSwgc2luY2UgdGhlIGZpZWxkcwo+IGRv
bid0IGV4aXN0IGluIHRoZSBBcm0gdmVyc2lvbiBvZiBpcnFfY3B1c3RhdF90LgoKSSB3b3VsZCBw
cmVmZXIgaWYgd2UgZG9uJ3QgaW50cm9kdWNlIG1vcmUgY2FzZXMgaW4geGVuL2lycV9jcHVzdGF0
LmguIEl0IAp3b3VsZCBiZSBnb29kIHRvIHJlbW92ZSBubWlfY291bnQoKSBhbmQgbXdhaXRfd2Fr
ZXVwKCkgZnJvbSB0aGUgY29tbW9uIApoZWFkZXIsIGJ1dCB0aGF0J3MgYSBzZXBhcmF0ZSBjbGVh
bnVwLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
