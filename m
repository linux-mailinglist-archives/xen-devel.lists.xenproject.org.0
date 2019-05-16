Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B762092E
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 16:10:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRH3W-0003MX-Vl; Thu, 16 May 2019 14:08:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sIOE=TQ=amazon.com=prvs=03207e7a1=graf@srs-us1.protection.inumbo.net>)
 id 1hRH3V-0003MH-LT
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 14:08:21 +0000
X-Inumbo-ID: 0ebcafb6-77e4-11e9-a8f4-8bba16632c62
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ebcafb6-77e4-11e9-a8f4-8bba16632c62;
 Thu, 16 May 2019 14:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1558015700; x=1589551700;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=6AsMPu5n7/xRBGeC8coqQ6zOLFCMjhjLX1aaMredl0k=;
 b=ibU+r7Aw1Z27N6I5EZ2RBorx+l9yPhmymGjtsi9sxRXfmsFpYDW1F/9h
 SnoMcT2QuDJOEax067VWa+qNlZDJ3Znr6lr6VPucdc1tQq/CYAO622tZ8
 Pb0UFAQcojVc6Mn/PZGu0lW3VFkL3CXbayhNVPIBOylG594UMtI1oYcX5 A=;
X-IronPort-AV: E=Sophos;i="5.60,476,1549929600"; d="scan'208";a="805009174"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1e-a70de69e.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 16 May 2019 14:08:16 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-a70de69e.us-east-1.amazon.com (8.14.7/8.14.7) with
 ESMTP id x4GE8EcT105508
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Thu, 16 May 2019 14:08:15 GMT
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 16 May 2019 14:08:15 +0000
Received: from macbook-2.local (10.43.161.34) by EX13D20UWC001.ant.amazon.com
 (10.43.162.244) with Microsoft SMTP Server (TLS) id 15.0.1367.3;
 Thu, 16 May 2019 14:08:14 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>, Filippo Sironi
 <sironi@amazon.de>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, <borntraeger@de.ibm.com>,
 <boris.ostrovsky@oracle.com>, <cohuck@redhat.com>,
 <konrad.wilk@oracle.com>, <xen-devel@lists.xenproject.org>
References: <1539078879-4372-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-2-git-send-email-sironi@amazon.de>
 <e976f31b-2ccd-29ba-6a32-2edde49f867f@amazon.com>
 <7aae3e49-5b1c-96d1-466e-5b061305dc9d@citrix.com>
