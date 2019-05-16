Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 974D620B2D
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 17:28:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRIFo-0002hr-DG; Thu, 16 May 2019 15:25:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XxdW=TQ=amazon.de=prvs=03221fa14=sironi@srs-us1.protection.inumbo.net>)
 id 1hRIFm-0002hj-Ud
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 15:25:06 +0000
X-Inumbo-ID: c88864f8-77ee-11e9-92ed-ebf9eb2e7db0
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c88864f8-77ee-11e9-92ed-ebf9eb2e7db0;
 Thu, 16 May 2019 15:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1558020306; x=1589556306;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=kUZ9rEq+loBEpuV/agF7lMwxuKWMwuSBBWGCLZkR43o=;
 b=gj0/FSOvM4dQoxmEbvnqIs8YNp1mgLWUaf3Vp92IlAIsZ6DjphFkww0s
 JEUFn/d5bhbxCp0y/SW7k89wFTjNgywB/rU/oKeoAFdLatmU5PgZEBgkv
 /VinmJlon51HeH1HGBZoqVTLlqxBzNpQ7GUK23WhqWwveNz/a81QxxPpP g=;
X-IronPort-AV: E=Sophos;i="5.60,477,1549929600"; d="scan'208";a="733383237"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-3714e498.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 16 May 2019 15:25:03 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2b-3714e498.us-west-2.amazon.com (8.14.7/8.14.7) with
 ESMTP id x4GFOu5J042984
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Thu, 16 May 2019 15:25:02 GMT
Received: from EX13D02EUC002.ant.amazon.com (10.43.164.14) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 16 May 2019 15:25:01 +0000
Received: from EX13D02EUC001.ant.amazon.com (10.43.164.92) by
 EX13D02EUC002.ant.amazon.com (10.43.164.14) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 16 May 2019 15:25:00 +0000
Received: from EX13D02EUC001.ant.amazon.com ([10.43.164.92]) by
 EX13D02EUC001.ant.amazon.com ([10.43.164.92]) with mapi id 15.00.1367.000;
 Thu, 16 May 2019 15:25:00 +0000
From: "Sironi, Filippo" <sironi@amazon.de>
To: "Graf, Alexander" <graf@amazon.com>
Thread-Topic: [PATCH v2 2/2] KVM: x86: Implement the arch-specific hook to
 report the VM UUID
Thread-Index: AQHVCmgxSNZRVPU/lkacpReSlg9JAaZtyWCAgAAY24A=
Date: Thu, 16 May 2019 15:25:00 +0000
Message-ID: <7395EFE9-0B38-4B61-81D4-E8450561AABE@amazon.de>
References: <1539078879-4372-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-3-git-send-email-sironi@amazon.de>
 <f51a6a84-b21c-ab75-7e30-bfbe2ac6b98b@amazon.com>
