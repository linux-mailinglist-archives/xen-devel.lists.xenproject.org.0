Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A625D13AF72
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 17:32:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irP4p-00040w-Jk; Tue, 14 Jan 2020 16:29:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VOhe=3D=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1irP4o-00040n-51
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 16:29:58 +0000
X-Inumbo-ID: 153d5a86-36eb-11ea-a2eb-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 153d5a86-36eb-11ea-a2eb-bc764e2007e4;
 Tue, 14 Jan 2020 16:29:49 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id q10so12806027wrm.11
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2020 08:29:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X3vYq7oOeY1Axhp+EN7rKwMQhwd+OenQScTflfg3B4Y=;
 b=VzbC9+wL7B15bfJJJZ2vr2cmGRkUPHhH2cfjOQXLk5cv7m8+Kz43YhL7MMKQ/t9xvb
 VwfSJuMJ30u+F+rojiH9GLXl6XqGw7RZByzbgDuCKvOe6mR4JnabNDSmE3VdkoC07l/f
 iMVS+XLGf1xZLaSzrA1eUjg8f/vOyrJcW2MlPgXQjhq7mJNQ3YBI1GqOzmoB/oCp5H2d
 jmmaTvJAEZyK1krq8ZkLt2okxgQNOhUs5hir6N7ttj8ugnIhB6U270k/tr4nKOlqoH7W
 Vd/PmNBUQWK+SJbiNSf4nxHXJOFhgAQGiOuCATxKM89wJ2SKj9OMYHv4vtEKDnpDDeFY
 AQ+A==
X-Gm-Message-State: APjAAAUg6neCxLp7v3InrfuPMV3mH4uhhIm6dAz1PYcFhSNyemfR1fcs
 pGUpSR9dTA4d1ZLjvOeNifo=
X-Google-Smtp-Source: APXvYqzwbVUzL43TlNWLFrCH0kNtflFciZHQaH0SSa6hzpqQs+gdi7A9jVTd+hoTFWMKTBLBEiaK8A==
X-Received: by 2002:a05:6000:cf:: with SMTP id
 q15mr25564669wrx.393.1579019388614; 
 Tue, 14 Jan 2020 08:29:48 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id x10sm19593120wrv.60.2020.01.14.08.29.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2020 08:29:47 -0800 (PST)
To: David Woodhouse <dwmw2@infradead.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, "Xia, Hongyan"
 <hongyax@amazon.com>
References: <dbdedd077330af79c13ba5ed38b0aec0b7128886.camel@infradead.org>
 <4e3b0050ff7a8d1e40015181026562211e75c401.camel@infradead.org>
 <1743ee7c-e238-8b77-d40f-bd0e3d6bb0ed@xen.org>
 <b24cf0a1b56f56167f51d5dd86fd81afb48a377c.camel@infradead.org>
 <e49ed1b9-23cc-5c24-0b83-565a1d833de2@xen.org>
 <a52142eed9e59446f8a02798ab643b01a5ab7a1c.camel@infradead.org>
From: Julien Grall <julien@xen.org>
Message-ID: <52fb69c3-64b6-2b67-9647-340110b27289@xen.org>
Date: Tue, 14 Jan 2020 16:29:46 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <a52142eed9e59446f8a02798ab643b01a5ab7a1c.camel@infradead.org>
Content-Language: en-GB
Subject: Re: [Xen-devel] [RFC PATCH 0/3] Live update boot memory management
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
 paul@xen.org, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgRGF2aWQsCgpPbiAxNC8wMS8yMDIwIDE1OjIwLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6Cj4g
