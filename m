Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B7F161BA5
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 20:32:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3m5G-0005dZ-JB; Mon, 17 Feb 2020 19:29:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYIl=4F=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j3m5E-0005dS-Vy
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 19:29:33 +0000
X-Inumbo-ID: d262e91a-51bb-11ea-ade5-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d262e91a-51bb-11ea-ade5-bc764e2007e4;
 Mon, 17 Feb 2020 19:29:32 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z3so21181755wru.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2020 11:29:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mXpS1CjcVkS56TKDeIISbJfdp2uBnKSoiKLnoF29xTQ=;
 b=PK3zIPx3EbVDkKuPIKFymtrM1FWO7ksaSsF264YutVB/Z5xfnNdxEy2jHcUxrdc8Z8
 3qMkKf1VoAYm/OEfn4xyd2reTpR8Qmf5Ar9u/1/WdzK/E3lUpvsa3vylRLbnczx9G4Vg
 9mpLqDpLb1lF9nd1ir7zJ2mW5j6R68ZOxkpdeZ+4mgXL8Z8+pXO7BIXW3gPLA0PUSHxR
 A24ZTuu7Pjn0MdBgMciMh/RQogUtEDVd8/P3TH1z842CwQAT6EmP4heeS/RXXSgQgTXF
 0bRAxGu/c6BKpL89XLejG1b8PiV4+EqNqmH+sMvQLBtXXwtxKFb53Ou4BhbHFVpsIvdf
 dEew==
X-Gm-Message-State: APjAAAVGG4pRZBomGd1T14Kab9hWfVXnaG2O82liQ7kxMc2XZdPV2Aus
 eJA7b6UFDtpHrDdwbMe6M9A=