In-Reply-To: <f51a6a84-b21c-ab75-7e30-bfbe2ac6b98b@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.108]
Content-ID: <322B72780715F949BC86D7AC0C1B0C37@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 2/2] KVM: x86: Implement the
 arch-specific hook to report the VM UUID
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: KVM list <kvm@vger.kernel.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "vasu.srinivasan@oracle.com" <vasu.srinivasan@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cj4gT24gMTYuIE1heSAyMDE5LCBhdCAxNTo1NiwgR3JhZiwgQWxleGFuZGVyIDxncmFmQGFtYXpv
bi5jb20+IHdyb3RlOgo+IAo+IE9uIDE0LjA1LjE5IDA4OjE2LCBGaWxpcHBvIFNpcm9uaSB3cm90
ZToKPj4gT24geDg2LCB3ZSByZXBvcnQgdGhlIFVVSUQgaW4gRE1JIFN5c3RlbSBJbmZvcm1hdGlv
biAoaS5lLiwgRE1JIFR5cGUgMSkKPj4gYXMgVk0gVVVJRC4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6
IEZpbGlwcG8gU2lyb25pIDxzaXJvbmlAYW1hem9uLmRlPgo+PiAtLS0KPj4gYXJjaC94ODYva2Vy
bmVsL2t2bS5jIHwgNyArKysrKysrCj4+IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykK
Pj4gCj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwva3ZtLmMgYi9hcmNoL3g4Ni9rZXJu
ZWwva3ZtLmMKPj4gaW5kZXggNWM5M2E2NWVlMWU1Li40NDFjYWIwOGEwOWQgMTAwNjQ0Cj4+IC0t
LSBhL2FyY2gveDg2L2tlcm5lbC9rdm0uYwo+PiArKysgYi9hcmNoL3g4Ni9rZXJuZWwva3ZtLmMK
Pj4gQEAgLTI1LDYgKzI1LDcgQEAKPj4gI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+PiAjaW5j
bHVkZSA8bGludXgva3ZtX3BhcmEuaD4KPj4gI2luY2x1ZGUgPGxpbnV4L2NwdS5oPgo+PiArI2lu
Y2x1ZGUgPGxpbnV4L2RtaS5oPgo+PiAjaW5jbHVkZSA8bGludXgvbW0uaD4KPj4gI2luY2x1ZGUg
PGxpbnV4L2hpZ2htZW0uaD4KPj4gI2luY2x1ZGUgPGxpbnV4L2hhcmRpcnEuaD4KPj4gQEAgLTY5
NCw2ICs2OTUsMTIgQEAgYm9vbCBrdm1fcGFyYV9hdmFpbGFibGUodm9pZCkKPj4gfQo+PiBFWFBP
UlRfU1lNQk9MX0dQTChrdm1fcGFyYV9hdmFpbGFibGUpOwo+PiAKPj4gK2NvbnN0IGNoYXIgKmt2
bV9wYXJhX2dldF91dWlkKHZvaWQpCj4+ICt7Cj4+ICsJcmV0dXJuIGRtaV9nZXRfc3lzdGVtX2lu
Zm8oRE1JX1BST0RVQ1RfVVVJRCk7Cj4gCj4gVGhpcyBhZGRzIGEgbmV3IGRlcGVuZGVuY3kgb24g
Q09ORklHX0RNSS4gUHJvYmFibHkgYmVzdCB0byBndWFyZCBpdCB3aXRoCj4gYW4gI2lmIElTX0VO
QUJMRUQoQ09ORklHX0RNSSkuCj4gCj4gVGhlIGNvbmNlcHQgc2VlbXMgc291bmQgdGhvdWdoLgo+
IAo+IEFsZXgKCmluY2x1ZGUvbGludXgvZG1pLmggY29udGFpbnMgYSBkdW1teSBpbXBsZW1lbnRh
dGlvbiBvZgpkbWlfZ2V0X3N5c3RlbV9pbmZvIHRoYXQgcmV0dXJucyBOVUxMIGlmIENPTkZJR19E
TUkgaXNuJ3QgZGVmaW5lZC4KVGhpcyBpcyBlbm91Z2ggdW5sZXNzIHdlIGRlY2lkZSB0byByZXR1
cm4gIjxkZW5pZWQ+IiBsaWtlIGluIFhlbi4KSWYgdGhlbiwgd2UgY2FuIGhhdmUgdGhlIGNoZWNr
IGluIHRoZSBnZW5lcmljIGNvZGUgdG8gdHVybiBOVUxMCmludG8gIjxkZW5pZWQ+Ii4KCkZpbGlw
cG8KCgo+PiArfQo+PiArRVhQT1JUX1NZTUJPTF9HUEwoa3ZtX3BhcmFfZ2V0X3V1aWQpOwo+PiAr
Cj4+IHVuc2lnbmVkIGludCBrdm1fYXJjaF9wYXJhX2ZlYXR1cmVzKHZvaWQpCj4+IHsKPj4gCXJl
dHVybiBjcHVpZF9lYXgoa3ZtX2NwdWlkX2Jhc2UoKSB8IEtWTV9DUFVJRF9GRUFUVVJFUyk7CgoK
CgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAox
MDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhyZXI6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYg
SGVyYnJpY2gKVXN0LUlEOiBERSAyODkgMjM3IDg3OQpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNo
dCBDaGFybG90dGVuYnVyZyBIUkIgMTQ5MTczIEIKCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
