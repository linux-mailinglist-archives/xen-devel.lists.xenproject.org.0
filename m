Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 782E0189C07
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 13:35:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEXrI-00057S-Fm; Wed, 18 Mar 2020 12:31:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fuWQ=5D=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jEXrG-00056i-7g
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 12:31:38 +0000
X-Inumbo-ID: 68c44ace-6914-11ea-badc-12813bfff9fa
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 68c44ace-6914-11ea-badc-12813bfff9fa;
 Wed, 18 Mar 2020 12:31:37 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id b21so20345462edy.9
 for <xen-devel@lists.xenproject.org>; Wed, 18 Mar 2020 05:31:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LxMXERHcel5ipeXLIWAZC9k8bFyZN2zvZrCz4LKbSdQ=;
 b=GUmeOWbkgPUnQFf7a9SIsoJRfHEaV0X3ZYsD0a1k4NyqcUJRtLxQhvOY7sUfPD8Gbh
 y9cqHAVmhazHj7mn8v+sKJq2qL8BVy22gGnb/lzRwe9H/oeBAxT0MgxgTBl3QHvpuyjI
 0BaGq1nDu9/tgOjnrNNHR16YovjtRtSX1y7d5JihA4+kYFLgmMOWdL+SMCDLcWjC0OOh
 5Dkkm+vn1eoTr4bfDWGqkDU8m3Vz+RFZcH3cSkFBYPnFZ53St4hg4XRkvFEZONlEa3lW
 jhlB30jE93jxYqzyWKgCTkJHbiZqKQc6V4d5vXsR07dqwlPi8/9AhRtbVkhAefkT3v2A
 JjHw==
X-Gm-Message-State: ANhLgQ1tl1PUl9VEPus3GzYwK3TIEdlrMTVPZqqOPHuUJM8nO8WI88ZI
 5vioZ/R0dPgCNC7hJ9w6ScN2C9EuPi7Z8Q==