From: Alexander Graf <graf@amazon.com>
Message-ID: <22fadfb1-e48d-ccb6-0e42-c105b7335d7a@amazon.com>
Date: Thu, 16 May 2019 07:08:13 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7aae3e49-5b1c-96d1-466e-5b061305dc9d@citrix.com>
Content-Language: en-US
X-Originating-IP: [10.43.161.34]
X-ClientProxiedBy: EX13D27UWB002.ant.amazon.com (10.43.161.167) To
 EX13D20UWC001.ant.amazon.com (10.43.162.244)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 1/2] KVM: Start populating
 /sys/hypervisor with KVM entries
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDE2LjA1LjE5IDA3OjAyLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDE2LzA1LzIwMTkg
MTQ6NTAsIEFsZXhhbmRlciBHcmFmIHdyb3RlOgo+PiBPbiAxNC4wNS4xOSAwODoxNiwgRmlsaXBw
byBTaXJvbmkgd3JvdGU6Cj4+PiBTdGFydCBwb3B1bGF0aW5nIC9zeXMvaHlwZXJ2aXNvciB3aXRo
IEtWTSBlbnRyaWVzIHdoZW4gd2UncmUgcnVubmluZyBvbgo+Pj4gS1ZNLiBUaGlzIGlzIHRvIHJl
cGxpY2F0ZSBmdW5jdGlvbmFsaXR5IHRoYXQncyBhdmFpbGFibGUgd2hlbiB3ZSdyZQo+Pj4gcnVu
bmluZyBvbiBYZW4uCj4+Pgo+Pj4gU3RhcnQgd2l0aCAvc3lzL2h5cGVydmlzb3IvdXVpZCwgd2hp
Y2ggdXNlcnMgcHJlZmVyIG92ZXIKPj4+IC9zeXMvZGV2aWNlcy92aXJ0dWFsL2RtaS9pZC9wcm9k
dWN0X3V1aWQgYXMgYSB3YXkgdG8gcmVjb2duaXplIGEgdmlydHVhbAo+Pj4gbWFjaGluZSwgc2lu
Y2UgaXQncyBhbHNvIGF2YWlsYWJsZSB3aGVuIHJ1bm5pbmcgb24gWGVuIEhWTSBhbmQgb24gWGVu
IFBWCj4+PiBhbmQsIG9uIHRvcCBvZiB0aGF0IGRvZXNuJ3QgcmVxdWlyZSByb290IHByaXZpbGVn
ZXMgYnkgZGVmYXVsdC4KPj4+IExldCdzIGNyZWF0ZSBhcmNoLXNwZWNpZmljIGhvb2tzIHNvIHRo
YXQgZGlmZmVyZW50IGFyY2hpdGVjdHVyZXMgY2FuCj4+PiBwcm92aWRlIGRpZmZlcmVudCBpbXBs
ZW1lbnRhdGlvbnMuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRmlsaXBwbyBTaXJvbmkgPHNpcm9u
aUBhbWF6b24uZGU+Cj4+IEkgdGhpbmsgdGhpcyBuZWVkcyBzb21ldGhpbmcgYWtpbiB0bwo+Pgo+
PiAgIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL0RvY3VtZW50YXRpb24vQUJJL3N0YWJsZS9z
eXNmcy1oeXBlcnZpc29yLXhlbgo+Pgo+PiB0byBkb2N1bWVudCB3aGljaCBmaWxlcyBhcmUgYXZh
aWxhYmxlLgo+Pgo+Pj4gLS0tCj4+PiB2MjoKPj4+ICogbW92ZSB0aGUgcmV0cmlldmFsIG9mIHRo
ZSBWTSBVVUlEIG91dCBvZiB1dWlkX3Nob3cgYW5kIGludG8KPj4+ICAga3ZtX3BhcmFfZ2V0X3V1
aWQsIHdoaWNoIGlzIGEgd2VhayBmdW5jdGlvbiB0aGF0IGNhbiBiZSBvdmVyd3JpdHRlbgo+Pj4K
Pj4+ICBkcml2ZXJzL0tjb25maWcgICAgICAgICAgICAgIHwgIDIgKysKPj4+ICBkcml2ZXJzL01h
a2VmaWxlICAgICAgICAgICAgIHwgIDIgKysKPj4+ICBkcml2ZXJzL2t2bS9LY29uZmlnICAgICAg
ICAgIHwgMTQgKysrKysrKysrKysrKysKPj4+ICBkcml2ZXJzL2t2bS9NYWtlZmlsZSAgICAgICAg
IHwgIDEgKwo+Pj4gIGRyaXZlcnMva3ZtL3N5cy1oeXBlcnZpc29yLmMgfCAzMCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPj4+ICA1IGZpbGVzIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMo
KykKPj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9rdm0vS2NvbmZpZwo+Pj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2t2bS9NYWtlZmlsZQo+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2t2bS9zeXMtaHlwZXJ2aXNvci5jCj4+Pgo+PiBbLi4uXQo+Pgo+Pj4gKwo+Pj4g
K19fd2VhayBjb25zdCBjaGFyICprdm1fcGFyYV9nZXRfdXVpZCh2b2lkKQo+Pj4gK3sKPj4+ICsJ
cmV0dXJuIE5VTEw7Cj4+PiArfQo+Pj4gKwo+Pj4gK3N0YXRpYyBzc2l6ZV90IHV1aWRfc2hvdyhz
dHJ1Y3Qga29iamVjdCAqb2JqLAo+Pj4gKwkJCSBzdHJ1Y3Qga29ial9hdHRyaWJ1dGUgKmF0dHIs
Cj4+PiArCQkJIGNoYXIgKmJ1ZikKPj4+ICt7Cj4+PiArCWNvbnN0IGNoYXIgKnV1aWQgPSBrdm1f
cGFyYV9nZXRfdXVpZCgpOwo+Pj4gKwlyZXR1cm4gc3ByaW50ZihidWYsICIlc1xuIiwgdXVpZCk7
Cj4+IFRoZSB1c3VhbCByZXR1cm4gdmFsdWUgZm9yIHRoZSBYZW4gL3N5cy9oeXBlcnZpc29yIGlu
dGVyZmFjZSBpcwo+PiAiPGRlbmllZD4iLgo+IFRoaXMgc3RyaW5nIGNvbWVzIHN0cmFpZ2h0IGZy
b20gWGVuLgo+Cj4gSXQgd2FzIGFuIGVmZm9ydCB0byByZWR1Y2UgdGhlIHF1YW50aXR5IG9mIGlu
dGVyZXN0aW5nIGZpbmdlcnByaW50YWJsZQo+IGRhdGEgYWNjZXNzYWJsZSBieSBkZWZhdWx0IHRv
IHVucHJpdmlsZWdlZCBndWVzdHMuCj4KPiBTZWUKPiBodHRwczovL3hlbmJpdHMueGVuLm9yZy9n
aXR3ZWIvP3A9eGVuLmdpdDthPWNvbW1pdGRpZmY7aD1hMmZjOGQ1MTRkZjJiMzhjMzEwZDRmNDQz
MmZlMDY1MjBiMDc2OWVkCgoKV2hhdCBhIGdyZWF0IGRlc2lnbiA6KS4gTXkgcG9pbnQgaXMgbW9z
dGx5IHRoYXQgd2Ugc2hvdWxkIGJlIGFzIGNvbW1vbgphcyBwb3NzaWJsZSB3aGVuIGl0IGNvbWVz
IHRvIC9zeXMvaHlwZXJ2aXNvciwgc28gdGhhdCB0b29scyBkb24ndCBoYXZlCnRvIGNhcmUgYWJv
dXQgdGhlIEhWIHRoZXkncmUgd29ya2luZyBhZ2FpbnN0LgoKQnkgYmVpbmcgZmlyc3QgdG8gaW1w
bGVtZW50IDxkZW5pZWQ+IHlvdSBqdXN0IGNyZWF0ZWQgcHJlY2VkZW5jZSwgc28gd2UKY2FuIGVp
dGhlciBzaW11bGF0ZSB0aGUgc2FtZSBiZWhhdm9yIGZvciBLVk0gb3IgYmUgZGlmZmVyZW50LiBB
bmQgc2luY2UKY29tbW9uYWxpdHkgaXMgZ29vZCwgSSdkIHJhdGhlciBiZSB0aGUgc2FtZS4KClRo
YXQgc2FpZCwgSSBjb3VsZG4ndCBmaW5kIGluIHRoZSBwYXRkY2ggYWJvdmUgd2hldGhlciBYZW4g
ZXZlbiBlbWl0cwo8ZGVuaWVkPiBmb3IgdGhlIHV1aWQuIERvZXMgaXQgaGF2ZSB0aGF0IGNhcGFi
aWxpdHk/IElmIG5vdCwgd2UgbWF5IGFzCndlbGwgZ28gd2l0aCAobnVsbCkuCgoKQWxleAoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
