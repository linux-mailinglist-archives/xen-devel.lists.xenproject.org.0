Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C2511CFF7
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 15:36:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifPY2-0002hR-0R; Thu, 12 Dec 2019 14:34:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LpKE=2C=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ifPY0-0002hM-Fn
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 14:34:32 +0000
X-Inumbo-ID: 7da59c8c-1cec-11ea-88e7-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7da59c8c-1cec-11ea-88e7-bc764e2007e4;
 Thu, 12 Dec 2019 14:34:23 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z7so2932141wrl.13
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2019 06:34:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cx6nEXGSfDseq/1WuY9yszF3cxHOJx1/hHzIccB91O8=;
 b=QzGwBbeRwW4pMBFu6tM/NZ/mkWLEbijQiYi4M8DHKP+PeX4sarqD3CHCpZIY3kAtYo
 V52hFslzyMfu9BeVFYxwjAZFQQ9qtiqCG8TFB/pbwXaso3ZLZ6bsjmWAWAxVxckBO210
 uEGb7Oa2pQn4KOtZtJ3WfnDkNhBj1RGA+y8wO5MQGm4eoY3rc9AI+yYrGo5QjRM2VIYO
 sh52bZhhC5hTG8SZAjKFGf7p4390LTvFgQ8eMFDRNYGCI9QRK6q5Fqnv046azmm2pzoY
 wrF/AlLu94l88yP54FvTNr4ApwPYGQdP5ACth7rpKrQpUSpTtKay/omvH4GHMs/EMkde
 iluQ==
X-Gm-Message-State: APjAAAWs5bSc1jGQSO95FFmng8sgQ46s4+JAa7KnUq15Lt+y+qOemNd2
 aPzVZVSxBRKS9M9g6TwFPXs=
X-Google-Smtp-Source: APXvYqyJCdX0WgC14lFvKXkav2GTbPIfyVAQwZGkDrSPLgp+WTGLb7TXvUdEx+znQpniQJ3QVswabg==
X-Received: by 2002:a5d:65cf:: with SMTP id e15mr6884242wrw.126.1576161263050; 
 Thu, 12 Dec 2019 06:34:23 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id d16sm6811007wrg.27.2019.12.12.06.34.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2019 06:34:22 -0800 (PST)
To: Hongyan Xia <hongyxia@amazon.com>, xen-devel@lists.xenproject.org
References: <cover.1575477921.git.hongyxia@amazon.com>
 <b23924c9bdfe076c970dad4cbd9fa4d946d0a168.1575477921.git.hongyxia@amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2429d27e-d4df-6aeb-40db-119a30572d4d@xen.org>
