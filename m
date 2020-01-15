Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB4213BD5E
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 11:28:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irfr9-0002uK-UC; Wed, 15 Jan 2020 10:24:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9sUE=3E=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1irfr8-0002uB-7m
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 10:24:58 +0000
X-Inumbo-ID: 4265250c-3781-11ea-a985-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4265250c-3781-11ea-a985-bc764e2007e4;
 Wed, 15 Jan 2020 10:24:49 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id q6so15108257wro.9
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2020 02:24:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/HvFR7I78N0Pw3XxajGLjLMwbQF8tm5rLmajbVnIcjo=;
 b=UgZaU2YS+j/h1eRcMascdz4IMqy9pwlFMVfAQwz47pnDtsK5Hc2oLcRU1j1ehJz13V
 x0JLaUW7AuxMw3CvEQz68SK43uZgAUvbJLz/nftfkUerVRqSHN4nAttD4PxJ2BTy3BzY
 0RyiYY+3x+ZghQ1awnXQH8tkaeuIa9B+6LKYcwH2/Z6BXDUVtstcmAfBiK/UXYeabEAq
 okHZu0nllnW8ei8kLVdPVuyVWNhHTubDDnkJPFhrPN8RdkCmgD8wUHZNNzV33ERj8s7E
 UiSr1DPUMC0aUPr3xZ0bFQj0ll4sqbeW+kBQth0rTuRZmUgryhoZizpKILOGBr2TCbjP
 6UcA==
X-Gm-Message-State: APjAAAUitmhj2RcAaFrKi7T0Mo/huhwZa8fO6KHZVpOaik8lR5xJKac9
 ZVFHW7/SuSF+wsQ+SDFjqtk=
X-Google-Smtp-Source: APXvYqwKqLLiyQe4BILyNZxRzq1tfcdaAE6o9YGAB0HUZTI2f5gnkz0aeTSnvHMYspVrBmjonvMrJA==
X-Received: by 2002:adf:fac1:: with SMTP id a1mr29526794wrs.376.1579083888716; 
 Wed, 15 Jan 2020 02:24:48 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id e8sm24020027wrt.7.2020.01.15.02.24.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 02:24:48 -0800 (PST)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20200114233155.26411-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <d130b59a-01de-17f1-0503-ebb291b2952a@xen.org>
Date: Wed, 15 Jan 2020 10:24:47 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200114233155.26411-1-sstabellini@kernel.org>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: during efi boot,
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

