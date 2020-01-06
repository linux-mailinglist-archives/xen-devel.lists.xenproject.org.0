Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3431318F0
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 20:59:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioYUK-00032e-J0; Mon, 06 Jan 2020 19:56:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XhR8=23=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ioYUJ-00032Z-1q
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 19:56:31 +0000
X-Inumbo-ID: a15c1b7a-30be-11ea-ab62-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a15c1b7a-30be-11ea-ab62-12813bfff9fa;
 Mon, 06 Jan 2020 19:56:30 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p9so16317131wmc.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2020 11:56:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v5tzGQVUuACRpkfN3F+OsSWeb6OYqiqrQQ+U/uGqU9s=;
 b=d631x+j0LM2dJ/uwwbszQrPfgpvavtH/+fL8BuNh0iEg1tLmvRUX+fi+Qtuk6w/ekd
 SVBBqz+r3mdyFAca5K/9VWoIaVzwICU4l+NkF8f6eT7qattmNMnX1q8fVSmby6Gs29Uu
 E35rYv6aZFdD33QFORTEnyUbj5g1ddBQL60XYnl5X0V03v7Mh+GNuwgyORW5k2lGCeq2
 XU5C4wK4f4rbQdwYekJn4ALdV8sluL4oZCBCBh9yATFhlmJj91z/gzveaeqG7AiWfmLA
 xzmzmmQfbBndTA5I3+WjCKgBY5h2/xX/cJ9mYBHiFz1sIlgxqRtZUfpFxQPLccxwS4Dc
 c9XA==
X-Gm-Message-State: APjAAAW5YoasVSFtAWOkuhGobpU4CoZnOTc3c26BhZL6u5e+zE6cH7hu
 y3x+hucsOlk8b8O1L0CcvFQ=
X-Google-Smtp-Source: APXvYqwKM4lCfXBAqc7bUF1JsaDABVlhmn3G3is29fqNpuGeZ8tNNDyB5Jq3DPXCDsH3zJHr+UqyRg==
X-Received: by 2002:a1c:96c4:: with SMTP id
 y187mr37115858wmd.112.1578340589327; 
 Mon, 06 Jan 2020 11:56:29 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id f12sm23966537wmf.28.2020.01.06.11.56.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2020 11:56:28 -0800 (PST)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20200106182620.19505-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <e41ce699-422a-a2a3-f3a3-ff005df0e9bd@xen.org>