T24gVHVlLCAyMDIwLTAxLTE0IGF0IDE1OjAwICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+
Cj4+IE9uIDE0LzAxLzIwMjAgMTQ6NDgsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToKPj4+IE9uIFR1
ZSwgMjAyMC0wMS0xNCBhdCAxNDoxNSArMDAwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+IEhp
IERhdmlkLAo+Pj4+Cj4+Pj4gT24gMTMvMDEvMjAyMCAxMTo1NCwgRGF2aWQgV29vZGhvdXNlIHdy
b3RlOgo+Pj4+PiBPbiBXZWQsIDIwMjAtMDEtMDggYXQgMTc6MjQgKzAwMDAsIERhdmlkIFdvb2Ro
b3VzZSB3cm90ZToKPj4+Pj4+IFNvIHdlJ3ZlIHNldHRsZWQgb24gYSBzaW1wbGVyIGFwcHJvYWNo
IALigJQgcmVzZXJ2ZSBhIGNvbnRpZ3VvdXMgcmVnaW9uCj4+Pj4+PiBvZiBwaHlzaWNhbCBtZW1v
cnkgd2hpY2ggKndvbid0KiBiZSB1c2VkIGZvciBkb21haW4gcGFnZXMuIExldCB0aGUgYm9vdAo+
Pj4+Pj4gYWxsb2NhdG9yIHNlZSAqb25seSogdGhhdCByZWdpb24gb2YgbWVtb3J5LCBhbmQgcGx1
ZyB0aGUgcmVzdCBvZiB0aGUKPj4+Pj4+IG1lbW9yeSBpbiBsYXRlciBvbmx5IGFmdGVyIGRvaW5n
IGEgZnVsbCBwYXNzIG9mIHRoZSBsaXZlIHVwZGF0ZSBzdGF0ZS4KPj4+Pgo+Pj4+IEl0IGlzIGEg
Yml0IHVuY2xlYXIgd2hhdCB0aGUgcmVnaW9uIHdpbGwgYmUgdXNlZCBmb3IuIElmIHlvdSBwbGFu
IHRvIHB1dAo+Pj4+IHRoZSBzdGF0ZSBvZiB0aGUgVk1zIGluIGl0LCB0aGVuIHlvdSBjYW4ndCBw
b3NzaWJseSB1c2UgaXQgZm9yIGJvb3QKPj4+PiBhbGxvY2F0aW9uIChlLmcgZnJhbWV0YWJsZSkg
b3RoZXJ3aXNlIHRoaXMgbWF5IGJlIG92ZXJ3cml0dGVuIHdoZW4gZG9pbmcKPj4+PiB0aGUgbGl2
ZSB1cGRhdGUuCj4+Pgo+Pj4gUmlnaHQuIFRoaXMgaXMgb25seSBmb3IgYm9vdCB0aW1lIGFsbG9j
YXRpb25zIGJ5IFhlbiMyLCBiZWZvcmUgaXQncwo+Pj4gcHJvY2Vzc2VkIHRoZSBMVSBkYXRhIGFu
ZCBrbm93cyB3aGljaCBwYXJ0cyBvZiB0aGUgcmVzdCBvZiBtZW1vcnkgaXQKPj4+IGNhbiB1c2Uu
IEl0IGFsbG9jYXRlcyBpdHMgZnJhbWUgdGFibGUgZnJvbSB0aGVyZSwgYXMgd2VsbCBhcyBhbnl0
aGluZwo+Pj4gZWxzZSBpdCBuZWVkcyB0byBhbGxvY2F0ZSBiZWZvcmUvd2hpbGUgcHJvY2Vzc2lu
ZyB0aGUgTFUgZGF0YS4KPj4KPj4gSXQgd291bGQgYmUgd29ydGggZG9jdW1lbnRpbmcgd2hhdCBp
cyB0aGUgZXhwZWN0YXRpb24gb2YgdGhlIGJ1ZmZlci4KPj4gTWF5YmUgaW4geGVuLWNvbW1hbmQt
bGluZSBhbG9uZyB3aXRoIHRoZSByZXN0IG9mIHRoZSBuZXcgb3B0aW9uIHlvdQo+PiBpbnRyb2R1
Y2VkPyBPciBpbiBhIHNlcGFyYXRlIGRvY3VtZW50Lgo+IAo+IEtpbmQgb2YgbmVlZCB0byBpbXBs
ZW1lbnQgdGhhdCBwYXJ0IHRvbywgYW5kIHRoZW4gd2UgY2FuIGRvY3VtZW50IHdoYXQKPiBpdCBm
aW5hbGx5IGxvb2tzIGxpa2UgOikKPiAKPj4+IEFzIGFuIGltcGxlbWVudGF0aW9uIGRldGFpbCwg
SSBhbnRpY2lwYXRlIHRoYXQgd2UnbGwgYmUgdXNpbmcgdGhlIGJvb3QKPj4+IGFsbG9jYXRvciBm
b3IgdGhhdCBlYXJseSBwYXJ0IGZyb20gdGhlIHJlc2VydmVkIHJlZ2lvbiwgYW5kIHRoYXQgdGhl
Cj4+PiBzd2l0Y2ggdG8gdXNpbmcgdGhlIGZ1bGwgYXZhaWxhYmxlIG1lbW9yeSAobGVzcyB0aG9z
ZSBwYWdlcyBhbHJlYWR5IGluLQo+Pj4gdXNlKSB3aWxsICpjb2luY2lkZSogd2l0aCBzd2l0Y2hp
bmcgdG8gdGhlIHJlYWwgaGVhcCBhbGxvY2F0b3IuCj4+Pgo+Pj4gVGhlIHJlc2VydmVkIHJlZ2lv
biAqaXNuJ3QqIGZvciB0aGUgTFUgZGF0YSBpdHNlbGYuIFRoYXQgY2FuIGJlCj4+PiBhbGxvY2F0
ZWQgZnJvbSBhcmJpdHJhcnkgcGFnZXMgKm91dHNpZGUqIHRoZSByZXNlcnZlZCBhcmVhLCBpbiBY
ZW4jMS4KPj4+IFhlbiMyIGNhbiB2bWFwIHRob3NlIHBhZ2VzLCBhbmQgbmVlZHMgdG8gYXZvaWQg
c3RvbXBpbmcgb24gdGhlbSBqdXN0Cj4+PiBsaWtlIGl0IG5lZWRzIHRvIGF2b2lkIHN0b21waW5n
IG9uIGFjdHVhbCBkb21haW4tb3duZWQgcGFnZXMuCj4+Pgo+Pj4gVGhlIHBsYW4gaXMgdGhhdCBY
ZW4jMSBhbGxvY2F0ZXMgYXJiaXRyYXJ5IHBhZ2VzIHRvIHN0b3JlIHRoZSBhY3R1YWwgTFUKPj4+
IGRhdGEuIFRoZW4gYW5vdGhlciBwYWdlIChvciBoaWdoZXIgb3JkZXIgYWxsb2NhdGlvbiBpZiB3
ZSBuZWVkID4yTWlCIG9mCj4+PiBhY3R1YWwgTFUgZGF0YSkgY29udGFpbmluZyB0aGUgTUZOcyBv
ZiBhbGwgdGhvc2UgZGF0YSBwYWdlcy4gVGhlbiB3ZQo+Pj4gbmVlZCB0byBzb21laG93IHBhc3Mg
dGhlIGFkZHJlc3Mgb2YgdGhhdCBNRk4tbGlzdCB0byBYZW4jMi4KPj4+Cj4+PiBNeSBjdXJyZW50
IHBsYW4gaXMgdG8gcHV0ICp0aGF0KiBpbiB0aGUgZmlyc3QgNjQgYml0cyBvZiB0aGUgcmVzZXJ2
ZWQKPj4+IExVIGJvb3RtZW0gcmVnaW9uLCBhbmQgbG9hZCBpdCBmcm9tIHRoZXJlIGVhcmx5IGlu
IHRoZSBYZW4jMiBib290Cj4+PiBwcm9jZXNzLiBJJ20gbG9va2luZyBhdCBhZGRpbmcgYW4gSU5E
X1dSSVRFNjQgcHJpbWl0aXZlIHRvIHRoZSBraW1hZ2UKPj4+IHByb2Nlc3NpbmcsIHRvIGFsbG93
IGl0IHRvIGJlIHRyaXZpYWxseSBhcHBlbmRlZCBmb3Iga2V4ZWNfcmVsb2MoKSB0bwo+Pj4gb2Jl
eS4KPj4KPj4gV291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIHJlc2VydmUgdGhlIGZpcnN0IDRLIHBh
Z2Ugb2YgdGhlIExVIGJvb3RtZW0gcmVnaW9uPwo+Pgo+PiBPdGhlcndpc2UsIHlvdSBtYXkgZW5k
IHVwIGludG8gdGhlIHNhbWUgdHJvdWJsZSBhcyBkZXNjcmliZWQgYWJvdmUgKHRvIGEKPj4gbGVz
c2VyIGV4dGVudCkgaWYgdGhlIDY0LWJpdCB2YWx1ZSBvdmVyd3JpdGUgYW55dGhpbmcgdXNlZnVs
IGZvciB0aGUKPj4gY3VycmVudCBYZW4uIEJ1dCBJIGd1ZXNzLCB5b3UgY291bGQgZGVsYXkgdGhl
IHdyaXRpbmcganVzdCBiZWZvcmUgeW91Cj4+IGp1bXAgdG8geGVuIzIuCj4gCj4gVGhhdCdzIHRo
ZSBwb2ludCBpbiBhcHBlbmRpbmcgYW4gSU5EX1dSSVRFNjQgb3BlcmF0aW9uIHRvIHRoZSBraW1h
Z2UKPiBzdHJlYW0uIFRoZSBhY3R1YWwgd3JpdGUgaXMgZG9uZSBpbiB0aGUgbGFzdCBnYXNwIG9m
IGtleGVjX3JlbG9jKCkKPiBhZnRlciBYZW4jMSBpcyBxdWllc2NlbnQsIG9uIHRoZSB3YXkgaW50
byBwdXJnYXRvcnkuCgpJIHdhcyBub3Qgc3VyZSB3aGF0IHlvdSBtZWFudCBieSBJTkRfV1JJVEU2
NC4gTWF5YmUgSSBzaG91bGQgaGF2ZSBhc2tlZCAKaXQgZmlyc3QgOikuIFRoYW5rIHlvdSBmb3Ig
dGhlIGV4cGxhbmF0aW9uIQoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
