Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5440310ED83
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2019 17:51:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iborp-0003pe-4E; Mon, 02 Dec 2019 16:48:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xSXf=ZY=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iborn-0003pZ-Hf
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2019 16:48:07 +0000
X-Inumbo-ID: 8363511c-1523-11ea-a40b-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8363511c-1523-11ea-a40b-12813bfff9fa;
 Mon, 02 Dec 2019 16:48:06 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y17so6547324wrh.5
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2019 08:48:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sBEPinuiHHpWi6w/nO2ejKsAYJvmJfOA+fn4mYciv3Y=;
 b=KuZARLXtBTgZESYympgYXAPLJXxjHT+1eZVOwx8iDsyBEB8EKx+TqdgDhKX5XPj4Vv
 EmYYkMK/WuFEYC46dzR/MiwoIQn7LkpmQHM6sI1nIvMivbSfXeydcAtXYHM4RVFyqkqW
 4iLIBm+pLD46xRAIqWKf/kn3PqpjLi0zYM5VTXDIJexK8GYv1I/LexG6BMs7eF6tCTkj
 EovpFEBD6sl5s+pds8RGHqSJTxLQU4ZIq/F0Ev/Xb1mfNlBd2zhJe/3BJcyLTUkQkGX/
 mq+I6FQ0kiqJgfqKSZOXiO79LmIP1iFkWbZPUgPgadLnbAF6bx9hCWdDTiH6ONoshy99
 LzFg==
X-Gm-Message-State: APjAAAW3J8Jg/hr6nS6HL0K2u3vJG31RVBuJwNIPkJlvtx8izHivIl6L
 ilOtkE5yla+4VySWpKHhoAI=
