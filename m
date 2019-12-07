Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A92115E1D
	for <lists+xen-devel@lfdr.de>; Sat,  7 Dec 2019 20:07:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idfNd-0003wT-8h; Sat, 07 Dec 2019 19:04:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ACXR=Z5=amazon.com=prvs=2375083a5=jgrall@srs-us1.protection.inumbo.net>)
 id 1idfNb-0003wO-Ma
 for xen-devel@lists.xenproject.org; Sat, 07 Dec 2019 19:04:35 +0000
X-Inumbo-ID: 68100aa4-1924-11ea-88e7-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68100aa4-1924-11ea-88e7-bc764e2007e4;
 Sat, 07 Dec 2019 19:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575745475; x=1607281475;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=koPh7R30J5P2Y1y9Y27aazrIoZfC+6U4exD13DiHyi8=;
 b=Xpkdh/Aw1Th/FtGcnVS0LfLb+VKh+SD+rD6MF2ZzloLZhuyntxjNfdvW
 HeiRwKGSsW62p6Me17pY8KxaSV4BmdYxAvLMHfdttT14k8y5fA0G+UoXe
 /a1dq7tV92w9kBHXcD9rajSVPAtaWpQApSZ7jc9VwI683FyjIIvG+tALA I=;
IronPort-SDR: Jj+dFqbvo/VaFZwlOSlR1V1b7vurBdpmUa7f5rl2/qrcHDdRDZsFd3k1iT6atOzaz+REhkATJ0
 VdfYLeE9DGOg==
X-IronPort-AV: E=Sophos;i="5.69,289,1571702400"; 
   d="scan'208";a="3779527"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-397e131e.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 07 Dec 2019 19:04:23 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-397e131e.us-west-2.amazon.com (Postfix) with ESMTPS
 id 0C1C5A2688; Sat,  7 Dec 2019 19:04:22 +0000 (UTC)
Received: from EX13D37EUB002.ant.amazon.com (10.43.166.116) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Sat, 7 Dec 2019 19:04:22 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D37EUB002.ant.amazon.com (10.43.166.116) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Sat, 7 Dec 2019 19:04:21 +0000
Received: from a483e7b01a66.ant.amazon.com (10.95.117.106) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Sat, 7 Dec 2019 19:04:19 +0000
To: Hongyan Xia <hongyxia@amazon.com>, <xen-devel@lists.xenproject.org>
References: <cover.1575646580.git.hongyxia@amazon.com>
 <86a6fb68f76ab287f5c2d99d1e7954e8b2d1ab05.1575646580.git.hongyxia@amazon.com>
