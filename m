Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A16FF20E3B
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 19:51:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRKVF-0007ic-Vk; Thu, 16 May 2019 17:49:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sIOE=TQ=amazon.com=prvs=03207e7a1=graf@srs-us1.protection.inumbo.net>)
 id 1hRKVE-0007iX-Vb
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 17:49:13 +0000
X-Inumbo-ID: e987f2f4-7802-11e9-9717-bf5a6fb05cac
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e987f2f4-7802-11e9-9717-bf5a6fb05cac;
 Thu, 16 May 2019 17:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1558028952; x=1589564952;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=9nVrkLPFrKFzW5I8vXU9JV7oHZCN/SUECinSigxy+dM=;
 b=ZG9pEzo3vTRjJoUTzgiD64hMr5k+LlmNXSUstu9+nNicCkMn6L3/lNRf
 fUUmjcJTOzKcC/gAyzkwMRVzI2C702rjnqzdRD5P8nwVNOKCZCk5BGUmK
 A7BpADgRwSq81lpSyRQ9YK+49z0EnEns3LalWaiwqSSeAAvQRfg5aVTgh A=;
X-IronPort-AV: E=Sophos;i="5.60,477,1549929600"; d="scan'208";a="674736306"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-2b-baacba05.us-west-2.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 16 May 2019 17:49:07 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2b-baacba05.us-west-2.amazon.com (8.14.7/8.14.7) with
 ESMTP id x4GHn6De107439
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Thu, 16 May 2019 17:49:07 GMT
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 16 May 2019 17:49:06 +0000
Received: from macbook-2.local (10.43.160.4) by EX13D20UWC001.ant.amazon.com
 (10.43.162.244) with Microsoft SMTP Server (TLS) id 15.0.1367.3; Thu, 16 May
 2019 17:49:05 +0000
To: "Sironi, Filippo" <sironi@amazon.de>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>
References: <1539078879-4372-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-3-git-send-email-sironi@amazon.de>
 <f51a6a84-b21c-ab75-7e30-bfbe2ac6b98b@amazon.com>
 <7395EFE9-0B38-4B61-81D4-E8450561AABE@amazon.de>
 <8c6a2de2-f080-aad5-16af-c4a5eafb31af@amazon.com>
 <3a9762a2-24e8-a842-862d-fadae563361d@oracle.com>
 <DD0087B6-094D-4D07-9C85-827881E3DDD0@amazon.de>
From: Alexander Graf <graf@amazon.com>
Message-ID: <cb50c8a6-58e7-e123-feb9-d9dd2bc33b34@amazon.com>
Date: Thu, 16 May 2019 10:49:03 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <DD0087B6-094D-4D07-9C85-827881E3DDD0@amazon.de>
Content-Language: en-US
X-Originating-IP: [10.43.160.4]
X-ClientProxiedBy: EX13D27UWB001.ant.amazon.com (10.43.161.169) To
 EX13D20UWC001.ant.amazon.com (10.43.162.244)
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
 "vasu.srinivasan@oracle.com" <vasu.srinivasan@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDE2LjA1LjE5IDEwOjQxLCBTaXJvbmksIEZpbGlwcG8gd3JvdGU6Cj4+IE9uIDE2LiBNYXkg