X-Google-Smtp-Source: APXvYqyE+Rtk8C2SVmVN0T2OGz/6e5SjB23g6BHctJwPE5kuHwI0ud/6zehqNUctqNavTrFKlFjECQ==
X-Received: by 2002:a5d:4ac8:: with SMTP id y8mr23464253wrs.272.1581967771403; 
 Mon, 17 Feb 2020 11:29:31 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-239.amazon.com.
 [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id x21sm473976wmi.30.2020.02.17.11.29.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 11:29:30 -0800 (PST)
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20200217184324.73762-1-roger.pau@citrix.com>
 <20200217184324.73762-4-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <69fbdc2a-e64b-ff93-6392-661ca71a88a7@xen.org>
Date: Mon, 17 Feb 2020 19:29:29 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200217184324.73762-4-roger.pau@citrix.com>
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUm9nZXIsCgpPbiAxNy8wMi8yMDIwIDE4OjQzLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4g
QWRkIGhlbHBlcnMgdG8gdHJhY2sgd2hlbiBleGVjdXRpbmcgaW4gI01DIGNvbnRleHQuIFRoaXMg
aXMgbW9kZWxlZAo+IGFmdGVyIHRoZSBpbl9pcnEgaGVscGVycy4KPiAKPiBOb3RlIHRoYXQgdGhl
cmUgYXJlIG5vIHVzZXJzIG9mIGluX21jKCkgaW50cm9kdWNlZCBieSB0aGUgY2hhbmdlLAo+IGZ1
cnRoZXIgdXNlcnMgd2lsbCBiZSBhZGRlZCBieSBmb2xsb3d1cCBjaGFuZ2VzLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IC0tLQo+
ICAgeGVuL2FyY2gveDg2L2NwdS9tY2hlY2svbWNlLmMgfCAyICsrCj4gICB4ZW4vaW5jbHVkZS9h
c20teDg2L2hhcmRpcnEuaCB8IDUgKysrKysKPiAgIHhlbi9pbmNsdWRlL3hlbi9pcnFfY3B1c3Rh
dC5oIHwgMSArCj4gICAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvY3B1L21jaGVjay9tY2UuYyBiL3hlbi9hcmNoL3g4Ni9jcHUv
bWNoZWNrL21jZS5jCj4gaW5kZXggZDYxZTU4MmFmMy4uOTNlZDU3NTJhYyAxMDA2NDQKPiAtLS0g
YS94ZW4vYXJjaC94ODYvY3B1L21jaGVjay9tY2UuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUv
bWNoZWNrL21jZS5jCj4gQEAgLTkzLDcgKzkzLDkgQEAgdm9pZCB4ODZfbWNlX3ZlY3Rvcl9yZWdp
c3Rlcih4ODZfbWNlX3ZlY3Rvcl90IGhkbHIpCj4gICAKPiAgIHZvaWQgZG9fbWFjaGluZV9jaGVj
ayhjb25zdCBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKPiAgIHsKPiArICAgIG1jX2VudGVy
KCk7Cj4gICAgICAgX21hY2hpbmVfY2hlY2tfdmVjdG9yKHJlZ3MpOwo+ICsgICAgbWNfZXhpdCgp
Owo+ICAgfQo+ICAgCj4gICAvKgo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2hh
cmRpcnEuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaGFyZGlycS5oCj4gaW5kZXggMzRlMWI0OTI2
MC4uYWYzZWFiNmE0ZCAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2hhcmRpcnEu
aAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaGFyZGlycS5oCj4gQEAgLTgsNiArOCw3IEBA
IHR5cGVkZWYgc3RydWN0IHsKPiAgIAl1bnNpZ25lZCBpbnQgX19zb2Z0aXJxX3BlbmRpbmc7Cj4g
ICAJdW5zaWduZWQgaW50IF9fbG9jYWxfaXJxX2NvdW50Owo+ICAgCXVuc2lnbmVkIGludCBfX25t
aV9jb3VudDsKPiArCXVuc2lnbmVkIGludCBtY19jb3VudDsKPiAgIAlib29sX3QgX19td2FpdF93
YWtldXA7Cj4gICB9IF9fY2FjaGVsaW5lX2FsaWduZWQgaXJxX2NwdXN0YXRfdDsKPiAgIAo+IEBA
IC0xOCw2ICsxOSwxMCBAQCB0eXBlZGVmIHN0cnVjdCB7Cj4gICAjZGVmaW5lIGlycV9lbnRlcigp
CShsb2NhbF9pcnFfY291bnQoc21wX3Byb2Nlc3Nvcl9pZCgpKSsrKQo+ICAgI2RlZmluZSBpcnFf
ZXhpdCgpCShsb2NhbF9pcnFfY291bnQoc21wX3Byb2Nlc3Nvcl9pZCgpKS0tKQo+ICAgCj4gKyNk
ZWZpbmUgaW5fbWMoKSAJKG1jX2NvdW50KHNtcF9wcm9jZXNzb3JfaWQoKSkgIT0gMCkKPiArI2Rl
ZmluZSBtY19lbnRlcigpCShtY19jb3VudChzbXBfcHJvY2Vzc29yX2lkKCkpKyspCj4gKyNkZWZp
bmUgbWNfZXhpdCgpCShtY19jb3VudChzbXBfcHJvY2Vzc29yX2lkKCkpLS0pCj4gKwo+ICAgdm9p
ZCBhY2tfYmFkX2lycSh1bnNpZ25lZCBpbnQgaXJxKTsKPiAgIAo+ICAgZXh0ZXJuIHZvaWQgYXBp
Y19pbnRyX2luaXQodm9pZCk7Cj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9pcnFfY3B1
c3RhdC5oIGIveGVuL2luY2x1ZGUveGVuL2lycV9jcHVzdGF0LmgKPiBpbmRleCA3MzYyOWY2ZWM4
Li4xMmI5MzJmYzM5IDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9pcnFfY3B1c3RhdC5o
Cj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2lycV9jcHVzdGF0LmgKPiBAQCAtMjYsNSArMjYsNiBA
QCBleHRlcm4gaXJxX2NwdXN0YXRfdCBpcnFfc3RhdFtdOwo+ICAgI2RlZmluZSBsb2NhbF9pcnFf
Y291bnQoY3B1KQlfX0lSUV9TVEFUKChjcHUpLCBfX2xvY2FsX2lycV9jb3VudCkKPiAgICNkZWZp
bmUgbm1pX2NvdW50KGNwdSkJCV9fSVJRX1NUQVQoKGNwdSksIF9fbm1pX2NvdW50KQo+ICAgI2Rl
ZmluZSBtd2FpdF93YWtldXAoY3B1KQlfX0lSUV9TVEFUKChjcHUpLCBfX213YWl0X3dha2V1cCkK
PiArI2RlZmluZSBtY19jb3VudChjcHUpCQlfX0lSUV9TVEFUKChjcHUpLCBtY19jb3VudCkKClRo
ZSBoZWFkZXIgaXMgb25seSBtZWFudCB0byBjb250YWluIGFyY2gtaW5kZXBlbmRlbnQgSVJRIHN0
YXRzIChzZWUgCmNvbW1lbnQgYSBmZXcgbGluZXMgYWJvdmUpLiBUaGlzIGlzIHVubGlrZWx5IHRv
IGJlIHVzZWQgb24gQXJtLCBzbyBjYW4gCnlvdSBtb3ZlIHRoaXMgaW50byBhbiB4ODYgc3BlY2lm
aWMgaGVhZGVyPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