From: Julien Grall <jgrall@amazon.com>
Message-ID: <e303e937-7341-5c39-7a12-c0d055d8fce4@amazon.com>
Date: Sat, 7 Dec 2019 19:04:18 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <86a6fb68f76ab287f5c2d99d1e7954e8b2d1ab05.1575646580.git.hongyxia@amazon.com>
Content-Language: en-GB
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 1/2] x86/mm: factor out the code for
 shattering an l3 PTE
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSG9uZ3lhbiwKCk9uIDA2LzEyLzIwMTkgMTU6NTMsIEhvbmd5YW4gWGlhIHdyb3RlOgo+IG1h
cF9wYWdlc190b194ZW4gYW5kIG1vZGlmeV94ZW5fbWFwcGluZ3MgYXJlIHBlcmZvcm1pbmcgYWxt
b3N0IGV4YWN0bHkKPiB0aGUgc2FtZSBvcGVyYXRpb25zIHdoZW4gc2hhdHRlcmluZyBhbiBsMyBQ
VEUsIHRoZSBvbmx5IGRpZmZlcmVuY2UKPiBiZWluZyB3aGV0aGVyIHdlIHdhbnQgdG8gZmx1c2gu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSG9uZ3lhbiBYaWEgPGhvbmd5eGlhQGFtYXpvbi5jb20+Cj4g
LS0tCj4gICB4ZW4vYXJjaC94ODYvbW0uYyB8IDg1ICsrKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygr
KSwgNDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIv
eGVuL2FyY2gveDg2L21tLmMKPiBpbmRleCA3ZDRkZDgwYTg1Li40MmFhYWExMDgzIDEwMDY0NAo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCj4gKysrIGIveGVuL2FyY2gveDg2L21tLmMKPiBAQCAt
NTE1MSw2ICs1MTUxLDQzIEBAIGwxX3BnZW50cnlfdCAqdmlydF90b194ZW5fbDFlKHVuc2lnbmVk
IGxvbmcgdikKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICBmbHVzaF9hcmVhX2xvY2FsKChj
b25zdCB2b2lkICopdiwgZikgOiBcCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgZmx1c2hf
YXJlYV9hbGwoKGNvbnN0IHZvaWQgKil2LCBmKSkKPiAgIAo+ICsvKiBTaGF0dGVyIGFuIGwzIGVu
dHJ5IGFuZCBwb3B1bGF0ZSBsMi4gSWYgdmlydCBpcyBwYXNzZWQgaW4sIGFsc28gZG8gZmx1c2gu
ICovCj4gK3N0YXRpYyB2b2lkIHNoYXR0ZXJfbDNlKGwzX3BnZW50cnlfdCAqcGwzZSwgbDJfcGdl
bnRyeV90ICpsMnQsCj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyB2aXJ0LCBib29sIGxvY2tpbmcp
Cj4gK3sKPiArICAgIHVuc2lnbmVkIGludCBpOwo+ICsgICAgbDNfcGdlbnRyeV90IG9sM2UgPSAq
cGwzZTsKPiArCj4gKyAgICBmb3IgKCBpID0gMDsgaSA8IEwyX1BBR0VUQUJMRV9FTlRSSUVTOyBp
KysgKQo+ICsgICAgICAgIGwyZV93cml0ZShsMnQgKyBpLAo+ICsgICAgICAgICAgICAgICAgICBs
MmVfZnJvbV9wZm4obDNlX2dldF9wZm4ob2wzZSkgKwo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKGkgPDwgUEFHRVRBQkxFX09SREVSKSwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGwzZV9nZXRfZmxhZ3Mob2wzZSkpKTsKCkkgdW5kZXJzdGFuZCB0aGlzIGlzIGp1
c3QgYSBmYWN0b3Igb3V0IG9mIHRoZSBjdXJyZW50IGNvZGUsIGJ1dCB0aGUgY29kZSAKZmVlbHMg
d3JvbmcgKGF0IGxlYXN0IGluIHRoZW9yeSkgYW5kIHdhc3RlZnVsLgoKWW91IHdvdWxkIGFsbG9j
YXRlIHRoZSBMMiB0YWJsZSwgcHJlcGFyZSBpdCBhbmQgdGhlbiBmcmVlIGl0IGlmIHRoZSBMMyAK
ZW50cnkgaGFzIF9QQUdFX1BSRVNFTlQgb3IgX1BBR0VfUFNFIGNsZWFyZWQuCgpBbHNvLCBpbiB0
aGVvcnksIHRoZXJlIGlzIG5vdGhpbmcgcHJldmVudGluZyB0aGUgbDMgZmxhZ3MgdG8gYmUgbW9k
aWZpZWQgCmJlaGluZCB5b3VyIGJhY2suIFNvIHlvdSBjb3VsZCBlbmQgdXAgdG8gZ2VuZXJhdGUg
dGhlIGwyIGVudHJpZXMgd2l0aCAKdGhlIG9sZCBsMyBmbGFncy4KCkluIG51dHNoZWxsLCBpdCBm
ZWVscyB0byBtZSB0aGF0IHRoZSBzaGF0dGVyaW5nL2FsbG9jYXRpb24gc2hvdWxkIGhhcHBlbiAK
d2l0aCB0aGUgbG9jayB0YWtlbi4gVGhpcyB3b3VsZCBhbHNvIGFsbG93IHlvdSB0byBub3QgYWxs
b2NhdGUgdGhlIGwyIAp0YWJsZSB3aGVuIHlvdSBhcmUgcmVtb3ZpbmcgdGhlIHBhZ2UuCgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
