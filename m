Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EECD146D07
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 16:35:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iueSt-0000Pw-Cw; Thu, 23 Jan 2020 15:32:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iueSr-0000Ph-Cc
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 15:32:13 +0000
X-Inumbo-ID: 8678e952-3df5-11ea-be65-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8678e952-3df5-11ea-be65-12813bfff9fa;
 Thu, 23 Jan 2020 15:32:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DA23EAF8A;
 Thu, 23 Jan 2020 15:32:10 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>
References: <20200123140305.21050-1-pdurrant@amazon.com>
 <20200123140305.21050-4-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4dde36de-ae8e-9fae-a84e-c5882ad396d0@suse.com>
Date: Thu, 23 Jan 2020 16:32:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200123140305.21050-4-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/3] x86 / vmx: use a 'normal' domheap
 page for APIC_DEFAULT_PHYS_BASE
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDEuMjAyMCAxNTowMywgUGF1bCBEdXJyYW50IHdyb3RlOgo+IHZteF9hbGxvY192bGFw
aWNfbWFwcGluZygpIGN1cnJlbnRseSBjb250YWlucyBzb21lIHZlcnkgb2RkIGxvb2tpbmcgY29k
ZQo+IHRoYXQgYWxsb2NhdGVzIGEgTUVNRl9ub19vd25lciBkb21oZWFwIHBhZ2UgYW5kIHRoZW4g
c2hhcmVzIHdpdGggdGhlIGd1ZXN0Cj4gYXMgaWYgaXQgd2VyZSBhIHhlbmhlYXAgcGFnZS4gVGhp
cyB0aGVuIHJlcXVpcmVzIHZteF9mcmVlX3ZsYXBpY19tYXBwaW5nKCkKPiB0byBjYWxsIGEgc3Bl
Y2lhbCBmdW5jdGlvbiBpbiB0aGUgbW0gY29kZTogZnJlZV9zaGFyZWRfZG9taGVhcF9wYWdlKCku
Cj4gCj4gQnkgdXNpbmcgYSAnbm9ybWFsJyBkb21oZWFwIHBhZ2UgKGkuZS4gYnkgbm90IHBhc3Np
bmcgTUVNRl9ub19vd25lciB0bwo+IGFsbG9jX2RvbWhlYXBfcGFnZSgpKSwgdGhlIG9kZCBsb29r
aW5nIGNvZGUgaW4gdm14X2FsbG9jX3ZsYXBpY19tYXBwaW5nKCkKPiBjYW4gc2ltcGx5IHVzZSBn
ZXRfcGFnZV9hbmRfdHlwZSgpIHRvIHNldCB1cCBhIHdyaXRhYmxlIG1hcHBpbmcgYmVmb3JlCj4g
aW5zZXJ0aW9uIGluIHRoZSBQMk0gYW5kIHZteF9mcmVlX3ZsYXBpY19tYXBwaW5nKCkgY2FuIHNp
bXBseSByZWxlYXNlIHRoZQo+IHBhZ2UgdXNpbmcgcHV0X3BhZ2VfYWxsb2NfcmVmKCkgZm9sbG93
ZWQgYnkgcHV0X3BhZ2VfYW5kX3R5cGUoKS4gVGhpcwo+IHRoZW4gYWxsb3dzIGZyZWVfc2hhcmVk
X2RvbWhlYXBfcGFnZSgpIHRvIGJlIHB1cmdlZC4KPiAKPiBUaGVyZSBpcywgaG93ZXZlciwgc29t
ZSBmYWxsLW91dCBmcm9tIHRoaXMgc2ltcGxpZmljYXRpb246Cj4gCj4gLSBhbGxvY19kb21oZWFw
X3BhZ2UoKSB3aWxsIG5vdyBjYWxsIGFzc2lnbl9wYWdlcygpIGFuZCBydW4gaW50byB0aGUgZmFj
dAo+ICAgdGhhdCAnbWF4X3BhZ2VzJyBpcyBub3Qgc2V0IHVudGlsIHNvbWUgdGltZSBhZnRlciBk
b21haW5fY3JlYXRlKCkuIFRvCj4gICBhdm9pZCBhbiBhbGxvY2F0aW9uIGZhaWx1cmUsIGRvbWFp
bl9jcmVhdGUoKSBpcyBtb2RpZmllZCB0byBzZXQKPiAgIG1heF9wYWdlcyB0byBhbiBpbml0aWFs
IHZhbHVlLCBzdWZmaWNpZW50IHRvIGNvdmVyIGFueSBkb21oZWFwCj4gICBhbGxvY2F0aW9ucyBy
ZXF1aXJlZCB0byBjb21wbGV0ZSBkb21haW4gY3JlYXRpb24uIFRoZSB2YWx1ZSB3aWxsIGJlCj4g
ICBzZXQgdG8gdGhlICdyZWFsJyBtYXhfcGFnZXMgd2hlbiB0aGUgdG9vbC1zdGFjayBsYXRlciBw
ZXJmb3JtcyB0aGUKPiAgIFhFTl9ET01DVExfbWF4X21lbSBvcGVyYXRpb24sIHRodXMgYWxsb3dp
bmcgdGhlIHJlc3Qgb2YgdGhlIGRvbWFpbidzCj4gICBtZW1vcnkgdG8gYmUgYWxsb2NhdGVkLgoK
SSBjb250aW51ZSB0byBkaXNhZ3JlZSB3aXRoIHRoaXMgYXBwcm9hY2gsIGFuZCBJIGRvbid0IHRo
aW5rIEkndmUKaGVhcmQgYmFjayBvbiB0aGUgYWx0ZXJuYXRpdmUgc3VnZ2VzdGlvbiBvZiB1c2lu
ZyBNRU1GX25vX3JlZmNvdW50Cmluc3RlYWQgb2YgTUVNRl9ub19vd25lci4gQXMgc2FpZCBiZWZv
cmUsIHRoZSBwYWdlIChhbmQgYW55IG90aGVyCm9uZXMgdXAgdG8gRE9NQUlOX0lOSVRfUEFHRVMs
IHdoaWNoIEkgZmluZCByYXRoZXIgZnJhZ2lsZSB0byBiZQpzZXQgdG8gMSkgd2lsbCBub3cgZ2V0
IGFjY291bnRlZCBhZ2FpbnN0IHRoZSBhbW91bnQgYWxsb3dlZCBmb3IKdGhlIGRvbWFpbiB0byBh
bGxvY2F0ZS4KCkl0IGFsc28gbG9va3MgdG8gbWUgYXMgaWYgdGhpcyB3aWxsIGJyZWFrIGUuZy4K
cDJtX3BvZF9zZXRfbWVtX3RhcmdldCgpLCB3aGljaCBhdCB0aGUgdmVyeSB0b3AgaGFzCgogICAg
LyogUCA9PSBCOiBOb3RoaW5nIHRvIGRvICh1bmxlc3MgdGhlIGd1ZXN0IGlzIGJlaW5nIGNyZWF0
ZWQpLiAqLwogICAgcG9wdWxhdGVkID0gZC0+dG90X3BhZ2VzIC0gcDJtLT5wb2QuY291bnQ7CiAg
ICBpZiAoIHBvcHVsYXRlZCA+IDAgJiYgcDJtLT5wb2QuZW50cnlfY291bnQgPT0gMCApCiAgICAg
ICAgZ290byBvdXQ7CgpUaGlzIGNvZGUgYXNzdW1lcyB0aGF0IGR1cmluZyBkb21haW4gY3JlYXRp
b24gYWxsIHBhZ2VzIHJlY29yZGVkCmluIC0+dG90X3BhZ2VzIGhhdmUgYWxzbyBiZWVuIHJlY29y
ZGVkIGluIC0+cG9kLmNvdW50LgoKVGhlcmUgbWF5IGJlIG90aGVyIHVzZXMgb2YgLT50b3RfcGFn
ZXMgd2hpY2ggdGhpcyBjaGFuZ2UgY29uZmxpY3RzCndpdGguCgo+IC0gQmVjYXVzZSB0aGUgZG9t
aGVhcCBwYWdlIGlzIG5vIGxvbmdlciBhIHBzZXVkby14ZW5oZWFwIHBhZ2UsIHRoZQo+ICAgcmVm
ZXJlbmNlIGNvdW50aW5nIHdpbGwgcHJldmVudCB0aGUgZG9tYWluIGZyb20gYmVpbmcgZGVzdHJv
eWVkLiBUaHVzCj4gICB0aGUgY2FsbCB0byB2bXhfZnJlZV92bGFwaWNfbWFwcGluZygpIGlzIG1v
dmVkIGZyb20gdGhlCj4gICBkb21haW5fZGVzdHJveSgpIG1ldGhvZCBpbnRvIHRoZSBkb21haW5f
cmVsaW5xdWlzaF9yZXNvdXJjZXMoKSBtZXRob2QuCj4gICBXaGlsc3QgaW4gdGhlIGFyZWEsIG1h
a2UgdGhlIGRvbWFpbl9kZXN0cm95KCkgbWV0aG9kIGFuIG9wdGlvbmFsCj4gICBhbHRlcm5hdGl2
ZV92Y2FsbCgpIChzaW5jZSBpdCB3aWxsIG5vIGxvbmdlciBwZWZvcm0gYW55IGZ1bmN0aW9uIGlu
IFZNWAo+ICAgYW5kIGlzIHN0dWJiZWQgaW4gU1ZNIGFueXdheSkuCgpBbGwgb2YgdGhpcyB3b3Vs
ZCwgYWZhaWN0LCBiZWNvbWUgaXJyZWxldmFudCB3aGVuIHVzaW5nIE1FTUZfbm9fcmVmY291bnQu
CgpUaGVyZSBsb29rcyB0byBiZSBvbmUgaXNzdWUgKHdoaWNoIEkgdGhpbmsgd2UgaGF2ZSBiZWVu
IGRpc2N1c3NpbmcKYmVmb3JlKTogQnkgbm90IGJ1bXBpbmcgLT50b3RfcGFnZXMsIGl0cyBkZWNy
ZW1lbnRpbmcgdXBvbiBmcmVlaW5nCnRoZSBwYWdlIHdpbGwgYmUgYSBwcm9ibGVtLiBJIGNhbiBz
ZWUgdHdvIHBvc3NpYmxlIHNvbHV0aW9ucyB0byB0aGlzOgotIEludHJvZHVjZSBhIGZsYWcgaW5k
aWNhdGluZyB0aGVyZSBzaG91bGQgYWxzbyBiZSBubyBhY2NvdW50aW5nCiAgdXBvbiBmcmVlaW5n
IG9mIHRoZSBwYWdlLgotIEluc3RlYWQgb2YgYXZvaWRpbmcgdG8gaW5jcmVtZW50IC0+dG90X3Bh
Z2VzLCBfYWxzb18gaW5jcmVtZW50CiAgLT5tYXhfcGFnZXMuIFRoZSBpbnRlcmFjdGlvbiB3aXRo
IFhFTl9ET01DVExfbWF4X21lbSB3aWxsIHRoZW4gb2YKICBjb3Vyc2UgYmUsIHdlbGwsIGludGVy
ZXN0aW5nLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
