Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 097D775FDF
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 09:31:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqueT-0007oj-0Q; Fri, 26 Jul 2019 07:28:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=X75G=VX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hqueR-0007oe-SR
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 07:28:27 +0000
X-Inumbo-ID: f38abccc-af76-11e9-bdfe-4f98800d3655
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f38abccc-af76-11e9-bdfe-4f98800d3655;
 Fri, 26 Jul 2019 07:28:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 18647AF47;
 Fri, 26 Jul 2019 07:28:23 +0000 (UTC)
To: Nadav Amit <namit@vmware.com>, Andy Lutomirski <luto@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>
References: <20190719005837.4150-1-namit@vmware.com>
 <20190719005837.4150-5-namit@vmware.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <3fc06d95-5f17-4642-cd91-49a0f70057c0@suse.com>
Date: Fri, 26 Jul 2019 09:28:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190719005837.4150-5-namit@vmware.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v3 4/9] x86/mm/tlb: Flush remote and local
 TLBs concurrently
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
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
 Stephen Hemminger <sthemmin@microsoft.com>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Paolo Bonzini <pbonzini@redhat.com>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDcuMTkgMDI6NTgsIE5hZGF2IEFtaXQgd3JvdGU6Cj4gVG8gaW1wcm92ZSBUTEIgc2hv