Date: Mon, 6 Jan 2020 19:56:27 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200106182620.19505-1-sstabellini@kernel.org>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/arm: during efi boot,
 improve the check for usable memory
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
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDA2LzAxLzIwMjAgMTg6MjYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBXaGVuIGJvb3RpbmcgdmlhIEVGSSwgdGhlIEVGSSBtZW1vcnkgbWFwIGhhcyBpbmZvcm1h
dGlvbiBhYm91dCBtZW1vcnkKPiByZWdpb25zIGFuZCB0aGVpciB0eXBlLiBJbXByb3ZlIHRoZSBj
aGVjayBmb3IgdGhlIHR5cGUgYW5kIGF0dHJpYnV0ZSBvZgo+IGVhY2ggbWVtb3J5IHJlZ2lvbiB0
byBmaWd1cmUgb3V0IHdoZXRoZXIgaXQgaXMgdXNhYmxlIG1lbW9yeSBvciBub3QuCj4gVGhpcyBw
YXRjaCBicmluZ3MgdGhlIGNoZWNrIG9uIHBhciB3aXRoIExpbnV4IGFuZCBtYWtlcyBtb3JlIG1l
bW9yeQo+IHJldXNhYmxlIGFzIG5vcm1hbCBtZW1vcnkgYnkgWGVuLgoKUGxlYXNlIG1lbnRpb24g
dGhlIHZlcnNpb24gb2YgTGludXggdXNlZC4KCkZ1cnRoZXJtb3JlLCBhcyBJIHBvaW50ZWQgb3V0
IGluIHRoZSBvcmlnaW5hbCB0aHJlYWQsIGl0IG1heSBub3QgYmUgCmNvcnJlY3QgZm9yIFhlbiB0
byB1c2UgdGhlIGV4YWN0IHNhbWUgY2hlY2tzIGFzIExpbnV4LiBNb3JlIGltcG9ydGFudGx5IAph
bnkgY2hhbmdlIGluIGJlaGF2aW9yIHNob3VsZCBiZSBleHBsYWluZWQgaW4gdGhlIGNvbW1pdCBt
ZXNzYWdlLiBGb3IgCmluc3RhbmNlLi4uCgo+IAo+IFJlcG9ydGVkLWJ5OiBSb21hbiBTaGFwb3No
bmlrIDxyb21hbkB6ZWRlZGEuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3RlZmFuby5zdGFiZWxsaW5pQHhpbGlueC5jb20+Cj4gQ0M6IEp1bGllbiBHcmFsbCA8anVs
aWVuQHhlbi5vcmc+Cj4gLS0tCj4gICB4ZW4vYXJjaC9hcm0vZWZpL2VmaS1ib290LmggfCAxMSAr
KysrKysrLS0tLQo+ICAgeGVuL2luY2x1ZGUvZWZpL2VmaWRlZi5oICAgIHwgIDEgKwo+ICAgMiBm
aWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL2FybS9lZmkvZWZpLWJvb3QuaCBiL3hlbi9hcmNoL2FybS9lZmkvZWZp
LWJvb3QuaAo+IGluZGV4IGQ3YmY5MzQwNzcuLjVkMWQ1MjZkMTcgMTAwNjQ0Cj4gLS0tIGEveGVu
L2FyY2gvYXJtL2VmaS9lZmktYm9vdC5oCj4gKysrIGIveGVuL2FyY2gvYXJtL2VmaS9lZmktYm9v
dC5oCj4gQEAgLTE0OSwxMCArMTQ5LDEzIEBAIHN0YXRpYyBFRklfU1RBVFVTIF9faW5pdCBlZmlf
cHJvY2Vzc19tZW1vcnlfbWFwX2Jvb3RpbmZvKEVGSV9NRU1PUllfREVTQ1JJUFRPUiAqCj4gICAK
PiAgICAgICBmb3IgKCBJbmRleCA9IDA7IEluZGV4IDwgKG1tYXBfc2l6ZSAvIGRlc2Nfc2l6ZSk7
IEluZGV4KysgKQo+ICAgICAgIHsKPiAtICAgICAgICBpZiAoIGRlc2NfcHRyLT5UeXBlID09IEVm
aUNvbnZlbnRpb25hbE1lbW9yeSB8fAo+IC0gICAgICAgICAgICAgKCFtYXBfYnMgJiYKCi4uLiB0
aGUgYmVoYXZpb3Igd2hlbiB0aGUgb3B0aW9uIC9tYXBicyBpcyBnaXZlbiB0byB0aGUgRUZJIHN0
dWIgd2lsbCAKbm93IGNoYW5nZS4gV2h5IHN1Y2ggY2hhbmdlPwoKPiAtICAgICAgICAgICAgICAo
ZGVzY19wdHItPlR5cGUgPT0gRWZpQm9vdFNlcnZpY2VzQ29kZSB8fAo+IC0gICAgICAgICAgICAg
ICBkZXNjX3B0ci0+VHlwZSA9PSBFZmlCb290U2VydmljZXNEYXRhKSkgKQo+ICsgICAgICAgIGlm
ICggZGVzY19wdHItPkF0dHJpYnV0ZSAmIEVGSV9NRU1PUllfV0IgJiYKPiArICAgICAgICAgICAg
IChkZXNjX3B0ci0+VHlwZSA9PSBFZmlDb252ZW50aW9uYWxNZW1vcnkgfHwKPiArICAgICAgICAg
ICAgICBkZXNjX3B0ci0+VHlwZSA9PSBFZmlMb2FkZXJDb2RlIHx8Cj4gKyAgICAgICAgICAgICAg
ZGVzY19wdHItPlR5cGUgPT0gRWZpTG9hZGVyRGF0YSB8fAo+ICsgICAgICAgICAgICAgIGRlc2Nf
cHRyLT5UeXBlID09IEVmaVBlcnNpc3RlbnRNZW1vcnkgfHwKCkkgYW0gbm90IGVudGlyZWx5IGNv
bnZpbmNlIHRoaXMgaXMgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvLiBGcm9tIG15IAp1bmRlcnN0YW5k
aW5nLCBhIHJlZ2lvbiBtYXJrZWQgYXMgRWZpUGVyc2lzdGVudE1lbW9yeSB3aWxsIGtlZXAgdGhl
IApzdGF0ZSBvZiBtZW1vcnkgYWNjcm9zcyBwb3dlciBjeWNsZS4KCkFzIHRoZSBtZW1vcnkgd2ls
bCBiZSBnaXZlbiB0byB0aGUgWGVuIGFsbG9jYXRvciBkaXJlY3RseSwgdGhpcyBtZWFucyAKc29t
ZSBkb21haW5zIG1heSByYW5kb21seSBoYXZlIHRoZXJlIGRhdGEgcGxhY2VkIGluIHRoZSBOVk0u
IFdvdWxkbid0IAp0aGlzIGJlIGNvbnNpZGVyZWQgYXMgYSBsZWFrIG9mIGRhdGE/Cgo+ICsgICAg
ICAgICAgICAgIGRlc2NfcHRyLT5UeXBlID09IEVmaUJvb3RTZXJ2aWNlc0NvZGUgfHwKPiArICAg
ICAgICAgICAgICBkZXNjX3B0ci0+VHlwZSA9PSBFZmlCb290U2VydmljZXNEYXRhKSApCj4gICAg
ICAgICAgIHsKPiAgICAgICAgICAgICAgIGlmICggIW1lbWluZm9fYWRkX2JhbmsoJmJvb3RpbmZv
Lm1lbSwgZGVzY19wdHIpICkKPiAgICAgICAgICAgICAgIHsKPiBkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUvZWZpL2VmaWRlZi5oIGIveGVuL2luY2x1ZGUvZWZpL2VmaWRlZi5oCj4gaW5kZXggODZh
N2UxMTFiZi4uZjQ2MjA3ODQwZiAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9lZmkvZWZpZGVm
LmgKPiArKysgYi94ZW4vaW5jbHVkZS9lZmkvZWZpZGVmLmgKPiBAQCAtMTQ3LDYgKzE0Nyw3IEBA
IHR5cGVkZWYgZW51bSB7Cj4gICAgICAgRWZpTWVtb3J5TWFwcGVkSU8sCj4gICAgICAgRWZpTWVt
b3J5TWFwcGVkSU9Qb3J0U3BhY2UsCj4gICAgICAgRWZpUGFsQ29kZSwKPiArICAgIEVmaVBlcnNp
c3RlbnRNZW1vcnksCj4gICAgICAgRWZpTWF4TWVtb3J5VHlwZQo+ICAgfSBFRklfTUVNT1JZX1RZ
UEU7Cj4gICAKPiAKCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