Date: Thu, 12 Dec 2019 14:34:21 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <b23924c9bdfe076c970dad4cbd9fa4d946d0a168.1575477921.git.hongyxia@amazon.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v4 4/9] x86/mm: introduce l{1,
 2}t local variables to modify_xen_mappings
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwNC8xMi8yMDE5IDE3OjEwLCBIb25neWFuIFhpYSB3cm90ZToKPiBGcm9tOiBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IAo+IFRoZSBwbDJlIGFuZCBwbDFlIHZhcmlhYmxl
cyBhcmUgaGVhdmlseSAoYWIpdXNlZCBpbiB0aGF0IGZ1bmN0aW9uLiAgSXQKPiBpcyBmaW5lIGF0
IHRoZSBtb21lbnQgYmVjYXVzZSBhbGwgcGFnZSB0YWJsZXMgYXJlIGFsd2F5cyBtYXBwZWQgc28K
PiB0aGVyZSBpcyBubyBuZWVkIHRvIHRyYWNrIHRoZSBsaWZlIHRpbWUgb2YgZWFjaCB2YXJpYWJs
ZS4KPiAKPiBXZSB3aWxsIHNvb24gaGF2ZSB0aGUgcmVxdWlyZW1lbnQgdG8gbWFwIGFuZCB1bm1h
cCBwYWdlIHRhYmxlcy4gV2UKPiBuZWVkIHRvIHRyYWNrIHRoZSBsaWZlIHRpbWUgb2YgZWFjaCB2
YXJpYWJsZSB0byBhdm9pZCBsZWFrYWdlLgo+IAo+IEludHJvZHVjZSBzb21lIGx7MSwyfXQgdmFy
aWFibGVzIHdpdGggbGltaXRlZCBzY29wZSBzbyB0aGF0IHdlIGNhbgo+IHRyYWNrIGxpZmUgdGlt
ZSBvZiBwb2ludGVycyB0byB4ZW4gcGFnZSB0YWJsZXMgbW9yZSBlYXNpbHkuCj4gCj4gTm8gZnVu
Y3Rpb25hbCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
IC0tLQo+ICAgeGVuL2FyY2gveDg2L21tLmMgfCA2OCArKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDM4IGluc2VydGlvbnMo
KyksIDMwIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0uYyBi
L3hlbi9hcmNoL3g4Ni9tbS5jCj4gaW5kZXggNzkwNTc4ZDJiMy4uMzAzYmMzNTU0OSAxMDA2NDQK
PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCj4gQEAg
LTU2MDEsNiArNTYwMSw4IEBAIGludCBtb2RpZnlfeGVuX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcg
cywgdW5zaWduZWQgbG9uZyBlLCB1bnNpZ25lZCBpbnQgbmYpCj4gICAKPiAgICAgICAgICAgaWYg
KCBsM2VfZ2V0X2ZsYWdzKCpwbDNlKSAmIF9QQUdFX1BTRSApCj4gICAgICAgICAgIHsKPiArICAg
ICAgICAgICAgbDJfcGdlbnRyeV90ICpsMnQ7Cj4gKwo+ICAgICAgICAgICAgICAgaWYgKCBsMl90
YWJsZV9vZmZzZXQodikgPT0gMCAmJgo+ICAgICAgICAgICAgICAgICAgICBsMV90YWJsZV9vZmZz
ZXQodikgPT0gMCAmJgo+ICAgICAgICAgICAgICAgICAgICAoKGUgLSB2KSA+PSAoMVVMIDw8IEwz
X1BBR0VUQUJMRV9TSElGVCkpICkKPiBAQCAtNTYxNiwxMSArNTYxOCwxMSBAQCBpbnQgbW9kaWZ5
X3hlbl9tYXBwaW5ncyh1bnNpZ25lZCBsb25nIHMsIHVuc2lnbmVkIGxvbmcgZSwgdW5zaWduZWQg
aW50IG5mKQo+ICAgICAgICAgICAgICAgfQo+ICAgCj4gICAgICAgICAgICAgICAvKiBQQUdFMUdC
OiBzaGF0dGVyIHRoZSBzdXBlcnBhZ2UgYW5kIGZhbGwgdGhyb3VnaC4gKi8KPiAtICAgICAgICAg
ICAgcGwyZSA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKPiAtICAgICAgICAgICAgaWYgKCAhcGwy
ZSApCj4gKyAgICAgICAgICAgIGwydCA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKPiArICAgICAg
ICAgICAgaWYgKCAhbDJ0ICkKPiAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKCklu
ZGlyZWN0bHkgcmVsYXRlZCB0byB0aGlzIHBhdGNoLCBpdCBsb29rcyBsaWtlIFRMQnMgd2lsbCBu
b3QgYmUgZmx1c2hlZCAKZXZlbiBwYXJ0IG9mIHRoZSBtYXBwaW5nIGlzIG5vdCByZW1vdmVkLgoK
QW5vdGhlciBwcm9ibGVtIEkgaGF2ZSBzcG90dGVkIGlzIG1vc3Qgb2YgdGhlIGNhbGxlcnMgb2Yg
Cm1hcF9wYWdlc190b194ZW4oKSAmIG1vZGlmeV94ZW5fbWFwcGluZ3MoKSB3aWxsIG5ldmVyIGNo
ZWNrIHRoZSByZXR1cm4gCnZhbHVlLgoKSWYgd2UgcGxhbiB0byB1c2UgZGVzdHJveV94ZW5fbWFw
cGluZ3MoKSBmb3IgdW5tYXBwaW5nIHhlbmhlYXAgcGFnZSwgCnRoZW4gd2Ugd2lsbCBuZWVkIHRv
IGVuc3VyZSB0aGF0IGRlc3Ryb3lfeGVuX21hcHBpbmdzKCkgd2lsbCBuZXZlciBmYWlsLiAKT3Ro
ZXJ3aXNlIHdlIHdpbGwgZW5kIHVwIHRvIGtlZXAgcGFydCBvZiB0aGUgbWFwcGluZ3MgYW5kIHRo
ZXJlZm9yZSAKZGVmZWF0aW5nIHRoZSBwdXJwb3NlIG9mIHNlY3JldCBoaWRpbmcuCgpUaGlzIG1h
eSBtZWFuIHRoYXQgc2hhdHRlcmluZy9tZXJnaW5nIHNob3VsZCBiZSBwcmV2ZW50ZWQgZm9yIHhl
bmhlYXAgCnJlZ2lvbi4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