SGkgU3RlZmFubywKCk9uIDE0LzAxLzIwMjAgMjM6MzEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBXaGVuIGJvb3RpbmcgdmlhIEVGSSwgdGhlIEVGSSBtZW1vcnkgbWFwIGhhcyBpbmZvcm1h
dGlvbiBhYm91dCBtZW1vcnkKPiByZWdpb25zIGFuZCB0aGVpciB0eXBlLiBJbXByb3ZlIHRoZSBj
aGVjayBmb3IgdGhlIHR5cGUgYW5kIGF0dHJpYnV0ZSBvZgo+IGVhY2ggbWVtb3J5IHJlZ2lvbiB0
byBmaWd1cmUgb3V0IHdoZXRoZXIgaXQgaXMgdXNhYmxlIG1lbW9yeSBvciBub3QuCj4gVGhpcyBw
YXRjaCBicmluZ3MgdGhlIGNoZWNrIG9uIHBhciB3aXRoIExpbnV4IHY1LjUtcmM2IGFuZCBtYWtl
cyBtb3JlCj4gbWVtb3J5IHJldXNhYmxlIGFzIG5vcm1hbCBtZW1vcnkgYnkgWGVuIChleGNlcHQg
dGhhdCBMaW51eCBhbHNvIHJldXNlcwo+IEVGSV9QRVJTSVNURU5UX01FTU9SWSwgd2hpY2ggd2Ug
ZG8gbm90KS4KPiAKPiBTcGVjaWZpY2FsbHksIHRoaXMgcGF0Y2ggYWxzbyByZXVzZXMgbWVtb3J5
IG1hcmtlZCBhcwo+IEVmaUxvYWRlckNvZGUvRGF0YSwgYW5kIGl0IHVzZXMgYm90aCBBdHRyaWJ1
dGUgYW5kIFR5cGUgZm9yIHRoZSBjaGVjawo+IChBdHRyaWJ1dGUgbmVlZHMgdG8gYmUgRUZJX01F
TU9SWV9XQikuCj4gCj4gUmVwb3J0ZWQtYnk6IFJvbWFuIFNoYXBvc2huaWsgPHJvbWFuQHplZGVk
YS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJl
bGxpbmlAeGlsaW54LmNvbT4KPiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KCkFj
a2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgoKQ2hlZXJzLAoKPiAKPiAtLS0K
PiBDaGFuZ2VzIGluIHYyOgo+IC0gaW1wcm92ZSBjb21taXQgbWVzc2FnZQo+IC0gZG8gbm90IGFs
bG9jYXRlIG1lbW9yeSBtYXJrZWQgYXMgRUZJX1BFUlNJU1RFTlRfTUVNT1JZCj4gLSBkbyBub3Qg
Y2hhbmdlIG1hcF9icycgYmVoYXZpb3IKPiAtLS0KPiAgIHhlbi9hcmNoL2FybS9lZmkvZWZpLWJv
b3QuaCB8IDExICsrKysrKystLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZWZpL2VmaS1i
b290LmggYi94ZW4vYXJjaC9hcm0vZWZpL2VmaS1ib290LmgKPiBpbmRleCBkN2JmOTM0MDc3Li42
NTI3Y2IwYmRmIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9lZmkvZWZpLWJvb3QuaAo+ICsr
KyBiL3hlbi9hcmNoL2FybS9lZmkvZWZpLWJvb3QuaAo+IEBAIC0xNDksMTAgKzE0OSwxMyBAQCBz
dGF0aWMgRUZJX1NUQVRVUyBfX2luaXQgZWZpX3Byb2Nlc3NfbWVtb3J5X21hcF9ib290aW5mbyhF
RklfTUVNT1JZX0RFU0NSSVBUT1IgKgo+ICAgCj4gICAgICAgZm9yICggSW5kZXggPSAwOyBJbmRl
eCA8IChtbWFwX3NpemUgLyBkZXNjX3NpemUpOyBJbmRleCsrICkKPiAgICAgICB7Cj4gLSAgICAg
ICAgaWYgKCBkZXNjX3B0ci0+VHlwZSA9PSBFZmlDb252ZW50aW9uYWxNZW1vcnkgfHwKPiAtICAg
ICAgICAgICAgICghbWFwX2JzICYmCj4gLSAgICAgICAgICAgICAgKGRlc2NfcHRyLT5UeXBlID09
IEVmaUJvb3RTZXJ2aWNlc0NvZGUgfHwKPiAtICAgICAgICAgICAgICAgZGVzY19wdHItPlR5cGUg
PT0gRWZpQm9vdFNlcnZpY2VzRGF0YSkpICkKPiArICAgICAgICBpZiAoIGRlc2NfcHRyLT5BdHRy
aWJ1dGUgJiBFRklfTUVNT1JZX1dCICYmCj4gKyAgICAgICAgICAgICAoZGVzY19wdHItPlR5cGUg
PT0gRWZpQ29udmVudGlvbmFsTWVtb3J5IHx8Cj4gKyAgICAgICAgICAgICAgZGVzY19wdHItPlR5
cGUgPT0gRWZpTG9hZGVyQ29kZSB8fAo+ICsgICAgICAgICAgICAgIGRlc2NfcHRyLT5UeXBlID09
IEVmaUxvYWRlckRhdGEgfHwKPiArICAgICAgICAgICAgICAoIW1hcF9icyAmJgo+ICsgICAgICAg
ICAgICAgICAoZGVzY19wdHItPlR5cGUgPT0gRWZpQm9vdFNlcnZpY2VzQ29kZSB8fAo+ICsgICAg
ICAgICAgICAgICAgZGVzY19wdHItPlR5cGUgPT0gRWZpQm9vdFNlcnZpY2VzRGF0YSkpKSApCj4g
ICAgICAgICAgIHsKPiAgICAgICAgICAgICAgIGlmICggIW1lbWluZm9fYWRkX2JhbmsoJmJvb3Rp
bmZvLm1lbSwgZGVzY19wdHIpICkKPiAgICAgICAgICAgICAgIHsKPiAKCi0tIApKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