b3Rkb3duIHBlcmZvcm1hbmNlLCBmbHVzaCB0aGUgcmVtb3RlIGFuZCBsb2NhbCBUTEJzCj4gY29u
Y3VycmVudGx5LiBJbnRyb2R1Y2UgZmx1c2hfdGxiX211bHRpKCkgdGhhdCBkb2VzIHNvLiBJbnRy
b2R1Y2UKPiBwYXJhdmlydHVhbCB2ZXJzaW9ucyBvZiBmbHVzaF90bGJfbXVsdGkoKSBmb3IgS1ZN
LCBYZW4gYW5kIGh5cGVyLXYgKFhlbgo+IGFuZCBoeXBlci12IGFyZSBvbmx5IGNvbXBpbGUtdGVz
dGVkKS4KPiAKPiBXaGlsZSB0aGUgdXBkYXRlZCBzbXAgaW5mcmFzdHJ1Y3R1cmUgaXMgY2FwYWJs
ZSBvZiBydW5uaW5nIGEgZnVuY3Rpb24gb24KPiBhIHNpbmdsZSBsb2NhbCBjb3JlLCBpdCBpcyBu
b3Qgb3B0aW1pemVkIGZvciB0aGlzIGNhc2UuIFRoZSBtdWx0aXBsZQo+IGZ1bmN0aW9uIGNhbGxz
IGFuZCB0aGUgaW5kaXJlY3QgYnJhbmNoIGludHJvZHVjZSBzb21lIG92ZXJoZWFkLCBhbmQKPiBt
aWdodCBtYWtlIGxvY2FsIFRMQiBmbHVzaGVzIHNsb3dlciB0aGFuIHRoZXkgd2VyZSBiZWZvcmUg
dGhlIHJlY2VudAo+IGNoYW5nZXMuCj4gCj4gQmVmb3JlIGNhbGxpbmcgdGhlIFNNUCBpbmZyYXN0
cnVjdHVyZSwgY2hlY2sgaWYgb25seSBhIGxvY2FsIFRMQiBmbHVzaAo+IGlzIG5lZWRlZCB0byBy
ZXN0b3JlIHRoZSBsb3N0IHBlcmZvcm1hbmNlIGluIHRoaXMgY29tbW9uIGNhc2UuIFRoaXMKPiBy
ZXF1aXJlcyB0byBjaGVjayBtbV9jcHVtYXNrKCkgb25lIG1vcmUgdGltZSwgYnV0IHVubGVzcyB0
aGlzIG1hc2sgaXMKPiB1cGRhdGVkIHZlcnkgZnJlcXVlbnRseSwgdGhpcyBzaG91bGQgaW1wYWN0
IHBlcmZvcm1hbmNlIG5lZ2F0aXZlbHkuCj4gCj4gQ2M6ICJLLiBZLiBTcmluaXZhc2FuIiA8a3lz
QG1pY3Jvc29mdC5jb20+Cj4gQ2M6IEhhaXlhbmcgWmhhbmcgPGhhaXlhbmd6QG1pY3Jvc29mdC5j
b20+Cj4gQ2M6IFN0ZXBoZW4gSGVtbWluZ2VyIDxzdGhlbW1pbkBtaWNyb3NvZnQuY29tPgo+IENj
OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Cj4gQ2M6IFRob21hcyBHbGVpeG5lciA8
dGdseEBsaW51dHJvbml4LmRlPgo+IENjOiBJbmdvIE1vbG5hciA8bWluZ29AcmVkaGF0LmNvbT4K
PiBDYzogQm9yaXNsYXYgUGV0a292IDxicEBhbGllbjguZGU+Cj4gQ2M6IHg4NkBrZXJuZWwub3Jn
Cj4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBDYzogUGFvbG8gQm9uemlu
aSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KPiBDYzogRGF2ZSBIYW5zZW4gPGRhdmUuaGFuc2VuQGxp
bnV4LmludGVsLmNvbT4KPiBDYzogQW5keSBMdXRvbWlyc2tpIDxsdXRvQGtlcm5lbC5vcmc+Cj4g
Q2M6IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KPiBDYzogQm9yaXMgT3N0
cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KPiBDYzogbGludXgtaHlwZXJ2QHZn
ZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gQ2M6IHZp
cnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCj4gQ2M6IGt2bUB2Z2VyLmtl
cm5lbC5vcmcKPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gU2lnbmVkLW9m
Zi1ieTogTmFkYXYgQW1pdCA8bmFtaXRAdm13YXJlLmNvbT4KPiAtLS0KPiAgIGFyY2gveDg2L2h5
cGVydi9tbXUuYyAgICAgICAgICAgICAgICAgfCAxMCArKystLS0KPiAgIGFyY2gveDg2L2luY2x1
ZGUvYXNtL3BhcmF2aXJ0LmggICAgICAgfCAgNiArKy0tCj4gICBhcmNoL3g4Ni9pbmNsdWRlL2Fz
bS9wYXJhdmlydF90eXBlcy5oIHwgIDQgKy0tCj4gICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS90bGJm
bHVzaC5oICAgICAgIHwgIDggKystLS0KPiAgIGFyY2gveDg2L2luY2x1ZGUvYXNtL3RyYWNlL2h5
cGVydi5oICAgfCAgMiArLQo+ICAgYXJjaC94ODYva2VybmVsL2t2bS5jICAgICAgICAgICAgICAg
ICB8IDExICsrKysrLS0KPiAgIGFyY2gveDg2L2tlcm5lbC9wYXJhdmlydC5jICAgICAgICAgICAg
fCAgMiArLQo+ICAgYXJjaC94ODYvbW0vdGxiLmMgICAgICAgICAgICAgICAgICAgICB8IDQ3ICsr
KysrKysrKysrKysrKysrKy0tLS0tLS0tLQo+ICAgYXJjaC94ODYveGVuL21tdV9wdi5jICAgICAg
ICAgICAgICAgICB8IDExICsrKy0tLS0KPiAgIGluY2x1ZGUvdHJhY2UvZXZlbnRzL3hlbi5oICAg
ICAgICAgICAgfCAgMiArLQo+ICAgMTAgZmlsZXMgY2hhbmdlZCwgNjIgaW5zZXJ0aW9ucygrKSwg
NDEgZGVsZXRpb25zKC0pCgpYZW4gYW5kIHBhcmF2aXJ0IHBhcnRzOiBSZXZpZXdlZC1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