X-Google-Smtp-Source: ADFU+vtpTLnNdLsmajFIOATgjUUHCIk0nPShTjooRVTKBvbaXw7DuNpe6Z1iN008pHWrcQDdvOX3wA==
X-Received: by 2002:a50:8e08:: with SMTP id 8mr3814075edw.92.1584534696192;
 Wed, 18 Mar 2020 05:31:36 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-239.amazon.com.
 [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id n6sm313063ejy.23.2020.03.18.05.31.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Mar 2020 05:31:35 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>, David Woodhouse <dwmw2@infradead.org>
References: <56f7fe21daff2dc4bf8db7ee356666233bdb0f7a.camel@infradead.org>
 <20200207155701.2781820-1-dwmw2@infradead.org>
 <a531f518-f996-34a0-7218-a746ae210393@suse.com>
 <641040a4aebc62e1e0e3874f513e3a308ec3ace0.camel@infradead.org>
 <9b0d191e-2553-6368-84d6-8425abe23c39@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6b41e45f-fc91-3a9f-20f8-28d66604adec@xen.org>
Date: Wed, 18 Mar 2020 12:31:33 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <9b0d191e-2553-6368-84d6-8425abe23c39@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 1/2] xen/mm: fold PGC_broken into PGC_state
 bits
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMTgvMDMvMjAyMCAwOTo1NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTcu
MDMuMjAyMCAyMjo1MiwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+PiBPbiBUaHUsIDIwMjAtMDIt
MjAgYXQgMTI6MTAgKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gT24gMDcuMDIuMjAyMCAx
Njo1NywgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+Pj4+IEBAIC0xMTQ1LDE2ICsxMTQ1LDE5IEBA
IHN0YXRpYyBpbnQgcmVzZXJ2ZV9vZmZsaW5lZF9wYWdlKHN0cnVjdAo+Pj4+IHBhZ2VfaW5mbyAq
aGVhZCkKPj4+PiDCoMKgwqDCoMKgIGZvciAoIGN1cl9oZWFkID0gaGVhZDsgY3VyX2hlYWQgPCBo
ZWFkICsgKCAxVUwgPDwgaGVhZF9vcmRlcik7Cj4+Pj4gY3VyX2hlYWQrKyApCj4+Pj4gwqDCoMKg
wqDCoCB7Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGlmICggIXBhZ2Vfc3RhdGVfaXMoY3VyX2hlYWQs
IG9mZmxpbmVkKSApCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHN0cnVjdCBwYWdlX2xpc3RfaGVhZCAq
bGlzdDsKPj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCBwYWdlX3N0YXRlX2lzKGN1cl9oZWFkLCBv
ZmZsaW5lZCkgKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxpc3QgPSAmcGFnZV9vZmZs
aW5lZF9saXN0Owo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBlbHNlIGlmIChwYWdlX3N0YXRlX2lzKGN1
cl9oZWFkLCBicm9rZW4pICkKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsaXN0ID0gJnBh
Z2VfYnJva2VuX2xpc3Q7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGVsc2UKPj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYXZhaWxb
bm9kZV1bem9uZV0tLTsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgdG90YWxfYXZhaWxfcGFnZXMt
LTsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgQVNTRVJUKHRvdGFsX2F2YWlsX3BhZ2VzID49IDAp
Owo+Pj4+IC3CoMKgwqDCoMKgwqDCoCBwYWdlX2xpc3RfYWRkX3RhaWwoY3VyX2hlYWQsCj4+Pj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGVz
dF9iaXQoX1BHQ19icm9rZW4sIAo+Pj4+ICZjdXJfaGVhZC0+Y291bnRfaW5mbykgPwo+Pj4+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZwYWdl
X2Jyb2tlbl9saXN0IDogJnBhZ2Vfb2ZmbGluZWRfbGlzdCk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IHBhZ2VfbGlzdF9hZGRfdGFpbChjdXJfaGVhZCwgbGlzdCk7Cj4+Pgo+Pj4gV2hpbGUgSSByZWFs
aXplIGl0J3MgZmV3ZXIgY29tcGFyaXNvbnMgdGhpcyB3YXksIEkgc3RpbGwgd29uZGVyCj4+PiB3
aGV0aGVyIGZvciB0aGUgcmVhZGVyJ3Mgc2FrZSBpdCB3b3VsZG4ndCBiZXR0ZXIgYmUKPj4+IHBh
Z2VfaXNfb2ZmbGluZWQoKSBmaXJzdCBhbmQgdGhlbiBwYWdlX2lzX2Jyb2tlbigpIGRvd24gaGVy
ZS4KPj4KPj4gTmFoLCB0aGF0IHdvdWxkIGJlIHdvcnNlLiBUaGlzIHdheSB0aGVyZSBhcmUgdHdv
IGNhc2VzIHdoaWNoIGFyZQo+PiBleHBsaWNpdGx5IGhhbmRsZWQgYW5kIHRoZSBsaXN0IHRvIHVz
ZSBmb3IgZWFjaCBvZiB0aGVtIGlzIGV4cGxpY2l0bHkKPj4gc2V0LiBUaGUgJ2lmIChhfHxiKSDi
gKbCoMKgwqAgc29tZV9mdW5jdGlvbihhID8gdGhpbmdfZm9yX2EgOiB0aGluZ19mb3JfYiknCj4+
IGNvbnN0cnVjdCBpcyBtdWNoIGxlc3MgY29tcHJlaGVuc2libGUuCj4gCj4gSXQncyBhIG1hdHRl
ciBvZiB0YXN0ZSwgSSBhZ3JlZSwgYW5kIGluIHN1Y2ggYSBjYXNlIEkgZ2VuZXJhbGx5IGFkdmlz
ZQo+IHRvIHNlZSBhYm91dCBsaW1pdGluZyBjb2RlIGNodXJuLiBGb3IgY29kZSB5b3UgdGhlbiBz
dGlsbCBpbnRyb2R1Y2UKPiBhbmV3LCB5ZXMsIHRhc3RlIGRlY2lzaW9ucyBtYXkgdHlwaWNhbGx5
IGJlIHRvIHRoZSBhdXRob3JzIGp1ZGdlbWVudAo+ICh0aGVyZSBhcmUgZXhjZXB0aW9ucywgdGhv
dWdoKS4KPiAKPj4+PiBAQCAtMTY5OSwxNCArMTcxNCwxNCBAQCB1bnNpZ25lZCBpbnQgb25saW5l
X3BhZ2UobWZuX3QgbWZuLAo+Pj4+IHVpbnQzMl90ICpzdGF0dXMpCj4+Pj4gwqDCoMKgwqDCoCBk
byB7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9ICpzdGF0dXMgPSAwOwo+Pj4+IC3CoMKg
wqDCoMKgwqDCoCBpZiAoIHkgJiBQR0NfYnJva2VuICkKPj4+PiArwqDCoMKgwqDCoMKgwqAgaWYg
KCAoeSAmIFBHQ19zdGF0ZSkgPT0gUEdDX3N0YXRlX2Jyb2tlbiB8fAo+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKHkgJiBQR0Nfc3RhdGUpID09IFBHQ19zdGF0ZV9icm9rZW5fb2ZmbGlu
aW5nICkKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgewo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldCA9IC1FSU5WQUw7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKnN0
YXR1cyA9IFBHX09OTElORV9GQUlMRUQgfFBHX09OTElORV9CUk9LRU47Cj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+PiAt
Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGlmICggKHkgJiBQR0Nfc3RhdGUpID09IFBHQ19zdGF0ZV9v
ZmZsaW5lZCApCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGVsc2UgaWYgKCAoeSAmIFBHQ19zdGF0ZSkg
PT0gUEdDX3N0YXRlX29mZmxpbmVkICkKPj4+Cj4+PiBJIGRvbid0IHNlZSBhIG5lZWQgZm9yIGFk
ZGluZyAiZWxzZSIgaGVyZS4KPj4KPj4gVGhleSBhcmUgbXV0dWFsbHkgZXhjbHVzaXZlIGNhc2Vz
LiBJdCBtYWtlcyB0aGluZ3MgYSB3aG9sZSBsb3QgY2xlYXJlcgo+PiB0byB0aGUgcmVhZGVyIHRv
IHB1dCB0aGUgJ2Vsc2UnIHRoZXJlLCBhbmQgc29tZXRpbWVzIGhlbHBzIGEgbmHDr3ZlCj4+IGNv
bXBpbGVyIGFsb25nIHRoZSB3YXkgdG9vLgo+IAo+IFdlbGwsIEknbSBhZnJhaWQgSSdtIGdvaW5n
IHRvIGJlIHByZXR0eSBzdHJpY3QgYWJvdXQgdGhpczogSXQncyBhZ2Fpbgo+IGEgbWF0dGVyIG9m
IHRhc3RlLCB5ZXMsIGJ1dCB3ZSBnZW5lcmFsbHkgdHJ5IHRvIGF2b2lkIHBvaW50bGVzcyBlbHNl
Lgo+IFdoYXQgeW91IGNvbnNpZGVyICJhIHdob2xlIGxvdCBjbGVhcmVyIHRvIHRoZSByZWFkZXIi
IGlzIHRoZSBvcHBvc2l0ZQo+IGZyb20gbXkgcG92LgoKV2hpbGUgSSBhZ3JlZSB0aGUgJ2Vsc2Un
IG1heSBiZSBwb2ludGxlc3MsIEkgZG9uJ3QgdGhpbmsgaXQgaXMgd29ydGggYW4gCmFyZ3VtZW50
LiBBcyB0aGUgYXV0aG9yIG9mIHRoZSBwYXRjaCwgaXQgaXMgaGlzIGNob2ljZSB0byB3cml0ZSB0
aGUgY29kZSAKbGlrZSB0aGF0LgoKPiAKPj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21t
LmgKPj4+PiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKPj4+PiBAQCAtNjcsMTggKzY3
LDI3IEBACj4+Pj4gwqDCoCAvKiAzLWJpdCBQQVQvUENEL1BXVCBjYWNoZS1hdHRyaWJ1dGUgaGlu
dC4gKi8KPj4+PiDCoCAjZGVmaW5lIFBHQ19jYWNoZWF0dHJfYmFzZSBQR19zaGlmdCg2KQo+Pj4+
IMKgICNkZWZpbmUgUEdDX2NhY2hlYXR0cl9tYXNrIFBHX21hc2soNywgNikKPj4+PiAtIC8qIFBh
Z2UgaXMgYnJva2VuPyAqLwo+Pj4+IC0jZGVmaW5lIF9QR0NfYnJva2VuwqDCoMKgwqDCoMKgIFBH
X3NoaWZ0KDcpCj4+Pj4gLSNkZWZpbmUgUEdDX2Jyb2tlbsKgwqDCoMKgwqDCoMKgIFBHX21hc2so
MSwgNykKPj4+PiAtIC8qIE11dHVhbGx5LWV4Y2x1c2l2ZSBwYWdlIHN0YXRlczogeyBpbnVzZSwg
b2ZmbGluaW5nLCBvZmZsaW5lZCwKPj4+PiBmcmVlIH0uICovCj4+Pj4gLSNkZWZpbmUgUEdDX3N0
YXRlwqDCoMKgwqDCoMKgwqDCoCBQR19tYXNrKDMsIDkpCj4+Pj4gLSNkZWZpbmUgUEdDX3N0YXRl
X2ludXNlwqDCoCBQR19tYXNrKDAsIDkpCj4+Pj4gLSNkZWZpbmUgUEdDX3N0YXRlX29mZmxpbmlu
ZyBQR19tYXNrKDEsIDkpCj4+Pj4gLSNkZWZpbmUgUEdDX3N0YXRlX29mZmxpbmVkIFBHX21hc2so
MiwgOSkKPj4+PiAtI2RlZmluZSBQR0Nfc3RhdGVfZnJlZcKgwqDCoCBQR19tYXNrKDMsIDkpCj4+
Pj4gLSNkZWZpbmUgcGFnZV9zdGF0ZV9pcyhwZywgc3QpICgoKHBnKS0+Y291bnRfaW5mbyZQR0Nf
c3RhdGUpID09Cj4+Pj4gUEdDX3N0YXRlXyMjc3QpCj4+Pj4gLQo+Pj4+IC0gLyogQ291bnQgb2Yg
cmVmZXJlbmNlcyB0byB0aGlzIGZyYW1lLiAqLwo+Pj4+ICsgLyoKPj4+PiArwqAgKiBNdXR1YWxs
eS1leGNsdXNpdmUgcGFnZSBzdGF0ZXM6Cj4+Pj4gK8KgICogeyBpbnVzZSwgb2ZmbGluaW5nLCBv
ZmZsaW5lZCwgZnJlZSwgYnJva2VuX29mZmxpbmluZywgYnJva2VuIH0KPj4+PiArwqAgKi8KPj4+
PiArI2RlZmluZSBQR0Nfc3RhdGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFBH
X21hc2soNywgOSkKPj4+PiArI2RlZmluZSBQR0Nfc3RhdGVfaW51c2XCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFBHX21hc2soMCwgOSkKPj4+PiArI2RlZmluZSBQR0Nfc3RhdGVfb2ZmbGluaW5nwqDC
oMKgwqDCoMKgwqAgUEdfbWFzaygxLCA5KQo+Pj4+ICsjZGVmaW5lIFBHQ19zdGF0ZV9vZmZsaW5l
ZMKgwqDCoMKgwqDCoMKgwqAgUEdfbWFzaygyLCA5KQo+Pj4+ICsjZGVmaW5lIFBHQ19zdGF0ZV9m
cmVlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFBHX21hc2soMywgOSkKPj4+PiArI2RlZmluZSBQ
R0Nfc3RhdGVfYnJva2VuX29mZmxpbmluZyBQR19tYXNrKDQsIDkpCj4+Pgo+Pj4gVEJIIEknZCBw
cmVmZXIgUEdDX3N0YXRlX29mZmxpbmluZ19icm9rZW4sIGFzIGl0J3Mgbm90IHRoZQo+Pj4gb2Zm
bGluaW5nIHdoaWNoIGlzIGJyb2tlbiwgYnV0IGEgYnJva2VuIHBhZ2UgaXMgYmVpbmcKPj4+IG9m
ZmxpbmVkLgo+Pgo+PiBJdCBpcyB0aGUgcGFnZSB3aGljaCBpcyBib3RoIGJyb2tlbiBhbmQgb2Zm
bGluaW5nLgo+PiBPciBpbmRlZWQgaXQgaXMgdGhlIHBhZ2Ugd2hpY2ggaXMgYm90aCBvZmZsaW5p
bmcgYW5kIGJyb2tlbi4KPiAKPiBJLmUuIHlvdSBhZ3JlZSB3aXRoIGZsaXBwaW5nIHRoZSB0d28g
cGFydHMgYXJvdW5kPwo+IAo+Pj4+ICsjZGVmaW5lIHBhZ2VfaXNfb2ZmbGluaW5nKHBnKcKgwqDC
oMKgwqAgKHBhZ2Vfc3RhdGVfaXMoKHBnKSwgCj4+Pj4gYnJva2VuX29mZmxpbmluZykgfHwgXAo+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHBhZ2Vfc3RhdGVfaXMoKHBnKSwgb2ZmbGluaW5nKSkKPj4+Cj4+
PiBPdmVyYWxsIEkgd29uZGVyIHdoZXRoZXIgdGhlIFBHQ19zdGF0ZV8qIG9yZGVyaW5nIGNvdWxk
bid0IGJlCj4+PiBhZGp1c3RlZCBzdWNoIHRoYXQgYXQgbGVhc3Qgc29tZSBvZiB0aGVzZSB0aHJl
ZSB3b24ndCBuZWVkCj4+PiB0d28gY29tcGFyaXNvbnMgKGJ5IG1hc2tpbmcgb2ZmIGEgYml0IGJl
Zm9yZSBjb21wYXJpbmcpLgo+Pgo+PiBUaGUgd2hvbGUgcG9pbnQgaW4gdGhpcyBleGVyY2lzZSBp
cyB0aGF0IHRoZXJlIGlzbid0IGEgd2hvbGUgYml0IGZvcgo+PiB0aGVzZTsgdGhleSBhcmUgZWFj
aCAqdHdvKiBzdGF0ZXMgb3V0IG9mIHRoZSBwb3NzaWJsZSA4Lgo+IAo+IFN1cmUuIEJ1dCBqdXN0
IGNvbnNpZGVyIHRoZSBtb3JlIGdlbmVyYWwgY2FzZTogSW5zdGVhZCBvZiB3cml0aW5nCj4gCj4g
IMKgwqDCoMKgaWYgKCBpID09IDYgfHwgaSA9PSA3ICkKPiAKPiB5b3UgY2FuIGFzIHdlbGwgd3Jp
dGUKPiAKPiAgwqDCoMKgwqBpZiAoIChpIHwgMSkgPT0gNyApCgpJIHN0dW1ibGVkIGFjY3Jvc3Mg
YSBmZXcgb2YgdGhvc2UgcmVjZW50bHkgYW5kIHRoaXMgaXMgbm90IHRoZSBvYnZpb3VzIAp0aGlu
Z3MgdG8gcmVhZC4gWWVzLCB5b3VyIGNvZGUgbWF5IGJlIGZhc3Rlci4gQnV0IGlzIGl0IHJlYWxs
eSB3b3J0aCBpdCAKY29tcGFyZSB0byB0aGUgY29zdCBvZiByZWFkYWJpbGl0eSBhbmQgZnV0dXJl
cHJvb2ZuZXNzPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