MjAxOSwgYXQgMTg6NDAsIEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5j
b20+IHdyb3RlOgo+Pgo+PiBPbiA1LzE2LzE5IDExOjMzIEFNLCBBbGV4YW5kZXIgR3JhZiB3cm90
ZToKPj4+IE9uIDE2LjA1LjE5IDA4OjI1LCBTaXJvbmksIEZpbGlwcG8gd3JvdGU6Cj4+Pj4+IE9u
IDE2LiBNYXkgMjAxOSwgYXQgMTU6NTYsIEdyYWYsIEFsZXhhbmRlciA8Z3JhZkBhbWF6b24uY29t
PiB3cm90ZToKPj4+Pj4KPj4+Pj4gT24gMTQuMDUuMTkgMDg6MTYsIEZpbGlwcG8gU2lyb25pIHdy
b3RlOgo+Pj4+Pj4gT24geDg2LCB3ZSByZXBvcnQgdGhlIFVVSUQgaW4gRE1JIFN5c3RlbSBJbmZv
cm1hdGlvbiAoaS5lLiwgRE1JIFR5cGUgMSkKPj4+Pj4+IGFzIFZNIFVVSUQuCj4+Pj4+Pgo+Pj4+
Pj4gU2lnbmVkLW9mZi1ieTogRmlsaXBwbyBTaXJvbmkgPHNpcm9uaUBhbWF6b24uZGU+Cj4+Pj4+
PiAtLS0KPj4+Pj4+IGFyY2gveDg2L2tlcm5lbC9rdm0uYyB8IDcgKysrKysrKwo+Pj4+Pj4gMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9h
cmNoL3g4Ni9rZXJuZWwva3ZtLmMgYi9hcmNoL3g4Ni9rZXJuZWwva3ZtLmMKPj4+Pj4+IGluZGV4
IDVjOTNhNjVlZTFlNS4uNDQxY2FiMDhhMDlkIDEwMDY0NAo+Pj4+Pj4gLS0tIGEvYXJjaC94ODYv
a2VybmVsL2t2bS5jCj4+Pj4+PiArKysgYi9hcmNoL3g4Ni9rZXJuZWwva3ZtLmMKPj4+Pj4+IEBA
IC0yNSw2ICsyNSw3IEBACj4+Pj4+PiAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4+Pj4+PiAj
aW5jbHVkZSA8bGludXgva3ZtX3BhcmEuaD4KPj4+Pj4+ICNpbmNsdWRlIDxsaW51eC9jcHUuaD4K
Pj4+Pj4+ICsjaW5jbHVkZSA8bGludXgvZG1pLmg+Cj4+Pj4+PiAjaW5jbHVkZSA8bGludXgvbW0u
aD4KPj4+Pj4+ICNpbmNsdWRlIDxsaW51eC9oaWdobWVtLmg+Cj4+Pj4+PiAjaW5jbHVkZSA8bGlu
dXgvaGFyZGlycS5oPgo+Pj4+Pj4gQEAgLTY5NCw2ICs2OTUsMTIgQEAgYm9vbCBrdm1fcGFyYV9h
dmFpbGFibGUodm9pZCkKPj4+Pj4+IH0KPj4+Pj4+IEVYUE9SVF9TWU1CT0xfR1BMKGt2bV9wYXJh
X2F2YWlsYWJsZSk7Cj4+Pj4+Pgo+Pj4+Pj4gK2NvbnN0IGNoYXIgKmt2bV9wYXJhX2dldF91dWlk
KHZvaWQpCj4+Pj4+PiArewo+Pj4+Pj4gKwlyZXR1cm4gZG1pX2dldF9zeXN0ZW1faW5mbyhETUlf
UFJPRFVDVF9VVUlEKTsKPj4+Pj4gVGhpcyBhZGRzIGEgbmV3IGRlcGVuZGVuY3kgb24gQ09ORklH
X0RNSS4gUHJvYmFibHkgYmVzdCB0byBndWFyZCBpdCB3aXRoCj4+Pj4+IGFuICNpZiBJU19FTkFC
TEVEKENPTkZJR19ETUkpLgo+Pj4+Pgo+Pj4+PiBUaGUgY29uY2VwdCBzZWVtcyBzb3VuZCB0aG91
Z2guCj4+Pj4+Cj4+Pj4+IEFsZXgKPj4+PiBpbmNsdWRlL2xpbnV4L2RtaS5oIGNvbnRhaW5zIGEg
ZHVtbXkgaW1wbGVtZW50YXRpb24gb2YKPj4+PiBkbWlfZ2V0X3N5c3RlbV9pbmZvIHRoYXQgcmV0
dXJucyBOVUxMIGlmIENPTkZJR19ETUkgaXNuJ3QgZGVmaW5lZC4KPj4+IE9oLCBJIG1pc3NlZCB0
aGF0IGJpdC4gQXdlc29tZSEgTGVzcyB3b3JrIDopLgo+Pj4KPj4+Cj4+Pj4gVGhpcyBpcyBlbm91
Z2ggdW5sZXNzIHdlIGRlY2lkZSB0byByZXR1cm4gIjxkZW5pZWQ+IiBsaWtlIGluIFhlbi4KPj4+
PiBJZiB0aGVuLCB3ZSBjYW4gaGF2ZSB0aGUgY2hlY2sgaW4gdGhlIGdlbmVyaWMgY29kZSB0byB0
dXJuIE5VTEwKPj4+PiBpbnRvICI8ZGVuaWVkPiIuCj4+PiBZZXMuIFdhaXRpbmcgZm9yIHNvbWVv
bmUgZnJvbSBYZW4gdG8gYW5zd2VyIHRoaXMgOikKPj4gTm90IHN1cmUgSSBhbSBhbnN3ZXJpbmcg
eW91ciBxdWVzdGlvbiBidXQgb24gWGVuIHdlIHJldHVybiBVVUlEIHZhbHVlCj4+IHplcm8gaWYg
YWNjZXNzIHBlcm1pc3Npb25zIGFyZSBub3Qgc3VmZmljaWVudC4gTm90IDxkZW5pZWQ+Lgo+Pgo+
PiBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9YmxvYjtmPXhlbi9j
b21tb24va2VybmVsLmM7aD02MTI1NzU0MzBmMWNlN2ZhZjViZDY2ZTdhOTlmMTc1OGM2M2ZiM2Ni
O2hiPUhFQUQjbDUwNgo+Pgo+PiAtYm9yaXMKPiBUaGVuLCBJIGJlbGlldmUgdGhhdCByZXR1cm5p
bmcgMDAwMDAwMDAtMDAwMC0wMDAwLTAwMDAtMDAwMDAwMDAwMDAwCj4gaW5zdGVhZCBvZiBOVUxM
IGluIHRoZSB3ZWFrIGltcGxlbWVudGF0aW9uIG9mIDEvMiBhbmQgdHJhbnNsYXRpbmcKPiBOVUxM
IGludG8gMDAwMDAwMDAtMDAwMC0wMDAwLTAwMDAtMDAwMDAwMDAwMDAwIGlzIHRoZSBiZXR0ZXIg
YXBwcm9hY2guCgoKSnVzdCBrZWVwIGl0IGF0IE5VTEwgaW4ga3ZtX3BhcmFfZ2V0X3V1aWQoKSBh
bmQgY29udmVydCB0byB0aGUgY2Fub25pY2FsCjAwMDAwMDAwLTAwMDAtMDAwMC0wMDAwLTAwMDAw
MDAwMDAwMCBpbiB1dWlkX3Nob3coKS4KCkFsZXgKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