X-Google-Smtp-Source: APXvYqz3aegcWx4mO7F7K1NoIsWbEJIJqojUPcDDr7l40pP//omDVbMPdymadrh8VHHpjQTvEqPTKw==
X-Received: by 2002:adf:db01:: with SMTP id s1mr66560718wri.372.1575305285569; 
 Mon, 02 Dec 2019 08:48:05 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id r5sm8523609wrt.43.2019.12.02.08.48.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2019 08:48:04 -0800 (PST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall.oss@gmail.com>
References: <20191031192804.19928-1-andrew.cooper3@citrix.com>
 <7bd1d625-d501-6ca7-f951-9f42066436bd@arm.com>
 <ebfea524-2ae1-8e83-3217-bc0d84ab902c@citrix.com>
 <CAJ=z9a2p1Pjm5Oadq+eP6YjNpCh6WK-aWosuf-7Z0wqSw6KAag@mail.gmail.com>
 <553d989d-7337-f5e3-44d8-a08fde6dac07@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7d5ae5e4-3cef-a62f-b2e7-9ca097fbfabf@xen.org>
Date: Mon, 2 Dec 2019 16:48:02 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <553d989d-7337-f5e3-44d8-a08fde6dac07@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/vcpu: Sanitise VCPUOP_initialise call
 hierachy
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xenproject.org,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwMi8xMi8yMDE5IDE2OjE3LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDE1LzEx
LzIwMTkgMTU6MjQsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gT24gRnJpLCAxNSBOb3YgMjAxOSwg
MTg6MTMgQW5kcmV3IENvb3BlciwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20gCj4+IDxtYWls
dG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4+IHdyb3RlOgo+Pgo+PiAgICAgT24gMzEvMTAv
MjAxOSAyMToyNSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiAgICAgPiBIaSwKPj4gICAgID4KPj4g
ICAgID4gT24gMzEvMTAvMjAxOSAxOToyOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gICAgID4+
IFRoaXMgY29kZSBpcyBlc3BlY2lhbGx5IHRhbmdsZWQuIFZDUFVPUF9pbml0aWFsaXNlIGNhbGxz
IGludG8KPj4gICAgID4+IGFyY2hfaW5pdGlhbGlzZV92Y3B1KCkgd2hpY2ggY2FsbHMgYmFjayBp
bnRvCj4+ICAgICBkZWZhdWx0X2luaXRpYWxpc2VfdmNwdSgpIHdoaWNoCj4+ICAgICA+PiBpcyBj
b21tb24gY29kZS4KPj4gICAgID4+Cj4+ICAgICA+PiBUaGlzIHBhdGggaXMgYWN0dWFsbHkgZGVh
ZCBjb2RlIG9uIEFSTSwgYmVjYXVzZQo+PiAgICAgVkNQVU9QX2luaXRpYWxpc2UgaXMgZmlsdGVy
ZWQKPj4gICAgID4+IG91dCBieSBkb19hcm1fdmNwdV9vcCgpLgo+PiAgICAgPj4KPj4gICAgID4+
IFRoZSBvbmx5IHZhbGlkIHdheSB0byBzdGFydCBhIHNlY29uZGFyeSBDUFUgb24gQVJNIGlzIHZp
YSB0aGUKPj4gICAgIFBTQ0kgaW50ZXJmYWNlLgo+PiAgICAgPj4gVGhlIHNhbWUgY291bGQgaW4g
cHJpbmNpcGxlIGJlIHNhaWQgYWJvdXQgSU5JVC1TSVBJLVNJUEkgZm9yCj4+ICAgICB4ODYgSFZN
LCBpZiBIVk0KPj4gICAgID4+IGd1ZXN0cyBoYWRuJ3QgYWxyZWFkeSBpbnRlcml0ZWQgYSBwYXJh
dmlydCB3YXkgb2Ygc3RhcnRpbmcgQ1BVcy4KPj4gICAgID4+Cj4+ICAgICA+PiBFaXRoZXIgd2F5
LCBpdCBpcyBxdWl0ZSBsaWtlbHkgdGhhdCBubyBmdXR1cmUgYXJjaGl0ZWN0dXJlcwo+PiAgICAg
aW1wbGVtZW50ZWQgaW4gWGVuCj4+ICAgICA+PiBhcmUgZ29pbmcgdG8gd2FudCB0byB1c2UgYSBQ
ViBpbnRlcmZhY2UsIGFzIHNvbWUgc3RhbmRhcmRpc2VkCj4+ICAgICAodilDUFUgYnJpbmd1cAo+
PiAgICAgPj4gbWVjaGFuaXNtIHdpbGwgYWxyZWFkeSBleGlzdC4KPj4gICAgID4gSSBhbSBub3Qg
c3VyZSBJIGFncmVlIGhlcmUuIExvb2tpbmcgYXQgTGludXggUklTQ3YgY29kZSAoc2VlIFsxXQo+
PiAgICAgYW5kCj4+ICAgICA+IFsyXSksIGl0IGxvb2tzIGxpa2UgdGhlIGtlcm5lbCBoYXMgdG8g
ZGVhbCB3aXRoIHNlbGVjdGluZyBvbmUKPj4gICAgICJsdWNreSIKPj4gICAgID4gQ1BVL2hhcnQg
dG8gZGVhbCB3aXRoIHRoZSBib290IGFuZCBwYXJrIGFsbCB0aGUgb3RoZXJzLgo+PiAgICAgPgo+
PiAgICAgPiBTbyBpdCBsb29rcyBsaWtlIHRvIG1lIHRoZXJlIGFyZSBub3RoaW5nIGF0IHRoZSBt
b21lbnQgb24gUklTQ3YKPj4gICAgIHRvIGRvCj4+ICAgICA+ICh2KUNQVSBicmluZy11cC4gV2Ug
bWlnaHQgYmUgYWJsZSB0byB1c2UgUFNDSSAoYWx0aG91Z2ggdGhpcyBpcwo+PiAgICAgYW4gQVJN
Cj4+ICAgICA+IHNwZWNpZmljIHdheSksIGJ1dCB3b3VsZCByYXRoZXIgd2FpdCBhbmQgc2VlIHdo
YXQgUklTQ3YgZm9sa3MKPj4gICAgIGNvbWUgdXAKPj4gICAgID4gd2l0aCBiZWZvcmUgZGVjaWRp
bmcgUFYgaXMgbmV2ZXIgZ29pbmcgdG8gYmUgdXNlZC4KPj4KPj4gICAgIE5vdGhpbmcgaGVyZSBw
cm9oaWJpdHMgb3RoZXIgYXJjaGl0ZWN0dXJlcyBmcm9tIHVzaW5nIGEgUFYKPj4gICAgIGludGVy
ZmFjZSBpZgo+PiAgICAgdGhleSB3aXNoLgo+Pgo+Pgo+PiBXZWxsLCB5b3VyIGNvbW1pdCBtZXNz
YWdlIGFuZCB0aGUgY29kZSBtb3ZlbWVudCBpbXBsaWVzIHRoYXQgbm9ib2R5IAo+PiB3aWxsIGV2
ZXIgdXNlIGl0Lgo+Pgo+Pgo+PiAgICAgSG93ZXZlciwgeW91ciBleGFtcGxlcyBwcm92ZSBteSBw
b2ludC7CoCBUaGVyZSBpcyBhbiBhbHJlYWR5LWFncmVlZCB3YXkKPj4gICAgIHRvIHN0YXJ0IFJJ
U0N2IENQVXMgd2hpY2ggaXMgbm90IGEgUFYgaW50ZXJmYWNlLCBhbmQgdGhlcmVmb3JlIGlzIHZl
cnkKPj4gICAgIHVubGlrZWx5IHRvIGFkb3B0ZWQgdG8gcnVuIGRpZmZlcmVudGx5IHVuZGVyIFhl
bi4KPj4KPj4KPj4gSSB3b3VsZCBub3QgY2FsbCB0aGF0IGEgd2F5IHRvIHN0YXJ0IENQVXMgYmVj
YXVzZSBBRkFJQ1QgYWxsIENQVXMgaGF2ZSAKPj4gdG8gYmUgYnJvdWdodCB1cCB0b2dldGhlciBh
bmQgeW91IGNhbid0IG9mZmxpbmUgdGhlbS4gVGhpcyBpcyBmYWlybHkgCj4+IHJlc3RyaWN0aXZl
IGZvciBhIGd1ZXN0IHNvIEkgZG9uJ3QgdGhpbmsgcmV1c2luZyBpdCB3b3VsZCBzdXN0YWluYWJs
ZSAKPj4gbG9uZyB0ZXJtLgo+Pgo+PiBGV0lXLCB0aGlzIGlzIGV4YWN0bHkgd2hhdCBBcm0gdXNl
ZCB0byBoYXZlIGJlZm9yZSBQU0NJLgo+IAo+IFRoaXMgcmVwbHkgaXMgbm90IGhlbHBmdWwgd2l0
aCBwcm9ncmVzc2luZyB0aGUgcGF0Y2guCj4gCj4gSSdtIG5vdCBhcmd1aW5nIHdoZXRoZXIgdGhl
IGN1cnJlbnQgUklTQ1YgYmVoYXZpb3VyIGlzIGdyZWF0IG9yIG5vdC7CoCBJdCAKPiBpcyB3aGF0
IGl0IGlzLgo+IAo+IFRoZSBxdWVzdGlvbiBhdCBoYW5kIGlzOiBJbiBzb21lIHRoZW9yZXRpY2Fs
IGZ1dHVyZSB3aGVyZSBYZW4gZ2FpbnMgCj4gUklTQ1Ygc3VwcG9ydCwgaG93IGxpa2VseSBhcmUg
dGhlIExpbnV4IFJJU0NWIG1haW50YWluZXJzIHRvIHRha2UgYSBYZW4gCj4gc3BlY2lmaWMgcGFy
YXZpcnQgc3RhcnR1cCBzZXF1ZW5jZSB3aGljaCBkb2VzIHRoaW5ncyBkaWZmZXJlbnRseSB0byB0
aGUgCj4gZXhpc3Rpbmcgc2VxdWVuY2Ugd2hpY2ggaXMgaHlwZXJ2aXNvciBhZ25vc3RpYz8KPiAK
PiBUaGUgYW5zd2VyIGlzIHRhbnRhbW91bnQgdG8gMCwgYmVjYXVzZSB3aGF0IGRvZXMgaXQgYWN0
dWFsbHkgZ2FpbiB5b3U/ICAKPiBBbiBleHRyYSBib290IHByb3RvY29sIHRvIHN1cHBvcnQsIHdo
aWNoIGlzIGh5cGVydmlzb3Igc3BlY2lmaWMsIHdpdGggbm8gCj4gYWRkZWQgZnVuY3Rpb25hbGl0
eSBvdmVyIHRoZSBleGlzdGluZyBoeXBlcnZpc29yLW5ldXRyYWwgb25lLgoKUklTQ3Ygd2lsbCBw
cm9iYWJseSBoYXZlIHRvIGNvbWUtdXAgd2l0aCBhIG5ldyBwcm90b2NvbCB0aGF0IHdpbGwgYWxs
b3cgCnRvIG9mZmxpbmUvb25saW5lIGEgQ1BVLiBJZiB0aGV5IGRvbid0IGFncmVlIG9uIGFueSwg
dGhlbiB0aGV5IHdpbGwgaGF2ZSAKdG8gZmFjZSBldmVyeSBoeXBlcnZpc29yL3BsYXRmb3JtIHRv
IGludmVudCB0aGVpciBvd24uCgpBcyBJIGRvbid0IGhhdmUgYW55IGluc2lnaHQgb24gUklTQ3Ys
IEkgY2FuJ3QgcmVhbGx5IHByZWRpY3Qgd2hldGhlciAKdGhleSB3aWxsIHJlcGVhdCB0aGUgYXJt
IDMyLWJpdCBzdG9yeS4KCj4gCj4gSSBzdGlsbCBkb24ndCBzZWUgYW55IGNvbnZpbmNpbmcgYXJn
dW1lbnQgdG8gc3VnZ2VzdCB0aGF0IGZ1dHVyZSAKPiBhcmNoaXRlY3R1cmVzIG1heSBjaG9vc2Ug
dG8gdXNlIGEgWGVuIHNwZWNpZmljIHBhcmF2aXJ0IHN0YXJ0IG1lY2hhbmlzbSwgCj4gYnV0IGFz
IGFscmVhZHkgc3RhdGVkLCB0aGlzIHBhdGNoIGRvZXNuJ3QgcnVsZSBzdWNoIGFuIGludGVyZmFj
ZSBvdXQuCgpMZWF2aW5nIGFzaWRlIHRoZSBhcmd1bWVudCByZWdhcmRpbmcgd2hldGhlciBhIG5l
d2VyIGFyY2hpdGVjdHVyZSB3b3VsZCAKdXNlIHRoZW0sIGl0IGZlZWxzIHNsaWdodGx5IG9kZCB0
byBzdWdnZXN0IHRoZSBwcm90b2NvbCB3aWxsIG5vdCBiZSB1c2VkIApieSBvdGhlciBwbGF0Zm9y
bSBidXQgdGhlbiB5b3Ugb25seSBtb3ZlIG91dCBWQ1BVT1BfaW5pdGlhbGl6ZS4gClZDUFVPUF97
dXAsIGRvd259IGFyZSBzdGlsbCBwcmVzZW50LgoKSWYgd2UgcmVhbGx5IGNvbnNpZGVyIHRoYXQg
YSBuZXcgYXJjaCB3aWxsIGNvbWUgdXAgd2l0aCBpdHMgb3duIApwcm90b2NvbCwgdGhlbiB3ZSBz
aG91bGQgcmVtb3ZlIGFsbCB0aGUgaHlwZXJjYWxscyBzbyB3ZSBkb24ndCBlbmQgdXAgaW4gCmFu
IGhhbGYgc3RhdGUgc3VwcG9ydC4KCkluIHRoaXMgY2FzZSwgSSB3b3VsZCBqdXN0IHByZWZlciBp
ZiB3ZSBpbnRyb2R1Y2UgYSBLY29uZmlnIHRoYXQgd2lsbCAKY292ZXIgYXQgbGVhc3QgVkNQVU9Q
X3t1cCwgZG93biwgaW5pdGlhbGl6ZX0uCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
